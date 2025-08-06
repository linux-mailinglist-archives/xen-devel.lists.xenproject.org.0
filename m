Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D8B1C1E5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 10:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071365.1434836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZG9-0000CL-FT; Wed, 06 Aug 2025 08:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071365.1434836; Wed, 06 Aug 2025 08:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZG9-0000AP-Cm; Wed, 06 Aug 2025 08:12:29 +0000
Received: by outflank-mailman (input) for mailman id 1071365;
 Wed, 06 Aug 2025 08:12:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujZG7-0007Yx-Do
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 08:12:27 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1647b3e9-729d-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 10:12:25 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-af9180a11bcso155643366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 01:12:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c10asm1062969666b.116.2025.08.06.01.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 01:12:24 -0700 (PDT)
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
X-Inumbo-ID: 1647b3e9-729d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754467945; x=1755072745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx8uLocY6xe3UytX2F4Rvptq/M/J2zpDS+LZFN2L7CE=;
        b=YqiEkLAK02R6so3/KWKVm/xERlevu8JNzpA5jrT+K/uZJ1SeH69Yk0NQSOavfx/cPm
         j7jzjEb4pnCLnnLarOtKMPw0I0AI8JrwlPA9l+6B68Lj99hzKUZTZuZ3GA/rDKLc0XEF
         BHu+JpVOAS//kymAb8BNhbHFNOw7GhUoxTqxb9KbB5NpdR4Zuv45ecIjFGRe9LgAZGcM
         DP/YmTr9lvfNj8goIHFeA4XYxQUQLewLXIFybooIDzhUiPO0EYSmoSghDUoU5e3clIAt
         YWEB2HcfBrhZ88EhIPK4TbmOrDT6fa1nftTRSDWrlMq5F5QPMYFkzlHkBHkB6le+aGDS
         s9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467945; x=1755072745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dx8uLocY6xe3UytX2F4Rvptq/M/J2zpDS+LZFN2L7CE=;
        b=UE7VFphDUF+pQs/caNteqNGqZLV/pd6ojGkXgch0yZH896HOHOluQdIyLSInIfuaOK
         aKPc2Mrm3t72ei0D+Wvc0SBUAN6pD9oVZwp4nhuH25k0/UaIZYChGcmm/WMyg6Vygj/6
         1rL/FyHDtErdFGYl+TrwJ7zvHSYyZlHYx3drdr3GMpTHGmRl6o99w7cPssZ/MjAnQA8F
         6FlakMKekgwP7apsuwxoEBHlAfXOpIXqUkhEb4K1+GmORluMo4BambdKFI7pLrN0ppfl
         UL/4dAOjte0jfdbAb/A+OYO6saH1EMZsMg9XT6gatn3bMmj2DyO1NRmoxW9cCoY2+GeQ
         bFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYfQb9chS5atY4N0YvvZWsnYrXxGL3kX5TStpMihAV97XyqP2qyRMRoKYkaHXfQXaNSKfYMBtbP+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKDxtew90G+1y599XUy9ACy5DPdBD7tirAQawEhnQC0YaXNLzM
	A7YWoae6Ft/3lKiX+i7e2uO466giwLrHS8x4ZFRHTRyB7smbZ7jSM0BzLYipGwo5bQ==
X-Gm-Gg: ASbGncsyX7fZK5SIwAksKfeObm9TWxIwjXKmZ9N654GERH2uchbMDCDqsF24jnWo0Ap
	c0/k9Q1ZTJJVJHH58Cp1WWkP8CIF/Pzidw8R1VD9MN8nhlAgOu/8akFUDSGo4E2+Gn5WlzwLdWd
	dxpfPH7TrGX7cT4ttKdEr1A3zUda/E+q4X0XQzkCb7GEj/Fy/61+QrpMgM13bue7TeeuDjB8Fv2
	jKIKhtAc2W/PUEPqaFzkrDDzT+XBQLei4/lIChhZq2vvbrFVz2pJI7eeJWrVfc1saLsUyxFAcRA
	KkbwtEojsIWh6qRsNnNOQdFaDvowKXBcBNGH71VGpWEIfqgMZMqLTP5sTP8q0ido4bP5Vodan5P
	BsiOvn9kmJs2OTvy33uhe0xdlQBpBt/7//N0+kbJd7yxEL+Rk15vP6hdySYbXwth7YndIsLOi5I
	vOAYAVt/w=
X-Google-Smtp-Source: AGHT+IF+7XSAk5YrGxNpS8Ui0OQK2k0AvKglz8YhFVw1mxlMYPwGK9ckMiIabBz/QYCyHe5KaU4N7w==
X-Received: by 2002:a17:907:948d:b0:af9:6c38:c4ff with SMTP id a640c23a62f3a-af990915008mr187529066b.19.1754467945278;
        Wed, 06 Aug 2025 01:12:25 -0700 (PDT)
Message-ID: <f07b7bf9-8e9a-49b6-824e-0c3b346bebd2@suse.com>
Date: Wed, 6 Aug 2025 10:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.21 Development Update [June-July]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>, Juergen Gross <jgross@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>, "Jason Andryuk,"
 <jason.andryuk@amd.com>, Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 "Penny Zheng," <Penny.Zheng@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki=2C?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
 Mykola Kvach <xakep.amatop@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <gragst.linux@gmail.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
 <242a93cf-20f7-4fcd-8eef-6945af5d864c@suse.com>
 <03a1d0b8-facd-4c02-97c6-45fa694da0b6@gmail.com>
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
In-Reply-To: <03a1d0b8-facd-4c02-97c6-45fa694da0b6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2025 09:45, Oleksii Kurochko wrote:
> On 8/6/25 8:05 AM, Jan Beulich wrote:
>> Overall: There are very many items on this list, and it seems entirely clear to
>> me that not all of them will make it. I think it would be quite helpful to strip
>> down the set for 4.21 to some realistic subset. Maybe something to discuss on
>> the community call later today?
> 
> Good point, lets discuss that tomorrow during the community call.

Oh, right, it's only Wednesday today.

Jan

