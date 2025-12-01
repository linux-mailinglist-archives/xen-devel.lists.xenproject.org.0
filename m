Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4071CC982BA
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 17:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175871.1500473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ6Oy-0003e2-Cr; Mon, 01 Dec 2025 16:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175871.1500473; Mon, 01 Dec 2025 16:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ6Oy-0003c8-9p; Mon, 01 Dec 2025 16:05:24 +0000
Received: by outflank-mailman (input) for mailman id 1175871;
 Mon, 01 Dec 2025 16:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhWH=6H=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vQ6Ox-0003bz-1G
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 16:05:23 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 879f8d4f-cecf-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 17:05:17 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso18812835e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 08:05:17 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adc8bbbsm323560585e9.3.2025.12.01.08.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 08:05:14 -0800 (PST)
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
X-Inumbo-ID: 879f8d4f-cecf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764605117; x=1765209917; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7/QrVGalRKP3ng4dR+2IOAKCooDRaCU8dsfYQQva5g=;
        b=uAgqmCw2VE2V3vL0huJyOT5FiiGw9HklMMJfzONXjMayH5EoFjEVjqpZVFf5dox0fR
         4r/hOzB8HDqq6oc7L2WWUU499WF775HM9cXWOqLLKI/jg9Y3Pr/VDoaYM1atDUV1MxlQ
         wXUycvjmPiY8oUZl8IPgS29j4sePqdikQomY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764605117; x=1765209917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k7/QrVGalRKP3ng4dR+2IOAKCooDRaCU8dsfYQQva5g=;
        b=PkEEuNMaEKUYRTU3trOatfHjvb0HEQSv0wmojD8IDn5hAY8pWHN0K7/mbb6UMrVg17
         NLS887QvOlF3DsHHeQBmsSv0OyZJyEH6MfVwyiGGf6vSjCABGrMHkIWWdrZCk0JWJpEP
         Cc+E65N4Pa5BFAXk7OAVzx03PuFjifp/HE0q9mN4dPRPc/dOmpxmlWAjzIlVdPv1dNLp
         Q5F2numea6fdTt/gVhakGQDlFXDh5MzNzZhh4a+E28tYZYwI7GKW6g0Bxlu2ZXsfQV5L
         iUJ6fcjyvskq0IMrYfugaHu48rrURp6cWNvh5rlz9huJ3tbBShtw6iWRzvLjYaSJSBM+
         2DKA==
X-Gm-Message-State: AOJu0YwYK6vDQUixat9qO0gFC2lKNI5wf5gfzAmIo0ffHNw3Pq8hcM36
	9pmRn1+TeR0az0WXfHsPhVqMNIkLAsMcsndrZXfl7YXKdGMV2wKNkalfehc6ahN+KCL9k4oxq3+
	+M1Tp
X-Gm-Gg: ASbGncv5FRHwtqV0Li2vZuMVfBzJuUMQhDY9v13NI+K69KKIOMZUPsFG/YEhBU8eGCr
	qErQOLDcGmIg/Hbn94G/OkwlUGti9yXk06UDcsIg2QjnrM6/Je+gRpl6MnUAdrw/YjR1ROuoWYZ
	9ITH0E8T92cIdkFtqG+BYre/W/WV5CBahStM9YKkiqC19D0+vvL9YvZ3d0qQ/VuJv+EaTa+CGUs
	8Vt//PDj35XcKldB25Hf1BSkGm7Q3+NUKPGe6FxhPfFDCoCTadm7JWTVMaBP1jF7xAW2J57VpTd
	+oc2gDS1/zPySLkgmQutheU4UgkC4/b8jlYXZtd8x6crJeM7dQX2ghQA8VWlzV9A4+Ohsdg0Jt4
	Wk/HFbyOpqq8rOjXJr20tomfuiGRQOR7SopZ28eLrPHwqnxbSfhd0ZdMVRmG5jtFRWYOcQ+WK5T
	p94vmYL2vWRrztJ6pYV4mByMRtLehgADtw3eE9Hyk9A8eltozCai7BI7d7fKL2WzwukcviBamM
X-Google-Smtp-Source: AGHT+IGOSvypeyB8zoUiSnPg+gKR09o6Fn5+2AB4I/q3YXSu/pWf+TKcXJPMDDBMAK3I6vn+oJYgfw==
X-Received: by 2002:a05:600c:4fce:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-47904b2bff2mr246826515e9.35.1764605115577;
        Mon, 01 Dec 2025 08:05:15 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1.9 1/3] x86/amd: Use setup_force_cpu_cap() for BTC_NO
Date: Mon,  1 Dec 2025 16:05:12 +0000
Message-Id: <20251201160512.1311688-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251126132220.881028-2-andrew.cooper3@citrix.com>
References: <20251126132220.881028-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A XenServer feature in the process of being upstreamed is to be able to
re-caculate the guest CPU Policies at runtime, e.g. after a microcode load
and/or livepatch to expose new functionality.  Right now, upstream Xen only
rescans the Raw CPU Policy on microcode load.

One complication with recalculating the guest policies is that BTC_NO is
handled differently to other $FOO_NO bits, by using __set_bit() rather than
setup_force_cpu_cap().

For consistency, switch it to using setup_force_cpu_cap().  This doesn't
matter for upstream Xen right now, but it will ease upstream the feature.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rewrite the commit message.
---
 xen/arch/x86/cpu/amd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 805a8189e6cd..b3e12b084c56 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1115,8 +1115,9 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		 * Branch Type Confusion, but predate the allocation of the
 		 * BTC_NO bit.  Fill it back in if we're not virtualised.
 		 */
-		if (!cpu_has_hypervisor && !cpu_has(c, X86_FEATURE_BTC_NO))
-			__set_bit(X86_FEATURE_BTC_NO, c->x86_capability);
+		if (c == &boot_cpu_data && !cpu_has_hypervisor &&
+		    !cpu_has(c, X86_FEATURE_BTC_NO))
+			setup_force_cpu_cap(X86_FEATURE_BTC_NO);
 		break;
 	}
 
-- 
2.39.5


