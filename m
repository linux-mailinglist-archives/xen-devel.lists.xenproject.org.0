Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4F1E9AA9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 00:06:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfW5c-0001jo-Ov; Sun, 31 May 2020 22:05:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jz0d=7N=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jfW5a-0001jj-MQ
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 22:05:54 +0000
X-Inumbo-ID: e570b98a-a38a-11ea-8993-bc764e2007e4
Received: from mail-qv1-xf2e.google.com (unknown [2607:f8b0:4864:20::f2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e570b98a-a38a-11ea-8993-bc764e2007e4;
 Sun, 31 May 2020 22:05:53 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id f89so3634594qva.3
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 15:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=m3hCykIFfDuc556EkAd2MzlXxt69c5qKxSkCefOY8Tc=;
 b=b8WSe1917oWKcBIzDhxQzjPiw6UP0QYa3360vfp+3tychI06UXE/TRQbaaC4jge7Se
 jSPnnxjsiPbn0xjCkaF3uuqs6eOfatD2h/RgVvXafVZZniJzIz7QKtMlwqTABTVTliby
 m5YkB8IzDhRegl3UJPBYhLXQn4Odst1Qs98qRS3o3Ofcqid9YKeu1Y0wcA2V+qymzZks
 UqXPTwkV7Uug80OztDt3vh7p7Z9YB5Em0r/tSwHRBxfXdhmCsEc2s1RqaK6QrU297ws5
 I8DfEeCuTo3idJucKbsxmi2HaIormRFvlkO2u/NxFopGGXq+Nosjuhk2bV6haTDodLZ5
 lf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=m3hCykIFfDuc556EkAd2MzlXxt69c5qKxSkCefOY8Tc=;
 b=PIPA2jyqKL/J8WbbDgawXiy6mg1cUqw7fJrHtsoNRJUsFk/CClHTCnZ7iGn6vp0CSa
 9AM31g2atri4pggLIUMp9MBUjbz1Jek/KZ1RN9ej+uQnnC/J6NRjIT+SuwKXCEU+MtV1
 1snlqmEKpsDzpsx8j77oDEgkJLiKjkdH1T3Qmv2NkB3OJ6AVUks2M2XhrQE83QJRZeUi
 bFiEZbpIsrnG65dXkejOJpH8eC5wXnqFgIwzvGQPGg0I88gwNV9S3vXvVFTSCdiv6L1h
 V1Cy9+gtwqRJZfSV21zy00Gz0I9Xj9EE3HZD8rCpvK+KQPttp0CbD+UDVKWVHV14r9+V
 gamQ==
X-Gm-Message-State: AOAM532FqR+/FrjE7AdgOSmZ2wb2n33s6uuLFjNqOoJfeAPDPu9dXBc9
 ZxzcneUUabqPhmS/NHxT+UkmPdALzMdCc8aN2JHDWidU/LI=
X-Google-Smtp-Source: ABdhPJy8sEtObPTb7oepTJISI2si0swIZAMlfWtR4NZ2WWGhi6yeD5gIob4TqpWf1eEchb9chbXz39xB8k1ePtldsII=
X-Received: by 2002:a0c:eb11:: with SMTP id j17mr128872qvp.193.1590962753196; 
 Sun, 31 May 2020 15:05:53 -0700 (PDT)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Sun, 31 May 2020 15:05:42 -0700
Message-ID: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
Subject: UEFI support in ARM DomUs
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Nataliya Korovkina <malus.brandywine@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi!

with a lot of help from Stefano, we're getting RPi4 support in
Project EVE pretty much on par between KVM and Xen.

One big area that still remains is supporting UEFI boot sequence
for DomUs. With KVM, given the qemu virt device model this is
as simple as using either stock UEFI build for arm or even U-Boot
EFI emulation environment and passing it via -bios option.

Obviously with Xen on ARM we don't have the device model so
my understanding is that the easiest way we can support it would
be to port UEFI's OvmfPkg/OvmfXen target to ARM (it seems to
be currently exclusively X64).

So here's my first question: if there's anybody on this list who had
a hand in implementing OvmfPkg/OvmfXen can you please share
your thoughts on how much work that port may be (or whether it is
even feasible -- I may totally be missing something really obvious here).

And as long as I've got your attention: two more questions:
   1.. compared to the above, would porting pvgrub to ARM be any
   easier or more difficult?

   2. same question for teaching u-boot about PV calls.

Thanks,
Roman.

P.S. Oh and I guess between:
   0. OvmfPkg/OvmfXen on ARM64
   1. pvgrub on ARM64
   2. u-boot/EFI emulation with PV calls backend
I didn't miss any other obvious way of making UEFI-aware VM images
to boot on Xen ARM64 DomU, right?

