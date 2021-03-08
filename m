Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6248330A64
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 10:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94729.178338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCNE-0004GQ-MO; Mon, 08 Mar 2021 09:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94729.178338; Mon, 08 Mar 2021 09:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCNE-0004G0-ID; Mon, 08 Mar 2021 09:40:24 +0000
Received: by outflank-mailman (input) for mailman id 94729;
 Mon, 08 Mar 2021 09:40:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJCND-0004Fo-K2
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:40:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9434ce2-3aee-4e5c-89cd-e0f6fdc0375c;
 Mon, 08 Mar 2021 09:40:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3298AC0C;
 Mon,  8 Mar 2021 09:40:21 +0000 (UTC)
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
X-Inumbo-ID: f9434ce2-3aee-4e5c-89cd-e0f6fdc0375c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615196422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbd8nnky1ZIeC2D3DGjHdwn8gQd4sUOAGX5EdLGcDOU=;
	b=Rk9d9zQ2/0YbjkerQgin9cwIGg7Glw9tk5U85qt2ZeFx7gs1VWI0doBY7XCgE1CPEbkAvr
	lnXvBqgvrnVSpy7Bp19CGknrpbXka+y/2JjIkLDjMDjxqXQ5cqYr5TC2Bs90ngBFr24JqK
	K5ghdJw2+0p02px5Y43B0OTKnoYd2nE=
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
 <YEXtnkYzNSXasTw1@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1cfddc2f-4d89-0eea-0ce1-68978914c821@suse.com>
Date: Mon, 8 Mar 2021 10:40:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEXtnkYzNSXasTw1@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 10:25, Tim Deegan wrote:
> At 16:37 +0100 on 05 Mar (1614962224), Jan Beulich wrote:
>> We can't make correctness of our own behavior dependent upon a
>> hypervisor underneath us correctly telling us the true physical address
>> with hardware uses. Without knowing this, we can't be certain reserved
>> bit faults can actually be observed. Therefore, besides evaluating the
>> number of address bits when deciding whether to use the optimization,
>> also check whether we're running virtualized ourselves.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Tim Deegan <tim@xen.org>

Thanks.

> I would consider this to be a bug in the underlying hypervisor, but I
> agree than in practice it won't be safe to rely on it being correct.

Suffice it to say that I don't think we present a correct value to
our guests. Plus, as said elsewhere, what would you suggest to hand
to the guest in case it may need migrating (to a host with a
different number of PA bits)?

> These checks are getting fiddly now.  I think that if we end up adding
> any more to them it might be good to set a read-mostly variable at boot
> time rather than do them on every MMIO/NP fault.

Maybe, but I'd like to point out that the fault path uses only the
sh_l1e_is_*() functions (plus sh_l1e_mmio_get_gfn()), and hence
isn't affected by the added fiddly-ness.

Jan

