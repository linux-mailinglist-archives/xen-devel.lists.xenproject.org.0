Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F0E6F7193
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 19:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529859.824755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pud7i-0001yj-OI; Thu, 04 May 2023 17:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529859.824755; Thu, 04 May 2023 17:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pud7i-0001vf-Ld; Thu, 04 May 2023 17:52:10 +0000
Received: by outflank-mailman (input) for mailman id 529859;
 Thu, 04 May 2023 17:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rz6h=AZ=citrix.com=prvs=481809c50=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1pud7h-0001vZ-Nu
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 17:52:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6249d2d0-eaa4-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 19:52:08 +0200 (CEST)
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
X-Inumbo-ID: 6249d2d0-eaa4-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683222728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+AX9GvpkHcVGZxhJWoF4UtlFKnkzWIF8vzMgw+7xYOc=;
  b=aap9eJAVbs8F9CGsX8ah4EbpcAsTYOtLZjds/HH3wWnIsz77bpllewow
   mTGE0v4EYmuln3+hUayJ69gt5hMBYH4oYyigdJ1asz3xZtiX1cc0+c8RU
   N3dByxeiIWoDr1vxp/B9VgLRaFReKb3occ9aq3fSDwYAusnU3AH+B+OFO
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106662397
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:zg5HPako7D49vO6JQTWjybHo5gz6JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLWDzXbvuNMDT1LYwlPYq28E4E68fRytdmHVds+yhmFSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5AOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aQKMCA0ZBuJvOun6eyraPRyt4cFLPC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH9fjteqVyYv+w37nLZwRZt+LPsLMDUapqBQsA9ckOw/
 zqYoTqjWUBFXDCZ4Rmo+HmFgrHioQ32ALgOBKGy/dh3uHTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOtsYwSSY7y
 1yhkNbgBDgpu7qQIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8b1gDXXu9pG6SOh8zcRyHS3
 i677w4+vuBG5SIU7JlX7Wwrkhr1+MiSFldvtlqINo62xlgnPdD4PuRE/XCetK8dd9jBEzFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sx28zaK7ogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKPoEXPsAoLFfYrXwGiaus4owQuBJ0zfFX1
 WmzKK5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eK0XOy+PiOLEDFbMEOdtDbd7RrxhhE9yiFmPo
 ok32grj40k3bdASlQGOqNZDcQxTcClibX00wuQOHtO+zsNdMDlJI5fsLXkJIOSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:zh6RuKzQm7WbWefKIc4cKrPwPb1zdoMgy1knxilNoH1uH/Bw8v
 rE9sjzuiWE6wr5J0tQ++xoVJPvfZq+z/JICOsqXYtKNTOO0FdAR7sM0WKN+Vzd8iTFh4tg6Z
 s=
X-Talos-CUID: 9a23:KvKc+WOS/WiKae5DADt/5HceEcoee2z0kmfyPlGJSkBpcejA
X-Talos-MUID: =?us-ascii?q?9a23=3ALSFyTw3swXulUMv1MqChcaVVVTUjwImkA2kJz7g?=
 =?us-ascii?q?6lcTcDzBgJz2WqimPa9py?=
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="106662397"
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Jennifer Herbert
	<jennifer.herbert@citrix.com>
Subject: [PATCH v4 0/2] acpi: Make TPM version configurable.
Date: Thu, 4 May 2023 17:51:44 +0000
Message-ID: <20230504175146.208936-1-jennifer.herbert@citrix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This patch series makes the TPM version, for which the ACPI library probes,
configurable, and then add support for TPM version 2.

Changes from version 3:

* Omit tpm_version 0 case, to fallback to 1.2,  previously intended for
  compatibility for unknown code.
* Add checks for xenstore tpm_version field.
* Convert copyright header to SPDX
* Minor code style fixes.


Jennifer Herbert (2):
  acpi: Make TPM version configurable.
  acpi: Add TPM2 interface definition.

 docs/misc/xenstore-paths.pandoc |  10 +++
 tools/firmware/hvmloader/util.c |  39 +++++++++---
 tools/libacpi/Makefile          |   3 +-
 tools/libacpi/acpi2_0.h         |  33 ++++++++++
 tools/libacpi/build.c           | 106 +++++++++++++++++++++++---------
 tools/libacpi/libacpi.h         |   4 +-
 tools/libacpi/ssdt_tpm2.asl     |  27 ++++++++
 7 files changed, 184 insertions(+), 38 deletions(-)
 create mode 100644 tools/libacpi/ssdt_tpm2.asl

-- 
2.39.1


