Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059592D0BA1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 09:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45944.81498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmBjv-0007js-VT; Mon, 07 Dec 2020 08:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45944.81498; Mon, 07 Dec 2020 08:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmBjv-0007jT-S9; Mon, 07 Dec 2020 08:19:23 +0000
Received: by outflank-mailman (input) for mailman id 45944;
 Mon, 07 Dec 2020 08:19:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmBju-0007jO-8d
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 08:19:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be6ed0e2-1872-4d5b-8328-d42a78ee3889;
 Mon, 07 Dec 2020 08:19:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16AD2AC90;
 Mon,  7 Dec 2020 08:19:17 +0000 (UTC)
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
X-Inumbo-ID: be6ed0e2-1872-4d5b-8328-d42a78ee3889
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607329157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMkmq+g/A3EBOnLccszRtxejoRb5qd6/17yIFQ9MaKM=;
	b=bfdRrQK+Fm0Xhc+bApwgaiBWEUZ8sSRVW/x3R2bpurD3Ylz50bu01A0zb/QOKVMKYJWt4I
	ulbUEa1E3vGY53PofUGLkks9Q8wT4qeWxh75Lb+7Qk9A0qTfOFqkTVaYfD5qaxOc1AA6lD
	Nv0dpweDIndNaEhAgqinitpMYJo2dX4=
Subject: Re: [PATCH] vpci/msix: exit early if MSI-X is disabled
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Manuel Bouyer <bouyer@antioche.eu.org>, xen-devel@lists.xenproject.org
References: <20201201174014.27878-1-roger.pau@citrix.com>
 <dfc96aa9-c39f-177c-c8f8-af18b80804de@suse.com>
 <cdb2a1ae-9ee7-6661-b69f-d2faacef2c12@suse.com>
 <20201206111548.nzefo2fx6bvspuj5@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72ff2db0-cf18-a122-bf6d-ae792887c5f7@suse.com>
Date: Mon, 7 Dec 2020 09:19:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201206111548.nzefo2fx6bvspuj5@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06.12.2020 12:15, Roger Pau Monné wrote:
> On Thu, Dec 03, 2020 at 02:40:28PM +0100, Jan Beulich wrote:
>> On 02.12.2020 09:38, Jan Beulich wrote:
>>> On 01.12.2020 18:40, Roger Pau Monne wrote:
>>>> --- a/xen/drivers/vpci/msix.c
>>>> +++ b/xen/drivers/vpci/msix.c
>>>> @@ -357,7 +357,11 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
>>>>           * so that it picks the new state.
>>>>           */
>>>>          entry->masked = new_masked;
>>>> -        if ( !new_masked && msix->enabled && !msix->masked && entry->updated )
>>>> +
>>>> +        if ( !msix->enabled )
>>>> +            break;
>>>> +
>>>> +        if ( !new_masked && !msix->masked && entry->updated )
>>>>          {
>>>>              /*
>>>>               * If MSI-X is enabled, the function mask is not active, the entry
>>>
>>> What about a "disabled" -> "enabled-but-masked" transition? This,
>>> afaict, similarly won't trigger setting up of entries from
>>> control_write(), and hence I'd expect the ASSERT() to similarly
>>> trigger when subsequently an entry's mask bit gets altered.
> 
> This would only happen if the user hasn't written to the entry address
> or data fields since initialization, or else the update field would be
> set and then when clearing the entry mask bit in
> PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET the entry will be properly setup.

Right, but where's the difference to writes here happening when
!msix->enabled? All I'm saying is that all possible cases leading
to the "else" of this "if" need to be equally considered. Hence
my alternative patch.

>>> I'd also be fine making this further adjustment, if you agree,
>>> but the one thing I haven't been able to fully convince myself of
>>> is that there's then still no need to set ->updated to true.
>>
>> I've taken another look. I think setting ->updated (or something
>> equivalent) is needed in that case, in order to not lose the
>> setting of the entry mask bit. However, this would only defer the
>> problem to control_write(): This would now need to call
>> vpci_msix_arch_mask_entry() under suitable conditions, but avoid
>> calling it when the entry is disabled or was never set up.
> 
> If the entry is masked control_write won't call update_entry, leaving
> the entry updated bit as-is, thus deferring the call to update_entry
> to further updates in PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET. I think this
> is all fine.

It is under the assumption that msix_write() behaves correctly.
What I was saying is that there might appear to be a need to
set ->updated in msix_write() (to make sure the mask bit change
won't get lost), at which point the logic in control_write()
would need adjustment. Which I find undesirable.

>> No
>> matter whether making the setting of ->updated conditional, or
>> adding a conditional call in update_entry(), we'd need to
>> evaluate whether the entry is currently disabled. Imo, instead of
>> introducing a new arch hook for this, it's easier to make
>> vpci_msix_arch_mask_entry() tolerate getting called on a disabled
>> entry. Below my proposed alternative change.
> 
> I think just setting the updated bit for all entries at initialization
> would solve this, as this would then force a call to update_entry when
> and entry us unmasked (by writes to PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET).

I don't see this being a solution - we'd still end up calling
vpci_msix_arch_mask_entry() when !msix->enabled or msix->masked.

> In any case the assert in vpci_msix_arch_mask_entry is a logic check,
> IIRC calling it with an invalid pirq will just result in the function
> being a no op as domain_spin_lock_irq_desc will return NULL.

Ah yes, pirq_info() would return NULL here. Am I reading this as a
suggestion to simply drop the ASSERT(), instead of replacing it by
an if()? It would feel slightly more robust to me to keep the if().

>> While writing the description I started wondering why we require
>> address or data fields to have got written before the first
>> unmask. I don't think the hardware imposes such a requirement;
>> zeros would be used instead, whatever this means. Let's not
>> forget that it's only the primary purpose of MSI/MSI-X to
>> trigger interrupts. Forcing the writes to go elsewhere in
>> memory is not forbidden from all I know, and could be used by a
>> driver. IOW I think ->updated should start out as set to true.
>> But of course vpci_msi_update() then would need to check the
>> upper address bits and avoid setting up an interrupt if they're
>> not 0xfee. And further arrangements would be needed to have the
>> guest requested write actually get carried out correctly.
> 
> Seems correct, albeit adding such logic seems to complicate the code
> and expand the attack surface. IMO I wouldn't implement this unless we
> know there's a real use case for this.

I wasn't meaning to suggest we implement any of this without need.
I was, however, thinking we ought to at least check the high 12
address bits, and avoid trying to interpret the low 20 ones if
they don't match. Let me add a patch to this effect to the small
series that I've already accumulated anyway.

Jan

