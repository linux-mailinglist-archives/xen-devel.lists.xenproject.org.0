Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PouIdViwmmecAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:09:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E738B3063C2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260229.1553587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yhE-0001QC-C4; Tue, 24 Mar 2026 10:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260229.1553587; Tue, 24 Mar 2026 10:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yhE-0001Nn-8z; Tue, 24 Mar 2026 10:09:12 +0000
Received: by outflank-mailman (input) for mailman id 1260229;
 Tue, 24 Mar 2026 10:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJqO=BY=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1w4yhC-0001Nh-Nz
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:09:10 +0000
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7df92f68-2769-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Mar 2026 11:09:08 +0100 (CET)
Received: by mail-pf1-f193.google.com with SMTP id
 d2e1a72fcca58-829a9d08644so2101756b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 03:09:07 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c74665ca206sm11377434a12.18.2026.03.24.03.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 03:09:04 -0700 (PDT)
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
X-Inumbo-ID: 7df92f68-2769-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774346945; x=1774951745; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCGqbl32Z3lKiFMrkcslcve9d2BQbKfcbIPf55C+jQE=;
        b=qo4vScjB3/t3snEO71DhOAiDNNJaof00lkDM0w+a5KfnTrWcmyIxCEv9px0eZJsrxB
         tkjhOCrEJLEr+Jcb4/4sk1UZUJMqwGkELZ00Tvbcq5rnpZZfC9+x+ZrPgV0rjqOrLWXQ
         D3j2bzYYJ5IOK2CIQqnlnuLu+wdyKdUZJLdbPy8cZO2D4dNCu0CsVxvo/sG4Hyw9X7kF
         Z3Qa/Oo4qCjzaDOp1IbYdtg6BaOEyjFVQITa947RsweTpEjZq3a7yaz+xcfPLYehP5/I
         xyyueRu/QCUmYra0UZXD3jYg2nHe64hie2hkU3AZeN8xPuEv8o7V9Kt+JxiVyom5PAVR
         h8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346945; x=1774951745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCGqbl32Z3lKiFMrkcslcve9d2BQbKfcbIPf55C+jQE=;
        b=pDMrZZyh0Zcl0tPeazJIC1j70F7NP6JprWabixn1dskVSGr1HOFygd28l9/c1hJvfZ
         dgeLpxCLFml0GHYkWeCsSRyx9dxKXjUXOBOM4OZYKnUSpJKoG9/Vq8GWaNd+mbm6mkRE
         UtrHzZxDxnpy9HhKOPfoPcWX4lnvepQf7H51g3hW+N02KvRSmHIO13d04XrKLs4GnZEF
         UXG2kUUoBOqrIphVVN7OtVBEcB63gJqIgrix2uWXSaxQBuHSzyB6dQAyil1WUqdYrjIf
         CNUKpYEBYAdjtLsc94yr5rkDymq+F9rpVI3fmWAVeCYguOtLJMr9jKaLIIQRj2CEBKuI
         YLOQ==
X-Gm-Message-State: AOJu0YywMvNBoeD4Ce2DBfFcO25vbZuuLj+CaPLBKOTQ7HPEXpksZay6
	nPLHcZ4fZY/pP2XnGob8CDe9nTEdMcKB0KcA+xGqbd5qPgCOW5kLvCiWlkOcji+L
X-Gm-Gg: ATEYQzyxaTfEuxxzGKjY+PLBcqM8ctgHv5M4skXFTHSlHC0JI80YQkSjL98JR90bxpQ
	m3T76qhLrcPxEyj4/XIALKT6cniDNNQy9zTmnxXkv6Diu5CW2n70U1Eips2Fh6WLzm8Elm1KgdH
	y/HCLx+kjbrZfS0M53LsazCkmqPcYd5c+4EwcfQCwxMzld2r4Df4OX+QiK/vIPzGwx9mclQAOV2
	XiUEZcH4SJBTBUIzp0HlsGejnmc/rYBuJ5EbUOAXk6jbJCSFM5dSzoMUmC+a8gVpH8So/YOWnnE
	5BThrMOTuTkbYIQtHcrCsmktnsFcj5tpAA6cbbi+3f36Sg2Cf+kYgKNWEm3X7/e05Cxunp3Q4XJ
	N4hjFa8ihDkCTCsb32eq0kB6SW5AaK27+rY4xBzqaUEKoRfcj8mz+fk6NlGTLAnVagI5JIoHVKz
	UY+segqcnuQ7lKCKx0DES/qIuAdNpP/QJ9GP4EckLxKISvTokjClIl5yAAoG+kYf2qPWkAdawfX
	z5zyQ8zO+g2I3OenFPDOx9LDmDblM9K1QZMWDa20PdzsaZk7LrLxMpTXPJXHZKYCrmP2ifsKA==
X-Received: by 2002:a05:6a20:4304:b0:398:71b6:33aa with SMTP id adf61e73a8af0-39bcec312ccmr14913772637.64.1774346945235;
        Tue, 24 Mar 2026 03:09:05 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v4 0/3] Fixing ACPI BGRT (Boot Graphics Resource Table) corruption
Date: Tue, 24 Mar 2026 15:38:53 +0530
Message-ID: <20260324100856.6691-1-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[apertussolutions.com,citrix.com,suse.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,patchew.org:url,invisiblethingslab.com:email,citrix.com:email];
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
X-Rspamd-Queue-Id: E738B3063C2
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

Changes since v3:
- Fix casting away const issue.
- Add Stub function
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>

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

 xen/arch/x86/acpi/boot.c     |   8 ++
 xen/arch/x86/efi/efi-boot.h  |   5 ++
 xen/common/efi/boot.c        | 158 +++++++++++++++++++++++++++++++++++
 xen/common/efi/common-stub.c |   1 +
 xen/include/xen/efi.h        |   1 +
 5 files changed, 173 insertions(+)

--
2.53.0


