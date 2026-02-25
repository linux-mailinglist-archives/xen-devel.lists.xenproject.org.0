Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BqzCheFnmnPVwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C9191DA8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 06:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240363.1541787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7D1-0000zK-LZ; Wed, 25 Feb 2026 05:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240363.1541787; Wed, 25 Feb 2026 05:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv7D1-0000wX-Hd; Wed, 25 Feb 2026 05:13:15 +0000
Received: by outflank-mailman (input) for mailman id 1240363;
 Wed, 25 Feb 2026 05:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MQeS=A5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vv7D0-0000if-Ak
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 05:13:14 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af52f14b-1208-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 06:13:13 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso69995835e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 21:13:13 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcbf894sm2825775e9.16.2026.02.24.21.13.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 21:13:12 -0800 (PST)
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
X-Inumbo-ID: af52f14b-1208-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771996393; x=1772601193; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqrb1njuSeGzwFOqvJshYg5hho1sLouIHptMUptf6Ks=;
        b=dcitrbUJ8dgQnl8EnkT7OO02wnGhVpS3hwZlSIbS4/dFLVPGMszetSped4YgxcQevv
         BCtmwgLbu9svuLfk98557TnQBU5k0vwTNe4klzkUpwzPT5gmVoigbObJoeLRyYH87+X/
         T38ieABZcMz15uhbEGo+urVEyMnyULue7DrwaUhl4gkegYk3kAzr6Bygfg/hpEXL/gvk
         EI6/1jvG/VOjI34yTRVSSfvvK5mfo0yvwYp56vGgL0fkEQd5sHW2Ho+yE2Qq8GE/jEBD
         WhxGwZ2sm2jIHrn799RkYMTWEc28+h9YhWDUyLr9RpmeMfbbrVzGCWneVVAWBwDESaH2
         o8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771996393; x=1772601193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqrb1njuSeGzwFOqvJshYg5hho1sLouIHptMUptf6Ks=;
        b=D6dwvVebESyeemdlXHuhncGjz+/YdVlttS3IqjBTo5Le9MdJfrEPc9Ml+QR+4JOotX
         tq2uDMepOiHMFYh+oGqQa79DdFVrybeCoEbJd84gvpFm0TCcQM/Ass2dakfC8dLlYPq9
         TAjmJXFz5KsOUNwU6CbliUqqKfSAukaLXHgLGKxV/7Yps5vFvHOqv3aKpGd4vE7cWh6l
         GgmLGtM+G6bcQAHTAEAqABNFxdwfGmDaXipvYFNCIzqFT/o6zOhOIXR5JVdLR79ZPAHU
         TZr/tHoLj3hoYLM9MJjhw2ufQk22454CAfRYgPDGse/s4IknHz4kv7Gs7cfwGYs92uZ4
         6QBA==
X-Forwarded-Encrypted: i=1; AJvYcCWmLJvmM4h/GG99oMYl+YaBeak1+6aULMKv35Em72d1WZcxGuMYRbJUUpVb2H/iVTUVs26hF6CFe94=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySGuoeOja4lE8kqd36v1RVrZ0sLzGMmvbc8ZhNFwWpA+DFYWl4
	B4QoX/kx2EiMRGTj4zFgCOsosASu2+tMIiSiWp6TBsj7NxlwuFqqhLJfQFKIfe2E8Kg=
X-Gm-Gg: ATEYQzyFjFPjAcMZ/apDjsQIGI9+QG9k24x1bMkl04ADWRjdY8oMM8e6BdoXLIWVwjW
	fXKhGBnUKo2KpHgo2OyxHHeQGUHuYj0SWh539JOjz3YDa8UnZoKUw9y5YbGyu2AwaGhUstJfchM
	IJ4iMUP0GOLhURf9wWf2uYV6wdLQNcYROKXX1KHvw1SWxMppdnLgj+qcuFOZ9cBy/aee4eS713w
	pGFzOwkuLc0Za8w/nm43SvDwfE18dIs/7DCtVA/4kyGb3t7WZ3mIBiCoWACcKtzV+ju5NjkbnED
	5kH4Va7UN4jl5VMuHAGHh4ZqqfI42KWkpdmhp7pqXwWexPhAeWHDXnUa9qMq/kUP5d1+HmOqRVb
	IjE9o8V014lZTCr7RtnCxT4uD3qiKL6//V35xvwZjbg9vnx1tySkbnaKh3YjFZVvChcd/YuW27Y
	llCUeyKX3paa+S93OoyAihpqKdUW9gaEgACO4AJ/DmwIzUx9erF0O8w5CMqBvtnP8k9z8Cb5ta
X-Received: by 2002:a05:600c:4692:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-483bef54059mr19754265e9.23.1771996393138;
        Tue, 24 Feb 2026 21:13:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] accel/kvm: Include missing 'exec/cpu-common.h' header
Date: Wed, 25 Feb 2026 06:12:59 +0100
Message-ID: <20260225051303.91614-2-philmd@linaro.org>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pierrick.bouvier@linaro.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,m:philmd@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 222C9191DA8
X-Rspamd-Action: no action

kvm-accel-ops.c uses EXCP_DEBUG, itself defined in
"exec/cpu-common.h". Include it explicitly, otherwise
we get when modifying unrelated headers:

  ../accel/kvm/kvm-accel-ops.c: In function ‘kvm_vcpu_thread_fn’:
  ../accel/kvm/kvm-accel-ops.c:54:22: error: ‘EXCP_DEBUG’ undeclared (first use in this function)
     54 |             if (r == EXCP_DEBUG) {
        |                      ^~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/kvm/kvm-accel-ops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 8ed6945c2f7..6d9140e549f 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -16,6 +16,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "exec/cpu-common.h"
 #include "accel/accel-cpu-ops.h"
 #include "system/kvm.h"
 #include "system/kvm_int.h"
-- 
2.52.0


