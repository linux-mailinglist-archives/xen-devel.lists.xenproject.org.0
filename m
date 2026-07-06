Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GhhwF5SHS2oZUwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 12:46:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E184970F701
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 12:46:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nD906+yx;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355302.1610071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wggq1-0002Zx-Rh; Mon, 06 Jul 2026 10:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355302.1610071; Mon, 06 Jul 2026 10:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wggq1-0002X2-Mj; Mon, 06 Jul 2026 10:46:09 +0000
Received: by outflank-mailman (input) for mailman id 1355302;
 Mon, 06 Jul 2026 10:46:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wggq0-0002Tt-21
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 10:46:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wggpy-000ZXT-9R
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 12:46:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b8767-bab6-0a2a0a5309dd-0a2a4503a7dc-8
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 12:46:06 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b876d-ec1a-0a2a45030019-d1558033e462-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 12:46:05 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so31521005e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 03:46:05 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63ba97csm349823985e9.12.2026.07.06.03.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 03:46:04 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783334765; x=1783939565; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v7aCS+tom3MSY5t1l2i/KOcaOh0j2oRAZ+UcV1Ly1oE=;
        b=nD906+yx2QPGN77Jj7dbo+qE22c2r1EOelHiaW6iRJcYiWftUhItdCwpD3vt5qigSf
         hXcXRSefgH0o3uYL6WHY4KjjN0olVFW/2zjiRTEArzn6p2srRmQHJ6dqOd2pPlhHlpZT
         vQuj2NGB/lnivpjJV5CTUGR882FEPxr7NGST+46nj5LG02b+sKp0B+syGg7iWNfBrU42
         +1vO4ZhFip7cKtKeKWaUESRgi6arn0OeMmmkUqhQMaFeB2pfcvdV6XQuwPiuzBYkXbec
         NDw7kc3WA3/MvfQFQvrLtlazLLpAB5M38VX0v52t38DBUkzF7qKGJJa84pcXCoWz7JOZ
         EBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334765; x=1783939565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7aCS+tom3MSY5t1l2i/KOcaOh0j2oRAZ+UcV1Ly1oE=;
        b=jkmbkl/9GKoNvVx/plRCOJYvMDBibyhWYffl0uU7egwY7cy9QjqGQ+7zn+6RbNg1Q1
         OYcYoFvhckSMdfrv8a+QBFv1lAGCAIhtQ3DYr8HxK8m5nY/ZWedCDh8jNkkjceMKa0fD
         KOTvDiBdWSOyW2LrDjqwZKDc/jWv7IxupMkyboCsDuQ78mxYBnnF5MYdvBJt1qa29faH
         /7Ba80qHkPZsp8t2MRu5Tmr3HlOfuN6sY3VbZHwqNCfloreGcyeM9w6DNF6u1zoHgniO
         GhlxTiR3sT001a27gr3cXeqn6pIDxRW54oYOnIw51/gmxEiklMxFbp40kNfgMkUKFUws
         qgKQ==
X-Gm-Message-State: AOJu0YxnQmiAv/woqVeCrobFEoRkO0eOvajEFZYq2HzsENv/Pe+yVyA/
	+IlYioj3z4yYxXCSUhasX5widMdq3s8x15MG6Joh3PyRM9VrUZgz57NaHs3eWZdzrNA=
X-Gm-Gg: AfdE7cnHtwyvZAV9/5x0eQ+6jbCcf65cPhLiMsOsJx6Aj1yq4OwynVprseGbQvMYSqe
	lPn/RT8Fjwrxrv/nimPqlo1XpEHanfG0I+yxYOUr8Sc0vhjHZYZwVfQhI439a+h4f4lzqnh5qXa
	4DJkxK0Pha6mxvPu91rn3eGOM9x88FMe0Q0xo/tR2Bb8ghf9FA3pzK9SoweYpQKVv+WU/2uMJ1Y
	Ue2VbBxdrXUy+YXUN6QmO7bB3lA6F/v122hLs2kHyLpruYdvY1lXwGWNR9TAvmL3tO5G1ua9QNA
	5F8ULS9CBN1E6j5PoVm/eJOXvpIo+ZAcMRbFX4jl0jmq4FsrQTpJMvDvBbr/e8R00OnL2kxpwlb
	gMunT2LEJSq1RIp9UKlbRqULm9y/Wa/18KiP5yNjcvHsZg8nIQ5y8c+wLflKdENMyJOm6Aa1eYt
	S4r9PPfmb55clkeaK29zKX6yoWbM7vVEgU79+7yDek66cpUMdKBMrnL+MkhK6cPTD0WIJPUAuS8
	WaC4SU19bo60CvnmX8=
X-Received: by 2002:a05:600c:c1c8:10b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-493d11fafa3mr78861435e9.37.1783334764770;
        Mon, 06 Jul 2026 03:46:04 -0700 (PDT)
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
Subject: [PATCH v7 0/4] Various patches to improve Secure Boot support
Date: Mon,  6 Jul 2026 11:45:53 +0100
Message-ID: <20260706104557.430097-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1783334765-077265D1-E6D30084/0/0
X-purgate-type: clean
X-purgate-size: 1491
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: E184970F701

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

Changes since v5:
- removed merged commit;
- remove more code/data from xen.efi output.

Changes since v6:
- fix commit message.

Frediano Ziglio (2):
  Align relevant sections to 4KB
  x86: Split .init section to satisfy UEFI CA memory mitigation

Roger Pau Monné (2):
  x86/efi: discard multiboot and PVH support for PE binary
  x86/efi: avoid a relocation in efi_arch_post_exit_boot()

 docs/hypervisor-guide/x86/how-xen-boots.rst |  6 -----
 xen/arch/x86/boot/head.S                    |  8 +++----
 xen/arch/x86/efi/efi-boot.h                 |  7 ++++--
 xen/arch/x86/xen.lds.S                      | 25 ++++++++++++---------
 xen/tools/combine_two_binaries.py           |  2 +-
 5 files changed, 25 insertions(+), 23 deletions(-)

-- 
2.43.0


