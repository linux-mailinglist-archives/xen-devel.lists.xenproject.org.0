Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMf8CapAA2ro2AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:00:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5966523281
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306914.1578651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMobI-0002tT-5s; Tue, 12 May 2026 15:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306914.1578651; Tue, 12 May 2026 15:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMobI-0002qp-2q; Tue, 12 May 2026 15:00:48 +0000
Received: by outflank-mailman (input) for mailman id 1306914;
 Tue, 12 May 2026 15:00:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMobF-0002qd-QA
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:00:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMobF-004Fsk-70
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:00:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034097-bab6-0a2a0a5309dd-0a2a4504baf4-36
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:00:45 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a03409d-1dec-0a2a45040019-d155dd2dc5a2-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:00:45 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-45562c41ec7so2406316f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:00:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6be40sm34620921f8f.12.2026.05.12.08.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:00:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778598044; x=1779202844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+4wWtJqQjz6zQQRwVYkyfsmuZHB9+q0gyFAm93ZpUBw=;
        b=M9CWg80+qkur906rO/i8XQBcF/l54mFXNXnXUuB7QBpdgIYfqHRADqXPxj6epez5aT
         tK6khm1NBuUxLDP5zcjVHSBpDUqyt+Sfkg7JRoDyZTdJiPEN5859daJtyqbsMv+7tguD
         75i9XJFSguC6PwJo+nKjclinDFTSk/xcByjzwINIIQxf36l87+dy+2UQNm+zztJIADmd
         b2m7I7QHncAY86LaypPESi3fHmKvaD1MAvCTPrQqM0WKyOMquakIOQbQZzhX5bKNLoQt
         PBGetPePVC0FmGet2dXayFemhIBoVwbXgjy+LgVyANp4OfHKumlbbF75xnPg+PCUle/O
         3k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598044; x=1779202844;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4wWtJqQjz6zQQRwVYkyfsmuZHB9+q0gyFAm93ZpUBw=;
        b=o7ErCHNxQMXZb4wNNiby4JuxJZGZWx0m2mVVq4ToqGBc4Rzjk0yX6vVHeFZPL/KrIb
         ENQ0ugbFljD2CpSBiitMqEXMhtis4tYsENAh+frwK46MMYnx7ITjTM0QHosl2w8Kf4xa
         3zQHlLAm3+ETk9qkeXLn7MQpou+GDpNdlCnYyDD0sEsNyMfQ27dDJ72bARpq1Nf/UurV
         IBmjL1OfoUv6bEYCFXDH68q5wzOkiZqA3dM3pZtPbF8x7BEPE0sg4js+ukig2JMkO+Oz
         xmwWnkpeI6C1/16k2m6w2KUzbKvwOO0jWeYFcaQzqUpLWEjKtcaPVV77VmzntSnOyEnq
         LioA==
X-Gm-Message-State: AOJu0YxRetPNfHKXwqoxTW7arBiJf+Ix14GelMoKhmEW1h0AGqjQGevb
	QdeoHmNS7+Z8cdNzMBPQeR7YpF0hxK+n0tAa+Bq2Mz9Az3i22FDZl3iLvlrqymSo2NEDjgr4v6H
	OqoU=
X-Gm-Gg: Acq92OHKBZjGVwAZ+dU8ccIYAJczruylgYq/aDL3vQC2zO6KXAhcQ3eltfwgFBzruTQ
	5K7aerau3rGMsE/sTduIoDmEgBdbor/nxSsczcQmxo0tSX94kBYxhDQSdwL5OteqmwR2YqyJt9k
	g/yBLUs5xe8MGrOHC0aUoq6hrpKurp8QOOLZqfU26VooKQWXQGij7IHa4i46yilvXLbqFJdBgzw
	v6KWG2wDpQ9bY1UsIL9Eo7e5L/njeLrzbrveuIw9lyCx9nqJsjihleKlGH1WInfFC7FLjXVoutD
	TNqGGLFMh+vLwVFZV8ozPcxrV8NsZYliVKmkel4REsvWnOmCGXVsqfpVaTaB5OAQGHNDWm1zvS7
	LzE+KPPmiT3DEOMgON8MEnKEd5scFMWyFF6YeNe5hW6sKgcJSgbbFHDVEQHrL656dVeknoCcMea
	3vuU7tL3rLyMiOqPu9BOu5W+/8x6Kfk+ir01ZlOXRyCFTOR7XpBUiTq561ConJA3CU644iDR+7O
	WUMtZaJSbS4bvQ=
