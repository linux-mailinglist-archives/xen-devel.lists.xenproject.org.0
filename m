Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB914B04B03
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043180.1413336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyw-0005So-Oi; Mon, 14 Jul 2025 22:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043180.1413336; Mon, 14 Jul 2025 22:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyw-0005Pm-GI; Mon, 14 Jul 2025 22:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1043180;
 Mon, 14 Jul 2025 22:49:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRyu-00047A-4F
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:08 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfe494a0-6104-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 00:49:07 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4535fc0485dso6184665e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:49:07 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd18ffsm13288903f8f.9.2025.07.14.15.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:49:06 -0700 (PDT)
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
X-Inumbo-ID: bfe494a0-6104-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533347; x=1753138147; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=CT0xK/VRPvLF9DlXfhh0fYneYEjkJU9MvXXGJDoyWlTXefzRPd1b2bNeQ0/2DWCu9B
         WZWQq9Di6Hfdoz4XvkoCnfbfoXBa5cugCplmktfn81IdLpLWF0IaeL13679DXks2Azeb
         K5BQK/FR/HE1+lJe61fdFk/WB5aaq69U0P6EqFj2vsa+6ZkXfQ4ouWGOkacpg4Tdnbq8
         68jMGLLxogftxg0Y7Huwjt/Chun9+0tTufrWqVcMli/jyhLqF6Zk8QIMO0Q6LRKMktOZ
         19RhFCSaCIyQ9ZILP/5zKLsz16ZkwuoKqVrTV7/A42M23dZoxoLbBgBDaoOCV6wU+8R3
         fKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533347; x=1753138147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=acCiKrDgxh/9hCEk3QbA0llNst9+PTR4Wt+kuAd/PWD60oKdpcEdkRdlCpVZ/N0Fs0
         cum4SeoeBe0GhBn+JYFKLYaPrscuWmSxiAq7sywRQ0hsFw2Fe+ON/lD902C0Up5YIjHZ
         lWWG5onD/gv4MbsyiUAG47iObF2X5NU2V+gOAuEUdqyKvLtRP54/JWMIFWPTPNGZ98Gw
         PEU8dMLshN4fw3Ng47Nlr5G2ceWWTK4Ya0KghTTH2Qo9YQaCuK9fqvQVs28u1nJLvMZU
         cC1S6ajVk/6b0ihp4BBcgmj1GmSFZ1myOhT5/8nriax9lTZnohYhWgnpm3zAbEY5ukw8
         6EtA==
X-Gm-Message-State: AOJu0YxubAtEgbk6nd7uVrKqrWMePAzxB03fCYwK64XjUx/ZHklmkddZ
	8atiSRahkgjKIIS1TYXsk1fPB+AR5qphlFP7iHs2eYjaygm0HCiHvnAJOADG8g==
X-Gm-Gg: ASbGncsYW3pRpS4K86XR3yYFFvRMTBBvU61MlIjbS4SOHtGRJS2a00psK7iklB6JY39
	oV4MsSz6IFhTxTJwoazmsA/v5e1r9xOfLGzKHJ3HOH3CzdUlC/7ZIJaXdUBpm/8hptfZZYeP7np
	iSK9bjpndSYhlgClL8mmtLTAPoJQbVkGqtVtL8lh58SU6NtG1KxuBax9qnnzP72sQKtY6xb1K3+
	EAkNer6T9nANdfuFtHKQuENC0jIw+8pp7CZEx01BLWCdjeE2j7fFXol9PHg7VKypzETMCdGgDnh
	CEYSuO0ichzj5XKkryxftprxSObI5JM2b7UjfPcRjUdISAtMY3hwApCPlxctLNuBWipvtH/Vn5V
	9fZGwyG2wk8Ax4MzbgTTuf05BO3KPwKfHJZwQZ+oZfEJNcKFf70HHBaeBCXMJWTxADjSjS2VBr/
	lBVJt0157ezExTPq0cmTlakQ==
X-Google-Smtp-Source: AGHT+IHmWKQU6lUniaz21l7BAYPMklvfsfcW1ZxGsPJxx9MLKqe2Kg3PcisaukB/h4YssXGKwjiZdA==
X-Received: by 2002:a05:6000:2908:b0:3a5:77ea:2d36 with SMTP id ffacd0b85a97d-3b5f2e4cf7amr4533746f8f.10.1752533346763;
        Mon, 14 Jul 2025 15:49:06 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 6/7] xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr == 0
Date: Mon, 14 Jul 2025 22:48:53 +0000
Message-Id: <569006946c0586a6befba0062eaef96ff0d72c0c.1752531797.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752531797.git.w1benny@gmail.com>
References: <cover.1752531797.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Since libxl finally sends the altp2m.nr value, we can remove the previously
introduced temporary workaround.

Creating domain with enabled altp2m while setting altp2m.nr == 0 doesn't
make sense and it's probably not what user wants.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 155ea1f79f..872e97999c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -739,8 +739,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
         if ( !config->altp2m.nr )
         {
-            /* Fix the value to the legacy default */
-            config->altp2m.nr = 10;
+            dprintk(XENLOG_INFO,
+                    "altp2m must be requested with altp2m.nr > 0\n");
+            return -EINVAL;
         }
 
         if ( config->altp2m.nr > MAX_NR_ALTP2M )
-- 
2.34.1


