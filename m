Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E8960624
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 11:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783728.1192989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sismx-00053x-5r; Tue, 27 Aug 2024 09:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783728.1192989; Tue, 27 Aug 2024 09:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sismx-00051L-2Z; Tue, 27 Aug 2024 09:46:59 +0000
Received: by outflank-mailman (input) for mailman id 783728;
 Tue, 27 Aug 2024 09:46:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sismv-000519-HK
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 09:46:57 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bd648d8-6459-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 11:46:56 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a869332c2c2so790068266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 02:46:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e591c02dsm87008966b.190.2024.08.27.02.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 02:46:55 -0700 (PDT)
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
X-Inumbo-ID: 4bd648d8-6459-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724752015; x=1725356815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eIoIoHLa2JQdDhqAZqitQCP9+IuDlVnN+vIvehtqhc8=;
        b=PZV0c+w/wdjX+0KkF/dFO+fR6L/laPlCoBYENwA9X7gsV5Yy5n6HfalJ5Uh8P/9FL2
         1yEhcVTsxfee7lP1CAqQhPXNMJM1rQLuePfAfnQhC61qg/SftnsI6Do+iH0blN6BO3rI
         hNW3eyGL28W2dNCarXkG/0MYDCVJvDAVbesBRpsYCP88MewkH2Z7h+Yn1dRboQ5+1Ow2
         j4pK74gCpn4IBDGb39kVkADNxdDzZK6OUE9EEtN/EeLH3PaL7Pa6dSdlgYZYuL9YQ7VE
         Fzd+lWrgu77GHx13mKuudfUt8VbDxwwk2emJ3F4JZVnTQHsWVI9GjauZCEmTNB6OygTg
         I/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724752015; x=1725356815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIoIoHLa2JQdDhqAZqitQCP9+IuDlVnN+vIvehtqhc8=;
        b=wluveBH3m3bScTofwIznno596gpjSvMEJPhmwz+Ab8HR9ZPCTtrO7CVMdalXLRypH6
         WjOzyvOghfXutLli1M/sVgTaVZ+MVDON/3L+ignHq+zMnRVJuRghJymYtZhWEJSSZqmE
         CYUwQpKi9t9PZdBGwF/kKidKLPZmueo6nd08qc4xC7FQTl6gmTC0j8yvEg3Q5naxxcI9
         YVnDPKTvl+tS08HRBdBK68Mv+aCHOg0QrI8cwITGSOqm0LAgvMK6o2RH+6Sz0g49aJvi
         HpkHKx3wrLv1ejzEZhpf6ye/t2RvcB/o0Q/eT+g0yJy7iHfzvvNDHBYOi93+hMZ7hJaY
         2knw==
X-Forwarded-Encrypted: i=1; AJvYcCViKrWa7gGqH3eX5L/PYHbYlvTt2e8T12lFRTkwY/ZfVkW06NRZHV+ROG+68JbPg3LfiXtAunoQHWY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyY/DYk6PlgQR+Q5qrweLnJIWpXK09oKG4bBLY9rir/oh1jIHjy
	8vTvSYpMzGYuMWW7xP4ncYgCrb63hgAYwUkGw1x3SKaDWeeATvXE4fbvMW+rXw==
X-Google-Smtp-Source: AGHT+IG6AxG7GvirtspYc0z6mWtbsSTyxK3cog09fuVGUxVsaC0Z/oQu/m891jmI68+/ZQxCAm9Cjw==
X-Received: by 2002:a17:907:94d0:b0:a6e:f869:d718 with SMTP id a640c23a62f3a-a86e29be930mr238103366b.21.1724752015362;
        Tue, 27 Aug 2024 02:46:55 -0700 (PDT)
Message-ID: <9c0f6be6-2685-43b8-89ef-b5be3100cf62@suse.com>
Date: Tue, 27 Aug 2024 11:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/efi: Use generic PE/COFF structures in x86 efi source
To: rtrk <milandjokic1995@gmail.com>
Cc: oleksii.kurochko@gmail.com, Nikola Jelic <nikola.jelic@rt-rk.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Milan Djokic <milan.djokic@rt-rk.com>,
 xen-devel@lists.xenproject.org
References: <6cf2799ced7dcee515ad8a6b6657522cdc7cec61.1724699546.git.milan.djokic@verisure.com>
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
In-Reply-To: <6cf2799ced7dcee515ad8a6b6657522cdc7cec61.1724699546.git.milan.djokic@verisure.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.08.2024 21:44, rtrk wrote:
> @@ -105,33 +55,29 @@ static bool __init pe_name_compare(const struct PeSectionHeader *sect,
>  const void *__init pe_find_section(const void *image, const UINTN image_size,
>                                     const CHAR16 *section_name, UINTN *size_out)
>  {
> -    const struct DosFileHeader *dos = image;
> -    const struct PeHeader *pe;
> -    const struct PeSectionHeader *sect;
> +    const struct mz_hdr *mz = image;
> +    const struct pe_hdr *pe;
> +    const struct section_header *sect;
>      UINTN offset, i;
>  
> -    if ( image_size < sizeof(*dos) ||
> -         dos->Magic[0] != 'M' ||
> -         dos->Magic[1] != 'Z' )
> +    if ( image_size < sizeof(*mz) ||
> +         mz->magic != 0x4D5A ) /* 0x4D5A is the hexadecimal value for "MZ" */

I think this is byte-order-reversed. The question is anyway why you don't
use MZ_MAGIC here.

>          return NULL;
>  
> -    offset = dos->ExeHeader;
> +    offset = mz->peaddr;
>      pe = image + offset;
>  
>      offset += sizeof(*pe);
>      if ( image_size < offset ||
> -         pe->Magic[0] != 'P' ||
> -         pe->Magic[1] != 'E' ||
> -         pe->Magic[2] != '\0' ||
> -         pe->Magic[3] != '\0' )
> +         pe->magic != 0x50450000 ) /* 0x50450000 is the hexadecimal value for "PE\0\0" */

Same here, with PE_MAGIC wanting using.

Jan

