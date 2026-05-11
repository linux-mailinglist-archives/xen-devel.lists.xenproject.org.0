Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGXeHLioAWqFhgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:00:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA3450B787
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305952.1578058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMNQi-0003fs-2X; Mon, 11 May 2026 10:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305952.1578058; Mon, 11 May 2026 10:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMNQh-0003dC-Uk; Mon, 11 May 2026 10:00:03 +0000
Received: by outflank-mailman (input) for mailman id 1305952;
 Mon, 11 May 2026 10:00:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMNQh-0003PO-8x
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:00:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMNQg-006U3W-6y
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:00:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01a890-bab6-0a2a0a5309dd-0a2a45028a90-44
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:00:02 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01a8a1-af86-0a2a45020019-d1558029d935-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:00:02 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so6070855e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 03:00:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e701e957asm176120265e9.6.2026.05.11.03.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 03:00:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778493601; x=1779098401; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVd9iugrtUDUjoruVF6GpRXRAR1XLlPcsH6axxeJ14k=;
        b=Uz8Vlu4GKIX8xMidHyYgANMxK/ZuetjMR/8Snbe7zIAde0dawyLAh//cMxhvPdw+MZ
         s2zxFJkPIIw55dTOHTOjOzEIXm9I6qaao0tnxj6aSTMS89u018U+HthvcN/Kxkt16ski
         nYsePBNvK4KF54gm/5h7MS/8rSM6kmtQn319ezIe3dwJpp/RaOJ3m5hWFAsOETj0Iu0G
         CR9IoBYs+hpE7i2Qc35A2cfXjuCK7zQ1vzEN+BMnXk6tVfpb4BhCB5fY08/5JMYTVsn8
         V6IEWqGfOQH0GNoNqbM4QwDI6t8qk1si6VNDD0TB9wFptYQelzIifpCp/vFqYGNvdyHP
         7zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493601; x=1779098401;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HVd9iugrtUDUjoruVF6GpRXRAR1XLlPcsH6axxeJ14k=;
        b=Qj+gL0X0g8+znumDDgMVeiY/5BVgdZXQmFE1xkhs707kefsQHXc0u4GQZnny2fXfG8
         JfB6Lv5q0SWboeVoiigQ0fLpPEvlT7wabqvxe7uoWogjob9DzmP5HpiYjbupCbqUkaYn
         tkipttwPJ8eqyHtAzLrM0HXYYMkrLr4CTwMG/s1Oky/9AUpEsek8ZfgZa3dLEU2ROv6V
         2rhTxbs/P3s2QRq19PqLpJTKFMripWndhGsvyokp0jAQIohtP6X4VRDC79CzCiSRRRu5
         OJ3BKPNPyDv73ioJMIVxdk9JfetQKnh8O00srSbQy4Oe/IFPqdqObdCAdTnlgAtF6oCN
         bBLQ==
X-Gm-Message-State: AOJu0YzArqsnS8eKDG6m3vASQwrU0JXKQX84AKHmFvO0QH2yb+BhhTFZ
	aG/66NLsV5uUERQUub80FdCX26aRK09dKQHEtloONddMYZYIId1tcokqA74DDYxSK3WI+LzhD1O
	QzAg=
X-Gm-Gg: Acq92OG4oA2oEaYCv+7ZBvokAjEeq8zzyds3RHw7rikUO0w/SA4SpjFAro2FH9ZvELM
	ewOUJW/sBHLpZJ+WBAtVv2FEzQ7ZjRmjGurMslq19iERQvad0k1WZcRqAPY1R7SLzAuJNZc4E65
	HNbWnRYSa5Q5Z5hfYxv6yUkbW3XcjAnfuezgpZnEyatvWoftHTUyIn7/IYjYXaZgWFoXUAVmi49
	Triae/tOwydA7wTyDZbvvy5N3HU7PcdZIGhzXlJpxOeJYVwDFPAhAClLLmTuxh/Z+R1jHnToqYA
	T1OXF13Nl2mpWttTho47HEWBRbnHCFxvwwWQJWoTxlJJUBsGBlRkqhRZDDL4YkeRZUDfbnZAznc
	AA+aFhDEJOzRDn5jjPIYlB2a2HB3S5qArHjvKkdGkfKotxj4gY0I3Gj6x3RmjFcVR5AI1jFibVU
	2ccj59wb+oKhptHnfxcAf7HsuhehODQpq1q7i6Ow8ODcSJoR9NaaopYb01qqaK1XLYgxzdXpvDC
	y1OF2j3ahZn70Q=
