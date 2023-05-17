Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEFD705FA9
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 07:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535771.833770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzAAN-0001Fl-Ot; Wed, 17 May 2023 05:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535771.833770; Wed, 17 May 2023 05:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzAAN-0001E7-Ic; Wed, 17 May 2023 05:57:39 +0000
Received: by outflank-mailman (input) for mailman id 535771;
 Wed, 17 May 2023 05:57:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ox5N=BG=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pzAAM-0001Dr-1f
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 05:57:38 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7899ce0-f477-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 07:57:34 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4H5vPZnt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 17 May 2023 07:57:25 +0200 (CEST)
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
X-Inumbo-ID: b7899ce0-f477-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1684303045; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qlywIqirYfVvCXm0Ivti94KV4tzDKWLCMlCwPMFJdun/2rS+nCng0MKAIHL3B+FcY0
    8o+Vj83a3TyrZVgrnPWdzssR5RP7EeUqWh5dlSHwmw6WOQIxwUWBWWG7Bq5p0owFWKZu
    k0PoO1Q95CIkQX0SFeCqMColTRsXGjH4s0Jz1IPEXBi1+1//TJ12AvBz7gGYrS/40nk0
    MN+qnBgWCnGDF2M5ToixRx02hNHviPRfrrtOR4w8WxbgRDCgQ+eSwwGnKYLsfivmCjEY
    RvTDaLVYcMq3RvVBjYc+hPTutksK1I2lwWF2MExp4YuZ/bzt8Y1ywyPwqjwq70ml3sx4
    j13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1684303045;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Si4oKzEcLlw3G7OffbBr/cajuDCVeN0U6l5SUR78nAw=;
    b=AzW7el+eUWgRP9yjV4N2FbrHj4pQ6TSsLgUOhC/fbDto32rXB8ohUTapHshdcnWA8C
    af7MJXrmxDIcLT4tZm32srvRfkqgze6tyn9nEkPmDzosf/GnLQ5nDhQKLtAzimX6o6CH
    VyEcWNhz3VZ0mAxGUQNa7iB/QS7fgSr9m3Al3+PVdiE3dGtGxkBslt/SdhUsY+9jIlwV
    F30/Z8dt2qRXvgsaby/iiCAiQ+MBxePc8GIm/dpfYxGPgJqeVTkdNkCCKcnkRmIyoWqW
    jMkom84ypZOhOvA2oByFd4h2h3wp6xgwjBr3E5p0JidQSGoBZUBiBvZjODIcSsbpjbyr
    s1nQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684303045;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Si4oKzEcLlw3G7OffbBr/cajuDCVeN0U6l5SUR78nAw=;
    b=cK8PWqXLm6G7PUJClO6dj/gvsZ2LUCvNXolrEwEKuPMoJGbh2r/YfHmxmbAmJd0Aku
    /i2AqE2u4mr8AdPJ2h/yXSm8MQFn3U+hbG8tX8AynhHQmeuGHTjPNI5GmXyGT9t9PCu9
    3DRCwloIDr4wKVHlEJqi32BeTwGbhHZwzDIvFJCI0mOsepErbZ+MhwQi7epxJYkzlIVA
    ZXdysazhahNC7dZ87zQwz2S0QOx6wmyGbexaA+3ohBI2YvAGiDqZe4Hwh3dHJBc0D5bu
    El4Z2yxesbkSUPhgG6k1Tmc1kM+lcdw+iuy+Uy1IadfLkjXYLnnWNmr/Td6ZbcUgU/hp
    kXUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684303045;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Si4oKzEcLlw3G7OffbBr/cajuDCVeN0U6l5SUR78nAw=;
    b=8J8jANwHgUY1QrchMr3OqwFXj4RT8+LbEUz+hEHpS7Nzy6WXiGu8saAxCz32A/u5jt
    gfpAF9dKSVQYNV23apBg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvx4Sq0NeWsWjIFVg=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: allow to rerun build script
Date: Wed, 17 May 2023 05:57:22 +0000
Message-Id: <20230517055722.4057-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Calling build twice in the same environment will fail because the
directory 'binaries' was already created before. Use mkdir -p to ignore
an existing directory and move on to the actual build.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/scripts/build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 197d085f3e..9085cba352 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -36,7 +36,7 @@ fi
 cp xen/.config xen-config
 
 # Directory for the artefacts to be dumped into
-mkdir binaries
+mkdir -p binaries
 
 if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Cppcheck analysis invokes Xen-only build.

