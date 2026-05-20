Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGoTHvOkDWpM0wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:11:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55FD58D5FD
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313898.1583931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPflb-0001Uq-6N; Wed, 20 May 2026 12:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313898.1583931; Wed, 20 May 2026 12:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPflb-0001Rk-2p; Wed, 20 May 2026 12:11:15 +0000
Received: by outflank-mailman (input) for mailman id 1313898;
 Wed, 20 May 2026 12:11:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPflZ-0001Ra-Io
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:11:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPflY-007XCj-K0
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:11:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da4dc-2eae-0a2a0a5409dd-0a2a450acb1a-18
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:11:12 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da4de-56b3-0a2a450a0019-d1558035ecef-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:11:10 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso57650765e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:11:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694fcasm368284335e9.5.2026.05.20.05.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 05:11:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1779279070; x=1779883870; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0ixmEhnIn+bt53HAzXc3q5zzjNf9ZvQMkFxbuYcfyU=;
        b=K9bUOvPXyreVzRcxqrsSyzFhXBuVM5Jq0/oMTK5eSin0pvjzXIhHit5ERdS0cU/PG3
         gfRLLEfkjHe9iWqBPt8kLB4DSvQ5Y5ebO6tlYPzd78wN45LoZ/f25AY+STJWMg/8O48u
         p5D96FDZ6C4zxMWYm0XRMwPeTGwwa0Rm46DNpJhpz+OvXMUK9Ro/JQDmmvvLQrZVHDEE
         8AhsMs811qNGAXPJ37CY9CU4rU3R7g+KS8ENFQ/YX91YN47jwGBmeJTjvBiIj/2LIxdP
         N0tVrBGuDfWowgAQ6LtORuARTkQzf8EUW0tAxIREBJUrPnSzTMRforDg9kNBTGI5GORQ
         b8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779279070; x=1779883870;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0ixmEhnIn+bt53HAzXc3q5zzjNf9ZvQMkFxbuYcfyU=;
        b=BZVJ+mLN/9eib0mW/tqwtNjXAg+ZK3b+r4A/WhXy4mqyC9Km89judyvGwzM68UATYU
         0AlJL+etdhUOENJE9as7D3ZIzInPycjV0rBC6jHZylp9olwys5IpS+c8NMqln8z7IdXE
         iHbhWKQPTlHWNb6p7nmALyMjc3hcgZ1JXqIISgIS0lxhx4C+tPCm8PDCoh/0yBNwSUsn
         O78FfTa499Hxu2tcJ11VIx9a8fLUAwhpBg/nA66oHUgSCMBVdUAYdt6PRy249qjnhf+w
         3GGifGqtPNflEDlGSjiN/1XbMvc6nE9WC6UlWGnqLuqqQvJKneyFZEsQkwdYKkATm8PK
         8ajw==
X-Gm-Message-State: AOJu0Yy59iNkWErMEusBmQeXYrNN8Xxam6XR5A1nkNSrJ7PYH1DK/zlZ
	fDun9k4KeK2yUnAfmdjz0neSSfbwmAEXN3N4Pn3hNETYFPBKNArE6v5qUEKVOvRV7L1GqA0yKic
	WEMc=
X-Gm-Gg: Acq92OEvT5c6R01XNxg3G3ZP2ev9ndz/m5HyR9VygyseuMzn2Sqf/x05Nv9HQK9NHZh
	t0ypfSpACWLgRO+PZzmL8GNPMb+p0c0lQIRNUGUnJk2sX9NP05+RDnV4RfOoIbBEQO1Hw1MgblP
	+iAS+j3gGoTK/U61JC2RRJLH303TJENfzceLpLmjHc0UPDY8TOxHnZ1dhTJ8mv/g98IRFwe9WrA
	2xz5LBOhyNY51gbomwiCNM5Oi4R+m4AHK/oz0jArAGuLiMyZpJfiFf5d4gbSK9j1KzYdqEYM4AZ
	1BBmMfd20VqxnHZICdMsglohVwJ4LI2VxE8oYXSNNFV2pB1mf1jRucPrcWsfavDfCAtoDVI0amM
	N2R3cl93lULkI9p0iaMs3JMyyumB6hQM2SidbodKxfOkHunPWUBD0QKIjuAix+284el88EHACUB
	7RP8Z0qqKt/5vb+MFt3Ai3Ynlm+LLtHVd0Ko3l/4YFDzuNXqQI9TTE2XIpliNW2Iy0oXE6Wl2/2
	FXY+Wl/Dd7e9ok=
X-Received: by 2002:a05:600c:a11c:b0:48f:e468:1761 with SMTP id 5b1f17b1804b1-48fe60e47afmr270980825e9.2.1779279070451;
        Wed, 20 May 2026 05:11:10 -0700 (PDT)
Message-ID: <7a2fb6cc-fc9b-43c1-9f4f-d5a573d52dbc@suse.com>
Date: Wed, 20 May 2026 14:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: strip debug info for intermediate linking steps
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
X-purgate-ID: tlsNG-4011c0/1779279070-72F718B7-58021305/0/0
X-purgate-type: clean
X-purgate-size: 2967
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E55FD58D5FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linking debug info takes time, especially for xen.efi. At the same time
symbol table contents aren't affected by presence / absence of debug info
in the linked binaries (the ELF and COFF symbol tables would have extra
section symbols, but tools/symbols omits those anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The main speed gain is from xen.efi linking. Therefore I'm not even sure
if this wants mirroring to the other targets, where only xen-syms is
produced. It would mainly be some transient space saving there. (It would
perhaps want retaining when the linking steps are moved to common code.)
Thoughts?

On the system I measured this on, "real" time went down from 4.9s to 3.9s,
while "user" time went from 7.8s to 6.8s (all approximate values of
course, as there naturally is a bit of variance, and all for full
incremental builds with no other changes, i.e. mainly the final linking
steps getting carried out for the common/version.o change).

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -127,13 +127,13 @@ CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_E
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) --strip-debug \
 	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) --strip-debug \
 	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
@@ -205,7 +205,7 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< $(relocs-dummy) \
-	                $(dot-target).0s.o $(note_file_option) \
+	                $(dot-target).0s.o $(note_file_option) --strip-debug \
 	                -o $(dot-target).$(base).0 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).0) \
 		> $(dot-target).1r.S
@@ -215,7 +215,7 @@ endif
 		> $(dot-target).1s.S
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $<  --strip-debug \
 	                $(dot-target).1r.o $(dot-target).1s.o $(note_file_option) \
 	                -o $(dot-target).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).1) \

