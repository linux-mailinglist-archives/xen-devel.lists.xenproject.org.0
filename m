Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C96AD68FD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:28:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012430.1390869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcM1-0002Pd-Ms; Thu, 12 Jun 2025 07:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012430.1390869; Thu, 12 Jun 2025 07:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcM1-0002NF-Ji; Thu, 12 Jun 2025 07:28:05 +0000
Received: by outflank-mailman (input) for mailman id 1012430;
 Thu, 12 Jun 2025 07:28:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPcM0-0002N7-E3
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:28:04 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6a58592-475e-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 09:28:03 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so344402f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:28:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fd62d19d9sm726367a12.51.2025.06.12.00.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 00:28:02 -0700 (PDT)
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
X-Inumbo-ID: c6a58592-475e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749713283; x=1750318083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2sNmT0citRf2K+fYNL2kahnq8yRRwGmnyfVBQeTZBzQ=;
        b=JFsDFoD4O901q4P1QoLcCFzxC3zPMC+c545CIMVplcUfVMHosl5CH3UGd/m5zcTkiu
         /hfOXb12EV8xFW/hED+zv/D5swE/w0xc7e3+CnEe0AyU8vurAVfm3uxrC9DTy23BqInv
         GCFuArUxUVZWbCQJe43CSKwyMC9AxFdM07X8H0bCzxZlUJAwSwQhVpEucbyC08pAe0uQ
         adELkC/Lvr1YKQ6pNd3resSLBrmhxxboZbI5bxiRBytyAKsVaLaGTWTZ7vmTz7VwE8cE
         Y0Y/z6dczXk1T0zF6CHQUEGZRF2afm64gc+b/bWVMOLakpK2DG35xHjJXckQV6mMVAPx
         +FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713283; x=1750318083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sNmT0citRf2K+fYNL2kahnq8yRRwGmnyfVBQeTZBzQ=;
        b=nb4QXzj0SL7N0RJ+14XXpxZ6hzLJKdVcxlv3AcWOs4LJZhTJjZzsIHzRjL3f1/ZaKk
         EvUwsKMvRn0BhEioAmgWnzpwyLBTKo4pLcl9curQ24jNyCjMPIHIJ7Q3EjbfH5wie0dw
         LTTvKzDbdXGyy5q7j2opiaoLbcviz0EZKKZitY/5JQlCYpezqRP78F25auoMt3Q5BJa1
         qMXht7g0Sthc90euz5rcDgyTMGXG0/qYOhpf9Xxp4xJcaOrpB52hw5NE1qOdU6SRFp2K
         x2ZscIvB6WMUyhymUEICQi1n9fjWvMb9NbAkmfjZPhfIe9PcbNLxTJdZq9iQRopWMqmH
         1ssA==
X-Forwarded-Encrypted: i=1; AJvYcCV4nKopeaVCJpGL1HP2QWrpgGgiu7+dEQ3FSEjKkVy81+vK7ePUxKVaZsnrbI6LOk5DB/klNIL9Il0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn4UyDgeCpfaApllsKii0R5cqGPkt0bOVwf2xj5sLJL6xynV0p
	Z8pHZnJm3NizXA89TjWflF18eKrcKBPfErx2dVX2P2RuwXONcA4/wg/C4oWuPaaWiQ==
X-Gm-Gg: ASbGncsKzoM6Sapy7ZhBIWiWZvFFqFAh7gsVKIR4yalOpERDSA8un4pCPE6zBYxFKQt
	yzItKOHf/VRT7xOycsmt5xFPsXoTSmFeZ2qeG23SOK3dao/VVUemEc1l4JLCmUPC9IKUL5O9wEy
	VXem6TgQrSwQeJLZaJLTfa2oov4f0jv/P2IOkk1jl68ra/+06/OJHM5SmP0Pqsd9Av6Hpo/LH+W
	QXXvb3guxDlm8cWiaiyiwrzaUG9Y15WqCFsjLgqj4uh7wPIFyXTrv9JOMnkAHJMqLdRJh7NQ1RI
	naFK/JtwnPUzbTCREGbRwE+myOsxtjCpjyi6KFRW3WgVMuhr79KHVhodcW75YDaTW6AM9Zyloy4
	QGpxQPwfAh7DHnstw9yU7NPFIkQBGnvtzoWhTyTNpKF8roz0=
X-Google-Smtp-Source: AGHT+IHiVz/7mUHIqZjfoiZPk/yWQx9A5o/NnRnW4vwoH7eVnWYk758M0LuGVU5O+uP937981D9vVg==
X-Received: by 2002:a05:6000:2008:b0:3a4:d6ed:8df7 with SMTP id ffacd0b85a97d-3a56076cb79mr1665914f8f.59.1749713282941;
        Thu, 12 Jun 2025 00:28:02 -0700 (PDT)
Message-ID: <fb05e3af-6b7a-4831-997d-1240c72cd0d1@suse.com>
Date: Thu, 12 Jun 2025 09:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] vpci: allow 32-bit BAR writes with memory decoding
 enabled
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-6-stewart.hildebrand@amd.com>
 <9ec5079f-9bc1-4843-a266-d74bf0556619@suse.com>
 <e10959a7-4e72-4477-b8dd-b9d62e2a0ccf@amd.com>
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
In-Reply-To: <e10959a7-4e72-4477-b8dd-b9d62e2a0ccf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 22:22, Stewart Hildebrand wrote:
> On 6/5/25 06:41, Jan Beulich wrote:
>> On 31.05.2025 14:54, Stewart Hildebrand wrote:
>>> Currently, Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If
>>> firmware initializes a 32-bit BAR to a bad address, Linux may try to
>>> write a new address to the BAR without disabling memory decoding. Since
>>> Xen refuses such writes, the BAR (and thus PCI device) will be
>>> non-functional.
>>
>> Doing this for 32-bit BARs only, with not even an outline what to do about
>> the same issue with 64-bit ones, seems like it won't buy us very much.
> 
> It buys us quite a lot: it means the difference between booting vs.
> booting with degraded functionality or not booting at all with PVH dom0
> on some platforms with certain PCI devices plugged in.
> 
> The plan for 64-bit BARs for now is to continue to refuse the write(s)
> when the 64-bit BAR is mapped to avoid mapping half-updated BARs in p2m.
> 
> I'll add something to this effect to the commit message.

Yes please, in particular ...

> Also see https://gitlab.com/xen-project/xen/-/issues/197

... to make clear that Linux indeed aims at disabling memory decode when
fiddling with 64-bit BARs. That reduces the set of remaining cases quite a
bit.

Jan

