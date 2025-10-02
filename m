Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B30BB3485
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135460.1472590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Eww-0004Eo-Nv; Thu, 02 Oct 2025 08:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135460.1472590; Thu, 02 Oct 2025 08:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Eww-0004CR-JD; Thu, 02 Oct 2025 08:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1135460;
 Thu, 02 Oct 2025 08:46:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4EuE-000821-AV
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:43:18 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7a6b1a1-9f6b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 10:43:17 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so350974f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:43:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9762sm2651528f8f.38.2025.10.02.01.43.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:43:16 -0700 (PDT)
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
X-Inumbo-ID: d7a6b1a1-9f6b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394597; x=1759999397; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAgjr5yIgrIO789GqXuRF0t/EGl13bmDgqvJGL/31ds=;
        b=RDcXuWFqtpO/bPeOzKAIyye2IDhzqQx8Jnpfzp4OI5oGo3Kj5tjlMYLMdsX1qsFFze
         1zhL/J535NeayNio03a6XMOH/7/nzIGvyaBzGcxraNlsmj5QwJ20wqRIzsFvwT/+TrNl
         9DvtfqPHaZ73VuqS4TJMJnDtvy2J4PjLMxvgrwXHpL2NjFFmjX72PRIFYMSNR7FfJTZy
         kE2PD+G8aW9vF4pSSr92EopmOGLcdhZbXK1D0wilLhUPZmHQZmGex8Ovmn/dwLMvu1Ys
         Hd5aDB1KA7y8Ja5MyZFHM/YSqy5kPeVWBW0rXg4chommlZm7wMAudmOKoS+ceVA+JeTi
         VNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394597; x=1759999397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAgjr5yIgrIO789GqXuRF0t/EGl13bmDgqvJGL/31ds=;
        b=uOHAPe0yN8uQ2yK5b7nTuNPmuRyGhYJ0iAeB/4DVK25fPIyDeHw2QKSdBtEr66XTSJ
         OynasNO8c7kzuQuyAmcFBzqtR5ZHrhuHAPSBMWBYWU4c1oc0KGEHJuVXVegIuuLlPLG3
         Ty1o1FOgSEUq+1XtQshq1FRkA3DI3YHtrlEKwQROMjUmQNaIGqclqKHjZRdI+CUfOc8K
         yf66/zx/c8yKuhSAFhpBh6zqjqs0TuC3k2ESMD1tQC8apHWKAB4Xbj+9b586rTUbnWLd
         DH0S0zLkQHd9dXWf3prBLC2zONI3QdEpZwemkF06gaBj8ixSYj5YRv+oQ09f2NcLf4aD
         LAlg==
X-Forwarded-Encrypted: i=1; AJvYcCVOMgsl7SIlkeHiv/JIaT/iL8eq5meKj1OiJQMFQFLJ0xat/EpGntOON7uU/a352FhPX5UsLKdCcjE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUfDqdNYJcwSg37hVcKP0hjpT6/mkatl6mw6wZzF3YltH/bvKe
	RcIaE/L0WnzOTSON1E+nAVIp+LUFfb3TKOeHE3lu3bCRIcd1mU2Mwzowr8YEVpM8iA8=
X-Gm-Gg: ASbGncuAUsDT0wfs5DqowqVVHNntizsd4uuDi710Yko1/MfxUKzpqRqooRMF/6YtAPO
	Lvled78SUSdI75YgdfFi1nTnYEV8IUALgDUHu1hCRe4dYe3SE8cK+BI7LS5w2d8ohrd6MW+OIEX
	yBBWveM5jdi3Oboek05iHnG0WtoAYVRemkuEJYsJTDPnAmimTGIy+wpPL03rNd4+hzGUk727ZOf
	IDp+v3Xad61o4ran8PxxLUITYupiPz870HgwrZsJzjCs9cT8Nns52BduOxggvXDtVRv0+dUbNv/
	fn/O443evSSl/8m4oETgCy2emxbN/ioc+gDr1INg90GOftKjerW9NQAvTPaLc+Oe8bvKFVt44ow
	T9XfiGs//lvOag35rMg2Y72NgADCo4gctp6CsqUhogCF+qe3c3OYX81ISScU3DPpzie5rsewcEr
	p68dqP/kER+0gHrerb3pB1FTcQcmGTBg==
