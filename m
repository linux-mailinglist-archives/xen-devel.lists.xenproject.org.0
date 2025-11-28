Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A186C92EE1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 19:48:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175087.1499993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP3Vl-0006mR-Lb; Fri, 28 Nov 2025 18:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175087.1499993; Fri, 28 Nov 2025 18:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP3Vl-0006j8-IJ; Fri, 28 Nov 2025 18:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1175087;
 Fri, 28 Nov 2025 18:48:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vP3Vk-0006j2-5R
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 18:48:04 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c418ff76-cc8a-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 19:48:01 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42b3c5defb2so1525601f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 10:48:02 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47903c7360fsm102534325e9.0.2025.11.28.10.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 10:48:00 -0800 (PST)
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
X-Inumbo-ID: c418ff76-cc8a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764355681; x=1764960481; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CE3oLiGoDH4CJ9kO0CR+zhnnrVJUrSYvr0Gr7BXLtw=;
        b=irduyz+o/CxRhH2dOEA24VXAnU8ux50+o/Xx87VHulZ47b9mRBhSsIiydC4T7I8vAC
         veg2r0D3RsZLJ2UlvkYHgFM+JjhoyUcEbxBfAhOh0bYt3aeOkTIEfUrosEDZmDlukKMb
         RHhobDdO9t2DoyY0yT4Ikg5Jzq1L1sudLhW/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764355681; x=1764960481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CE3oLiGoDH4CJ9kO0CR+zhnnrVJUrSYvr0Gr7BXLtw=;
        b=EIqIk231VWOb/dN4zMthHGuUlDX/CnY1Z3brCUDYbGDa7NKO9vHwyL8FI9UODFDF5J
         mI5gaKYnZz+LW3nTcnPL/y7xIFGUw0gBRMmQ3cbyAebX13OxKi6NQvCTJfvW8KMjt88b
         1un1yEXui8q3LUgcRsbaxB98/JMLeyKbd4eikVFNCu0qQsdS87D/CuEfOYItFLK97gWd
         /JWShZSyKL0ED5zC+f6udin4HjsuJd4+u7OfOU3koVkHucEuug1PqMWALMNxmPnX5Dq1
         J6FEUl3Tail3g1QN1iTzP5j9YPfhdlapTYGgufqFj6KxC4huk4PmGe6T/NSB6Cra8zpM
         4XwQ==
X-Gm-Message-State: AOJu0YxT/YeBwyW1MZs6qAeO8ZbmwH+O35+XvbFmEsaj+ow7SgCKoMRa
	1muQU/UNFhu98Aske79IaP9OZQomzyhXVGgKdg6QJzMauq7yQwtDDTudfzGpE6aMe6sigGKEDxM
	GONGZ
X-Gm-Gg: ASbGncumbqe/J+eXZl4laSX5gLNVGE1xGf8O5t1OHtu8pUrcFSucLaycsyj7IZ6bZYT
	A91kSHqcF1GS1rVStBvpBYQgyC3h4rUO8rLr9RkvCBI1dPs14u1XyRGd29SZNtzPzLIZdwESeYR
	1x/7esfqU4g007WJMUX8/YP8KrEVUbN5+DO8mn9AhYY6Tvb2AnK10QtZoel8eZ/Unr5imaaTXSM
	miV7gHCVT4ZLCf166AKkxk7+EAXxPW0vhwqH4tZZk/ZMpYgQoR6nox3ipy0Gvp+xelk95QhRLl2
	PWdw0n+QP66lrKxzrLHWFgMqc8hD+QoALfVli59MoFMA8UKQNcVvqNBmZj0iI67Wcpwhmr73gIy
	B80N193w+XiT/gXALABWreHYNgAGqqc34tovbrH1zhFpUSbajbq71ZHlt+XpKSZEGpJVJImLIwY
	3UNScACSmHBUOHIk/1dbc3DU5J1IUmoCG0MORSyBv1m9K24zcl0BD9rYFFx2pNMQ==
X-Google-Smtp-Source: AGHT+IFaekO1BH+H/AsLV5jxikDRZcmVjXWBmNdU6MFKAEKPn9c4MMAyNvnLVTzj+EyDxpY46ldxCw==
X-Received: by 2002:a05:600c:1906:b0:46e:3550:9390 with SMTP id 5b1f17b1804b1-477c01d47c7mr262129785e9.20.1764355681358;
        Fri, 28 Nov 2025 10:48:01 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Krystian Hebel <krystian.hebel@3mdeb.com>,
	Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Subject: [PATCH 0/2] xen/lib: SHA2 cleanup, and SHA1 support
Date: Fri, 28 Nov 2025 18:47:55 +0000
Message-Id: <20251128184757.1243678-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pulled out of the Trenchboot series.

Andrew Cooper (1):
  xen/lib: Misc SHA2 cleanup

Krystian Hebel (1):
  xen/lib: Introduce SHA-1

 xen/arch/x86/cpu/microcode/amd.c |   2 +-
 xen/include/xen/sha1.h           |  14 ++
 xen/include/xen/sha2.h           |   4 +-
 xen/lib/Makefile                 |   1 +
 xen/lib/sha1.c                   | 215 +++++++++++++++++++++++++++++++
 xen/lib/sha2-256.c               |   8 +-
 6 files changed, 237 insertions(+), 7 deletions(-)
 create mode 100644 xen/include/xen/sha1.h
 create mode 100644 xen/lib/sha1.c

-- 
2.39.5


