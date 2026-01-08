Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABE1D01677
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 08:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197320.1514888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdkVf-0002T8-J3; Thu, 08 Jan 2026 07:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197320.1514888; Thu, 08 Jan 2026 07:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdkVf-0002Q8-FT; Thu, 08 Jan 2026 07:32:43 +0000
Received: by outflank-mailman (input) for mailman id 1197320;
 Thu, 08 Jan 2026 07:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdkVd-0002Q2-Ka
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 07:32:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 361185b0-ec64-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 08:32:39 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so23560605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 23:32:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d870dd5b1sm33366365e9.4.2026.01.07.23.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 23:32:38 -0800 (PST)
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
X-Inumbo-ID: 361185b0-ec64-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767857559; x=1768462359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cdFgoL7yvHhYbfibG1J618dhEbPwn1t7Kmqu1Ld2108=;
        b=Mzh0Un5T27roafAYx+ppV2bNqaIWLGMAvtkupMA4ss8zn/wN99suTK2Dr3hXkSrsop
         bt4qf3sRP7zexsv+CiUQdKwptyJPCH2/XLCY0mkrG3rlcWz9BT0qh1/1eabaDplmPlxQ
         LtYszsLDlc+w4yUhGxZtwXcy/dtIKgLP2KKqTjPirm7qjRnJ0s5gA4+9oGlSWukSrLZW
         sWvdfS3P4iOE7A4e4qT8gfzSz1aT+HfYbj+6VuHfHa+YreFJf4EFZrUsKOffsDwXkRV3
         b/iAD+7ClN0HoLfLRVWw0LJ9kWGN1/abV8vMrImxuhBVmDF45529kCUT/r3sc99ZDQzV
         4xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767857559; x=1768462359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdFgoL7yvHhYbfibG1J618dhEbPwn1t7Kmqu1Ld2108=;
        b=CdmvfX8LdeESD3JeedgkHeCwSiFw/HtzkqBJrvDkTtLaZtPewQy7QSJ2XfoG5xdlIc
         28VXX3fcjbmZLPsRSVBfEmggcs6cw8bXxZldaoz7C3t4nPUfZOQsnuvUlkY012lDDXtQ
         UwyXI/f4JVcXTspqlLxevNa91NXwQDVH/3b4SpHzT0ayy7FjUPLchTC2QByjB+YGNVzG
         TC1afmCd/9OaSSv2paNTGmhBMjgbXDczSavA4EzInwXAIVsg/3W74xMluJRV+fWd1zdQ
         3mJleJmW2qfTkAeNPZntvtlYxLBqbbwDvCD19X25s5DSbKXZTS0TGg4wdi+M/MDU3PT8
         4CBg==
X-Forwarded-Encrypted: i=1; AJvYcCX8qPaU7VD7KBXLV8Z5GpZfyryazP7TL05jx77qKD0N/xoJF7Pz7u/dogioOh4EXs7inhkhK5MpGCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJnxShVjCPb6Db1xSjEST7YbFWpXWixeMRz4u6lSC4ep/m7+j/
	tBe+ak13b7KHcX1hm1vqNs8urhca0T806Lgmhgr7OrDrnHFPvMHgSI06kReHuBhCWw==
X-Gm-Gg: AY/fxX4U7ArCuZVmzSk+kCy8jjXIhYCUCFz71i1crAF9t5kfRiSwojEUmBsHfzvgBLW
	UocnCqrMvRRTCMf4xKhFY+/ni3km8QxW3JSC7VCQZzbesO5wuJPKWFGqJuOHhzbVlYpkZfzMOIw
	qMw/juxPMuphl2yZBnaKW6hzOTuPfJcXf/qCDXkmX4lGENhf08F9pLIC6wXQzPrMWDOcRj45KtO
	Nf2vRdijzVCigVXQLFDuKdIW4vz088FKD2ALAz56u3NS5F8rS3a0GmDQu/vMPn1blZ7tUgC/W+Y
	XD2NGNJ5kzSFyEnv0ledK99DhxvpTVY/n5yEUzEbyQL3UVvac1QchqwEF/0zNe5ZD9wi8fCwYvC
	ur798mVydpxxabJ+xYYYn1P8wSormRNg3a/RmBnxO8hlLnK1CxOjy2HWv5G8mzn/H8mXVqiQZQ5
	E3mXjxGrA3BHQqzpijUIVwV9NTZ2lqk3lU8xS9a/PFije0OrD/76FOTPAES4XrbJ8wo/rGIWu54
	H4=
X-Google-Smtp-Source: AGHT+IGsRTxjnGsLRD11wM4O9TmEGWAMY8K77x90Mekx+c3hOlCNIkmi4eQXNUDmh1i/h1LH3v6jog==
X-Received: by 2002:a05:600c:500d:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-47d84b3baa1mr47862125e9.20.1767857559128;
        Wed, 07 Jan 2026 23:32:39 -0800 (PST)
Message-ID: <1822f42f-9fbe-4de5-bc0b-f6e776b28ed5@suse.com>
Date: Thu, 8 Jan 2026 08:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cpufreq drivers not working on T480S
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Milky <milky_way_303030@proton.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
 <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com>
 <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me>
 <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com>
 <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me>
 <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
 <6f02aca2-eaca-48b8-a2f3-4afff42ad264@suse.com> <aV6xvhqjX1sOrXb1@mail-itl>
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
In-Reply-To: <aV6xvhqjX1sOrXb1@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2026 20:19, Marek Marczykowski-Górecki wrote:
> On Tue, Jan 06, 2026 at 09:25:14AM +0100, Jan Beulich wrote:
>> On 06.01.2026 02:03, Jason Andryuk wrote:
>>> no-hwp failed to disable HWP.  But if there is no ACPI CPU data, it
>>> wouldn't work either.
>>
>> There isn't any "no-hwp" option that we would recognize, is there? Iirc HWP
>> isn't enabled by default, so simply not saying "cpufreq=hwp" should disable
>> the driver? (I already found the original report confusing in this regard,
>> hence why I preferred to not reply so far. I wonder if there are local
>> patches in use.)
> 
> Qubes has a patch enabling HWP by default on supported platforms.

In which case can you please tell the reporter how to properly disable use of
the driver? Iirc the to-be-expected "cpufreq=xen" was already tried, with no
effect.

Jan

