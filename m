Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E840CD59BC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 11:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192017.1511383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXdEe-0002yj-2d; Mon, 22 Dec 2025 10:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192017.1511383; Mon, 22 Dec 2025 10:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXdEd-0002wW-Vm; Mon, 22 Dec 2025 10:33:51 +0000
Received: by outflank-mailman (input) for mailman id 1192017;
 Mon, 22 Dec 2025 10:33:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXdEc-0002wQ-M9
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 10:33:50 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b31585d0-df21-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 11:33:48 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso24452155e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 02:33:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea22674sm21900700f8f.10.2025.12.22.02.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 02:33:47 -0800 (PST)
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
X-Inumbo-ID: b31585d0-df21-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766399627; x=1767004427; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p5/knIgOEOu9E/fUoy13iVCzcZC0VgGVlLf1H4S1hZk=;
        b=Cpez3oyZtI+nYDO9rH98TiO9elMHLtEugOod1lPaT9gwhfy2e6s8KX6GLfODGBK9uG
         oudbrrTvX5+fLyljPXqOcTIfE0mH4GE/oiQkESPBzU0s1O2f+r7JLOxZV886NT88O4JZ
         BM+l3IwRhGsnheJ+o3ODjXbKqzBDLzvOjJO0WhTsOIjTlpyYu6CumpOggJapxIa4kRzW
         8y4UxwfEYtXxLmQIUjxRxBGcr/f82tLmdhyz0Z3jAzQNO5r6YvYVnHHn64ESV7cT3qTF
         W1e8QwEus/htMsg7sq/uYmqOaHbxTg+JLyiWBZyMtHjsKuUIOSZBofjLzScou9QGE5OQ
         1qCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399627; x=1767004427;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5/knIgOEOu9E/fUoy13iVCzcZC0VgGVlLf1H4S1hZk=;
        b=oppgcAvjZcAdCwyGyKs1kX/R1YBFzUqCiNpClmvoi0liu24DCcdtM/Mxt+86A9EZdA
         Vl12YOsWewLSiCu3h37ZcRpB51/Xz3QbkC7JfwsVhMZpbK9QpF7FD2aIdcCc+OXSyvGP
         B1Lcboz/ThIh3Q3ST6NmcFyWh7ZcvyUkXV8/3eBnRY/TD1s7dCVBQ7623I+Yr/6FpfEU
         Nr/uN90UuERZU5ogdCXvTmuOTvJYEZze3TVMWfDCL19v/sIApqZ1d5eL3LZ6QECnUyX6
         mLlE8Eo3Puqfcwj4hDFgEC28rw0y8ZSJeMqiaY6J0cLgz3roETK2LnGBg39lwfe/yWOo
         tMRQ==
X-Gm-Message-State: AOJu0YyfmARUO6l/ez2tH2XQ39flzvqzAFhSf8ysflMwNPdM12Gw5eGy
	OS9nGeWCTetpMIHidwMXG98zTLG/wl3CtZi+UG86NZC8MK5gecIJB8AHcBLLFYcR+5e8nTh3KC0
	Vp14=
X-Gm-Gg: AY/fxX7vE353Yf9JluKHi3M02oTxxFUJqSSqkrgPfY2mmFqfnJMxn4muzZlzdOgpB3/
	MFwfd0ChSiwkseCATNg7C/5LADNrri3iDQwGIikHlkaEIZ/wiaMN9hlL1nY9JtY8J2LsPC1ZTDs
	dtC1uH3JlcI+rxLWZOXZLjl21qZCNHKVzAiR57yFMjUOD67j++xqY4rbsJ2sUWfWVIYD/gZUiut
	Pqg+Osqbg66lMCHyi1XUY3+P+prrzf+ZiIeqEFKsyloDMt1Gk9hOIoxbyjxEURMdPEQZRSTsejF
	3fXy+EZ4xPiI5gGvxSd1VS9tVTjpau2TEOKGX2kCcivxbMmE3w3kx6B6WOC6bKxOY9yrHvBzCQN
	zF0doevjOnaxKX1CggDRhWKOe2c0rsjAjCik5am/ENz+rqqijF528hxqdWuEU9OH6rWhY0XXZr4
	BQLKMH5njJ3S6kXFRe6ke9NN10Ze5r55kvnVVCtJne8w3rBRMhApoRxRSGK2sXdnqbK9yXhL8JD
	E4=
X-Google-Smtp-Source: AGHT+IETn/3FS5zkysbMWW6Y6GFvYHXnEUETdITfoq6pRnlrg4J+6Z0hc9iC3O5gcuK6QLZenMemSQ==
X-Received: by 2002:a05:6000:400b:b0:430:f74d:6e9f with SMTP id ffacd0b85a97d-432448b7e8emr16999556f8f.14.1766399627441;
        Mon, 22 Dec 2025 02:33:47 -0800 (PST)
