Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL44LyETr2nJNQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:36:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD14D23EA92
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249634.1547111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfSd-0000IN-4r; Mon, 09 Mar 2026 18:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249634.1547111; Mon, 09 Mar 2026 18:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfSd-0000FL-1j; Mon, 09 Mar 2026 18:36:11 +0000
Received: by outflank-mailman (input) for mailman id 1249634;
 Mon, 09 Mar 2026 18:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9QdD=BJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vzfSc-0007ml-09
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 18:36:10 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6836500-1be6-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 19:36:08 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48534b59cf3so13527755e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 11:36:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8dbb3sm25412105f8f.4.2026.03.09.11.36.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Mar 2026 11:36:07 -0700 (PDT)
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
X-Inumbo-ID: d6836500-1be6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773081368; x=1773686168; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIEbHx6YI4gBPOp+3pEqRYyaYkjjh/Mj9wYvLwhU6C8=;
        b=aPaJeDnuDxPPuL19l9GAwpuXdgxNkYHXJtb3gKMJ3RWbVJCmv4aRLhvJ+UBKwvLowv
         N3LaBNI7o5TDhpQiIog8ZQAPzkiWZLLIiVEUf1fwJMNHEP+16Hu8M9SchebZto+DV7KI
         f1m8b7m45Pg3eDpxdR2ZhqzPGYo1QOWo5SaGf+w7h2EXMRswKarQK3wSbT0swMzEbAuY
         1ark1aw1B0Wh/nPw6yGAuvnCNdkuK38spmbEeaSKvza+mN+sKDN3T4WymUvLsiQ8AOGJ
         jdv8SP8NAz1vZ6wftmJfWyJXDLA8J71/5SVVzFRkmjxfrxrnVXzsvWTmaKOvWR9DtwPa
         N0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081368; x=1773686168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bIEbHx6YI4gBPOp+3pEqRYyaYkjjh/Mj9wYvLwhU6C8=;
        b=gWioS4uBy8bCZaZW1FjQxH2iay7OWwS57pmUJ2jGAK4NhWon+q7VeI8Ti0xXBX7BPD
         8bmMSOZ+FpivwoddLqC3palPxrsOAwY1QFEX02dSXqBN5+oJBq5H/KS/Ux9RUcOmw5Nu
         v6pPTKeMXyb29CVCQL8lMtV3hLP13Z/9D1tcHe6Basl0cmhcVn6CFbUfXS8c5f0kcaYF
         rlsVYpedvxV2wX/hQx2wlD3o0XAVE+qv8vdPOLqd/38AA6MpXU/PSuixv6p21hdKYzQx
         PwARTmtTgORj7PLLw+5P2mkT508Ke9xY1fmpCRaa5Ya0BAMSQ9sTiE/g4aep7rzBmyef
         QwNA==
X-Forwarded-Encrypted: i=1; AJvYcCXXzAdKu2zvWqNjPjrcrt4Vwso+2TxueXSbPfKNqfYRoPfXM1keKIVSWyV4ek74UG68sNwM/ffMHRY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9EwmoAPFaDy/5XOhB2yf/WrABGerxWzuVn06PSxXM6zNbdpQ/
	hK0iNfrcOJz6qvXSW5VONCNMDH3zpnGkB1npVJoRI3OEVKhn/IEF0/KLtYVNNO4Ewxk8X6LTmdt
	jxU4o8jE=
X-Gm-Gg: ATEYQzwAFYQRIyd+QE4WNKdc31vohrKlWRspmrOLQUIzYwy/lWxH5Rz331kLKlx7yUf
	Ig1uzFbZMyzStuXkonSEg2qriqJppteI91nabeIl/kxvrU6F+DLJNX0nzpD5ezGUhSuUhb6dyGS
	ZXsWjwqlUag2qbKNJNn2wDjkDojcSBedQEaUbJSDJ9qLOJpw+xt4WuzKL0KTeiHz+Ype4+iI9Ed
	/iHUdQTJ2kLAvIbavZa6mWiXyugQNnK5YXPLymZ++QGc1wrtaA06VZUMYusU8lOMn7pf4UlKNN0
	FYv3e+f1ckkVO44o1LArWpBgbrqihJhzpmG/WYDjes3RM0e54Po3F1kBd91EgnMNphk7k23FC2n
	h1xoyAoxOYyh/h2SDFdaksY7T3czKR3njK5JWvgXwzb24aK+G1XmKDXALjWKRXllkrCjIcjGNLg
	CAY8PzFVCTFsIzPfYBpeNkGl5Qlk6SD17Hks7V0e7VgjT2b7sxHp3p5sH8IBlS8v1HIaDocWM3
X-Received: by 2002:a05:6000:604:b0:439:b715:6f4b with SMTP id ffacd0b85a97d-439da8a78d1mr22493963f8f.57.1773081367549;
        Mon, 09 Mar 2026 11:36:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: [PATCH v2 4/4] system/memory: Have memory_region_type() correctly describe containers
Date: Mon,  9 Mar 2026 19:35:35 +0100
Message-ID: <20260309183536.88976-5-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309183536.88976-1-philmd@linaro.org>
References: <20260309183536.88976-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AD14D23EA92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[unpredictable.fr,xenproject.org,lists.xenproject.org,nutanix.com,redhat.com,linaro.org,gmail.com,kernel.org,rsg.ci.i.u-tokyo.ac.jp];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:mohamed@unpredictable.fr,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,m:mark.caveayland@nutanix.com,m:peterx@redhat.com,m:richard.henderson@linaro.org,m:pierrick.bouvier@linaro.org,m:pbonzini@redhat.com,m:edgar.iglesias@gmail.com,m:philmd@linaro.org,m:sstabellini@kernel.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

MemoryRegion containers are not I/O regions,
describe them as 'container'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 system/memory.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/system/memory.c b/system/memory.c
index b130d956d4e..2f2f96ab046 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3303,6 +3303,8 @@ static const char *memory_region_type(const MemoryRegion *mr)
         return "rom";
     } else if (memory_region_is_ram(mr)) {
         return "ram";
+    } else if (!mr->container) {
+        return "container";
     } else {
         return "i/o";
     }
-- 
2.53.0


