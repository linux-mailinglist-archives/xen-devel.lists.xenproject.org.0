Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B314444BA2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 00:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221176.382749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miPe5-0002Se-Hc; Wed, 03 Nov 2021 23:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221176.382749; Wed, 03 Nov 2021 23:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miPe5-0002Q9-EY; Wed, 03 Nov 2021 23:26:17 +0000
Received: by outflank-mailman (input) for mailman id 221176;
 Wed, 03 Nov 2021 23:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1PY5=PW=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1miPe3-0002Q3-P9
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 23:26:15 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bbf9017-3cfd-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 00:26:07 +0100 (CET)
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
X-Inumbo-ID: 6bbf9017-3cfd-11ec-a9d2-d9f7a1cc8784
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1635981965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UfTyFoXajtV0v9y/BzmoswZaGOzbbSsMzbV3xAEe7f8=;
	b=FG232QjcqbTedwDbie2TZlaxunqVOoH7LkuCfHq9pkVIrcjDea/Jq7f4TE4HKlJKokS5Qd
	mk3z0Zjoj8VI5X34ZomjX1G4/fEJ5mQEwdRTwnQCLLUF5TzjqkDxdWKDQg4/Pp04ati32T
	LReCTHFGzrgNprU+Ps61kW5PcsjY9O9kqlKUTuYJvSbES8zwklYl+no3/15X5qd/rkPEYO
	YU6Z/zGM+AqFTwoVix4R9s9BYpVcZ3bENnaOOfJsMUKxIDFFPjspwNlwWt8EtwxzjQBwG+
	eKdK/dUMdlpAhhqS52T770CdDjTuPGeSoreno/76+rV2A27PHJbpxAurtevwAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1635981965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UfTyFoXajtV0v9y/BzmoswZaGOzbbSsMzbV3xAEe7f8=;
	b=Wi+PWP2tcmH6wdHfleglyGLWoarqN06h513enO1PuRi77n2p1ZX35nkizmwepUsrxjlzHy
	+B+iC4GV3dxfcuBg==
To: Josef Johansson <josef@oderland.se>
Cc: boris.ostrovsky@oracle.com, helgaas@kernel.org, jgross@suse.com,
 linux-pci@vger.kernel.org, maz@kernel.org, xen-devel@lists.xenproject.org,
 Jason Andryuk <jandryuk@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] PCI/MSI: Move non-mask check back into low level accessors
In-Reply-To: <5b3d4653-0cdf-e098-0a4a-3c5c3ae3977b@oderland.se>
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
 <20211025012503.33172-1-jandryuk@gmail.com> <87fssmg8k4.ffs@tglx>
 <87cznqg5k8.ffs@tglx> <d1cc20aa-5c5c-6c7b-2e5d-bc31362ad891@oderland.se>
 <89d6c2f4-4d00-972f-e434-cb1839e78598@oderland.se>
 <5b3d4653-0cdf-e098-0a4a-3c5c3ae3977b@oderland.se>
Date: Thu, 04 Nov 2021 00:26:05 +0100
Message-ID: <87k0ho6ctu.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

Josef!

On Wed, Oct 27 2021 at 17:29, Josef Johansson wrote:
> On 10/27/21 14:01, Josef Johansson wrote:
>> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
>> index 6a5ecee6e567..28d509452958 100644
>> --- a/kernel/irq/msi.c
>> +++ b/kernel/irq/msi.c
>> @@ -529,10 +529,10 @@ static bool msi_check_reservation_mode(struct irq_domain *domain,
>>  
>>  	/*
>>  	 * Checking the first MSI descriptor is sufficient. MSIX supports
>> -	 * masking and MSI does so when the maskbit is set.
>> +	 * masking and MSI does so when the can_mask is set.
>>  	 */
>>  	desc = first_msi_entry(dev);
>> -	return desc->msi_attrib.is_msix || desc->msi_attrib.maskbit;
>> +	return desc->msi_attrib.is_msix || desc->msi_attrib.can_mask;
>>  }
>>  
>>  int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
>>
> Hi Thomas,
>
> With the above added the kernel boots fine and I can even suspend it twice.
> Which is with my laptop, a good sign.
>
> You can add Tested-By: josef@oderland.se.

Thank you for fixing my quick hack in vacation mode. I'll send out a v2
in a minute.

Thanks,

        tglx
 

