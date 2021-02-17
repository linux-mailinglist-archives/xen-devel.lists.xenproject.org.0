Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B1731D69B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 09:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86172.161505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCIGN-0004Wl-1v; Wed, 17 Feb 2021 08:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86172.161505; Wed, 17 Feb 2021 08:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCIGM-0004WM-V7; Wed, 17 Feb 2021 08:32:46 +0000
Received: by outflank-mailman (input) for mailman id 86172;
 Wed, 17 Feb 2021 08:32:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCIGL-0004WF-9t
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 08:32:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3520f3e-9c25-49a3-a2a9-7d6541cc38b4;
 Wed, 17 Feb 2021 08:32:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9768B03B;
 Wed, 17 Feb 2021 08:32:43 +0000 (UTC)
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
X-Inumbo-ID: c3520f3e-9c25-49a3-a2a9-7d6541cc38b4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613550763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1/G31dhI4NC4cwy4l2zlxtzFa6ohofSNDIQI8F53Pw=;
	b=s7GiXzDf+V2G28i/DNoOpz+/fHAFXBTq4LqFcn8GZVBxgwW15yo7T69b/NvTlJq+ictmwF
	0jcFNJ5/cda49mAcpJFFzimyGxrgT87wZwSoUWnqyPrHgZSrWD51HNhoyztFC7+6AarTQF
	XeHaduEo8t2MoawFe7oDQWGxomWtUog=
Subject: Ping: [PATCH] x86emul: de-duplicate scatters to the same linear
 address
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6064996d-943f-1be3-9bfd-e872149da2a1@suse.com>
 <fcf7e123-3cdd-fd4d-6c58-36facb26a68e@citrix.com>
 <2e559806-5bc0-0f61-8e23-95e0dba34c41@suse.com>
Message-ID: <ca22a3b6-8194-7880-8e84-e709ee20bcf3@suse.com>
Date: Wed, 17 Feb 2021 09:32:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2e559806-5bc0-0f61-8e23-95e0dba34c41@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.02.2021 12:28, Jan Beulich wrote:
> On 05.02.2021 11:41, Andrew Cooper wrote:
>> On 10/11/2020 13:26, Jan Beulich wrote:
>>> The SDM specifically allows for earlier writes to fully overlapping
>>> ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
>>> would crash it if varying data was written to the same address. Detect
>>> overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
>>> be quite a bit more difficult.
>>
>> Are you saying that there is currently a bug if a guest does encode such
>> an instruction, and we emulate it?
> 
> That is my take on it, yes.
> 
>>> Note that due to cache slot use being linear address based, there's no
>>> similar issue with multiple writes to the same physical address (mapped
>>> through different linear addresses).
>>>
>>> Since this requires an adjustment to the EVEX Disp8 scaling test,
>>> correct a comment there at the same time.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> TBD: The SDM isn't entirely unambiguous about the faulting behavior in
>>>      this case: If a fault would need delivering on the earlier slot
>>>      despite the write getting squashed, we'd have to call ops->write()
>>>      with size set to zero for the earlier write(s). However,
>>>      hvm/emulate.c's handling of zero-byte accesses extends only to the
>>>      virtual-to-linear address conversions (and raising of involved
>>>      faults), so in order to also observe #PF changes to that logic
>>>      would then also be needed. Can we live with a possible misbehavior
>>>      here?
>>
>> Do you have a chapter/section reference?
> 
> The instruction pages. They say in particular
> 
> "If two or more destination indices completely overlap, the “earlier”
>  write(s) may be skipped."
> 
> and
> 
> "Faults are delivered in a right-to-left manner. That is, if a fault
>  is triggered by an element and delivered ..."
> 
> To me this may or may not mean the skipping of indices includes the
> skipping of faults (which a later element then would raise anyway).

Does the above address your concerns / questions? If not, what else
do I need to provide?

Jan

