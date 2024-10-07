Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D05993116
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 17:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812174.1224894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpc9-0000Pc-AS; Mon, 07 Oct 2024 15:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812174.1224894; Mon, 07 Oct 2024 15:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpc9-0000Nv-6m; Mon, 07 Oct 2024 15:25:37 +0000
Received: by outflank-mailman (input) for mailman id 812174;
 Mon, 07 Oct 2024 15:25:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JJzu=RD=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1sxpc7-0000Np-VS
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:25:35 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 653d9468-84c0-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 17:25:34 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 51.2.8 AUTH)
 with ESMTPSA id D2e8f2097FPNuqs
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 7 Oct 2024 17:25:23 +0200 (CEST)
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
X-Inumbo-ID: 653d9468-84c0-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728314723; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Q9ojUWQuxhJOLieoG6J9uCcY5POJ6/6N6W6YqGe5YX6kjuQnXtxVO2YoyuXFf2OUTN
    I45DjvA1vaDdzdQ6DChCioz+fH+NA7BijAw1mAUq3UP/VjbkUq2+T/9VKFkFOOnzeou4
    FldZDv0wjwe8VpyuAk0p/cHysSV2KfxmHcDGmEHl8gmuV8/nhQ9l2OezMPfvTNYZ8U18
    3JxFXWMTgxZ6UvpQSmCk9e/hv6Mqt7FJLmVsiubMQMP0atMA1x15cEcZcOP07HsqeBlh
    ihhwI72+VJLWPFV5E91QN5kDRKGCjFkR7nl5qILrzitTrXKyng/zpQowqegxZO3vdEk3
    ZCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728314723;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FeyqiNHX8OGIR4enV6XOW6e4DYpDZvrYhLsY8C6tuoA=;
    b=C+jgREji1jcL8dMlYczMucByYGz6/cGdDpBXWEOQwGiD5LrjsUjQ8HFczEHyN3vwRm
    7GX6nuyVnrmg9459p4u9ZXiIVLSJkNGX7QAK+jks+it+5oPa1LzoZViczUrEib15EIud
    RoKEzCnK1JW0/2xnKQe8hsjAuzUCn1GLgNEITP+gU/4nqvpB6/DD+DOBcpd89J7seT7l
    mm7m7QdiobPXNn/FETR/cooBfJLBpClP+ldfOwqdClTFIogIL/85nKKIz/1WvraBepML
    nCfZwH8BNbIhPO68XIjdvwxfuVv249zYN/YkAJb/CxoFbpSPtEN+JOnSNrCK7SbuCHmt
    yfzQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728314723;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FeyqiNHX8OGIR4enV6XOW6e4DYpDZvrYhLsY8C6tuoA=;
    b=kDGFDPQ4Puda6+XX0ZgtwrYXskg9KlRwcMx0hGIGWwKZb7ir6MyqWXN3sbw10D57ht
    /SnNvS+ywIfS90U6mJGXldDn3m+l/mll0c3XQxARizOBWPiR1UFNbzsMvOfRuDgKLoIb
    EYJguqUWKqpdLiltMSSERje0aXr6y33umqy+P0KUzI49rHyTsIrGebnGdDdRbXO7oMJJ
    pbffACQ13Nep5appQS3nloSk4TXh68Co5rwdYTED4EbZr0Mv93VwwB4YbVb4P19xpPIm
    C3JKb0xaVMHrD9InO5ecE+jMJDaIFdX8chLCluMwDerFVBx0Vh+dUjV1ZGWhlFEMGM0W
    IcBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728314723;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FeyqiNHX8OGIR4enV6XOW6e4DYpDZvrYhLsY8C6tuoA=;
    b=gXU63sYL6l8cUDUKEQ1x62q7Xeus+gHbkWlb7MmDkNjtBvvsBxPnSig9Zl8FCw3Vm/
    zxO/cXDinLNzABvkVcAw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4x9Fz7RcwtehfOImJwE3/YIR5VTNLPLdtEAAwSMQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: use python-3.11 in Leap container
Date: Mon,  7 Oct 2024 17:25:09 +0200
Message-ID: <20241007152518.1416-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

python311 is available since Leap 15.4 as additional Python variant.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/opensuse/leap-15.6-x86_64.dockerfile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/automation/build/opensuse/leap-15.6-x86_64.dockerfile b/automation/build/opensuse/leap-15.6-x86_64.dockerfile
index ea70dffe2a..97890dfc00 100644
--- a/automation/build/opensuse/leap-15.6-x86_64.dockerfile
+++ b/automation/build/opensuse/leap-15.6-x86_64.dockerfile
@@ -3,6 +3,7 @@ FROM --platform=linux/amd64 opensuse/leap:15.6
 LABEL maintainer.name="The Xen Project"
 LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
+ENV PYTHON=python3.11
 ENV XEN_TARGET_ARCH=x86_64
 
 RUN <<EOF
@@ -25,7 +26,7 @@ RUN <<EOF
         gawk
         gcc
         make
-        python3
+        python311
 
         # Tools (general)
         git-core
@@ -53,8 +54,8 @@ RUN <<EOF
         # xentop
         'pkgconfig(ncurses)'
         # Python bindings
-        python3-devel
-        python3-setuptools
+        python311-devel
+        python311-setuptools
         # Ocaml bindings/oxenstored
         ocaml
         ocaml-findlib
@@ -68,7 +69,7 @@ RUN <<EOF
         ninja
         'pkgconfig(glib-2.0)'
         'pkgconfig(pixman-1)'
-        python3-packaging
+        python311-packaging
     )
 
     zypper install -y --no-recommends "${DEPS[@]}"

