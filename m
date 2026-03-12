Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFAJIyWgsmkOOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:14:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C00A9270B6F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252013.1548797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dzk-0002An-CH; Thu, 12 Mar 2026 11:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252013.1548797; Thu, 12 Mar 2026 11:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0dzk-00028O-9d; Thu, 12 Mar 2026 11:14:24 +0000
Received: by outflank-mailman (input) for mailman id 1252013;
 Thu, 12 Mar 2026 11:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7O7=BM=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1w0dzj-00028I-Ok
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:14:23 +0000
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [2607:f8b0:4864:20::542])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e9d699b-1e04-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:14:22 +0100 (CET)
Received: by mail-pg1-x542.google.com with SMTP id
 41be03b00d2f7-c73a5473bbdso327130a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:14:22 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae34eaacsm49271645ad.49.2026.03.12.04.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 04:14:19 -0700 (PDT)
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
X-Inumbo-ID: 9e9d699b-1e04-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314060; x=1773918860; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eHEcVdS/sWWyKqS0PygUhFz4ja7UaUTr7MKPVVRagws=;
        b=DQvJwFP3HOKn0FD6wEvXVzYdEQsprDc0BwmFXkGzP3II2McIHhrX6jPtYPBpuMzO1G
         T73FAwqhbRyeSbxkgYomNnEybekK7RSacFYtsoDfG/nTKZPtOnJr+GnL/Qd2DDgSKyfP
         N8qkcne/NuEQU3MkSVib5qjrKpfykvz8xqzMIZOwAVq+dECJ5gRuBvhGULNwuGgIO6u9
         o/k4ATbDaeTXxQarRYIhKVbmahI+Y0wS9vB5H5AopU1ut0fLsHCvEWDrVvkTapWcl1c2
         PaoajP4OKDD0bsuk75rbBgXUjNvFhWD5Z/BgwvLsextNpviCty5DDepAnoAPXM+viwK4
         G+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314060; x=1773918860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHEcVdS/sWWyKqS0PygUhFz4ja7UaUTr7MKPVVRagws=;
        b=kDygM7Em8EUfqE1suwyi2HHMpEGCD9IAKUP3gKj93febp8/VctRc1ARpvmjwoSkWPi
         ByvcnFq+gTa7mWu5gnhJCA+xUOBjckFOWEXudjFTdAnLjtHDacu0AzOeUzXtWOQEW22u
         UomF5sH36BxnjpUN86feiNCW5IREZ720Xa0hgmnm0QUISe6yQRpU5TTwuN/N/F7CP8qw
         VLhzYVfywlaYb51iMLN6nv4VidEnUcrZ/1Qw7ZgJpAIugLzjttJAI8jYxHrBwXj1IAPw
         KA5NJ4y7qvlEVsMM7f1F4N1wC0745cP+EY5bgY5TFxfU/2uXfnN1TIeTQV0kxrG+KH4g
         44eQ==
X-Gm-Message-State: AOJu0Yzupnu6Je4SEWiQiMlrnqOUrXfe9zmdhAf0lGaje18lXavejwvq
	Pp6q125I48NpisamraDck7wQhbkouiWeomXeWs5dTMbjHMokuYea4tZwmcNhY28q
X-Gm-Gg: ATEYQzwMdAaO8x32k1kkfe5Ab0THk9B3SMiZi6fw5XNVS2WRaJItJ3um2NxXwGNgZ+8
	qyccWOynzA3vkera0pAYH5KVBX9V/yXteCFIUZQkclv2cWTJ0mtzTGN4gYqoCdKH+ilhgeuTBi1
	rP3/F59Ip0vzC34vqBR8uHQ6h6TI5ez7F0yFLg0pHldZixMtEbJ8E9qffdU3FEiOVbrTXJIHOo3
	kBhHdSGDUcHOrw+0Y8ffTBShHNllHwXrfWbu2DSkQ9TpUo72CZZrPAy6agjGX/Uzln/D4TOHmlT
	PxQcD5KUQBnO48LA6LuQNFx7j+SjUJmMyzYhw1qRRYE5FdJNPkW/72SL5PZwTUJ6cwQUjZfpg4g
	9WHuzQrFV2zPHmbMmYViXqP5CU4+i1kboh359bGJd4BD3J57MNwvNrDAQTtrJHZm0EltX2o8aRa
	ZvrSYL8MGet1lukKNstKgTmRP4D4UjVZcq32o+aFZgdzfO/dmIxIzfJitbVF393l0ci2NqyUK09
	t8JOH3KveoHEMPP7ftjOk6FQpM7tKH2gYfbPIyJGmzUidS/wkPSksTnR0sNAXONEN895qPpula/
	dEO4OsZg
