Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDYnL2+yGWrJyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982D7604D94
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322627.1588935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFk-0004Xm-Ht; Fri, 29 May 2026 15:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322627.1588935; Fri, 29 May 2026 15:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFk-0004Vs-Et; Fri, 29 May 2026 15:36:04 +0000
Received: by outflank-mailman (input) for mailman id 1322627;
 Fri, 29 May 2026 15:36:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wSzFi-0004Cl-Hm
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:36:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSzFh-0016pT-TZ
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:36:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b253-5cb7-0a2a0a5109dd-0a2a4506e07c-28
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:01 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b261-7371-0a2a45060019-d155dd2ddd00-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:01 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-44a74032ff8so10542963f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:36:01 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b834esm4196196f8f.11.2026.05.29.08.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:36:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780068961; x=1780673761; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2VlHJG57rsaQzgMOBqSKZ1RV77ipqV8St5qs6awVP4=;
        b=nyAueNjRsM/7AEHF6OPLVknduAkb+rU/4T43uHJnNP7fNXXjEY8o2pxsQrR1eH9K7J
         /cUV6yjI3AGtELnyarR0/ZWeLqhuoFi8HIaowLNzSuszijGqhHD5M+Jpr423GysejADt
         O4v9LEIMztSMmRmU0k9DyEV75m8D4uZ43C5scyZnavp4DC5pIgyBg/zAA8PxE+3t7hWq
         nd9rtD7ACruIVMYYTtrOqJni96JFgon/Btan0CEQ5/obopyPEKY+a2ziLkJkPwof6aHH
         JJqLapx9LynHrD9W8lJnm9pQX2rdNMBuauZ3eJiSGLb0cUrYYbVknutmbRBzeiYygWRt
         bugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780068961; x=1780673761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U2VlHJG57rsaQzgMOBqSKZ1RV77ipqV8St5qs6awVP4=;
        b=jqy+ZKL27wliEEOhwSmZoJl5BDQ8ff6WQyU2Ilrd01nVjKEs7K88Z/zzKzgWlX1tHu
         JJe2+HTcGxjdrxaR2azQGxSaK+l4r18ahZxrT31DivCU8YxggJkNfKazJXB5SzJ7mRMM
         3Q1OmQmVOc+pioTiQFJrk+nUDcEZuH/6T3JB5BSScuJP3hF0C5la3szBWScclp0H5y0e
         aF1zcRF4kXLk//9+jteU9xDtIbj3XyD2uENffbIAuA8CBmUnX+8j3P8QQhNX65c4geui
         Ev1+ZwJUrTz52w3piQ4F7bRrmwPsZhyrWQJEVOfmq95z/OvVx8egCZGVhAHbNIdp2cim
         h6Iw==
X-Gm-Message-State: AOJu0YxA/MLqRI3bgKlTKl70BJm+NXqTwItFrmkk0NZfXRVbo1ZmOIW+
	WAx1uuup8x66VTkpC0y5aY8KeYWFrxKRCdJe1jqF74h1Tb9qPQi1QiRp7biWcBw7
X-Gm-Gg: Acq92OGN40YKbXcMQqyaYkZ2xBgCerzK62bQTE0JY8MH7amECtwveUDPJnIVf48hcuK
	ivnPQDKA+EapLu/2WrOcc/10ZrSTn4fbv0VQjFACRvsy2zPbpoLhozSdn5zvAQhLK7m2XIY//u8
	jG1UIuPbPChEEeHpGrJ7RrrB+k7mBx4in3ZSOJ8m0KHnvngRe9yFUsz6pkQVgKBsbxs3qbxAEfr
	m1nFfA6D3orZmC9VZnBSYyk7c6Bwm2oIN9qIU8ZzVIe5uLf7VyuZuFHf5eMeSAKNI4MviiAZneA
	DFEBCR3iup1NjqfhgZiITICo5TdPxp6RpB8MRRBK80g0A6DP7GtiZWAUUBoRTRr0j4skt/BKx6K
	UNBhpaEk7G/t1MkBe7gdqbEftCPaX4ZGuIQ4pIaDhXjAgaxFLSo1zCN+lLBDq1pEHVFyKZyqtUI
	PONcvD82SYxIc/2OOXgzfz2oBgtRWpsBSsZUolattsaHaABXBv8wavBTPuCwGtMVyug+iQz1RVA
	JDrymukpzJ99aEQJIsBthp/0gVzuEFzLpgY
X-Received: by 2002:a5d:6f12:0:b0:45d:41e0:467b with SMTP id ffacd0b85a97d-45ef6ae9644mr615156f8f.3.1780068961218;
        Fri, 29 May 2026 08:36:01 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 3/6] x86/efi: discard .text.header for PE binary
Date: Fri, 29 May 2026 16:35:28 +0100
Message-ID: <20260529153531.1341542-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780068961-86B75D75-43334F0C/0/0
X-purgate-type: clean
X-purgate-size: 803
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,cloud.com:mid,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 982D7604D94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Roger Pau Monné <roger.pau@citrix.com>

The multiboot headers are not consumed in the PE binary, hence discard them
in the linker script when doing a PE build.

That removes some relocations that otherwise appear due to the usage of the
start and __efi64_mb2_start symbols in the multiboot2 header.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/xen.lds.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 322c116a04..907f826ae0 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -57,6 +57,9 @@ SECTIONS
   __image_base__ = .;
 #else
   . = __image_base__;
+  /DISCARD/ : {
+    *(.text.header)
+  }
 #endif
 
 #if 0
-- 
2.43.0


