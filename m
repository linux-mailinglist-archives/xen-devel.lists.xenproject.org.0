Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B2BA27AA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 07:50:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131004.1470251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v21Kl-0006LP-Jc; Fri, 26 Sep 2025 05:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131004.1470251; Fri, 26 Sep 2025 05:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v21Kl-0006JA-GZ; Fri, 26 Sep 2025 05:49:31 +0000
Received: by outflank-mailman (input) for mailman id 1131004;
 Fri, 26 Sep 2025 05:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v21Kk-0006J4-8S
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 05:49:30 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9118b182-9a9c-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 07:49:29 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-62fa99bcfcdso3524663a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 22:49:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353efa494esm304224366b.25.2025.09.25.22.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 22:49:28 -0700 (PDT)
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
X-Inumbo-ID: 9118b182-9a9c-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758865768; x=1759470568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lnvG1FMq1SWrhj6l5gEFEm0Eiokgh0DtQ0BA/ZHRrUI=;
        b=Zk9FgQS/RKd1UvIjHVmtw8ONqxgs+z79BWaEiQqoUFTtnYC3fs+Q4u9fiLKY9hMz1k
         wbcEeR0vus69xKapDsieaCQ0+N5bUKfrCkD6leJeQU8imKAtoVcXXdGlMHb848SbEPgV
         MLMCclyY26FiZyTdGLpl0etcytvPz4efJcnG62PTuxh1DeWyUlDhr1r4yjkjxB6wEsUi
         VLyRMYbuZctEhVFtloD0/L1rHCH9KqMtNKey4fRtdKqgsgVli9g1SFxRxradIYyIXX/f
         H4vjmvtqxvTmEuxe7Nz9ZjZDNtGB/bSM1djL0BBpxMQgC0yWJQPW0ttRbzx2rkJYOJtf
         5XTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758865768; x=1759470568;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnvG1FMq1SWrhj6l5gEFEm0Eiokgh0DtQ0BA/ZHRrUI=;
        b=eyx+6VxATMdaEaBR2BIZLIyihPARx1ngj9ThuTbAJFT/gNCSrvPztsYHCMlUXhTDgh
         bkd845J5mX1/fyCuJWjDU3aNTDnxVDm7GhWtrw6Ktgq7sJuZmshHnBDgYM0KL3AmmKCF
         La5FlZWJaU/WlQ7gySMyjybHseqaq9vd7bqlI1xUoIWeoUWdWs0iD+k1z3D15T0Y7Qz3
         9Tl1CDXSA0UbRayF8VYcARtMyd+qNqmFFnL1UdBA9guDT1s86iET+yNzrZtkB4y9vgCQ
         GAflYBUyKaNYyU+/qi+2KdUvBvfwp9IXy8ix2Gh9RfnJFyD+MZa8A4GhQpMSn6fynjS+
         tCSg==
X-Forwarded-Encrypted: i=1; AJvYcCXtcoTT0T0XXbAxPUZjsQUfHz4UviiRaduBP9OYIFHQ17TvfXzS0z4huemj6VAy6it9tIlDtvs51/4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjNDMOGm+93Y9DE1pXHEj7jS0A5wEetvckVcS8uGgHZ/fovM4f
	+6ZaBF7SmEFgBhqPd0+rhujwZ8C5Yyj1Mgl4AU7vqgNXhQT/RA4KU5eVr+ywml8P5Q==
X-Gm-Gg: ASbGncuANa/ddWYavs0YRrB0w5hCS2S2zV2Gcqpa8MKVzbhLwFLtM7FnN22wtIUtc8b
	BlYzTsWwUI1byeBXNFgNXoF03G72jLG/AkqZgSdzDOirDqYckwRr7elTikz+lFkIkMN5WqaR8RM
	wesRiMBITefoJO41eZLkcO6IGvaPLSt1gpHotpigV3WOlLA3v1ioupuE6imvOgmgcEuNy1FQBQW
	H27o6dSYT4rYWQOo9OouYIen5rqxKUymwv1aK+i9N2SVk8aBfqJ3vcnJ7AsYMKMb7yDkyD2Enx7
	Id81KVJn0N+V4YlTgKqsVTCyiIRzJSvVHuNzImN+E5f/GpIaTKjGY/wuxIE7H20iZlsByUA88cb
	YToptBZ4NECFKCan1pVVrkYHbqsFqdDexk6NLx4nlD3551vPI5jG47zgYjam9geF9OrrgWXd+FV
	CyilUkNpG+KRDcsUoKBQ==
X-Google-Smtp-Source: AGHT+IGRxONJWsWBYVkLgy2x/gdVqrEy8Hjsfs2zwBhI3CehH9je4dWluplYv3D1dDEP6MOLRDRz6A==
X-Received: by 2002:a17:907:9411:b0:b07:a76e:db6e with SMTP id a640c23a62f3a-b34b80b0fecmr622467266b.21.1758865768356;
        Thu, 25 Sep 2025 22:49:28 -0700 (PDT)
Message-ID: <68350569-4e53-4845-b3df-22ec15e4ee30@suse.com>
Date: Fri, 26 Sep 2025 07:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG.md: Update for 4.21 release cycle
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250924093604.17110-1-oleksii.kurochko@gmail.com>
 <814501c8-94e3-4930-87ed-88e7506456ed@suse.com>
 <97488f35-3f94-42b0-8443-4feacf3d587d@gmail.com>
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
In-Reply-To: <97488f35-3f94-42b0-8443-4feacf3d587d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2025 22:22, Oleksii Kurochko wrote:
> On 9/25/25 8:26 AM, Jan Beulich wrote:
>> On 24.09.2025 11:36, Oleksii Kurochko wrote:
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>    - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
>>>      to the baseline change.
>>>    - Linux based device model stubdomains are now fully supported.
>>> + - Remove libxenctrl usage from xenstored.
>>>   
>>>    - On x86:
>>>      - Restrict the cache flushing done as a result of guest physical memory map
>>> @@ -21,6 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>      - Allow controlling the MTRR cache attribute of the Xen platform PCI device
>>>        BAR for HVM guests, to improve performance of guests using it to map the
>>>        grant table or foreign memory.
>>> +   - Allow to unflatten DTs.
>> What is this about? There continues to be no use of DT on x86, so without context
>> this feels pretty much meaningless to me.
> 
> I am referring tohttps://lore.kernel.org/xen-devel/20250722000525.7247-1-alejandro.garciavallejo@amd.com/.

Sure, but what practical use does this have for anyone using Xen?

>>> @@ -36,11 +38,20 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>      - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
>>>        Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
>>>        and 28 (Temperature Probe).
>>> +   - Basic kexec support to Mini-OS for running in PVH mode.
>> Hmm, MiniOS isn't an integral part of a Xen release, so I wonder if such really
>> belongs here. Yes, I also understand that there's not really anywhere else to
>> put such.
> 
> I decided to put it here since we include information about stubdoms in|CHANGELOG.md|,
> and MiniOS is related to that.

Stubdom code is part of the git repo and hence the tarball. MiniOS isn't.

Jan

