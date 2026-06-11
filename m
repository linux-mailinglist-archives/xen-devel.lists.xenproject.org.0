Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UN6nGUnVKmocxwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:33:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B2673193
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:33:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ju3B9YPs;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1335794.1597964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhP9-0005cP-Se; Thu, 11 Jun 2026 15:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335794.1597964; Thu, 11 Jun 2026 15:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhP9-0005Zb-O3; Thu, 11 Jun 2026 15:33:15 +0000
Received: by outflank-mailman (input) for mailman id 1335794;
 Thu, 11 Jun 2026 15:33:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wXhP7-0005ZI-Nu
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:33:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhP7-00GHKC-4O
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:33:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2ad531-2eae-0a2a0a5409dd-0a2a45049ba6-12
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:33:13 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2ad538-1dec-0a2a45040019-d1558033d5e1-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:33:13 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so39734365e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:33:13 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm80679900f8f.0.2026.06.11.08.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 08:33:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781191992; x=1781796792; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1MY5uIeAiVt4LwSILRP0ailGWznjvUKHiFsb0PtKoE=;
        b=ju3B9YPsSJqtloyJj8LljjssSaUTLwIn2zL9UXRk9LVIbedwRVHhtFt8YSMer4iil6
         DeN17M4PeKLYqFH6itae6Wv5aphhOVlUJffinSC8Xaa4AeSgEHtcOchu6+BSgRVnBzfu
         6GZkmyLmffCsbDMOBhoSFXVDUahk9khF76LUYA8/AfDNEhsY5rzz25z3AmQ82kni/LU3
         LkHfASHbCn/o+8HNZYm0ZRXQG2brHFOBmghdu8ra15ooVmlu9XAeMjdqc4KrSXZw9/EP
         eivrO48z5QD4PfCDHkcifJY43v3M0epU6nfAMYuCPJJBGOxl5oE8gBEEAooOm1fapj6Q
         tNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781191992; x=1781796792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1MY5uIeAiVt4LwSILRP0ailGWznjvUKHiFsb0PtKoE=;
        b=ZSm/WlVgcr7UvOl5hqbPt1ZrpTnFQ/K/L0q/3iqrIaPrc6pF3euVvSbPT41/Peicfw
         ckDyMRMAv32ptpVBVObI/kTZWekEKDWCAcjNuZgKqeXIZjzcxC6C1gNLf9NgkkKvhfmI
         3/3toBMyYKUxnAIWNlK9s8W3dzjDlkyyncriQ8TSlDw1i4H2IWufmYT3rB0+e9V5zacL
         vIWVjhx+vi39GUm0uIiM4IuH3tyg5uTccT9Yp/vsxyHLL62JAqvyfE6jg/8Z3gkFe/zA
         XRlLUZiFhuxo9fkgwwoA5LtpdSeMk2VI2oXhtLABSQRXrW8UEB4nsh49KYSSEM+cr5II
         3UyQ==
X-Gm-Message-State: AOJu0YzGwZAeSr4BG642UE18oh0vmQgv/pexFypUL1n4dol3bMpXdrMO
	OZ7Ht+Dm9AuscGBuL5vGddmnL4ZOHF5/DDmQKaGUOFBx/mKSixMFW5L9dT2fcIluCas=
X-Gm-Gg: Acq92OGuPA5vqiIQCALlxeSaUQrYfs87JVeibjwsYlKGfhsuWOGdx192Sii7OiZ/Sow
	4mPNpKzBb0mLnGmY9+2JjIWmMFiPBEEd+zx0dQsIiO0dgh9qyNOb6/6M7FvlUe80tn3KS9yZbEc
	dt1ov3aMFifHT6Y2CQVnpoKQpv36NGNOMZ+l5mG+LGtmaasV/8W17ZuGymF8w1HYqvSGanUr4o2
	2R68BxFLN7sDhTADkh/qOtBb254jMyBsAZMD/HV0hRYcbqDLT1CCJbFrn7tu8OMLCZDtzgnsMTv
	xyR2LJR0k5NxR8QezuNHcN6on8tcD2hD7VxdWbfii/bJk6OFjrI5FPbGEd5a+QZgGj9tXiaBD9E
	45kTGJX1X0C2xV1YONYX3uGaw8qRYlU2WkPANyrCl7Mr6lM7iXqVNWPv3P8w7y4fcP85eqnMeA1
	yibZK25MjZfpi1S7i+5phnC2+r31asZkYOzRNpldA4so24Um59VJT8ZMYO3n5UYftAPO4nlBeu1
	d4ODhi0cCrIAQ+xxIqaQ6lnz6m3b/6IF1Mw
X-Received: by 2002:a05:600c:4e08:b0:490:601f:d766 with SMTP id 5b1f17b1804b1-490e55b86a4mr45682325e9.1.1781191992110;
        Thu, 11 Jun 2026 08:33:12 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
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
Subject: [PATCH v2 0/4] Various patches to improve Secure Boot support
Date: Thu, 11 Jun 2026 16:32:53 +0100
Message-ID: <20260611153257.650054-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781191993-411763FF-B53D5CB2/0/0
X-purgate-type: clean
X-purgate-size: 1023
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:mid];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 578B2673193

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

Frediano Ziglio (2):
  Align some sections to 4KB
  x86: Split .init section to satisfy UEFI CA memory mitigation

Roger Pau Monné (2):
  x86/efi: discard multiboot support for PE binary
  x86/efi: avoid a relocation in efi_arch_post_exit_boot()

 docs/hypervisor-guide/x86/how-xen-boots.rst |  6 ------
 xen/arch/x86/boot/head.S                    |  3 ++-
 xen/arch/x86/efi/efi-boot.h                 |  7 +++++--
 xen/arch/x86/xen.lds.S                      | 22 +++++++++++----------
 4 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0


