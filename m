Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9D384B45E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 13:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676870.1053192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKDV-0007mO-Ba; Tue, 06 Feb 2024 12:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676870.1053192; Tue, 06 Feb 2024 12:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKDV-0007jr-8q; Tue, 06 Feb 2024 12:06:21 +0000
Received: by outflank-mailman (input) for mailman id 676870;
 Tue, 06 Feb 2024 12:06:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXKDU-0007ji-8o
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 12:06:20 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 223b6c45-c4e8-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 13:06:18 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33b1d7f736bso3124846f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 04:06:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w17-20020a5d6811000000b0033afcc899c1sm1949748wru.13.2024.02.06.04.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 04:06:17 -0800 (PST)
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
X-Inumbo-ID: 223b6c45-c4e8-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707221177; x=1707825977; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QO7nEsK9WdqbE5nV/bhuqZUjZzpr1P3VwDIWoHgSZCQ=;
        b=Kn1dNM82bq+hsNRFbX1G1ZQ7RIP12yWJyQO+5YEoStBpmehIKYARsWylpRBa41ykWU
         ddKjzJRrkdGVmbH6Syz8mN8/Q3zWFL4iIEdYqR6yXU2CiNFO/mmzZcU1JZvdUowO5HY6
         dlYyypkD+Yv8MBisAeNLFCDUp6Py31FjiAJkA1uAwzsS7WywtFq1eSyzM4oZ6kamlFDx
         tuQLw3YWliF82lauZtHwn3GnZHcBCYOKr/3H0CcJb5ySv0rTAX+buz4gWsUhEYmTPFE1
         MXhu1L0P+XJUcAFmvynVLQTD6EPS7gxEeMARARceryQ2J2QlRvgU4KHuzIbLZStLIc49
         tBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707221177; x=1707825977;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QO7nEsK9WdqbE5nV/bhuqZUjZzpr1P3VwDIWoHgSZCQ=;
        b=WsoPaDtsU8scjf2uf7atCSdXtjFSAHiOfeqtT2213GvtwrgcplFB0JvvAc3iMdjr/s
         r2O93QgZgnOPAOb5q/sd2iyHgIx2JuzRfZ0U7QK/JaWypk4cpzvqU4JTMXYmYOisBxse
         6+qPuCmWsQ/PRp7JRqgc0kFjJReoLqrGjXZHCXemYTHJap6WiHg9NDlgpzaCmJwf1zMM
         5n9DpJZEq9qS6fpebk0jm1GLlKAzVdQGdikS9uic/LUO/rPZt1qPz48CJh18Orx8ZRNK
         jn3hzZnNFiO7Znhatw496mtpv/UPENg+1m9wTJsc3MEuLLiEbIDpiBWWAnJrKOfSKjpF
         BLHg==
X-Gm-Message-State: AOJu0YywpP8NtA5N+VfZoogDQC2btcXj65eGRei7pZeO7jkiDlsJkvFQ
	Dv1c2Ls1ceFY63UW2i6y99gBLDjdkDAwX2M2dc7F5QpRnOYXVcCRYaxoeZUkIaituoLWhHKS/J8
	=
X-Google-Smtp-Source: AGHT+IG67+2F1w5AhrZaA4fpFAV+ZWoU2Vs6fDG+S1kuGcd0rGh/P7cZDMYFO0apRdPhV+z0oP7wNA==
X-Received: by 2002:a5d:4a85:0:b0:337:67e:a1ef with SMTP id o5-20020a5d4a85000000b00337067ea1efmr963429wrq.7.1707221177717;
        Tue, 06 Feb 2024 04:06:17 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX/IYOHB6h//hf8a8dFuYOpxN2aQdMNxe6Svu9tx0jXgqXhGElNRm1QQPlhVc9TAtxTiA+fw7S+6hDdDi4ezsfDR21JNUirAZzWQh6aK1Sg50YQN+cJGiOprlbMY3sx2i1+kujDR5yD
Message-ID: <c4c1d2b3-591e-403f-879b-bbb897f7ff25@suse.com>
Date: Tue, 6 Feb 2024 13:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Manuel Andreas <manuel.andreas@tum.de>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: tidy state on hvmemul_map_linear_addr()'s error path
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

While in the vast majority of cases failure of the function will not
be followed by re-invocation with the same emulation context, a few
very specific insns - involving multiple independent writes, e.g. ENTER
and PUSHA - exist where this can happen. Since failure of the function
only signals to the caller that it ought to try an MMIO write instead,
such failure also cannot be assumed to result in wholesale failure of
emulation of the current insn. Instead we have to maintain internal
state such that another invocation of the function with the same
emulation context remains possible. To achieve that we need to reset MFN
slots after putting page references on the error path.

Note that all of this affects debugging code only, in causing an
assertion to trigger (higher up in the function). There's otherwise no
misbehavior - such a "leftover" slot would simply be overwritten by new
contents in a release build.

Also extend the related unmap() assertion, to further check for MFN 0.

Fixes: 8cbd4fb0b7ea ("x86/hvm: implement hvmemul_write() using real mappings")
Reported.by: Manuel Andreas <manuel.andreas@tum.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While probably I could be convinced to omit the #ifndef, I'm really
considering to extend the one in hvmemul_unmap_linear_addr(), to
eliminate the zapping from release builds: Leaving MFN 0 in place is not
much better than leaving a (presently) guest-owned one there. And we
can't really put/leave INVALID_MFN there, as that would conflict with
other debug checking.

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -696,7 +696,12 @@ static void *hvmemul_map_linear_addr(
  out:
     /* Drop all held references. */
     while ( mfn-- > hvmemul_ctxt->mfn )
+    {
         put_page(mfn_to_page(*mfn));
+#ifndef NDEBUG /* Clean slot for a subsequent map()'s error checking. */
+        *mfn = _mfn(0);
+#endif
+    }
 
     return err;
 }
@@ -718,7 +723,7 @@ static void hvmemul_unmap_linear_addr(
 
     for ( i = 0; i < nr_frames; i++ )
     {
-        ASSERT(mfn_valid(*mfn));
+        ASSERT(mfn_x(*mfn) && mfn_valid(*mfn));
         paging_mark_dirty(currd, *mfn);
         put_page(mfn_to_page(*mfn));
 

