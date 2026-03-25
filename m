Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDKPEAPiw2lvugQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:24:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A297325ACF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:24:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262330.1554883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ODP-0001wP-8h; Wed, 25 Mar 2026 13:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262330.1554883; Wed, 25 Mar 2026 13:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ODP-0001uH-5o; Wed, 25 Mar 2026 13:24:07 +0000
Received: by outflank-mailman (input) for mailman id 1262330;
 Wed, 25 Mar 2026 13:24:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5ODN-0001u9-8h
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:24:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5ODM-00ES7v-Kj
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:24:04 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3e1f4-bab6-0a2a0a5309dd-0a2a4506d9ba-0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:24:04 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3e1f4-3034-0a2a45060019-d1558036f039-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:24:04 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso18539075e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 06:24:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487172f909asm29347635e9.6.2026.03.25.06.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 06:24:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1774445044; x=1775049844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4z2f6acb15Hu47Bm0pjYeGaxQ7vqXYq12+Jv1/7oZr4=;
        b=bzayj5fA/Y9qLJkhj7Eg1DtmI5MLZPGOusszw2Fw7X/d2g4VBTDD/yu6YBtaglW1HG
         1mW8fzP7OgHfWOiYaFjnWIKwU+ZFYbt1GYJiGZkrh7MTI2M4TM8WlGycGnpjzjyarJTx
         N6dZbdsk/a9XkdyGLsoRB/l1imSK/mRuq6bBVQLHV5NabLBO+lbezH30YxVVPCVlOKT3
         pv82enE9PjKnXRiO48ISsin2XMG2iT9pMBk+zbPuUbhGZGxgRwSSeJC26QLErmocpD5Z
         SuQ2MjyYZ0fS9350+Al/rM1yXHGT3vLvGntmzXo7OvmzqZrDxkLKjJHgLrqJp2k7VXFq
         KJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445044; x=1775049844;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z2f6acb15Hu47Bm0pjYeGaxQ7vqXYq12+Jv1/7oZr4=;
        b=EAVs3oSHjnsxlb/UBqVvIRa4XFhcqXQoKExbblgAusMK2GAQ/tHHJgNVr+OYSf96dx
         0hP5oHKReSDJUS/gk5Ck2fMTZRz6q7MLf+F0O2XYy2nvpA542I0lkGJ3DtcjVEMpvCvM
         2cYDjBzo7qPGdYrdYVQGpFlOsktNkpSNf0VBUuHIagb/cuGEORbg1wgRg9B6XEwZGwEq
         1xCmeGs7ES8YhieLD2JvYtQednCqyQUr5rWx7S0YvaobbRXPgodv6GkSYPVr7IUS6Xu1
         EmLHp7RmVBHkm/RlzYKBYX5b+E6SZsgnqDJYw3zsSwWOGuYta2ThYQEfwZMPR8Rw2IR/
         K8gQ==
X-Gm-Message-State: AOJu0YwrJEyyA6FXNvM/rMDwBLdkx3K/bNJUp3fRZPzo5ZNG4QdwzZlE
	0OtlBdj3/Po7mwFco+2MZq4/wLnzACpaCCz3cP7C9pgDa2HE0jyQrk/6vl0b0YuSeRxx6xF7pfh
	sdJyjjg==
X-Gm-Gg: ATEYQzxAUfJUBE6Oh+GJFFw/RRQZaJ6jQDaO8mudRUaTTH56z3Ws/hSB64VO9uO3qgC
	y0eF8TTgyhIcHSDhAHvd1n/9u0BhN806rJDk7CQdEaOinTxdz/LzuRKrMsVEMCMzKH82BztnQnG
	Mx6of3/838MXe6ICDyoOasXvbTqvIG2AtHhU0QqJ7tiLmvv7dge+G6FHbozEGU/fF3eAzHIbBzh
	6dGf8Y4wrcZdbbt9tLOE9DitcijW45ZA7t22T6P9rHqoj5ZmQPhbSbTTeE+lkBTPB330oieSyLd
	BS98fLeWknVdHOk0wt/F5MdJWOaMSc3SMHZU8+5YAPAPEj27y+L1s3p+wTJmwdJhx+v++3vIp8D
	JSM5qN9ziKSdWfiTWpoHhLUVOrUuyZEwxHiKvYvsl1o1x1Ec5p8usARLrHtb3G7bWEX7KUpgOV+
	BfDyA74iLmG1zStl5ikADyyVX5jMJNNd4KziIxt0MAlVacmSVNw3K8Vv3pHEkVEvWXedpOAp4HL
	ABrVCqYsTWkyhTqvfPLxIVJmw==
