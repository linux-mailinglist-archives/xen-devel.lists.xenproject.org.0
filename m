Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69986ADB5A0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 17:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017387.1394371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRBux-00018B-38; Mon, 16 Jun 2025 15:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017387.1394371; Mon, 16 Jun 2025 15:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRBux-00015z-0Y; Mon, 16 Jun 2025 15:38:39 +0000
Received: by outflank-mailman (input) for mailman id 1017387;
 Mon, 16 Jun 2025 15:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/Gb=Y7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uRBuv-00015n-5P
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 15:38:37 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f79c8d12-4ac7-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 17:38:36 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so26175165e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 08:38:36 -0700 (PDT)
Received: from gmail.com (140.red-213-97-47.staticip.rima-tde.net.
 [213.97.47.140]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4534172d2b0sm79261785e9.35.2025.06.16.08.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:38:33 -0700 (PDT)
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
X-Inumbo-ID: f79c8d12-4ac7-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750088315; x=1750693115; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BTegug9VPi89e7lnmIXpFYt93qHuv9g7x2+kH7rDCJs=;
        b=Q0zbBsX9Jp2OO8mYDTNyTTCr/xxHychJTtmlEa642a0F4JNkKXjyXaX+ZPXZ9noAtJ
         4l9hXy9MoJgJebaZ21g8/oW03U060VhMwTN4o38ydqGy+Prw8/sj/7OXWoQC12/h3lbj
         wN/MQWEYpUsAwaFHLhUhXjqBCH17b0fTkksjfdcp6AiIIKwpp2O3ycnYWdNqemFNCTMT
         kIs4j34h8Wvusq8oePmlzeF8ZqpDSGmcRA/m/9gn5hfUlj/UK5Wy2UShxSzn5evqr77r
         n7NnF7WUwMMcv5dhaVlPvx/w/ENfh2LQlg3JVUJQMBCZm5P24Dvsz/1xWhyqq/dgixl2
         mYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750088315; x=1750693115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTegug9VPi89e7lnmIXpFYt93qHuv9g7x2+kH7rDCJs=;
        b=lO6GE4JYtc56ZlprNY+CM7iP3eUu4KQPa/sIJrXxzptqy6Xmv3ZdmkcltQbu60H/Cw
         NP1aOqtRrBS/jL6yn92CrEWW2pEvozkz134H9dWzSjTF9xC43IDaUlr8Qz3/LTyDRYVv
         VlS9XoGTXw53xcLkA62LQWU6lbwEqhVTvpBW5a13KHl6tHBooKmcLKaQ8fxl6c0CAnVZ
         ybbvdSp3be6CzqlwH0++CYBtmW9Ki+CzklFZGH7hVsg3+ZCrPtww8tmL35Ocp/d1kC+9
         uUOj7Mhzc619vREQa/tceOK/Q0q8SQNuchv9AXn8+KiKcIzVMn9bCqnZ/ZHmIshS24au
         /o6w==
X-Gm-Message-State: AOJu0YztwONO7gnVTROScn8eZ7+rCBPXjJNbQ8ucg55kK5NZzCTQG3ca
	wU9yXCRNpi7P6CK3M6FWewO8Ot7Q1+Ux2bJwAAzP1Pu6RjehapqoVUesTVw/tnBovxU=
X-Gm-Gg: ASbGncu6/llFPQKJql/uLicwHbWvkLVPguolXvcoCTb5EC9A9+gf50UE+df2Bg2Tzn6
	Fh8rlYsDEaRHYmZQcZ6hs43YyvjJcPFlUvzrYy306AShlhquV1uvmajBWZbmWxTMNd81CuL7FXG
	069YvRnwT3JT8Vo4guib8++IUHqk4SeFq6XXgAq+01ToBpNCtMkRpZxdqKKrBt92amWVO0Ymupc
	VJXhrb4eWSivoLxhG5hm/WMae3DrZG0FxRMXaOxA0PwpvCyXan/hlL3ZBintpsMGEd+f9/mrdi0
	0wgp5aVwcoOVikG99/4+7Y6yVawm3XsHkn04d864XM5uenuqTB+bTcxGHfan74QHho5ylR2FGaX
	vlpjx2vxLsCY9QuM0eQdgPDiOUTcgpxcfla8agD6RimI=
X-Google-Smtp-Source: AGHT+IFk0wAxcNwNljpT5PLOuRIPHNbq07VVNpKRd+rORL5fvAS0VfLSoBP9Fnz5j/bvqvybfP3OVQ==
X-Received: by 2002:a05:600c:350f:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-4534f580000mr21613725e9.31.1750088314330;
        Mon, 16 Jun 2025 08:38:34 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	rosbrookn@gmail.com,
	gwd@xenproject.org,
	edgar.iglesias@amd.com
Subject: [PATCH v5 0/5] xen/arm: Add option to optionally disable trapping on unmapped acceses
Date: Mon, 16 Jun 2025 17:38:21 +0200
Message-ID: <20250616153826.404927-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This follows up on the virtio-pci discussion and adds a per-domain
option to select the behaviour of accesses to unmapped address ranges.
The new option is trap_unmapped_accesses, it's general but for now
only implemented for ARM.

I'm happy with any name, so if you have better ideas please suggest them!

I've included regenerated golang bindings as a separate patch.

Thanks,
Edgar

ChangeLog:

v4 -> v5:
* Reorder RB and AB tags to chronological order
* Rebase with master

v3 -> v4:
* Reject in x86 arch_sanitise_domain_config
* Add LIBXL_HAVE_TRAP_UNMAPPED_ACCESSES
* Remove "..is only implemented for ARM" from Arm specific documentation
* ARM -> Arm

v2 -> v3:
* Reword descriptions to clarify reads of all bits as ones
* Use GENMASK as GENMASK_ULL not needed
* Style fix in if/else
* Regenerate golang bindings
* Update ocaml bindings

v1 -> v2:
* Rename trap_unmapped_mmio to trap_unmapped_accesses
* Generalize to allow other archs to later support this option
* Change dom0less DT binding from boolean to integer
* Remove changes to autogenerated go bindings

Edgar E. Iglesias (5):
  xen/arm: Add way to disable traps on accesses to unmapped addresses
  xen/arm: dom0less: Add trap-unmapped-accesses
  tools/arm: Add the trap_unmapped_accesses xl config option
  tools/ocaml: Update bindings for CDF_TRAP_UNMAPPED_ACCESSES
  tools/golang: Regenerate bindings for trap_unmapped_accesses

 docs/man/xl.cfg.5.pod.in              |  9 +++++++
 docs/misc/arm/device-tree/booting.txt | 10 ++++++++
 tools/golang/xenlight/helpers.gen.go  |  6 +++++
 tools/golang/xenlight/types.gen.go    |  1 +
 tools/include/libxl.h                 |  7 +++++
 tools/libs/light/libxl_arm.c          |  3 +++
 tools/libs/light/libxl_create.c       |  3 +++
 tools/libs/light/libxl_types.idl      |  1 +
 tools/libs/light/libxl_x86.c          |  6 +++++
 tools/ocaml/libs/xc/xenctrl.ml        |  1 +
 tools/ocaml/libs/xc/xenctrl.mli       |  1 +
 tools/xl/xl_parse.c                   |  3 +++
 xen/arch/arm/dom0less-build.c         | 10 ++++++++
 xen/arch/arm/domain.c                 |  3 ++-
 xen/arch/arm/domain_build.c           |  3 ++-
 xen/arch/arm/io.c                     | 37 +++++++++++++++++++++++++--
 xen/arch/x86/domain.c                 |  7 +++++
 xen/common/domain.c                   |  3 ++-
 xen/include/public/domctl.h           |  4 ++-
 19 files changed, 112 insertions(+), 6 deletions(-)

-- 
2.43.0


