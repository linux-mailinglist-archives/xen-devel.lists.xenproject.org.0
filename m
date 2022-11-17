Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE362DC0D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 13:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445189.700226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oveQA-0004PE-Qt; Thu, 17 Nov 2022 12:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445189.700226; Thu, 17 Nov 2022 12:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oveQA-0004Lw-OB; Thu, 17 Nov 2022 12:55:10 +0000
Received: by outflank-mailman (input) for mailman id 445189;
 Thu, 17 Nov 2022 12:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzYx=3R=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1oveQ9-0004Lq-6f
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 12:55:09 +0000
Received: from smarthost01b.sbp.mail.zen.net.uk
 (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 101a46e2-6677-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 13:55:08 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01b.sbp.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1oveQ0-0003J5-PK; Thu, 17 Nov 2022 12:55:00 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.94.2)
 (envelope-from <dvrabel@cantab.net>)
 id 1ovePr-001FlP-Bo; Thu, 17 Nov 2022 12:55:00 +0000
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
X-Inumbo-ID: 101a46e2-6677-11ed-8fd2-01056ac49cbb
Message-ID: <0afe3f35-1b25-d1c6-89bb-8dae7a4070e9@cantab.net>
Date: Thu, 17 Nov 2022 12:54:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
References: <20221117114122.1588338-1-marmarek@invisiblethingslab.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <20221117114122.1588338-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
	version=3.4.6
Subject: Re: [PATCH] xen-pciback: Consider MSI-X enabled only when MASKALL bit
 is cleared
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01b-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41

On 17/11/2022 11:41, Marek Marczykowski-Górecki wrote:
> Linux enables MSI-X before disabling INTx, but keeps MSI-X masked until
> the table is filled. Then it disables INTx just before clearing MASKALL
> bit. Currently this approach is rejected by xen-pciback.
> Allow setting PCI_MSIX_FLAGS_ENABLE while INTx is still enabled as long
> as PCI_MSIX_FLAGS_MASKALL is set too.

The use of MSI-X interrupts is conditional on only the MSI-X Enable bit. 
Setting MSI-X Enable effectively overrides the Interrupt Disable bit in 
the Command register.

PCIe 6.0.1 section 7.7.2.2. "MSI-X Enable ... is prohibited from using 
INTx interrupts (if implemented)." And there is similar wording for MSI 
Enable.

I think you need to shuffle the checks for MSI/MSI-X in 
xen_pcibk_get_interrupt_type() so they are _before_ the check of the 
Interrupt Disable bit in the Command register.

David

