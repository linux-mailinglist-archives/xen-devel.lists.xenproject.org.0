Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D494A77438
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 07:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933465.1335408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzUbm-0003l4-05; Tue, 01 Apr 2025 05:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933465.1335408; Tue, 01 Apr 2025 05:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzUbl-0003iU-TF; Tue, 01 Apr 2025 05:56:21 +0000
Received: by outflank-mailman (input) for mailman id 933465;
 Tue, 01 Apr 2025 05:56:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzUbk-0003iM-8f
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 05:56:20 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 028b1c81-0ebe-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 07:56:09 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so46513075e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 22:56:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efe678sm187540035e9.20.2025.03.31.22.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 22:56:09 -0700 (PDT)
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
X-Inumbo-ID: 028b1c81-0ebe-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743486969; x=1744091769; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORKB6C1TyOKaOMr2m1txEulVAqu30jxMqshHNeRcyLM=;
        b=OSlo0nOdQmKVB+wzHSM6MNEduQRmk7MQuFqDaIzZA3fW9qv5E6jC+YdnQ0aBvZmvfQ
         WlTVsbr7L7+FN3NVvQcpZjxht0G0Gc6QEfr6ycUbciz7ePHSyBqvJttWXYZL1SXZKtCA
         KGkGYNaNa/D7ymMOyylUPxGsDq0WgabQMU17eZM/XIMnCYnzaRbX9YDi1h8VC/4Z1Jfu
         vm+NBTccA1qXB4G4Dfh85qbzXmNUPWJ027Sddj5ODAQH4hLk62P4T4f1/pxd598WK1PE
         jjeYYR3oOtM9xzqGr6cmoBqyaZYCxPbMyIm+81jdDvDm8d+1l9ypOL/IPn+JwvstPhPp
         GXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743486969; x=1744091769;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORKB6C1TyOKaOMr2m1txEulVAqu30jxMqshHNeRcyLM=;
        b=t084Y2TdQSuy3rjYCf1d3q/HSHROMo4S0MnAqvJyvSGhTtHzKnPuMViJNJnVaxPONE
         9O4ETgGtHu4VI0fDqba6bRnv9Wq1cD/Z+baGcN39lt+1uwMDUQhVBHTDuWzugxHqJp7H
         91jskhtzBj65mex/a9W5OET9vlod5KSxYasUo6zL+X0hE1ajjKrBpwgX7Kj3bWVAD4xK
         7CVfWkGOvF4pJs/mBxzzcmL7Y+gjZjNGhLrrrIcCJ9viaqzCVbBwaizNNb5JyWxbyHuo
         gN48nw13aUG1QLSuk3PBPSu0HLY9MICn/umPzcGrgNEu0RGiIexOxi7J9TcwX335n9M5
         E0zw==
X-Gm-Message-State: AOJu0Yy7sujvBhIuTxgRGmMaQXiHWgyvo+DGwqJmJsfXxTLKMGv1CQP0
	a9MdniFpTAjInZupnmkhBmSFezvPmmxOo9t3rbVP3hPTba4D0/Jtx6hSCOP90dwcsWvyRKHo6ZE
	=
X-Gm-Gg: ASbGncv6C0of73nKnZlmP9iq9CawnaNFXPxuxcFmuvZQvm+o+YCsIEHHypJfhm5rvyO
	CG5V+1q/YJQw5LedWhtXrpWaSW9IpgxeMyVDDf6oipQLpXwGi1lllgkWexKhw5qmpiXmbAar0tc
	lxrj9HvYJOAp5VpOaz+HZ4Brhsb1W8k5YBAb6rqQ5k1ZsUZ8R90Db/6u/DFhag+VdQ11RjvimKY
	MgKXC2LRnZ3gWAuD/gAMKXoaCSnaFEpsm9/SbhmwOnAB8ogSn9q87gZChT5GFK4NaMPHm+i2Stl
	nkcASvhpHJQ09XRCs3p211OlSlbU7PGCN9LgZJKR37CzBpnDA0fVzeXtZw4VX7oPFWqan/kxqwJ
	uRc84LXHOOlek+Bcc+OKOpON3zexo9w==
X-Google-Smtp-Source: AGHT+IFNZ6eN3wrYunI2Xqkz98fstK4Cj5eFqfWXKn1MZp5HSUFhyoRpjZyVz4kDZByI5QVcrq97kw==
X-Received: by 2002:a05:600c:1d0b:b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-43dbc6fa716mr102177695e9.31.1743486969374;
        Mon, 31 Mar 2025 22:56:09 -0700 (PDT)
Message-ID: <b0266c19-d0e5-4de7-b2fb-a50e2766168c@suse.com>
Date: Tue, 1 Apr 2025 07:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/boot: re-order .init.data contributions
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

Putting a few bytes ahead of page tables isn't very efficient; there's
a gap almost worth a full page. To avoid re-ordering of items in the
source file, simply put the few small items in sub-section 1, for them
to end up after the page tables, followed (in the final binary) by non-
page-aligned items from other CUs.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -136,6 +136,7 @@ multiboot2_header:
 .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
 
         .section .init.data, "aw", @progbits
+        .subsection 1 /* Put data here after the page tables (in x86_64.S). */
         .align 4
 
         .word   0

