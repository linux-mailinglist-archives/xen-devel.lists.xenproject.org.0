Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F474BB33D3
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135411.1472551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Eta-0001Ty-EQ; Thu, 02 Oct 2025 08:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135411.1472551; Thu, 02 Oct 2025 08:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Eta-0001Rv-8k; Thu, 02 Oct 2025 08:42:38 +0000
Received: by outflank-mailman (input) for mailman id 1135411;
 Thu, 02 Oct 2025 08:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4EtY-00006C-Ek
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:36 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7eaced5-9f6b-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 10:42:24 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e4f2696bdso8986575e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:24 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e693c2e6fsm23962295e9.17.2025.10.02.01.42.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:23 -0700 (PDT)
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
X-Inumbo-ID: b7eaced5-9f6b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394544; x=1759999344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2534c4RtZyXLI9bpIizaZmKA+am5Tc7GXq0BfJ3FTIY=;
        b=ODcOHn7+gDdOhBsd0UdB2lf2mVklGxDcW92vimPUzx0U0A/TB0vFMhc4+eXnoVm+Zb
         qtP6OOu7AuPsbLEicTlcuNou/86gt+IGO+PkAQLczQyFRCPtqFOOjlsPIR7flcDkiM/w
         VaIMTK81SOY2rQzbU1ntqYVsu5jfcQoAgYPPWggeVMym2h1mtro8za3dlZhUeC7BwhTH
         IA8DMiph5jXXDf7GXJ1PLhloUGXfPJRHbbEHnroV7koaeaNbJRYwcGZ76qS+CR8qOgUZ
         zgqcqWNcY37mWG3HhI5hjmv/Ma2Z28qdmF/YYXeGjDsyjY/tAt5leRjY4TCzhyjNeKfx
         6mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394544; x=1759999344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2534c4RtZyXLI9bpIizaZmKA+am5Tc7GXq0BfJ3FTIY=;
        b=eAx4Tg2svaWfQmRp9KLZLbXPI+gkW/eGdCA1XTaZClYNLOo4c5RjOtCptPY/plplwG
         fQxk2pp1jVYB9HWIOvZ2YMStMFI+MvlVC+tCSmhCNuHqZC2lIoGmEhkiw5ytUBph5Kl3
         aqNoXtqShRd8utfaERsXStZR+oJ8pSSueHTyxOlbCmsFG/1ruja0OKBoik1yxqLwSKdz
         Yz4a5HPCIqRJqcU9ltnF26zsoyzSmhoUNt/ehr/r5uCCu2RDJPDN9qPq3CwhxMCcGZfQ
         dYLM0PO3NJoHEFX2bgGAi0QMcI6Rz2EcW09HtdJ18NK4s3cIBG7dQPf2cZRd+yKNT0SN
         bkBg==
X-Forwarded-Encrypted: i=1; AJvYcCXBtSH7SfErPo8oc/xwoemvFB4vZUpDu1mLGKBWfUFMrn4iealTlUmjUd8DjROo5tEqA2KM8HyPwyk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDOvW9qpNAzABf8V+zFInzmlUqgXkoLurNOKHjI3sQCVbm2qyQ
	T1EINqsIwlYWOMOhc6+/T0z3Sbb5m8KCTKn0FdFMJ5zFJ8iWOTNWH6p+PUZYug21Lxk=
X-Gm-Gg: ASbGnctBO6cnw7TKY/L8s+EyH7EI+xD1nuC87EPWRNJeMCQ66yqKkfWb7GC9gdHF5/r
	8meaQYqaCUGfz/hMPNmufud/gIfWrPB1q9dFli0yIoPNS0aciLqbALBLefxAVcTx61FSnCvVF4l
	Q9VylL8y05KD7ciVEXf9ldCgoZCGy55wSt/Kd1i3E1gjcbimmi31jd4LN3v+n5IdNBI4RHxaECr
	UVypJ3/CqY8Qb2HL85wtqyBPZjCEWg6d4NB7swHExeYZESNZFWcb0P2Q49UKEU8R8Mv5KpgHOvf
	Sk95CMAl+p77AIlj0Y41VvUUv3Lwj60+Y2J3bSsiz45sgd/ZPbBvQ/c1nowa2EyIicqpHgo55ON
	4QmYF+XJfKZwK5V9+GFv/QnSbx3V/2jrLqrlz5piya9Zy1K3xyKxJNSovoPI0pZqvrD32P6PY0l
	ksaggBJbygHtkeZukRoqdE0UPVsnLd7A==
X-Google-Smtp-Source: AGHT+IFP18ee6bgm/ejyh8kmRYFVi1hqLlMKkbtTf3ZacHJyOl7EopZwJsToQT2tvIjzxTw/P2KdoA==
X-Received: by 2002:a05:600c:3149:b0:46e:3b81:c3f9 with SMTP id 5b1f17b1804b1-46e61269212mr56566845e9.17.1759394543997;
        Thu, 02 Oct 2025 01:42:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 04/17] hw/s390x/sclp: Use address_space_memory_is_io() in sclp_service_call()
Date: Thu,  2 Oct 2025 10:41:49 +0200
Message-ID: <20251002084203.63899-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When cpu_address_space_init() isn't called during vCPU creation,
its single address space is the global &address_space_memory.

As s390x boards don't call cpu_address_space_init(), cpu->as
points to &address_space_memory.

We can then replace cpu_physical_memory_is_io() by the semantically
equivalent address_space_memory_is_io() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/s390x/sclp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 9718564fa42..16057356b11 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -16,6 +16,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "system/memory.h"
 #include "hw/s390x/sclp.h"
 #include "hw/s390x/event-facility.h"
 #include "hw/s390x/s390-pci-bus.h"
@@ -308,7 +309,7 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
     if (env->psw.mask & PSW_MASK_PSTATE) {
         return -PGM_PRIVILEGED;
     }
-    if (cpu_physical_memory_is_io(sccb)) {
+    if (address_space_is_io(CPU(cpu)->as, sccb)) {
         return -PGM_ADDRESSING;
     }
     if ((sccb & ~0x1fffUL) == 0 || (sccb & ~0x1fffUL) == env->psa
-- 
2.51.0


