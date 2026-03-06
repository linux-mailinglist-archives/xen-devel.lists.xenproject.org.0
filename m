Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC1UJ+TWqmnmXgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 14:30:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B13221A19
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 14:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247724.1546206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyVFb-0001IT-Hc; Fri, 06 Mar 2026 13:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247724.1546206; Fri, 06 Mar 2026 13:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyVFb-0001Gn-ES; Fri, 06 Mar 2026 13:29:55 +0000
Received: by outflank-mailman (input) for mailman id 1247724;
 Fri, 06 Mar 2026 13:29:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GgqK=BG=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1vyVFa-0000o4-Fl
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 13:29:54 +0000
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [2607:f8b0:4864:20::642])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e396bc1-1960-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 14:29:52 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-2ae82df847bso4383165ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 05:29:52 -0800 (PST)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840ad92fsm34784815ad.77.2026.03.06.05.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 05:29:50 -0800 (PST)
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
X-Inumbo-ID: 8e396bc1-1960-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772803791; x=1773408591; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBP4BGnTbEMnu9mY2BiK5Hh8it3pJ1l1Oia2XagE9LE=;
        b=QR2XyAwgkl3/rmt8LGy/KhLdz9u3WhxmRe86ZwWs5fErT2e745jNDVbLAS8EK2bkWH
         3lPREIf0JhuEWYQZiH72vY5+IEDkahphXczZ5hKnGpxKwL7YyyPAbRUAL4XH+/L+8p5y
         BY6j06/UfCERWE+Yb50Hl6PwRzbRdSOGFoCeG7ox6UqlaozHnyN1A0Mi+aEq2zM+Erg3
         exqHJnoLxj1vI7HZtGy0UtDEz4sCEfKPHCNuiyFNglffJD9TZPEkBYN3v/hNozoHlDsZ
         Xpuac4ZHjrA7TT+PYONI4fYD7pS8tq9XFWJtapNqqZD/MLF8BYT1XmaTs+Va1NvGa2Vj
         8b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772803791; x=1773408591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vBP4BGnTbEMnu9mY2BiK5Hh8it3pJ1l1Oia2XagE9LE=;
        b=oNtMXHgrbKElQ5uJ98tvlooHGRBq8iO6hQH7oh8PYhU8tMXvpK3Xdy6Z/6r10Ma69Q
         qdNsjqi8ZWTBToXofuLjvYyOAbU6cBoCHV4jLYJDShccFAwVeXMw9XshtEKr94Goqp6t
         Pf2Uv7nAHT1bkIkGce7kw7dR/8EUt/Y79b1OJYXRwQ2iX6YrK0E1EiqI33uqtQGSVduU
         kOMcORwCEnL72ZssHANJYEEdhgljh5Nt7f7ekmIZ/DtDBqrXzA6yIVYrRonDEm6+oQin
         eOIONg1KeVMTM2FjIpP4qGVDoayo6MkHGYxfr1RNUo6asUZPHxYJiMsNSRz/OFriTGpA
         gHPg==
X-Gm-Message-State: AOJu0Yz+ncWEq+PzMTOVAxZOS0ABFYTnC7ALeiNbZrnPEHL9cTfBfkKH
	u5m1XkDBmW7y+//QrEpF/9OKRCldSi+XY+jR3LVCG2QjylZ0CtLlzBhGrWagReJQ
X-Gm-Gg: ATEYQzxfr/rmyqOERz/cNBOHhV7YUUR+F9KfQvbMU6x0Ihjh940Asq0P3VnWLAFLtZt
	J+vgHZjqQYrSQw6clo9+W98x44dO1zfIVjWEbR7ZelRRakFz3bDm7vIgX8zq0t/IxM7ouvD7Lkg
	9ceLYG/sBKgBNOGFStoYahoQ0nwgtFXtH8z27SPfnbUe94LwIuqgCazPTOvwwGjR2p4L7LBIK5k
	0kefAplgs4rnH8KE1951t+4ohqiGZwOdh5Af3WFxdq4YWwchg/Tv4kL0IJ6Z1mJ72mVmpRlKt99
	upEA1pUS3tk3uiu/ru3cu1C4eBQioq3fsPc9kN7LUTx36r6ooMiTFLm4c/nxJ6BMeMiMn2phyUh
	HUk/CWWtNpyQpuTxj65ZpvfMBtycjosLA3Fk8Lk2FwfFI9sf2l2e13650lSnpgF52LVPd4v3OPq
	1OtUt3I306tZZIUeDuGnO3yqovb2WjjColjHc83vJEXbE7tZBIBaHXsrFr1E759Olt/Eni/xDpR
	ziCLnYc5wLZuo8ibDolzRsU3De5RXryBLZGjyiMYXElHUcQHI4bCSlIBBRe6qLDtSuj/AqkLw==
X-Received: by 2002:a17:903:2a84:b0:2ae:8293:7510 with SMTP id d9443c01a7336-2ae829379eamr22642085ad.54.1772803790870;
        Fri, 06 Mar 2026 05:29:50 -0800 (PST)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v2 2/3] x86/acpi: Clarify BGRT invalidation behavior with preservation
Date: Fri,  6 Mar 2026 18:59:34 +0530
Message-ID: <20260306132935.13727-3-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
References: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 87B13221A19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,apertussolutions.com,citrix.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Now that BGRT images are preserved during EFI boot (via
EfiACPIReclaimMemory allocation), the invalidation code in
acpi_parse_bgrt() is no longer needed.
However, The original invalidation code acts as a safety net for when
preservation fails or is disabled via "efi=no-bgrt".

Thus, Add comments to clarify this behavior for future reference.

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
---
 xen/arch/x86/acpi/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 1ca2360e00..9462cc6195 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -327,6 +327,11 @@ static int __init cf_check acpi_parse_hpet(struct acpi_table_header *table)
 	return 0;
 }

+/*
+ * Invalidate BGRT if image is in conventional RAM (preservation failed).
+ * If preservation succeeded, image is in EfiACPIReclaimMemory, which
+ * won't match RAM_TYPE_CONVENTIONAL check, so table remains valid.
+ */
 static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_header *table)
 {
 	struct acpi_table_bgrt *bgrt_tbl =
--
2.53.0


