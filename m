Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mZ/gKRWFnmnPVwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4122E191D91
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240367.1541807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7DG-0001Yh-5M; Wed, 25 Feb 2026 05:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240367.1541807; Wed, 25 Feb 2026 05:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7DG-0001VK-1J; Wed, 25 Feb 2026 05:13:30 +0000
Received: by outflank-mailman (input) for mailman id 1240367;
 Wed, 25 Feb 2026 05:13:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MQeS=A5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vv7DE-0000if-Lr
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 05:13:28 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7e6b066-1208-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 06:13:28 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso69997215e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 21:13:28 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd702e7bsm48222585e9.5.2026.02.24.21.13.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 21:13:27 -0800 (PST)
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
X-Inumbo-ID: b7e6b066-1208-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771996407; x=1772601207; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9StylsjjkPu8pnZ8zwuRErmCy8w6JuJLaaJ30WKTm3g=;
        b=i4bGs2wdfGrlcLNac3UNMrGPtF6KvjL7p/+YaYpFlNd13/99xSe6TlHvZxMYr6z+Kt
         rG6WARgNxWN9RUzmCDhcCGDYHBEyakR9H8xwhgoABsQsy33XnJ53USX6tmL+gqZv8772
         gt8wUYF2jnO0UeSbj3vhIsf50UDLbjX3OA2y9M0Q42nriPxI8Alzz00CbXPIrJWCOGG6
         nTd2cT406WP2rQpCyb+hHtOue/lFIaZNb5CiPkN+aUSVRZ6kkwPPKHQ+J4qukmG6ZOzS
         RwhID/WoWey47JqJSku4Mg+xY8XvzL9xiirsWSC1SM9eLeFxCrnqRAixgr2aS/D7FsDH
         wEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771996407; x=1772601207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9StylsjjkPu8pnZ8zwuRErmCy8w6JuJLaaJ30WKTm3g=;
        b=DnQLXTxVpSikBctUUF3Db5gzRmbSptWOOYeamrkRMfgGCpzzLB7mKjsrA7kZDZPI3t
         wG3rLhqk2mznVXEp34N9ZZaM1tAkuGaLf/DzurAA/DIvZM5Eg+5yiWymPgHIBrO5Xh34
         +JX7iMn4FeD6wXEmB5S6W+ZpK9fcgzCyEeXhciATBUmELE30RtheqMHNKDVDxPGNbPqb
         dHaJRiG5mWDRXD4HqRcIImuzyYpy+XrrIw9dmLgkhtVmhTm8g+KUhaMNbYlJakKgWs18
         CFG8R+1YKwqOZRi1hW9VEZ/PLhxbxWm7J6xWp1m3SRbJ+A7LwIUBWmMBrHi9Be7eyY/N
         ZHag==
X-Forwarded-Encrypted: i=1; AJvYcCXyJNjBvbGjpxm8klTOD6ixyH49bfQSs8x8hze96nEMrXg0JG6rgfUR/AYsxelXVGz3o8ZiWme2VCE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZAFywz+i7gqvM/uKZ6/rHSQ9/Q1WhUv4/LTJv1hgIcDSRy87n
	ZUPToDHNkP7QT8ch470IRDIrgOerkQ7Gzc2zSJe5HJe3XxpRE9OYmZIU1zqQf7frWEs=
X-Gm-Gg: ATEYQzxpe3Lw+uCW/pwPqGBqgj+OqXl1gTMr34wmMi8l1oZJZH8vDUet9GDDTP9v0xa
	M82TENVZlQCeE9yAvKF4ajhy9yHprcmk5yhi+3M9DnO7T0Tt7C6fzzS7fwl4O4uHsMzbs1+4Jxo
	/GJpKrVUtIU2q8S3UpCdo1vElIXNyxHqwTExR7ZNj3MJgcn3gjKnhkwWdJTsi1MNML0q+3Cwfcl
	9VVr3v4bbUJVnmeYpe2K1g4Pqa8mNpN7r2DT/wdN6my92hfitwZn1AC7J1CcEF8hQf2KTSL1oWk
	I6NRz3/3G4A2+8oAihe3yjOh9RV0g21iCuuhUgoZHYku8X79U3kxDcuK33KfAGWfNhLDgV8hJ3W
	85zmmlGH34LiVsW2mJG2JQTAP5UsANmHeffG6wSgmVtnT/3Ix2tsJ60cXxeCj9Zy00M6NSXVblb
	uU7SJbz9wuGjMy8rdfm/onZaJczj4yGqM8N4PcARO0ECM7bNVDibvVJm/HHq4T8jtIHpYBI9r7
X-Received: by 2002:a05:600c:3e8e:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-483bef5aac0mr18344565e9.27.1771996407557;
        Tue, 24 Feb 2026 21:13:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Magnus Kulke <magnus.kulke@linux.microsoft.com>,
	Wei Liu <wei.liu@kernel.org>
Subject: [PATCH 3/5] accel/mshv: Build without target-specific knowledge
Date: Wed, 25 Feb 2026 06:13:01 +0100
Message-ID: <20260225051303.91614-4-philmd@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 4122E191D91
X-Rspamd-Action: no action

Code in accel/ aims to be target-agnostic. Enforce that
by moving the MSHV file units to system_ss[], which is
target-agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/mshv/meson.build | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/accel/mshv/meson.build b/accel/mshv/meson.build
index d3a2b325811..c1b1787c5e6 100644
--- a/accel/mshv/meson.build
+++ b/accel/mshv/meson.build
@@ -1,9 +1,6 @@
-mshv_ss = ss.source_set()
-mshv_ss.add(if_true: files(
+system_ss.add(when: 'CONFIG_MSHV', if_true: files(
   'irq.c',
   'mem.c',
   'msr.c',
   'mshv-all.c'
 ))
-
-specific_ss.add_all(when: 'CONFIG_MSHV', if_true: mshv_ss)
-- 
2.52.0


