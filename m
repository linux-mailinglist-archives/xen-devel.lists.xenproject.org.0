Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E239042A6E1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 16:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207259.363027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIVA-0006sy-MA; Tue, 12 Oct 2021 14:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207259.363027; Tue, 12 Oct 2021 14:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIVA-0006qm-J5; Tue, 12 Oct 2021 14:11:32 +0000
Received: by outflank-mailman (input) for mailman id 207259;
 Tue, 12 Oct 2021 14:11:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U2oI=PA=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1maIV9-0006qf-CD
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:11:31 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3f59fc1-7a5a-401c-a68a-36b8b28a8d2c;
 Tue, 12 Oct 2021 14:11:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id r19so85595466lfe.10
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 07:11:30 -0700 (PDT)
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
X-Inumbo-ID: d3f59fc1-7a5a-401c-a68a-36b8b28a8d2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KMJkGulYO08hK7uvXbwHieCG67DH8mAGFG+J88k0HtQ=;
        b=jGyv35w1Th/VcGjS0uXIYS1/hZw0Tbs9LcOJM3zlikFdoX4qYKcvbY/iwckN5rLYJI
         Wf0o0q+9ogDv4Hn5GCXA93UrVYK/e4uy3LMtClD3FaHm14qHZ0SSOZOSBbaTmZthLzvB
         JDA9KBFrwNaI9u5EMBStAGE2cx2Modf4ZhzlQUkrkFDszBRA2MHXmUxiMVfrdQx5Kz/9
         FoWR3xJ6hXtoUPqH7oEN23FUiq04HzOEGFWnoTO6fk3IU9JVTr+irX++fnYsDPm4iZwh
         HmOJc9espvH9LI+yJ1pi3S+ONlomWnpeFMUQ4twh039K3QTsuzy5VJr6g56Kd0MkoAna
         +n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KMJkGulYO08hK7uvXbwHieCG67DH8mAGFG+J88k0HtQ=;
        b=yGLgKKN4BTltyZjoP/H5XsssXsZcjV3voCruoQFlOFJawPe0FcooCaeTEh6ceBD25T
         jOIXB0rWzEnwigwo/20PCqNqSoWa4avMamscJISUTxBWOjvPJKLouOJ/uDOSSrGmglp+
         L2fTwQseBzgFEkxZ6TTHFap11QVeKLQI0VozLvBqB/5l/ll3hDUpAOSQEhOslFQuPMiY
         qkpoeH46v+XcPqgz3GuLTl9cg7Jwth+h2cBua/kvwng/UFbr0bBepZsXa2geJWisr0WF
         ZFcIu34gKk2N/sAPj6Jjj7nbtHIcj+oPFXqLSYQJffNSwBwEffc0x99NCqux6sw2bJc/
         RXmg==
X-Gm-Message-State: AOAM532zjUt9bdYVufalxr1k12bmokQ6+Dlv6W/hzl7RcQNEPsHIskjT
	dpoAtxauPmX5PwtjusIgDN8tEoRddAZe8T1Jr2w=
X-Google-Smtp-Source: ABdhPJxfkMCEjeeLV/Ewm3f+AZNuNNymij2vhZOjkUSGinYcnXpgag3KIHEc+pI3tC0HlGD+3NbZizDkPEragXGFP2Y=
X-Received: by 2002:a2e:530b:: with SMTP id h11mr29408481ljb.310.1634047884386;
 Tue, 12 Oct 2021 07:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633106362.git.roman_skakun@epam.com>
In-Reply-To: <cover.1633106362.git.roman_skakun@epam.com>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Tue, 12 Oct 2021 17:11:13 +0300
Message-ID: <CADu_u-PVqHc6RQ4JTpkrmNap+QxEh7=0Mu2xsiAjOty3J5hKjQ@mail.gmail.com>
Subject: Re: [RFC 0/1] tag IOMMU-protected devices in Dom0 fdt
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org
Cc: Roman Skakun <roman_skakun@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrii Anisov <andrii_anisov@epam.com>, Roman Skakun <rm.skakun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Would you be so kind to look at my patches, it would help me to
know exactly whether I'm moving correctly and whether I've chosen
the right path?
Thanks!

Best regards,
Roman

=D0=BF=D0=BD, 4 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 12:54, Roman Skakun=
 <rm.skakun@gmail.com>:
>
> From: Roman Skakun <roman_skakun@epam.com>
>
> At the moment, Dom0 can't distinguish which devices are protected by
> IOMMU and which are not. In some cases, this can cause swiotlb bounce
> buffer use for DMA addresses above 32 bits, which in turn can lead
> to poor performance. I started a conversation at [1], where we discussed
> addition of a new device tree property to mark IOMMU-protected devices fo=
r Dom0.
>
> As a result of negotiation at [1], I would like to present two
> patches:
>
> 1. The first patch for the hypervisor. It adds a new device property
> 'xen,behind-iommu' to a relevant device node when the device is
> IOMMU-protected.
>
> 2. The second patch is a Linux kernel counterpart. It detects the said
> property and disables swiotlb for a device.
>
> There is a possible issue: some devices may not be able to use DMA
> addresses above 32 bit boundaries, so we can have problems in the
> direct DMA mechanism when swiotlb-xen is disabled for a such
> device. More generally, this can affect any device which DMA address
> range is narrower than CPU one.
>
> In this case,
> the device DMA address should be no bigger than 32 bit boundaries for
> each device that is not using swiotlb-xen.
>
> Several ideas on how to overcome it:
> 1. Do not use high memory for Dom0.
> 2. Set DMA 32bit mask for each device if swiotlb is not used for this dev=
ice.
> 3. Force balloon driver to allocate buffers only below 4GB.
>
> I will be glad to get any comments or suggestions.
>
> [1] https://lore.kernel.org/xen-devel/AM7PR03MB65936E5D0B25567D1B2FAECA85=
CC9@AM7PR03MB6593.eurprd03.prod.outlook.com/
>
> Roman Skakun (1):
>   xen/arm: set iommu property for IOMMU-protected devices
>
>  xen/arch/arm/domain_build.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> --
> 2.27.0
>


--=20
Best Regards, Roman.

