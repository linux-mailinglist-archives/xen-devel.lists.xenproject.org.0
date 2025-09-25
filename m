Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80225B9D951
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 08:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129922.1469616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fR6-00027u-3I; Thu, 25 Sep 2025 06:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129922.1469616; Thu, 25 Sep 2025 06:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fR6-00026U-04; Thu, 25 Sep 2025 06:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1129922;
 Thu, 25 Sep 2025 06:26:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1fR5-00026O-7m
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 06:26:35 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94083976-99d8-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 08:26:32 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b0787fa12e2so76523766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 23:26:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353efa406asm98043466b.23.2025.09.24.23.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 23:26:31 -0700 (PDT)
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
X-Inumbo-ID: 94083976-99d8-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758781592; x=1759386392; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=leNqK+DTF+M/jsIecEuMggMwHPT00Chc3JwzndCGorY=;
        b=KdJYJufZ9qp7vfRwIAryRoJKHvEKQkznLlptciBJMV3bfIxlhbonANkGGhWjwg0gxw
         TtU0JaExADi3RKaZ1NdoUA2IDsyfP6TTxMpX4c2D5TWsSQ+9rDKXo9Up0vs9MBI30h6X
         eg2vQEwsKHqhu4aHenWVLQxZa6OmZ5xsLa9p3KRUL9MAccRQyfFmKV2+t8PkAbsKwZPa
         1o6CSQ++vsF4tcoTyjNiecRGK0Hja+JnEV2M3/W7z0fqlE3dtrHlgJ8L/zk+1Pi296aQ
         VTOlhd/rh/+Tjga0F3+kqZ2EBN4rdA6E9zaOsE+652RmLUWNDhLVnTgIZ0tPTvz3yXta
         rOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781592; x=1759386392;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leNqK+DTF+M/jsIecEuMggMwHPT00Chc3JwzndCGorY=;
        b=T+19/41KUTLg278EtzgOdykhDbY2jafXI13MF/pD/2ihKj0USUm+7gyj1iHnt/VhUF
         7ftfiW+tpAd7oWudLcxLIBUM1Lta4Bxl2I+nSnBGiJzKIzNKKXPpUkZtTgxSQ8rMU3KV
         6YHtaJssV0cP38AgVNkRuHvfVxk4qF1Q5b2da8eCzNkTvsudxsAjqsjg0FJUcBBspmoo
         MPVKszmcdnDBNCYyIlczsy/jao5B8GKkE6GDLiS4DMLxWp0xpqxWqCPjCfaNaMM6RE83
         WQzGZJavmXE4VcSQ3hkYfCJtv3I2XnE6PZLRkjKIOl/1BnTQWuWA0VB8ZZCNYBaXijQk
         4Bnw==
X-Forwarded-Encrypted: i=1; AJvYcCVaXBZD9d2vs4fSy/iLaks9T+2+x9UwpdqALCLfqsgq4qx76sji6Rl9LF5PiPlHEjiNBeNEPnfYgPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVovJCPeYS8PmyxboC+js5Ut3eBAfdv+c9u0wiQsCKAN7S9ZHk
	THs+FBw1ku2E7f8nUFaYqDrdmjfkEGfI+m7D1Nzqmn+L79Kku27Wih37gcCKivHDCVIoZB6EHU+
	5kQs=
X-Gm-Gg: ASbGncs0smVkUYTOR/aGvvnPmGauYn1h9WFYhUGvL7UkXpq3WwxOrMkHYDpKLRyGeXm
	JX2ZA5pGbS9R7Is5FuzB/P6DpJHzbc5Xro1MMGd/czyFZhEu7qqi3J7PvWkbxlCWHD9RDxspJh0
	sP2vHpYBK9w3ERH9U3cX7e/V90o3AKOKU7k19Wx7lMg4dW4VOiv7NkoP0Xx8Wqoy/0P7fz5bBXd
	UoIc3Tcr3M74htDi86qnWEIuOe8ON0xxg+o/iH1TQ74YDrLSwmzA1b3QYnd9a0a5YkU4ocZio+m
	Kbew3M8MqUjTpiSTVwNOZ1eJ0VaFlOcGwqrGOKxxfOvWXON0pulZnOfw2RhVOlqu2f7XrKNetNI
	d4UySGvq4kB65a0iUKLZ/0iAP/zlo/4OFwtfaIId+3p7QKSpjxyPiQABZhi41YpXdFV4ZsPC00q
	n3I2ejY1c=
X-Google-Smtp-Source: AGHT+IET+T6aTzAz3NbyPXyZ3E7qw/l9Ky1FlVRdu9OSvPdReuRWU7hfTelxrQwR+YqhBu1vsebl/w==
X-Received: by 2002:a17:907:3e8d:b0:b34:103b:4846 with SMTP id a640c23a62f3a-b34b8d96456mr283652766b.25.1758781591964;
        Wed, 24 Sep 2025 23:26:31 -0700 (PDT)
Message-ID: <814501c8-94e3-4930-87ed-88e7506456ed@suse.com>
Date: Thu, 25 Sep 2025 08:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG.md: Update for 4.21 release cycle
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250924093604.17110-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20250924093604.17110-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 11:36, Oleksii Kurochko wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
>     to the baseline change.
>   - Linux based device model stubdomains are now fully supported.
> + - Remove libxenctrl usage from xenstored.
>  
>   - On x86:
>     - Restrict the cache flushing done as a result of guest physical memory map
> @@ -21,6 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Allow controlling the MTRR cache attribute of the Xen platform PCI device
>       BAR for HVM guests, to improve performance of guests using it to map the
>       grant table or foreign memory.
> +   - Allow to unflatten DTs.

What is this about? There continues to be no use of DT on x86, so without context
this feels pretty much meaningless to me.

> @@ -36,11 +38,20 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
>       Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
>       and 28 (Temperature Probe).
> +   - Basic kexec support to Mini-OS for running in PVH mode.

Hmm, MiniOS isn't an integral part of a Xen release, so I wonder if such really
belongs here. Yes, I also understand that there's not really anywhere else to
put such.

Jan

