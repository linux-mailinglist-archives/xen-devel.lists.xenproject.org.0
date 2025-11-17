Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F197C62E96
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 09:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163434.1490562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKuhq-0007Xp-76; Mon, 17 Nov 2025 08:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163434.1490562; Mon, 17 Nov 2025 08:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKuhq-0007Uh-3Q; Mon, 17 Nov 2025 08:35:26 +0000
Received: by outflank-mailman (input) for mailman id 1163434;
 Mon, 17 Nov 2025 08:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKuho-0007Ua-Im
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 08:35:24 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5977eb95-c390-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 09:35:19 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-640c1fda178so6191344a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 00:35:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b28b0sm9720216a12.30.2025.11.17.00.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 00:35:18 -0800 (PST)
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
X-Inumbo-ID: 5977eb95-c390-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763368519; x=1763973319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yT5xD/SJii3UtDmoxz01Di0Qof6JQqaWcl1I52DrHTk=;
        b=aSKYXHsAb+HuXdzoNlDNJCgN6QEpiD3e7/CUOtnv81+j/eKrboyFIOQCi/9y7g7cMs
         beF89P7bwX8WhFaLdvZQImr5sZ0N0shOs94uWbNpdHFgwseN70V0Co7f/rhHU9JZ+cb5
         5iz4jbxiM9ssl7/WxrPF7HeeKQaKlu5nLj38svDdvY136zV01TpTXek7e4HjDnH6CfW0
         /QxtIO+4ROq1SWnGgFfSp9+8q81gyJpnFzKuJtnl0OjgaEFYhd1yZF1vWGrBkF22Ohup
         BdLIryWrx2n2oFGwCJ+rP+FQqnPePilTs/ftrxi04pfNT7Gs9NK1FsSz1622e/5HBAKz
         jenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763368519; x=1763973319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yT5xD/SJii3UtDmoxz01Di0Qof6JQqaWcl1I52DrHTk=;
        b=hBe/sYK/pBofvb4hdMK+28FPMOp73VS0wu1V4cF4I3iS19RY0jq1i/CJz6WaRQ6oDB
         DKJJmalNdPdkylDxQRvUkeVBaknWeR2ZXJqeOujXRux6U6NyiJLDP5XunI7mRJUNfljT
         MbeSfQWJd/eoagsIgG0UdgsuLKdH8ja+hhb72Nfp+dGT5fG1c7KbKWjotk3HNXXxFq8X
         H8SD02PB54Q1e8+96SH1MSRjgSYSYkrTBl9v1UulD5cdp/XCpUvYy+f9jnJ7MMlhMmJj
         csEtjQxMFamFAI0xAeif23Oq/n/GvaUm4pU2TvNgHA37nj2hvRUs9duSVuupd0l8HrqT
         tJug==
X-Forwarded-Encrypted: i=1; AJvYcCWWsNgrpTbsGM2mBucBdeX2d5467CIL7AuzhIPEydQLDx/mIGoQJAObi9E+jLbivvA+sXhaLs3I06c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMU/Shr64BjW6wlMF0glaTT1npx8pPsWXdT071gqtItizyFWaP
	pUWgievYQePZ2bAwhVsLde5JvNAkSFrP2QDlDP6fnI+BRrtzKbFce/HgjnmHgSiV9w==
X-Gm-Gg: ASbGncsJmXAXEIN5QfkU5PWxrjJ2Yyp/0Up4tkJPa3ywVi4f35u7/zwG9rwqQduTLyV
	0UdO/DaOZN6XWcykvGx6BjX93Bu0X8cDMF7F9DhjAs8nb7o8Nv51ZfBhQRUPAD5MYYXRAxB4ljZ
	11Ag4zG19ULj+oANpQnXyI0Z4E+5HxqQrpCO3O+rS+oJaRI8sURdnRG23aRlNR8JHnlM2DTvek3
	ugFhY4+0RipZAtPlcDh0OuJBCQbZd/fnuEG67tRpPW3+4ayosPU50/X/UA52gfYGEyNFiAS+J1k
	qtEElN2UlpepVGx3kyNmAGV0YJ1Epn3nPj2qLYV/PRgFJK67R5ugmkqRf32Siqe2fpVI03H5QWv
	BtiRkHpyCkyIbVx8TbE7hHGKG1VgipIzablX2KDLChiYBIlJuYxVz4bqc5r6OPvcnu+ygMiBy4u
	T4PESq9VIpUHf8y+eXWq0UD9/hkBHwvM3b8a82srIXwtQlOLQAA84SuoxJiO3nSwdJ
X-Google-Smtp-Source: AGHT+IHuXo8Sr1hq9ypZhPNP0Q+axFfglViz5HwEXWAoLM2ZoxCAGa4Lz+RAUQwcr7Cui/VYmFf8zQ==
X-Received: by 2002:a05:6402:2693:b0:639:d9f4:165e with SMTP id 4fb4d7f45d1cf-64350e9fc31mr9798608a12.29.1763368518717;
        Mon, 17 Nov 2025 00:35:18 -0800 (PST)
Message-ID: <f2174fd6-a5b4-47cb-b361-cb6f5558de75@suse.com>
Date: Mon, 17 Nov 2025 09:35:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 02/18] xen/riscv: introduce VMID allocation and
 manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <bdbe6c13991c2d166614795d43db3f71d790c00f.1760974017.git.oleksii.kurochko@gmail.com>
 <7e9671b3-6972-45b8-9cba-4447fa802fe2@suse.com>
 <cf96c62e-cac0-4b18-9524-0703c6492453@gmail.com>
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
In-Reply-To: <cf96c62e-cac0-4b18-9524-0703c6492453@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2025 10:27, Oleksii Kurochko wrote:
> On 11/6/25 3:05 PM, Jan Beulich wrote:
>> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>>> +void vmid_flush_hart(void)
>>> +{
>>> +    struct vmid_data *data = &this_cpu(vmid_data);
>>> +
>>> +    if ( !data->used )
>>> +        return;
>>> +
>>> +    if ( likely(++data->generation != 0) )
>>> +        return;
>>> +
>>> +    /*
>>> +     * VMID generations are 64 bit.  Overflow of generations never happens.
>>> +     * For safety, we simply disable ASIDs, so correctness is established; it
>>> +     * only runs a bit slower.
>>> +     */
>>> +    printk("%s: VMID generation overrun. Disabling VMIDs.\n", __func__);
>> Is logging of the function name of any value here?
> 
> Agree, there is no any sense for the logging of the function name.
> 
>>   Also, despite the x86
>> original havinbg it like this - generally no full stops please if log
>> messages. "VMID generation overrun; disabling VMIDs\n" would do.
> 
> Sure, I will drop it and will try to not add it in such cases. But could you
> please remind (if I asked that before) me what is the reason why full stop
> shouldn't be presented in such cases?

First: Consistency across the code base. Second: Meaningless characters
needlessly consume serial line bandwidth.

Jan

