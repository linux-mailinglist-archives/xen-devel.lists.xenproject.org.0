Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA21A9606A2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 12:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783748.1193031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sit32-0001Hp-Hb; Tue, 27 Aug 2024 10:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783748.1193031; Tue, 27 Aug 2024 10:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sit32-0001An-D3; Tue, 27 Aug 2024 10:03:36 +0000
Received: by outflank-mailman (input) for mailman id 783748;
 Tue, 27 Aug 2024 10:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KoKo=P2=bounce.vates.tech=bounce-md_30504962.66cda473.v1-7a4fed8f626b46239c7b9e69b01f9ae2@srs-se1.protection.inumbo.net>)
 id 1sit31-00015q-61
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 10:03:35 +0000
Received: from mail137-25.atl71.mandrillapp.com
 (mail137-25.atl71.mandrillapp.com [198.2.137.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e1e1761-645b-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 12:03:33 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-25.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4WtNR76f1nz35hVnw
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 10:03:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7a4fed8f626b46239c7b9e69b01f9ae2; Tue, 27 Aug 2024 10:03:31 +0000
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
X-Inumbo-ID: 9e1e1761-645b-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724753011; x=1725013511;
	bh=7a7nuSCUMb6yGcZ2VY1VCSVSooNS7myyKwj7gupd9Sg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BGl8ryRR8i+E7ZDBck6IQcBpLcF7nJhe9aNl7Atc7IPLP5tJve2KWslIHkZhrNSpt
	 FBqu3KVR+wKIk1YoqQof2d2XmmgNGag2tzWa9KxmYZfJN4K5sAddc4X2GTya+C0z+n
	 5u3O2EiihYVjoqlImseIYDzlWIn1evXFJmQ2bmfs5Y+C6ogF4bNK3xmxOzA5eyhh/O
	 LF2vnRuXr/FsdjrMHiG2mUvDGFUnfOM0xv013wa/1UTuFlybQUcYsy8q5ncmpwKV3L
	 uDw3c6VMVFm58oSpcyqXQWougpegSvtCtOuvkJWbUTomErFlyF8doih1DqxlQbzpGc
	 BJRQncYbAJ7ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724753011; x=1725013511; i=anthony.perard@vates.tech;
	bh=7a7nuSCUMb6yGcZ2VY1VCSVSooNS7myyKwj7gupd9Sg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PxNbPq0ciuLpzcFi2jahKY47ZkV3O+eLoj7WjM0TS3f4tMY687kk7L2Je0U8907ZX
	 1Nwdo00OUAWYyovSKthcRagcR6oze3zcrUFMIIEdi0u+MtGnHvsilE5g7CeaFeGeeX
	 RdMn3N2ipWooszNxQkKFbGr1TdYkl+6f5Z44Dga64qfEC8ahJRh+d8HEpIfyuu6HbA
	 8UrktSRjdT6e2vJzOgffTJZ0BSlPyZrSQ+P8Af8OF/aLEoVq5MzCo0aDPclGRGelDm
	 hvzEMQJVFIZXTQs+WLfgpNzlm1c6wEmIfW+tN1B9SYbPrhiPzf1t5EZ1tQaLW55lbt
	 loSlDQDBRChxg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=203/3]=20libxl:=20Probe=20QEMU=20for=20-run-with=20user=3Duser=20and=20use=20it?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724753011426
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Message-Id: <20240827100328.23216-4-anthony.perard@vates.tech>
In-Reply-To: <20240827100328.23216-1-anthony.perard@vates.tech>
References: <20240827100328.23216-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7a4fed8f626b46239c7b9e69b01f9ae2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240827:md
Date: Tue, 27 Aug 2024 10:03:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

"-runas" is deprecated since QEMU 9.1 and will be remove in a future
release.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libs/light/libxl_dm.c       | 12 ++++++++++--
 tools/libs/light/libxl_internal.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 298fbb84fe..49995b14b8 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2052,8 +2052,13 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         }
 
         if (state->dm_runas) {
-            flexarray_append(dm_args, "-runas");
-            flexarray_append(dm_args, state->dm_runas);
+            if (qemu_cmdline->have_runwith_user) {
+                flexarray_append_pair(dm_args, "-run-with",
+                                      GCSPRINTF("user=%s", state->dm_runas));
+            } else {
+                flexarray_append(dm_args, "-runas");
+                flexarray_append(dm_args, state->dm_runas);
+            }
         }
     }
     flexarray_append(dm_args, NULL);
@@ -3073,6 +3078,9 @@ static void device_model_probe_cmdline(libxl__egc *egc,
                 if (!strcmp("chroot", libxl__json_object_get_string(o))) {
                     dmss->qemu_cmdline.have_runwith_chroot = true;
                 }
+                else if (!strcmp("user", libxl__json_object_get_string(o))) {
+                    dmss->qemu_cmdline.have_runwith_user = true;
+                }
             }
 
             /*
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index df93d904c2..5c61050f79 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4145,6 +4145,7 @@ typedef struct libxl__dm_spawn_state libxl__dm_spawn_state;
 typedef struct libxl__qemu_available_cmd_line libxl__qemu_available_cmd_line;
 struct libxl__qemu_available_cmd_line {
     bool have_runwith_chroot;
+    bool have_runwith_user;
 };
 
 typedef void libxl__dm_spawn_cb(libxl__egc *egc, libxl__dm_spawn_state*,
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

