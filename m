Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDFD2DE024
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 09:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56402.98764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqBad-0003V0-Im; Fri, 18 Dec 2020 08:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56402.98764; Fri, 18 Dec 2020 08:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqBad-0003Ub-Fc; Fri, 18 Dec 2020 08:58:19 +0000
Received: by outflank-mailman (input) for mailman id 56402;
 Fri, 18 Dec 2020 08:58:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ets7=FW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kqBac-0003UT-0E
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 08:58:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0965b98-6284-4148-b28f-377d62f3cc09;
 Fri, 18 Dec 2020 08:58:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B15EABC6;
 Fri, 18 Dec 2020 08:58:16 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b0965b98-6284-4148-b28f-377d62f3cc09
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608281896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QAQT/jCmN9xZbygsrd1PYs/7sn2pozeTI35cJr9SqsU=;
	b=SxOzh0zPvkzCUtvUYrS6XLupqzYDmXEu5YQzLq1iWtnQUkS7zne67D1IV5PR75Wf/Nr0zI
	KZGspNg92AIr9RYtrqx0KiJF7ApNYUrFAcjMNyZcBHy/9F5SjPsAkGbaTUXGR9vAWt+V9F
	d7TFO51vP9PGlYekCSaUUj1/Ze1qXKQ=
Subject: Re: [PATCH 3/6] x86/p2m: set_{foreign,mmio}_p2m_entry() are HVM-only
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <15f41816-4814-bae5-e0bc-89e99d04a142@suse.com>
 <fc78c235-f806-6120-25f0-182b4c08bdaa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6833bac9-17a8-dc6e-42d7-100749bad707@suse.com>
Date: Fri, 18 Dec 2020 09:58:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fc78c235-f806-6120-25f0-182b4c08bdaa@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.12.2020 20:54, Andrew Cooper wrote:
> On 15/12/2020 16:26, Jan Beulich wrote:
>> Extend a respective #ifdef from inside set_typed_p2m_entry() to around
>> all three functions. Add ASSERT_UNREACHABLE() to the latter one's safety
>> check path.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> As the code currently stands, yes.  However, I'm not sure I agree
> conceptually.
> 
> The p2m APIs are either a common interface to use, or HVM-specific.
> 
> PV guests don't actually have a p2m, but some of the APIs are used from
> common code (e.g. copy_to/from_guest()), and some p2m concepts are
> special cased as identity for PV (technically paging_mode_translate()),
> while other concepts, such as foreign/mmio, which do exist for both PV
> and HVM guests, are handled with totally different API sets for PV and HVM.
> 
> This is a broken mess of an abstraction.  I suspect some of it has to do
> with PV autotranslate mode in the past, but that doesn't alter the fact
> that we have a totally undocumented and error prone set of APIs here.
> 
> Either P2M's should (fully) be the common abstraction (despite not being
> a real object for PV guests), or they should should be a different set
> of APIs which is the common abstraction, and P2Ms should move being
> exclusively for HVM guests.
> 
> (It's also very obvious by all the CONFIG_X86 ifdefary that we've got
> arch specifics in our common code, and that is another aspect of the API
> mess which needs handling.)
> 
> I'm honestly not sure which of these would be better, but I'm fairly
> sure that either would be better than what we've currently got.  I
> certainly think it would be better to have a plan for improvement, to
> guide patches like this.

Well, by the end of this series fairly large parts of p2m.c are inside
#ifdef CONFIG_HVM. I would have thought the route is clear - eventually
p2m.c should get built only when HVM is enabled. This change is simply
getting us one tiny step closer.

Otoh, when considering common code, hiding PV specifics inside the p2m
functions may turn out better, as else we may need another layer around
them (like effectively we already have with e.g.
guest_physmap_{add,remove}_page(), which I think would need to move out
of p2m.c if that was to become HVM-only as a whole) ...

Jan

