Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BnviDhraS2rDbQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 18:38:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B105F713627
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 18:38:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aRxfw7vM;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355757.1610529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgmKU-0005ar-RI; Mon, 06 Jul 2026 16:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355757.1610529; Mon, 06 Jul 2026 16:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgmKU-0005YZ-OA; Mon, 06 Jul 2026 16:37:58 +0000
Received: by outflank-mailman (input) for mailman id 1355757;
 Mon, 06 Jul 2026 16:37:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wgmKU-0005XD-08
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 16:37:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgmKS-00Adyc-I5
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 18:37:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4bd9cf-bab6-0a2a0a5309dd-0a2a4502cf14-14
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 18:37:56 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4bd9e4-5a27-0a2a45020019-d1558034b8e0-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 18:37:56 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493c2b3dc8bso22605875e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 09:37:56 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493df703cb2sm3801955e9.1.2026.07.06.09.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 09:37:55 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783355876; x=1783960676; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cjNRqrrJLk2W6SGzo8beliTyUJCqSZi+CwGes2sN5O0=;
        b=aRxfw7vMCwN+MiXm+CWeCw7tRWFMixtVct+EtIgQoeQCRYwtYGP0HJpXni9OnwFaya
         Cr6eEYaGPiY2qVbw4zkOwKsDafo1O4Cyn1CVslKMaI2mRjdN8E3lr7KSs4sPhuyK2mfD
         tgxrAKjNvQb3ne+UL534ZzvDEpM7qcgtuQFA8GwpDwEgw/xFbtNwXL0diVvQl3gcDiOj
         mxgSAHzFA/qo9Em1Ur/aCm/trPqESZjPDCYrOmPGzHqjhDkPuFIljvfrAxzaY48kVUgJ
         1wGkK7U+XeDITG9iGBbC2nktekP0lCt2nYMKOb2uvBgqPijGsy2Vaa277lEcV12sK2WL
         2BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783355876; x=1783960676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjNRqrrJLk2W6SGzo8beliTyUJCqSZi+CwGes2sN5O0=;
        b=jEwpt0A2RAqYSWMWn5vbu5nJ9nUTkAfofSeJCj0KbTuq5NBobW2npAxBuNFYZlNOxF
         clpPrVx48Pb6IOYf2NUXSd991cd740Ox9zf0OxFoItguTcmqauLeJc9A0lZS0Kyzvrnr
         NTfsHe+XeanJ5t1FLtCb7Vb4ClZIT7HN8SODWckPAKG4MtZVUqs1tYkUlwM9J8/6ztq6
         kGGZm3T1I9I8TYIp3oSgElRL24dlNCvH7iJIPOlXvuZPdS/T+hI4fGXpp8DywUr15gaj
         hHSD++CpwWlpRsPKK+GROlGShy2igHghvkbwgO/1haKWX/x8Ypbu/Y7e65oHoW9U0Aoa
         IcMw==
X-Gm-Message-State: AOJu0YxVXWTLmUrjsA+gjj8T2HMd4hfKiqOue4af4o2I4hX681Rc2oed
	9HVsjzM0TQSed/615TDkDlK0xA7cwOaxoiK/TB0PdWLn9cbDwjobrGn3ODMBtqMeEtQ=
X-Gm-Gg: AfdE7clIhJKwxHWadnEKFXhhk3NphPlM/Yk1wuMFcZZOQY79lTfR6xH5fNX+0HaIje+
	VJthQR736r9pCLDG0NoTzDpwIeIX4qfwPGZguI7DTPvY4OYB9frJ1444gzscH5LLcPwMNdVtIR5
	e9CQTqjvlD1GW8cGCrh4cOA9mz8fpfJbvCP8ksE2NajDXGkgWfnxpkjLnkPSPQ7ah7D8NwhApSi
	B/poDL0hMLb3Ur8V1N28veVj8kOkinnBJlKCLzyYvF1TV7p9PI77BN+SE+7SwX2ZhTMt6TkEimD
	2qo1+t04XVUX9ndQ63ehPBPm/yW6MoT/W4fmfmWOdalUefNSPog+K1qpdLb7LHNrAbNjwkxwf65
	ks2fffXUAJhpTtNje+fCKa6QxhVwyDce+fHh40uFN1M1AoL5mXU/oCHXDUaMibbcMHqv2oILKA2
	Gwv0rZ/y2VsG8MHTuFMwWzvQCBlOM7f0wy59N7NfRpnLVJa6vMfjcMuW3SIRtA1HPcbTZadCoaC
	gOCo8U3bwO97TVoLLA=
X-Received: by 2002:a05:600c:3b0a:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-493df062bb4mr14519425e9.6.1783355875718;
        Mon, 06 Jul 2026 09:37:55 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] Fix typo in comment (indicies -> indices)
Date: Mon,  6 Jul 2026 17:37:50 +0100
Message-ID: <20260706163750.445797-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783355876-566EE7C5-8E9BA3BE/0/0
X-purgate-type: clean
X-purgate-size: 634
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B105F713627

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/traps-setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index a79a3b2013..3fe79ff0d0 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -245,7 +245,7 @@ static void __init init_ler(void)
 
     /*
      * Intel Pentium 4 is the only known CPU to not use the architectural MSR
-     * indicies.
+     * indices.
      */
     switch ( boot_cpu_data.vendor )
     {
-- 
2.43.0


