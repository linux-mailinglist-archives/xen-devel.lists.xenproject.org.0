Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FE1546934
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 17:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346506.572330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzgJi-00024l-7A; Fri, 10 Jun 2022 15:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346506.572330; Fri, 10 Jun 2022 15:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzgJi-000225-40; Fri, 10 Jun 2022 15:12:54 +0000
Received: by outflank-mailman (input) for mailman id 346506;
 Fri, 10 Jun 2022 15:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaZi=WR=citrix.com=prvs=15310cb4b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nzgJg-0001XY-3c
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 15:12:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca5f0844-e8cf-11ec-8901-93a377f238d6;
 Fri, 10 Jun 2022 17:12:51 +0200 (CEST)
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
X-Inumbo-ID: ca5f0844-e8cf-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654873971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B3btawzkjKvYK63PXTcCLGEb4ArfCXeAOyDiDR9fQlc=;
  b=BuEFKsYJ8j9fE5C9EYn7PHMa6dydzYKTztKbOokCV1kygNXhT+q/jmiJ
   QzvabHBFB00oQBAB1jdkCfNqeFclAsYVdZKRPz0QWNi24h6JVRCkMSXJw
   rNUZq1M8JZLHY5VZe2W6lO1S9Xa0Mr5QejhurfpzO2ulyRsLMs8ziTWMT
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73174958
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fOM36ampjdUFYnBgpoBImGro5gx+JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOWT+BPK2KZWT2c9EjbInj9UoPvZSBm4BqTgI4qSlkHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DnWlvV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYGRgUYOrsoeUmdEdUTjluA79awo75Li3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGMmMwMEWdM3WjPH9JELtun/6YukPEKTpjtw6n4oAw7Hj6mVkZPL/Fb4OOJ43iqd9utkSFo
 mPL+UzpDxdcM8aQoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQZBQcKT1K9rb+8g1SnRtNEA
 0UO/2wlqq1a3EuvQ9rmVhu0ukmYrwUcUNpdFe49wAyVw6+S6AGcbkA6STpGZM0jpdUBbzUg3
 V+UnPvkHTVq9raSTBq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseIayitD2Ai3h2
 DCioy03hrFVhskOv4254FTGjjTqqYLASgod7x/SGGmi62tRZoG/YJezwUPG9vsGJ4GcJnGeu
 FAUls7Y6/oBZaxhjwTUHr9LRuvwoa/YbnuM2jaDAqXN6Rz95EP9OqBp4QpZeks0KtY6ayPTU
 XHc7FY5CIBoAJe6UUNmS9vvVph6l/W7SYqNuuP8NYQXPMUoHOOT1GQ3PBPLgTiw+KQ5uftnU
 ap3Z/pAGprz5U5P6DOtD9kQ3rYwrszV7TOCHMurp/hLPFf3WZJ0dVvmGAHXBgzBxPnYyDg5C
 v4GXydw9z1RUfflfg7c+pMJIFYBIBATXM6r95MGJ7DceFE8RgnN7sM9JptwE7GJYowPzruYl
 p1DchQwJKXDaY3vdlzRNyELhELHVpdjt3MrVRER0aKT8yF7O+6Htf5HH7NuJOVP3LEylpZcE
 qhaE/hs99wSE1wrDRxGNcmjxGGjHTz27T+z092NOmFiJ8AxHlKQoLcJvGLHrUEzM8Z+juNmy
 5XI6+8RacNrq9hKZCoOVM+S8g==
IronPort-HdrOrdr: A9a23:m25soqyc4BddCNpTNoUFKrPwLr1zdoMgy1knxilNoRw8SK2lfu
 SV7ZMmPH7P+VIssR4b9exoVJPufZqYz+8S3WBzB8bGYOCFghrKEGgK1+KLqFeMJ8S9zJ8+6U
 4JSdkGNDSaNzhHZKjBjjWFLw==
X-IronPort-AV: E=Sophos;i="5.91,290,1647316800"; 
   d="scan'208";a="73174958"
Date: Fri, 10 Jun 2022 16:12:35 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>,
	"Wei Liu" <wl@xen.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V9 2/2] libxl: Introduce basic virtio-mmio support on Arm
Message-ID: <YqNcE9j1r9+d7ekF@perard.uk.xensource.com>
References: <1654106261-28044-1-git-send-email-olekstysh@gmail.com>
 <1654106261-28044-3-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1654106261-28044-3-git-send-email-olekstysh@gmail.com>

On Wed, Jun 01, 2022 at 08:57:41PM +0300, Oleksandr Tyshchenko wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> This patch introduces helpers to allocate Virtio MMIO params
> (IRQ and memory region) and create specific device node in
> the Guest device-tree with allocated params. In order to deal
> with multiple Virtio devices, reserve corresponding ranges.
> For now, we reserve 1MB for memory regions and 10 SPIs.
> 
> As these helpers should be used for every Virtio device attached
> to the Guest, call them for Virtio disk(s).
> 
> Please note, with statically allocated Virtio IRQs there is
> a risk of a clash with a physical IRQs of passthrough devices.
> For the first version, it's fine, but we should consider allocating
> the Virtio IRQs automatically. Thankfully, we know in advance which
> IRQs will be used for passthrough to be able to choose non-clashed
> ones.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

