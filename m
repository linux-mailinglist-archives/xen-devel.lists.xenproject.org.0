Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E48258A92D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 12:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380994.615475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJuAq-0004yt-Dw; Fri, 05 Aug 2022 10:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380994.615475; Fri, 05 Aug 2022 10:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJuAq-0004vU-Ah; Fri, 05 Aug 2022 10:03:20 +0000
Received: by outflank-mailman (input) for mailman id 380994;
 Fri, 05 Aug 2022 10:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=quRM=YJ=oderland.se=josef@srs-se1.protection.inumbo.net>)
 id 1oJuAo-0004vD-90
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 10:03:18 +0000
Received: from vsp01-out.oderland.com (vsp01-out.oderland.com
 [2a02:28f0::24:1]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3ad3919-14a5-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 12:03:17 +0200 (CEST)
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
 by vsp-out.oderland.com (Halon) with ESMTPSA
 id d34affa8-14a5-11ed-956b-cb16337fe68d;
 Fri, 05 Aug 2022 12:03:16 +0200 (CEST)
Received: from 160.193-180-18.r.oderland.com ([193.180.18.160]:38978
 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.95) (envelope-from <josef@oderland.se>) id 1oJuAp-0040la-II;
 Fri, 05 Aug 2022 12:03:16 +0200
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
X-Inumbo-ID: d3ad3919-14a5-11ed-924f-1f966e50362f
X-Scanned-Cookie: 0162612eaad5b0a05cb4a8d9b4dce14a4c5e9ffb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Yb/sBbIP8LbZDr3FjyOxNqjI/ODw5L7fXTT/MsczMz4=; b=T+x3j63HKJVPgHfTxADZ91d4z/
	fHC3HAs+66alxJgwn7FwjK1OxjNFI1LGaQvxKozhRJK8ThlxS771tkF0A7T7V+nBaNwGORO4L9NRY
	9EV17gGxoFYMVHpdWaoIoIPEx2NfO7ieyUBs889QBowzQi0BNZFZCbwAUEflZOly/Vxn9pf7w0xxB
	LK4TlQMnq/RpPYfV9OpNSuQatXjX1n4ozyv2s5l5+THH1RHCoE/bnihJW3KD1jiM7X961J74S+Bmp
	zgb3AX5OWMwAOYPAWjrLs9aMRQN+xVOOjlxob+3XiDYato4i3sDRiHs5rOquzQ2b1sWDImEzriJKc
	3nw3tCug==;
Message-ID: <f1d3ebc5-0e5e-20b5-430c-9426aa5e4bbe@oderland.se>
Date: Fri, 5 Aug 2022 12:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH v2] PCI/MSI: Correct use of can_mask in msi_add_msi_desc()
From: Josef Johansson <josef@oderland.se>
To: Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <d818f9c9-a432-213e-4152-eaff3b7da52e@oderland.se>
Content-Language: en-US
In-Reply-To: <d818f9c9-a432-213e-4152-eaff3b7da52e@oderland.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
x-oderland-domain-valid: yes

On 2/14/22 11:07, Josef Johansson wrote:
> From: Josef Johansson <josef@oderland.se>
>
> PCI/MSI: Correct use of can_mask in msi_add_msi_desc()
>      
> Commit 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()") modifies
> the logic of checking msi_attrib.can_mask, without any reason.
>      
> This commits restores that logic.
>
> Fixes: 71020a3c0dff4 ("PCI/MSI: Use msi_add_msi_desc()")
> Signed-off-by: Josef Johansson <josef@oderland.se>
>
> ---
> v2: Changing subject line to fit earlier commits.
>
> Trying to fix a NULL BUG in the NVMe MSIX implementation I stumbled upon this code,
> which ironically was what my last MSI patch resulted into.
>
> I don't see any reason why this logic was change, and it did not break anything
> correcting the logic.
>
> CC xen-devel since it very much relates to Xen kernel (via pci_msi_ignore_mask).
> ---
>
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index c19c7ca58186..146e7b9a01cc 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -526,7 +526,7 @@ static int msix_setup_msi_descs(struct pci_dev *dev, void __iomem *base,
>   		desc.pci.msi_attrib.can_mask = !pci_msi_ignore_mask &&
>   					       !desc.pci.msi_attrib.is_virtual;
>   
> -		if (!desc.pci.msi_attrib.can_mask) {
> +		if (desc.pci.msi_attrib.can_mask) {
>   			addr = pci_msix_desc_addr(&desc);
>   			desc.pci.msix_ctrl = readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
>   		}
>
> --
> 2.31.1
>

Hi,

I'm sending a ping such that this patch will not get forgotten in the 
oblivion.

Regards
Josef

