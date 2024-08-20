Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D665A9580F7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 10:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780183.1189807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKEj-0005p2-KJ; Tue, 20 Aug 2024 08:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780183.1189807; Tue, 20 Aug 2024 08:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKEj-0005md-HJ; Tue, 20 Aug 2024 08:29:05 +0000
Received: by outflank-mailman (input) for mailman id 780183;
 Tue, 20 Aug 2024 08:29:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgKEh-0005mV-OF
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 08:29:03 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 419253b5-5ece-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 10:29:02 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5bf009cf4c0so1843674a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 01:29:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c6760sm728733766b.23.2024.08.20.01.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:29:01 -0700 (PDT)
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
X-Inumbo-ID: 419253b5-5ece-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724142542; x=1724747342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pWmTRf+lqqwdFlkN10eJYZT7w32zxJLaePIz0o/Lf70=;
        b=IkFLIGjE8lKPQhJYDpuiJQjdsWPSOadFz++A2+iM1Q0Kks7XvwjnWz2m/iDSPcO3rt
         sfuF8Oe8WORjRRFObvAUbltc7WjK5Rhtg4GY3D0DNS1KIZ/aU2uCAVIhVd+gvzTfxA0M
         tX0Y3bjnRruU7uD6Pytke5MFA0H0NHV1ktMT9PDg1/VHbqxBtRKOsE0+Fhan38mwqzeS
         Dy/PsG8/sVRCqP9bTH5ZDtejY60oaTO7+Y7mFC1XicdBC8GfxgZcJJ4L0UOWgN2K2BWR
         A6z6vBujcIFfvUTGEDOAPkp1HeDMpAeqlHcAMTuvc0c7QZkgmIJfZoj+nHrhIG8jiO/N
         fubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724142542; x=1724747342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWmTRf+lqqwdFlkN10eJYZT7w32zxJLaePIz0o/Lf70=;
        b=J1OAN/a1mnQYucI0GXZOk8EWIDW9QB1A87uJFeMCIfFHaS75OE1ALkuHjwGcGK1JGI
         APMEycTmApbhDUlkl8LaslTzeJWbrfsAK35OuQEtIXszH/6WS4+7btg8Xp4yyhHc85Oy
         RWPhh2KlcqP1MBF6ecVsLMsCjbAZHuX6oh8xehSLtYTBY3JK7K0zpG373VDsUNB5VfCN
         H2LdU6wIY4YT1bizyx1VG8rTUmwuWKg7xbT3l61wH5RJiJ8i2Qyg3yYtwD7vZFEJWz0m
         wpDNSkLyEvMVnMW0i6FqzlqUq4SQ7NtAH4GLYxtZmFCqxWefHnHrwZmqPyIN2uw/5bC2
         FaHg==
X-Forwarded-Encrypted: i=1; AJvYcCW53gdaCApuewMPcI9wvujw23FMZTe0oDcGgWSHwQ4AKJVl4howNL1muRcnqOlcngfuo8plUYLrj54=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6FVCJPTylm/ZvIsNXWzlkzTiCyYkchFU/MlYSdB12RB/s1NsA
	mpVp4QjOT5Mvarzjt3wFOB9LWni5rvFZ4thTbEMRw4GES7Dp/UvjAAODhbzA6w==
X-Google-Smtp-Source: AGHT+IE6Q+yumPSaA4yB4wRaKEuNPBZP7rH5pqH/ZrgNa5ZaBHo+1ykUeQjOd02FSeuoP+so/JiYyg==
X-Received: by 2002:a17:907:3fa6:b0:a7a:ba59:3164 with SMTP id a640c23a62f3a-a8392a160d8mr944638266b.53.1724142542132;
        Tue, 20 Aug 2024 01:29:02 -0700 (PDT)
Message-ID: <41837bb1-0251-4250-8f00-23d60cb1d664@suse.com>
Date: Tue, 20 Aug 2024 10:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] xen: use correct end address of kernel for
 conflict checking
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-2-jgross@suse.com>
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
In-Reply-To: <20240820082012.31316-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2024 10:20, Juergen Gross wrote:
> When running as a Xen PV dom0 the kernel is loaded by the hypervisor
> using a different memory map than that of the host. In order to
> minimize the required changes in the kernel, the kernel adapts its
> memory map to that of the host. In order to do that it is checking
> for conflicts of its load address with the host memory map.
> 
> Unfortunately the tested memory range does not include the .brk
> area, which might result in crashes or memory corruption when this
> area does conflict withe the memory map of the host.
> 
> Fix the test by using the _end label instead of __bss_stop.
> 
> Fixes: 808fdb71936c ("xen: check for kernel memory conflicting with memory layout")
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