X-Received: by 2002:a17:902:e84d:b0:2ae:5eee:7a5 with SMTP id d9443c01a7336-2aeae78c1dbmr64401185ad.12.1773314060394;
        Thu, 12 Mar 2026 04:14:20 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [RFC PATCH v3 0/3] Fixing ACPI BGRT (Boot Graphics Resource Table) corruption
Date: Thu, 12 Mar 2026 16:44:11 +0530
Message-ID: <20260312111414.17808-1-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,invisiblethingslab.com,suse.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,patchew.org:url];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C00A9270B6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This RFC series plans to addres ACPI BGRT (Boot Graphics Resource Table) corruption,
that occured when Xen reuses the memory containing the boot logo
image before dom0 is able to parse ACPI tables.

The BGRT table contains a pointer to a BMP image stored in
BootServicesData memory. When Xen reclaims this memory early in boot,
the pointer becomes invalid, causing Linux dom0 to report:
Xen: `(XEN) ACPI: BGRT: invalidating v1 image at 0x47cc2018`
Linux (dom0): `ACPI BIOS Warning (bug): Incorrect checksum
in table [BGRT] - 0xF9, should be 0xB4 (20250807/utcksum-58)`

This series:
1. Adds BGRT image preservation infrastructure during EFI boot
(validates BMP format, allocates EfiACPIReclaimMemory, stores pointers)

2. Integrates preservation with ACPI subsystem
(clarifies acpi_invalidate_bgrt() safety net behavior,
adds status reporting via efi_bgrt_status_info())

3. Provides opt-out mechanism
(-nobgrt for xen.efi direct boot, efi=no-bgrt
for multiboot2, both via early EFI-phase parsing)

The preservation is enabled by default to fix the corruption for all
users, with minimal overhead (~1MB). Also, servers that don't need boot
graphics can disable it using the "efi=no-bgrt" option.

Thank you everyone for the constructive feedback! It is really helpful,
I hope this RFC series is upto standards, I would greatly appriciate further feedback.

Changes since v1:
- The BGRT invalidation behaviour should still presist
  and server as a safety net when "efi=no-bgrt" or the
  preservation fails for some reason thus: Add Clarify comment
  for BGRT invalidation behavior with preservation.
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Changes since v2:
- Use existing ACPI headers (actbl.h, actbl3.h) instead of custom structs
- Modify the function names and code in function to conform with Coding Style.
- Reuse efi.acpi20 from efi_tables() instead of manual RSDP search
- Use appropriate types: EFI types for firmware code, unsigned int for
  loop counters (matching ESRT pattern)
- Used of sizeof(<expression>) over sizeof(<type>)
- Remove fixed-type widths & limited typecasting
- Add Blank line ahead of the main return statement of a function.
- Better wording error message for image cap size
- Remove parse_boolean(no-bgrt) since it could be bit misleading
- Add const qualifiers throughout for safety
- Use %p format for pointers (32-bit compatibility)
- Initialize failure_reason with string literal for proper relocation
- Use memcmp() with ACPI_SIG_* constants for signature checks
- Add direct Xen.efi calling.
- Add opt-out mechanism with proper early parsing during EFI phase.

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reported-by: Jan Beulich <jbeulich@suse.com>

Please refer to QubesOS Issue for more context:
https://github.com/QubesOS/qubes-issues/issues/10764

This is a companion series to Linux Kernel side at
https://patchew.org/linux/cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com/

Testing:
- Verified on Intel UEFI system with Fedora 43 dom0
- Before: ACPI checksum errors in dom0
- After: Clean boot, no ACPI warnings
- Memory overhead: ~972 KB (preserved image size)

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>

Soumyajyotii Ssarkar (3):
  x86/efi: Add BGRT image preservation infrastructure
  x86/acpi: Integrate BGRT preservation with status reporting
  x86/efi: Add opt-out mechanism for BGRT preservation

 xen/arch/x86/acpi/boot.c    |   8 ++
 xen/arch/x86/efi/efi-boot.h |   5 ++
 xen/common/efi/boot.c       | 158 ++++++++++++++++++++++++++++++++++++
 xen/include/xen/efi.h       |   1 +
 4 files changed, 172 insertions(+)

--
2.53.0


