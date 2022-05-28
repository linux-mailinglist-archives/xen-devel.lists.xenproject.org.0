Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14540536E94
	for <lists+xen-devel@lfdr.de>; Sat, 28 May 2022 23:25:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338239.562998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nv3uo-0001JA-PZ; Sat, 28 May 2022 21:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338239.562998; Sat, 28 May 2022 21:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nv3uo-0001Gp-Md; Sat, 28 May 2022 21:24:06 +0000
Received: by outflank-mailman (input) for mailman id 338239;
 Sat, 28 May 2022 21:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GHdA=WE=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1nv3un-0001Gj-1a
 for xen-devel@lists.xenproject.org; Sat, 28 May 2022 21:24:05 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f52c325-decc-11ec-837f-e5687231ffcc;
 Sat, 28 May 2022 23:24:03 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id z17so4435685wmf.1
 for <xen-devel@lists.xenproject.org>; Sat, 28 May 2022 14:24:03 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d006df08acd6a055550.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:6df0:8acd:6a05:5550])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adffe47000000b0020d0b2de858sm4910784wrs.33.2022.05.28.14.24.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 28 May 2022 14:24:02 -0700 (PDT)
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
X-Inumbo-ID: 7f52c325-decc-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:references:message-id
         :mime-version:content-transfer-encoding;
        bh=zIGHVshfh/VikUqvKrvhXfm7K5EaTaFbPI9k1R3B3QM=;
        b=Gjof+E9drLhCJstlob0ryE+KdjAqFu1orco5bOHUPfM49537XQd68rMwJbcjhhX0H/
         M0yM3xp+PkuXyiTTvaBXWS8bpekqZ0zad7gLdEUu/QfXqDdywXBUoIXrkuxhLYByRjfa
         wlbe0QLvtxou6rDlpyW3BVmP04hnz6aOt/DHkpN0dcIAB/yagxYB6Ldldfk5gEBIlz3c
         m22hF+nvtITy3fc9urmarP6a6y2ehC58medtCwWn0aMcL+LoJ/Ai9XtOYxONMN9af07f
         UIlPFwTTNsbfgF0DuoL1Iw8SNjOaalMhv0gIA+x948VQMmLqsRRO0B5ofDEP1L8RxFmA
         wsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=zIGHVshfh/VikUqvKrvhXfm7K5EaTaFbPI9k1R3B3QM=;
        b=iRT/GO3ZA6KIW4WeaWbNHKgA4qgZcjsWGy881Vp8DX5Zmzz360C3expMinG+88/IA9
         EKZdbKkHTr4IVmTpf6WQxDBmGJCWY+Bv+/gsggJJndDByh7HxpFeD8CUcFoO8RsAcUXz
         jM53lIVVTnPBfMTYpG9Lq/rqXQiNrvSDzzTcjfoPsNHHsqkWQBl8SqL7tWsltBBF1w4d
         8yjBJQhOd0xQ2RocKWlUk3NGx54IiOiibqKnQ0s4kb2wwyKlpPcQxWnnYz38xJvrrH56
         6hYt74dWJQtgjI3aN9lgSiqUJ+LN9ANHSz0yR82w4VDbRb1VAr4NI3nYlo6HUwBpEA31
         J35Q==
X-Gm-Message-State: AOAM530FprrPrqEqGMRe8W8g9tuUJkdN8751Y5nDfBrPJ8Zg09f9DE8i
	MO0sZRdkF6DaCNjpTZ2MVF5X5p0rv+8=
X-Google-Smtp-Source: ABdhPJzM9lqK4t3eYGzDQhKxZ49/sjKHJV1WyZZnqIKb08Qqj95EeFlTziQwrbxrhf49U8rQCfjscA==
X-Received: by 2002:a05:600c:3ac6:b0:397:7520:c78e with SMTP id d6-20020a05600c3ac600b003977520c78emr12548506wms.23.1653773042858;
        Sat, 28 May 2022 14:24:02 -0700 (PDT)
Date: Sat, 28 May 2022 21:23:57 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, sstabellini@kernel.org, anthony.perard@citrix.com,
 paul@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/3] PIIX3-IDE XEN cleanup
In-Reply-To: <20220513180957.90514-1-shentey@gmail.com>
References: <20220513180957.90514-1-shentey@gmail.com>
Message-ID: <43BCAA1E-7499-4584-AB60-C5004AA0643B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 13=2E Mai 2022 18:09:54 UTC schrieb Bernhard Beschow <shentey@gmail=2Eco=
m>:
>v2:
>* Have pci_xen_ide_unplug() return void (Paul Durrant)
>* CC Xen maintainers (Michael S=2E Tsirkin)
>
>v1:
>This patch series first removes the redundant "piix3-ide-xen" device clas=
s and
>then moves a XEN-specific helper function from PIIX3 code to XEN code=2E =
The idea
>is to decouple PIIX3-IDE and XEN and to compile XEN-specific bits only if=
 XEN
>support is enabled=2E
>
>Testing done:
>'qemu-system-x86_64 -M pc -m 1G -cdrom archlinux-2022=2E05=2E01-x86_64=2E=
iso" boots
>successfully and a 'poweroff' inside the VM also shuts it down correctly=
=2E
>
>XEN mode wasn't tested for the time being since its setup procedure seems=
 quite
>sophisticated=2E Please let me know in case this is an obstacle=2E
>
>Bernhard Beschow (3):
>  hw/ide/piix: Remove redundant "piix3-ide-xen" device class
>  hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()
>  include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
>
> hw/i386/pc_piix=2Ec          |  3 +--
> hw/i386/xen/xen_platform=2Ec | 48 +++++++++++++++++++++++++++++++++++++-
> hw/ide/piix=2Ec              | 42 ---------------------------------
> include/hw/ide=2Eh           |  3 ---
> 4 files changed, 48 insertions(+), 48 deletions(-)
>

Ping

Whole series is reviewed/acked=2E

