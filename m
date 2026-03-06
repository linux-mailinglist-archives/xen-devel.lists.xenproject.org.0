Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNQkJ+TWqmnfXgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 14:30:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49948221A18
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 14:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247722.1546189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyVFU-0000qp-59; Fri, 06 Mar 2026 13:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247722.1546189; Fri, 06 Mar 2026 13:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyVFU-0000oA-26; Fri, 06 Mar 2026 13:29:48 +0000
Received: by outflank-mailman (input) for mailman id 1247722;
 Fri, 06 Mar 2026 13:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GgqK=BG=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1vyVFT-0000o4-2d
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 13:29:47 +0000
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [2607:f8b0:4864:20::641])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 896481cc-1960-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 14:29:44 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-2addb31945aso66594665ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 05:29:44 -0800 (PST)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840ad92fsm34784815ad.77.2026.03.06.05.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 05:29:41 -0800 (PST)
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
X-Inumbo-ID: 896481cc-1960-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772803783; x=1773408583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXltUrIM8u+3vchXEmdzSSxxFAB0jLJSYsohu1ixvuk=;
        b=RNjtSRraoWqEQFqaG7D5BJf21dpt1o9n2fGDsf9GolO0TeClBKEPQPqHaaIupzRKig
         +qNgRg+JWJSK2rn+6oO/atirVuRJgzJi6PJT3peSYfcsLxWwkkGjD68vrZa0SQ8JWJ64
         SLaYvCUGIZjqKTdkIBxKhmhlCoG4cxCO436J7T3I52SaboURaElTKTDKt7UtcrmXOGC3
         LNRHjUzb6qI3iGHvW67pj5xBMa2RJx8oAQbCj/AAiQNkqmdi38vl50aeEtIozSC0ouUG
         65K93JL+9vFOkZlY0uKhwUDCFdfZh3rvptG8xNxHYUfUhkkhf5OeMYOesvdMHrGUzAJp
         Tfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772803783; x=1773408583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXltUrIM8u+3vchXEmdzSSxxFAB0jLJSYsohu1ixvuk=;
        b=qpMAJ+Iq0cNBjlvH3VIHZaLhF2fPDczcV0DUPgGDMMgI3GFHJooQxtyC3ja/Tuzk8n
         vsqhUtW4fmrstdAS1tjCbNJaHlCw0m83C77Coj7WTkyE2WsQF1fpeqKpPgUBrbfACDRF
         tKldb3zscupxr8Gq/oRad446Q6IwX9u7QZm37jsl+O4dt5o16ObkU0r6gX7Lv/KPd8yj
         ynLzWj4FIOE5KCgABeu3pdgErbN2nhGk44Z2y29/yf6JBRU3OHQWTYwCCmnR2JQC1pTQ
         CgBLUbIEEDEwlDPHhLpa166DyYPn/EWSRLsJn6ZKr1io7mDPPfBv7I5r29W7tScp/FdP
         U7aw==
X-Gm-Message-State: AOJu0Yw2voE6YpEGr/0Jo3mMIFmZGRwrvAYpvYL3bpKxHlR2dlC1Sdri
	u8Eq178ljKUe8VaKdMJxU33NIKQ3c34a2cry3QNJGq6egPslbszf0NPikoCdD2vC
X-Gm-Gg: ATEYQzxYjsDDO31tqBO6nRbIbxNdm6ZI6MgztrcubkjtJXIGP8nDjhuhTbAPjtdr5Y8
	hficIwJCYzPPNW8tRSAw3SVgIgDMILRpvz/DI3JqDqPNuqa/1J6IFuTReMtEeo13SgDNXlMx7aA
	wAh/y3PjcXog5SJLi94Y5Eiu2E0s5EO9CIOjxYWCeUfVK/i7jhIx0RKIPdLHYNky7iVw335tATT
	dSv93Vvg7lNUfFvN8XG0gz8Duz8N68iYcp36O9iiCspsX6hkuy3eNCcB8RDVdfzyrb3ZOEgVaYv
	wy9UBfs5eYKzdRB60ZTr99nWefi++06tCeqN89DqBevVNqMUe0FxUJ5i+RdZr4+RRWPAlVRaa9v
	MiRvC2eK3c2YkeWjKGfk08YC9BrH7AKvanwtglNjwd8+9+7DbBgqja2gL+eRiihjcCHzHjOJx9y
	g2z4HhK5aHxvBJkxU3r60X3vVVOVssxGXd1YZJsw+dCYnI8Xnd31KRvxO01pVfG4aChgAzmIKcq
	/AgmlflRXeH8eH85vo2u8zeWfHZm2IdnY6eAM+rRJLBiTdNTKaubpR5bcPcVdT7hPQMvROS8w==
X-Received: by 2002:a17:903:2a8c:b0:2ae:8055:62c8 with SMTP id d9443c01a7336-2ae8243b575mr24922535ad.32.1772803782645;
        Fri, 06 Mar 2026 05:29:42 -0800 (PST)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v2 0/3] Fixing ACPI BGRT (Boot Graphics Resource Table) corruption
Date: Fri,  6 Mar 2026 18:59:32 +0530
Message-ID: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 49948221A18
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,apertussolutions.com,citrix.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Action: no action

This series fixes ACPI BGRT (Boot Graphics Resource Table) corruption,
that occured when Xen reuses the memory containing the boot logo
image before dom0 is able to parse ACPI tables.

The BGRT table contains a pointer to a BMP image stored in
BootServicesData memory. When Xen reclaims this memory early in boot,
the pointer becomes invalid, causing Linux dom0 to report:
Xen: `(XEN) ACPI: BGRT: invalidating v1 image at 0x47cc2018`
Linux (dom0): `ACPI BIOS Warning (bug): Incorrect checksum
in table [BGRT] - 0xF9, should be 0xB4 (20250807/utcksum-58)`

This series:
1. Adds BGRT image preservation during EFI boot (similar to ESRT)
2. Clarify BGRT invalidation behavior with preservation.
3. Provides an opt-out mechanism (efi=no-bgrt) for servers

The preservation is enabled by default to fix the corruption for all
users, with minimal overhead (~1MB). Also, servers that don't need boot
graphics can disable it using the "efi=no-bgrt" option.

Changes since v1:
As Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>,
pointed out the BGRT invalidation behaviour should
still presist and server as a safety net when "efi=no-bgrt"
or the preservation fails for some reason thus:
Add Clarify comment for BGRT invalidation behavior
with preservation.

Testing:
- Verified on Intel UEFI system with Fedora 43 dom0
- Before: ACPI checksum errors in dom0
- After: Clean boot, no ACPI warnings
- Memory overhead: ~972 KB (preserved image size)

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>

Soumyajyotii Ssarkar (3):
  x86/efi: Add BGRT image preservation during boot
  x86/acpi: Clarify BGRT invalidation behavior with preservation
  x86/efi: Add opt-out mechanism for BGRT preservation

 xen/arch/x86/acpi/boot.c    |   5 +
 xen/arch/x86/efi/efi-boot.h |   2 +
 xen/common/efi/boot.c       | 199 ++++++++++++++++++++++++++++++++++++
 3 files changed, 206 insertions(+)

--
2.53.0


