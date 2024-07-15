Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3432A930F66
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 10:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758705.1168137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTGoB-0002Jr-28; Mon, 15 Jul 2024 08:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758705.1168137; Mon, 15 Jul 2024 08:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTGoA-0002Hq-VG; Mon, 15 Jul 2024 08:11:42 +0000
Received: by outflank-mailman (input) for mailman id 758705;
 Mon, 15 Jul 2024 08:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTGo9-0002Hk-GG
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 08:11:41 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc41baf0-4281-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 10:11:39 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eee1384e85so18978991fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 01:11:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2caedc1709esm3695276a91.34.2024.07.15.01.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 01:11:37 -0700 (PDT)
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
X-Inumbo-ID: dc41baf0-4281-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721031098; x=1721635898; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c7m8DZbQd+ip4oRHd39rQDkxd2GQoT3piu9PElROalE=;
        b=aFYWRWcMUYXjvWjNSwzowQFJsRT4D/PI+zzoQDG5jBPykkV9sijJeVZ6rw1NIj969T
         gYSicGoVnZeWV+fCJ93Q7OU+NqJ/Xfpsb9Nqyf0Qnn/iomoUEG/Q32an/bm88D9wrvVN
         uxwDTqCsORBvWgDw/wiAa4BK2qUKdzyeEcxTp2BZlj6RA0SefcGOdFmpLBOgqHpbHfcc
         5MbtCJoPTVDlAMkuV1BDGfMG8V95x1Zz7XQ6u078FF7WxZ/lxCUY8deZUI9ixDdOEk3P
         iD3vB3C6hgtX9sTMEtul4JIpnqna8Xv8XqYkYiam6gljR0rd5UTXaZdQfV86LQlEdVo2
         4d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721031098; x=1721635898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7m8DZbQd+ip4oRHd39rQDkxd2GQoT3piu9PElROalE=;
        b=cOTp8QR0DPNJ9ItiwsoH5NoqccKKFb0r0Qlb8N+NgDKU2KPJW7kfLVHRbxihIcTh8x
         Y4C7PwMCYVGnilX1VT/k4mdRCDE6GJ8AR7koew8SrHHpeuxHKG+988yPB4OiD3qqB8fK
         7WUDGn1NhX20oBxKiP42kOZFHblOIUSc04YTD03A3wtM8595dN20YgmKJE14nMEx8sJx
         BaQkhY/pI3iJ9CZhlLsnBRNxavZJ1S5iV7HjMLKS3Li++vt4VyFwBjFYodcvgR6NFnQI
         8OIsmhuIL62YBTju2tdfZxDjIl4urFwKro7BsXawwHsctz0CKFNF7Y7i6sRafXnEDP6Y
         WrvA==
X-Forwarded-Encrypted: i=1; AJvYcCXxq1GQSxacZHQBvWkscbEWDkvdGfjewlJK0AgFXAaXOOFov/VYeSC9ASVlpkPGeK93cOt1//B64jI/WeybI+IP7BFYb2YGyBkBNEhg51A=
X-Gm-Message-State: AOJu0Yw228jGIN4AmT5aTXroX2bziuVKoTCT56/ATkkb9/YW+Tmj1+/X
	dTAnq0TOROofdYevTyv05V+itndORwSxm1hRHvCPZBpgB1nCNg7GtcjUf8yaow==
X-Google-Smtp-Source: AGHT+IEihF3XqkjNTNS26LfpYXqgAdHdOtySnPlQm6jtR2621K98ZRCP8O9EpfSWC4aoCYaJI/LpRA==
X-Received: by 2002:a2e:9bcc:0:b0:2ee:493f:d751 with SMTP id 38308e7fff4ca-2eeb30fd3admr131248181fa.23.1721031097998;
        Mon, 15 Jul 2024 01:11:37 -0700 (PDT)
Message-ID: <1057f937-da16-415f-a760-ac4f00bc29f3@suse.com>
Date: Mon, 15 Jul 2024 10:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: systemd units are not installed in 4.19.0-rc2 anymore
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <ZpHqR4e3VaFAXC3m@mail-itl>
 <94d0ef92-9fb8-4097-a633-59f1190434c4@citrix.com>
Content-Language: en-US
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <94d0ef92-9fb8-4097-a633-59f1190434c4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.07.2024 15:02, Andrew Cooper wrote:
> On 13/07/2024 3:45 am, Marek Marczykowski-Górecki wrote:
>> Hi,
>>
>> Something has changed between -rc1 and -rc2 that systemd units are not
>> installed anymore by default.
>>
>> Reproducer: 
>>
>>     ./configure --prefix=/usr
>>     make dist-tools
>>     ls dist/install/usr/lib/systemd/system
>>
>> It does work, if I pass --enable-systemd to ./configure.
>>
>> My guess is the actual change is earlier, specifically 6ef4fa1e7fe7
>> "tools: (Actually) drop libsystemd as a dependency", but configure was
>> regenerated only later. But TBH, I don't fully understand interaction
>> between those m4 macros...
> 
> Between -rc1 and -rc2 was 7cc95f41669d
> 
> That regenerated the existing configure scripts with Autoconf 2.71, vs
> 2.69 previously.
> 
> Glancing through again, I can't spot anything that looks relevant.
> 
> 
> 6ef4fa1e7fe7 for systemd itself was regenerated, and I had to go out of
> my way to get autoconf 2.69 to do it.

Yet was it correct for that commit to wholesale drop
AX_CHECK_SYSTEMD_ENABLE_AVAILABLE? That's, afaics, the only place where
$systemd would have been set to y in the absence of --enable-systemd.

Jan

