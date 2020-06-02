Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 455671EB3F5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 05:50:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfxvW-0007F3-Ub; Tue, 02 Jun 2020 03:49:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PmCl=7P=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1jfxvU-0007Ey-4X
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 03:49:20 +0000
X-Inumbo-ID: 08ee76be-a484-11ea-ab8b-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 08ee76be-a484-11ea-ab8b-12813bfff9fa;
 Tue, 02 Jun 2020 03:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591069757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ExLd1Z+1FIxt0ntrrBRLTV4rcrryp6L3gYgD3JMEe7Y=;
 b=NBW72FDhpLe52v1SNV4xZxz7ETgpbVoM3nIswTun+gGALr12gJT6LUgiw7MJ3cHcfeQm85
 KxuhG4vInCiXzLemhm3NFPfU0BKeDgjF/dOwKC4HfQ40lJKltjnhaMQpEFvdnTs3kuGePW
 d1ZkPilbswuTPfodPk0smjD72ZZFUhk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-v18-1bDFPyKc62xwSlhAWQ-1; Mon, 01 Jun 2020 23:49:16 -0400
X-MC-Unique: v18-1bDFPyKc62xwSlhAWQ-1
Received: by mail-wr1-f70.google.com with SMTP id m14so817680wrj.12
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 20:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UPZhIAGyj/VLbIsoUlC2KngQ5PLwTgQRP4hRk68ZAN8=;
 b=UpTxBq2qegW9ICRJClvBrPLzUrq7PYtOVMIDkL0C2uVJS3S9eVktkAucUrdEnFI/JB
 Mu/l0nPxgQUK5rEpE33joWO0OIOAeEo3E1z7QNalbwT/yIwTR1/ylaW9llWvn7T4qABK
 YV9wOD/epGEALPGwRW6UcJl/u9LSN3+O5GVDuySnyGeN/qQio/8qc2AW0R7bXkQC/Tcq
 8zZVDqyuaWiWsaP2Rf0s89k0BZ+VP+6BG2XO/Gk3vGYGw/B6ME9B/KdtEohAZ4J3oPet
 Uo/rnCifsdeF+BZbL+9UpTVokibf3yTyrVww3Pzcqk85dO7rKwAr2ZXYc6YA+iL2BI3j
 72aw==
X-Gm-Message-State: AOAM530Q5hpNmzLdecSxS8o6+p342tVlQqAtWLjNYvon8EzUXxnHVqfI
 qCwlZbvP3bQ91FUSWH+qGW8r9f5Mg88r6/PnrfG3U2ebDpUbD91IvBFowygQ+ExewMJfciSuWBv
 YtO1FsMWf+rkVcHunJn8i0T5RL8o=
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr25958765wrs.115.1591069755171; 
 Mon, 01 Jun 2020 20:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbFuz2uv/TDCU4M0qN37P/g2y+Wa4iddh/8yNcs/CsBmvsOG4NKyvS+2vtx6Nf23TXqpMcXQ==
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr25958746wrs.115.1591069754999; 
 Mon, 01 Jun 2020 20:49:14 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 g18sm1578601wme.17.2020.06.01.20.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 20:49:14 -0700 (PDT)
Date: Mon, 1 Jun 2020 23:49:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/8] hw: Fix some incomplete memory region size
Message-ID: <20200601234822-mutt-send-email-mst@kernel.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 01, 2020 at 04:29:22PM +0200, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.
> 
> Since v1:
> - Add parenthesis on the Xen patch (Paul Durrant)
> - Add Peter's R-b tags


PCI things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

I'll queue pci patches in my tree.

> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value.
> This is not a problem for the 32-bit maximum, 4 GiB, but
> in some places we incorrectly use UINT32_MAX instead of
> 4 GiB, and end up missing 1 byte in the memory region.
> 
> This series fixes the cases I encountered.
> Also included few patches while reviewing, I replaced some
> magic values by the IEC binary prefix equivalent.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (8):
>   hw/arm/aspeed: Correct DRAM container region size
>   hw/pci-host/prep: Correct RAVEN bus bridge memory region size
>   hw/pci/pci_bridge: Correct pci_bridge_io memory region size
>   hw/pci/pci_bridge: Use the IEC binary prefix definitions
>   hw/pci-host: Use the IEC binary prefix definitions
>   hw/hppa/dino: Use the IEC binary prefix definitions
>   hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
>   target/i386/cpu: Use the IEC binary prefix definitions
> 
>  hw/arm/aspeed.c         | 2 +-
>  hw/hppa/dino.c          | 4 ++--
>  hw/i386/xen/xen-hvm.c   | 3 ++-
>  hw/pci-host/i440fx.c    | 3 ++-
>  hw/pci-host/prep.c      | 2 +-
>  hw/pci-host/q35.c       | 2 +-
>  hw/pci-host/versatile.c | 5 +++--
>  hw/pci/pci_bridge.c     | 7 ++++---
>  target/i386/cpu.c       | 2 +-
>  9 files changed, 17 insertions(+), 13 deletions(-)
> 
> -- 
> 2.21.3


