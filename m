Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024DACAF289
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 08:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181195.1504284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSsGq-00057x-OB; Tue, 09 Dec 2025 07:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181195.1504284; Tue, 09 Dec 2025 07:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSsGq-00054r-Jp; Tue, 09 Dec 2025 07:36:28 +0000
Received: by outflank-mailman (input) for mailman id 1181195;
 Tue, 09 Dec 2025 07:36:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSsGo-00054V-OK
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 07:36:26 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3ade39f-d4d1-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 08:36:24 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42e2e6aa22fso2461017f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 23:36:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfee66sm29780376f8f.11.2025.12.08.23.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 23:36:23 -0800 (PST)
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
X-Inumbo-ID: c3ade39f-d4d1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765265784; x=1765870584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3v18lpERP1o7wcOW3vmFWjesG9O2e2jY0hgZwXFEjKM=;
        b=MyBeBGmJB7/ZXyAuFSddq9HgcAe3SbRwRzDNRBKDWGSEDi71A2aAxwBnnQQgNAuKFM
         u3SXdP/DKPI9+He3969RO4tUXayonWVfxH0tBi3yt5OYAx3ZoisA2ph0+OmXX5doX0vE
         B3dVNoHondM1NDTYeMcf/sHpSvCjLl1/OcPvYghgl3kko34eZNXkx/ueNEXKQW4Jia+r
         ZmL1xzlo7Dlbz8y0x/IJxukNXMsbmV7c8d7MDI4fruWPK2kAf71iYGdflyj0rYoDvBaI
         F7/CS5Snc0n8KO48mrjsK/IFC91FsFjnXDn9/LHpxjbZb2SW8Lp3gvDklKJOP12TJJEZ
         LGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765265784; x=1765870584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3v18lpERP1o7wcOW3vmFWjesG9O2e2jY0hgZwXFEjKM=;
        b=TH01a0pfE2ol23QsezBuRrjFGZhdt6OvlDFgEDL+yiBpvSa1SMK5w462MctilTkdrv
         KWtqB8vgWowFrwyjhq3M6GzSs/3hIISv/fIvuXtzZWT3rjL7ZwIHUuWFTEoLBL9m6KGt
         vr6LU8BbgSh8LctopFrmgdB2m81NZyWZFSAs3KDr57+sF9o05lZnsMpkdg5D2Mf8AzUM
         SzpfblQhslVdt37OkppyZrSaMO5HX85H5HQCrzURMBzcDsl3E9VYXkO2tyEKeiXmq7rj
         PxdkZ+j7dw/mbUplCyLRgGdmM06kbtwGX3kEXBRdzUlN1onsjnITQMeoqW9uv8Vgr96r
         Ny7g==
X-Forwarded-Encrypted: i=1; AJvYcCU8c2AX9liUlo2T8W3w61z7+r2tq2NenZriZp928iVL+JfprpYoTlC34aDemmLB1MMHAHnzMHZK7cs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxu1mpUXKipJOJNeaGUWhuXsoo9+tSs09L0eSYSVBIqBQA1jRY5
	LP/v4ocjHrNzvpipwtooevt5/DvOP3yVOhvwN0iVXFwH46YY9ZvH+00Dby+gYj496g==
X-Gm-Gg: ASbGncuRrzeBedVU67roSSC//g/ZmRlMc7c5zajCOb6u/69LDHz0Us0wzqIE+00QPmU
	e9lyo20B8E0kKRu1swysCybjAGDfz7pKbEME/9McR5yCWKYNPau35SEazsjuZO/eQD2zgFbAFw2
	tp4jSDoe8Id+iogIimCkSzKG+yspmgKQTmXrt+uEuqtZRPUU7OCkef1myqJSYf5O6akgE/vPvip
	46Yy2QfuzVbU+mnAoC+Duv67KLd+4otsfjSU0Yx4kf2BEX0AwnilkAA/iPrBk4ecahKcQYjL6AF
	fTccRL9s9rgsyQu01ZDIKuGea5dVrEx06x9GUc5QlfUdx06x4tAFfr+oFOrGyQBzFUADAd3A8SF
	kKE3XospMwsw/su3EqBMdt3JvggnglN5nbwdg/M/geEaYdc1TW1Sn+tGbJTERyF6vF1g6N/ZKaW
	vVDHnDtcd3rUxnfl/oLsrH/4xc02okRiOB5wLfezmYAmfds0wa6pU0FOLbc0F/+EnCw+7n9d1u5
	Qw=
X-Google-Smtp-Source: AGHT+IFVasnFPProKaZaTSKQ/Sm5uJSQnS56dIavADQxYgFdvmq2Xng1qIan0VtDIo5Pff0XvhOoTg==
X-Received: by 2002:a05:6000:1863:b0:42b:39d0:63a4 with SMTP id ffacd0b85a97d-42f89f62011mr12039132f8f.29.1765265784026;
        Mon, 08 Dec 2025 23:36:24 -0800 (PST)
Message-ID: <f922dad3-9e60-47ff-b4f6-f0ae87fd90af@suse.com>
Date: Tue, 9 Dec 2025 08:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20251205222813.277164-1-jason.andryuk@amd.com>
 <6c10dbc4-3247-4a0d-9953-858d09df08a9@suse.com>
 <1675a966-1095-4aba-af74-828e4c68e6b4@amd.com>
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
In-Reply-To: <1675a966-1095-4aba-af74-828e4c68e6b4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2025 00:00, Jason Andryuk wrote:
> On 2025-12-08 03:56, Jan Beulich wrote:
>> On 05.12.2025 23:28, Jason Andryuk wrote:
>>> When linking to create xen-syms, add --gc-sections to garbage collect
>>> unused stuff.
>>
>> What about xen.efi?
> 
> I tried briefly and it fails to link.  The GCC manual says it is 
> considered experimental for PE and COFF.

The gcc manual documents linker behavior? Do you have a more concrete pointer?

> I just added into EFI_LDFLAGS:
>    CC      .xen.efi.0s.o
> ld -mi386pep --no-warn-rwx-segments --subsystem=10 
> --enable-long-section-names --disable-high-entropy-va --dynamicbase 
> --image-base=0xffff82d040000000 --stack=0,0 --heap=0,0 
> --section-alignment=0x200000 --file-alignment=0x20 
> --major-image-version=4 --minor-image-version=22 --major-os-version=2 
> --minor-os-version=0 --major-subsystem-version=2 
> --minor-subsystem-version=0 --gc-sections --print-gc-sections 
> --build-id=sha1 -T arch/x86/efi.lds prelink.o  ./.xen.efi.0s.o -b 
> pe-x86-64 arch/x86/efi/buildid.o -o ./.xen.efi.0xffff82d040000000.0 && :
> ld: kexec_reloc is too large
> ld: kexec_reloc is too large
> ld: 
> prelink.o:/home/jandryuk/xen/xen/arch/x86/boot/head.S:60:(.text.header+0x48): 
> undefined reference to `start'

I see. This then would want mentioning in the patch description. And I've added
it to my binutils side todo list.

Jan

