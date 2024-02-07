Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE0084CC4F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677660.1054396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiWl-00067o-1J; Wed, 07 Feb 2024 14:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677660.1054396; Wed, 07 Feb 2024 14:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiWk-00064z-U4; Wed, 07 Feb 2024 14:03:50 +0000
Received: by outflank-mailman (input) for mailman id 677660;
 Wed, 07 Feb 2024 14:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXiWj-00064q-3p
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:03:49 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5cee9d4-c5c1-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 15:03:46 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fff96d5daso5694705e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:03:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l9-20020a5d6749000000b0033b47cf3221sm1567726wrw.35.2024.02.07.06.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 06:03:45 -0800 (PST)
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
X-Inumbo-ID: b5cee9d4-c5c1-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707314626; x=1707919426; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kF60STwMtJ+pWFIeKlfRnOGuA1FbXzU7nSkrXcE9m2w=;
        b=Ud7kbpL+hHMY05dHzebgmCAnHRkI4ONCZDa0vP1hmRLetFid2R8n+hkHXEYlYjoBaN
         orMLPlGaXuo15VG0iXd4yAUtsQhkDBeg/QVeID9qEaS/+h/NNTbjgL4kzlG1m9uhVcFW
         EhCLHq7urMtMa7U0Lk6GAiGNp6e6G/DBfQnLED6zcvQ37dES2sgR175Q20MwkTfdlTOI
         hND7FrB5RYWgNHT8wOibfA9hegzlmkof3llbhUUz7ByGFYBmZu1mETy2rTYuJcZzpRys
         icgoc9RKvVgRteAZDUrTS70pa7gZ/LHU3DLiFgBmEqT7vtjKtLgJ4VGIffG79easLtSk
         tmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707314626; x=1707919426;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kF60STwMtJ+pWFIeKlfRnOGuA1FbXzU7nSkrXcE9m2w=;
        b=kPD4/I5Ek6eIGq0jNKUawaLzbq7aVYEwt5C+mwlzfSRh7WXYk+cPNzckmTrIuYYsLm
         tDov0FUp3yfVLpuz0uN7q27G06UV5QvQESHDaEtyYGPoMMOFbxQ2TymvGcI/ed2RN5Vv
         TuRxEokgweYaY3p9rJXZ4lGvtxs0OxnJ5LTKK1AFyOpGu1PjNc/3Fri+wMZuAwFOgJkh
         zMzHCEY6yhaymi4ydzjEFgAk9Nj0pYDFqwvVVjMlSyuthetNBlK7aezEMJ0j0VwlrhuI
         Cs1un0CDSnCNIh7KVZi0hI1xgS5ExgZAP/MAnKbrxZ2VjMS4HQdT9r/mU4y8ZEWzkA/V
         bayg==
X-Gm-Message-State: AOJu0YztkwMuvEy4y+fmXkAC1xhNrF9wKUxX2BdBtPwiU+MzSvbJZA9A
	zLOIssNlGKvhUZm1+a49b5G514t/TyambjYhe332N3hUDuXVacLCCnjyiHKIvxtYG21si/djYNY
	=
X-Google-Smtp-Source: AGHT+IGTnWuDDeU5k+oFyd0GTXnI0JwIfeo8H3ha7RzKP9kwHcTkGjL91ibaL6g1s7z7ji/6Ys+oqQ==
X-Received: by 2002:a5d:658f:0:b0:33b:4e7c:8230 with SMTP id q15-20020a5d658f000000b0033b4e7c8230mr1196474wru.54.1707314626012;
        Wed, 07 Feb 2024 06:03:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV58WzfdY/oXnfAxkJ4knywwEYdvpJBRsmJDsln/u7fqbFu9JrRhi+Ow005itjCHt5ch0oMfByC4v4/7xVNV3K4SwoMe8gJQMAL4WTJYbghQg==
Message-ID: <90070a25-445f-4b82-be19-d87b25fc9b8c@suse.com>
Date: Wed, 7 Feb 2024 15:03:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] hvmloader: suppress GNU ld 2.39 warning about RWX load
 segments
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

This aspect is simply meaningless for this component.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -20,6 +20,8 @@
 XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/firmware/Rules.mk
 
+ld-option = $(shell if $(LD) -v $(1) >/dev/null 2>&1; then echo y; else echo n; fi)
+
 # SMBIOS spec requires format mm/dd/yyyy
 SMBIOS_REL_DATE ?= $(shell date +%m/%d/%Y)
 
@@ -59,6 +61,10 @@ ROMBIOS_ROM := $(ROMBIOS_DIR)/BIOS-bochs
 ROMS += $(ROMBIOS_ROM) $(STDVGA_ROM) $(CIRRUSVGA_ROM)
 endif
 
+# Suppress the warning about LOAD segments with RWX permissions, as what we
+# build isn't a normal user-mode executable.
+LDFLAGS-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
+
 .PHONY: all
 all: hvmloader
 
@@ -85,7 +91,7 @@ $(DSDT_FILES): acpi
 build.o: $(DSDT_FILES)
 
 hvmloader: $(OBJS) hvmloader.lds
-	$(LD) $(LDFLAGS_DIRECT) -N -T hvmloader.lds -o $@ $(OBJS)
+	$(LD) $(LDFLAGS_DIRECT) $(LDFLAGS-y) -N -T hvmloader.lds -o $@ $(OBJS)
 
 roms.inc: $(ROMS)
 	echo "/* Autogenerated file. DO NOT EDIT */" > $@.new


