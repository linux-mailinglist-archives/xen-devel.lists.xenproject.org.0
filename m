Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D9187FED1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 14:27:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695376.1085071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZUL-0007cm-0g; Tue, 19 Mar 2024 13:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695376.1085071; Tue, 19 Mar 2024 13:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZUK-0007Zc-UA; Tue, 19 Mar 2024 13:26:44 +0000
Received: by outflank-mailman (input) for mailman id 695376;
 Tue, 19 Mar 2024 13:26:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmZUJ-0007Z8-EF
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 13:26:43 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 533be6d1-e5f4-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 14:26:42 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a46ba938de0so329424766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 06:26:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bw9-20020a170906c1c900b00a4668970f74sm6127780ejb.108.2024.03.19.06.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 06:26:42 -0700 (PDT)
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
X-Inumbo-ID: 533be6d1-e5f4-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710854802; x=1711459602; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy3d7UI70UHqP4Vsxkko+WvDNZPB+pMg565jLu/AARc=;
        b=VUPaCrgbUn7YJD/qtiCwlZ/xWNCvoVmm9V02m66Hnj1Y6VCeHTA4eLsUru54uXona2
         yRKmU1J2cBldPH9v/8kxuUfAqJipBkv742dayKX/zQEopAgSNm7UJzLmtAfuZfH+vVq9
         CTwgFazE4W3kqVE3zy4xy290U+NyII5Z+cxfDc6zgH1Boyci+VYt2FjeNwkdSbYppp1z
         3ZQqQ070cALs+WKlDiCrLd6NzvPX6IS81WwIc3EZtAiht6liWA6CeENNVvUCzlRWQY/S
         amjZpV9wB68VTRmObZZuWgEE1V9to48zu9evkda/0SGk4evqs5Mxiy4x9HOrCs4PcQJD
         YLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854802; x=1711459602;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qy3d7UI70UHqP4Vsxkko+WvDNZPB+pMg565jLu/AARc=;
        b=busmMZgT+qw57Nnzu0EKFPhX9cry+CGfQjZAw/Urr6Mmpw94SLarN+0cCL4pWCrRVu
         GVB1keonLwLblPdB+ZSxaCLD2V8htUofPGiw1DSVTHZYX7f0hIm3EOaHNbyPiPMXALmZ
         U8R/Do9jNV+oZGHLT135jGZZ9qtUFRbbOUDKdCIGD0WCUd1/dfL/1NGDSKrT4yYjyccJ
         xg2RObxBT2G5r83mwNr66clr6asOKiBsTJOh2onVjMkLG/oi3WPmrRz5GrKCdgdLjXQr
         Zr8HSRs7fTFI0f5Mwn3OYCQGj+nYgG3qjWIPFK+kzfq/noKDomH9yOxggCb/sx0pCJCt
         gqxA==
X-Gm-Message-State: AOJu0YycdlJA9uVkxgOofG+aswsVuDtuu01CBiUk9BRYnGx9sz9LsRJS
	m5pldHxnaZzb4mKBJ+c1lKWMWKbh+f/pTv9mEk/PFNuCPFtlwTWQRo3hGuDewv+x02FLYeUOEls
	=
X-Google-Smtp-Source: AGHT+IF1OTh5iqBwuxtfrZEgug4XurD13QaPTDgc/hc9BmwOfTN9W1GX1rY1fWcNNu4erS74SO8r1A==
X-Received: by 2002:a17:907:940c:b0:a46:ea52:3ed2 with SMTP id dk12-20020a170907940c00b00a46ea523ed2mr311685ejc.44.1710854802208;
        Tue, 19 Mar 2024 06:26:42 -0700 (PDT)
Message-ID: <227fbeda-1690-4158-8404-53b4236c0235@suse.com>
Date: Tue, 19 Mar 2024 14:26:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] avoid UB in guest handle arithmetic
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

At least XENMEM_memory_exchange can have huge values passed in the
nr_extents and nr_exchanged fields. Adding such values to pointers can
overflow, resulting in UB. Cast respective pointers to "unsigned long"
while at the same time making the necessary multiplication explicit.
Remaining arithmetic is, despite there possibly being mathematical
overflow, okay as per the C99 spec: "A computation involving unsigned
operands can never overflow, because a result that cannot be represented
by the resulting unsigned integer type is reduced modulo the number that
is one greater than the largest value that can be represented by the
resulting type." The overflow that we need to guard against is checked
for in array_access_ok().

Note that in / down from array_access_ok() the address value is only
ever cast to "unsigned long" anyway, which is why in the invocation from
guest_handle_subrange_okay() the value doesn't need casting back to
pointer type.

In compat grant table code change two guest_handle_add_offset() to avoid
passing in negative offsets.

