Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qXRkDGnOQ2oGiwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 16:10:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFE6E5419
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 16:10:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=U572B5Cl;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349026.1606815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZAR-0000Vi-I1; Tue, 30 Jun 2026 14:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349026.1606815; Tue, 30 Jun 2026 14:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZAR-0000Sw-EW; Tue, 30 Jun 2026 14:10:27 +0000
Received: by outflank-mailman (input) for mailman id 1349026;
 Tue, 30 Jun 2026 14:10:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weZAP-0000Sq-Vj
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 14:10:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weZAP-00Gv5e-CT
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:10:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ce50-bab6-0a2a0a5309dd-0a2a4509a6dc-4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:10:25 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ce51-97e6-0a2a45090019-d155dd2eedc8-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:10:25 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47231f1f8f3so4019882f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 07:10:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8c721f3sm97202535e9.5.2026.06.30.07.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 07:10:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1782828625; x=1783433425; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SYNpEqr+SYLDTVM8/OFnF6qGUwExC9aE4aQ7rwpCLs=;
        b=U572B5ClM22jAJ3IDGikBkIZX865hDWMT92Mg176siCng3H91BRyjG8M13f4Jm7fy2
         iJq5Ba44LqFt99jZsW7BAMN5WoshAf2IYzOHf6WG9WEw1+fA+iquCac2xJkZq6fzoOhr
         1LA9L/zXTcWHWDPDlzoya7l0HuMuimpR6A2lG7EFtzc7aJm6Cds9dri4luFPhI5mrMkW
         lYQoiDh/4Icz8qv4nI0113XnonV8SLTk1vMxGGq6RjIP1Pxlu5jeyo3F8bCo+/oBPWSS
         HBSavBBDdzJIkKHC6ESSQAiITYZKAHjGJWgJaPoLDiMpQIV1KUuRpi8Y/2datxOyZCmh
         +XzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828625; x=1783433425;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3SYNpEqr+SYLDTVM8/OFnF6qGUwExC9aE4aQ7rwpCLs=;
        b=rmoNATbdhtHLeRqLXetE+Llti5GXGQ+K7IfYcYlY/EVqtfzymdqg9ZLF4dESUfRbMM
         WQ2G0qjaKfdqMo9L9l8l6DPw5rnJE36V57Sto9Qow5/yl9k03h5lvWbo3K+7BPfT4v52
         FdOthR948m3/+Fj+uaJ7jH00ksjBGChftyR31xLRGWj0JLuSdPDOidpN0jSD4auN5WT1
         Y9Z0K7noCdRyj7w6eewf/yQxNX7NelM5Re3SHNqZge9xeAi95A8MHScVI+afvMeS4T+V
         4Z+ftH1ff6puZWE+TGpN7DWMkmxApny42gSlzV6S49eJkGOntOMECLSeKrvLW9wK1PTW
         dnIw==
X-Gm-Message-State: AOJu0YyluEUNPaqHMbPtk/jWP9IZW2vOQyW2eP/JxbgJNLLVns0uuvie
	FmCDkDXiMaz+yZezYRaFi9PmWiEssk/3O7alN885CpTMd+O23R1txDaVEyIeSoQlzQlGiGzFwck
	kTwKc1w==
X-Gm-Gg: AfdE7cma9pQkqXzL77mcg223BI3NVIHhapFoRdQ7QRapl+nLTG6QxU7Zpou9+f5O+yb
	QV8tLXftxP31yEVFXJzatiSYkF2WJ1P84g89KGeT6YJs8T1IEEeqRndaXJAg/XQwRO2+litLl5c
	40DE4HWGUaVrEhiIgosFfgEB4TBLleDlicLqcf6+jO1d85gyphNvnxuVyrTsUt8XU+32EdIZ29r
	qPvVKggA2Xne0NBINei41JzeyWINtKUi1ZoTLPS/BKaLNNumcJDM16CKBEGJtYfkMcxdfsw2O6r
	ufi5NtrQxv7L/QYbf4ti94JPsXWl4RioyzMPMPE3uimkGqV/oZcWyNCDsfprj5aUxqCCiI8NdMH
	pPfr6m3NhmJy8zpWxL5mEAzKF+orQPfr+oAKIpeF8shTYZvP06JyLgSOqf2CA1DKGMAs4+E0+P/
	HYeI6EUvY+zcS69Fg0hSl7NtxLDkWJ1EjuZtmdB6EBgQDHhOIftXj+6sE73mesmLJkng1+oarQR
	0L509ixe9FsH4w=
X-Received: by 2002:a05:600c:6288:b0:492:490b:a604 with SMTP id 5b1f17b1804b1-493b82c3c58mr55671515e9.37.1782828624717;
        Tue, 30 Jun 2026 07:10:24 -0700 (PDT)
Message-ID: <720daac9-c050-4a71-80af-61edc985c6d9@suse.com>
Date: Tue, 30 Jun 2026 16:10:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop unnecessary 'c' modifiers from SHADOW_STACK_WORK
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
X-purgate-ID: tlsNG-bad1c0/1782828625-44729986-2F4C3DFA/0/0
X-purgate-type: clean
X-purgate-size: 1409
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66FFE6E5419

The modifier exists to omit the '$' when printing constants (generally
needed for insn immediates in AT&T syntax, but unwanted on e.g. data
emission directives). It's pretty odd to use it just to then stick a '$'
onto the result.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Strictly speaking at least the [stack_mask] constraint also should be "e",
not "i".

--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -157,10 +157,10 @@ unsigned long get_stack_dump_bottom (uns
     "rdsspd %[ssp];"                                            \
     "cmp $1, %[ssp];"                                           \
     "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
-    ALTERNATIVE("mov $%c[shstk_base], %[val];",                 \
-                "mov $%c[shstk_base] + 8, %[val];",             \
+    ALTERNATIVE("mov %[shstk_base], %[val];",                   \
+                "mov %[shstk_base] + 8, %[val];",               \
                 X86_FEATURE_XEN_FRED)                           \
-    "and $%c[stack_mask], %[ssp];"                              \
+    "and %[stack_mask], %[ssp];"                                \
     "sub %[ssp], %[val];"                                       \
     "shr $3, %[val];"                                           \
     "cmp $255, %[val];" /* More than 255 entries?  Crash. */    \

