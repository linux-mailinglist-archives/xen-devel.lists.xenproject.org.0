Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8786356655
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 10:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106484.203630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3PX-0005N1-Uy; Wed, 07 Apr 2021 08:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106484.203630; Wed, 07 Apr 2021 08:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3PX-0005Me-Rd; Wed, 07 Apr 2021 08:19:39 +0000
Received: by outflank-mailman (input) for mailman id 106484;
 Wed, 07 Apr 2021 08:19:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU3PW-0005MZ-J0
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 08:19:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19b89150-bb8e-4802-94e8-de7a37539cbc;
 Wed, 07 Apr 2021 08:19:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C658AF5B;
 Wed,  7 Apr 2021 08:19:36 +0000 (UTC)
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
X-Inumbo-ID: 19b89150-bb8e-4802-94e8-de7a37539cbc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617783576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DOmN8NRGNgnN84zJwiel2ZFk/Vce38vq7LYdud60cw=;
	b=ofVq58Rii71EjpZndDxnI2QvBMI4cP3S+/g8aEw6WpodQBMtCnoEknFd6sHnq4Y2/kOMl3
	wRalET3NoS/wxoisfh0Vv3BHTUWM9tCeT/gyfKqx4MVXGOCP3yjk2NuxTBgBaqkiklZV/f
	F7WElaH8sWHFz1PkeAHFHP4KLBeQXeg=
Subject: Re: [PATCH v3 01/11] x86/hvm: drop vcpu parameter from vlapic EOI
 callbacks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Paul Durrant <pdurrant@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-2-roger.pau@citrix.com>
 <008d8d8c-f932-c3f3-e06d-99aa6721a59f@suse.com>
 <YG1iD7ogQc5bgA+T@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2639b65c-a3a8-2a43-8db5-495d4c399376@suse.com>
Date: Wed, 7 Apr 2021 10:19:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG1iD7ogQc5bgA+T@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.04.2021 09:41, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 01:06:35PM +0200, Jan Beulich wrote:
>> On 31.03.2021 12:32, Roger Pau Monne wrote:
>>> EOIs are always executed in guest vCPU context, so there's no reason to
>>> pass a vCPU parameter around as can be fetched from current.
>>
>> While not overly problematic, I'd like to point out that there's not a
>> single vcpu parameter being dropped here - in both cases it's struct
>> domain *.
>>
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
>> The Viridian path pointed out before was only an example. I'm afraid
>> the call from vlapic_has_pending_irq() to vlapic_EOI_set() is also
>> far from obvious that it always has "v == current". What we end up
>> with here is a mix of passed in value (vlapic) and assumption of the
>> call being for the vCPU / domain we're running on. At the very least
>> I think this would want documenting here in some way (maybe ASSERT(),
>> definitely mentioning in the description), but even better would
>> perhaps be if the parameter of the function here as well as further
>> ones involved would also be dropped then.
> 
> I've kind of attempted to purge the vlapic parameter further, but the
> proper way to do it would be to audit all vlapic functions.
> 
> For example I've removed the parameter from vlapic_EOI_set and
> vlapic_handle_EOI, but I'm afraid that would also raise questions
> about purging it vlapic_has_pending_irq for example.
> 
> Let me know if the patch below would be acceptable, or if I should
> rather not make the EOI callbacks depends on this cleanup, as I could
> certainly do the cleanup later.

While I'm not opposed in principle, the patch moves us further away
from what Andrew has asked for (to retain the vcpu pointers), if I
understood him correctly. I'm also not entirely certain if there
couldn't be, down the road, emulators needing to signal an EOI to
Xen on behalf of a guest.

Jan

