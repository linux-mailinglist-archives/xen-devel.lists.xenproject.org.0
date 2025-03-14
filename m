Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD4AA617A8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914963.1320577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8ss-0002CJ-Ul; Fri, 14 Mar 2025 17:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914963.1320577; Fri, 14 Mar 2025 17:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8ss-00029c-RP; Fri, 14 Mar 2025 17:31:46 +0000
Received: by outflank-mailman (input) for mailman id 914963;
 Fri, 14 Mar 2025 17:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8nV-0003IK-3V
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:26:13 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d0d8caa-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:26:12 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac2ed007aacso471710366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:26:12 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:26:11 -0700 (PDT)
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
X-Inumbo-ID: 6d0d8caa-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973172; x=1742577972; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xM6Gpx3RAeeK1cS7aS7L8nNeRymkrBxeUEa3FM/T9W8=;
        b=VwcO7GDdwGkhy8sl5JtDbfF8GMUPD1u4jETFbeHSOMNBguBHiK0oLrLHrVxnrAk0ES
         nDBd7whfajuc39g3QwL8iLmugkOaMJmrwXNluo7UO6zeawc5Aih4uyexsyrdEoHegxb6
         Sg9jakSdlCPK55VBqWwgkH9phzUDZdR5nzRlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973172; x=1742577972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xM6Gpx3RAeeK1cS7aS7L8nNeRymkrBxeUEa3FM/T9W8=;
        b=jaM4M9D+FUMa6uFA6y/Gl4XCyMFNgU9ej3zxCKKsK6a6aJ+/JHramQjgMwltNoKyyR
         CR/aSF+r1HWBwq7YZ9jxH/ji24Wdolv3dlkS869DoBzQ5NbqgBeXEtSuQVSW7za9MXqH
         Lyv3h1UTl3nG+iiBJiVMuvoCkOYXHU9UTbcvvGtODFdIPjK2c86F1GsjIVpcjgzRKHqC
         wkX5TS9/YmWIILjjNyvplp0bNR03vS+ql4kuicmdrftZtm4hy40q3kAQhytiIf2Kntj0
         yG1cDnxt1PHti1v2iizr7dwhIw990ryeTxNXiNsDsYF1i9eZ0G4I/ufvX/groQ2tNRPK
         dFvg==
X-Gm-Message-State: AOJu0Yzb4oMoVftWo3njCUcNB8WgGVCktdB/h0K0fahpisTNORk6479K
	SNqNReJ911WholptRg+tzhmjMBQktAc34/jbHgbM8HBEiSkeGE/QCbGjS1HHgc8oiuinWzwh+Q/
	+
X-Gm-Gg: ASbGncvbz/uvpdpq9tid1AaOkj7j4qwKPtO0UUqSS35qeoW0CaEPrZkBY5n+dybRhSX
	QgQ5e1aYxG7ip0QOVRkagg3bQ+I4j7Lpsq0dojCksaIA5BTCv4xGk/elVBY2wXb3mwsmvfPKH0h
	lXFNPVlsEoBGuYTzsIJ7JcVOoRJbytuaaW+VBjoNYyD2PjE6RN/Iy8YoBSLsT3DiuPYb4wP9MVx
	CLqTHywtexnaJgaUTDdq0r1ZYi1tH2LNJrKbWuQakS4+rsvOgg9bT25qqgTS5e9Zv2t2HrRq2K0
	3AgOSORi2To5FrEmt8YghyO9xuO8aODzaAmzWghrjZn/o7r9KCrxbLcZBSJge+nBqOY=
X-Google-Smtp-Source: AGHT+IGfbH9E97ClSGH+YxIoQoOpNF6fagjScq5vU+UIamVvniNyic7xwyEhG5dNza9bp8wEwncgRQ==
X-Received: by 2002:a17:906:4795:b0:ac3:2d43:2249 with SMTP id a640c23a62f3a-ac330104b97mr460261266b.2.1741973171738;
        Fri, 14 Mar 2025 10:26:11 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 11/11] docs/man: Document the new claim_on_node option
Date: Fri, 14 Mar 2025 17:25:02 +0000
Message-ID: <20250314172502.53498-12-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... and while at it, add missing relevant links to xl-numa-placement(7)
in xl.1.pod.in and xl.cfg.5.pod.in, which describes libxl's behaviour on
NUMA placement.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 docs/man/xl-numa-placement.7.pod |  8 ++++++++
 docs/man/xl.1.pod.in             |  2 +-
 docs/man/xl.cfg.5.pod.in         | 14 ++++++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl-numa-placement.7.pod b/docs/man/xl-numa-placement.7.pod
index 4d83f26d412e..287ad41e5071 100644
--- a/docs/man/xl-numa-placement.7.pod
+++ b/docs/man/xl-numa-placement.7.pod
@@ -173,6 +173,14 @@ soft affinity belong.
 
 =back
 
+It's possible to force memory to be allocated from a specific NUMA node via the
+"claim_on_node" option (See B<claim_mode> in L<xl.conf(5)> for more details on
+claims). "claim_on_node" associates the domain with a single NUMA node. Domain
+creation fails if not enough memory can be reserved in the node and memory is
+preferentially allocated from that node at runtime. The downside is that
+claiming memory on a node via "claim_on_node" doesn't automatically set
+soft-affinity for the vCPUs, so that must still be done manually for a fully
+optimised single-node domain.
 
 =head2 Placing the guest automatically
 
diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index fe38724b2b82..27a972486296 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -2012,7 +2012,7 @@ otherwise behavior is undefined.  Setting to 0 disables the timeout.
 The following man pages:
 
 L<xl.cfg(5)>, L<xlcpupool.cfg(5)>, L<xentop(1)>, L<xl-disk-configuration(5)>
-L<xl-network-configuration(5)>
+L<xl-network-configuration(5)>, L<xl-numa-placement(7)>
 
 And the following documents on the xenproject.org website:
 
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 7339c44efd54..c1ffc29d312a 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -278,6 +278,18 @@ memory=8096 will report significantly less memory available for use
 than a system with maxmem=8096 memory=8096 due to the memory overhead
 of having to track the unused pages.
 
+=item B<claim_on_node=NUMBER>
+
+Binds guest memory to a particular host NUMA node. Creation only starts if
+enough memory on this NUMA node can be reserved beforehand on the hypervisor.
+Failure to claim memory aborts creation early.
+
+See B<claim_mode> in L<xl.conf(5)> for further details on memory claims.
+
+Overriding B<claim_on_node> forces B<claim_mode> to be set on this guest and
+disables automatic NUMA placement (See L<xl-numa-placement(7)> for further
+details on NUMA placement and the effects of this option.)
+
 =back
 
 =head3 Guest Virtual NUMA Configuration
@@ -3143,6 +3155,8 @@ If using this option is necessary to fix an issue, please report a bug.
 
 =item L<xl-network-configuration(5)>
 
+=item L<xl-numa-placement(7)>
+
 =item L<xen-tscmode(7)>
 
 =back
-- 
2.48.1


