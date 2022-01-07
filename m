Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F5D4879AE
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 16:27:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254483.436350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5r9F-0007mX-Et; Fri, 07 Jan 2022 15:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254483.436350; Fri, 07 Jan 2022 15:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5r9F-0007jz-Be; Fri, 07 Jan 2022 15:27:21 +0000
Received: by outflank-mailman (input) for mailman id 254483;
 Fri, 07 Jan 2022 15:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wJVr=RX=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1n5r9E-0007jt-DT
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 15:27:20 +0000
Received: from smarthost01a.sbp.mail.zen.net.uk
 (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cee5964-6fce-11ec-81c1-a30af7de8005;
 Fri, 07 Jan 2022 16:27:19 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.UK)
 by smarthost01a.sbp.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1n5r9C-0003UY-9F; Fri, 07 Jan 2022 15:27:18 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1n5r9B-0004B1-Ei; Fri, 07 Jan 2022 15:27:17 +0000
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
X-Inumbo-ID: 4cee5964-6fce-11ec-81c1-a30af7de8005
Message-ID: <95a76d1e-dec4-528a-59fc-3d7183917bd0@cantab.net>
Date: Fri, 7 Jan 2022 15:27:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-GB
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: David Vrabel <dvrabel@amazon.co.uk>
References: <20220107125523.212649-1-dvrabel@amazon.co.uk>
 <a599bd4f-99a4-1e41-dee7-fb2d01609ad7@srcf.net>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <a599bd4f-99a4-1e41-dee7-fb2d01609ad7@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCHv2] x86/hvm: add more callback/upcall info to 'I' debug key
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01a-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 07/01/2022 13:45, Andrew Cooper wrote:
>      printk("Callback via PCI dev %u INTx %u%s\n",
> 
> PCI 00:%02x.0  ?

Is this correct? If I remember right, the INTx lines are associated with 
a PCI device, with the function then reporting which line it uses.

So Xen neither knows (nor cares) what the function is, so it would be 
misleading to report it.

>> +               hvm_irq->callback_via.pci.dev,
>> +               hvm_irq->callback_via.pci.intx,
>> +               via_asserted);
>> +        break;
>> +
>> +    case HVMIRQ_callback_vector:
>> +        printk("Callback via vector %u%s\n",
>> +               hvm_irq->callback_via.vector,
>> +               via_asserted);
> 
> ... here, vectors ought to be 0x%02x.  Amongst other things, it makes
> the priority class instantly readable.
> 
> I realise this is all a complete mess, but is via_asserted correct for
> HVMIRQ_callback_vector?  It's mismatched between the two, and the best
> metric that exists is "is pending in IRR".  Also, looking at struct
> hvm_irq, all the callback information is in the wrong structure, because
> it absolutely shouldn't be duplicated for each GSI.

I'm not sure what changes to this patch you want here..

David

