Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C726891D9EC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751355.1159278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCOP-0007so-Mz; Mon, 01 Jul 2024 08:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751355.1159278; Mon, 01 Jul 2024 08:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCOP-0007r8-KI; Mon, 01 Jul 2024 08:28:09 +0000
Received: by outflank-mailman (input) for mailman id 751355;
 Mon, 01 Jul 2024 08:28:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOCOO-0007r2-EN
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:28:08 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7d25faa-3783-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 10:28:07 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so29517251fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:28:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91ce58877sm6214299a91.24.2024.07.01.01.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:28:06 -0700 (PDT)
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
X-Inumbo-ID: d7d25faa-3783-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719822487; x=1720427287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DYOZ3ba9S50aybfiuJn0F5npBITmXzlQJcK+ppIxMxM=;
        b=cyfiCfsMuF3LFhwm5IMY2EsQrPGFoIPoqQvw6+QuBl55amaOoNwsP6Su6DksjW2A8S
         633uhjzjWiol5c2PTRgM4OQndRzp6Ovpkza89CNG1l6DabCyih44V722Swb2stlpwJuY
         1rVyweCffnAmm++q+/Ib4842WlQUnDG6sqyjZ8DYwGyjZEEqlFENPVzAt+ixMykvRmDb
         iNRTjUdEyUts8CfizC9XNkNN4D66o80+NchX5TMdrXEDiR5m535UczSnlsHfKFPyX9YF
         uQXpHnzXI4BevjNRGql+la89SShO1EA03p3F0IsKcDcAE4LLMEU96OSi+ml805QFAGz4
         HY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719822487; x=1720427287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYOZ3ba9S50aybfiuJn0F5npBITmXzlQJcK+ppIxMxM=;
        b=plA8kKvY9ussfL5zmDwLoO/lZpXZQDPLbQ8JsW/1cGKzBossr31YgzPmUN2t7VfuDT
         8l2s/4WQC8h73kxBzohltfKXAdyKdkrXlEJ96uSlNc7d6HiGU8HhhDGy6v9NSgIsnJOg
         fhrJlhd5suru2B7/2jlLXxZj5YYWWjOsV2/2exNTnn+XzUskJKs4zP3QaafRJU/epYXg
         PQo15/lMOizFmIRZ1wvGViGVoV3SVfGK3bf6z9tXBfcj8xRsJ6AylK/MakTOt35nXVvI
         1spw8Vot5HhOnUsYO+3SawbIwOfFXcrRTy6Uy423TFt77YK/sHNjvlLcYFR7iNaHOnxy
         id6w==
X-Gm-Message-State: AOJu0Yw+Z2+i4zRpq3WTVytW8bZPJ/Bc3yqtiS9apkDQRws9ekRPZxNR
	eZTcuNLSt4wh1+FKiWY0dNAhSAv5qtO9Q2QVFoTu9VtnDXvjJcoP7nyhiHezhQ==
X-Google-Smtp-Source: AGHT+IHh78yMd0+moK9L22taZZ2RMB/zzILelwlxZkHEeiYLgWuPVLCH80df+J+n8VtX4IESste45g==
X-Received: by 2002:a05:651c:2203:b0:2ec:557b:f8a0 with SMTP id 38308e7fff4ca-2ee5e6ba61emr37471451fa.38.1719822486894;
        Mon, 01 Jul 2024 01:28:06 -0700 (PDT)
Message-ID: <37478823-39d1-44a9-8e73-1afa40554a4d@suse.com>
Date: Mon, 1 Jul 2024 10:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/mctelem: address violations of MISRA C: 2012
 Rule 5.3
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <94752f77597b05ef9b8a387bf29512b11c0d1e15.1719398571.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2406261757480.3635@ubuntu-linux-20-04-desktop>
Content-Language: en-US
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
In-Reply-To: <alpine.DEB.2.22.394.2406261757480.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2024 02:57, Stefano Stabellini wrote:
> On Wed, 26 Jun 2024, Nicola Vetrini wrote:
>> From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>
>> This addresses violations of MISRA C:2012 Rule 5.3 which states as
>> following: An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope.
>>
>> In this case the gloabl variable being shadowed is the global static struct
>> mctctl in this file, therefore the local variables are renamed to avoid this.

"global" and "static" contradict one another; I think you mean "file scope".
While there (nit) also s/gloabl/global/ or perhaps even s/gloabl// to deal
with the conflict with "static" also there (without writing "file scope"
twice).

>> No functional change.
>>
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Nice one!
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

With the adjustment:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