X-Google-Smtp-Source: AGHT+IF85XkLg0BRzQXNPalgqzyMpny7LwvkrLwLebNjcVy2x5/oJ5wUtocULaWC8zMsTAEaZEeQKw==
X-Received: by 2002:a05:6000:609:b0:3d7:2284:b20 with SMTP id ffacd0b85a97d-425577ecfe7mr4915156f8f.3.1759394597239;
        Thu, 02 Oct 2025 01:43:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v4 15/17] system/physmem: Remove legacy cpu_physical_memory_rw()
Date: Thu,  2 Oct 2025 10:42:00 +0200
Message-ID: <20251002084203.63899-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The legacy cpu_physical_memory_rw() method is no more used,
remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/loads-stores.rst            |  4 +---
 scripts/coccinelle/exec_rw_const.cocci | 10 ----------
 include/exec/cpu-common.h              |  2 --
 system/physmem.c                       |  7 -------
 4 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index f9b565da57a..c906c6509ee 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -460,10 +460,8 @@ For new code they are better avoided:
 
 ``cpu_physical_memory_write``
 
-``cpu_physical_memory_rw``
-
 Regexes for git grep:
- - ``\<cpu_physical_memory_\(read\|write\|rw\)\>``
+ - ``\<cpu_physical_memory_\(read\|write\)\>``
 
 ``cpu_memory_rw_debug``
 ~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/scripts/coccinelle/exec_rw_const.cocci b/scripts/coccinelle/exec_rw_const.cocci
index 35ab79e6d74..4c02c94e04e 100644
--- a/scripts/coccinelle/exec_rw_const.cocci
+++ b/scripts/coccinelle/exec_rw_const.cocci
@@ -21,13 +21,6 @@ expression E1, E2, E3, E4, E5;
 + address_space_rw(E1, E2, E3, E4, E5, true)
 |
 
-- cpu_physical_memory_rw(E1, E2, E3, 0)
-+ cpu_physical_memory_rw(E1, E2, E3, false)
-|
-- cpu_physical_memory_rw(E1, E2, E3, 1)
-+ cpu_physical_memory_rw(E1, E2, E3, true)
-|
-
 - cpu_physical_memory_map(E1, E2, 0)
 + cpu_physical_memory_map(E1, E2, false)
 |
@@ -81,9 +74,6 @@ type T;
 + address_space_write_rom(E1, E2, E3, E4, E5)
 |
 
-- cpu_physical_memory_rw(E1, (T *)(E2), E3, E4)
-+ cpu_physical_memory_rw(E1, E2, E3, E4)
-|
 - cpu_physical_memory_read(E1, (T *)(E2), E3)
 + cpu_physical_memory_read(E1, E2, E3)
 |
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6e8cb530f6e..910e1c2afb9 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -131,8 +131,6 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
  */
 void cpu_address_space_destroy(CPUState *cpu, int asidx);
 
-void cpu_physical_memory_rw(hwaddr addr, void *buf,
-                            hwaddr len, bool is_write);
 void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len);
 void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len);
 void *cpu_physical_memory_map(hwaddr addr,
diff --git a/system/physmem.c b/system/physmem.c
index 23932b63d77..0ff7349fbbf 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3181,13 +3181,6 @@ MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
     return error;
 }
 
-void cpu_physical_memory_rw(hwaddr addr, void *buf,
-                            hwaddr len, bool is_write)
-{
-    address_space_rw(&address_space_memory, addr, MEMTXATTRS_UNSPECIFIED,
-                     buf, len, is_write);
-}
-
 void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len)
 {
     address_space_read(&address_space_memory, addr,
-- 
2.51.0