X-Received: by 2002:a05:600c:6287:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-48715fd545bmr54798785e9.10.1774445043897;
        Wed, 25 Mar 2026 06:24:03 -0700 (PDT)
Message-ID: <f0cd81c0-81d2-4273-a2c8-736ce976670a@suse.com>
Date: Wed, 25 Mar 2026 14:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] EFI: avoid OOB config file reads
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
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
In-Reply-To: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1774445044-82B961C2-9087AD82/0/0
X-purgate-type: clean
X-purgate-size: 3185
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
X-Rspamd-Queue-Id: 9A297325ACF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The message emitted by pre_parse() pretty clearly states the original
intention. Yet what it said wasn't done, and would have been unfriendly to
the user. Hence accesses past the allocated buffer were possible. Insert a
terminating NUL immediately past the data read, to then drop the no longer
applicable message.

NB: The iscntrl() check of just the last byte is more strict than what
pre_parse() would accept without issuing its prior message, yet I'd like
to keep the new logic reasonably simple. Config files shouldn't be huge,
and we shouldn't be _that_ short of memory (or we'd fail elsewhere pretty
soon).

Fixes: bf6501a62e80 ("x86-64: EFI boot code")
Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Is the efi_arch_flush_dcache_area() really needed for config files? Else
it could be in an "else" to the "if()" added to read_file(). And then,
how is it guaranteed that data from the area isn't brought back into the
cache (perhaps speculatively)?

In read_section() we could further leverage section alignment padding (if
present, and if filled with zeroes), to limit when to allocate and copy.
Thoughts?
---
v2: Entirely different approach.

--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -833,8 +833,9 @@ static bool __init read_file(EFI_FILE_HA
     what = L"Allocation";
     file->addr = min(1UL << (32 + PAGE_SHIFT),
                      HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
+    /* For config files allocate an extra byte to put a NUL there. */
     ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
-                                PFN_UP(size), &file->addr);
+                                PFN_UP(size + (file == &cfg)), &file->addr);
     if ( EFI_ERROR(ret) )
         goto fail;
 
@@ -853,6 +854,9 @@ static bool __init read_file(EFI_FILE_HA
 
     efi_arch_flush_dcache_area(file->ptr, file->size);
 
+    if ( file == &cfg )
+        file->str[file->size] = 0;
+
     return true;
 
  fail:
@@ -878,6 +882,23 @@ static bool __init read_section(const EF
 
     file->ptr = ptr;
 
+    /* For cfg file, if necessary allocate space to put an extra NUL there. */
+    if ( file == &cfg && file->size && !iscntrl(file->str[file->size - 1]) )
+    {
+        EFI_PHYSICAL_ADDRESS addr;
+        EFI_STATUS ret = efi_bs->AllocatePages(AllocateMaxAddress,
+                                               EfiLoaderData,
+                                               PFN_UP(file->size + 1), &addr);
+
+        if ( EFI_ERROR(ret) )
+            return false;
+
+        memcpy((void *)addr, ptr, file->size);
+        file->addr = addr;
+        file->need_to_free = true;
+        file->str[file->size] = 0;
+    }
+
     handle_file_info(name, file, options);
 
     return true;
@@ -906,9 +927,6 @@ static void __init pre_parse(const struc
         else
             start = 0;
     }
-    if ( file->size && end[-1] )
-         PrintStr(L"No newline at end of config file,"
-                   " last line will be ignored.\r\n");
 }
 
 static void __init init_secure_boot_mode(void)


