Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK5oI+exBGoQNQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 19:16:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80F537D60
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 19:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308342.1579846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNDBf-0006VW-S3; Wed, 13 May 2026 17:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308342.1579846; Wed, 13 May 2026 17:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNDBf-0006U4-Og; Wed, 13 May 2026 17:15:59 +0000
Received: by outflank-mailman (input) for mailman id 1308342;
 Wed, 13 May 2026 17:15:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wNDBe-0006Ty-Ar
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 17:15:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNDBd-00DsxI-K5
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 19:15:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a04b1b9-5cb7-0a2a0a5109dd-0a2a450ac1f6-36
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 19:15:57 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a04b1cd-56b3-0a2a450a0019-d1558031c0c2-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 19:15:57 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso63335305e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:15:57 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd64cead5sm3677305e9.10.2026.05.13.10.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 10:15:55 -0700 (PDT)
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
        d=citrix.com; s=google; t=1778692556; x=1779297356; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdMwvmCM9lXcoLo/b5jCJV7hGyPbWoPml9O23giK69s=;
        b=HtLiCTmBPC5fa3IJ1IwFvWq/SwQKs6g1VxmfIEl2T9TKBhhbTw3N7/KOFcJVe2rThv
         k+VWDZ+DoKGTkLjYdONUI9p4erToUIq3r16xaAIYglsuJoqZS7O47nxftTmKtbQm9N+P
         slOMO+/LOT1/K2DxECWWmnaLB+DGsFycYAyes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692556; x=1779297356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdMwvmCM9lXcoLo/b5jCJV7hGyPbWoPml9O23giK69s=;
        b=tGApb67jJ8x1oef2hTba+1Noo6EXchu7VtwnvtR04YNQN01IxgfoRlAi0zPMeT7FR1
         GfIwu2n+s+r9ejX3guEtd7BjwtolVmAbtZn/ziwy3KMYGsgoEAhzYKEXt2GbpoJix8Pa
         9aIXQrT13CgPe6Oy3+YM4OZh+Ph8MI1NlrJM42flH9xowFlVpl+C1aKeqHAYZbhIYaWv
         ZZwuvd6pg6w8jLLuiCa60m9NtoRLwzjrYJQSwk0TV+14TJzkO4GIfX9yAvo4tItvYgMO
         Ak3zwGpjGium9ji8jR1mZkzaAne6ybGtLETDZ9TAtViNOE7TFMqhuq2fSg3EDqOHNDBw
         M+oA==
X-Gm-Message-State: AOJu0YyQswsfI9I31Uo+zfhoDZ1v5tpQWhR7xrRcmU5nmCmgGYZHEjnH
	u02oN3thbSHNizfP+vqiwYvXmGgup0oyd+M2vnV+pVbBFkFdQTLAknXAvsj6CNCoj2yVsKbUSXI
	iJu/4Lio=
X-Gm-Gg: Acq92OEDvtohHxkIrX/brevDINkHqdDbJzj3RFpdBnVqg5NvOv3+2DA6ZtBm0DYehnF
	boHCHsJf6hWFAIJVcAD9o26+IPFY6lAlaJGN7CKGHeGTXoaBnZsA05Hwbjc466EZx6IHj+uutey
	VoPmqT5xyyUFe0ArlkQLf0oBTiKc93/88Kyw1m1/DtwR3dBJC1W8LADqlrYSW9/R2KVE/KhIo3T
	LRukqjm0+6e6GSIxuceJqC3G+lPXvFnaCFAk524+gpmNVDiowLt5Z50/O94u0w8wk99eeV2yAyg
	8eSjQUoYE+uh8IAEsMVAtKpUTG4bfZHDr6WB15MfuyNZo0vijOeye/AcQT9Rnk+bGbVmbiQUJJ7
	0V/tbcPqdSvrInzVs0i+7bSglbDf7A7PfG0sIFEEdYH1R0D9e8P3ZPtfJSlc0Uawh/G7NoK9JEN
	XN8OZV7ddcJ95mF4wg/H/qMSgqrCSMz/ev0RP/stI90dRWjPS2RQCApQEaMtwi0Rk4XLTprf50i
	6M4
X-Received: by 2002:a05:600c:1547:b0:489:1f04:96c3 with SMTP id 5b1f17b1804b1-48fc9a02834mr61577535e9.2.1778692556263;
        Wed, 13 May 2026 10:15:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/emul: Adjust handling of CR8_LEGACY
Date: Wed, 13 May 2026 18:15:53 +0100
Message-Id: <20260513171553.1772095-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778692557-6F95E8B7-D450D6A4/0/0
X-purgate-type: clean
X-purgate-size: 2089
X-Rspamd-Queue-Id: 2A80F537D60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Action: no action

The CR8_LEGACY feature was introduced in the K8 Revision F.  It doesn't exist
in prior revisions of the K8.

Furthermore, from APM Vol2 3.1.5 CR8 (Task Priority Register, TPR):

  The AMD64 architecture introduces a new control register, CR8, defined as
  the task priority register (TPR).

Additionally, from APM Vol3 4 System Instructions MOV CRn:

  CR8 can be read and written in 64-bit mode, using a REX prefix.  CR8 can be
  read and written in all modes using a LOCK prefix instead of a REX prefix to
  specify the additional opcode bit.

i.e. the LOCK prefix serves as an alternative encoding for REX.R.

Switch decode_twobyte() from += 8 to |= 8 to better match the description
given.  Other indications that the encoding isn't additive are that the CR
intercepts stop at 15, and that LOCK MOV CR8 generates #UD rather than
becoming a CR0 access.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * No dependency on LM.

Also, designers never put an ADD into silicon if they can possibly avoid it,
because it's large and slow compared to the single OR gate needed in this
case.
---
 xen/arch/x86/x86_emulate/decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index 2c13356c4d17..51c89ddfc893 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -782,10 +782,10 @@ decode_twobyte(struct x86_emulate_state *s,
     case 0x20: case 0x22: /* mov to/from cr */
         if ( s->lock_prefix && vcpu_has_cr8_legacy() )
         {
-            s->modrm_reg += 8;
+            s->modrm_reg |= 8;
             s->lock_prefix = false;
         }
-        /* fall through */
+        fallthrough;
     case 0x21: case 0x23: /* mov to/from dr */
         ASSERT(s->ea.type == OP_REG); /* Early operand adjustment ensures this. */
         generate_exception_if(s->lock_prefix, X86_EXC_UD);
-- 
2.39.5


