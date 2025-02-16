Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E1A377C3
	for <lists+xen-devel@lfdr.de>; Sun, 16 Feb 2025 22:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889627.1298689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjm2s-00073P-BR; Sun, 16 Feb 2025 21:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889627.1298689; Sun, 16 Feb 2025 21:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjm2s-00070Z-83; Sun, 16 Feb 2025 21:19:22 +0000
Received: by outflank-mailman (input) for mailman id 889627;
 Sun, 16 Feb 2025 21:19:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1X1=VH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1tjm2q-00070T-Aq
 for xen-devel@lists.xenproject.org; Sun, 16 Feb 2025 21:19:20 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af0dec50-ecab-11ef-9aa5-95dc52dad729;
 Sun, 16 Feb 2025 22:19:19 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5461b5281bcso733211e87.3
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 13:19:19 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.151.154])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a28000328sm3658801fa.66.2025.02.16.13.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 13:19:16 -0800 (PST)
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
X-Inumbo-ID: af0dec50-ecab-11ef-9aa5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739740758; x=1740345558; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DygvENVbFrhexFyjzDq9AcmiXxF9RvTULW05F+o5r9o=;
        b=b6RAgsSkMsIG0Bi2JvQI7+XUL8FFZALpHIvdimjMjB90mlcNJv9XAPxSom+ZRZ5FJ1
         19seHOl2/k4mZf5gNbdQ716hL9a5/7F3U86aYsxnLkIanyOeB8rhtCnKuHo+rlHe1u78
         qlIBUV0hiIG7wUcsqjVDkvTVM566chaI+o9B435MkPcQE76h/fZ31F4grZ6do1BW+Rgm
         398cUT9MxIga3/2f2oYSXWYIGtuvA7JZULHNcv8Alvc2cFn0zzPIqhfxodVEORPc4oM9
         YrUAubZCbSbNx1r6NFnDNmjE5PnIyAQlzJeg05oFcTAjTWqJd7dg0upnkERIfsAfc3NJ
         Ejww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739740758; x=1740345558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DygvENVbFrhexFyjzDq9AcmiXxF9RvTULW05F+o5r9o=;
        b=NRNPv/LtyMFncHN2+rYgV5gwHJmXQEgmygIDcl6p5qMg6tJUhQesnTn54mbxwcgtaI
         iq2W3tAZTUXfzp9m1bIG6y94OOrTGOoDgefYJFuMLrVzNulp4s82X/qVozQkJx4HOl4w
         Dek3y4uer35x9bFL3Hpi+HIlne/+wMHw8L0C906iBEUcYB6k+p8bqA6ukOvfs4vSNBc/
         KBQwadcgsEibKBmE60GmiStenRDsJWpjdI2IsRXvhPBwaKZCdhuBlZEhSzbTyVg2XVBK
         fgUZmb0oMg2yminpKOBvsrQrShnaLnVUz2jIK3BtqHSwrLXg4M8mlKPt36nIaWQwFdXL
         rLCw==
X-Gm-Message-State: AOJu0YycSvblffaDSE5lKal/6rfiDLSjcFfBb9tQwHiBc5Ezav/Pmy8I
	T57c2Wa0jtwPEZWgXjk7/ZFHfZORKkCfyLP5mtw6zVy9exm/DiPObMIjwQ==
X-Gm-Gg: ASbGncuk/dZN8T0PnAowruYeSQSB281Ye6d9QuJW6y2GO8fdVLwktvp1rvBcAz4RgHK
	xQikKKZPFldN+iO1Cr+wD76XdQ/N6Nim6NgeenJ6B1xzfav0nCThU3yQ8eTs/zB/UJYY7cDQEvd
	KNh8AMVxfHuEGnhMu3yAm9e3dBE0yzmR7J2iAF7Bp9UkubeCZpovJejg+UkdD2d+tdkMPwSK9EG
	4pSF+hs+KANfTuACTlW9su8hFm2c+84wDaUUOfT21bUpTLbdiojwtTAMkvz5K+SRx2DKvhPEtal
	4nszYC0T6TXKgmT4EHY=
X-Google-Smtp-Source: AGHT+IHYn8N2Uh3lUC2c6NDQ9mVT5laBtdmrsp5ZzwxqZbp28KIslujfOFYvi063cBvNtNO5quDsaQ==
X-Received: by 2002:a05:6512:110b:b0:544:ca1:da41 with SMTP id 2adb3069b0e04-5452fea5190mr1947470e87.44.1739740757905;
        Sun, 16 Feb 2025 13:19:17 -0800 (PST)
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
Subject: [PATCH] xen/memory: Make resource_max_frames() to return 0 on unknown type
Date: Sun, 16 Feb 2025 23:19:15 +0200
Message-Id: <20250216211915.3891185-1-olekstysh@gmail.com>
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

Fixes: 9244528955de ("xen/memory: Fix acquire_resource size semantics")
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
I am not aware of any real issues with that. I just spotted that when looking
into the code. Also, I don't think there is a similar issue with acquiring
resource of an unknown type.

Another possible more invasive solution could be to make resource_max_frames()
return int (+ clarify a comment on top of it) and teach the caller to also deal with -errno
returned on error (in addition to 0). This way we can propagate an exact error (-EOPNOTSUPP)
to the VM on an unknown type. The cons are that we limit max_frames, but it seems
to me that nr_frames is limited even harder anyway down the code to fit into high-order
bits of the cmd parameter to be able to properly encode a continuation.
---
---
 xen/common/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index a6f2f6d1b3..6ec471237b 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1157,7 +1157,7 @@ static unsigned int resource_max_frames(const struct domain *d,
         return d->vmtrace_size >> PAGE_SHIFT;
 
     default:
-        return -EOPNOTSUPP;
+        return 0;
     }
 }
 
-- 
2.34.1


