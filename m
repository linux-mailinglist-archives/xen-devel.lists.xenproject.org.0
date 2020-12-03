Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6F62CD7BF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 14:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43491.78167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoqW-0004Tu-ET; Thu, 03 Dec 2020 13:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43491.78167; Thu, 03 Dec 2020 13:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoqW-0004TV-BC; Thu, 03 Dec 2020 13:40:32 +0000
Received: by outflank-mailman (input) for mailman id 43491;
 Thu, 03 Dec 2020 13:40:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkoqV-0004TO-6a
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 13:40:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dd7175d-1265-41bf-92ef-91d91d17d076;
 Thu, 03 Dec 2020 13:40:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62959AC2E;
 Thu,  3 Dec 2020 13:40:29 +0000 (UTC)
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
X-Inumbo-ID: 1dd7175d-1265-41bf-92ef-91d91d17d076
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607002829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsZeX4m2pj3ShAbO2r0Y+TdBRHcQ1W0Qjt05Su5dPrY=;
	b=SjkdG+I6WBwgReOPkJTseQSwk/sVFejKQOXgIf+qjVqzawGPZCVY+6pbzDeimyS75sNmfP
	E/LpLxIlJw9QTkPk2rvuhEBcqsHst4DoDig0N4Gk74xEXh+8+JTjlAXzMUPkwBuF7fNVcZ
	ZRBpXesevyd5vvXXG6BEn0y2AIHdKxc=
Subject: Re: [PATCH] vpci/msix: exit early if MSI-X is disabled
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Manuel Bouyer <bouyer@antioche.eu.org>, xen-devel@lists.xenproject.org
References: <20201201174014.27878-1-roger.pau@citrix.com>
 <dfc96aa9-c39f-177c-c8f8-af18b80804de@suse.com>
Message-ID: <cdb2a1ae-9ee7-6661-b69f-d2faacef2c12@suse.com>
Date: Thu, 3 Dec 2020 14:40:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <dfc96aa9-c39f-177c-c8f8-af18b80804de@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.12.2020 09:38, Jan Beulich wrote:
> On 01.12.2020 18:40, Roger Pau Monne wrote:
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -357,7 +357,11 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
>>           * so that it picks the new state.
>>           */
>>          entry->masked = new_masked;
>> -        if ( !new_masked && msix->enabled && !msix->masked && entry->updated )
>> +
>> +        if ( !msix->enabled )
>> +            break;
>> +
>> +        if ( !new_masked && !msix->masked && entry->updated )
>>          {
>>              /*
>>               * If MSI-X is enabled, the function mask is not active, the entry
> 
> What about a "disabled" -> "enabled-but-masked" transition? This,
> afaict, similarly won't trigger setting up of entries from
> control_write(), and hence I'd expect the ASSERT() to similarly
> trigger when subsequently an entry's mask bit gets altered.
> 
> I'd also be fine making this further adjustment, if you agree,
> but the one thing I haven't been able to fully convince myself of
> is that there's then still no need to set ->updated to true.

I've taken another look. I think setting ->updated (or something
equivalent) is needed in that case, in order to not lose the
setting of the entry mask bit. However, this would only defer the
problem to control_write(): This would now need to call
vpci_msix_arch_mask_entry() under suitable conditions, but avoid
calling it when the entry is disabled or was never set up. No
matter whether making the setting of ->updated conditional, or
adding a conditional call in update_entry(), we'd need to
evaluate whether the entry is currently disabled. Imo, instead of
introducing a new arch hook for this, it's easier to make
vpci_msix_arch_mask_entry() tolerate getting called on a disabled
entry. Below my proposed alternative change.

While writing the description I started wondering why we require
address or data fields to have got written before the first
unmask. I don't think the hardware imposes such a requirement;
zeros would be used instead, whatever this means. Let's not
forget that it's only the primary purpose of MSI/MSI-X to
trigger interrupts. Forcing the writes to go elsewhere in
memory is not forbidden from all I know, and could be used by a
driver. IOW I think ->updated should start out as set to true.
But of course vpci_msi_update() then would need to check the
upper address bits and avoid setting up an interrupt if they're
not 0xfee. And further arrangements would be needed to have the
guest requested write actually get carried out correctly.

Jan

x86/vPCI: tolerate (un)masking a disabled MSI-X entry

None of the four reasons causing vpci_msix_arch_mask_entry() to get
called (there's just a single call site) are impossible or illegal prior
to an entry actually having got set up:
- the entry may remain masked (in this case, however, a prior masked ->
  unmasked transition would already not have worked),
- MSI-X may not be enabled,
- the global mask bit may be set,
- the entry may not otherwise have been updated.
Hence the function asserting that the entry was previously set up was
simply wrong. Since the caller tracks the masked state (and setting up
of an entry would only be effected when that software bit is clear),
it's okay to skip both masking and unmasking requests in this case.

Fixes: d6281be9d0145 ('vpci/msix: add MSI-X handlers')
Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -840,8 +840,8 @@ void vpci_msi_arch_print(const struct vp
 void vpci_msix_arch_mask_entry(struct vpci_msix_entry *entry,
                                const struct pci_dev *pdev, bool mask)
 {
-    ASSERT(entry->arch.pirq != INVALID_PIRQ);
-    vpci_mask_pirq(pdev->domain, entry->arch.pirq, mask);
+    if ( entry->arch.pirq != INVALID_PIRQ )
+        vpci_mask_pirq(pdev->domain, entry->arch.pirq, mask);
 }
 
 int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,