Since {,__}clear_guest_offset() need touching anyway, also deal with
another (latent) issue there: They were losing the handle type, i.e. the
size of the individual objects accessed. Luckily the few users we
presently have all pass char or uint8 handles.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -43,7 +43,7 @@
      array_access_ok((hnd).p, (nr), sizeof(*(hnd).p)))
 #define guest_handle_subrange_okay(hnd, first, last)    \
     (paging_mode_external(current->domain) ||           \
-     array_access_ok((hnd).p + (first),                 \
+     array_access_ok((unsigned long)(hnd).p + (first) * sizeof(*(hnd).p), \
                      (last)-(first)+1,                  \
                      sizeof(*(hnd).p)))
 
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -232,7 +232,7 @@ int (compat_grant_table_op)(
                 cnt_uop = guest_handle_cast(xfer, void);
                 while ( n-- )
                 {
-                    guest_handle_add_offset(xfer, -1);
+                    guest_handle_subtract_offset(xfer, 1);
                     if ( __copy_field_to_guest(xfer, nat.xfer + n, status) )
                         rc = -EFAULT;
                 }
@@ -277,7 +277,7 @@ int (compat_grant_table_op)(
                 cnt_uop = guest_handle_cast(copy, void);
                 while ( n-- )
                 {
-                    guest_handle_add_offset(copy, -1);
+                    guest_handle_subtract_offset(copy, 1);
                     if ( __copy_field_to_guest(copy, nat.copy + n, status) )
                         rc = -EFAULT;
                 }
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -15,8 +15,10 @@
 #define guest_handle_is_null(hnd)        ((hnd).p == NULL)
 
 /* Offset the given guest handle into the array it refers to. */
-#define guest_handle_add_offset(hnd, nr) ((hnd).p += (nr))
-#define guest_handle_subtract_offset(hnd, nr) ((hnd).p -= (nr))
+#define guest_handle_add_offset(hnd, nr) ((hnd).p = \
+    (typeof((hnd).p))((unsigned long)(hnd).p + (nr) * sizeof(*(hnd).p)))
+#define guest_handle_subtract_offset(hnd, nr) ((hnd).p = \
+    (typeof((hnd).p))((unsigned long)(hnd).p - (nr) * sizeof(*(hnd).p)))
 
 /*
  * Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARAM)
@@ -59,20 +61,22 @@
  */
 #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
     const typeof(*(ptr)) *_s = (ptr);                   \
-    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    unsigned long d_ = (unsigned long)(hnd).p;          \
     /* Check that the handle is not for a const type */ \
     void *__maybe_unused _t = (hnd).p;                  \
     (void)((hnd).p == _s);                              \
-    raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
+    raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
+                      _s, (nr) * sizeof(*_s));          \
 })
 
 /*
  * Clear an array of objects in guest context via a guest handle,
  * specifying an offset into the guest array.
  */
-#define clear_guest_offset(hnd, off, nr) ({    \
-    void *_d = (hnd).p;                        \
-    raw_clear_guest(_d+(off), nr);             \
+#define clear_guest_offset(hnd, off, nr) ({             \
+    unsigned long d_ = (unsigned long)(hnd).p;          \
+    raw_clear_guest((void *)(d_ + (off) * sizeof(*(hnd).p)), \
+                    (nr) * sizeof(*(hnd).p));           \
 })
 
 /*
@@ -80,9 +84,11 @@
  * specifying an offset into the guest array.
  */
 #define copy_from_guest_offset(ptr, hnd, off, nr) ({    \
-    const typeof(*(ptr)) *_s = (hnd).p;                 \
+    unsigned long s_ = (unsigned long)(hnd).p;          \
     typeof(*(ptr)) *_d = (ptr);                         \
-    raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
+    raw_copy_from_guest(_d,                             \
+                        (const void *)(s_ + (off) * sizeof(*_d)), \
+                        (nr) * sizeof(*_d));            \
 })
 
 /* Copy sub-field of a structure to guest context via a guest handle. */
@@ -117,22 +123,26 @@
 
 #define __copy_to_guest_offset(hnd, off, ptr, nr) ({        \
     const typeof(*(ptr)) *_s = (ptr);                       \
-    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;              \
+    unsigned long d_ = (unsigned long)(hnd).p;              \
     /* Check that the handle is not for a const type */     \
     void *__maybe_unused _t = (hnd).p;                      \
     (void)((hnd).p == _s);                                  \
-    __raw_copy_to_guest(_d + (off), _s, sizeof(*_s) * (nr));\
+    __raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
+                      _s, (nr) * sizeof(*_s));              \
 })
 
-#define __clear_guest_offset(hnd, off, nr) ({    \
-    void *_d = (hnd).p;                          \
-    __raw_clear_guest(_d + (off), nr);           \
+#define __clear_guest_offset(hnd, off, nr) ({               \
+    unsigned long d_ = (unsigned long)(hnd).p;              \
+    __raw_clear_guest((void *)(d_ + (off) * sizeof(*(hnd).p)), \
+                      (nr) * sizeof(*(hnd).p));             \
 })
 
 #define __copy_from_guest_offset(ptr, hnd, off, nr) ({          \
-    const typeof(*(ptr)) *_s = (hnd).p;                         \
+    unsigned long s_ = (unsigned long)(hnd).p;                  \
     typeof(*(ptr)) *_d = (ptr);                                 \
-    __raw_copy_from_guest(_d, _s + (off), sizeof (*_d) * (nr)); \
+    __raw_copy_from_guest(_d,                                   \
+                          (const void *)(s_ + (off) * sizeof(*_d)), \
+                          (nr) * sizeof(*_d));                  \
 })
 
 #define __copy_field_to_guest(hnd, ptr, field) ({       \

