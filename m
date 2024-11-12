Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A92C9C633D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 22:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834937.1250745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAyIK-0002Nq-Lk; Tue, 12 Nov 2024 21:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834937.1250745; Tue, 12 Nov 2024 21:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAyIK-0002Im-Hj; Tue, 12 Nov 2024 21:19:28 +0000
Received: by outflank-mailman (input) for mailman id 834937;
 Tue, 12 Nov 2024 21:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpNK=SH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAyII-0002GE-Rp
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 21:19:26 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7e99b87-a13b-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 22:19:20 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso1040860666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 13:19:20 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0defaefsm762049066b.164.2024.11.12.13.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 13:19:18 -0800 (PST)
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
X-Inumbo-ID: c7e99b87-a13b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM3ZTk5Yjg3LWExM2ItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDQ2MzYwLjI5OTUyMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731446359; x=1732051159; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBwK/QF+1NquGOFu0ZZixkKntqOFUa8H6vDkVuqNnKY=;
        b=Iyn9SLBn4TbDiQJNLmQSXm23oBuDLMb/HGWIXlQq08dS7CogYBQ+ZDWWyutk0kXJLl
         tHWVT2bqRkL/xLF38Mipw9RPvfVqjHwrDP60hPCxR5JCExTtx1FCxDCXZ9UPqLJoTukt
         5j0gUD0qLbBV8rAj6vaD/l7wKb6TSWOxV7J0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731446359; x=1732051159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBwK/QF+1NquGOFu0ZZixkKntqOFUa8H6vDkVuqNnKY=;
        b=lmHOCQ4u6zF3gqKVTxymM7B0XcadSOBn4rFgrMrocMz9w01kKpREVNRimzVCCEu3dK
         SpdojyZyXzrSiV+CQnyaDoDGjuThfjxXZ0wW3mXTM8PfL3mLh5vfjshzTlYKCIB9ZFXL
         hvP9bAzG0fOjBQtORgCjxnDYShPv9Mpy+8tdZGQwpKnWr0BajyrlU26noAiE5nGWgF97
         OxhALVLT6Hz4grRKDj6WjB7KtjuxRPjayLl5WKaLmAGq5wXNrRY9sZqW6b1NWw2L4gqI
         bbCKzg3hYcO3etebXXNvB5sst7yQsRUMXrJfEnzEChf0kOBc3KLyBuqRzyugjj6LxKpG
         lIaQ==
X-Gm-Message-State: AOJu0YwxoxqR9OkmbKiwGsmkMDOnZdmU6MCHeIkH57bBPM0Ymi4xy5Sv
	UhBJh+4FH511/YIwZE5JlOVSPiiIhmItOFB5CHK7MT2VJ/bX4Q3psSk24d2vpML/zTK5T1dwYFh
	q
X-Google-Smtp-Source: AGHT+IEpFFEisXH2SHYcEAxyhBO8zO2SQ+lwYiBs8HX53xYapTrKVjADdsDKECfiGw/sjnRqZPhr7A==
X-Received: by 2002:a17:907:5c7:b0:a9a:17f5:79a8 with SMTP id a640c23a62f3a-a9eeff09bc5mr1749193666b.13.1731446358860;
        Tue, 12 Nov 2024 13:19:18 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] x86/ucode: Simplify/fix loading paths further
Date: Tue, 12 Nov 2024 21:19:12 +0000
Message-Id: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remains of the previous patches, posted as a single series.

Andrew Cooper (3):
  x86/ucode: Remove the collect_cpu_info() call from parse_blob()
  x86/ucode: Fix cache handling in microcode_update_helper()
  x86/ucode: Drop MIS_UCODE and microcode_match_result

 xen/arch/x86/cpu/microcode/amd.c     | 10 ++--
 xen/arch/x86/cpu/microcode/core.c    | 69 ++++++++++------------------
 xen/arch/x86/cpu/microcode/intel.c   |  9 ++--
 xen/arch/x86/cpu/microcode/private.h | 21 ++++-----
 4 files changed, 42 insertions(+), 67 deletions(-)

-- 
2.39.5


