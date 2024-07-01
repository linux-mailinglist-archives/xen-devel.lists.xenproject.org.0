Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263091E3B0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 17:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751785.1159853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIkl-0004bl-8y; Mon, 01 Jul 2024 15:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751785.1159853; Mon, 01 Jul 2024 15:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIkl-0004ZY-6G; Mon, 01 Jul 2024 15:15:39 +0000
Received: by outflank-mailman (input) for mailman id 751785;
 Mon, 01 Jul 2024 15:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AicS=OB=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1sOIkj-0004ZS-2f
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 15:15:37 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c36d5e70-37bc-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 17:15:34 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 50.5.0 AUTH)
 with ESMTPSA id D05b2e061FFK4IO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 1 Jul 2024 17:15:20 +0200 (CEST)
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
X-Inumbo-ID: c36d5e70-37bc-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1719846920; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NfGJEFgOQeMhtW75r6Yt8k5KrZ//HpIhNTPfoUBaU2x2d6F3THxqDF7Qg+oLCo+EDo
    Byi0ttLXvLKFeayRvF0YKU5laPwL6b23nIf4KIhx3l+kdC/Oswf0BoiaXvpT+NR2gyY6
    DIzNhUMaHndXWXz1cTD8IxbhowvTLHefSIDynlpaL27AAl618sROoF4cw+xVAWAw7Jcc
    1D3hBGj1Eapvh3lnumizXOK209jwc+ALnvLT25StYdqbtLRN/2J8GX6TQwK/JWWEwyc1
    FZZltwZcoyDtGaQN3WH6s3AdyhD4cG8En62Dll8DUct89NPszROk73btDbmcTnYR/4R2
    Cj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1719846920;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=uJiBvu+hRQwDsB2UAz0MIQ0TDFuj6+MY2d7PtVNHFqY=;
    b=U5d/kFXEwklWtu97ubHRQYLhBtiuXNA/IKNmvuNULcBCxluRqbOHJmOXfZWcIHkGgb
    2qM+I6YH15Cr4YFNtnBFYZOORLp+LcBD4IJPmLHb6GAi/jTQPvjpaqFbqludIbdY8c9B
    oGU48W7T/TrWtna2ALls2DahUGRaV2AlaI/MHpgQmmQka8GNGuvtFyFQNeX1crvjeQc0
    zfhPK7W99CXWve29Rpwwu1uQkQqmMlHV6z98o0aa8Zb5fmyu5PBXW0gjInzsx/TJjwlD
    QfXVtzRXiXKDy5wWNH63LErC/HZPgFCD+Pc3JCCr3qsbQYIzhuZfeKeVNjHY9p+TbP6c
    mFmQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1719846920;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=uJiBvu+hRQwDsB2UAz0MIQ0TDFuj6+MY2d7PtVNHFqY=;
    b=Q0upiTUXow7iZdpc1B3/r6lMYAyjCiHCh0B7R/BLY2LMTcFp2h5h8ryFkRkrsZ20ic
    ZVCYASfQqr+82HTfMxI+Y8bReeLgT9JCVvOyqUgQdz1kCa017dxmPNVSKwnPLLjzdJr+
    4OJ/qjBFudiscVmtbe2y30KTgQqkiyRHq3M916L9p+2L9pF2KE2qXcUl2StomDxkp5GG
    7fMg98dWTCLbxLcLk8oy6FW5QBGXspdgVRHsl8riFVHhHteUlf3HsX2NIWhBODtH1HRU
    mWtv+UFnteK2fG/ItDJkXOtI08sBSnDwICz8Ps9fp8taJuh/V2YCfxQ3p9dc6tn602uL
    WLGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1719846920;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=uJiBvu+hRQwDsB2UAz0MIQ0TDFuj6+MY2d7PtVNHFqY=;
    b=YsLoizHoA07OO26J/Dk0ZN+wkqF1i6j6x2n2hygaQuFdEQV1vBvjotB1YPT5BqACVL
    +/8zXsEZjw/q0qG5K9Dw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4w9Fn7FJotZZVcwVP8B1Lhzkl9HG5EATJPpni8Vg=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: add findutils to suse images
Date: Mon,  1 Jul 2024 17:15:12 +0200
Message-Id: <20240701151512.10187-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The build system uses find(1). Make sure it is available.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/suse/opensuse-leap.dockerfile       | 1 +
 automation/build/suse/opensuse-tumbleweed.dockerfile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 3ef33458a0..1344cbb0d1 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -20,6 +20,7 @@ RUN zypper install -y --no-recommends \
         dev86 \
         diffutils \
         discount \
+        findutils \
         flex \
         gawk \
         gcc \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index a793601c87..2587a3fa4f 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -18,6 +18,7 @@ RUN zypper install -y --no-recommends \
         cmake \
         diffutils \
         discount \
+        findutils \
         flex \
         gawk \
         gcc \

