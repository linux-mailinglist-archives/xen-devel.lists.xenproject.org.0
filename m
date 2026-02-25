Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id f3q1LxWFnmnRVwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F6C191D9A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240377.1541827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7DV-0002Vp-IS; Wed, 25 Feb 2026 05:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240377.1541827; Wed, 25 Feb 2026 05:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7DV-0002So-EQ; Wed, 25 Feb 2026 05:13:45 +0000
Received: by outflank-mailman (input) for mailman id 1240377;
 Wed, 25 Feb 2026 05:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MQeS=A5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vv7DT-0000if-EG
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 05:13:43 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c098c1bc-1208-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 06:13:42 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43990aa7dbaso99944f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 21:13:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4bf89sm29682387f8f.29.2026.02.24.21.13.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 21:13:41 -0800 (PST)
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
X-Inumbo-ID: c098c1bc-1208-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771996422; x=1772601222; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGvKgLHeevLALbSBED4Jn7ttMmQ4t+uZlwFqVihbumU=;
        b=WGBpe87CWhluhZLqfHPeu2oHa89r7HnA+2hgSm6BZJM2FVyK8LwfqkFtbY4RbvTWA1
         fC5zP+hwJ3AFx5Z4AnIekwSrY6fd9LZEU4m64BUqQ9XRRP+2pEPXbcldIrwgbgdBiTeA
         3cpHxh5uV90SoXLKJKzVB6AryUCIC1ZI6a7w54rIehE7L7HFd8ewaqmNUTMdiFnEk3p9
         5/IK0t3hxiK46DUDtuWHNbGNs+XJaNkShrXEgfOS9+0au39roXedKxUeSyqLj2ov5tbE
         w03UjYE/H9xWZqABdAF4MmX2HbsoqRWWWgbNI4oiw//UdOtBvuOyFr3RdNZ/AU9XhgaD
         6mHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771996422; x=1772601222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CGvKgLHeevLALbSBED4Jn7ttMmQ4t+uZlwFqVihbumU=;
        b=SMNqYwnesKJQq2xISx71s0XgmENJrsR4XKGR7qXzWNwsd/lfFkMh3rAlAsgzYW4Fn/
         ivwG/nujSugA1769NO3DM1sPaBaiB7sH5DunHAXQnxlZcS1DbEbAHhEVzRUncVAqkizk
         1vzfCoB6L5yoxLgMl8naAKLdB+8d5k9Qn+fCiIC/UjyFLS8kb9xfh92mk8mYyaNx5+Yt
         bvbl4Lfm8Lo2hAfd4Jjm1QwPEAU2pBO4ou0EvYH445Lg6XOrvWCFZEvmV6CFZ3OOAYJX
         +kqmF9oKlPzim5PqN5kz7OpFqWeBWl4sN6bb9gb7T/ET8s6tTgiC54AnbsQHllrvuqm9
         aA7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5IPiYGVsQ/WqeOy+jHg6baEvmiSPMgVURWNNuGB9vD5/zNak3EgtRWkhmzbMsrnMVH7L3L1zfS0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxetWQh+bv4q5Ne/OiT9nLQwGOIT1DrTldisX+iF8JtYz5v3gN
	ly6UqaeXkRX1zeKtQV+P4K5LNm8bT35YvXYj0IPwImPQ0QqAT4RbjwAlLaGKSTd8Y8A=
X-Gm-Gg: ATEYQzxlHedS6YKR1Q48+XZsXCAV9ueoW+1CyjnIgD8812fFW8mGw47yI1tXRJmPltP
	cNUVB7Zw+n1dSKNgvfvaIQ6p/NXT3vUTaZPP1uTpQXtBFZELj2kNOFg5EPAzWokdQ4ys57P3++0
	nJm/WbqRQAo/ScpEStm6bLyU/0lUNIzNIdvrx6rcBBh+6NIgF7RcYn5kwCfreu7YQrx03eTfxAt
	aS/+WIkVWxQ5+RDHJxSuiupSde4I2LqxpankvLjx2ltMxOCsZLMml8sxFSQcksHVa8UGaw6d8jW
	J9XcxfTk7ilm6PJT6OW7g+2BK1pVg3n4WEz03GvyePWQMSaRXDq4uWx24wCtHOQHY+KVqEvtJrD
	+hjGsbTRT5JUj4ayV4fVzNTLtxewzJOczRD6kWwgG9U9Xq+USF/bMsc7OzdKLoBPJqNrKq3IxpH
	Zrh3cl7t557Y3g9kSLlT647yESW25Hm7k7E1g29dBz3yQayH+4Gsucca2RE12NZ/uK22mYN6Cm
X-Received: by 2002:a05:6000:26c3:b0:437:6758:ce70 with SMTP id ffacd0b85a97d-4398fa70637mr1467991f8f.26.1771996422125;
        Tue, 24 Feb 2026 21:13:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 5/5] accel/xen: Build without target-specific knowledge
Date: Wed, 25 Feb 2026 06:13:03 +0100
Message-ID: <20260225051303.91614-6-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225051303.91614-1-philmd@linaro.org>
References: <20260225051303.91614-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,redhat.com,lists.xenproject.org,kernel.org,xenproject.org,xen.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pierrick.bouvier@linaro.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,m:philmd@linaro.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:paul@xen.org,m:edgar.iglesias@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.976];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B7F6C191D9A
X-Rspamd-Action: no action

Code in accel/ aims to be target-agnostic. Enforce that
by moving the MSHV file units to system_ss[], which is
target-agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/xen/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/xen/meson.build b/accel/xen/meson.build
index 002bdb03c62..455ad5d6be4 100644
--- a/accel/xen/meson.build
+++ b/accel/xen/meson.build
@@ -1 +1 @@
-specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
+system_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
-- 
2.52.0


