Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B1CC8556F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 15:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171925.1496999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNtnQ-0000fK-4s; Tue, 25 Nov 2025 14:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171925.1496999; Tue, 25 Nov 2025 14:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNtnQ-0000di-2C; Tue, 25 Nov 2025 14:13:32 +0000
Received: by outflank-mailman (input) for mailman id 1171925;
 Tue, 25 Nov 2025 14:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNtnP-00008K-Ba
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 14:13:31 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb7944b5-ca08-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 15:13:30 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477632b0621so37445395e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 06:13:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1e86b3sm306281585e9.6.2025.11.25.06.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 06:13:30 -0800 (PST)
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
X-Inumbo-ID: eb7944b5-ca08-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764080010; x=1764684810; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KaNyNHzJbdQlT5eiTr8Q0+pvIzJSFiMY8lV+MwLukWQ=;
        b=dIaWOtVbM02jQ5R3kgnRx+5Ta2PdgHbXqlNOJDguEykaBo7LBtOKvHQZvDlP64yNIq
         o8wbYuX0pKcCYljinzrG0PkhqXn8U1Lyi7/cUwEmrEzkuFuGxVDBE0hSjlF4MlKyeAml
         izAmkFT0l75AtPp/f0BakImt4u9Eui+dCb0/ABXCPblgL03TiRFczjZqLn3SmEZpyB2t
         V/8r+VdOn/n7Tb378nKNYd5KbIsBulPnqHviQkT5pc7wWKpI6EX4PNflXaeIOA6ZkwQL
         MFL6AS29ioE3Irfpr0ae/eYSOFcXMP2CNxRYBOLeRGZoRoF5fOwcvs+DsvjlgS3GMwrn
         uolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080010; x=1764684810;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaNyNHzJbdQlT5eiTr8Q0+pvIzJSFiMY8lV+MwLukWQ=;
        b=gWMKmVRomCVaVjL9KqEXwQjGc3lgAEhHJeTTQ3yWTG/bnS8PWlxzmcSGvZ5OlKyEnS
         QZQHmo0dP0inlmQNni9yMgIblZwkYD28YR8BQCd2PTrTTswEbRqtarEQWdBVDkdhex3h
         Bey8Uum6ALHt/RKHPWeu/4+zpsu81C7YzepqZR/vd2f8jt0pu+QTKUI7mlF7+sxrja4q
         D3tyve0gOADqJ+gyVmHLNpb7l43DZpR4IWzoveGoleW7PlPO+coas0TCHICOhTYmsSg3
         baogRSDPq9ottWsixbPlY4nI08N1cEOUmNWF4u77YUX7cXNUiF71yBkLI7OgKUXeniYs
         4Xlg==
X-Gm-Message-State: AOJu0YwSQOGlBWAo1ld2FPQ4Fh09cFqsAEAq8Q8AhpFvtJdwewYa6pTE
	LNeolxHQZ/26jy0UlIQjUMO3b9iv051RX0ln4EpcaS9Pt/MuRUqczpoDkpQHkpF7AabtWpOR1NE
	FKlY=
X-Gm-Gg: ASbGncv72UrRKg6lHfn3QE6kI69gbcdzupo2GhxeepQMw9Cu8pbAdM7mBYosfZb64Sq
	OF/WIpTrr2x9sA9dkM5Q0TIgB6wX3yYwg9Xt1mr/hY7pyn2TUUHXDDg9JmGWR1pbHbEc//5qTmr
	d0BagLbM65wL9yPyt4tXznQQXy5paolw314pywddTtJTiKqbXt4r3aH3OYOp+97Fo4JacELA3Ss
	8oAY0B044Alw6xvb+/Tyh9ALA2ProLHKMQXsCn5jhZVkdXPXcn5zair/HN4ZzEw98puBYN4OVmF
	MhyA/Ex2FXHOWwDZsAyjxlqgkz8xNBWsKESQD5rXcF0xwJ904/toNEjx/Y4p5S7afMS+of3pevH
	Jn/VtneF9qiQmox2xUQfH/jOy91/XolpDl0w8cI+Bm9xF6xrGqACFy/gI8k343+O+iKBxz2Bi7Q
	pm4PRxqVD32EWzbWyK+lTxxa9NXX5jMe5VcnH9AK1s/qWVKEwAP4YANHMUAnHDQelocTx/Pv+ts
	JI=
X-Google-Smtp-Source: AGHT+IFoZdPb7TP4DB4G2FkDHZxZpjzjMzzNpqNuDG6TjxNS4QVLO4p28reDDBx8pxp0ediFe/S3UA==
X-Received: by 2002:a05:600c:1f0f:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-477c1131db6mr162958465e9.30.1764080010293;
        Tue, 25 Nov 2025 06:13:30 -0800 (PST)
Message-ID: <8d6642b9-18ec-4fb9-8e21-96d6efdbe6f4@suse.com>
Date: Tue, 25 Nov 2025 15:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] symbols/x86: re-number intermediate files
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
Content-Transfer-Encoding: 7bit

In preparation to do away with symbols-dummy, re-number the file assembly
and object files used, for the numbers to match the next passes real
output. This is to make 0 available to use for what now is handled by
symbols-dummy. (Mirror the numbering to the intermediate reloc files for
xen.efi, just to avoid confusion.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Will want mirroring to other arch-es if the other patch is to be mirrored.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -138,17 +138,17 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		> $(dot-target).0.S
-	$(MAKE) $(build)=$(@D) $(dot-target).0.o
+		> $(dot-target).1.S
+	$(MAKE) $(build)=$(@D) $(dot-target).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).0.o -o $(dot-target).1
+	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
-		> $(dot-target).1.S
-	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(call compare-symbol-tables, $(dot-target).0.o, $(dot-target).1.o)
+		> $(dot-target).2.S
+	$(MAKE) $(build)=$(@D) $(dot-target).2.o
+	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(orphan-handling-y) $(dot-target).1.o -o $@
+	    $(orphan-handling-y) $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
@@ -212,25 +212,25 @@ endif
 	                $(objtree)/common/symbols-dummy.o $(note_file_option) \
 	                -o $(dot-target).$(base).0 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).0) \
-		> $(dot-target).0r.S
+		> $(dot-target).1r.S
 	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		> $(dot-target).0s.S
-	$(MAKE) $(build)=$(@D) .$(@F).0r.o .$(@F).0s.o
+		> $(dot-target).1s.S
+	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< \
-	                $(dot-target).0r.o $(dot-target).0s.o $(note_file_option) \
+	                $(dot-target).1r.o $(dot-target).1s.o $(note_file_option) \
 	                -o $(dot-target).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).1) \
-		> $(dot-target).1r.S
+		> $(dot-target).2r.S
 	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		> $(dot-target).1s.S
-	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
-	$(call compare-symbol-tables, $(dot-target).0r.o, $(dot-target).1r.o)
-	$(call compare-symbol-tables, $(dot-target).0s.o, $(dot-target).1s.o)
+		> $(dot-target).2s.S
+	$(MAKE) $(build)=$(@D) .$(@F).2r.o .$(@F).2s.o
+	$(call compare-symbol-tables, $(dot-target).1r.o, $(dot-target).2r.o)
+	$(call compare-symbol-tables, $(dot-target).1s.o, $(dot-target).2s.o)
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
-	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
+	      $(dot-target).2r.o $(dot-target).2s.o $(orphan-handling-y) \
 	      $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \


