Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7922006FB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 12:43:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmETj-000216-0G; Fri, 19 Jun 2020 10:42:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jg7u=AA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jmETh-00020z-S5
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 10:42:33 +0000
X-Inumbo-ID: 94b79d2c-b219-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94b79d2c-b219-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 10:42:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g21so4225723wmg.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2020 03:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=BFR8jLnFKKzeoiedj3QuphMlqG56YWoxLvBPjARRM6s=;
 b=cqdHZN3lGUoim3IIaQwimQW5V78VYIck3tvM6ETOkgSzqun5sM8fyS13Xgy0ejB+7v
 zMPeHCkhKMhMvTH6XofFMiO6a4p0p6q6T7H37uwpepmVm5femEPCBcIpyYH/uXuexJrT
 CrKtWn4FJMCb4M2vn9B0RUlonng5wZzhrdETTnUJRYV+PArYJKHp2Hnt5CPVc3/zpxWH
 WHZCEuZhasY36RAP+QbNybnUUMkIke77udyXXcr5TfjaX50E17QiQ5CAtfSrywoDMidf
 Xa1sP/dx3TIbbXqgeYvKjmpP7FVobUzSgIXjb65c5+J0H5OlTNiWNVinkhg8ReP8eud5
 n8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=BFR8jLnFKKzeoiedj3QuphMlqG56YWoxLvBPjARRM6s=;
 b=L8q/G1SVaMsmwmL9w5aL2je9Gu0M6rkuAwpl636Nn3QEanvC05Y3f87j0dtzzkUSAM
 JHtNeTYc8f2v2kfjUtqCKGDFOn4WOtEyr/JeEN4J11bor+Ep9Ummoos4nrEJ5R2xFwq+
 UoM15Zf2h0BkYZcWtVMX7NZUMlHG0/BUDM16F1J5boDgb0sPS4Tpm5fyD8mnTb39fmyc
 SIJ4r3Pi+fVBU72HXRfAX7eBISc0kq7BGHEbkzyw99vrVIS3XrfStptafVvs0BUCVEPV
 LW3s0tolkYAkwt4vdEe8LDbAcUw2deipGMuiEZRjjhZdg1Iyxmwr81QHxMc0iTYjKzKe
 Kd7A==
X-Gm-Message-State: AOAM531d3mZthdIZuTHqtIiE17GbgNlLD9c14OAY00OnNSYslGELx0g1
 NgIC8N+eHY3Wd/NEEfwQzBA=
X-Google-Smtp-Source: ABdhPJwaMMa/gMidMkxVhqK2lMz2pHCDECZBsvrFXbGWiBgBbPmK/XjcBpmTcn0NiMim+ey/IktetQ==
X-Received: by 2002:a1c:e355:: with SMTP id a82mr3057725wmh.1.1592563352358;
 Fri, 19 Jun 2020 03:42:32 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id i8sm6717120wru.30.2020.06.19.03.42.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 03:42:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Anthony PERARD'" <anthony.perard@citrix.com>,
	<qemu-devel@nongnu.org>
References: <20200619103115.254127-1-anthony.perard@citrix.com>
In-Reply-To: <20200619103115.254127-1-anthony.perard@citrix.com>
Subject: RE: [PATCH] xen: Actually fix build without passthrough
Date: Fri, 19 Jun 2020 11:42:30 +0100
Message-ID: <00aa01d64626$55eec020$01cc4060$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJ4Bmae6BJqEg639TdZnK5dfFEOPaecP7gQ
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
Reply-To: paul@xen.org
Cc: 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Sent: 19 June 2020 11:31
> To: qemu-devel@nongnu.org
> Cc: Paolo Bonzini <pbonzini@redhat.com>; Anthony PERARD <anthony.perard@citrix.com>; Stefano
> Stabellini <sstabellini@kernel.org>; Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Subject: [PATCH] xen: Actually fix build without passthrough
> 
> Fix typo.
> 
> Fixes: acd0c9416d48 ("xen: fix build without pci passthrough")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Paul Durrant <paul@xen.org>

> ---
>  hw/xen/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
> index 3fc715e5954d..502b32d877a0 100644
> --- a/hw/xen/Makefile.objs
> +++ b/hw/xen/Makefile.objs
> @@ -4,4 +4,4 @@ common-obj-y += xen-legacy-backend.o xen_devconfig.o xen_pvdev.o xen-bus.o xen-b
>  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen-host-pci-device.o
>  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_graphics.o xen_pt_msi.o
>  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt_load_rom.o
> -obj-$(call $(lnot, $(CONFIG_XEN_PCI_PASSTHROUGH))) += xen_pt_stub.o
> +obj-$(call lnot,$(CONFIG_XEN_PCI_PASSTHROUGH)) += xen_pt_stub.o
> --
> Anthony PERARD



