Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICLXDheFnmnPVwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32919191DAB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240371.1541817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7DO-000232-CF; Wed, 25 Feb 2026 05:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240371.1541817; Wed, 25 Feb 2026 05:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7DO-000210-7p; Wed, 25 Feb 2026 05:13:38 +0000
Received: by outflank-mailman (input) for mailman id 1240371;
 Wed, 25 Feb 2026 05:13:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MQeS=A5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vv7DM-0000if-If
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 05:13:36 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc6f029f-1208-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 06:13:35 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4398d9a12c6so474412f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 21:13:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d401aasm30576270f8f.23.2026.02.24.21.13.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 21:13:34 -0800 (PST)
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
X-Inumbo-ID: bc6f029f-1208-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771996415; x=1772601215; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Fom4TdZ27OaWdE48V/WCmqpd1vRN9dFVw46MQX66F4=;
        b=J34kHsBBeb8XyMagSBxvshCtTJUHmH/m4A7dzr0Vj1HXJkccSPN15+ZqdCy+1z043a
         PxImRAS2sV2/esV5B4lYbPtkSDYweI1A1KN9eWaxt/iWWj4oDQfjswUWjtvuDMwW7hom
         XJ6YWT96WhofsQdmCE/SOIadPencp+FmOTV4FI96Rz5v+O0ZQ6f9iL7hWMKcXS4Ty7Ha
         BHSHY+ytH2FLy7l6whsGHjR8jjo9x3qwx908Elh2tV4cekvZazPQWCBl3hYdacrWf+cq
         VexzqUcQ2icl9ZcdrVi8c4hystn4YeVIa6y9ZM49dQTIbZJKqIPxWWQyVw5ibPPkuxnz
         7rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771996415; x=1772601215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Fom4TdZ27OaWdE48V/WCmqpd1vRN9dFVw46MQX66F4=;
        b=gPIOlX3FtxSkSrwdYzLP+t5Q4SRH1iRwQkmKnuSJE9hQwtCTlLGtKu7Uqy8fELqO2m
         yRy5n1LCTKYdgVKne6envH6T5Ps5z48WoERx7iGg/ZBWv5Sz0mqOzb2CQTpO+X9+aNXn
         I35p28Y6bacH5lhaA4Y5jOMsdFUidnxpbySqRl+pwvt2w7ed/E2pSKdQvZJ6IiAY7aVA
         ako8MCknoNVd8sbY+XkbLD7Nh5g6SDjo++e0boQOCAJmEsJf4K+Jo96xXNtRyFcU06Fw
         tBH95b3qiDE9fphIA/s11BAEEVjMLYaCeDxhc9axgIz7xv0IHiWVtBM2vQ2ShCOCpJVD
         yAGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUngO0sonvHVpPX9EOCIFndCturGsTfT78MLmoSczyskBiK8kxpAsvI7jex8sfG8en3/KaPwpjDEf0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKYnujV73IvpMRJAj+zHqeDuBp57Twaf1z6u9qEeAwzG8vf3O5
	Ad4kCHTrwhMU/Pz9DujUB+f4MwPEh8hqCVHfvX6/grlRbfKu52zGtRST2so1ZqYwPgnXaZvxcQW
	AzjqviNI=
X-Gm-Gg: ATEYQzxnae5x2/y7RgBbmVlsp+nFLnYkeBusWQEIaqrcEHS4DKvdPHy7xDvsdp3qDrf
	dmpEm0L3DmkHxM509812DK9izOQTLjFnzsUcGnFVZU44StJvO1uWdhBbtZ8xAidQo0ELPZDJibW
	6Wg/U+/YIVyXhEuizNZLHlgaaWNSvF4j12L1fvFLXSuK86pyE3y9tEIDyV4S2qb9M5GpJcoGZ3a
	RHm1LuwC6slsTNUK6KQ3OfIdIZk20B5BRUYWfREf5TPyXIKUtCHXKmrcFvD0cgmom+jNbkT7G8y
	Bq+0jFX/2J3Tc0vclNMGWDYGIjtDLWex+p0KzKFZUJ1lD52pJdKMGiiEvlVs/LDn1ab8GfuUhSu
	mKcGFoOF0FnOE7EAyuSiaHrnv6Ozn53gddGjLSBvvnORJtE/bCZBMypYz82/UExZyN4dB+I2UbD
	1bnKR26elCETa/8/NPNNiBtBWk//ikoXfHYBJHHRxo5T4aeSX432OGd++WWp/+Wej/lyfrILLP
X-Received: by 2002:a05:6000:2406:b0:436:1872:63d0 with SMTP id ffacd0b85a97d-4396f15ce72mr27807237f8f.2.1771996415096;
        Tue, 24 Feb 2026 21:13:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 4/5] accel/hvf: Build without target-specific knowledge
Date: Wed, 25 Feb 2026 06:13:02 +0100
Message-ID: <20260225051303.91614-5-philmd@linaro.org>
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
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pierrick.bouvier@linaro.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,m:philmd@linaro.org,m:dirty@apple.com,m:rbolshakov@ddn.com,m:phil@philjordan.eu,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 32919191DAB
X-Rspamd-Action: no action

Code in accel/ aims to be target-agnostic. Enforce that
by moving the MSHV file units to system_ss[], which is
target-agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/hvf/meson.build | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
index fc52cb78433..6e2dcc4a5f0 100644
--- a/accel/hvf/meson.build
+++ b/accel/hvf/meson.build
@@ -1,7 +1,4 @@
-hvf_ss = ss.source_set()
-hvf_ss.add(files(
+system_ss.add(when: 'CONFIG_HVF', if_true: files(
   'hvf-all.c',
   'hvf-accel-ops.c',
 ))
-
-specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
-- 
2.52.0


