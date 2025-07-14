Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBE0B03768
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 08:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042563.1412612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubD2P-0007JS-97; Mon, 14 Jul 2025 06:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042563.1412612; Mon, 14 Jul 2025 06:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubD2P-0007HB-5v; Mon, 14 Jul 2025 06:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1042563;
 Mon, 14 Jul 2025 06:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubD2N-0007H5-L0
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 06:51:43 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffaf29dd-607e-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 08:51:42 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so3440115f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Jul 2025 23:51:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de433d557sm86354175ad.186.2025.07.13.23.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jul 2025 23:51:40 -0700 (PDT)
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
X-Inumbo-ID: ffaf29dd-607e-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752475901; x=1753080701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r6VLbPSFbGzuTC3NC6HLmmXAK3ll3EDBj3rV7Eevlo8=;
        b=HOzf+yGKrqBs/ltk+1uTXDtKoT3XvCKeDb+Jhp+0RcHR4OSu5hGaw7xzWDrNQcan2e
         wWOnruUNhyeSZhxmqHTN0sTi9otobugbvj9MiftmrEJ5oecWXweN0Mj9+6IU5MFov6Kz
         wb3mpxqVqMD0nJnGssQWP4NuW3IBdgZmkWKgxvGtKxF0SsotZjwBzHE1434t9Onx1Zq0
         A32Luw57Ref4uTR7PlJaEsiIh5HVmy5bK648sk7SKb7p/2xze7xaHmlFXv+MZpK0ulFy
         70Pmv+YYvGgZLVNRpxHm5Yw/zG69HZk5ID7BZUU0uCrySNSAu3ZrvJGU32ZgXV9SzrzM
         lnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752475901; x=1753080701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6VLbPSFbGzuTC3NC6HLmmXAK3ll3EDBj3rV7Eevlo8=;
        b=dUv2aZEqSh3p6zi+SIQcTukDTczPqHs0fxY/E4p59pGQGXxVX/GTgKP5qNRgPET1GX
         btlaZr4bS6u8hGoiTRySFe4O2d9IX0ssm+JlXU8+pljXOI8l43AujkBjyXDbgt73TiJQ
         j5BHKewnngD5X/oZ/bLLrNoNY0CNJmXUHQTRkDbggBuj0fsK6oNkpPEIbh3vvyns7h32
         zB68b/IrkXfXOXI4wVIj/OOTclV4tATN0HfOonB9JIMCxJjS6uq+8ySPlKaRJCMjuNTp
         0aW6S8MXoFhxNJG19ccH6bjEYTQFBRd4ZlQPVBDIvoqwBvlcP7MFSYEzSwAmVItWJ935
         1YRQ==
X-Gm-Message-State: AOJu0YydoLtRvGKNsEwgOBcFiSNOHoJPMG0TD3O2IsLKu88VhLJ2hHba
	i03PacypzP5z8zvSOKbD/9VypRzoOEVM4XEc34Xim5Qqe6Fmq2BLxdLuDFjse8c1Kg==
X-Gm-Gg: ASbGncu2w2E6SRbkH6eSkHRZZQgRV6uZ9J1rvCgyjHrgqQsluHhZYNnxuTIRIsOKnD/
	T07tMutJqvd4ZY1iK7Fn9POqht3EwHk3c6ZcJC+DizeTOiZHrvT+WEZHqQK9VTFI9pNcATDN06F
	63Lj3asdvKKgJtmt+DxC0hhByFys2SdhTlhydao1k/P0ztsB249PPiO5bpWPxkBZXOVhL4poN7L
	j1W6mKFvVFbQXvWX13I0B4zgFOI67Kr9GRy+6UC+LPPILlX2nLs8EF9SOiOlhFKLJbOIjCBMGnu
	DawT4+4XUJlcQzrPn5/mAlCeIjdPapItRD2l6l6HzkGedpxTltY9p96BNwXrFt/hxKqJFOQ5VCf
	wP62on7WPlpIFUhWBUuVBgt0b7lQ4bLbd83+k/Dx26kj2MAq4T+STR55wfGrpV4AWVIvO58e6Cf
	OANOthiVQ=
X-Google-Smtp-Source: AGHT+IE4ee30lm7aPis6CUTSe3BmCV0oVe3hHUAVpl4iRpesUy6bqvvescdPVucPDyyfSTYci2cNkQ==
X-Received: by 2002:a05:6000:2481:b0:3b3:9c75:a4fb with SMTP id ffacd0b85a97d-3b5f2dfe003mr8713911f8f.33.1752475901432;
        Sun, 13 Jul 2025 23:51:41 -0700 (PDT)
Message-ID: <2f6be368-9459-47f4-9450-2d6d0912b436@suse.com>
Date: Mon, 14 Jul 2025 08:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] misra: address violation of MISRA C Rule 10.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>, dmytro_prokopchuk1@epam.com
References: <41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro_prokopchuk1@epam.com>
 <03612a12-e905-4487-a05b-a5307e450308@epam.com>
 <alpine.DEB.2.22.394.2507111457430.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507111457430.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2025 00:00, Stefano Stabellini wrote:
> On Fri, 11 Jul 2025, Dmytro Prokopchuk1 wrote:
>> Hi All.
>>
>> In this 2nd version I made changes according to the
>> https://patchew.org/Xen/d92cf08a64d8197a1d1a45f901e59183105d3da5.1752183472.git.dmytro._5Fprokopchuk1@epam.com/
>>
>> There are 0 violations on the ARM64 as you can see in the report:
>> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/fix_10.1_rule/ARM64/10650097988/PROJECT.ecd;/by_service.html#service&kind
>>
>> Jan mentioned:
>> "As to the kind of change here - didn't we deviate applying unary minus
>> to unsigned types?"
>>
>> Here is that deviation:
>> https://patchew.org/Xen/7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com/
>> As you can see from report
>> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/deviate_10.1_rule/ARM64/10648749555/PROJECT.ecd;/by_service.html#service&kind
>> there are still 2 violations.
>> And they can be easily fixed.
>>
>> So, Jan and Stefano,
>> which approach should we select?
> 
> I think we should go with the global deviation.
> 
> Jan, if you look at the code changes on this series, many of them are
> undesirable. And the series is only addressing the ARM violations: it is
> only going to get worse for x86.
> 
> I think we should commit:
> https://patchew.org/Xen/7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com/
> 
> Jan, are you OK with it?

Well, I did comment on it, and I don't think I saw a re-submission addressing
those comments. But the way I commented I think it has become clear that I
don't object to the deviation, just that some adjustments are needed to the
wording.

Jan