X-Received: by 2002:a5d:5f86:0:b0:43d:77a8:3baf with SMTP id ffacd0b85a97d-45b15682310mr5149035f8f.32.1778598044522;
        Tue, 12 May 2026 08:00:44 -0700 (PDT)
Message-ID: <4bcd76e9-1bd5-4a2c-8d75-7d29b9dfa31f@suse.com>
Date: Tue, 12 May 2026 17:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/5] tools/xen-hvmctx: shorten various format strings a little
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
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
In-Reply-To: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1778598045-433673FF-6E94AD80/0/0
X-purgate-type: clean
X-purgate-size: 6655
X-Rspamd-Queue-Id: A5966523281
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

%4.4x and alike format specifiers can be expressed shorter as %04x or, as
e.g. dump_ioapic() has it, %.4x.

In dump_fpu()'s XMM register dumping, also move away from showing bogus
xmm03 and alike. The proper register name is xmm3 for that particular
example.

Also strip trailing whitespace from lines touched.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/misc/xen-hvmctx.c
+++ b/tools/misc/xen-hvmctx.c
@@ -107,26 +107,26 @@ static void dump_fpu(void *p)
     struct fpu_regs *r = p;
     int i;
 
-    printf("    FPU:    fcw 0x%4.4x fsw 0x%4.4x\n"  
-           "            ftw 0x%2.2x (0x%2.2x) fop 0x%4.4x\n"
-           "          fpuip 0x%16.16"PRIx64" fpudp 0x%16.16"PRIx64"\n"
-           "          mxcsr 0x%8.8lx mask 0x%8.8lx\n",
+    printf("    FPU:    fcw 0x%04x fsw 0x%04x\n"
+           "            ftw 0x%02x (0x%02x) fop 0x%04x\n"
+           "          fpuip 0x%016"PRIx64" fpudp 0x%016"PRIx64"\n"
+           "          mxcsr 0x%08lx mask 0x%08lx\n",
            (unsigned)r->fcw, (unsigned)r->fsw, 
            (unsigned)r->ftw, (unsigned)r->res0, (unsigned)r->fop, 
            r->fpuip, r->fpudp, 
            (unsigned long)r->mxcsr, (unsigned long)r->mxcsr_mask);
 
     for ( i = 0 ; i < 8 ; i++ ) 
-        printf("            mm%i 0x%4.4x%16.16"PRIx64" (0x%4.4x%4.4x%4.4x)\n",
+        printf("            mm%i 0x%04x%016"PRIx64" (0x%04x%04x%04x)\n",
                i, r->mm[i].hi, r->mm[i].lo,
                r->mm[i].pad[2], r->mm[i].pad[1], r->mm[i].pad[0]);
 
     for ( i = 0 ; i < 16 ; i++ ) 
-        printf("          xmm%2.2i 0x%16.16"PRIx64"%16.16"PRIx64"\n",
+        printf("          xmm%-2i 0x%016"PRIx64"%016"PRIx64"\n",
                i, r->xmm[i].hi, r->xmm[i].lo);
     
     for ( i = 0 ; i < 6 ; i++ ) 
-        printf("               (0x%16.16"PRIx64"%16.16"PRIx64")\n",
+        printf("               (0x%016"PRIx64"%016"PRIx64")\n",
                r->res1[2*i+1], r->res1[2*i]);
 }
 
@@ -134,20 +134,20 @@ static void dump_cpu(void)
 {
     HVM_SAVE_TYPE(CPU) c;
     READ(c);
-    printf("    CPU:    rax 0x%16.16llx     rbx 0x%16.16llx\n"
-           "            rcx 0x%16.16llx     rdx 0x%16.16llx\n"
-           "            rbp 0x%16.16llx     rsi 0x%16.16llx\n"
-           "            rdi 0x%16.16llx     rsp 0x%16.16llx\n"
-           "             r8 0x%16.16llx      r9 0x%16.16llx\n"
-           "            r10 0x%16.16llx     r11 0x%16.16llx\n"
-           "            r12 0x%16.16llx     r13 0x%16.16llx\n"
-           "            r14 0x%16.16llx     r15 0x%16.16llx\n"
-           "            rip 0x%16.16llx  rflags 0x%16.16llx\n"
-           "            cr0 0x%16.16llx     cr2 0x%16.16llx\n"
-           "            cr3 0x%16.16llx     cr4 0x%16.16llx\n"
-           "            dr0 0x%16.16llx     dr1 0x%16.16llx\n"
-           "            dr2 0x%16.16llx     dr3 0x%16.16llx\n"
-           "            dr6 0x%16.16llx     dr7 0x%16.16llx\n"
+    printf("    CPU:    rax 0x%016llx     rbx 0x%016llx\n"
+           "            rcx 0x%016llx     rdx 0x%016llx\n"
+           "            rbp 0x%016llx     rsi 0x%016llx\n"
+           "            rdi 0x%016llx     rsp 0x%016llx\n"
+           "             r8 0x%016llx      r9 0x%016llx\n"
+           "            r10 0x%016llx     r11 0x%016llx\n"
+           "            r12 0x%016llx     r13 0x%016llx\n"
+           "            r14 0x%016llx     r15 0x%016llx\n"
+           "            rip 0x%016llx  rflags 0x%016llx\n"
+           "            cr0 0x%016llx     cr2 0x%016llx\n"
+           "            cr3 0x%016llx     cr4 0x%016llx\n"
+           "            dr0 0x%016llx     dr1 0x%016llx\n"
+           "            dr2 0x%016llx     dr3 0x%016llx\n"
+           "            dr6 0x%016llx     dr7 0x%016llx\n"
            "             cs %#6.4" PRIx32 " (%#18.8" PRIx64 " + %#10.8" PRIx32 " / %#7.4" PRIx32 ")\n"
            "             es %#6.4" PRIx32 " (%#18.8" PRIx64 " + %#10.8" PRIx32 " / %#7.4" PRIx32 ")\n"
            "             ds %#6.4" PRIx32 " (%#18.8" PRIx64 " + %#10.8" PRIx32 " / %#7.4" PRIx32 ")\n"
@@ -158,12 +158,12 @@ static void dump_cpu(void)
            "           ldtr %#6.4" PRIx32 " (%#18.8" PRIx64 " + %#10.4" PRIx32 " / %#7.4" PRIx32 ")\n"
            "           idtr        (%#18.8" PRIx64 " + %#10.4" PRIx32 ")\n"
            "           gdtr        (%#18.8" PRIx64 " + %#10.4" PRIx32 ")\n"
-           "    sysenter cs 0x%8.8llx  eip 0x%16.16llx  esp 0x%16.16llx\n"
+           "    sysenter cs 0x%08llx  eip 0x%016llx  esp 0x%016llx\n"
            "      shadow gs %#18.16" PRIx64 "   efer %#18.8" PRIx64 "\n"
            "          lstar %#18.16" PRIx64 "  cstar %#18.16" PRIx64 "\n"
            "           star %#18.16" PRIx64 " sfmask %#18.8" PRIx64 "\n"
-           "            tsc 0x%16.16llx\n"
-           "          event 0x%8.8lx error 0x%8.8lx\n",
+           "            tsc 0x%016llx\n"
+           "          event 0x%08lx error 0x%08lx\n",
            (unsigned long long) c.rax, (unsigned long long) c.rbx,
            (unsigned long long) c.rcx, (unsigned long long) c.rdx,
            (unsigned long long) c.rbp, (unsigned long long) c.rsi,
@@ -260,7 +260,7 @@ static void dump_pci_irq(void)
 {
     HVM_SAVE_TYPE(PCI_IRQ) i;
     READ(i);
-    printf("    PCI IRQs: 0x%16.16llx%16.16llx\n", 
+    printf("    PCI IRQs: 0x%016llx%016llx\n",
            (unsigned long long) i.pad[0], (unsigned long long) i.pad[1]);
 }
 
@@ -268,7 +268,7 @@ static void dump_isa_irq(void)
 {
     HVM_SAVE_TYPE(ISA_IRQ) i;
     READ(i);
-    printf("    ISA IRQs: 0x%4.4llx\n", 
+    printf("    ISA IRQs: 0x%04llx\n",
            (unsigned long long) i.pad[0]);
 }
 
@@ -305,10 +305,10 @@ static void dump_rtc(void)
 {
     HVM_SAVE_TYPE(RTC) r;
     READ(r);
-    printf("    RTC: regs 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x\n",
+    printf("    RTC: regs 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\n",
            r.cmos_data[0], r.cmos_data[1], r.cmos_data[2], r.cmos_data[3], 
            r.cmos_data[4], r.cmos_data[5], r.cmos_data[6], r.cmos_data[7]);
-    printf("              0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x, index 0x%2.2x\n",
+    printf("              0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x, index 0x%02x\n",
            r.cmos_data[8], r.cmos_data[9], r.cmos_data[10], r.cmos_data[11], 
            r.cmos_data[12], r.cmos_data[13], r.cmos_index);
     printf("         century 0x%02x  offset %"PRId64"\n", r.century, r.rtc_offset);


