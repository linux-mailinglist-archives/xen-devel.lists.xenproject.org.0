Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6977F4B1A25
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 01:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270001.464172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIJW8-00051s-B7; Fri, 11 Feb 2022 00:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270001.464172; Fri, 11 Feb 2022 00:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIJW8-0004z7-7O; Fri, 11 Feb 2022 00:10:28 +0000
Received: by outflank-mailman (input) for mailman id 270001;
 Fri, 11 Feb 2022 00:10:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0PRg=S2=oderland.se=josef@srs-se1.protection.inumbo.net>)
 id 1nIJW6-0004yl-8L
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 00:10:26 +0000
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 025ac081-8acf-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 01:10:24 +0100 (CET)
Received: from 160.193-180-18.r.oderland.com ([193.180.18.160]:39782
 helo=[10.137.0.14]) by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1nIJW3-0033hn-2Z; Fri, 11 Feb 2022 01:10:23 +0100
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
X-Inumbo-ID: 025ac081-8acf-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=f5LwesLno9aK7qaWhl94ikSb/XMOItWC7LJzHBJ85RI=; b=kMrycBObjs8zLOaSOz4WPSqREL
	nD+2kVkDr3gtM5k6vthe9TCjv16X7XN4BH/yUbAUhJwkOLYvHXJBPmbsNWocxP0dLUcJvAxCHj92g
	rTBAaXyzDIBZ6cviZH0T1r07G9E2zZZ29aDYxg9FpCBsDqPG0HvtbFH/CHe6mMeXGbTU+eXi5Pf1g
	Rfe6efgYsW2Z+vdKkw5ZeLQP8s8Shp/mVXA27x5u23nodMSxOKXB2Ypca0wj8UukuLMrn4T8BMRhV
	xfV4H7TY4FytruN2GNNrXvBn6o0aua/fheNKXm53dQVMLKp6AIyHS5veXfR+TLucxEcg/x0fJKA5n
	ptnPo9eg==;
Message-ID: <69d705f3-8e0d-31b7-9a80-4413b8dbe7a3@oderland.se>
Date: Fri, 11 Feb 2022 01:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 xen-devel <xen-devel@lists.xenproject.org>, Jason Gunthorpe <jgg@nvidia.com>
References: <20220210235532.GA663996@bhelgaas>
From: Josef Johansson <josef@oderland.se>
Subject: Re: [PATCH] PCI/MSI: msix_setup_msi_descs: Restore logic for
 msi_attrib.can_mask
In-Reply-To: <20220210235532.GA663996@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

On 2/11/22 00:55, Bjorn Helgaas wrote:
> [+cc Jason, since you reviewed the original commit]
>
> On Sat, Jan 22, 2022 at 02:10:01AM +0100, Josef Johansson wrote:
>> From: Josef Johansson <josef@oderland.se>
>>
>> PCI/MSI: msix_setup_msi_descs: Restore logic for msi_attrib.can_mask
> Please match the form and style of previous subject lines (in
> particular, omit "msix_setup_msi_descs:").
Would this subject suffice?
PCI/MSI: Correct use of can_mask in msi_add_msi_desc()
>> Commit 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()") modifies
>> the logic of checking msi_attrib.can_mask, without any reason.
>>     
>> This commits restores that logic.
> I agree, this looks like a typo in 71020a3c0dff4, but I might be
> missing something, so Thomas should take a look, and I added Jason
> since he reviewed it.
>
> Since it was merged by Thomas, I'll let him take care of this, too.
> If it *is* a typo, the fix looks like v5.17 material.
>
> Before: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/msi/msi.c?id=71020a3c0dff4%5E#n522
> After:  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/msi/msi.c?id=71020a3c0dff4#n520
It should be noted that I successfully ran the kernel with this patch.
>> Fixes: 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()")
>> Signed-off-by: Josef Johansson <josef@oderland.se>
>>
>> ---
>> Trying to fix a NULL BUG in the NVMe MSIX implementation I stumbled upon this code,
>> which ironically was what my last MSI patch resulted into.
>>
>> I don't see any reason why this logic was change, nor do I have the possibility
>> to see if anything works with my patch or without, since the kernel crashes
>> in other places.
>>
>> As such this is still untested, but as far as I can tell it should restore
>> functionality.
>>
>> Re-sending since it was rejected by linux-pci@vger.kernel.org due to HTML contents.
>> Sorry about that.
>>
>> CC xen-devel since it very much relates to Xen kernel (via pci_msi_ignore_mask).
>> ---
>>
>> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
>> index c19c7ca58186..146e7b9a01cc 100644
>> --- a/drivers/pci/msi/msi.c
>> +++ b/drivers/pci/msi/msi.c
>> @@ -526,7 +526,7 @@ static int msix_setup_msi_descs(struct pci_dev *dev, void __iomem *base,
>>  		desc.pci.msi_attrib.can_mask = !pci_msi_ignore_mask &&
>>  					       !desc.pci.msi_attrib.is_virtual;
>>  
>> -		if (!desc.pci.msi_attrib.can_mask) {
>> +		if (desc.pci.msi_attrib.can_mask) {
>>  			addr = pci_msix_desc_addr(&desc);
>>  			desc.pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
>>  		}
>>
>> --
>> 2.31.1
>>


