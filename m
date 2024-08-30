Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A557965D52
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786326.1195916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyGI-00085c-9y; Fri, 30 Aug 2024 09:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786326.1195916; Fri, 30 Aug 2024 09:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyGI-00080r-5i; Fri, 30 Aug 2024 09:49:46 +0000
Received: by outflank-mailman (input) for mailman id 786326;
 Fri, 30 Aug 2024 09:49:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n/bQ=P5=bounce.vates.tech=bounce-md_30504962.66d195b4.v1-f9f7dc8716dc4b379193f41ae648c972@srs-se1.protection.inumbo.net>)
 id 1sjyGH-0007tp-4W
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:49:45 +0000
Received: from mail135-11.atl141.mandrillapp.com
 (mail135-11.atl141.mandrillapp.com [198.2.135.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eb485ab-66b5-11ef-99a0-01e77a169b0f;
 Fri, 30 Aug 2024 11:49:43 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-11.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WwCzm510tzLfH1CD
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 09:49:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f9f7dc8716dc4b379193f41ae648c972; Fri, 30 Aug 2024 09:49:40 +0000
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
X-Inumbo-ID: 2eb485ab-66b5-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725011380; x=1725271880;
	bh=VlT/ir/7U6EdnF9VDO79yZehSnEW7U7FvGLlDvPzdzw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QRCvx3LU1EwOCSLzrhiFFrSXbErABl51Zodxvm2XU9fSax6u4zOhYAezlFWxkP9+w
	 uYgXvknqDRkVHF+V6rDq8r1Hc5V9zHeuVS+sSe983khev9Diip8BmDsMwdNGndIDQc
	 puS2R4FHXwhr0G+/l5FwK59LwlxF9rzOr+W8bH6VYZzQ8nB9NWx/HGHTGsL2bBzNio
	 2nO3WLOYzHX0Wh+K2qoZA1oab1CdtQ1IJJ3Bv5SJzpYtMTQIp3iBxEBI513xRSDYLV
	 f7OjFXovXIVzHMopgeeJRtfEn77XfSX5yK0BwkNcW4s/jn87o5aGDLxjR89IWZ7pYC
	 bytgYPVJX0sFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725011380; x=1725271880; i=anthony.perard@vates.tech;
	bh=VlT/ir/7U6EdnF9VDO79yZehSnEW7U7FvGLlDvPzdzw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qVD1zClVj8yqMkqQXZXRwln0O676M8GtNYllnPrdWXJwxE1/7MJzNavIdtLURDRZi
	 rKvd/VPApa1H2bXgY3isk/MQpebJ5ntXeMhXxSB8eIcqOe6ZPuSF2polu11hCaTx0X
	 ybnSPI7U2egZ9o3sAXCJKH66Z6p0oWSfRCvXWQHeI03HAZO3cwPfyxmxGtCWQG3Px2
	 O8zKN9Iqcn3hHmqiL2HIiduIXsg4O4VzDCmSfW9RXp8ty83RecmekAgOz44YxUHVQu
	 HNK0bHljzL5dyNBDSaIBiT+FdILT6vmqfJnGwKBSM+KM+FSSOIMVoqnJCPzkd1o6K6
	 N1h4Akp7WCp3g==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=202/2]=20libxl:=20Probe=20QEMU=20for=20-run-with=20user=3Duser=20and=20use=20it?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725011379928
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>
Message-Id: <20240830094937.40476-3-anthony.perard@vates.tech>
In-Reply-To: <20240830094937.40476-1-anthony.perard@vates.tech>
References: <20240830094937.40476-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f9f7dc8716dc4b379193f41ae648c972?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240830:md
Date: Fri, 30 Aug 2024 09:49:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

"-runas" is deprecated since QEMU 9.1 and will be remove in a future
release.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---

Notes:
    v2:
    - rename "qemu_cmdline" to "qemu_opts" in struct field and func
      parameters.

 tools/libs/light/libxl_dm.c       | 12 ++++++++++--
 tools/libs/light/libxl_internal.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 15b157060f..1f2f5bd97a 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2052,8 +2052,13 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         }
 
         if (state->dm_runas) {
-            flexarray_append(dm_args, "-runas");
-            flexarray_append(dm_args, state->dm_runas);
+            if (qemu_opts->have_runwith_user) {
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
                     dmss->qemu_opts.have_runwith_chroot = true;
                 }
+                else if (!strcmp("user", libxl__json_object_get_string(o))) {
+                    dmss->qemu_opts.have_runwith_user = true;
+                }
             }
 
             /*
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 0133c57e01..089a2f949c 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4145,6 +4145,7 @@ typedef struct libxl__dm_spawn_state libxl__dm_spawn_state;
 typedef struct libxl__qemu_available_opts libxl__qemu_available_opts;
 struct libxl__qemu_available_opts {
     bool have_runwith_chroot;
+    bool have_runwith_user;
 };
 
 typedef void libxl__dm_spawn_cb(libxl__egc *egc, libxl__dm_spawn_state*,
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

