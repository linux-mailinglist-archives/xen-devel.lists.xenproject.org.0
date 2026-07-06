Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LiHAIJeHS2odUwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 12:46:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3536F70F70E
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 12:46:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IHVYOHTv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355301.1610066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wggq1-0002X0-JQ; Mon, 06 Jul 2026 10:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355301.1610066; Mon, 06 Jul 2026 10:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wggq1-0002UH-Fi; Mon, 06 Jul 2026 10:46:09 +0000
Received: by outflank-mailman (input) for mailman id 1355301;
 Mon, 06 Jul 2026 10:46:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wggpz-0002Tu-Uf
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 10:46:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wggpy-008v6e-Qe
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 12:46:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b8761-5cb7-0a2a0a5109dd-0a2a4509a9f8-18
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 12:46:06 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b876e-97e6-0a2a45090019-d1558030b820-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 12:46:06 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493c2b3dc8bso19813285e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 03:46:06 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63ba97csm349823985e9.12.2026.07.06.03.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 03:46:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783334766; x=1783939566; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgcFpTg0M719DUSQiohUXmyN6KV71kHNHsNKWBm10go=;
        b=IHVYOHTvrVFjr9fT3MFu16T0q8cr7HeZNsuqpJ3YeBy4rdCkrSzZCxIdl4sBAyB5h7
         96f82zINis75KaIq0MwKyICFHEtbBfEtAnyfF+Do1+xVjWj8U7roE/6RulbN6YPVwKCy
         dAIVlqWv+LOvSIP8Zut9OJJSC3GLVkrl4dk4IJopqDU+Q/BHdH9zf/NcZfdnpZ9sbvOO
         27axMr1mrqfgDTdXs6wOyOXIw9/P0Tn/tfesrhQZuP11CSEX9LX/oQ5mW6UpQGvPdxJd
         YuTc3agrcoEaoxI0J7IfgHp+ufn8aL7qYRxAnmmt0/0ZTQMkL0w+IGvCTLby0TSCn7y8
         Ds0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334766; x=1783939566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EgcFpTg0M719DUSQiohUXmyN6KV71kHNHsNKWBm10go=;
        b=fJhlfTxKSJnNXZYZVCoqyD1WrWD4+dLkYe1jSdx0rmPv7nBLoV4tuTMuWV66gJkMF/
         5vO72D31sTWQGVYWhIXnxu/h9C6zIFytwi4ZH77/crM+0EAcpTuppnkkGqJMVft1wrPc
         QoN/8RsE4cYG9C4VkUVUkSikRwrIU0vvADc2WxFeu+67tN6dQeOAOPJabTDk7ojmLlFh
         WH+McYZFJ4IIlrmcBNHCynfC5f7Y/aVtXIfUc+I6XOypG3c0GFsCW3cgX81wvXbIBpBM
         btaS5QXfIeY0+KtFMbUlp5Y9hnhbim3A7JHE3qW4UxU10M8e4rwNYomGG6UNnL5Ox445
         HntQ==
X-Gm-Message-State: AOJu0YwD3wZyoWMw+aVlT6DJfsIEIteUYO05WVxc/wIw214l5cdGxYsK
	UT32JZZA9OhoS2SCnTHGgvLwAUlrUvyqlQk8C4uiWz8vOoXNdVO2BcIUqcjafx+ezgQ=
X-Gm-Gg: AfdE7clYTsMU8SKRUALTwquyy1wN7jTFcd4ir5HFK6sPoqA4Hx3a4eccX/3n63jOleN
	z/pNCB3vN/3m2RmnECR5mWXw7qFGP9ryunqJ5Pye8JFEygoharWfE+mfSmLOef/Srj0jv0gFswa
	M+670mbyGGRuLRwlQXpbwFpa5/gNNf6b5BSLOQ8Z6XRvy1ZxW637srMNBNsfvcRiL7vUwX4oQFc
	RmP0LnYlHYBzUQMnyyAvBuaMQFayfxRtPzA9EJojglsjFEByjRPRKD1LdYv+X5h+wBuZHPFOANO
	PQqOBKdnfVMzfHBa1VCXXWPYCoYxWkp7jzsTRf/t3FS0TS05tsgZHq3kYmrGZnMZoYpwcWz9Py+
	Pz9N9VZczHssWDLzeNecUtfHBTXxJ1gpL6/WLAm6WO9Y024XgZCc+0a+c215E5HTZRw8UVXF5/r
	ZkeHAnQHYJZjPltw05c4GPxr8BCtJ/7HXfgcN5iuquI8k6cr8VzujJ70bmzCii8B9ksml8YmZLN
	AHn7LklMkplc4kI9HY=
X-Received: by 2002:a05:600c:3110:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-493d11cf312mr130290115e9.6.1783334765621;
        Mon, 06 Jul 2026 03:46:05 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 1/4] Align relevant sections to 4KB
Date: Mon,  6 Jul 2026 11:45:54 +0100
Message-ID: <20260706104557.430097-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706104557.430097-1-frediano.ziglio@citrix.com>
References: <20260706104557.430097-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1783334766-577AD986-70FCADD3/0/0
X-purgate-type: clean
X-purgate-size: 2076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:frediano.ziglio@citrix.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3536F70F70E

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Required by UEFI CA memory mitigation.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

Sections with different permissions must be in separate pages.
In the case of debug sections they are contiguous and have the same
permissions, including the immediately preceding .reloc section, so it's
not an issue if they are not aligned to the page.
Before the .debug sections you could have the .reloc or the SBAT section,
either are permission-compatible.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
- Change subject.

Changes since v2:
- Improved commit message and subject.

Changes since v3:
- Added Acked-by;
- Improved commit message.

Changes since v4:
- Added missing comment;
- Added Acked-by.
---
 xen/arch/x86/xen.lds.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b9e888e596..8e63cf5bc2 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -162,8 +162,8 @@ SECTIONS
        __note_gnu_build_id_end = .;
   } PHDR(note) PHDR(text)
 #elif defined(BUILD_ID_EFI)
-  /* Workaround bug in binutils < 2.36 */
-  . = ALIGN(32);
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(PAGE_SIZE);
   DECL_SECTION(.buildid) {
        __note_gnu_build_id_start = .;
        *(.buildid)
@@ -330,6 +330,8 @@ SECTIONS
   __2M_rwdata_end = ALIGN(SECTION_ALIGN);
 
 #ifdef EFI
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(PAGE_SIZE);
   .reloc ALIGN(4) : {
     __base_relocs_start = .;
     *(.reloc)
-- 
2.43.0


