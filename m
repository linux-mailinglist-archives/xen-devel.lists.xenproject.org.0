Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEA+KxWFnmmGVwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454F191D92
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240365.1541797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7DD-0001JL-T9; Wed, 25 Feb 2026 05:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240365.1541797; Wed, 25 Feb 2026 05:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7DD-0001Fz-Pj; Wed, 25 Feb 2026 05:13:27 +0000
Received: by outflank-mailman (input) for mailman id 1240365;
 Wed, 25 Feb 2026 05:13:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MQeS=A5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vv7DC-0001DH-8h
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 05:13:26 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3e7bb0c-1208-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 06:13:21 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43767807da6so4566549f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 21:13:21 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4cc81sm30577525f8f.26.2026.02.24.21.13.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 21:13:20 -0800 (PST)
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
X-Inumbo-ID: b3e7bb0c-1208-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771996401; x=1772601201; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMzYp4SdJTMxtv4pWgjfW8jgSoBedAjoxT34KYE2b/k=;
        b=L3ye0FL7j5yRuXgNPfu9aVMf0edi/8IVisbNYqtLRl0fZT0c9wowP1yItljsBxnQvD
         vo9ucKmBrYbPOSONQic8NDXa8mu8vv/lM400lQmCvH7BO2IvsLw87C0RNO8NyRq8OKL5
         JjGXoWCGk5bkix5DNHUPPeA+jOCCJ/03MPByq3FEIABpRk+Jjgx/PZSoSgXr1d+P/Qa/
         FmSzxJFAuS5VxxgKWbnHMhAV8mOY51luHOhE9h842ipvFUAl0Xddmv/YJklwMNvUzs7y
         2/e4U5MGxoZ3B7+VpxkeK3bewmiUF283j640bh7OpB6sYbkBabUkdBNApetbE36IYIo0
         O42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771996401; x=1772601201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jMzYp4SdJTMxtv4pWgjfW8jgSoBedAjoxT34KYE2b/k=;
        b=qnwPlzsjbOaXUkjnkn2PIHn1I6xvhl47I05TsNEvz4I1iIPBkVUPlv0senAGVHlUnt
         /l44ZYseAYuJte+52dacAOY5oGmqXRd/mTAN3jrtvnO0d6N+1p0snzM0uhovkzPBoknq
         65mUJj2L6uAfM/qyQjLTINfWn4xPvHigiZJyDingWkprVOM06S4Swkgb4Dc5V6eXU5U1
         zTFkJnCH7DC6DMGoJJw1dJpF3J+Gw4kgXaz4cVQJiUSJI7TaES0C9kTtqPo/WwE0DVqA
         vDO/NUc86zr+w+xVCRTi1aKGF3mBlmpSRImoixQNfOJTOtoTVgf2cnDEVuxRMf5vWaUd
         TYNw==
X-Forwarded-Encrypted: i=1; AJvYcCV2l7M9HSIXR3uYKAqBdJFDcCJzJbc3ENApsUOV8V8N8BBhXJOS0p45rlBsh38TC0y8QLO1wOPLE6Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE9UCOCY4G035/qH/htFTKGUaj0GPkApIQb9OGqxbFNuUdDWba
	4XASkKHhpI+P2NCkPEa7NxuoAthDW3re7o1CkECrg52/D93Y/0J3LjWjFdTxEl5est8=
X-Gm-Gg: ATEYQzzhjA39Ocl42c/5hKNljf0j2HSu2Hn5yLEwjPDCEakSYBWXWUF1OM2sFWg2XN5
	8b1OdUJ4n48WPjbAnBcFp/ksXwRvJAc46F6hO9mDhKyhwnQjWZ8fdajJEpyDyekDraEmCKVHhMw
	MhzN5BHNtkSObM8Id+fGbKSyAPgyUjq7ZrEeiCSWGUa6yUwadbb8qlEvQNzyXOCSB2RizYNj+PR
	cDZp6/ZbV1H1n6iFOkIPJZSH0v6NrvC66chaRwe5vhxRyipS0+yo61zr1S+13cgtPBXZ081NdKV
	/y/DXEcxrdqo5FBOGWPzXz2nhAVTau5B5rifYyfIQ1BTGZTln20KF3p8jNDPFqPbSnOcBfpc03l
	uhXC0HSiKdnT9FoNPSfE4DUfZeKIiIeAPNaZBTRAEFneenbMrgu3qRPV75YUSs4dBLmAz8kGMIu
	EOG2HJOz3SPRmmh9u9cM6qVCol3meVEjmmF4sZhM9s8Eq6ujkCyhmVUqV2vX6OA5KFw3dK+lI56
	immxd4IlEU=
X-Received: by 2002:a05:6000:604:b0:435:8ad8:b7a with SMTP id ffacd0b85a97d-4396f181362mr27307810f8f.46.1771996400821;
        Tue, 24 Feb 2026 21:13:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Magnus Kulke <magnus.kulke@linux.microsoft.com>,
	Wei Liu <wei.liu@kernel.org>
Subject: [PATCH 2/5] accel/mshv: Forward-declare mshv_root_hvcall structure
Date: Wed, 25 Feb 2026 06:13:00 +0100
Message-ID: <20260225051303.91614-3-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225051303.91614-1-philmd@linaro.org>
References: <20260225051303.91614-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pierrick.bouvier@linaro.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,m:philmd@linaro.org,m:magnus.kulke@linux.microsoft.com,m:wei.liu@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9454F191D92
X-Rspamd-Action: no action

Forward-declare the target-specific mshv_root_hvcall structure
in order to keep 'system/mshv_int.h' target-agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/mshv_int.h | 5 ++---
 accel/mshv/mshv-all.c     | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/system/mshv_int.h b/include/system/mshv_int.h
index ad4d001c3cd..35386c422fa 100644
--- a/include/system/mshv_int.h
+++ b/include/system/mshv_int.h
@@ -96,9 +96,8 @@ void mshv_arch_amend_proc_features(
     union hv_partition_synthetic_processor_features *features);
 int mshv_arch_post_init_vm(int vm_fd);
 
-#if defined COMPILING_PER_TARGET && defined CONFIG_MSHV_IS_POSSIBLE
-int mshv_hvcall(int fd, const struct mshv_root_hvcall *args);
-#endif
+typedef struct mshv_root_hvcall mshv_root_hvcall;
+int mshv_hvcall(int fd, const mshv_root_hvcall *args);
 
 /* memory */
 typedef struct MshvMemoryRegion {
diff --git a/accel/mshv/mshv-all.c b/accel/mshv/mshv-all.c
index ddc4c18cba4..d4cc7f53715 100644
--- a/accel/mshv/mshv-all.c
+++ b/accel/mshv/mshv-all.c
@@ -381,7 +381,7 @@ static void register_mshv_memory_listener(MshvState *s, MshvMemoryListener *mml,
     }
 }
 
-int mshv_hvcall(int fd, const struct mshv_root_hvcall *args)
+int mshv_hvcall(int fd, const mshv_root_hvcall *args)
 {
     int ret = 0;
 
-- 
2.52.0


