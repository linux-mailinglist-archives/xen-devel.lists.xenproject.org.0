Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516E38256D
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 09:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128093.240550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liXkn-00013c-Av; Mon, 17 May 2021 07:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128093.240550; Mon, 17 May 2021 07:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liXkn-00011k-7r; Mon, 17 May 2021 07:33:29 +0000
Received: by outflank-mailman (input) for mailman id 128093;
 Mon, 17 May 2021 07:33:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liXkl-00011e-LS
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 07:33:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfab9a4d-a304-4965-8c03-bf02bdc275a1;
 Mon, 17 May 2021 07:33:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E385AEC5;
 Mon, 17 May 2021 07:33:25 +0000 (UTC)
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
X-Inumbo-ID: cfab9a4d-a304-4965-8c03-bf02bdc275a1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621236805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24Z/UW0NpvL4JqusYZlmgtoTjXyjdYgR/Gpy6zpGA+o=;
	b=vSsm2BzQPq4+Xaq1c2uTlCwIZM8THIWuVZOTH3YTcnKBRwjwui7CP4Xx8t9+66YSi0VPYy
	p2ZamSZzoTshLGX2KHLgmOWQyGGiM5rJMxPFCfkVO3Qxp89QMwk2dHWvwIWufqWZyTdP3n
	saTJFtZ/qigFA2ZqrZRvVafsMEmGj5I=
Subject: Re: [PATCH v3 03/22] x86/xstate: re-size save area when CPUID policy
 changes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <8ba8f016-0aed-277b-bbea-80022d057791@suse.com>
 <5a954be8-e213-36d8-27da-4c51243dc280@citrix.com>
 <f515fdfb-d1a6-56d8-5db3-ebddeed23806@suse.com>
 <f16afc8a-ccd4-7e5e-e08d-d96597c6e8ab@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa5a5495-d0e9-4951-f2ed-c87121b1dfe8@suse.com>
Date: Mon, 17 May 2021 09:33:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f16afc8a-ccd4-7e5e-e08d-d96597c6e8ab@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.05.2021 18:41, Andrew Cooper wrote:
> On 03/05/2021 15:22, Jan Beulich wrote:
>>> Another consequence is that we need to rethink our hypercall behaviour. 
>>> There is no such thing as supervisor states in an uncompressed XSAVE
>>> image, which means we can't continue with that being the ABI.
>> I don't think the hypercall input / output blob needs to follow any
>> specific hardware layout.
> 
> Currently, the blob is { xcr0, xcr0_accum, uncompressed image }.
> 
> As we haven't supported any compressed states yet, we are at liberty to
> create a forward compatible change by logically s/xcr0/xstate/ and
> permitting an uncompressed image.
> 
> Irritatingly, we have xcr0=0 as a permitted state and out in the field,
> for "no xsave state".  This contributes a substantial quantity of
> complexity in our xstate logic, and invalidates the easy fix I had for
> not letting the HVM initpath explode.
> 
> The first task is to untangle the non-architectural xcr0=0 case, and to
> support compressed images.  Size parsing needs to be split into two, as
> for compressed images, we need to consume XSTATE_BV and XCOMP_BV to
> cross-check the size.

Not sure about the need to eliminate the xcr0=0 (or xstates=0) case.
Which isn't to say I'm opposed if you want to do so and it's not
overly intrusive.

> I think we also want a rule that Xen will always send compressed if it
> is using XSAVES (/XSAVEC in the interim?)

If this is sufficiently neutral to tool stack code, why not (albeit
I don't think there needs to be a "rule" - Xen should be free to
provide what it deems best, with consumers in the position to easily
recognize the format; similarly Xen should be consuming whatever it
gets handed, as long as that's valid state). Luckily the layout is
visible just through tool-stack-only interfaces.

>  We do not want to be working
> with uncompressed images at all, now that MPX is a reasonable sized hole
> in the middle.

They're together no larger (128 bytes) than the LWP hole right ahead
of them (at 0x340). I agree avoiding uncompressed format is worthwhile,
but perhaps quite a bit more so for systems with higher components
following unavailable even bigger ones.

Jan

