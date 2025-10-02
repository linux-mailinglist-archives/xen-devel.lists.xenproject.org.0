Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38DEBB349A
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135491.1472667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ex5-0006NO-Jg; Thu, 02 Oct 2025 08:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135491.1472667; Thu, 02 Oct 2025 08:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ex5-0006Ho-CI; Thu, 02 Oct 2025 08:46:15 +0000
Received: by outflank-mailman (input) for mailman id 1135491;
 Thu, 02 Oct 2025 08:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Etn-00006C-A8
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:51 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c662c32b-9f6b-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 10:42:48 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so426829f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:48 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f4abcsm2621643f8f.53.2025.10.02.01.42.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:47 -0700 (PDT)
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
X-Inumbo-ID: c662c32b-9f6b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394568; x=1759999368; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZW6KOJbHUgA0vcevzhPmMJNHgyRN0rHSvzpaRdIptI=;
        b=Nfr/gWxh+OuzODYudtQIe1nmIj7NtnpWw+CVLDXzJFNren1ySbyIb5MTcTqISnEhTs
         1+9fjhVVFYgP0Gc6rtF6EoxfkrbaZySg/rFQ661eepNgj1ner4SC8cPeY8FPk9wXeNNJ
         XrjzLrgLoi/g4q+dxbuYxCOEG2UHmOcxtFE/kKn0SxDompgupQTXKN/mXPXTBvqMPTi3
         Ktwh2Ee2RN3gs9Q+tI3YedtB0MrpUYCsMmKj+sggn5uZrW+nkpYNgLFbr6jABBfSGJRA
         z7vqnqXTm7n2yRfbnVUaa+Yl3jFffMuIkD1GiACoY4dbsdlur2ssLFW81Hg5U9VyVZlu
         sa8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394568; x=1759999368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZW6KOJbHUgA0vcevzhPmMJNHgyRN0rHSvzpaRdIptI=;
        b=DfRJF33xzTOGn0sCzvrRqYDHFFJjaUgLxueBdXhvECZVEWlE0EVrKMVFL5s7lCDS91
         HHH8l0t5UmR8/SHZbPrLI9WBH1j/ChRArnkxwZsXQemv1DhBoaq6i7EEYIMiRgwLQHzW
         gK8ls9baQ1Op2JGhcHbWn0HLvOp7ohkhpcuHYna2jyX7p913jQVTUbnYD1VgdmLCYFvC
         jL2wJBmW/2s946tveEriVSMnRlATnX1wY/PowZNB2tVI7d4goYQxtO8h6/mnIYyPZOTh
         jm6cJ/6Ed142q4+abBeQun3unEkko//TSp///O+ZhizR8AG2eQWW2127BfVb+RHpeFoJ
         ZbIA==
X-Forwarded-Encrypted: i=1; AJvYcCVUO3ss1/zYBLsrZhN3kqP3N4yDU4Kj3wZNRchUUGZT/wY/s72vfJWjVlehZ8wxNqrwIE1i1gLiJ94=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5URFsQCScnk29HGWQlPLLsjIlFshUz5/P7ltJEn/3btWo1DAm
	9/vKkFCZ2xO74pjZWRrikg/yofBXuRw0qtuyci/FPTNiWuCX8JgFJiwSAT8fJNGORLk=
X-Gm-Gg: ASbGncuCgL3XueP9FOIM9Zd124By0Qjm3QrW35Ir3alrcJF9nkKafSEB0q7FpbFXCGR
	fMw7VhnFZNGfbEUbMnANhDsk+CQn3OpB9irNf+Lowzwa8fcwNwSZxonOeucMYROaft2ZBPPfBo+
	jyq3T7/VobvkqK01V7zlCJjEBPPc1PQNx81kLYI6wbMmtpLAeel9ScEHf/zmn+n3Hj1f2/UyJjH
	2FK28KyEmkhPioj2SxPKhDQoz64M3ewO7In/nH7UlE/wq7EqO5PiboVjPChVzIQXfPt5UYXdkRF
	FRGCTR1+ctP+YxnxfuJTJxg5D5+dwAOldWMzr6R0B/ZzJJEfMY5FeaEQpRu0QMRvXnCOqiIKUh1
	TaZVZX2zTg0G7FbMotBT4DWnryeMRlVPbZcBx8/rQf0dMfY8MDttlMyuhVCl2EeXVYCLpRCZFZO
	spyDb10JfjgnZ67KFhoawf5Uj/5gqi3w==
X-Google-Smtp-Source: AGHT+IFq5U4u2A5oX9CLBB2lvkndRGUc5Ro2dPOckjD4hsAueX9T9m8XX4dTf+0cKHrb84/7PaVvaw==
X-Received: by 2002:a05:6000:420a:b0:3e5:5822:ec9d with SMTP id ffacd0b85a97d-425578154f6mr3598474f8f.41.1759394568264;
        Thu, 02 Oct 2025 01:42:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: [PATCH v4 09/17] target/i386/whpx: Replace legacy cpu_physical_memory_rw() call
Date: Thu,  2 Oct 2025 10:41:54 +0200
Message-ID: <20251002084203.63899-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Get the vCPU address space and convert the legacy
cpu_physical_memory_rw() by address_space_rw().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/whpx/whpx-all.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 2a85168ed51..82ba177c4a5 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -788,8 +788,11 @@ static HRESULT CALLBACK whpx_emu_mmio_callback(
     void *ctx,
     WHV_EMULATOR_MEMORY_ACCESS_INFO *ma)
 {
-    cpu_physical_memory_rw(ma->GpaAddress, ma->Data, ma->AccessSize,
-                           ma->Direction);
+    CPUState *cpu = (CPUState *)ctx;
+    AddressSpace *as = cpu_addressspace(cs, MEMTXATTRS_UNSPECIFIED);
+
+    address_space_rw(as, ma->GpaAddress, MEMTXATTRS_UNSPECIFIED,
+                     ma->Data, ma->AccessSize, ma->Direction);
     return S_OK;
 }
 
-- 
2.51.0


