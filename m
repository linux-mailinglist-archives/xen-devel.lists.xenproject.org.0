Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65445851D6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 16:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377565.610846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHRM3-0003S4-UJ; Fri, 29 Jul 2022 14:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377565.610846; Fri, 29 Jul 2022 14:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHRM3-0003Pv-QS; Fri, 29 Jul 2022 14:52:43 +0000
Received: by outflank-mailman (input) for mailman id 377565;
 Fri, 29 Jul 2022 14:52:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHRM3-0002d8-0C
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 14:52:43 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18e78ef8-0f4e-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 16:52:42 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id z18so6099141edb.10
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 07:52:42 -0700 (PDT)
Received: from uni.router.wind (adsl-93.176.58.224.tellas.gr. [176.58.224.93])
 by smtp.googlemail.com with ESMTPSA id
 b1-20020a05640202c100b0043cf2e0ce1csm2415545edx.48.2022.07.29.07.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 07:52:41 -0700 (PDT)
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
X-Inumbo-ID: 18e78ef8-0f4e-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GCCV7/mK9rtHXdE9kEMUeWvjOVR5wqTBaJTKeZirpYg=;
        b=J7HOTc/CvY3r0oJ1iFXBL9banSVnmEsIZwTRcge9DNZKK6E0jPbu0QY70dQjhO2tXE
         tKbeR+Rvq36PG4XZJ+Tgl9eZUFItsM9LBmTLaSQWxxn/BT7tiU/tqSsqqRQDGnBqrTok
         YxYnI24wzSQeSb7/ZVzv0e5U0ZS1vzinKdINh+wT5HTFB80BHOlyeH5+X48RwUl0VYfe
         ILFddv/v1j/93wn1nFwHBTnI7AtgN9WT7PBprC2z/FhPpJRGfVqDljcI4qg//gGRQ+il
         CNvawqs3beCaFnbclLVfjbWmgrLt28VRXJY1ho9CpHeURA2S3Z+anLPEe0MTYoYWGlWd
         IXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GCCV7/mK9rtHXdE9kEMUeWvjOVR5wqTBaJTKeZirpYg=;
        b=OcrX2esoV2oc+nmp6iOqvfLeQ8chxmaHGBbqCmfjqcha2RSE0DN+fFWKI3isZtts1Z
         RtlM4P1IEsxlZWEq/Gndtk52/Sh+zcmjoyYCIK0Js+oO4MsiRlsn5UnX2KGIyWSG4HgN
         IEpoQKpomQsK7AQ+uSYU1wIkBaodsVtBIoDV5jb19upsFXwCIDlfWSclp7OmlIqoQje0
         rSpeBDtR46AV45C5rbGOMx6yJ54LcsJoWYLucIKnUD+ccFEmXseNzM5wWgDpe+B8V9yi
         QSvkxA62X+/oUDIjcZlOyhUlUcNxNVzMe56UmzbnhzCAHOiJuBApXscOL1upskbtnNnP
         WRWw==
X-Gm-Message-State: AJIora9ZK5TItC19S3oj0iY6K/qFrZcwH2bTz4dk3gXqSb1+Vu63vdyC
	lEb2Q+FHe+VR9cfOnPizzHSJtR99HuUEzA==
X-Google-Smtp-Source: AGRyM1t+I45xBeo8d53fj0L8uW99PlkRI+dLox2viFrmNXGXgezAHh5Q69dsQCchRO3fbLlZQiPE+A==
X-Received: by 2002:a05:6402:2687:b0:43a:6025:1658 with SMTP id w7-20020a056402268700b0043a60251658mr3851396edd.271.1659106361472;
        Fri, 29 Jul 2022 07:52:41 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/3] automation: qemu-smoke-arm64.sh: Fix the number of cpus in the device tree
Date: Fri, 29 Jul 2022 17:52:29 +0300
Message-Id: <20220729145229.1250221-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220729145229.1250221-1-burzalodowa@gmail.com>
References: <20220729145229.1250221-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qemu VM is configured with 2 cpus but the device tree passed has only 1.
Generate a device tree with 2 cpus.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
I am not sure for this patch because I do not know whether the number of cpus
differs deliberately.

 automation/scripts/qemu-smoke-arm64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index 7ac82b2278..b48a20988f 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -35,7 +35,7 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 ./binaries/qemu-system-aarch64 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
-   -m 1024 -display none \
+   -m 1024 -smp 2 -display none \
    -machine dumpdtb=binaries/virt-gicv2.dtb
 # XXX disable pl061 to avoid Linux crash
 dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
-- 
2.34.1


