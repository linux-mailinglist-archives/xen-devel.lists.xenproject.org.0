Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2197B28CFF3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6246.16634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSL3F-0000ZM-Vv; Tue, 13 Oct 2020 14:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6246.16634; Tue, 13 Oct 2020 14:13:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSL3F-0000Yx-RH; Tue, 13 Oct 2020 14:13:17 +0000
Received: by outflank-mailman (input) for mailman id 6246;
 Tue, 13 Oct 2020 14:13:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSL3F-0000Yr-7M
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:13:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 959adc41-ebac-4197-9f38-5a4bcf5ce679;
 Tue, 13 Oct 2020 14:13:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7F7BAEA8;
 Tue, 13 Oct 2020 14:13:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSL3F-0000Yr-7M
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:13:17 +0000
X-Inumbo-ID: 959adc41-ebac-4197-9f38-5a4bcf5ce679
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 959adc41-ebac-4197-9f38-5a4bcf5ce679;
	Tue, 13 Oct 2020 14:13:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602598395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tblV7D7L2YyjW0I80+ScELDyVWso3QKuyM+f2sR91Cs=;
	b=cdmOA90ZO17SYq42P9HozFgQHHYLYfflq24QI/foKqCNZC4H9HexDhjbkcm8NpRegT+oDI
	ISKmkB6xp292oHMg7oCiNaLwDln3IIPjKxs/hjprjiVLaM/gcczt9bpfCZyYe6rJjAfj28
	9T0B4Cqz/B3AUBDce41dadG1cwWaIH8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E7F7BAEA8;
	Tue, 13 Oct 2020 14:13:14 +0000 (UTC)
Subject: Re: [PATCH v2 01/11] x86/hvm: drop vcpu parameter from vlapic EOI
 callbacks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-2-roger.pau@citrix.com>
 <bafcd30e-f75b-79c8-2424-6a63cb0b96d4@suse.com>
 <20201013140820.GP19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb60119f-912f-3a7f-8c89-637e511dd395@suse.com>
Date: Tue, 13 Oct 2020 16:13:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201013140820.GP19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.10.2020 16:08, Roger Pau Monné wrote:
> On Fri, Oct 02, 2020 at 10:48:07AM +0200, Jan Beulich wrote:
>> On 30.09.2020 12:40, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/vlapic.c
>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>> @@ -459,13 +459,10 @@ void vlapic_EOI_set(struct vlapic *vlapic)
>>>  
>>>  void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
>>>  {
>>> -    struct vcpu *v = vlapic_vcpu(vlapic);
>>> -    struct domain *d = v->domain;
>>> -
>>>      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
>>> -        vioapic_update_EOI(d, vector);
>>> +        vioapic_update_EOI(vector);
>>>  
>>> -    hvm_dpci_msi_eoi(d, vector);
>>> +    hvm_dpci_msi_eoi(vector);
>>>  }
>>
>> What about viridian_synic_wrmsr() -> vlapic_EOI_set() ->
>> vlapic_handle_EOI()? You'd probably have noticed this if you
>> had tried to (consistently) drop the respective parameters from
>> the intermediate functions as well.
>>
>> Question of course is in how far viridian_synic_wrmsr() for
>> HV_X64_MSR_EOI makes much sense when v != current. Paul, Wei?
> 
> There's already an assert at the top of viridian_synic_wrmsr of v ==
> current, which I assume is why I thought this change was fine. I can
> purge the passing of v (current) further, but it wasn't really needed
> for the rest of the series.

To a large degree that's up to you. It's just that, as said, if
you had done so, you'd likely have noticed the issue, and hence
doing so here and elsewhere may provide reassurance that there's
no further similar case lurking anywhere.

>> A secondary question of course is whether passing around the
>> pointers isn't really cheaper than the obtaining of 'current'.
> 
> Well, while there's indeed a performance aspect here, I think
> using current is much clearer than passing a vcpu around. I could
> rename the parameter to curr or some such, but I think using
> current and not passing a vcpu parameter is clearer.

Personally I'd prefer "curr" named function parameters. But if
Andrew or Wei agree with your approach, I'm not going to object.

Jan

