Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZqVRLix5S2oSSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:45:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81D70EB9C
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:45:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="DiL/qPWE";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355210.1609965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfsV-0006sJ-Qm; Mon, 06 Jul 2026 09:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355210.1609965; Mon, 06 Jul 2026 09:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfsV-0006pg-Nf; Mon, 06 Jul 2026 09:44:39 +0000
Received: by outflank-mailman (input) for mailman id 1355210;
 Mon, 06 Jul 2026 09:44:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wgfsT-0006pa-M6
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:44:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgfsS-009Ezx-Qf
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:44:36 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b78f9-e002-0a2a0a5209dd-0a2a4509d6b0-34
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:44:36 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b7904-97e6-0a2a45090019-d155802cd436-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:44:36 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493b691cb44so19290715e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 02:44:36 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccd9d620sm283605205e9.1.2026.07.06.02.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 02:44:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783331076; x=1783935876; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaAEBTAI0yWdp/uh1fbi563sGfzhKxHiFZlpfXegvLA=;
        b=DiL/qPWEIIA9Jn8kBTBTEif0Cbg4fBu+mMmEhTPuJeeQnXWJn4EjSVAWWpIhrYrCYB
         gvGuTEvTj7/0J4J0R2Ce0fP4eGUVg3Q2wfZWT61VsvhTh9WKMs8sfFe1G3VK1TLqjtXT
         kkwuJtl6LTgartGgDCjQIMtZ1Cqa4UIuu/RQdOpftMfuq8UtVbAlewQgmzm4lNtVnRTh
         kVjSuEKj2IBZ30Xewea915vwDximBwLY7f3aOZuH6oFBHPSUUxeig8vcaUkXDnuXvs+a
         cjIoYg2IwWtRtGV8nnjNlVFiLx6N90yGuURsGQK2KVRSWA1B/ABMWargtIJydzUYUorh
         gW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331076; x=1783935876;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OaAEBTAI0yWdp/uh1fbi563sGfzhKxHiFZlpfXegvLA=;
        b=IbhyDSSSAVRKO90zhRYen02i/KVX3Kc1/dY5+0aqrUVRsWCbGFk2/ttZsquVZUyjEr
         dFC9LNp1z1j1uC1IwV68SALyQjKvSXMVnMbRxlhgq/dm7/mU93qvc86VjxgJbHNWD4zy
         QmTRuRCj8z9sh/NFU5hlMFWPF8aB0BcJki1xO6Rvksanuxy0hoQrwWxI/oTOF3BTZEcx
         WJrr5vtHBptKQzJNpbBtiL6M0MVgZ86UW1qrHvlfpon7V8v6kbQbTk7uFNSH3RXUl4jF
         mlt7VhPsZ6ZUz6n83f9TLB/FE1ilFcV2cABCcds4K1sQ3otaNqyIfLql66C07+FHGWLO
         CFjQ==
X-Gm-Message-State: AOJu0YzsPR3wjkhFrgTBYTglzrTEbNV+2i9As8uotKOAOD1AgNxciUbC
	de7qu6GxjIrVrd4PdAqBC01Y3H1x8ohun5WfLKf4d+XND5pFQnuBzAqfpyPUH7xO1rY=
X-Gm-Gg: AfdE7cnEIHtiK2vATeaWql9qFOqHE5asK7gg5AKMhdmKoDRHPrgEL/LmEx00hTDwEiM
	3GL1tqwjY9pscqaYH8Iv7OqZ6BBn2w3Qgit76ZLx78vYaCqucGDwMACVsrp/AZpi56wwKFujVUt
	htKTGYgN1ExRBsIWC1JG7pfFKnMQUNPYIVjKOYVTm6vVloIy8ftZq8Ex3gA99nMTn9ADV/G8RA9
	Ulau7MuqxCDXtiDL9oFta8WEMzCcs9P/0/YfmsM27IlP9hromv5TkfnqT+BP0d4INgRyTLgHm+2
	lWCouwNFISZx72PnlE/Dam5ylYMDzlIr09QH8dz2bQP8GBj0gx1z1x83tXBuBGcHxlj3uK2x/fi
	Rcw9ozFavdHq4WYbKhqo1DFEMF8TU8cSs5jRB+Xvp3oDG7q1HXGIVnHJci8V0nUF3VuJddEHPfN
	2Hw4untfKvcoqu4qrf48X1woAj+K/UKvnQQJc3LjXR5Os7/V1EF21ZO1EQubge81e3wmMmthr9g
	hyW4YYAMQIOLsH4MGo=
X-Received: by 2002:a05:600c:63c3:b0:493:bc4a:fb56 with SMTP id 5b1f17b1804b1-493d1203ee0mr83473045e9.39.1783331075827;
        Mon, 06 Jul 2026 02:44:35 -0700 (PDT)
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
Subject: [PATCH v6 0/4] Various patches to improve Secure Boot support
Date: Mon,  6 Jul 2026 10:44:26 +0100
Message-ID: <20260706094430.427155-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1783331076-44528986-4977D81D/0/0
X-purgate-type: clean
X-purgate-size: 1447
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 6A81D70EB9C

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


