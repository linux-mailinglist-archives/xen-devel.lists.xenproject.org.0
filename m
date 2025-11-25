Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DD2C85581
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 15:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171933.1497009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNtoO-0001BD-Dr; Tue, 25 Nov 2025 14:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171933.1497009; Tue, 25 Nov 2025 14:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNtoO-00018m-B8; Tue, 25 Nov 2025 14:14:32 +0000
Received: by outflank-mailman (input) for mailman id 1171933;
 Tue, 25 Nov 2025 14:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNtoN-00018c-41
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 14:14:31 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eb729e0-ca09-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 15:14:30 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so33424915e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 06:14:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052ec685sm17007945e9.6.2025.11.25.06.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 06:14:29 -0800 (PST)
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
X-Inumbo-ID: 0eb729e0-ca09-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764080069; x=1764684869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C2rTa881RuqBzXRcUsUHqbJiTkrkWVDMZxwb4K2Ntts=;
        b=cwPtxje5pa+oGVYudL8HWR6BG8qLSIP9cdyy1jDWKbW2BTblqIiIownph92b0iWe09
         ebxfECiIkvYx5EjMXAR6bZdqz01P+RXT6ebPK0aj+VqofJIThBvoFVL4Rlhq1sQljg5Z
         l5XZ84czUFW+ridQ3Si7ysgFojizoAiTvezVIB/Uu8xOp2jb8Z/pHxQw3C0SjZBMy0+v
         bWADnsCZXrGsTBzNnvFKHoHDkSsaPDmWGkqmRlaD6Q+Z4hwoPWHtQR2Ik+38vHxciSz1
         tbX80Kzr+3PV0ZZ4IjOWeLMowyC2h+uM8+5+p/yLDo3Ayj60JFyBJJ4h0X7wpjcu6K8s
         JhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080069; x=1764684869;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2rTa881RuqBzXRcUsUHqbJiTkrkWVDMZxwb4K2Ntts=;
        b=nSuDPjOhEYDFAfSt3Zkk5W9u3cdtSfRyEyAJbaAlZSSEApeaBorcN2GY3igo1O7PX5
         6yfCBICE3zsksbrY9LVXrya5FQFY+EKPVg7oyDrRpCVdhKgLgYPuY/p5KomJgzPIMeOU
         5B0bXm1aWiLwq0xTleMLTAuNBhS3ogNuHlaEdJwk97CFbgNc+bZEOpAcTWIIeoxPPZaF
         u5y7mJl4FL+qk14xQVjeb3WtvnCAARS0NIZYNmtVtK3zl6YPwgc/52MA8npD6Z1uW7Hl
         6RyY+Jhb4QtUCfFIAZz2SX57HpLRlAP5hrgnQsZpr1IxEPJQTGkAU+uBy95IDmA+kvcL
         NGMg==
X-Gm-Message-State: AOJu0YzI9oZI4jCm3m/rHA3PcNW+zNyQ5T5YKck39PGbRgu6r8Q6zZBq
	zF+/VGOkXB4C3/en+TslclUQvWpcOmS1846w9gxjgaaX0rAfueSZNnrMpnbt+IrfGnKMDbfZQN1
	biwg=
X-Gm-Gg: ASbGncuiyH8qhtUKHwQUtPUFAAl9GvV65XctMTAcf5PbiJyuYPtXTFZhE9t6kCtdY+8
	8+SFOuhC43/La6jh+nsstGNwjZF8VLkjBMszzs9xPf3k0HXlwe2Ock3ngMCPCZ7uVIjBlDtTkpm
	wx9pxqGDbRoOFU1nFF65UdytwGPUWkaxYrbSV1NF2QWDlqm9EKGzZE1qTtX03RKlkjKgSXO0k2n
	4UEGMqSyAzEW8tQjokPGMkzpiQVeVlE09AwvOc9GiY6KKGvEKm1F4bQwqRFxAcHyvqm0/24s6sE
	pjFdmgIUYV62Jmv2ZPfT8C6SV1gZhQEqx3ovaMQ/AehDkhmuNNO2H2RZZPohnfVIQBe3rNv6uEV
	7lzXHJz04/wTdr06xjauCrMQmMBGVKnU+kZqHffydkgh5difeSQsDyCwv+HIgh3SjBlT/57jXOH
	ecEYxvFiSJ1Cy8P/mw5BK62SBOXKcU3KlMlw1w5+lqeezL+nD8QzzHEY18rOHE9sKicf8b7KhDH
	im4mloGFQ+ggA==
X-Google-Smtp-Source: AGHT+IFMFDWVGoS3SIevGkCpjlxtj6FPmIJ18FsU67YjyjEbWa3ncUJHAu6NhdlzqQrD50WtI5MClA==
X-Received: by 2002:a05:600c:19ce:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-477c115dfaamr138449205e9.33.1764080069411;
        Tue, 25 Nov 2025 06:14:29 -0800 (PST)
Message-ID: <3618c458-d9ec-4cc6-a800-0741ade461a1@suse.com>
Date: Tue, 25 Nov 2025 15:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] symbols/x86: don't use symbols-dummy
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <2d7602ce-3665-4853-85f0-c0201642193f@suse.com>
Content-Language: en-US
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
In-Reply-To: <2d7602ce-3665-4853-85f0-c0201642193f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In particular when linking with lld, which converts hidden symbols to
local ones, the ELF symbol table can change in unhelpful ways between the
first two linking passes, resulting in the .rodata contributions to change
between the 2nd and 3rd pass. That, however, renders our embedded symbol
table pretty much unusable; the recently introduced self-test may then
also fail. (Another difference between compiling a C file and assembling
the generated ones is that - with -fdata-sections in use - the .rodata
contributions move between passes 1 and 2, when we'd prefer them not to.)

Make tools/symbols capable of producing an "empty" assembly file, such
that unwanted differences between passes 1 and 2 go away when then using
the corresponding objects in place of common/symbols-dummy.o.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
May want mirroring to other arch-es.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -134,8 +134,10 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
+	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
+	$(MAKE) $(build)=$(@D) $(dot-target).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
@@ -207,9 +209,11 @@ $(TARGET).efi: $(objtree)/prelink.o $(no
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
+	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0s.S
+	$(MAKE) $(build)=$(@D) .$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< $(relocs-dummy) \
-	                $(objtree)/common/symbols-dummy.o $(note_file_option) \
+	                $(dot-target).0s.o $(note_file_option) \
 	                -o $(dot-target).$(base).0 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).0) \
 		> $(dot-target).1r.S
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -672,7 +672,10 @@ int main(int argc, char **argv)
 				warn_dup = true;
 			else if (strcmp(argv[i], "--error-dup") == 0)
 				warn_dup = error_dup = true;
-			else if (strcmp(argv[i], "--xensyms") == 0)
+			else if (strcmp(argv[i], "--empty") == 0) {
+				write_src();
+				return 0;
+			} else if (strcmp(argv[i], "--xensyms") == 0)
 				map_only = true;
 			else
 				usage();


