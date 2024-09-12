Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BB9770E2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 20:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797765.1207830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soona-0003Vn-Nh; Thu, 12 Sep 2024 18:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797765.1207830; Thu, 12 Sep 2024 18:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soona-0003TM-Jr; Thu, 12 Sep 2024 18:44:10 +0000
Received: by outflank-mailman (input) for mailman id 797765;
 Thu, 12 Sep 2024 18:44:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDyH=QK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1soonZ-0003TG-HG
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 18:44:09 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe526838-7136-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 20:44:08 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so1151483a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 11:44:08 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8cdf7sm6818672a12.92.2024.09.12.11.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 11:44:06 -0700 (PDT)
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
X-Inumbo-ID: fe526838-7136-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726166648; x=1726771448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ilgz7lMBCzQb4P9NCiDyBuB99A06BYkUqp+N7QI0nDY=;
        b=WeuUNnLUgu4i/k1T/lo01pyebtdPc5XAR41+SA5RUwNfvKToOtjS6Nzr6ONQ1NDeG5
         HssDEkEa+YbHtbhjnsh9D3q0QwHjrFzV1qvfyUCraGay1fQijlIVVIpFXfZqn+8TtRDP
         Dm0nMdCYPKGVBdNUZizv4txHUVktDQqseduOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726166648; x=1726771448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ilgz7lMBCzQb4P9NCiDyBuB99A06BYkUqp+N7QI0nDY=;
        b=U8+oxU4ZPbxgxrKtxA2M5BE6K9E/rt2VenbaHo0vWQOxj8lx8o/Bc8aFRwxUnF+yxP
         2wEOy/AW79yXnkUCHUt5PMEJlN1TyiHCiePE0nxfVaYEvK+HG8SjNFzUAbYzgmbpHC1j
         kTLDPQIbsBEunUJkw0anFH/HwanhlrZkLAW91OEMZAWWyz6gvNyVA1hnj/HCjzAT/Itc
         U8rvbLrJarUl+dWjdMFlyZBm7CbFKwWt5BKtyxTm7e9unkKvg8lnqlWg2G/GBU5LoWYE
         lk3UQaamFNTCrm21dRny97uX1M/yjlOR6R3ovkEISNnshwminYRb3kJC/WL2e8ysWb1i
         4J6A==
X-Forwarded-Encrypted: i=1; AJvYcCWW1p0oPhBiwMeOLcYe/TkIGT+rtjcm9Az3jE3Zml5noA/tXaKZlikOfKP144fE7ZSj5Q3BWSKz5EE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymuzaP4MuW6vuydEnb06R5fRpam86xHPnfMVqrc6Oe57Om8vla
	MeA2DaXm8XeOnR9TfMtLUojAUvmsAODUU5sIX0p4DP7dCbbx0Ecag8QgJf4AKjI=
X-Google-Smtp-Source: AGHT+IHVRu9ApD05Kx6SMO8rwf4GfcjT5kvw7cewb7eAVmD5EAk5CiWrDwyEU6xnnJx7h1d935JJeA==
X-Received: by 2002:a05:6402:274f:b0:5bf:2577:4346 with SMTP id 4fb4d7f45d1cf-5c413e1b2a3mr3480355a12.15.1726166647023;
        Thu, 12 Sep 2024 11:44:07 -0700 (PDT)
Message-ID: <49c43c98-a8b2-4943-af89-dfbf2030e478@citrix.com>
Date: Thu, 12 Sep 2024 19:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix two problems in the microcode parsers
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <06edbbb7831620bc04c6453b95aad80eaebb20a1.1726162000.git.demi@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <06edbbb7831620bc04c6453b95aad80eaebb20a1.1726162000.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2024 6:39 pm, Demi Marie Obenour wrote:
> The microcode might come from a questionable source, so it is necessary
> for the parsers to treat it as untrusted.  The CPU will validate the
> microcode before applying it, so loading microcode from unofficial
> sources is actually a legitimate thing to do in some cases.

While true, the better argument is that ucode blobs are mostly encrypted
data, so a mis-step tends to fall over a very long way.

>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  xen/arch/x86/cpu/microcode/amd.c   | 1 +
>  xen/arch/x86/cpu/microcode/intel.c | 5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
> index d2a26967c6dbc4695602dd46d5836a6d88e15072..31ee5717c5f1c7d0b7e29d990cf4d1024d775900 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -338,6 +338,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>          if ( size < sizeof(*et) ||
>               (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
>               size - sizeof(*et) < et->len ||
> +             et->len < sizeof(et->eq[0]) ||
>               et->len % sizeof(et->eq[0]) ||
>               et->eq[(et->len / sizeof(et->eq[0])) - 1].installed_cpu )
>          {

This is complicated by AMD having no spec in the slightest on their
container format, but this change makes Xen reject a case that I
reasoned was well formed (if unwise).

IMO, the following binary is well formed:

    0x00414d44 /* MAGIC */
    0x00000000 /* type=equiv */
    0x00000000 /* len=0, == no entries */
               /* no equiv entries */
               /* no ucode entries */
    0x00414d44 /* MAGIC */
    ...

and I believe that Xen would parse it correctly.  Unless you think
there's another case I've failed to consider?

AFACT the check you put in rejects the len < "1 entry" case.

There is no shortage of ambiguity here; the equiv table has both an
explicit length, and commonly has a NULL entry at the end.  But, we can
parse with a length of 0.


> diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
> index 6f6957058684d7275d62e525e88ff678db9eb6d2..7a383adbdf1b5cb58f2e4c89e3a1c11ecc053993 100644
> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -158,8 +158,9 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
>       * Total size must be a multiple of 1024 bytes.  Data size and the header
>       * must fit within it.
>       */
> -    if ( (total_size & 1023) ||
> -         data_size > (total_size - MC_HEADER_SIZE) )
> +    if ( (total_size & 1023) || (total_size < MC_HEADER_SIZE) ||
> +         data_size > (total_size - MC_HEADER_SIZE) ||
> +         (data_size % 4) != 0 )

The caller has already checked some properties.

Furthermore, total_size of 0 in the header is a special case for
pre-Pentium4 ucode and is substituted with a constant, so can never be 0
in the variable here.  Therefore, I don't think the (total_size <
MC_HEADER_SIZE) check can ever fail.

data_size being 4-byte aligned probably should be checked, although I
think the later cross-check (ext_sigtable fits exactly in the remaining
space) should catch this before the function wanders off the buffer.

~Andrew

