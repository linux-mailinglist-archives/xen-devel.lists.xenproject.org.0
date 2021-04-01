Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDAD35108E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104132.198798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsKV-0001gL-Jl; Thu, 01 Apr 2021 08:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104132.198798; Thu, 01 Apr 2021 08:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsKV-0001g0-G1; Thu, 01 Apr 2021 08:05:27 +0000
Received: by outflank-mailman (input) for mailman id 104132;
 Thu, 01 Apr 2021 08:05:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsKU-0001fu-4l
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:05:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cef6a366-a162-45c2-8f87-fee1d92a60c0;
 Thu, 01 Apr 2021 08:05:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5EC53AD6D;
 Thu,  1 Apr 2021 08:05:24 +0000 (UTC)
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
X-Inumbo-ID: cef6a366-a162-45c2-8f87-fee1d92a60c0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617264324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VqrCyBIF8QFz2KGAE0AiTc4J1eYaPJ7bzhliUAFzRms=;
	b=PBhTZPGW1iG5KOP1Mjy/xCpSbtoJovXsgHbmssSYzjSbS7sOrZVI5ZtAAVX/LaPUXUo9Zo
	UHc7aIDkr3ZqhZVmAGbv+22O2l8cFkwuYpJ7yrE7n8FG4gtORwgMYLTmdbQMUfFwZv1/sx
	gVaYrsOV6MqEZvKrrdY3nvBi1y97s34=
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH=5d_x86emul=3a_de-duplicate_scatter?=
 =?UTF-8?Q?s_to_the_same_linear_address?=
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6064996d-943f-1be3-9bfd-e872149da2a1@suse.com>
 <fcf7e123-3cdd-fd4d-6c58-36facb26a68e@citrix.com>
 <2e559806-5bc0-0f61-8e23-95e0dba34c41@suse.com>
 <ca22a3b6-8194-7880-8e84-e709ee20bcf3@suse.com>
Message-ID: <6f200e53-02fc-c540-3b23-46f8f4b3385e@suse.com>
Date: Thu, 1 Apr 2021 10:05:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <ca22a3b6-8194-7880-8e84-e709ee20bcf3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.02.2021 09:32, Jan Beulich wrote:
> On 05.02.2021 12:28, Jan Beulich wrote:
>> On 05.02.2021 11:41, Andrew Cooper wrote:
>>> On 10/11/2020 13:26, Jan Beulich wrote:
>>>> The SDM specifically allows for earlier writes to fully overlapping
>>>> ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
>>>> would crash it if varying data was written to the same address. Detect
>>>> overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
>>>> be quite a bit more difficult.
>>>
>>> Are you saying that there is currently a bug if a guest does encode such
>>> an instruction, and we emulate it?
>>
>> That is my take on it, yes.
>>
>>>> Note that due to cache slot use being linear address based, there's no
>>>> similar issue with multiple writes to the same physical address (mapped
>>>> through different linear addresses).
>>>>
>>>> Since this requires an adjustment to the EVEX Disp8 scaling test,
>>>> correct a comment there at the same time.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> TBD: The SDM isn't entirely unambiguous about the faulting behavior in
>>>>      this case: If a fault would need delivering on the earlier slot
>>>>      despite the write getting squashed, we'd have to call ops->write()
>>>>      with size set to zero for the earlier write(s). However,
>>>>      hvm/emulate.c's handling of zero-byte accesses extends only to the
>>>>      virtual-to-linear address conversions (and raising of involved
>>>>      faults), so in order to also observe #PF changes to that logic
>>>>      would then also be needed. Can we live with a possible misbehavior
>>>>      here?
>>>
>>> Do you have a chapter/section reference?
>>
>> The instruction pages. They say in particular
>>
>> "If two or more destination indices completely overlap, the “earlier”
>>  write(s) may be skipped."
>>
>> and
>>
>> "Faults are delivered in a right-to-left manner. That is, if a fault
>>  is triggered by an element and delivered ..."
>>
>> To me this may or may not mean the skipping of indices includes the
>> skipping of faults (which a later element then would raise anyway).
> 
> Does the above address your concerns / questions? If not, what else
> do I need to provide?

I have to admit that I find it quite disappointing that this bug fix
has missed 4.15. It doesn't feel well here even more than elsewhere,
but again I'm intending to commit this - if need be without any acks -
once the tree is fully open again. As a bug fix it'll want backporting
as well.

Jan