Message-ID: <e3af387a-dd8b-4d58-8356-777319c7a2bf@suse.com>
Date: Mon, 22 Dec 2025 11:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] memory: overlapping XENMAPSPACE_gmfn_range requests
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Overlapping requests may need processing backwards, or else the intended
effect wouldn't be achieved (and instead some pages would be moved more
than once).

With some adjustment there this also covers XEN_DMOP_relocate_memory,
where the potential issue was first noticed.

Fixes: a04811a315e0 ("mm: New XENMEM space, XENMAPSPACE_gmfn_range")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course an alternative would be to simply reject overlapping requests.
Then we should reject all overlaps though, I think. But since the code
change didn't end up overly intrusive, I thought I would go the "fix it"
route first.
---
v2: Adjust XEN_DMOP_relocate_memory handling for the working-backwards
    case.

--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -569,12 +569,16 @@ int dm_op(const struct dmop_args *op_arg
 
         rc = xenmem_add_to_physmap(d, &xatp, 0);
         if ( rc == 0 && data->size != xatp.size )
+        {
             rc = xatp.size;
+            xatp.idx += rc;
+            xatp.gpfn += rc;
+        }
         if ( rc > 0 )
         {
             data->size -= rc;
-            data->src_gfn += rc;
-            data->dst_gfn += rc;
+            data->src_gfn = xatp.idx;
+            data->dst_gfn = xatp.gpfn;
             const_op = false;
             rc = -ERESTART;
         }
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -849,7 +849,7 @@ int xenmem_add_to_physmap(struct domain
                           unsigned int start)
 {
     unsigned int done = 0;
-    long rc = 0;
+    long rc = 0, adjust = 1;
     union add_to_physmap_extra extra = {};
     struct page_info *pages[16];
 
@@ -884,8 +884,25 @@ int xenmem_add_to_physmap(struct domain
         return -EOVERFLOW;
     }
 
-    xatp->idx += start;
-    xatp->gpfn += start;
+    /*
+     * Overlapping ranges need processing backwards when destination is above
+     * source.
+     */
+    if ( xatp->gpfn > xatp->idx &&
+         unlikely(xatp->gpfn < xatp->idx + xatp->size) )
+    {
+        adjust = -1;
+
+        /* Both fields store "next item to process". */
+        xatp->idx += xatp->size - start - 1;
+        xatp->gpfn += xatp->size - start - 1;
+    }
+    else
+    {
+        xatp->idx += start;
+        xatp->gpfn += start;
+    }
+
     xatp->size -= start;
 
 #ifdef CONFIG_HAS_PASSTHROUGH
@@ -903,8 +920,8 @@ int xenmem_add_to_physmap(struct domain
         if ( rc < 0 )
             break;
 
-        xatp->idx++;
-        xatp->gpfn++;
+        xatp->idx += adjust;
+        xatp->gpfn += adjust;
 
         if ( extra.ppage )
             ++extra.ppage;
@@ -927,7 +944,10 @@ int xenmem_add_to_physmap(struct domain
 
         this_cpu(iommu_dont_flush_iotlb) = 0;
 
-        ret = iommu_iotlb_flush(d, _dfn(xatp->idx - done), done,
+        if ( likely(adjust > 0) )
+            adjust = done;
+
+        ret = iommu_iotlb_flush(d, _dfn(xatp->idx - adjust), done,
                                 IOMMU_FLUSHF_modified);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
@@ -941,13 +961,26 @@ int xenmem_add_to_physmap(struct domain
         for ( i = 0; i < done; ++i )
             put_page(pages[i]);
 
-        ret = iommu_iotlb_flush(d, _dfn(xatp->gpfn - done), done,
+        ret = iommu_iotlb_flush(d, _dfn(xatp->gpfn - adjust), done,
                                 IOMMU_FLUSHF_added | IOMMU_FLUSHF_modified);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
     }
 #endif
 
+    /*
+     * For internal callers (e.g. XEN_DMOP_relocate_memory handling) leave
+     * the GFNs from where to resume in *xatp (they're correct already when
+     * we worked forwards). These are the values not biased for a possible
+     * non-zero "start" that a subsequent invocation might use, so also do
+     * this updating only when incoming "start" was 0.
+     */
+    if ( rc > 0 && !start && unlikely(adjust < 0) )
+    {
+        xatp->idx -= xatp->size - rc - 1;
+        xatp->gpfn -= xatp->size - rc - 1;
+    }
+
     return rc;
 }
 

