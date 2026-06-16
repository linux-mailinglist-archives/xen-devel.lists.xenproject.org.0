Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ke73Dk93MWopkAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 18:18:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DFC691E9A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 18:18:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=DQpAw94J;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339458.1600662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZWUC-00062J-71; Tue, 16 Jun 2026 16:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339458.1600662; Tue, 16 Jun 2026 16:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZWUC-00060W-4L; Tue, 16 Jun 2026 16:18:00 +0000
Received: by outflank-mailman (input) for mailman id 1339458;
 Tue, 16 Jun 2026 16:17:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZWUA-00060O-M5
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:17:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZWU8-005S5G-PH
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 18:17:56 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a31772d-2eae-0a2a0a5409dd-0a2a4509e8a6-4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 18:17:56 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a317734-2497-0a2a45090019-d155802de012-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 18:17:56 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so52007245e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:17:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa9f2c0sm107909845e9.15.2026.06.16.09.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 09:17:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1781626676; x=1782231476; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HL5Txwel/vVpqslY69DdFTZVyyGiofOpUDWWfNosCY=;
        b=DQpAw94JZh9la6kyPOP0VOqLIknq0n8h3fyFdqr4vn4a9LpBZAX7v9qNPsAs60N2pv
         D1oz7KRnYd7bMjktXCauZGbMPc6vNgn9NUydxpQXhK7p17yXok8UFrjXYyhcM5sPuCY1
         mugyExq/vf8AirEc8Eme+sbx5z4Ro2jXNAhPeZOB1TJokg76VHQHUq1XTxxgXwhb5dIu
         KU3Qj6PAF/RBYh9kJa6F7mqONboPU3cfyzowxIqZwoauRLag8d3dzZSiLjJdF4WcRp5l
         iRzHbUGMBBdcuAkXm6p5vXZadITEYOgtJVPh+bI0Mm9yLHxCXBpyq/uQ1/ljthFQ/JZk
         nKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626676; x=1782231476;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HL5Txwel/vVpqslY69DdFTZVyyGiofOpUDWWfNosCY=;
        b=fyy0FID+JtlExOopXeArtbjrL6haSEkLgNKE5HZpyyEWrGvaEdR81RGIyMMd5+jM8Y
         pzZDytE6A3b2y1pj/jnk31B7WCltNZdvM8RrOHpnkh19mMVR63X42NH9m/gQbZlfOOF/
         h4goJdit00yDpDrUmcF15CNMdnABBzYLPxejDvUcN38AGhZnvMi31BpTFpvUOTSuVZbZ
         /xJWa3hWY/qlDw8+RXWtaWLgUjbTiRHVmGdybNKRS2AYGEpoV0ehUd8qSuOUU16oR9dq
         5/Ib1MRPlUel1KSkrbbyigZfuWcFD0NzI+XnXa+makr7u5q/Glj4j0S9bS6FYywrHBPb
         zNKA==
X-Gm-Message-State: AOJu0YyeTHJ/ke7Q47hP55uJOoBKgEniPsimaihco+4w3SZ7N0RHg/Sl
	RTLvLsv2wZUavzC+KejkNRYxfUCe3mwTysaRROT+YC89yeuvxnI9hsnxN/x16+tUtsZqecZ0qyq
	bJ58=
X-Gm-Gg: Acq92OFe9fKcBwsEyxymGGH4/MaEHB8mNHD/jCXKXvEFrWmTrssLYpr6y6ONftmVx98
	X49zc/zLJyclRQQjGYG78sjTZiq7COC2VgRDJGMi7ZVsWVl2MvAPKlByInB4OKiWaImsagO3Nnx
	QFJC5GWfA1Sh6RrL8hAFvskt2DqFFAkB7Pjqh22UbR+AU8cljs8JrahPYEmjh0JOwkH6vJIGJeb
	IxNeSsJRSd7y6hJqQs5ICORJd3bmyYm0jKqgSsdyziQq+F5KgB0YHrRoIiO39DoNB3iqPjez32a
	zGi6vcXf6ta7vKWQFH3+86ymuWrymCqo+XzOeXO/pkIWmDa9iDGKRVTGxS4XCfKkg7A/hWnRiBS
	OsRqzuNupWYlyMESE64EDmtWmx5m/LDghbDQ1SmWlrNnAP4fPyk7Smm7rai8zVe93mh592GI+h3
	alSJQ0eADmYfJ+CMPCdHnem0fJCY60bx46uTAEYJSnl2sXZ5UMxkboOr3Xr2aHNTdjoDDnVtGgj
	0DEU4c+5mJYzKg=
X-Received: by 2002:a05:600c:1c24:b0:490:c2a3:1782 with SMTP id 5b1f17b1804b1-492333f8042mr2490065e9.35.1781626675896;
        Tue, 16 Jun 2026 09:17:55 -0700 (PDT)
Message-ID: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
Date: Tue, 16 Jun 2026 18:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1781626676-41D6FA53-0CB7A4D6/0/0
X-purgate-type: clean
X-purgate-size: 3118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,invisiblethingslab.com,apertussolutions.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[10];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86DFC691E9A

Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such sections,
yet we need to access it ourselves when switching out of "physical mode".
Leverage behavior new to GNU ld 2.46: Any contribution to .reloc which
doesn't have the discardable flag set (which cannot even be expressed in
ELF) will yield the output section also non-discardable.

Since for intermediate binaries we don't care about section attributes,
link in the new object only on the final linking pass.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
With a new enough linker, $(dot-target).2r.o could be leveraged instead:
$(dot-target).2r.S is going to be empty (or if it's not, the .reloc
section there would already have the wanted property), so instead of
adding the new relocs-empty.S we could also insert the section directive
there. Overall that seemed more convoluted to me, though.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -196,7 +196,8 @@ note_file_option ?= $(note_file)
 
 extra-$(XEN_BUILD_PE) += efi.lds
 ifeq ($(XEN_BUILD_PE),y)
-$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
+$(TARGET).efi: $(obj)/efi/relocs-dummy.o $(obj)/efi/relocs-empty.o $(obj)/efi/mkreloc
+$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
@@ -227,7 +228,7 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).2r.o .$(@F).2s.o
 	$(call compare-symbol-tables, $(dot-target).1r.o, $(dot-target).2r.o)
 	$(call compare-symbol-tables, $(dot-target).1s.o, $(dot-target).2s.o)
-	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
+	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< $(obj)/efi/relocs-empty.o \
 	      $(dot-target).2r.o $(dot-target).2s.o $(orphan-handling-y) \
 	      $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $@ \
@@ -247,7 +248,7 @@ $(TARGET).efi: FORCE
 endif
 
 # These should already have been rebuilt when building the prerequisite of "prelink.o"
-$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
+$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o $(obj)/efi/relocs-empty.o: ;
 
 .PHONY: include
 include: $(objtree)/arch/x86/include/asm/asm-macros.h
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -17,5 +17,5 @@ obj-y := common-stub.o stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
 obj-bin-y += mbi2.init.o
-extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
+extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o relocs-empty.o
 nocov-$(XEN_BUILD_EFI) += stub.o
--- /dev/null
+++ b/xen/arch/x86/efi/relocs-empty.S
@@ -0,0 +1,8 @@
+/*
+ * Empty .reloc section, simply to indicate to GNU ld that the output .reloc
+ * section in xen.efi should not be marked IMAGE_SCN_MEM_DISCARDABLE.  This
+ * requires GNU ld 2.46 or newer to actually be understood in the intended way.
+ */
+
+	.section .reloc, "a", @progbits
+	.balign 4

