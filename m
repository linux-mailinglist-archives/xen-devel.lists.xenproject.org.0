Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AS0HV1JzmknmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CEB387DA2
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271526.1559687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaJ-0005R8-LC; Thu, 02 Apr 2026 10:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271526.1559687; Thu, 02 Apr 2026 10:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaJ-0005N0-DE; Thu, 02 Apr 2026 10:47:35 +0000
Received: by outflank-mailman (input) for mailman id 1271526;
 Thu, 02 Apr 2026 10:47:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w8FaH-0004vd-62
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FaG-00Ej0u-IP
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:47:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce493d-2eae-0a2a0a5409dd-0a2a450be30c-20
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:32 +0200
Received: from [209.85.208.46] (helo=mail-ed1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4944-bca8-0a2a450b0019-d155d02eadcf-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:32 +0200
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-65c4152313fso1006449a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:47:32 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3d028955sm76392366b.61.2026.04.02.03.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 03:47:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126852; x=1775731652; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tm0K7gfsRpBFVrENvrubslPphiODpeHwAJ+aZ5FZLuc=;
        b=HFYnDybK1UebaDizt6eZk5c/4D3c+mPJXXC6AbSiViBhbZG5antkrqTM9lJUkh3ZGD
         neu0txMAzrokKucmGjVz+qCAU5oPoVFHgNO00ejSQdWPWJabozdybnkBVIc+46aD7KFc
         kRN//S1D/0uVC/AZywsm+MRozj4nEvC6ZWn2eLHKsxOcb9Zn0c4bmO9as6M5B9h/oQBF
         rRpkkoiBCRplhwBANaIGo64VeXvlgUNXvAVtelFJKnWwuQBXOqNpN6tnE6O3U+mdY6EI
         KhjTUuYCukQ3n5RW1ViuDMKzTrgp0O9s5zbe2xbOkeX+jiXzzsVJLmH/yub36nb/uTS9
         HsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126852; x=1775731652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tm0K7gfsRpBFVrENvrubslPphiODpeHwAJ+aZ5FZLuc=;
        b=FlAzh8urW6VtDmpUrQ4PIzbfsw8YxRyC0u6808JRJo0JZGDcST3X4FB7izpnd+OmP/
         tiOZCgyqtnvKfHJOyqjhbNVn/lbYJ78gBTIfaA61mDLrowRxq6xdMwOFxrPoRLFX2Dyg
         elqeBC2BIIut92kS1thTWZHx1ZuLUqf4byz6zMdm0ga5hCicFvbeg4jS21GJG3wMLit4
         ymhdeg3ihvs1Q7n3HxSxkMpxJTSatorShWhTdLHZ+xtEt/IRkXWIxcWtQXebiTtvyGF4
         0h1NIDhLNxMvAle+UsvRJyiR5gHC3B9D8zRnsqYJEWz9kWNpS3bwiPABDWAjoQYBgpUL
         B4LQ==
X-Gm-Message-State: AOJu0YzDWOsv2om6poBHpliKwqJTujoEwPNq4xMV2CKCqe+YSVi8QIqC
	LFb7k1TuJj1v1+V4uuTldCLy/tE1Vgp04NiIXl10ear8U+Tscf5G2oBxUiG9sQ7N
X-Gm-Gg: ATEYQzzCqvHHryOIyPZlc0Jc1lLNhDkoNbLXIVl4tt/uNWAe/oKqOHEln4HuWOI1wSn
	pt1bxl6S5bJqKjj34NMcPejC8+HHwi6Z9gcgiMR65aYnEsm5x3M66jN2Ala/+m1vyrVve7QMvEa
	7047Hj6qnT/Gu3oAKcItDtMkRmDLrYfAn+SU+E7FDSumGInnIeeXiQgfmYyBT72zSbGdVj2pqQ+
	rhFUPRsc0lhZIIcoX3SzPteQp6C09i2HwBe7k5kcDL9H9+VMcZrNsDHtEsItdyVWFGC9vIuPItn
	YPBXQAxKr6B9w65gMSVMeNMGIq1ZWwFMQ/92fVCG68nTnYuEKzpq9LBkmG+myCfgUZ8mMjjav6A
	kgM/UwEtUrcz3peVq7q2w44UkeDSC2Jwf8y+b+YkcLhzAZVFZm4BduBKcLE/1PHYYgKs0/As3+V
	neZpebnNnjMkaT+Tx/A9yMlPX1RQ==
X-Received: by 2002:a17:906:6207:b0:b98:3d79:40c1 with SMTP id a640c23a62f3a-b9c13b0a2f2mr479932666b.33.1775126851612;
        Thu, 02 Apr 2026 03:47:31 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v8 06/13] xen/arm: tee: keep init_tee_secondary() for hotplug and resume
Date: Thu,  2 Apr 2026 13:45:07 +0300
Message-ID: <666917e8e8e435640c272c19908f412c315b2dc6.1775125380.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775126852-1714D2A1-F11E7718/0/0
X-purgate-type: clean
X-purgate-size: 892
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 21CEB387DA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

init_tee_secondary() was marked __init and freed after boot. Calling it
from the CPU hotplug/resume path then executed discarded code, which
could crash Xen. Drop __init so the TEE mediator secondary init can run
safely on hotplugged and resumed CPUs.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/tee/tee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 8501443c8e..00e561fc78 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -128,7 +128,7 @@ static int __init tee_init(void)
 
 presmp_initcall(tee_init);
 
-void __init init_tee_secondary(void)
+void init_tee_secondary(void)
 {
     if ( cur_mediator && cur_mediator->ops->init_secondary )
         cur_mediator->ops->init_secondary();
-- 
2.43.0


