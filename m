Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B2744AFC7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 15:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223975.386975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSV7-0006oe-GI; Tue, 09 Nov 2021 14:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223975.386975; Tue, 09 Nov 2021 14:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSV7-0006lx-DA; Tue, 09 Nov 2021 14:53:29 +0000
Received: by outflank-mailman (input) for mailman id 223975;
 Tue, 09 Nov 2021 14:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qIDY=P4=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mkSV4-0006lo-Tf
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 14:53:27 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca5c7402-416c-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 15:53:25 +0100 (CET)
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
X-Inumbo-ID: ca5c7402-416c-11ec-a9d2-d9f7a1cc8784
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1636469604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ian5WC377Q5J1422EbugqDjUg/d1iF+4GVOSXbtW1CU=;
	b=S0B47+AyYzHjgDycjapB4jUsuSQ0WhoRfZvITzrkGuizXefOT+wd9cAU5qdWN1zEw4ix9Y
	uGXBel0gE53jodICP+wZoO+q+SrYEDvHe4iqrq4hEKOjQiQQBYV5UBVOdtiqTRONe3ejAJ
	k7Xb1R/1HV9KhBC4FiWdcAePziEmuzArHt5YMu6FDN7ablVcDN+0SoK1ludZdX/5r4Y0cK
	1MdSneRQ3oKuWhcM0AibpvQWsCbro+ucTHqMzJ5MavHDBiUMJqbUhIgpPFW56HpxiPl+0/
	4d+lHMPi4uYThCr602JP5QwSONLAT7qvgHxBuNteIbl5AmBnH3WYtcCYe2F4MA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1636469604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ian5WC377Q5J1422EbugqDjUg/d1iF+4GVOSXbtW1CU=;
	b=/mEresaFf1XyR7ByvtZXr21ZVKsmrxmOn1cj/DgnGshHlFf5urVL984K7Wz8zoHcUTn3qq
	pdi8sCHw5rUi7pAQ==
To: Josef Johansson <josef@oderland.se>
Cc: boris.ostrovsky@oracle.com, helgaas@kernel.org, jgross@suse.com,
 linux-pci@vger.kernel.org, maz@kernel.org, xen-devel@lists.xenproject.org,
 Jason Andryuk <jandryuk@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] PCI/MSI: Move non-mask check back into low level
 accessors
In-Reply-To: <87h7cs6cri.ffs@tglx>
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
 <20211025012503.33172-1-jandryuk@gmail.com> <87fssmg8k4.ffs@tglx>
 <87cznqg5k8.ffs@tglx> <d1cc20aa-5c5c-6c7b-2e5d-bc31362ad891@oderland.se>
 <89d6c2f4-4d00-972f-e434-cb1839e78598@oderland.se>
 <5b3d4653-0cdf-e098-0a4a-3c5c3ae3977b@oderland.se> <87k0ho6ctu.ffs@tglx>
 <87h7cs6cri.ffs@tglx>
Date: Tue, 09 Nov 2021 15:53:23 +0100
Message-ID: <87pmr92xek.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 04 2021 at 00:27, Thomas Gleixner wrote:
>  
> -		if (!entry->msi_attrib.is_virtual) {
> +		if (!entry->msi_attrib.can_mask) {

Groan. I'm a moron. This obviously needs to be

		if (entry->msi_attrib.can_mask) {

>  			addr = pci_msix_desc_addr(entry);
>  			entry->msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
>  		}

