Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CCB3F8FC9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 22:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173201.316046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJMQA-0004K5-Hl; Thu, 26 Aug 2021 20:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173201.316046; Thu, 26 Aug 2021 20:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJMQA-0004IA-Dh; Thu, 26 Aug 2021 20:56:22 +0000
Received: by outflank-mailman (input) for mailman id 173201;
 Thu, 26 Aug 2021 20:56:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7uG=NR=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1mJMQ8-0004I4-H5
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 20:56:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bee0cafe-5c9a-4e01-a68f-725cb77fbcb0;
 Thu, 26 Aug 2021 20:56:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4BAB60FDA;
 Thu, 26 Aug 2021 20:56:18 +0000 (UTC)
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
X-Inumbo-ID: bee0cafe-5c9a-4e01-a68f-725cb77fbcb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630011379;
	bh=kkWRiiADlno9wmE5ee4PEol8ApTDqXy3BKb1qSmxOUw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iwF7sBUZJX8hBAiLlR1geRdpV6Wn+bPa29xxNlMqewb8z6ds6bRs4UgcY8kVyXYFZ
	 qXlzqBO+FGXlWJeEj2/1TBpG3L0ogSiyE6ZCnvOzptCEdOsE6JY4ozMEkJIowAmS/A
	 usBwZh11fDYbmfXcL6XBBA2v29KR+ZLIlcd0L36wsTFcgVRQhHtC72KsUYxgFqL824
	 VivT3hMfw4IgvZW8OQHGzUF874t/UHll1z7RaktzId2Voz7c3ORr83pQ492p/BAq9Z
	 PZ/wOHKYII7HTh+6TUmmf+buELMATWEIQ/lSeqQl0IkH+61eQOQXQGI7AlbAhLCDSb
	 DOF2NN/pbGM6g==
Date: Thu, 26 Aug 2021 15:56:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	xen-devel@lists.xenproject.org, Bjorn Helgaas <bhelgaas@google.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2] PCI/MSI: Skip masking MSI-X on Xen PV
Message-ID: <20210826205617.GA3716609@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210826170342.135172-1-marmarek@invisiblethingslab.com>

On Thu, Aug 26, 2021 at 07:03:42PM +0200, Marek Marczykowski-Górecki wrote:
> When running as Xen PV guest, masking MSI-X is a responsibility of the
> hypervisor. Guest has no write access to relevant BAR at all - when it
> tries to, it results in a crash like this:
> 
>     BUG: unable to handle page fault for address: ffffc9004069100c
>     #PF: supervisor write access in kernel mode
>     #PF: error_code(0x0003) - permissions violation
>     PGD 18f1c067 P4D 18f1c067 PUD 4dbd067 PMD 4fba067 PTE 80100000febd4075
>     Oops: 0003 [#1] SMP NOPTI
>     CPU: 0 PID: 234 Comm: kworker/0:2 Tainted: G        W         5.14.0-rc7-1.fc32.qubes.x86_64 #15
>     Workqueue: events work_for_cpu_fn
>     RIP: e030:__pci_enable_msix_range.part.0+0x26b/0x5f0
>     Code: 2f 96 ff 48 89 44 24 28 48 89 c7 48 85 c0 0f 84 f6 01 00 00 45 0f b7 f6 48 8d 40 0c ba 01 00 00 00 49 c1 e6 04 4a 8d 4c 37 1c <89> 10 48 83 c0 10 48 39 c1 75 f5 41 0f b6 44 24 6a 84 c0 0f 84 48
>     RSP: e02b:ffffc9004018bd50 EFLAGS: 00010212
>     RAX: ffffc9004069100c RBX: ffff88800ed412f8 RCX: ffffc9004069105c
>     RDX: 0000000000000001 RSI: 00000000000febd4 RDI: ffffc90040691000
>     RBP: 0000000000000003 R08: 0000000000000000 R09: 00000000febd404f
>     R10: 0000000000007ff0 R11: ffff88800ee8ae40 R12: ffff88800ed41000
>     R13: 0000000000000000 R14: 0000000000000040 R15: 00000000feba0000
>     FS:  0000000000000000(0000) GS:ffff888018400000(0000) knlGS:0000000000000000
>     CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: ffff8000007f5ea0 CR3: 0000000012f6a000 CR4: 0000000000000660
>     Call Trace:
>      e1000e_set_interrupt_capability+0xbf/0xd0 [e1000e]
>      e1000_probe+0x41f/0xdb0 [e1000e]
>      local_pci_probe+0x42/0x80
>     (...)
> 
> There is pci_msi_ignore_mask variable for bypassing MSI(-X) masking on Xen
> PV, but msix_mask_all() missed checking it. Add the check there too.
> 
> Fixes: 7d5ec3d36123 ("PCI/MSI: Mask all unused MSI-X entries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> Cc: xen-devel@lists.xenproject.org
> 
> Changes in v2:
> - update commit message (MSI -> MSI-X)
> ---
>  drivers/pci/msi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
> index e5e75331b415..3a9f4f8ad8f9 100644
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -776,6 +776,9 @@ static void msix_mask_all(void __iomem *base, int tsize)
>  	u32 ctrl = PCI_MSIX_ENTRY_CTRL_MASKBIT;
>  	int i;
>  
> +	if (pci_msi_ignore_mask)
> +		return;
> +
>  	for (i = 0; i < tsize; i++, base += PCI_MSIX_ENTRY_SIZE)
>  		writel(ctrl, base + PCI_MSIX_ENTRY_VECTOR_CTRL);
>  }
> -- 
> 2.31.1
> 

