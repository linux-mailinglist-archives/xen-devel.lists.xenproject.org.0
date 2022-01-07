Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA761487872
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 14:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254456.436295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5pYf-0004CL-Sa; Fri, 07 Jan 2022 13:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254456.436295; Fri, 07 Jan 2022 13:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5pYf-00049a-PQ; Fri, 07 Jan 2022 13:45:29 +0000
Received: by outflank-mailman (input) for mailman id 254456;
 Fri, 07 Jan 2022 13:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VgWa=RX=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n5pYe-00049U-GC
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 13:45:28 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1183bbca-6fc0-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 14:45:27 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49928)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n5pYa-0000X9-mf (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 07 Jan 2022 13:45:24 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id DDBAC1FA96;
 Fri,  7 Jan 2022 13:45:23 +0000 (GMT)
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
X-Inumbo-ID: 1183bbca-6fc0-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a599bd4f-99a4-1e41-dee7-fb2d01609ad7@srcf.net>
Date: Fri, 7 Jan 2022 13:45:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: David Vrabel <dvrabel@cantab.net>, xen-devel@lists.xenproject.org
Cc: David Vrabel <dvrabel@amazon.co.uk>
References: <20220107125523.212649-1-dvrabel@amazon.co.uk>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCHv2] x86/hvm: add more callback/upcall info to 'I' debug key
In-Reply-To: <20220107125523.212649-1-dvrabel@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2022 12:55, David Vrabel wrote:
> @@ -630,9 +634,46 @@ static void irq_dump(struct domain *d)
>             hvm_irq->pci_link_assert_count[1],
>             hvm_irq->pci_link_assert_count[2],
>             hvm_irq->pci_link_assert_count[3]);
> -    printk("Callback via %i:%#"PRIx32",%s asserted\n",
> -           hvm_irq->callback_via_type, hvm_irq->callback_via.gsi, 
> -           hvm_irq->callback_via_asserted ? "" : " not");
> +
> +    printk("Per-VCPU upcall vector:\n");
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v->arch.hvm.evtchn_upcall_vector )
> +        {
> +            printk("  v%u: %u\n",
> +                   v->vcpu_id, v->arch.hvm.evtchn_upcall_vector);

Here, and...

> +            have_upcall_vector = true;
> +        }
> +    }
> +    if ( !have_upcall_vector )
> +        printk("  none\n");
> +
> +    via_asserted = hvm_irq->callback_via_asserted ? " (asserted)" : "";
> +    switch( hvm_irq->callback_via_type )
> +    {
> +    case HVMIRQ_callback_none:
> +        printk("Callback via none\n");
> +        break;
> +
> +    case HVMIRQ_callback_gsi:
> +        printk("Callback via GSI %u%s\n",
> +               hvm_irq->callback_via.gsi,
> +               via_asserted);
> +        break;
> +
> +    case HVMIRQ_callback_pci_intx:
> +        printk("Callback via PCI dev %u INTx %u%s\n",

PCI 00:%02x.0  ?

Also, how about INT%c with 'A' + intx as a parameter?

> +               hvm_irq->callback_via.pci.dev,
> +               hvm_irq->callback_via.pci.intx,
> +               via_asserted);
> +        break;
> +
> +    case HVMIRQ_callback_vector:
> +        printk("Callback via vector %u%s\n",
> +               hvm_irq->callback_via.vector,
> +               via_asserted);

... here, vectors ought to be 0x%02x.  Amongst other things, it makes
the priority class instantly readable.


I realise this is all a complete mess, but is via_asserted correct for
HVMIRQ_callback_vector?  It's mismatched between the two, and the best
metric that exists is "is pending in IRR".  Also, looking at struct
hvm_irq, all the callback information is in the wrong structure, because
it absolutely shouldn't be duplicated for each GSI.

~Andrew

