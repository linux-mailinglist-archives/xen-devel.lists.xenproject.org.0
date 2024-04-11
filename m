Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEAA8A1888
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703992.1100065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwIR-0000yI-4b; Thu, 11 Apr 2024 15:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703992.1100065; Thu, 11 Apr 2024 15:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwIR-0000vS-0o; Thu, 11 Apr 2024 15:25:03 +0000
Received: by outflank-mailman (input) for mailman id 703992;
 Thu, 11 Apr 2024 15:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdS7=LQ=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1ruwIO-0000Mi-Vu
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:25:00 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a94b3a9d-f817-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 17:25:00 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343f1957ffcso637264f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 08:25:00 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([2.223.45.79])
 by smtp.gmail.com with ESMTPSA id
 jg25-20020a05600ca01900b004169836bf9asm5719725wmb.23.2024.04.11.08.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 08:24:58 -0700 (PDT)
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
X-Inumbo-ID: a94b3a9d-f817-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712849099; x=1713453899; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMI7WvuqX+Ej2NliaNj//U1NPJxEWYxQSV37pRh8e88=;
        b=A54e6Qbi8vS0XHwDt5zEPlOxtmBD5qlokbEMDT3+gQgsS1kArRjYYh93wtlXmGiTtw
         QUAP/0hgGbsIeOHLp1fkvq0RLiY/T3/ivJd81apiSpjJ+NW05hUjin9M432CcNURgQcC
         615sDvQRBubPKAM/HzblisNirAPqHuo2HC3sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712849099; x=1713453899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMI7WvuqX+Ej2NliaNj//U1NPJxEWYxQSV37pRh8e88=;
        b=U1OSs1kUARYrFy/X8spjk+obmbFou4bdds3dw75H6x1TV46M+cFhPPsRSDJxUnBILS
         GLAfGgzfzdYZ56yASay8A9nIMFZjxa7Rolqos8g1XGPWl2JBO2LeTYTZ5HqNtJaNVD4U
         XAD4FC9FtzfCmiAG+7fgkRNitF247b1WMZ1qEUxRj2NLyOmWSQ8p6IL7fo8MovfVLCMi
         f47nqyz4Xm6YRvksPZwno8riZa/SxZCBCV62blOZQ6PVE/80pqlI1froFlWTDkJLy4jA
         xXRBrQppW5CvYLC9aIZG19TLVtfxfCKKBpjkkbsfSQFpx5kFxmg/n5GZTyS4VKvBbrOg
         EbMg==
X-Gm-Message-State: AOJu0YyUc65SfdgR9LaVePRmoJNtO2Wunda/2mxgpCMH5SZMwUoVaqdh
	DJpyHnriGDcIglcWza17QUlA1lQts31+TihG4wLTzgQEhWPu3+AXoZkuwo+Oy0w8qGq34OZ3Wz3
	6
X-Google-Smtp-Source: AGHT+IH9Mnb75ahazlimxXm3WRe8tx+doVjGN9xELFybPpFETKZAgljT3+Hbi7moF1U4URfho75FWA==
X-Received: by 2002:adf:cc89:0:b0:343:8bd6:97cf with SMTP id p9-20020adfcc89000000b003438bd697cfmr2238148wrj.35.1712849099350;
        Thu, 11 Apr 2024 08:24:59 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH 2/2] tools/lsevtchn: Use evtchn port upper bound for evtchn enumeration
Date: Thu, 11 Apr 2024 16:24:11 +0100
Message-Id: <bc201c67ef728ebaf678eac4d97e6800a95e8081.1712840924.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712840924.git.matthew.barnes@cloud.com>
References: <cover.1712840924.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lsevtchn terminates the loop when the hypercall returns an error, even
if there are still event channels with higher port numbers to be
enumerated over.

Use the highest allocated event channel port number for a given domain
to bound the loop so that all relevant event channels can be enumerated
over.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 tools/xcutils/lsevtchn.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/xcutils/lsevtchn.c b/tools/xcutils/lsevtchn.c
index d1710613ddc5..7f8ad7c8e7ce 100644
--- a/tools/xcutils/lsevtchn.c
+++ b/tools/xcutils/lsevtchn.c
@@ -11,6 +11,7 @@ int main(int argc, char **argv)
     xc_interface *xch;
     int domid, port, rc;
     xc_evtchn_status_t status;
+    xc_domaininfo_t info;
 
     domid = (argc > 1) ? strtol(argv[1], NULL, 10) : 0;
 
@@ -18,13 +19,16 @@ int main(int argc, char **argv)
     if ( !xch )
         errx(1, "failed to open control interface");
 
-    for ( port = 0; ; port++ )
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
+        errx(1, "failed to fetch domain info");
+
+    for ( port = 0; port <= info.highest_evtchn_port; port++ )
     {
         status.dom = domid;
         status.port = port;
         rc = xc_evtchn_status(xch, &status);
         if ( rc < 0 )
-            break;
+            continue;
 
         if ( status.status == EVTCHNSTAT_closed )
             continue;
-- 
2.34.1


