Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GXgBFXynmnoXwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 14:00:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AEB197BB6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 14:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240732.1542018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvEUa-0006dv-7o; Wed, 25 Feb 2026 12:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240732.1542018; Wed, 25 Feb 2026 12:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvEUa-0006bg-4z; Wed, 25 Feb 2026 12:59:52 +0000
Received: by outflank-mailman (input) for mailman id 1240732;
 Wed, 25 Feb 2026 12:59:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xecS=A5=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vvEUY-0006bY-9i
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 12:59:50 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db087ef3-1249-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 13:59:44 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso8272965e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 04:59:44 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd732eb1sm69925795e9.12.2026.02.25.04.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 04:59:42 -0800 (PST)
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
X-Inumbo-ID: db087ef3-1249-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772024383; x=1772629183; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wILc9CGEf1WIqbCiw3qNVsNe1/HTYv9pl3xfzMp11zI=;
        b=InEI5je8+7v+78AqYekmmp7ZYvejFrqlqQ0Aai4jVVCpC/vZjhZg7m+msJTCOskJX9
         DtwEyJT6fUa63+Eq9Jcb4MS9Ru1YUQR56+bwhyD/kkBDVs0IiYfqpg48s9anzU7ee00G
         hcgiFIdUUQ79ogh9Tfjag5qlIWtoGZApfTOBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772024383; x=1772629183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wILc9CGEf1WIqbCiw3qNVsNe1/HTYv9pl3xfzMp11zI=;
        b=EEaf6YHFkPbsW113BydjExD6TDcxCDZTWJ9uNJtVjbm6z0d6QAPizW9Rc7+uIpU3G1
         NbzM/tHCapjtOahLLgAF4qingMfn7GK6TD0+BFDXs1mTcO2s5Di9grJb5qSvEzsteloM
         MaLGFCl6DP4dxUCK6h/QAwTQ9u4Qi74f6jmNcWf/M2qi2bW7EcsyJ26hHeFBRMURqiRi
         qnaIjq0wcKOLJ1OR+SPvZ46n+zTe6gH7CU90p5toa414Ff662i6JcsDBZ16uiUqy7CCJ
         M3x4k2AOQwdZY9H1DBo2AeEE+ox98Cn7bpIgK52jLsa6GpuGQyV4ePW4hR3h3/05cP/S
         zqUw==
X-Gm-Message-State: AOJu0Yxf1ap7o0kryIsqEA4gjKaKgBupyfvdoB9pIbdiWIN2FBVZ2y0A
	xXPMYN4lX3hlqA0l418F+R7YL0eYZVjFm7PwWxpu9aHiWzjg+Pxw1zkleBLibAwLN2/i7iYFIID
	R9L2s
X-Gm-Gg: ATEYQzwL+hz1KiaDfeAK5reuutl1A/99aosr3ktjGYBj88Ldm754/g4PFvivt4mcvV2
	v4RzvLgTcZQSHMv/4vTY/AVHSv6nYF9YBpea3DXpvOjgpFGlqGMpG9Kk7Dl3JwnGtNx3CayDwyC
	n6TqJO8zgmcI3z3Rzsld1vpX7XXs160t0x9YdmFRoOitsvHJv4Rp+S7jOI2BoZkl9TlmXJ4IiWo
	HKvW+8iVK/79wqEpH1jpMDTnZlJvstRJNDHFcgyz3RzWxAcKltk/dJmFFjE6SoutjsnE8Iw/1yD
	gDxQlmbsmIzYWLP/HHejb09qlr+2bSeRM3uBUzyGGfhntBVwZGAOJI7KFGc28H0t7XEiF0NjC/i
	TLudRfhgM/bXfdnOhkigU4lSWnIzxd2AfpyH1AZef3k08llGWD0OHiFXQCoOlXAMieGTg8iMPhu
	gCgeTZnQeTtZ74tkqnCRIcHV3oJunsdgMyu8jy94CJMJ+YxMTehVnRly8ZOklSRNCa+JHr1pA=
X-Received: by 2002:a05:600c:21d4:b0:483:7eeb:4558 with SMTP id 5b1f17b1804b1-483bd713d0bmr45333455e9.2.1772024382569;
        Wed, 25 Feb 2026 04:59:42 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/mm: Remove claim that INVALID_{MFN,GFN}_INITIALIZER is for older toolchains
Date: Wed, 25 Feb 2026 12:59:40 +0000
Message-Id: <20260225125940.3804137-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gnu.org:url,amd.com:email,vates.tech:email,citrix.com:mid,citrix.com:dkim,citrix.com:email,open-std.org:url];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B6AEB197BB6
X-Rspamd-Action: no action

This was never because of a bug in GCC.

C requires that static objects are initialised with constant expressions;
_mfn(), as a static inline, is not and cannot be made to be.

Correct the comments.  No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

Slightly RFC.  I left 'global variable' alone in the comment, because C's
"object with static storage durations" also isn't ideal; there's one user
which is non-static in terms of visibility.  I'm open to adjusting if we can
figure out some better wording.

In C++, we'd just make _mfn() be constexpr.  It turns out that C23 added this
keyword but restricted it to objects and therefore useless.

https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3018.htm literally admits
that constexpr on objects exists only to force some diagnostics which were
previously optional.
---
 xen/include/xen/mm-frame.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
index d973aec901fa..80885415a78a 100644
--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -9,8 +9,7 @@ TYPE_SAFE(unsigned long, mfn);
 #define INVALID_MFN_RAW  (~0UL)
 #define INVALID_MFN      _mfn(INVALID_MFN_RAW)
 /*
- * To be used for global variable initialization. This workaround a bug
- * in GCC < 5.0.
+ * To be used for global variable initialization.
  */
 #define INVALID_MFN_INITIALIZER { INVALID_MFN_RAW }
 
@@ -45,8 +44,7 @@ TYPE_SAFE(unsigned long, gfn);
 #define INVALID_GFN_RAW  (~0UL)
 #define INVALID_GFN      _gfn(INVALID_GFN_RAW)
 /*
- * To be used for global variable initialization. This workaround a bug
- * in GCC < 5.0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64856
+ * To be used for global variable initialization.
  */
 #define INVALID_GFN_INITIALIZER { INVALID_GFN_RAW }
 
-- 
2.39.5


