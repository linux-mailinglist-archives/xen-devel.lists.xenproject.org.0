Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLCSL2zF8GkyYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B584870D3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296350.1572843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVn-00086Y-MY; Tue, 28 Apr 2026 14:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296350.1572843; Tue, 28 Apr 2026 14:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVn-00082A-GD; Tue, 28 Apr 2026 14:34:07 +0000
Received: by outflank-mailman (input) for mailman id 1296350;
 Tue, 28 Apr 2026 14:34:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVl-0007k2-Jh
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:34:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVk-008eCF-VT
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:34:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c54f-e002-0a2a0a5209dd-0a2a45029ad4-42
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:34:04 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c55c-af86-0a2a45020019-d155802ec4ff-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:34:04 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so80811895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:34:04 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:34:03 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777386844; x=1777991644; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqFpc480FdxV8KfuWU6Tba6XEMUhYTqnR2Ow7MIb3es=;
        b=Zpx32NRjOOzZURec42VPOY2f1eFIkJyCZcAi0hlApKXkeOwt/+th3KuNaEGhfcO7hQ
         GtmyC4ZaVTEU7toT6fkx+0iR36k9tcJxlucSUujcRw67Q4WiVMpnG2tTCqtGBjFbKsPw
         rqUVN2MHuUcsxMqjhN8EhfUuglvPMMtVeC12sS2lsQeaKdQsjoQzNKjBwnHR3XU2gX0c
         57sJRbexKaaiUjiRY7xqAXCUVivcbtVGMjOijHQvt1EbqwqO/PDY/xjtoAOY7q8HgukB
         Fgmrn28CPb/S8+IJs/c0LgCiwBFHXq3Y2eM2pKaZ9YFpPOB6Z8ifvdScqkOKHCKAYPWJ
         RPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386844; x=1777991644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqFpc480FdxV8KfuWU6Tba6XEMUhYTqnR2Ow7MIb3es=;
        b=h6OOFe10MO8sv8DuIhabf6xYj81O7ci41e14nVJo6jZlhjtgFPo8Va6VojaPwQ11lK
         xTywrAB3HWSYTuXHkp7M8gbZHtaYM3a3+IdSOqBOWTwYkhUFO7F4MCYuH80tBgvNUx/e
         5l31P7JPW7cKx/nfBiEqbKxDjyNirmhyJ2EMd/AHBz54fS19m3gA0o5iobPmFgEJELn/
         YYKSU5AMPqBaI9m+LaxN03iRXQtgZqH/HArw89tlI8pfhzQ1u5J5d3FfkiS26VSRoIau
         X5kiZ2BnA+ICPiPTaSDUaT87i9BByFULPsFXUO7h7fGtLwWy/5DSZ8q/r+Qre8HC+RyA
         ON3A==
X-Gm-Message-State: AOJu0YwcrRLt08DhEzeDeO+Btm+ofShEQx17wa1FDNP+K2PrTAkvoyL2
	W2XoV576CYNF729BoJyS4Z5iegKt4tnGmIoYACDdgM0tzweLvsph7NP8574vEw==
X-Gm-Gg: AeBDietklzQOD9ofmnzH4e8J7NaVGuuMzxpUaln4MmR+/60hLGi9r9+JOSokuAeq0bm
	Ey8uAcSmqHYLGx9cOos/bEEtMLMoLPyLBM399PruxKY9R5gXRiU1b2NEFctAkVBPI0kLUjmm+fL
	NSOXSZPpyKH1lMMeE9dgcHh8lbBzTT6OR5knUYuR/+IPOVqr4bebvE4Cw/MWadU5EUTGdQEkUFN
	rkwprrxXE0O9U2WK2GVoTBSJgHV2B8VO9fnEodwZJSi+GzdfjRKqUjCqpdVezJx2JM/VP27pyBl
	ng7hAMC+doW4imY3J2EkNMVPkqZodHGZ7ic0YGIQNILJV/gx5jfk7fOGUlRpzxNnjJdzA4NU8Oi
	cWR+aAK7p0XLC+VIwZY2AfgtIsYcmjsSvL2E5uzDg0C/7kmvYfmYs6RFya0JxCItfVe7Ffs1plE
	KszyKRRU675WbAYNlj70mkwKgmJNk4RNFoIu/7wC6RawFC2sNXS0Gz1dmNRyrqsvZOYu+yZwzb/
	5aO
X-Received: by 2002:a05:600c:6304:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-48a77addb16mr54486345e9.2.1777386844013;
        Tue, 28 Apr 2026 07:34:04 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 11/11] xen/riscv: enable DOMAIN_BUILD_HELPERS
Date: Tue, 28 Apr 2026 16:33:40 +0200
Message-ID: <bd9d283fdeb6ef5db49f486f4750da22751094c8.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777386844-88EC8161-68C3A0B5/10/73395122804
X-purgate-type: spam
X-purgate-size: 911
X-Rspamd-Queue-Id: 98B584870D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.096];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Everything is ready to enable DOMAIN_BUILD_HELPER which are necessary
for dom0less common code. So enable it.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Move introduction of p2m_ipa_bits to separate patch.
 - Move to separate patch introduction of guest banks constansts.
---
---
 xen/arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index a5e87c1757f7..41426c205292 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,5 +1,6 @@
 config RISCV
 	def_bool y
+	select DOMAIN_BUILD_HELPERS
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select GENERIC_UART_INIT
-- 
2.53.0


