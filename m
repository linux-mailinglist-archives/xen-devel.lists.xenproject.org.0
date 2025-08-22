Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B88B31A20
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 15:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090160.1447532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upS7d-0007se-7t; Fri, 22 Aug 2025 13:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090160.1447532; Fri, 22 Aug 2025 13:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upS7d-0007r9-4m; Fri, 22 Aug 2025 13:48:01 +0000
Received: by outflank-mailman (input) for mailman id 1090160;
 Fri, 22 Aug 2025 13:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OzNX=3C=bounce.vates.tech=bounce-md_30504962.68a8750a.v1-5b37ed1022e84a30a8896c5e2e05a47c@srs-se1.protection.inumbo.net>)
 id 1upS7a-0007r3-Om
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 13:47:58 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9afeac70-7f5e-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 15:47:56 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4c7hMt2BmWzBsTpGV
 for <xen-devel@lists.xenproject.org>; Fri, 22 Aug 2025 13:47:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5b37ed1022e84a30a8896c5e2e05a47c; Fri, 22 Aug 2025 13:47:54 +0000
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
X-Inumbo-ID: 9afeac70-7f5e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755870474; x=1756140474;
	bh=c5OS5QfxagAVStqr0nZdnCF+x0ODYhCsWNPi1ffj+Is=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=tr2UTFzTOLWezURzk98M+VMWIRhvDQdVpad2yYYO86pVtpLYpm8n9h0fpBwVFVYim
	 BDfpa3m1FerjO79A2jCW/IpYO5XEawe/bABGMaF0c/S5/EyNNsnGtW28e31DlhK8fo
	 /Y0JSOz+c6k02POsKMp6k3OCmvnUIbjapNVoGwwPxPgLW7yu0urA0dSTcf2O3ZQqXT
	 Zph/fkxnxB6yibYypIiSwzcsm8hfFEa0fxEegtlQqzm92Dl7qusv/IwvDf/rkMmMCj
	 SqUEEBXgEAzcP6TVzn8TzwkDWlTgad9h7yTiTtFB3qHtczxgdirq0i8iWQsdGjMg1g
	 48EA5YjNLGtqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755870474; x=1756130974; i=teddy.astie@vates.tech;
	bh=c5OS5QfxagAVStqr0nZdnCF+x0ODYhCsWNPi1ffj+Is=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=JzmlAM4pSpa/3Q0hJ7oTycPdEllPvdp9wc+nOTLPPYuAWe4SCXrZDeP2UM6RzH9Fy
	 JbF8jLDyVsPmJdq8/rnNEsM2/jvTfCZ6NEEJ5WvwLKCyiErX0/UmGoKZTHIoZ/5PQY
	 l9N4yyxaq1gdsewFh4WwUT/S7bGDu/NjAwA2M1lwWyqeVUPRGI82X+uzKA1k6CffLY
	 LCj4NwT3au6/6937E1zkLu+Z3JC548wzDhyxCp+xB4IewenMlG4YIQD9GVm9JqShK2
	 UsWm/lprfBkSamTqDrTcdAYhVaL8LSJuO9Y+1vx20JCDcgsDReqbGK46MqLsCfqTkO
	 XJ6rov1rVCKXg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20hvmloader:=20Update=20to=20SMBIOS=202.6?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755870473308
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5b37ed1022e84a30a8896c5e2e05a47c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250822:md
Date: Fri, 22 Aug 2025 13:47:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).

In Linux, if the SMBIOS version is >= 2.6, the GUID format is used, else
(undefined as per SMBIOS spec), big endian is used (used by Xen). Therefore,
you have a endian mismatch causing the UUIDs to mismatch in the guest.

$ cat /sys/hypervisor/uuid
e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
$ cat /sys/devices/virtual/dmi/id/product_uuid
3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
$ cat /sys/devices/virtual/dmi/id/product_serial
e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7

This patch updates the SMBIOS version from 2.4 to 2.6 and fixup the UUID
written in the table; which effectively fix this endianness mismatch with
OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
This effectively changes the UUID seen with UEFI guests as it was
actually inconsistent with SeaBIOS and SMBIOS expectations.
---
 tools/firmware/hvmloader/smbios.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 6bcdcc233a..f4822ae6f8 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -352,7 +352,7 @@ smbios_entry_point_init(void *start,
     memcpy(ep->anchor_string, "_SM_", 4);
     ep->length = 0x1f;
     ep->smbios_major_version = 2;
-    ep->smbios_minor_version = 4;
+    ep->smbios_minor_version = 6;
     ep->max_structure_size = max_structure_size;
     ep->entry_point_revision = 0;
     memcpy(ep->intermediate_anchor_string, "_DMI_", 5);
@@ -462,7 +462,23 @@ smbios_type_1_init(void *start, const char *xen_version,
     p->version_str = 3;
     p->serial_number_str = 4;
 
-    memcpy(p->uuid, uuid, 16);
+    /*
+     * Xen uses OSF DCE UUIDs which is fully big endian, however,
+     * GUIDs (which requirement is clarified by SMBIOS >= 2.6) has the
+     * first 3 components appearing as being little endian and the rest
+     * as still being big endian.
+     */
+    /* First component */
+    for ( unsigned int i = 0; i < 4; i++ )
+        p->uuid[i] = uuid[4 - i - 1];
+    /* Second component */
+    p->uuid[4] = uuid[5];
+    p->uuid[5] = uuid[4];
+    /* Third component */
+    p->uuid[6] = uuid[7];
+    p->uuid[7] = uuid[6];
+    /* Rest */
+    memcpy(p->uuid + 8, uuid + 8, 8);
 
     p->wake_up_type = 0x06; /* power switch */
     p->sku_str = 0;
-- 
2.50.1



 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


