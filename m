Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ED69B51AF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 19:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827796.1242521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qm9-0007sZ-OK; Tue, 29 Oct 2024 18:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827796.1242521; Tue, 29 Oct 2024 18:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qm9-0007pd-L6; Tue, 29 Oct 2024 18:17:05 +0000
Received: by outflank-mailman (input) for mailman id 827796;
 Tue, 29 Oct 2024 18:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5qm8-0007bP-4v
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 18:17:04 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe089983-9621-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 19:17:01 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2fb5a9c7420so54493031fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 11:17:01 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb63197bdsm4110171a12.70.2024.10.29.11.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 11:16:59 -0700 (PDT)
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
X-Inumbo-ID: fe089983-9621-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmEiLCJoZWxvIjoibWFpbC1sajEteDIyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZlMDg5OTgzLTk2MjEtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjI1ODIxLjI2Nzg1LCJzZW5kZXIiOiJhbGVqYW5kcm8udmFsbGVqb0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730225820; x=1730830620; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYiBaICmKjMQAw+x0zvFUjtQo2tj3LsRH3e85w48BTg=;
        b=UEGRIssyRtaXdu7ByOv36Cu0gO+fUaZNTmAX5GZ/dlGUAZ6UmA19xL9ezHpvyLztpx
         CTBuh0bgI2sijpdrUsCsLtK94oS8LGLsZr1dO/2J4u/1oJPRVVOZ1FO2vuywuw0wWo3+
         UYvKLb3outKP23d/YCDKFo4ipHVIjdrTE6Guo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730225820; x=1730830620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYiBaICmKjMQAw+x0zvFUjtQo2tj3LsRH3e85w48BTg=;
        b=am+BiYxdlvzthCpHzdpOI1n5Qy3TcJt0bb5WJocZNLU4goe6U9vogUabmPE/8tE5tn
         qEF/7aMaEepJN5+JagIRBYYCqzcjERevZVf+YAXVzR3YcLjFFz7RNF1SgdrwC2StAK6T
         QfZnq2d4a9byng78bPc1Ylq+oWdEjQpZquk7aNFEOgQBIWPYPjAD8X3z3j5IDIEi/RLh
         IwgOZJLdXeVAmXh27/HWEe9jl3Av9f4c4Z7bcNRlZ56Hwd3E5LfUK03Q2umrHt+/tgoG
         oMf96BgPmiSwL7E83k4JluyCdvHnQ22fgyTGNvWM0eXuK5n5+jcNZmVNcumCVFCYslqY
         SQww==
X-Gm-Message-State: AOJu0YyjIfAnzf4mwvR3I6bzDBtQM3uImhK23/rEiPb12OjxXN7EB2k/
	5rAcYVgFDNK2wQdqlnbce5roO6tvmA0JZanifIY23fNVFJvAxh4VC5PH5UEApyNartebWt40Gwr
	H
X-Google-Smtp-Source: AGHT+IHiH+WTS6e+1lzB3olW6ZDDUckMSuVBvpNDyrGNIcUwkJmLNUQNZY+BMzTWDMVji81H8BGkSg==
X-Received: by 2002:a2e:e02:0:b0:2fc:9622:794b with SMTP id 38308e7fff4ca-2fcbdfeaef3mr45935681fa.24.1730225820254;
        Tue, 29 Oct 2024 11:17:00 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 1/6] xen/domctl: Refine grant_opts into grant_version
Date: Tue, 29 Oct 2024 18:16:27 +0000
Message-ID: <20241029181632.69600-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

grant_opts is overoptimizing for space packing in a hypercall that
doesn't warrant the effort. Tweak the ABI without breaking it in order
to remove the bitfield by extending it to 8 bits.

Xen only supports little-endian systems, so the transformation from
uint32_t to uint8_t followed by 3 octets worth of padding is not an ABI
breakage.

No functional change

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/include/public/domctl.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 353f831e402e..b3c8271e66ba 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -90,11 +90,18 @@ struct xen_domctl_createdomain {
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
 
-/* Grant version, use low 4 bits. */
-#define XEN_DOMCTL_GRANT_version_mask    0xf
-#define XEN_DOMCTL_GRANT_version(v)      ((v) & XEN_DOMCTL_GRANT_version_mask)
+    /*
+     * Maximum grant table version the domain can be configured with.
+     *
+     * Domains always start with v1 (if CONFIG_GRANT_TABLE) and can be bumped
+     * to use up to `max_grant_version` via GNTTABOP_set_version.
+     *
+     * Must be zero iff !CONFIG_GRANT_TABLE.
+     */
+    uint8_t max_grant_version;
 
-    uint32_t grant_opts;
+    /* Unused */
+    uint8_t rsvd0[3];
 
 /*
  * Enable altp2m mixed mode.
-- 
2.47.0


