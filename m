Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OEuyKOohMWoUcQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:14:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEDF68E0EF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=niPAntW3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339035.1600147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQnk-0003YS-D2; Tue, 16 Jun 2026 10:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339035.1600147; Tue, 16 Jun 2026 10:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQnk-0003Vq-9t; Tue, 16 Jun 2026 10:13:48 +0000
Received: by outflank-mailman (input) for mailman id 1339035;
 Tue, 16 Jun 2026 10:13:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZQni-0003VX-80
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:13:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQnh-003Fzp-DB
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:13:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3121cd-bab6-0a2a0a5309dd-0a2a45019240-30
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:13:45 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3121d9-c1f2-0a2a45010019-d155802ad411-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:13:45 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490acbb0f89so28236255e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:13:45 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea94f5b0sm295160265e9.1.2026.06.16.03.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 03:13:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781604825; x=1782209625; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=699i1TOXrC90tn7LbsrjawpB3kpr5gLUxkyvX/Ju3G4=;
        b=niPAntW3S7+b9APCHz4Pp2S5BXnKVc1zVjmS/1R/qjMS7gIAUaKAOPOoZdtPYjGuJh
         EBIBux9ew7KxOiKSt2H6vpJ7uod2LUsBLINklyufhn8vF7dIChdaII8+qAw/HXER58fq
         GH3c6tj6P040Kyof1gt/6wCgXpD5b4iqHNvJxT77dCTpp9UgpfaVV6l8LDnTmfdePaZL
         DK0QEr1lYmB+24BwQnaDgZsBK+GUCDUImv8P48kA5uRJ873HIe9sTzucnpiXXlvbjCVq
         Ev4agSiYUxnBrrOSBOhKc1fpgVv0JzEji+YjFEV2zOAdpQlcs2HPfNBN6tj+dVmi+CCh
         YIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604825; x=1782209625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=699i1TOXrC90tn7LbsrjawpB3kpr5gLUxkyvX/Ju3G4=;
        b=KzEzlATNWaZq1VN0vH77N6FuuiWS2MwYBDU2McIfb14gvgws1K6L2jV5egqqQ6okG4
         EWfjMZPkeb1rD0EEdV5cSqUEJ3wAXThrlApbxBuBAy2gEw90329clEoWmXsbhTu1hp/g
         7Yn8oAnKaZ0ntrKelD4Iabdk1PfVEcuO7Ht0HUQi0But+RbFN9x3Rp+5IwfOmgvxZnk/
         GZv/rcOR1uFBGv8EQpyAT3GM7RtcvYIuwODibgWf47N54sDTrKVrX2vomL/nXBV50o7q
         lqr4kyBbvrryKKp2l+TnByXXex7Uz3iyAW+ATX/AtAcJ6OHoIuJ8WiN7s0BOTeA1LcPI
         1pvg==
X-Gm-Message-State: AOJu0YxHh+iWQCoadRtqGRsBPs4j9RPEdI7xGqaLiOzKrDgoM6CHSSJs
	LqDV+3ukKNKWJcRT1eVGgNCulcOU39ZI0iHmQfdX96e8IR9QFJvGn3kXzfko5gOFQBY=
X-Gm-Gg: Acq92OEnJjqNQs17VYUrTlDQiPr/M+xWeP04DTwtNt/A9e6apCVr5jKcqdJX2KDguUs
	UE9XPS5TFtp1pGzj87NLtOe52pCQTeVY7MFmXwpnM4XnEECmJcUYtq8kVrbbzzgjMDmrcyqlyTr
	sB2n6/AyJAA192XkKJ1GA0v2OnWES9IDS1vJHIN4RpUzapMPSOLHI9PK5CxJSrCxju7XjmyE3ZN
	rS7vV6uLMol6BcDHCr4pT+WjQkl2WYvWAmc0mbT3B4S1cyjDnyJK2YXCyRv2ZHcq2+6PntG9n8e
	fgl5uyjE3KJfBuL4Ada4xNZ7nbKRzBc25Aaw2bdLd7NKT8iYFDpa4hx0F43NIwOo1JT1/DMxAwS
	IqvY1TfIud+YSW+D45vt5e1SIQ05eP0gNJdGGTr+9T4bOuaudWE7ck8GsBFqm5UMse2tYDVqAZR
	wKrGO8Th7ULWzqkko3xasJSNw4ODmTLr83jP4RxCA+qVxVm3mZr7pPO2+xpT1bNp9dip8dTd8Ml
	0QyKS3VLrwLkMLIuBDTJI2Q2OU=
X-Received: by 2002:a05:600c:4ed0:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-4922008485fmr192344345e9.7.1781604824558;
        Tue, 16 Jun 2026 03:13:44 -0700 (PDT)
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
Subject: [PATCH v3 0/4] Various patches to improve Secure Boot support
Date: Tue, 16 Jun 2026 11:13:32 +0100
Message-ID: <20260616101336.44009-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781604825-AFB56FF4-7DC31319/0/0
X-purgate-type: clean
X-purgate-size: 1075
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 3BEDF68E0EF

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

Frediano Ziglio (2):
  Align relevant sections to 4KB
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


