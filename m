Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C68994BA21
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 11:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773821.1184256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbzqY-0005Z8-Ui; Thu, 08 Aug 2024 09:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773821.1184256; Thu, 08 Aug 2024 09:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbzqY-0005WQ-Qv; Thu, 08 Aug 2024 09:54:14 +0000
Received: by outflank-mailman (input) for mailman id 773821;
 Thu, 08 Aug 2024 09:54:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbzqX-0005WK-3C
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 09:54:13 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29dc118e-556c-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 11:54:12 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7d26c2297eso89059666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 02:54:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3c9asm722903366b.37.2024.08.08.02.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 02:54:11 -0700 (PDT)
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
X-Inumbo-ID: 29dc118e-556c-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723110851; x=1723715651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J23X6oenTFAwiBGLPWt0/Ua9Rpl8VpLyrX8qu7BBaQo=;
        b=SkIVi2schZ2AfQEfzOzf7iXq8EIaA0JmvCKnApz0P/6c4RxDwgJKgi4iA96aUwVB/P
         FfyM1+LEK1ifegC2iwPbXEEFvg1+IAw2lX11DdSFj5pDcYeH1LdT64b8OrotZpD1ou3j
         aM9muhRkag57CX5toYb50DRG3bGtAGt2lRUdGPdQRWPPEsC7nixJx9b2ecqhDbHXaaBK
         V5Ekqon6wyfu9TdRt4TtGer3kWS7OktXszRzrSsQ6ljhFXcYtJY3HvK27UZZFplfQc5V
         44WcUjXEQLkgHDjxWtLXNl6wQvmMPWsP7G6qjm0eNqUBDDyUWq6Bko00+Lhu4NkU0hM6
         GHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723110851; x=1723715651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J23X6oenTFAwiBGLPWt0/Ua9Rpl8VpLyrX8qu7BBaQo=;
        b=XyQZ2w4NDxKDjuyg8lLGGb4/vHGAWi651GVZIuXKZgABSrfAyMR3HQVvjrhPD8uDGs
         y2RTNuiJ6eIS7WJWWGjVFFg3Inm3lgnmeif/fdIAFIqfarHOg2nZmUMHF5OcLZ/xHyEt
         Zs+sHAv6S+wQL8Nfl4rp4JANkSnz/blOPhcUvmOuLhq7YT0m0g1HCi1nNCim1RuBtd7E
         YJ+Un4hLdj9XiYEvPuhXku5OIyVShI6yvEAINIrnNPM/PeK6dLnoDNqH3VDUjRTSgGcJ
         p8h6yi7YfaZogIelrbnosJC2rqYbmIYrz+hwSj5p8DeG9wiTNsBsU6Y3/NpJFqj0kJk3
         +6wg==
X-Gm-Message-State: AOJu0YwIWuABFgIeMp1e83gi16AUeKSKRLt/M+47BM2FveSXrcHQJU9p
	xFif4jGP9Bp3/6XFyQi4rX7YLt4hyEx4nQykpHjgXc406k1yae0Bhhc5wlRuww==
X-Google-Smtp-Source: AGHT+IEcMISohg+tHiNs71em6Sf42o6qQqOxQuJNgBTJmC37Ir3GhCAvYe+1F7siHgz8UACrNqC9pw==
X-Received: by 2002:a17:907:1b27:b0:a7a:9447:3e8b with SMTP id a640c23a62f3a-a8090c82a6amr99222666b.25.1723110851292;
        Thu, 08 Aug 2024 02:54:11 -0700 (PDT)
Message-ID: <a1929a39-6b63-4ea4-9e09-886a82166d39@suse.com>
Date: Thu, 8 Aug 2024 11:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: slightly simplify MB2/EFI "magic" check
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f2186827-62e6-4b24-8a6c-0c2a9499c232@suse.com>
 <CACHz=ZiSJxdv_jVuE8sq6=JVcpXerKD0-TJxvium++8jpQEnsw@mail.gmail.com>
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
In-Reply-To: <CACHz=ZiSJxdv_jVuE8sq6=JVcpXerKD0-TJxvium++8jpQEnsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.08.2024 11:36, Frediano Ziglio wrote:
> On Thu, Aug 8, 2024 at 9:49 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> A few dozen lines down from here we repeatedly use a pattern involving
>> just a single (conditional) branch. Do so also when checking for the
>> boot loader magic value.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I further question the placement of the clearing of vga_text_buffer,
>> just out of context: Shouldn't that be placed with the increments of
>> efi_platform and skip_realmode? Or else is the terminology in comments
>> ("on EFI platforms") wrong in one of the two places? In the end, if we
>> are entered at __efi64_mb2_start but the magic doesn't match, we simply
>> don't know what environment we're in. There may or may not be a VGA
>> console at the default address, so we may as well (try to) write to it
>> (just like we do when entered at start).
> 
> I don't think __efi64_mb2_start should be ever get called by anything
> else than multiboot2. Was EFI supported by multiboot version 1 maybe?

No, there was no EFI with MB1.

> As far as I can see we will print an error and halt the machine so we
> expect something really wrong to have happened.
> We could indeed be in a position where we have VGA available. Or EFI?
> Or not? As said something really weird and unexpected happened. Maybe
> the safer way would be to print on serial and try to print on VGA in
> this case. At the moment we mix the 2 prints (each character is
> duplicated), printing all message to serial and then trying to print
> all message to VGA and then halt could be an option.

Sounds like you see something wrong with the "mixing" as you call it?
I'm suggesting exactly that: Try to output something to both possible
channels. Whether there's serial at the default port we don't know
either, after all.

What we kind of know is that we're in 64-bit mode (yet even that could
probably do with verifying, when we already have to assume something
is very broken). Even there I'd expect the VGA range to be mapped by
the identity page tables that our caller must have put in place.

Jan

