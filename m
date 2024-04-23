Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976E48AE98B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710683.1110052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHBZ-0000VD-LD; Tue, 23 Apr 2024 14:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710683.1110052; Tue, 23 Apr 2024 14:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHBZ-0000Td-Fw; Tue, 23 Apr 2024 14:31:53 +0000
Received: by outflank-mailman (input) for mailman id 710683;
 Tue, 23 Apr 2024 14:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzHBY-00082U-AH
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:31:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39107441-017e-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 16:31:50 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4155819f710so47335975e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:31:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fl18-20020a05600c0b9200b0041ae0048b5dsm481577wmb.45.2024.04.23.07.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 07:31:50 -0700 (PDT)
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
X-Inumbo-ID: 39107441-017e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713882710; x=1714487510; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FaBzcTniCeLPDlfDE8HsE9EvmLilsBkel36WuSLRy1M=;
        b=EMgdggwI8sShHy3rL1SjS57lBu9RJhoiF6zZpgfo3MNB2EQM8co0hPqocMwRd+8hCS
         1QdlqXCix91hVVxfMyzuBB55YCakidcxtznjGvh6Cjs3z+wdlV5NgtPUXJzTex4n7paC
         Gp7Qrrfroli3T6XIUrzLxi9V8PxbW3a2hLHCyA4QTBHj4b021KwykLvc8p9Ls7HXXKph
         pktl2fJTMBLfLYvZwp8e8xOT+culbWfaNLyGczG/4yI0qr70vh8PANsPj6PkotSqduZ7
         vreo7kVpfxY/wK29D5nXubaHQD9sNj69n8anYxYRkVjecti4aIAM5VFoJAk1p0577xKV
         orEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882710; x=1714487510;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaBzcTniCeLPDlfDE8HsE9EvmLilsBkel36WuSLRy1M=;
        b=s84Tdh3kz60Rx3lgapDy21JuEvY0VI+A0mplcKFhsDDPgoMZ33zVpe7h53j1aggc6u
         I6E8UbdKjGr9zr634W3t969AYHcenkjidOeF3XStosEvB35fvxi/QqpXY10q1pWm2IiU
         z0VwxxNF7J6VDjCefamLWhEJe4OFVplsnrCxjE6hdkBRKSqxhjkwag9RxBWJX+PlVo44
         hsXEWd2S46VqJtC7fdAYHVkUDzQfR91STBBZ+ZcYLs3p6MTYOg5tAn5JjekA9N4KJjAw
         J/TKdf/7haHh+Hk/pUF7kntAvkbhFH2y+PD+UaLaZcazoEs4z9Ny9qf1vdMoDQnMUc4M
         MmAA==
X-Gm-Message-State: AOJu0YzsChhdwETx6nn4YeJ0/RYr3m+YdKUhG89FN5rOC3TCZNCBMI1/
	NRPUjhnCbEhNGoBZxXE7V4QPpRVs02r5zAEeYKk6VnnoCYk3jvEdaf3p0UDfXk0XDGOk/r0Jiu8
	=
X-Google-Smtp-Source: AGHT+IHRxjmp9hzeoObXZyflT9qVP9fTo2B7EerM/xNB+brJvEXoz5INBRgPhKuzsbsmi66KqGHClQ==
X-Received: by 2002:a05:600c:1c0f:b0:41a:c170:701f with SMTP id j15-20020a05600c1c0f00b0041ac170701fmr1633663wms.38.1713882710369;
        Tue, 23 Apr 2024 07:31:50 -0700 (PDT)
Message-ID: <296c3ecc-b04d-4734-a451-0d4f9ed312d4@suse.com>
Date: Tue, 23 Apr 2024 16:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] x86/P2M: write_p2m_entry() is HVM-only anyway
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
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
In-Reply-To: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The latest as of e2b2ff677958 ("x86/P2M: split out init/teardown
functions") the function is obviously unreachable for PV guests. Hence
the paging_mode_enabled(d) check is pointless.

Further host mode of a vCPU is always set, by virtue of
paging_vcpu_init() being part of vCPU creation. Hence the
paging_get_hostmode() check is pointless.

With that the v local variable is unnecessary too. Drop the "if()"
conditional and its corresponding "else".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have to confess that this if() has been puzzling me before.

--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -110,12 +110,7 @@ static int write_p2m_entry(struct p2m_do
                            unsigned int level)
 {
     struct domain *d = p2m->domain;
-    const struct vcpu *v = current;
 
-    if ( v->domain != d )
-        v = d->vcpu ? d->vcpu[0] : NULL;
-    if ( likely(v && paging_mode_enabled(d) && paging_get_hostmode(v)) ||
-         p2m_is_nestedp2m(p2m) )
     {
         unsigned int oflags;
         mfn_t omfn;
@@ -156,8 +151,6 @@ static int write_p2m_entry(struct p2m_do
               !perms_strictly_increased(oflags, l1e_get_flags(new))) )
             p2m_flush_nestedp2m(d);
     }
-    else
-        safe_write_pte(p, new);
 
     return 0;
 }


