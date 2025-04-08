Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CEAA7F79A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 10:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941571.1341031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u24An-0000sR-A6; Tue, 08 Apr 2025 08:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941571.1341031; Tue, 08 Apr 2025 08:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u24An-0000pg-7U; Tue, 08 Apr 2025 08:19:09 +0000
Received: by outflank-mailman (input) for mailman id 941571;
 Tue, 08 Apr 2025 08:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u24Al-0000pa-Rg
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 08:19:07 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20f91b99-1452-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 10:19:02 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so33274215e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 01:19:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795243sm158691225e9.32.2025.04.08.01.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 01:19:01 -0700 (PDT)
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
X-Inumbo-ID: 20f91b99-1452-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744100342; x=1744705142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/BOlXnJqy6WPPz8PyZ03GnhoMg9nLwJQOZ9ItVxfCS4=;
        b=GoF41IXO3Lek5khwflVgXqoz2AMFpaqpngF9XsNpUOLXGWnCDXQz+Sl4DnweUi+LXD
         GcIkYcILiJjfJBQKsrw09lajMrndSWHY2BBctcfkqgH1r+rdYKQ2mFK8bAXtAImhiHj6
         HcTAepZoUeZZPkHd2IqbAN+lAQdLO6xuRwsK6P9JZrorcrvUjwj1uqVJdBGMYemNuZNh
         XuLDlSFzJvXgX61t5A0UTaKBLCdSsqiHyWjfWePKEfrjBrCswLKRXW5eC+pVt0IRutgF
         cMk8hHok+XgTRBfK/CqBa5aLstorjKJwxoi5kL75WmSy8TWaIXtpFrcKwBMDc9SL8wzm
         PeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744100342; x=1744705142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BOlXnJqy6WPPz8PyZ03GnhoMg9nLwJQOZ9ItVxfCS4=;
        b=FTzty2Ypv+kRvzu8mwhYcLu1KJf0SeF8WGM7M3V/A0vajqAFynIiDD3pZv3lzKDtg0
         1YR35JBw7nIeW1BJpHBTL9if1JqRWyyKH27VT4qdl0Vg/+XflJaRoN6ubDIxpyZbjF1W
         kydC5I6+F212p5VhZ4/fprW0krnpPAuSXnzd79XX6VRDRkjGm2D7m70krY+D3miTfhhH
         OfRw5BMM1ci4cwMtSEacHY4y45c5f4j+RdtHwAIII7X+gCN+/uQb1eQs+sxiypp4Q0yQ
         bKhES8h9Mi2cimaQx6MYiIHro4PZuuNSOF3bu5wQfnkCxmvArG4VeB/8zvBGURUlcrEa
         sewg==
X-Forwarded-Encrypted: i=1; AJvYcCViV+909A8IgvNmRW7BqhtSooDRoZmuXXYgznA6qbl+88d8x7maxm9/ca71urUstiJH8GwPb6jSjMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9zOK0ouR5Tg7pxTtJ/oaaNFgOn2EtzUD8y2Hs7/7qiNdYZ/Oy
	csMrQTS5Gdke5CTgEpCduJWJEk0RzVFkCW1wi026dbld7jKhOvM5k+VIudsvIg==
X-Gm-Gg: ASbGncsXRIeGnorv5IQq+0UlFEPXknU+N3DdGne2OlRL+XTV+2Wacf6Ar3ueN42bzSP
	FQxV33zq5wqr4S6RlML7THV56Ecys9sN4W0kMCwyFKSYGbR/D5qfDp8rFDKOE1TWF8Bim6kfPDB
	ySVoKcjROmRI0i5jHU+VTQ5Mjmtkb/U7tYWMW2j4F9vvgopjbNxw5gnWCPYFXioFOWW5cR4H8gW
	36pl5AZFEyJdRaIipDTyk3VFi1GIOda8Fa94zWLVub3rI5eoMSTIjwy4E6bNvdO3N8ZByRZSnUQ
	WtJw+s4JpXXY3XMuYx8vk+y33d7yQ4e2b5GLbPFIcD1c3ki3ld5u/notIDE7JIpvWPl/R1YkEUV
	ZR3FhnZqE5xJg5iYq4qAConKslEpO+Q==
X-Google-Smtp-Source: AGHT+IFpNS9t7CEGtvmvNlNQyAxkYYfjyp80ls4XP3DYQtvnBiDocE/F+Ftdnz95Vkkxq0Vsd6JBXA==
X-Received: by 2002:a05:600c:83ca:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-43f0e442cf4mr20255865e9.0.1744100341713;
        Tue, 08 Apr 2025 01:19:01 -0700 (PDT)
Message-ID: <694d554e-0919-425b-9e62-b7ecf7fce421@suse.com>
Date: Tue, 8 Apr 2025 10:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] x86/EFI: prevent write-execute sections
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <c686844c-4cb8-43d0-a762-7f93a30f9388@suse.com>
 <Z-vpoh858ldjXok_@macbook.local>
 <f71c3298-24df-4d6f-b73c-382d4a112e01@suse.com>
 <Z_TWm1rll_0PyzNQ@macbook.lan>
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
In-Reply-To: <Z_TWm1rll_0PyzNQ@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.04.2025 09:56, Roger Pau Monné wrote:
> On Mon, Apr 07, 2025 at 04:04:18PM +0200, Jan Beulich wrote:
>> On 01.04.2025 15:26, Roger Pau Monné wrote:
>>> nxcompat should be enabled by default I think?  I can of course make
>>> it explicit by adding to the PE link command line.
>>
>> --nxcompat wasn't the default originally, then was made the default for MinGW
>> (and by mistake for everything else as well), then it being the default was
>> undone for Cygwin. I've meanwhile submitted a patch to undo it for everything
>> that isn't MinGW [1]. I simply don't think the linker is in the position to
>> declare that every binary is NX-compatible. It's the programmers who have to
>> determine that. With the flag not being honored everywhere one also can't
>> simply test an EFI binary on a couple of hosts, at least as long as the EFI
>> implementation there is a black box.
> 
> I think I looked at this reference:
> 
> https://sourceware.org/binutils/docs/ld/Options.html
> 
> When saying that nxcompat was enabled by default:
> 
> --nxcompat
> --disable-nxcompat The image is compatible with the Data Execution
> Prevention. This feature was introduced with MS Windows XP SP2 for
> i386 PE targets. The option is enabled by default.

Oh, I shall correct that, too, then. Thanks for pointing out.

Jan

