Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lPZeHSAnV2onGQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:22:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C44975AF11
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:22:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=d7ZPz0Du;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1362688.1614453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt0Y-0001Ic-Ru; Wed, 15 Jul 2026 06:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362688.1614453; Wed, 15 Jul 2026 06:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt0Y-0001Gw-Lh; Wed, 15 Jul 2026 06:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1362688;
 Wed, 15 Jul 2026 06:22:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjt0X-0001Gk-QH
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 06:22:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjt0W-00ABfR-PF
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 08:22:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a57270d-5cb7-0a2a0a5109dd-0a2a4503c806-20
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:22:12 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a572714-fae8-0a2a45030019-d155dd2be47e-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:22:12 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-470174001a0so886575f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:22:12 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4635a63esm14336663f8f.9.2026.07.14.23.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 23:22:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784096532; x=1784701332; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8vfQQvPfthJked7PzQi8Vq/zarEDOxULDDF+/38lDs=;
        b=d7ZPz0Du20P7GdeJ/icMsYwV6RZYQvbvxHaqkjOq8jlqqVjl+ZG1C5PlDhb5vStZJY
         Y1wKI0f4YsgrJqHBZxpEwcrHZLU9SNK95KFsK+G5HuGug8mL0ygublQ72gk+t3y9xS+x
         /f7fiS4lxDzdftsz8aTozl8+Fa04w1B9pUUbykrF2WvJkP0IsY8ACsOqO/CkmeM312F5
         0zqi+6wcwzFGuiVufR5TYPbetYhSmLvJAYn0pqvohzTcaq84qREac8SVYwbpZOrlbctU
         zYyY3W+iiVMaBpKn2CkITuGZoqAe05Palq4Mxo7L1YvctN26MwDWlVCP69QAoaNwjxBI
         AZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096532; x=1784701332;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8vfQQvPfthJked7PzQi8Vq/zarEDOxULDDF+/38lDs=;
        b=o6OTK553GT7UBYdgEQOccMnOgP5UKEpk6r/7x6qBZAGtDFcm6s3/NuXvE2Cm5/o4rA
         qNJLfDZUd/eJ5eYoBIpD7LTP10BXIm283mzWIuo1zNu+uRQEYhTQhxw+U/uKYMxVgYYv
         AfXdK8mCFmvbMNEUDc6UxDEYmEhM9DCiphVG/Q74l0yT1UcE3+ryrmClzPfXXWi8Z6G/
         XE9RZJDVV6PJ271tYLoV85uGy60VYvN6fL23iqavEwVyBw6jtex6wdOjU+0lmCaT7wgR
         W3MnYeJR5N2dVC44tBaTCT8VG6NkTeS4XdAcOTwwuvsh5WDv4fIgx7FLjfTghupPExr1
         t2HA==
X-Gm-Message-State: AOJu0YzChdclu0I/pjZ9QUD+bZwEXBfWkyomG4b+AZL5y51COsad2szy
	KjCIpLWEEKcJM1bmbJUEcZmby4AXSpWfi5lEyMK0DO8Iv23JjPoyJi0GiH2Kp1nHkwtobw==
X-Gm-Gg: AfdE7ckd/BR8MtHcwJdLjp+Kuz1R5HMRG2e27YjA34Cesi9WV90F/e5SqUTRXlz5RF0
	By02uZW4csnx5HyY1TKl7i+NUkyRmCYeJ67Op/9u5zA8+Eg6Z0VxWXzHcrlsgfNQnx91YvV89BO
	VHnlrHCPmfhABc5yqiokz4mh39euPpZDKRnL31a8rCzgC1hIWOnLCOgFz2S8KhsUFHLj8hOcjB9
	A1GqHKa2hBjva8Q3uAtmdsOi07T/d+/aySUSAT2X70iiZXnGVaq78ygD9UFw4XFOE3Ov7QwtH0R
	YpzPQ3j0kZLI37/wbQv42OT/N8AzaDtvpM8D/L4YlmDpDovnKoX1gbf1jgel3K2zMNIoTL6orZ8
	2TUUG/RQufNqVTb9GFtERmZH2RFcym5iZ/zcZvJpeB8gxUlGzZEPSCBY2VpPHQ3Bku3ZqAApsnS
	J4ZQZAgFYp/VoUuptjC15spn1joIXlAztTLyMJlAXgBSWXhHJGPMBfBOC/pSlEWMDMSHbAw9ALA
	B1DdETtLTfWBqPI9Mo=
X-Received: by 2002:a05:6000:310d:b0:476:6bd4:82b8 with SMTP id ffacd0b85a97d-47f2dc9b84amr18938804f8f.14.1784096531957;
        Tue, 14 Jul 2026 23:22:11 -0700 (PDT)
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
Subject: [PATCH v8 0/4] Various patches to improve Secure Boot support
Date: Wed, 15 Jul 2026 07:22:02 +0100
Message-ID: <20260715062206.328049-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784096532-6D4D74E9-226A559D/0/0
X-purgate-type: clean
X-purgate-size: 1557
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 0C44975AF11

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

Changes since v7:
- added Acked-by, all commit are now acked.

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


