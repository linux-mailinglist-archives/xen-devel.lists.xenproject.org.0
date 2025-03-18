Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629B3A67B10
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919621.1324049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarh-0007Ui-8e; Tue, 18 Mar 2025 17:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919621.1324049; Tue, 18 Mar 2025 17:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarh-0007S2-44; Tue, 18 Mar 2025 17:36:33 +0000
Received: by outflank-mailman (input) for mailman id 919621;
 Tue, 18 Mar 2025 17:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuarf-0005mN-Nb
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:36:31 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86011809-041f-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 18:36:29 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-22548a28d0cso10964035ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:36:29 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-737116b378bsm9913768b3a.180.2025.03.18.10.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 10:36:27 -0700 (PDT)
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
X-Inumbo-ID: 86011809-041f-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742319388; x=1742924188; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65x9tIuo8RiSngh578dsqmv2cGZ1RIuqM9MS+sxM7n0=;
        b=iAUBWohT8KhapBBHYWs+uoTIi+6Khx2muYTkQeWnnhQvJ5MpU+hWQ1CM5RpER32pLi
         fvg+wnJBdR0/EL7Kog36rdlok5E6NOVeao8cZ16W8nOx6n4xhDRpr2/FwTjiXsMwspqg
         6XA2R//AVYMsxcYi7Bo0xHQJjDOIWaPmh+Lfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319388; x=1742924188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65x9tIuo8RiSngh578dsqmv2cGZ1RIuqM9MS+sxM7n0=;
        b=aFf1Jtubc86CJxjccIystVp8DkPeEae/SRvkHxgWGk5R6v8aa2loWSkrcLg/8a+ZxT
         dZiZONpwe+nEdsQolhwIYyhuJWKYqKrkTjfbDbtl6ukqxA7z2bBV1aFLsny39/lXsLGs
         l7/2TksxzpBcCzbHfeb1kdNI25xyyr28JxM/FmcFyMNr/uD+gKtVTR6ZOJ6AtQvSU9ej
         LtF+946FHqNatYPVonF3hsSGn3ro6VZUG2phR2E4VJzhkcFUO7WI5w1aaUp4cQP7Czwm
         EGc8ETqoSiVwn/ZNruKdSVYuAnU112wWbxBB+Qjb6EjzHfBzgPey3yfFSwdp8FLdc6It
         Wegw==
X-Gm-Message-State: AOJu0Yyp4htl0r3tlLZezUO+INhGSgX+qGzy2R6/v1wK1jzBFVp0atEx
	h4Oz7r8bGZ8kXJU89cF2DeZf/YUA0YxQIrP7u0varTOcVfyHz96a6UjckwcdRCf/fblFVfLOvTF
	S
X-Gm-Gg: ASbGnctSo9Cq+d5dgHQoydqd/ygNUQMmmHP3FIq5RFmgImg5JOPbp7akPSXewH54in7
	a1/GQ7Gi7IHZwZummFU3y1Bt12KkVkrfpwqv928MsJBGD3nxAJxEOSJsaTenU1ZtZX1MK0F60pw
	MZAyokEHHPoTM5i+R0CVDRMo4LsaI67OCU5bknMmZS0hEWgbLHoFqKkc8IdUVhioBaSUoLllOal
	ZNXrXVZ2ptwhJWQdfHtpek3ezcRUAj8kG3yp0uMsaztJ71jGqBajWnxnASlX27AS5N3fN9EKnRc
	m6MKriyJdB4MmHKt4FBg4YYj/yDGqSR9ucpR0Jf/oJPa/HvIdA==
X-Google-Smtp-Source: AGHT+IHBmHeZPVhhAefSRXC16fWz8L91e4nLV5etg4aNZ5lIx3DY+90wO0OaM48da41HjeI/xoenuQ==
X-Received: by 2002:a05:6a00:3d08:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-7372236f104mr18793159b3a.1.1742319387599;
        Tue, 18 Mar 2025 10:36:27 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO section
Date: Tue, 18 Mar 2025 18:35:45 +0100
Message-ID: <20250318173547.59475-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318173547.59475-1-roger.pau@citrix.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Relocations are now applied after having moved the trampoline, so there's no
reason to warn about relocations to read-only sections.  The logic that
apply the relocations would make sure they are applied against writable
mappings.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/efi/mkreloc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/xen/arch/x86/efi/mkreloc.c b/xen/arch/x86/efi/mkreloc.c
index 375cb79d6959..a5a1969f2ee5 100644
--- a/xen/arch/x86/efi/mkreloc.c
+++ b/xen/arch/x86/efi/mkreloc.c
@@ -216,11 +216,6 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
             exit(3);
         }
 
-        if ( !(sec->flags & IMAGE_SCN_MEM_WRITE) )
-            fprintf(stderr,
-                    "Warning: relocation to r/o section %.8s:%08" PRIxFAST32 "\n",
-                    sec->name, i - disp);
-
         printf("\t.word (%u << 12) | 0x%03" PRIxFAST32 "\n",
                reloc, sec->rva + i - disp - rva);
         reloc_size += 2;
-- 
2.48.1


