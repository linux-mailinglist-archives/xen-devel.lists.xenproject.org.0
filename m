Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC84E8BC88A
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 09:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717271.1119304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3t3S-00074D-DT; Mon, 06 May 2024 07:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717271.1119304; Mon, 06 May 2024 07:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3t3S-00071h-AM; Mon, 06 May 2024 07:46:34 +0000
Received: by outflank-mailman (input) for mailman id 717271;
 Mon, 06 May 2024 07:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3t3R-00071b-Bk
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 07:46:33 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c08477ed-0b7c-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 09:46:30 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f5so10596195e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 00:46:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b0041bab13cd60sm18892475wmq.3.2024.05.06.00.46.29
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 00:46:30 -0700 (PDT)
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
X-Inumbo-ID: c08477ed-0b7c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714981590; x=1715586390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ivowa02Zz09uluRnS4pkLodP0hzWYK2w++sjkL+XuTY=;
        b=OJKiHGyv1zpMUuJ8H+gfhAwioShKB6UHycXem+aObNRhnBHbPcBTftGLQM6LRhTEa1
         29d1y2z5OBd2HAmVC/I+udZhnVJB8n82nfueKm20lvpgNASZjUB0cvwEX/Po0//snctn
         9Tyl9nRy3PS4QTI3Up40lpUbIperyHfGTQOIi9qeHnmsO4wVVayLbjF20PozHx/uTnW9
         CO1EDAjC3hwZDOk99jw8Yx3/BeVcQwfypmyDuONAELrbn+JkZ1jjzGxvU8dNW/AIux+V
         99iMDp3H7nIJSke3WnGOvdQE20/yhzDWC0E47JmVaKN8SZNEecBL5WBWIG5idvwB8NKV
         2VWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714981590; x=1715586390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ivowa02Zz09uluRnS4pkLodP0hzWYK2w++sjkL+XuTY=;
        b=QpGsbErujzvVm7/T6PyI15vQjaTClSJM3aFn+A42aDiBam1j0Nte3rkfzJNLeXeubB
         NHxZooTeGtLj2B6IIOPfU9oWlt0jOWRt+U6a/Jo6q3ux84NiR1AV6fD+m/zQjrCXB6gF
         Wt72Zz2SRv3BTfMg7DlBBGzmfzM9CXs2zTVzYhnkOeLy88hJH2LeJ4bQz0SQlUFe45Fk
         xjw6MvqsaFxIQYCz9s+CVpfq87ZqF1wzTjf607CFGw/CeCHX4pmHv01NFWSNUV5twK1k
         2MR5CnXxW2OhnfRYO/F9whsTa6y2jJIi3OmhCqnLp/gg+ywaMcMukFjA+stuz3WjC+XE
         OZ5Q==
X-Gm-Message-State: AOJu0Yw1NV/ZCDAbgta89Ol7tpKnUK4RQJvIjZleyVTczwp0+NK+MZXD
	IvsCfR5Kcv4eDy5pqPNY6nQMlaswK5za5V2onNwofzY9pOauOBHt+7QPDcRgZ4vNdAJ+/OK1faE
	=
X-Google-Smtp-Source: AGHT+IEO759mocuHoAgJC6kS/uBBM+NLYTt7MgkriaBqHke8h+jP3A8itTi5JBtoQUYXMVO2+mORZQ==
X-Received: by 2002:a05:600c:4fc3:b0:418:969a:b316 with SMTP id o3-20020a05600c4fc300b00418969ab316mr6666492wmq.1.1714981590250;
        Mon, 06 May 2024 00:46:30 -0700 (PDT)
Message-ID: <0794e145-aeb0-4b33-a53b-5a940958cbad@suse.com>
Date: Mon, 6 May 2024 09:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6637576caf98c_10d9e42c57d37559ac60499@prd-scan-dashboard-0.mail>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <6637576caf98c_10d9e42c57d37559ac60499@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.05.2024 11:54, scan-admin@coverity.com wrote:
> Hi,
> 
> Please find the latest report on new defect(s) introduced to XenProject found with Coverity Scan.
> 
> 2 new defect(s) introduced to XenProject found with Coverity Scan.
> 1 defect(s), reported by Coverity Scan earlier, were marked fixed in the recent build analyzed by Coverity Scan.
> 
> New defect(s) Reported-by: Coverity Scan
> Showing 2 of 2 defect(s)
> 
> 
> ** CID 1596837:    (USE_AFTER_FREE)
> /tools/firmware/xen-dir/xen-root/xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> /xen/common/gzip/inflate.c: 935 in inflate_dynamic()
> /tools/firmware/xen-dir/xen-root/xen/common/gzip/inflate.c: 935 in inflate_dynamic()
> /xen/common/gzip/inflate.c: 935 in inflate_dynamic()
> /xen/common/gzip/inflate.c: 935 in inflate_dynamic()
> /xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> /xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> /tools/firmware/xen-dir/xen-root/xen/common/gzip/inflate.c: 935 in inflate_dynamic()
> /tools/firmware/xen-dir/xen-root/xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> /xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> 
> 
> ________________________________________________________________________________________________________
> *** CID 1596837:    (USE_AFTER_FREE)
> /tools/firmware/xen-dir/xen-root/xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> 937             goto out;
> 938         }
> 939     
> 940         DEBG("dyn6 ");
> 941     
> 942         /* decompress until an end-of-block code */
>>>>     CID 1596837:    (USE_AFTER_FREE)
>>>>     Calling "inflate_codes" dereferences freed pointer "tl".
> 943         if (inflate_codes(tl, td, bl, bd)) {
> 944             ret = 1;
> 945             goto out;
> 946         }

While first I thought the tool may be confused by the earlier huft_free()
(matching an earlier huft_build()), ...

> ** CID 1596836:    (USE_AFTER_FREE)
> /xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> /xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> /tools/firmware/xen-dir/xen-root/xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> /xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> /tools/firmware/xen-dir/xen-root/xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> /tools/firmware/xen-dir/xen-root/xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> 
> 
> ________________________________________________________________________________________________________
> *** CID 1596836:    (USE_AFTER_FREE)
> /xen/common/gzip/inflate.c: 943 in inflate_dynamic()
> 937             goto out;
> 938         }
> 939     
> 940         DEBG("dyn6 ");
> 941     
> 942         /* decompress until an end-of-block code */
>>>>     CID 1596836:    (USE_AFTER_FREE)
>>>>     Calling "inflate_codes" dereferences freed pointer "td".
> 943         if (inflate_codes(tl, td, bl, bd)) {
> 944             ret = 1;
> 945             goto out;
> 946         }

... no dual usage exists for td. Hence I'm utterly confused as to what the
tool is "thinking". In fact it looks like there is an opposite issue in
both inflate_fixed() and inflate_dynamic(): tl and td are leaked when
inflate_codes() fails. I guess I'll make a patch ...

Jan

