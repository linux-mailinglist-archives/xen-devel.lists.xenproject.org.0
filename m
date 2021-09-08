Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A025C4041AF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182404.329936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6rp-00053o-Dc; Wed, 08 Sep 2021 23:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182404.329936; Wed, 08 Sep 2021 23:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6rp-00050c-9v; Wed, 08 Sep 2021 23:20:33 +0000
Received: by outflank-mailman (input) for mailman id 182404;
 Wed, 08 Sep 2021 23:20:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=39dd=N6=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mO6rn-00050U-Vj
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:20:32 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5b4f9728-10fb-11ec-b18c-12813bfff9fa;
 Wed, 08 Sep 2021 23:20:29 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-k9Fk0EiOM2OnB9yNGWAc7Q-1; Wed, 08 Sep 2021 19:20:27 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso30514wma.9
 for <xen-devel@lists.xenproject.org>; Wed, 08 Sep 2021 16:20:27 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s7sm16447wra.75.2021.09.08.16.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:25 -0700 (PDT)
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
X-Inumbo-ID: 5b4f9728-10fb-11ec-b18c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631143229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vRoi5WrTbIXmM4WjAcv/SppS1KuoM6iQfhbpZ457xYQ=;
	b=ZgpUEbRQi5VpwPemN4cpd8DV4KvE0Qt0ufwHkVeS8WMItrjXojAB+Lt1b+6uESLbvqbxUv
	fvDuhgmgQyVRDCceaJ90JNkn2hSlHRZz1ibd1ZYtAkYJ3q8Ns72anq9kGrPzY6Cg/PNX19
	tzeKJoOKQ3w85uH3sCirjGThqrgnc/M=
X-MC-Unique: k9Fk0EiOM2OnB9yNGWAc7Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ByN3Of2ZgwJxeRnuvE2fFlKqpGdp9A80ERs6ZdUaDo=;
        b=Qos5RLMvNCe+978ZrzCEkh/589yrXoJ7/OaBEZYQ5vLC2Z7HEGfcdzUnvOP60NIVvH
         RcQuwC61xTMx+84jBqvI1mzJwtqUO5MFqtyqnhJFHFMzs0f9sDjjlnDIrcCpfYCEfC9f
         bIKXjnrWOeM2gEEiBdgPYCC/Fo9xzC2IIqeJ3bLZlVSv1zIdnPdOAJhtwNfDthmAIbsC
         ntCOCLmWS9TWOQzQiXpxoOvNG4rUocGwJZl3im5ZBKp2Psuo05CEFeh6VRRd8qYGLVOJ
         Kg2cmSIPWYQm7dmH2cXaejI/Hp9dM7pgXQC2uKX6e5QyA1vYjLCz7UBn9+CCODruWWYo
         y+ng==
X-Gm-Message-State: AOAM530Oa0fhUgqDSyS8lCeRFXYSS/kiFPp0WB3qYTRwX1L5daLoVUa8
	zFowBQj8G2MpVNuYVTvnJMYT4LqiJ+Ew1Lx7oESVqSBP+1Y6URXpIFDb95lihgdcL7GtUJDVt/h
	Eo2eOGKG+LEwr3+U1rdTNtd+eRUM=
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr116905wrj.72.1631143226207;
        Wed, 08 Sep 2021 16:20:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJzCKhor1xK77PrKMQ04S9HdElVG3wG7IduY7aZzH1YZcWGdPgvZWSbOwy0GcAZECXsMDD+g==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr116900wrj.72.1631143226045;
        Wed, 08 Sep 2021 16:20:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 00/10] security: Introduce qemu_security_policy_taint() API
Date: Thu,  9 Sep 2021 01:20:14 +0200
Message-Id: <20210908232024.2399215-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,=0D
=0D
This series is experimental! The goal is to better limit the=0D
boundary of what code is considerated security critical, and=0D
what is less critical (but still important!).=0D
=0D
This approach was quickly discussed few months ago with Markus=0D
then Daniel. Instead of classifying the code on a file path=0D
basis (see [1]), we insert (runtime) hints into the code=0D
(which survive code movement). Offending unsafe code can=0D
taint the global security policy. By default this policy=0D
is 'none': the current behavior. It can be changed on the=0D
command line to 'warn' to display warnings, and to 'strict'=0D
to prohibit QEMU running with a tainted policy.=0D
=0D
As examples I started implementing unsafe code taint from=0D
3 different pieces of code:=0D
- accelerators (KVM and Xen in allow-list)=0D
- block drivers (vvfat and parcial null-co in deny-list)=0D
- qdev (hobbyist devices regularly hit by fuzzer)=0D
=0D
I don't want the security researchers to not fuzz QEMU unsafe=0D
areas, but I'd like to make it clearer what the community=0D
priority is (currently 47 opened issues on [3]).=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1] https://lore.kernel.org/qemu-devel/20200714083631.888605-2-ppandit@redh=
at.com/=0D
[2] https://www.qemu.org/contribute/security-process/=0D
[3] https://gitlab.com/qemu-project/qemu/-/issues?label_name[]=3DFuzzer=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  sysemu: Introduce qemu_security_policy_taint() API=0D
  accel: Use qemu_security_policy_taint(), mark KVM and Xen as safe=0D
  block: Use qemu_security_policy_taint() API=0D
  block/vvfat: Mark the driver as unsafe=0D
  block/null: Mark 'read-zeroes=3Doff' option as unsafe=0D
  qdev: Use qemu_security_policy_taint() API=0D
  hw/display: Mark ATI and Artist devices as unsafe=0D
  hw/misc: Mark testdev devices as unsafe=0D
  hw/net: Mark Tulip device as unsafe=0D
  hw/sd: Mark sdhci-pci device as unsafe=0D
=0D
 qapi/run-state.json        | 16 +++++++++=0D
 include/block/block_int.h  |  6 +++-=0D
 include/hw/qdev-core.h     |  6 ++++=0D
 include/qemu-common.h      | 19 +++++++++++=0D
 include/qemu/accel.h       |  5 +++=0D
 accel/kvm/kvm-all.c        |  1 +=0D
 accel/xen/xen-all.c        |  1 +=0D
 block.c                    |  6 ++++=0D
 block/null.c               |  8 +++++=0D
 block/vvfat.c              |  6 ++++=0D
 hw/core/qdev.c             | 11 ++++++=0D
 hw/display/artist.c        |  1 +=0D
 hw/display/ati.c           |  1 +=0D
 hw/hyperv/hyperv_testdev.c |  1 +=0D
 hw/misc/pc-testdev.c       |  1 +=0D
 hw/misc/pci-testdev.c      |  1 +=0D
 hw/net/tulip.c             |  1 +=0D
 hw/sd/sdhci-pci.c          |  1 +=0D
 softmmu/vl.c               | 70 ++++++++++++++++++++++++++++++++++++++=0D
 qemu-options.hx            | 17 +++++++++=0D
 20 files changed, 178 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


