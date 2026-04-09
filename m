Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HPCIt5l12myNggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:39:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389953C7D90
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276853.1562158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkvQ-0006tZ-LV; Thu, 09 Apr 2026 08:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276853.1562158; Thu, 09 Apr 2026 08:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkvQ-0006rL-Im; Thu, 09 Apr 2026 08:39:44 +0000
Received: by outflank-mailman (input) for mailman id 1276853;
 Thu, 09 Apr 2026 08:39:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wAkvP-0006rF-DT
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 08:39:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkvO-008mV5-Ih
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:39:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d765c3-5cb7-0a2a0a5109dd-0a2a45098192-46
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:39:42 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d765cd-bf79-0a2a45090019-d155dd29ec6d-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:39:42 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43d5ec211abso169707f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 01:39:42 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f843dsm63198619f8f.37.2026.04.09.01.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 01:39:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1775723981; x=1776328781; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jaQzW2zsO6xzweBk8eEVST1i2bn1IOz3hB6zVQP0mxw=;
        b=Zn3wg6u/c5J0kHZa+U23IY+8P857PxGEzjBDQpYvGfDoKKDTMxx7QBVtls/45SPUap
         /jfTbWqNa+rLfzYppKSeekD9M1aJuyWGibzflCpsYTIiKubIJJDnmx8fPgwmHjh7qEFy
         luodMWlz0MSrz0iFxwfWn+gDGjRHME0fbF2fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723981; x=1776328781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaQzW2zsO6xzweBk8eEVST1i2bn1IOz3hB6zVQP0mxw=;
        b=gO8Bxz5dMNqHmtrq+fhQyQq8TWVYRnYxRhsAu1Ol9DowXDxFL6sfhvGuqkuq0A908C
         LMJhACDmoOvIwCM2NYVObDnXILDgNbWR5smAC95NfD8HF78p/URNz9eTRtbO8LGB/5M2
         yLbSvv3g/gB6SqS041DYPm9X86tEQM3rNHD4J9LS7qMm02tqPaRI1J6SJ50N4xVb2Il+
         b/UjfEiCNb1qSQaz80zisz0ABXVcpWWXW6koI6PydtiyUhLDUphkpZCHexFmhmecLTsb
         iqQP/4WKWnEYjVyBVSA1fBrdkHNFjsaV3s4J99tbUFfG/8Tsakj2cr6u9FlGtA3Gzyl/
         MXbg==
X-Gm-Message-State: AOJu0YyzT4ugn/6W7X7+RqzOVAuVUNjwYVRB0UAnwZZXqHg3zlQndJnE
	JGuChpFrMiwpY1QbDR6r/vr4JtvWSuNJzbHT+SyX9YvvcvQzmcps49yojocAvqZZsoFf951ACx1
	5sZSm9rqv9Q==
X-Gm-Gg: AeBDieuURV04z6G91ZnKun2kEwMBa4+N7TImri6ur3TvVOxlIWoSvpInRhz6gmrDHkm
	0uqcuUVc0p3Iww4eTbRFTw3MqZ3ihlxU6ryu3PtbXmQ9fkxpWg/Cex+mfCJwYMN49Zt70mnrd9x
	vgEBU3+E7ZdfDu5cTuDSqAvjtMblh/lDmwxbzTGHj/dH7GrIfr+vGpzumU33BcbDre82zND0aES
	7rWHRtlfygYyUSu2iAmdqNfZ7Qt5+UqrBvXUN8OsvNP/pV5+QO6WrybEWGmL7QgG/xXrggORPIm
	I/JGpeNZQhEhh7ljE5UGkbmQ0socZKyE8QEdRh7BS+essssMBRrCrdLBYSDpAVigqsK/cNg3754
	8A4AE0QldfVwcty+7TDHue6HPXc4SVB0PyKsv+tNnLeb8rVkTgaTmVvdNq/3ewwLV4LeoGceOez
	3iIcXYLgK1S81taS9z9QIjgCgct+SUrbCIlWxJD4TRdGJpWPMhmevuhPVDNukh9cUl9v/O0zGvp
	JSX
X-Received: by 2002:a05:6000:400e:b0:43b:86ce:27a1 with SMTP id ffacd0b85a97d-43d29277093mr33432410f8f.17.1775723981150;
        Thu, 09 Apr 2026 01:39:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/extable: Adjust UD1 encoding in stub_selftest()
Date: Thu,  9 Apr 2026 09:39:38 +0100
Message-Id: <20260409083938.137871-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1775723982-2ED4F152-8E9B7387/0/0
X-purgate-type: clean
X-purgate-size: 1145
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 389953C7D90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 0x90 is a ModRM byte and technically needs following by an imm32.

Switch to 0xc0 which encodes two %eax operands, and is a complete instruction.

No practical change.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/extable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index a9b6c6b904f5..e1c8c9fab811 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -157,7 +157,7 @@ int __init cf_check stub_selftest(void)
         union stub_exception_token res;
     } tests[] __initconst = {
 #define endbr64 0xf3, 0x0f, 0x1e, 0xfa
-        { .opc = { endbr64, 0x0f, 0xb9, 0x90 }, /* ud1 */
+        { .opc = { endbr64, 0x0f, 0xb9, 0xc0 }, /* ud1 %eax,%eax */
           .res.fields.trapnr = X86_EXC_UD },
         { .opc = { endbr64, 0x90, 0x02, 0x00 }, /* nop; add (%rax),%al */
           .rax = 0x0123456789abcdef,
-- 
2.39.5


