Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67625ACAD08
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 13:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003204.1382699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM35U-0001Hr-Qf; Mon, 02 Jun 2025 11:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003204.1382699; Mon, 02 Jun 2025 11:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM35U-0001FP-Nw; Mon, 02 Jun 2025 11:12:16 +0000
Received: by outflank-mailman (input) for mailman id 1003204;
 Mon, 02 Jun 2025 11:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM35T-0001FJ-Lv
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 11:12:15 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 701fd723-3fa2-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 13:12:14 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so3641458f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 04:12:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bd939asm68619435ad.70.2025.06.02.04.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 04:12:13 -0700 (PDT)
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
X-Inumbo-ID: 701fd723-3fa2-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748862734; x=1749467534; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/yQFO8/a+nNBYLSdWWFYbYJy0W/6piM1Jp2OWBY3pso=;
        b=GTWbmaJFiVOvohh8CHyzXwjnALy41kkcj1awlMv99Ilt1eNwKIxND+m/1FYQPwBGEB
         6K4+ydPjjWjFWmsyI06UgHRJ0j2+wHWcbD4e0UIpXZQRvGPfiGzKLcI8Z6Xjfyqe6+X+
         2fHkhENvPtzYEEb+xEV+F+3BZ+MZN86Cqk3mIsYLxIvKnkD6pv/zORfGWHak9V6G7VrB
         COvUzjnrh7z1pro51DjREvsJSWyDMrnk+JzdJoaCXJcKGX7gJ4i93HHV5ziZfjyhnbsZ
         Xb0pVIsc7QGfuXZyVDBEUAnP6yoFtMKaHwMeid8K6ZIubG2sodF/Gu9stXTIqPUoHGzA
         LskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748862734; x=1749467534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yQFO8/a+nNBYLSdWWFYbYJy0W/6piM1Jp2OWBY3pso=;
        b=wgzQ3Ej3lpytNiphccpeM2xx/ScQfA2rNmMd01v2uyHBhzCneRXFumqV9OuoxKbeIT
         AZ19BMx28eJQC043EhEPAJyfIaxj2cFgiL59TyJpjWPSYo0VZyD8WCqO3lr4N4EWY40j
         fVbhiZ8YqXdwsXl8GCmmST/gvY4UUIyQ+jQqwA/GkRadcqPZ64Q/9OkaTo74FkmLcNJ3
         0ScVOsogWD9zkvonm2jvYrEkmqsfHgknHBZc4fTAFsiQLG/3vtDjcKSyCf93XDNOJYtH
         MEjcib4CYU9HKPyB3vJ6A8Zav/1ZDTmUnsa9+F5Wbh6RbEDN0XvpQetKcJjim+X2BeaI
         r8bw==
X-Forwarded-Encrypted: i=1; AJvYcCUE1hVfvmwYvaSOANsrUbU9ab4yuQLjFiVj6ybbIo5bo3P7MENLmc5nSBZMWDiNUmxR9RTHyG9oGu0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZXM9ud9NNK0GdvXQH7sIRKiUUTOH1/H6V+V96kGU25T8QEZSz
	fUmt0GvRvkuseeggtSjZSJgUAUJ26V6QK+Njj3OsMLe9D1RwLfN7H+hoQJ0bwMYGzA==
X-Gm-Gg: ASbGncvqJ4eujDWiTiHbsHPWlTEY1nPZiL+w1Oa/5XQ227f0NJfSCp1bbBk0iqmYc0Q
	jeHHGBL9uOOV2DanzyC8VS4gvHIh3XEOy0mmLF9KQ5yj/7qE8JjrZt57PAm0vUWsGP95pEBzc3f
	PCc5gceNI0DZGOPvdT4LLcAlMIBmf0caKWOKbre692yknCfeZznoXIo/QiEvnYtyhKA/zoBNL0c
	hMtEnH0Mj/OqYBQ8NAbIuDDfetaRPnDlnsnFamHKbSE1w38GpqMntAPUXFAc5l/g9KqJ1X9+omN
	Rk0XHM0vLO2B/spXc3mo66tdwBY+f50SKoKFWibFpdfIASC5Yi6954qNgbRZiI0coUwqBzo9edO
	MJm3b/gBGi9Eylz5qKUkL9afX6/k49ePcUP5y
X-Google-Smtp-Source: AGHT+IEueEzD8Lox+/+pUiF/B7aYQ2RsAZI6wayWANPTAjjeNyr4cuxY+pItUrfJAsoPFgmybFlIBQ==
X-Received: by 2002:a05:6000:18ad:b0:3a3:727d:10e8 with SMTP id ffacd0b85a97d-3a4fe3a6ac9mr5078869f8f.50.1748862734175;
        Mon, 02 Jun 2025 04:12:14 -0700 (PDT)
Message-ID: <3b1109b5-7028-4ded-b56b-8df4e80fa62f@suse.com>
Date: Mon, 2 Jun 2025 13:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen/riscv: add new p2m types and helper macros for
 type classification
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <52861198c7c363c4b0caf818345f4ffbec056337.1746805907.git.oleksii.kurochko@gmail.com>
 <ad1d0c41-a554-49f2-8397-a288b4b75eae@suse.com>
 <c2be2642-0cba-48e2-8acf-1664a96f12c9@gmail.com>
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
In-Reply-To: <c2be2642-0cba-48e2-8acf-1664a96f12c9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2025 13:34, Oleksii Kurochko wrote:
> On 5/20/25 5:11 PM, Jan Beulich wrote:
>> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>> @@ -80,8 +80,36 @@ struct p2m_domain {
>>>   typedef enum {
>>>       p2m_invalid = 0,    /* Nothing mapped here */
>>>       p2m_ram_rw,         /* Normal read/write domain RAM */
>>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>> This is pretty special a type, which imo better wouldn't be introduced
>> without there being proper support for it. (I don't suppose RISC-V
>> hardware alone can effect this type?)
> 
> It is possible to make ro by using r, w, x bits of page table entry in the
> same way Arm does that:
>      case p2m_ram_ro:
>          e->p2m.xn = 0;
>          e->p2m.write = 0;
>          break;

That takes care of the r/o aspect, yes, but not of the "writes are silently
dropped" one.

>>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>>> +    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
>>> +    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
>> Aiui you took these from Arm. Looking at its sole use, I'm not convinced
>> it's used correctly. If it is, the same comment as for p2m_ram_ro above
>> would apply here, too.
> 
> p2m_mmio_direct_dev - this one is defintely needed as it is used for device
> pass through to guest domain to map device's MMIO. It seems to me like it is
> correctly used.

My earlier comment was mainly about p2m_map_foreign_ro.

> Others we don't really use now in private branches but it seems like they could be
> useful, so I added them now.
> 
> I can drop them now and return back if such functionality which uses them will be
> introduced for RISC-V, and at that moment I think it will be
> more clear if it is used correctly or not.

Indeed. And maybe it'll just be p2m_map_foreign, as we have it on x86.

Jan

