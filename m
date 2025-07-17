Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C773B087CD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046349.1416670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJr0-00082B-LA; Thu, 17 Jul 2025 08:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046349.1416670; Thu, 17 Jul 2025 08:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJr0-000802-IM; Thu, 17 Jul 2025 08:20:34 +0000
Received: by outflank-mailman (input) for mailman id 1046349;
 Thu, 17 Jul 2025 08:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucJqy-0007zw-Ak
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:20:32 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e68aa389-62e6-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 10:20:30 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so4532575e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 01:20:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f1e684csm2925952a91.12.2025.07.17.01.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 01:20:28 -0700 (PDT)
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
X-Inumbo-ID: e68aa389-62e6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752740429; x=1753345229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=geKR715iJ7gFd7gnQKtGo0EnVDiJNb4K4Qaqsx3jdxQ=;
        b=JkWPWOQXikvTSq/wG7lTCic4TBJSWMZDRaoDUals6tjwTefmf+igNt1Z2gfHAYJi91
         M1hBgYrXwBLHjMeaR3Dztj7tJca0nKOT3CEcpgugb5+QyPCjJpS88ZKZqz6lCZBYnLZ1
         MiiQ45yCoae1PjU+yYlkXEtbKlbMEES0OGNx+Go0Z2T9waPzwY5FxCtX3DEBk0wUdM7e
         wrJGT5S1VquJcCI3SyJeoIgYhDapKH6AZurQKCyvGaBHVleJkChsP2PfEvpL8N/ul7NV
         /rMRi+WlrkJYsoCSaLsOvgrTbISJv20dWBFut+VvBznf1yN8WEdlwFFf3K/vR4Z1/o5d
         tQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752740429; x=1753345229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geKR715iJ7gFd7gnQKtGo0EnVDiJNb4K4Qaqsx3jdxQ=;
        b=vF9zpBYPaVMlRoFdEbvx0fotNI8PP+mi1WOKW9W+xeUj49SXIRhMmamKT8danYT9as
         XPt+hkVxaeTkOnT+UEBhoTLs4G7kWglDyYKezp/rhmWdXkFEWPwtmHq1YOHwNKJLADIx
         eNBrwXPmz1FY1KQfZINR2Q34ZWoWu62y7TgE+YwUNE/IkrpwaOdUju/m1wm+wIQGhMxT
         CvfT1XkGyMBxn7Bz2ONvjyXwMh0tlGfS9JySz6S4ZIsn0Ql+Pbuw2TDen5QZshMjxMZ8
         kfaIPQFrDKS6WgAH2pUf+tXGP6cIhdZaDQ7FCkwoSpp2UjbbnGHlvwaQV6DHtdfYgKHa
         ZIJw==
X-Forwarded-Encrypted: i=1; AJvYcCWwmWuzeweCl4ZF2oD7AGVY3i9gTAtpscprqv9uN5D1XDa/ajTnI3MFD4gdewo84ja5QnCV6a9P0jg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjR/q7RpM88sMXYq7aj/pDfErkkIq0WCQh3k+cromAXgcNIcni
	7uxjiqYsxusRDq2z/R4bEEUjpbe9Fjd6aYcWX70nmr7eO1Vm4XZStavn2gZ8TmiHaZhNbcKfsM9
	TnrU=
X-Gm-Gg: ASbGncvVmeHrHfzlW82n0+ejnEq85oU0h/waudMcObE3M36FqXlHFeGu6AJF+VsPag8
	e0FHwgHybybzdHTtl5/R4UDwf+uFxb+i3NHqyDvadddhWJ/Q1nHndmhq6SCyAhoimocmFNWOqO6
	v97DILZcKrvG4BownEuNYo5L9PtwqUvz84vc2BVTTqkyoBUfCPkytD/TdsRkpDDxSzXH5Hm78+/
	qj+Jdq5iqu8QfNUdkcYmd8IsXkvej2W7pImmO/S+1cXzsnKzMiEfmx4SrEzJ0CeGyy7JZDDj2Gc
	EBpj62dWfKoZ96MTtnFCNc4o3yUbXYwrx3kvd1VozL58q6wErjHEj1OmzUI2fkrkafbqEmYrKgq
	LJVcj7yxCxqGRWATqZ0FDY/NSSzdmHV7hnCaloEUbgcypzBXAeztyE+FRUfiYf3xyPHK+O6FfYe
	XXz4dRoR0=
X-Google-Smtp-Source: AGHT+IHkdx8r5s+j/+8K/ScEFX9lTGy8gmjO/3FT9ybPytNO6J3wB00mTl1dOoSvgiUDdtOjrvDVsQ==
X-Received: by 2002:a05:6000:2901:b0:3b6:1ed:9ad2 with SMTP id ffacd0b85a97d-3b60e51b8bdmr4832812f8f.42.1752740429327;
        Thu, 17 Jul 2025 01:20:29 -0700 (PDT)
Message-ID: <2e1d2e67-ac14-4cb7-a6ea-4351d1418be9@suse.com>
Date: Thu, 17 Jul 2025 10:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen.efi has MEM_DISCARDABLE flag in Characteristics field of
 .reloc section
To: Yann Sionneau <yann.sionneau@vates.tech>
Cc: yann@sionneau.net,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>, nickc@redhat.com,
 Demi Marie Obenour <demiobenour@gmail.com>
References: <39104717-4b64-483c-b6fd-d30069df4c58@gmail.com>
 <7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com>
 <7a7f40b8-5d73-421a-9358-30421d12a243@vates.tech>
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
In-Reply-To: <7a7f40b8-5d73-421a-9358-30421d12a243@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 09:32, Yann Sionneau wrote:
> Hello Demi Marie, Jan, Nick, all,
> 
> Thank you Demi Marie for bringing this topic on the mailing list.
> 
> I discussed it a bit with Jan on Matrix but the situation is not pretty, 
> there is no clean solution that stands out easily.
> 
> As Jan said, it seems .reloc is meant to be discardable, so we can't 
> blame binutils LD for putting it:
> 
> https://github.com/bminor/binutils-gdb/commit/25c80428af3311e761c87d8f706596b9701602ec#diff-078cf751467928c038996b40073a682425712b9b01182424e68cf18fb08a75b5R953-R977
> 
> And we can't obviously blame the loaders for honoring this flag.
> 
> Most reasonable solution indeed would be to ask binutils to add a link 
> flag to say "please do not put the DISCARDABLE flag on the .reloc section"
> 
> I'm adding Nick Clifton from binutils in CC so that he can comment on 
> this possible outcome or any other possible solution.
> 
> In the mean time, while waiting for a solution to emerge (and be merged, 
> and released) what do we do?
> 
> Do we put some hack in Xen build Makefiles so that xen.efi is 
> post-processed to strip this bit?
> 
> This could be the temporary solution.

As indicated - I don't think this is just a temporary solution. Beyond Xen,
I simply don't see value in adding a linker flag (which then, sooner or
later, llvm would also need to support just for Xen). The question rather
is how to make the Xen side hack as little hacky as possible, without
relying on the fragile behavior of objcopy.

Jan

