Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BD1577E89
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 11:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369427.600840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMwk-0006x5-52; Mon, 18 Jul 2022 09:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369427.600840; Mon, 18 Jul 2022 09:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMwk-0006u1-1R; Mon, 18 Jul 2022 09:21:46 +0000
Received: by outflank-mailman (input) for mailman id 369427;
 Mon, 18 Jul 2022 09:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeUa=XX=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDMwh-0006tv-Ud
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 09:21:44 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09595e06-067b-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 11:21:42 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id x10so12407334ljj.11
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jul 2022 02:21:42 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a2ea4d5000000b0025a6e47056csm2012190ljm.124.2022.07.18.02.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 02:21:41 -0700 (PDT)
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
X-Inumbo-ID: 09595e06-067b-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zlJEKutNY9pVuug6Mt5ewgM5fGaIPrNI9KwDTjr6eZQ=;
        b=q6NIJsqw9/m/lD1D3dwpC/s3rbbYzCq0t6AXddu1NPSNyvdOFiIen44qEhGj+XeWxL
         +S83phBdKn3A9swVP8DnonoacaP9FYyNHwKFe+Iuu6mBtUZB5YQPX5gIYIC8mXikJynG
         wzkctJSi6in50zlGVvu2PEhl8uyzUIyliN0qSIc7Q645TRRdW7R/xlI/A+xqdrQfcYaU
         KPdnJYK8CsvSakOy/SDgRlr994JZ0nhyjlqtKBeQ60QYtGy7RSGx2AcT5PBnjRse1XJ7
         KiZIU62WYh3KiNRFQGhqbcilXXf1+vwzmabtGGlttm8HObv9Z9TZXTip5nnbBNGSXygK
         5kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zlJEKutNY9pVuug6Mt5ewgM5fGaIPrNI9KwDTjr6eZQ=;
        b=099DUQuL8utmFRq0OnR185iCfxy0HdalLbcScqs5cjSXLGvQXBmt9hoQ7FW7r1f6di
         UxcY1lT9EZlGl7tnbJmcZIhMLXZ/qNT2dm4DU2DK6rQVhLHBPV21Y8JliqaU81nvnnvX
         0e2P9ho691X/ONRj3o92OAHcbyaqAeU5MXNj/IxbVA48cKZLQBFVCAC7POkEw2MMLhp5
         y+Sw6OjAzoUT+t86EvMQgI1a0365bOsNYVYwsHUXqp96d0y4/uVqvbY735FCr9QVfWwJ
         0ZK2EDqSm94lzVdH1PXaWnvJCQoiTmkqN5jMyv27hrZNy7ya7avYVu2rdNk5q4HFPEmp
         F7vw==
X-Gm-Message-State: AJIora/W/lLp5TABCUytSCIJOm10GMbTtmEUu69QYjESny9x5G1mwYEs
	j2DeYj/T3a9MZ2iA7Ki1UgKuHJp+Vmpv6A==
X-Google-Smtp-Source: AGRyM1taznRmUP5tNMGMb7q0aG1XElsMhXGCfKn5LZr37uGgPIFVls8VpEhKNy5FlWbp3YN8pqMvMg==
X-Received: by 2002:a05:651c:23b:b0:25d:6920:2b06 with SMTP id z27-20020a05651c023b00b0025d69202b06mr11732155ljn.226.1658136101706;
        Mon, 18 Jul 2022 02:21:41 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] golang/xenlight: Update generated code
Date: Mon, 18 Jul 2022 12:21:25 +0300
Message-Id: <20220718092125.307310-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Re-generate goland bindings to reflect changes to libxl_types.idl
from the following commit:
54d8f27d0477 tools/libxl: report trusted backend status to frontends

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 tools/golang/xenlight/helpers.gen.go | 12 ++++++++++++
 tools/golang/xenlight/types.gen.go   |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index dece545ee0..33fe03971f 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1774,6 +1774,9 @@ x.ColoPort = int(xc.colo_port)
 x.ColoExport = C.GoString(xc.colo_export)
 x.ActiveDisk = C.GoString(xc.active_disk)
 x.HiddenDisk = C.GoString(xc.hidden_disk)
+if err := x.Trusted.fromC(&xc.trusted);err != nil {
+return fmt.Errorf("converting field Trusted: %v", err)
+}
 
  return nil}
 
@@ -1815,6 +1818,9 @@ if x.ActiveDisk != "" {
 xc.active_disk = C.CString(x.ActiveDisk)}
 if x.HiddenDisk != "" {
 xc.hidden_disk = C.CString(x.HiddenDisk)}
+if err := x.Trusted.toC(&xc.trusted); err != nil {
+return fmt.Errorf("converting field Trusted: %v", err)
+}
 
  return nil
  }
@@ -1899,6 +1905,9 @@ x.ColoFilterSecRedirector1Outdev = C.GoString(xc.colo_filter_sec_redirector1_out
 x.ColoFilterSecRewriter0Queue = C.GoString(xc.colo_filter_sec_rewriter0_queue)
 x.ColoCheckpointHost = C.GoString(xc.colo_checkpoint_host)
 x.ColoCheckpointPort = C.GoString(xc.colo_checkpoint_port)
+if err := x.Trusted.fromC(&xc.trusted);err != nil {
+return fmt.Errorf("converting field Trusted: %v", err)
+}
 
  return nil}
 
@@ -2028,6 +2037,9 @@ if x.ColoCheckpointHost != "" {
 xc.colo_checkpoint_host = C.CString(x.ColoCheckpointHost)}
 if x.ColoCheckpointPort != "" {
 xc.colo_checkpoint_port = C.CString(x.ColoCheckpointPort)}
+if err := x.Trusted.toC(&xc.trusted); err != nil {
+return fmt.Errorf("converting field Trusted: %v", err)
+}
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 253c9ad93d..bb149547fd 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -652,6 +652,7 @@ ColoPort int
 ColoExport string
 ActiveDisk string
 HiddenDisk string
+Trusted Defbool
 }
 
 type DeviceNic struct {
@@ -718,6 +719,7 @@ ColoFilterSecRedirector1Outdev string
 ColoFilterSecRewriter0Queue string
 ColoCheckpointHost string
 ColoCheckpointPort string
+Trusted Defbool
 }
 
 type DevicePci struct {
-- 
2.25.1


