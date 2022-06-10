Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F41F546A4C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 18:22:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346555.572388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzhOK-0004zx-CB; Fri, 10 Jun 2022 16:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346555.572388; Fri, 10 Jun 2022 16:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzhOK-0004xI-9M; Fri, 10 Jun 2022 16:21:44 +0000
Received: by outflank-mailman (input) for mailman id 346555;
 Fri, 10 Jun 2022 16:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaZi=WR=citrix.com=prvs=15310cb4b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nzhOJ-0004xC-4h
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 16:21:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6781ac01-e8d9-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 18:21:40 +0200 (CEST)
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
X-Inumbo-ID: 6781ac01-e8d9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654878100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MRW8FCuKIN7PAb5O33YLCY5idXh92TfGD9V0eYibXYg=;
  b=Fz2ml8Ozn0FDOdJoqYMsG4qSuowyUpRfHFNIqzPGnuen7DesnVGZUT37
   SB6cF8UEYjFarV5CfljjmlhzPJAeQtwfB/hLmpgXLL/tUtkyVOtGYTfXt
   OlsID9DYVdoDWYMVrTZUW+kAgjCxt/Rk9pQFZLJeNuRZ/7knOKpRLrv38
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73343584
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6hUISalgT0UEQunJ7333XMvo5gxFJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXGHQP/7bZmD0foh2PY62ph8O757cyddiQAJvr3tnFCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DnWlvV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYRwJxHO7litwmdiZ+Nz5xFPBl4/yYGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGMmEzN0mQP3WjPH9UOKo3gMODnELNagFC9E6zhvcG0VXcmVkZPL/Fb4OOJ43iqd9utkSSq
 3/C/m/5KgoHL9HZwj2AmlquifXIhjjTQ58JGfuz8fsCqEaI2mUZBRkSVF26ifq0kEizX5RYM
 UN80igzqak/8mS7Q9+7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebTsu2
 1ySg8LyBRRgtbSUTTSW8bL8hSy2ETgYKykFfyBsZQwB7tr4qYc/lCXTX81jG664iN7yMTzoy
 jXMpy8774j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEqr61tbJ6e3X7eN1n7/8vlpcaWCDQa46
 S1sd9el0AweMX2cvHXTHbldRuzyu6jt3C702gA2QcR4n9i50zv6JN0LvmkjTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONk1Hs3DaJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35jmTyCFM6klU/9j9JygUJ5rp9UWGZik8hjtP/UyOkr2
 4032zS2J+V3D7SlP3i/HX87JlEWN3krba3LRzhsXrfbeGJOQTh5Y9eImO9JU9E0xMx9y7aXl
 kxRr2cFkTITc1WccVXUAp2iAZuyNatCQYUTZ3B1YQn2hiB9OO5CLs43LvMKQFXuz8Q7pdYcc
 hXPU5/o7ihnItgfxwkgUA==
IronPort-HdrOrdr: A9a23:kDX+TqikVpokmzzO8yve6exqJ3BQXuIji2hC6mlwRA09TySZ//
 rOoB0+726StN93YgBHpTngAtjlfZqyz/JICOUqUotKGTOWwVdAT7sSiLcKoQeQeBEWn9Q1vc
 wLHpSWSueAb2SS5fyKmDVQeOxB/DDoys6Vuds=
X-IronPort-AV: E=Sophos;i="5.91,290,1647316800"; 
   d="scan'208";a="73343584"
Date: Fri, 10 Jun 2022 17:21:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH V2] libxl/arm: Create specific IOMMU node to be referred
 by virtio-mmio device
Message-ID: <YqNvh4bprAh7W/c1@perard.uk.xensource.com>
References: <1653944813-17970-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1653944813-17970-1-git-send-email-olekstysh@gmail.com>

On Tue, May 31, 2022 at 12:06:53AM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Reuse generic IOMMU device tree bindings to communicate Xen specific
> information for the virtio devices for which the restricted memory
> access using Xen grant mappings need to be enabled.
> 
> Insert "iommus" property pointed to the IOMMU node with "xen,grant-dma"
> compatible to all virtio devices which backends are going to run in
> non-hardware domains (which are non-trusted by default).
> 
> Based on device-tree binding from Linux:
> Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
> 
> The example of generated nodes:
> 
> xen_iommu {
>     compatible = "xen,grant-dma";
>     #iommu-cells = <0x01>;
>     phandle = <0xfde9>;
> };
> 
> virtio@2000000 {
>     compatible = "virtio,mmio";
>     reg = <0x00 0x2000000 0x00 0x200>;
>     interrupts = <0x00 0x01 0xf01>;
>     interrupt-parent = <0xfde8>;
>     dma-coherent;
>     iommus = <0xfde9 0x01>;
> };
> 
> virtio@2000200 {
>     compatible = "virtio,mmio";
>     reg = <0x00 0x2000200 0x00 0x200>;
>     interrupts = <0x00 0x02 0xf01>;
>     interrupt-parent = <0xfde8>;
>     dma-coherent;
>     iommus = <0xfde9 0x01>;
> };
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The patch looks fine.

> ---
> !!! This patch is based on non upstreamed yet “Virtio support for toolstack
> on Arm” V8 series which is on review now:
> https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/

With the patch added to the series it depends on: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

