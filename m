Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430A996A33F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 17:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789398.1199010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVlO-0003ix-B8; Tue, 03 Sep 2024 15:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789398.1199010; Tue, 03 Sep 2024 15:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVlO-0003hK-6F; Tue, 03 Sep 2024 15:48:14 +0000
Received: by outflank-mailman (input) for mailman id 789398;
 Tue, 03 Sep 2024 15:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slVlM-0003hE-KU
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 15:48:12 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec47a439-6a0b-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 17:48:11 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a86abbd68ffso913351466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 08:48:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d8345sm707831466b.173.2024.09.03.08.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 08:48:10 -0700 (PDT)
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
X-Inumbo-ID: ec47a439-6a0b-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725378491; x=1725983291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HeNQYbUBfb/Gg1kFL8HnhasC49TcAnP+BkjQD31Va+4=;
        b=NneUQw/XnO8EF7SEow7Zb2IUmQy9RKlPjzMPeLxtGYOLAhKRifbANmVGNB4yWFkJth
         I4CkcBbUdC+7GAdqWmJy8FOu/yYITas9kdESsXOEl4wUXpmKUhOnXlFN5CiZD+hQDgZe
         FuMc/jfsKs19roTSD6Iz1dzXDsOUoRghxQQZa0YR533jRG34SllG9eoVg5XhZu/h4d6y
         lUgrlVIgq+YLrpW8HyLFmR1scMSLN5kEXPs8lDM8GytzqqJn3cCSroLOxFpPR56/vVxy
         j8fFAYqKSnVtOayLLXSpwc80uEaw/F1FWahEmguSgnyF+Wo42UbsPOoHHbD8KnJz7i7N
         2EwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378491; x=1725983291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeNQYbUBfb/Gg1kFL8HnhasC49TcAnP+BkjQD31Va+4=;
        b=AhdTEyxy0hJaVaWk4Pa8+G6kTN38KQOLxneb4PhzwAg+dwSK+ruP++Y///gn7TOimn
         J9qNuNfuoVrsepHl6m+Mz0UKSW8FJuPm1Jsu/FZPsS4kai7+t0vN3YFNlmOmAGeTk1Ax
         D15Oy9PSIAZAtFFyEX0P4OeHOR0J9is43d/OvUafctnQseF7gsgDv306gkaFy5fGQXai
         pYKK5Gggc6/rCtbxO6UgbVdF4Ifh7PbZeH8OkI4ZDiH22SayjfOoGhaCVNnh9k1q982i
         DUQWsPc5lyPkCUOvG1hd5zoDmWm5/qm08stPSIvpQ8a3TWYP4DiAumXCmOL/ukoLI0aa
         mXfw==
X-Forwarded-Encrypted: i=1; AJvYcCV8grwCEmPG47U9YscJ2j7JvXBf+J+BmsGb4F0CQKO+l467EFuf6+QpHGc/Z3Iw78BR3moq5bKYCis=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7LF6fyThVoqN2v4Z0QUCI1iSigh+LZapEUtB0P772NRVhIGxA
	egYlK+DQxLgtsYVsjEUawzLGMn4EA+NQBwOHe/269SwyjJkS4wHCXQkFjMwJtg==
X-Google-Smtp-Source: AGHT+IEXTbxPi3fWDBizrAdK+HdEofkhKs1kjNhyhC+TUNHMXnNVvqTUuvECfsBSKKaTOAAIwbzRYQ==
X-Received: by 2002:a17:906:c153:b0:a86:b9c4:a439 with SMTP id a640c23a62f3a-a89827a547fmr1957986066b.21.1725378490604;
        Tue, 03 Sep 2024 08:48:10 -0700 (PDT)
Message-ID: <66465a2a-f7a0-412d-b1af-98a28fd38472@suse.com>
Date: Tue, 3 Sep 2024 17:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] x86/time: probe the CMOS RTC by default
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-8-roger.pau@citrix.com>
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
In-Reply-To: <20240903130303.71334-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2024 15:03, Roger Pau Monne wrote:
> Probing for the CMOS RTC registers consist in reading IO ports, and we expect
> those reads to have no side effects even when the CMOS RTC is not present.

But what do we gain from this besides possible being slower to boot?

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -326,11 +326,14 @@ Interrupts.  Specifying zero disables CMCI handling.
>  ### cmos-rtc-probe (x86)
>  > `= <boolean>`
>  
> -> Default: `false`
> +> Default: `true`
>  
>  Flag to indicate whether to probe for a CMOS Real Time Clock irrespective of
>  ACPI indicating none to be there.
>  
> +**WARNING: The `cmos-rtc-probe` option is deprecated and superseded by
> +_wallclock=no-cmos-probe_ using both options in combination is undefined.**

Hmm, but then ...

> @@ -2822,7 +2825,7 @@ suboptimal scheduling decisions, but only when the system is
>  oversubscribed (i.e., in total there are more vCPUs than pCPUs).
>  
>  ### wallclock (x86)
> -> `= auto | xen | cmos | efi`
> +> `= auto | xen | cmos | no-cmos-probe | efi`

... this wants to be a boolean sub-option "cmos-probe", such that the flag
can still be set both ways (in particular for a later command line option
to override an earlier one).

> @@ -2836,6 +2839,11 @@ Allow forcing the usage of a specific wallclock source.
>  
>   * `cmos` force usage of the CMOS RTC wallclock.
>  
> + * `no-cmos-probe` do not probe for the CMOS RTC presence if the ACPI FADT
> +   table signals there's no CMOS RTC.  Implies using the same heuristics as
> +   the `auto` option.  By default Xen will probe for the CMOS RTC presence
> +   even when ACPI FADT signals no CMOS RTC available.

"By default ..." reads as if this would always occur, which I don't think
is the case.

> @@ -1560,6 +1560,8 @@ static int __init cf_check parse_wallclock(const char *arg)
>      if ( !arg )
>          return -EINVAL;
>  
> +    cmos_rtc_probe = true;
> +
>      if ( !strcmp("auto", arg) )
>          wallclock_source = WALLCLOCK_UNSET;
>      else if ( !strcmp("xen", arg) )
> @@ -1571,6 +1573,8 @@ static int __init cf_check parse_wallclock(const char *arg)
>      }
>      else if ( !strcmp("cmos", arg) )
>          wallclock_source = WALLCLOCK_CMOS;
> +    else if ( !strcmp("no-cmos-probe", arg) )
> +        cmos_rtc_probe = false;
>      else if ( !strcmp("efi", arg) )
>      {
>          if ( !efi_enabled(EFI_RS) )

And to request a particular wallclock _and_ control the probing one then
needs two wallclock= on the command line? And - because of the forcing to
true of cmos_rtc_probe - even in a particular order. Not very nice from a
usability pov.

Jan

