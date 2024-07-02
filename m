Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4C9238F8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 10:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752113.1160244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOZJL-0003dN-Ix; Tue, 02 Jul 2024 08:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752113.1160244; Tue, 02 Jul 2024 08:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOZJL-0003aP-Fj; Tue, 02 Jul 2024 08:56:27 +0000
Received: by outflank-mailman (input) for mailman id 752113;
 Tue, 02 Jul 2024 08:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cybj=OC=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1sOZJK-0003aE-L0
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 08:56:26 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5d68751-3850-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 10:56:25 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 50.5.0 AUTH)
 with ESMTPSA id D05b2e0628uA6j7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 Jul 2024 10:56:10 +0200 (CEST)
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
X-Inumbo-ID: f5d68751-3850-11ef-958a-bbd156597b9e
ARC-Seal: i=1; a=rsa-sha256; t=1719910570; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=X1Chy8gsUBYWg9sUq+UPu00Xrp63smdO1Y0qlpi0ZLqP118AZDlZEtWtiTbbI8v1Kx
    GFxV8D0Vo80yvTRBd81nR4PycuWZtNYQE3nRvQJivukIOZwIhU6Pk3MQejPnMTJ48un4
    bpzSZyVlBRRy/aFeIMyaEa17/19kmFi3Qg5DXjA5YA3t04m5MXnZE+BU1s8xxW1wKTMR
    7E8ajAsPFlzyy6ZSzfbXXhKhDzOuTLXeb+YqObaiKlMxpU3igWwp1vRQGfjHb/1SUeNP
    r2SiHJTgChp11XVIMvBG4ce7X8qEBwYzR8UZN0WWxxBbVg5lOk098JGmZL2HV6reyvya
    3LHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1719910570;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=k6iXn1DFM7GI0kwzUJdFy5LNSyTfcJ6+z4wH8gquviY=;
    b=HmS2DqaKqIP1yr2cmU0rf0w7PIlW0d5r/drLcS3Tr1aP1VuD3H93mmfp2kQHmYJFTI
    7TY1wA92IX/vccUxM5bqJYTCxNB1zESM8IYwlOW52bwbi87hHDpmWe5cOF29Lu+aSFMx
    OpR2ZCZeLpL0iXDbkX209fKy69qRvsuCFIJFbKUAMoOeZMAC3yMrjTrqYfZep14LlVcE
    Esq/8Rsup5GiwzolOUtrNcMqshUCuGGKVTEPwoS3IqyC58SmZ58sgH4BcmLbEMbrrSlF
    9AO6Z1T+LRMSNFmyJrXjeLxw8M172tiH33giylZ/cJmgtljDs8EvZvEmcz3MJ2CQc/ae
    XP9g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1719910570;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=k6iXn1DFM7GI0kwzUJdFy5LNSyTfcJ6+z4wH8gquviY=;
    b=D3UwwyR+zyeJ+QAqU/NPLqzm8u8CRj2NKS4azHvEITcVYIS9PM8B2K5FxSxVnnN5oS
    BtMZlT8cQkZav65hWUrLNttIfxG1iO0VSTrwRoNYKRWjxBaP6asphF8pDWBsMXr/YNuc
    ljUd8drSfDzzN4i63+kHtl4cCwtZq6Dx6xPj6mLMYMHM8WxJun7lUD0T1/MnY5OvAG50
    i8U/fdXRrqx7fLsfIQWiqYGx5oiaxb8NpcTZ/eF7w5AKYsvFcvlTvWoq5tBZzjMJPu+L
    PMATt3dsJG5R7fjF2nPiduvDHnhVmewacuaMX5+a7eHnc8fVeMxlZDHv1wv6IGK3ncSE
    V/iw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1719910570;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=k6iXn1DFM7GI0kwzUJdFy5LNSyTfcJ6+z4wH8gquviY=;
    b=az+WgZVCeKM43PB9AinGjww1PoWlhuiTinyUlSIUwGvlvj/iUI1vY+fM/3ac36velG
    wLCZo2pojUl9V6p7QRDw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4w9Fn7FJotZZVcwVP8B1Lhzkl9HG5EATJPpni8Vg=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: add python3-packaging to suse images
Date: Tue,  2 Jul 2024 10:56:08 +0200
Message-Id: <20240702085608.3612-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The qemu-xen build system uses gdbus-codegen, which relies on 'packaging'.
Make sure it is available.

[188/2647] Generating ui/dbus-display gdbus-codegen with a custom command
FAILED: ui/dbus-display1.h ui/dbus-display1.c
/usr/bin/gdbus-codegen ../qemu-xen-dir-remote/ui/dbus-display1.xml
  --glib-min-required 2.64 --output-directory /build/tools/qemu-xen-build/ui
  --interface-prefix org.qemu. --c-namespace QemuDBus
  --generate-c-code dbus-display1
Traceback (most recent call last):
  File "/usr/bin/gdbus-codegen", line 53, in <module>
    from codegen import codegen_main
  File "/usr/share/glib-2.0/codegen/codegen_main.py", line 30, in <module>
    from . import dbustypes
  File "/usr/share/glib-2.0/codegen/dbustypes.py", line 22, in <module>
    from . import utils
  File "/usr/share/glib-2.0/codegen/utils.py", line 22, in <module>
    import packaging.version
ModuleNotFoundError: No module named 'packaging'

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/suse/opensuse-leap.dockerfile       | 1 +
 automation/build/suse/opensuse-tumbleweed.dockerfile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 1344cbb0d1..0eea74be15 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -59,6 +59,7 @@ RUN zypper install -y --no-recommends \
         'pkgconfig(sdl)' \
         'pkgconfig(sdl2)' \
         python3-devel \
+        python3-packaging \
         python3-setuptools \
         # systemd-devel for Xen < 4.19
         systemd-devel \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 2587a3fa4f..caf0d42ce1 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -60,6 +60,7 @@ RUN zypper install -y --no-recommends \
         'pkgconfig(sdl)' \
         'pkgconfig(sdl2)' \
         python3-devel \
+        python3-packaging \
         python3-setuptools \
         # systemd-devel for Xen < 4.19
         systemd-devel \