X-Received: by 2002:a05:600c:a30b:b0:489:1c1f:35f9 with SMTP id 5b1f17b1804b1-48e51e1773bmr320788445e9.9.1778493601443;
        Mon, 11 May 2026 03:00:01 -0700 (PDT)
Message-ID: <f921abc1-1f1a-4ef1-b21b-a65b5d50eafd@suse.com>
Date: Mon, 11 May 2026 12:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] symbols: explicitly specify source file name for symtab
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
X-purgate-ID: tlsNG-720697/1778493602-A8D7F161-852BBC38/10/73395122804
X-purgate-type: spam
X-purgate-size: 3295
X-Rspamd-Queue-Id: BFA3450B787
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

If there are any local symbols in an object file, GNU ld will create an
STT_FILE symbol derived from the object file name if there is none in the
incoming symbol table. The object file name, however, varies between
linking passes. As a result, symbol name compression can yield different
results if any of those local symbols need retaining (Arm [and RISC-V]
mapping symbols are omitted, for example). If that difference in
compression would yield a difference in the sizes of symbol_names[] or
symbols_token_table[], the compare-symbol-tables sanity check will fail.

Fixes: d37d63d4b548 ("symbols: prefix static symbols with their source file names")
Reported-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The observed problem was with a stub generated as Arm64 erratum 843419
workaround. Such stubs' symbols (imo wrongly) are associated with the last
input object, rather than the input object they belong to. Also for other
kinds of stubs, afaict. See
https://sourceware.org/bugzilla/show_bug.cgi?id=34140.

As per the above, having a Fixes: tag here is questionable.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -200,7 +200,8 @@ $(TARGET).efi: $(objtree)/prelink.o $(no
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
-	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0s.S
+	$(objtree)/tools/symbols $(all_symbols) --source-name=$(@F).S --empty \
+		> $(dot-target).0s.S
 	$(MAKE) $(build)=$(@D) .$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< $(relocs-dummy) \
@@ -210,6 +211,7 @@ endif
 		> $(dot-target).1r.S
 	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+                  --source-name=$(@F).S \
 		> $(dot-target).1s.S
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
@@ -220,6 +222,7 @@ endif
 		> $(dot-target).2r.S
 	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+                  --source-name=$(@F).S \
 		> $(dot-target).2s.S
 	$(MAKE) $(build)=$(@D) .$(@F).2r.o .$(@F).2s.o
 	$(call compare-symbol-tables, $(dot-target).1r.o, $(dot-target).2r.o)
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -66,6 +66,7 @@ int token_profit[0x10000];
 unsigned char best_table[256][2];
 unsigned char best_table_len[256];
 
+static const char *srcname = "xen-syms.S";
 
 static void usage(void)
 {
@@ -356,6 +357,7 @@ static void write_src(void)
 	printf("#define ALGN 4\n");
 	printf("#endif\n");
 
+	printf("\t.file \"%s\"\n", srcname);
 	printf("\t.section .rodata, \"a\"\n");
 
 	printf("#ifndef SYMBOLS_ORIGIN\n");
@@ -679,6 +681,8 @@ int main(int argc, char **argv)
 				unsorted = true;
 			else if (strcmp(argv[i], "--sort-by-name") == 0)
 				sort_by_name = 1;
+			else if (strncmp(argv[i], "--source-name=", 14) == 0)
+				srcname = argv[i] + 14;
 			else if (strcmp(argv[i], "--warn-dup") == 0)
 				warn_dup = true;
 			else if (strcmp(argv[i], "--error-dup") == 0)

