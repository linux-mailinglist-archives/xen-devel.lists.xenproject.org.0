Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /zJSCYhyPmooGQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E26CD0F1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=i3WU97KF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346121.1604649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nv-0004Lq-9y; Fri, 26 Jun 2026 12:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346121.1604649; Fri, 26 Jun 2026 12:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nv-0004JH-6N; Fri, 26 Jun 2026 12:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1346121;
 Fri, 26 Jun 2026 12:37:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wd5nu-0004CQ-Eu
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 12:37:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd5nt-006RzF-Rd
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 14:37:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e7261-bab6-0a2a0a5309dd-0a2a4507bcbe-36
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:05 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e726f-9c8e-0a2a45070019-d1558029b085-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:03 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49249707788so7950505e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 05:37:03 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268ff1be9sm76578835e9.8.2026.06.26.05.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 05:37:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782477423; x=1783082223; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FsO7EIZrQo3Km2uz/iSDN6t79zuLOfUZ/lQwqUgLgYY=;
        b=i3WU97KF425sZHNQlFgz6lgazsvhFeSVfLHeyqfeb236sWxoVZcbE7BEs9veioEAG1
         vzOyuOUm8luPk7BqiesbeWZmiJNlc2EFb5rm/1s2YQfibYEQ/Xf+gC51y1PGHd82rFSp
         enHpJALwtkaeJVlnR3g8KQ5gvwZ4T5d4H2qIfSDG6AjfKtcC/NtyQ3LqKOjsweEChkTu
         uUPj9P0HjpnqAuvhiHzq62fwLe3gDK7Btn2/bYPnqUz6a6WzjDr5UYulHHzqrAihKxZd
         RaFiEyIW6UiRwKDKmVHhU+YHu/aMgj0QXefZsuAUn1/TVnAkxcFbhf6fYpKgOVK9/+Ck
         r36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477423; x=1783082223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsO7EIZrQo3Km2uz/iSDN6t79zuLOfUZ/lQwqUgLgYY=;
        b=AP403yfjQi+B+1y01iiY4MW+jN+odwHOHqWWkjG65HwVwOwknJ9MBc8ohu+9MqWlFg
         hT5/oKVsb4CWw8rDPZTPmt2jJNwZSUMqxytnJOW3zeqOW8wtnLE9CimfWjyMX9rupFp7
         74t+6DsoJqvl16ycRjh0Bbccl7iixmfKwWJ5q5wwj/LaAQWt132eSaRPtyn765854gMe
         Fk4Sd4VQVDk4LwIC5tJixCKKNs548WZG88RIy5qfH/6LNYMoF4bdHiERgZAOEygSwV9U
         rQ+lEXNrJQnVUMddhpNKL/M2JCDBo0nJUtj8rLQs95YzHzCxHpnrgWiRJFomrL6BIVcm
         3BDg==
X-Gm-Message-State: AOJu0YxUGZAlDU6n9VHd5tOWTPHSSiW/iT81wNNDsIFpZFHegCag9TDv
	XtWs3zYbNMDs3sbwgcIt++splCAi9fgIZSy+UKMYVMcXXwdzCCFJkPi9gG0y59Kcvlw=
X-Gm-Gg: AfdE7cnQYbLE0CdiR6tr8FE+YpWuT0mYkr/7f5eo87yzbtp6GrVsPpB3qfFwMi+8ekq
	c7m4x7jWEerQhwkUW5pVIM6fgdsL5Wjr0NilphyLtNCIv53nDVfWUNgj413hxfiuucJhGXv5tyw
	9CvNSHGmdMR66K7GeY+2PJ0DJZKWjdsvdxhbf+SI0yoq/BBeOaEbH6JcyXK6uKsiBhSQRj/jicx
	06EmxmXyw2LEwuEQSA4jOZcS0qz4MWbeZGPnYQO3H5aZVGcnUvOtAdVjK737GVg3uGhsgigPtHq
	A6zICl3nzVeiKe9XwLqSy96l932MiGUTrnLAPqvzFzD5Y5dpmIZaQVQOZ05RwXVDcQN83Xf2/g4
	DkVe39sSLR+Tt/8ZgG4U5ik/wpWykWGLkdQnmzFYBW/dXNVK9NV8jDZatGg1EpqRJC8lhdHX9D+
	i2KI3X/L6saOP4UnZ1HtUdgBKzUICnQVa3YeX1k3gEvqZkuhtQGtfEvWk2UNnrKPNCdwAnGpMRo
	Z4MAATe
X-Received: by 2002:a05:600c:3b29:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-4926fac56a2mr10029125e9.0.1782477422813;
        Fri, 26 Jun 2026 05:37:02 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v5 0/5] Various patches to improve Secure Boot support
Date: Fri, 26 Jun 2026 13:36:40 +0100
Message-ID: <20260626123645.229375-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1782477423-FFF3525E-E21290EC/0/0
X-purgate-type: clean
X-purgate-size: 1338
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA8E26CD0F1

These patches improve support for Secure boot.
UEFI CA memory mitigation requires memory pages to be not executable and
writable at the same time. So changing permissions and splitting some section
is required.
Remove multiboot pieces from EFI executable.

Changes since v1:
- improved some comments;
- merged 2 pacthes removing multiboot support in x86 PE;
- removed a patch dealing with SBAT;
- other minor changes (see single patches).

Changes since v2:
- improved some comments.

Changes since v3:
- Added Acked-by;
- Improve commit message.

Changes since v4:
- Messages updates;
- Clean some dependencies cause by code removal;
- Add small commit to remove a possibly unused string.

Frediano Ziglio (3):
  Align relevant sections to 4KB
  x86: Split .init section to satisfy UEFI CA memory mitigation
  x86/boot: Exclude not used string

Roger Pau Monné (2):
  x86/efi: discard multiboot and PVH support for PE binary
  x86/efi: avoid a relocation in efi_arch_post_exit_boot()

 docs/hypervisor-guide/x86/how-xen-boots.rst |  6 -----
 xen/arch/x86/boot/head.S                    | 10 +++++---
 xen/arch/x86/efi/efi-boot.h                 |  7 ++++--
 xen/arch/x86/xen.lds.S                      | 27 +++++++++++++--------
 4 files changed, 28 insertions(+), 22 deletions(-)

-- 
2.43.0


