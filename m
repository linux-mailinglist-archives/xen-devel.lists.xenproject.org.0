Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B795A38015
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890172.1299177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyLt-0001pw-G9; Mon, 17 Feb 2025 10:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890172.1299177; Mon, 17 Feb 2025 10:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyLt-0001nD-DO; Mon, 17 Feb 2025 10:27:49 +0000
Received: by outflank-mailman (input) for mailman id 890172;
 Mon, 17 Feb 2025 10:27:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kh3E=VI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1tjyLr-0001n7-Kh
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:27:47 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3d47573-ed19-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 11:27:45 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3098088c630so13635331fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 02:27:45 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.151.154])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a39d1dfd2sm285771fa.48.2025.02.17.02.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:27:43 -0800 (PST)
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
X-Inumbo-ID: d3d47573-ed19-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739788065; x=1740392865; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxqqmfmkX3ZeSqvoxwHhQJEOsttNrAJ3ATYW/mXkYxA=;
        b=fGul6WKAv0GU//0iqYsppnqdPTlOweMxRsOSakEfyZoLmikundc4bGmrXSTZ2InKbu
         HFdXZS17+2l0VlEtxY5btJlXuKAng35A7FeWAc4y1bUG32Yaun7bpoYFjs+ufLZEcmQC
         +ga0YTm0Yuq7SyuDl5lcXkurboyT+z1OnjDnTGI6m9PBDg4hN26QfuKRfxjnklywgpyk
         +60CY6FEthnjQi/+Zk5v/SMwoYv1tlmk3bgo8LafNC4GHYUDdW5cKtb0Lu71xPnUda0S
         9jJwRUVZBdY3PHTlWbrOFpdtRRF50bqY7GZmMsiIPicuW/0y5VdzdbzjLkE6lWju3K5V
         QnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788065; x=1740392865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxqqmfmkX3ZeSqvoxwHhQJEOsttNrAJ3ATYW/mXkYxA=;
        b=sd5gDJP6GH7TyvpMUgGAd4Es4PQXHN8/ohONRPm5ppMwPPUSSWtnJ196urE06O63Hr
         Ru9pb9wu41EM+oEDqB+p3PKjE9npWoNOv0MrJA6vFiNPCTueMQJ/vWYDdnnkZ2sTQxcf
         GlIoCRgGQRVhbR3n4sLzBDQbMvQvmadJI+JHCCm8qD+0rC4Cwuz3gUSeB7kFkhhuVYx4
         OWfehMgKQzMkPHZudZC3gtYiLBNrhXl5JQwH1Yjlp7Lui2bGCEV9At0VNBx23vpkpUxw
         W9epF5841d8ZjLgWukGbiIk7pkAtNYcdMIagzEW+/UZqWg5bfed7m7T5MCrm8XkeM33g
         Y+cw==
X-Gm-Message-State: AOJu0Yx/baKF33VQUk+nVi/TES15lTa/ckFDa535/TIi3k3eY6R/aKSs
	vNELU2pZ1ZCRlBBNQClcP1UeWS0qSjPlSEIxhvMv2Q1CP9vdw1IYM4r/ag==
X-Gm-Gg: ASbGncvTK0Fbnojqz+FADNRQRAp40AASDXuYYk0jBxCmIU4DDvpgfFXWm4BWRPVrU1B
	lzwR2ToMCpJWkBNHpdH2J6AmxS3zTzmZGP+SL7HjxYF4cTk4JyK6wCap8ysDs/YiYHBNojHrCmJ
	3dZN1EvLQtqTZVFbJTgAR53DhLOg0+/7fKMNjM+KXxVuQyKtJIxYeIZiupBTxrGkkXvr9vAKgyV
	WE7t5MoMtetzOjCwn7Ksoxb6qUf2+Xb1JUShpDlzW2tIbz8ORz4wF63wZIiNpsPDVQWyULY8Yqc
	99JgI34/fR+LQuQF0bs=
X-Google-Smtp-Source: AGHT+IF2lYNrqFKgnIJMw+M2luQkfWrHpvaxfceP4/FYehhlWqpzJe1IOL32p8Pw9hmoPGkakUD0zg==
X-Received: by 2002:a2e:380f:0:b0:309:1ee1:3512 with SMTP id 38308e7fff4ca-30927b197bbmr23293921fa.26.1739788064509;
        Mon, 17 Feb 2025 02:27:44 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH V2] xen/memory: Make resource_max_frames() to return 0 on unknown type
Date: Mon, 17 Feb 2025 12:27:41 +0200
Message-Id: <20250217102741.4122367-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is actually what the caller acquire_resource() expects on any kind
of error (the comment on top of resource_max_frames() also suggests that).
Otherwise, the caller will treat -errno as a valid value and propagate incorrect
nr_frames to the VM. As a possible consequence, a VM trying to query a resource
size of an unknown type will get the success result from the hypercall and obtain
nr_frames 4294967201.

Also, add an ASSERT_UNREACHABLE() in the default case of _acquire_resource(),
normally we won't get to this point, as an unknown type will always be rejected
earlier in resource_max_frames().

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
  V2:
   - add R-b
   - add ASSERT_UNREACHABLE() in the default case of _acquire_resource()
     and update commit desc regarding that
   - drop post-commit remark
---
---
 xen/common/memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index a6f2f6d1b3..8ca4e1a842 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1157,7 +1157,7 @@ static unsigned int resource_max_frames(const struct domain *d,
         return d->vmtrace_size >> PAGE_SHIFT;
 
     default:
-        return -EOPNOTSUPP;
+        return 0;
     }
 }
 
@@ -1240,6 +1240,7 @@ static int _acquire_resource(
         return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
 
     default:
+        ASSERT_UNREACHABLE();
         return -EOPNOTSUPP;
     }
 }
-- 
2.34.1


