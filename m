Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC7782DB72
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667430.1038683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO7o-0003PI-0I; Mon, 15 Jan 2024 14:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667430.1038683; Mon, 15 Jan 2024 14:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO7n-0003My-TJ; Mon, 15 Jan 2024 14:39:39 +0000
Received: by outflank-mailman (input) for mailman id 667430;
 Mon, 15 Jan 2024 14:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPO7m-0003Mo-6x
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 14:39:38 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e79542d7-b3b3-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 15:39:36 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-337ae00f39dso510722f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 06:39:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j27-20020adfb31b000000b00336e32338f3sm12166221wrd.70.2024.01.15.06.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 06:39:35 -0800 (PST)
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
X-Inumbo-ID: e79542d7-b3b3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705329576; x=1705934376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hWQFo/wX+wC8FEgbkzgKbNXtICtACu8yENHkBqHbYaY=;
        b=RG+jPdTDWqwqqnkMJZt+UMer7MEMUqlhtxYGI+bt1IWXdA4xZzBx4IJ1xvzzQiOtwv
         v+u5HEIjtTy+7RknwalUKn1UoIG1pFU3HlvHP3jyjFWpk5nZOn2L82ryIXPkwTOJ3UWQ
         RC2HVfjCHZkgG08DxdkI8l8mPac5Cmsao3qhG4euvEiqZ9meglCPnNXNye3O2FisQlWE
         E4tzrt4Lj74cFF+/SHyfHEc78PfRKSh7amCS0QgagGT3jfjty6b0KVZ/GYBdeFdlUtY7
         o3a0wahwa5CWVF5xhGWzzqJzTAfPyjnYqcXmD0QcaBldaledwT4Md00PJB16hW1pFZzD
         iYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329576; x=1705934376;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWQFo/wX+wC8FEgbkzgKbNXtICtACu8yENHkBqHbYaY=;
        b=DhjJE9vgM1FHcVqBBvmqi24iqoVunF1JJN7Y2TMQXtiAYpcQqCb08v34F8nJQxK9Dg
         kdBAcjduRrkKPjpeX5CB2uC5pghvsntyTDkLXYzSABMgob/ZV1pTn/u+XS265kLYFhVU
         gJnzrCnsLVedmg0fQebfBxdGpaTLolppcucoARZ9tBYbTGFZdPiCiGPYJwzA5gZ3Ykz1
         0hc1z47gI4Owy/K0iWbSJbDmbJWBWs0hKGPidqfZOTAie91OWSZMmzn/PXB7EyY8c5Pm
         MfpeSa9lMSjWRlX4iqVLTDCZOoman8n9TdTdRdFtO7Ip3spf/508fT6Cy5zbhv8qqYWD
         dAEg==
X-Gm-Message-State: AOJu0Yx0FZ/NkiIa5ix7UGmynlb4YFxlwKIXqJWkKnE0XChuFrHgQ2ml
	2HRqRtXw8eTz5iUikuX+D/M5Nnr+NrGDi0qaRqfTR8mCMA==
X-Google-Smtp-Source: AGHT+IFxI4KnNmfmhoYBCVyJG+Z7I4BeVQXrQE52XkfbsBK1NmA5/bciGWyf2y+Z2BILad9sbPXDZg==
X-Received: by 2002:adf:db03:0:b0:337:55d8:ce80 with SMTP id s3-20020adfdb03000000b0033755d8ce80mr2911320wri.7.1705329575736;
        Mon, 15 Jan 2024 06:39:35 -0800 (PST)
Message-ID: <cf9bd41e-4c31-4617-80b9-9324ff2b9c7a@suse.com>
Date: Mon, 15 Jan 2024 15:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 7/8] tools/binfile: switch to common annotations model
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
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
In-Reply-To: <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use DATA() / END() and drop the now redundant .global. No change in
generated data; of course the two symbols now properly gain "hidden"
binding.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v3: New.

--- a/xen/tools/binfile
+++ b/xen/tools/binfile
@@ -29,15 +29,10 @@ cat <<EOF >$target
 
         .section $section.rodata, "a", %progbits
 
-        .p2align $align
-        .global $varname
-$varname:
+DATA($varname, 1 << $align)
         .incbin "$binsource"
 .Lend:
+END($varname)
 
-        .type $varname, %object
-        .size $varname, .Lend - $varname
-
-        .global ${varname}_size
         ASM_INT(${varname}_size, .Lend - $varname)
 EOF


