Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B53DACF000
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 15:08:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006828.1386082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAKS-0002a6-BV; Thu, 05 Jun 2025 13:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006828.1386082; Thu, 05 Jun 2025 13:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAKS-0002Yi-8V; Thu, 05 Jun 2025 13:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1006828;
 Thu, 05 Jun 2025 13:08:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNAKR-0002Yc-9r
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 13:08:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25359a84-420e-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 15:08:17 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a36efcadb8so821143f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 06:08:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affcf84asm13224472b3a.130.2025.06.05.06.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 06:08:15 -0700 (PDT)
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
X-Inumbo-ID: 25359a84-420e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749128896; x=1749733696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wFmhZ5gAy3m/BfHmDeD8ut2hZVZXROiOoMPg6M67dR8=;
        b=PIxxGVNyZ/4DlkrgI2YsR4kp/4ls93bXlr1t9GJFlPJAqGUXV3fRu0aR6ThLfCkx6/
         cLCMHRr81mv9vpbcJHKBhfrR8C7khF7mvjd5tBGXDFNwLATY6IdLReSM5jGP/aYdTUFi
         SZ7CBsO+9l9nU8sJhypSeZxhKYZS0ofMzMAdCJZuw65qtnHuHLCNUkePZfMqvJW/L0BN
         PrxVOkdLgoE31Lu8KThMe48SjZONgbK9WCTwqFWFwf4tW0DQwmgiB2fziPeb28IMs3Ra
         cXzvdLYTtDP35TIi9+tV4JCfrpXc5xN73BKpa0gb9bWVe+tXc3/jyv2+gc+7tDnmdndv
         uvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128896; x=1749733696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFmhZ5gAy3m/BfHmDeD8ut2hZVZXROiOoMPg6M67dR8=;
        b=oIPPDsUptF7o0TgakG1aUGTZX0TiwbZUPoLDcGtSHXUi/tK4KHc4rmWmXK0+h98Vb9
         7MGf9OhYUhnZPVFMlI11bFvcGqLTOtzqyEdaQEIwJ2UBWyYojohj6Zp2ZAJ5jPQMjNlx
         1qTHtjVjVp5zQ+oczu6IN1snd6VL38QzhXT5FwEeQiWpaYU5TIdmdNc9FSFtkLcghHaJ
         Cu1gVA+2mtKMuVtwE7wUQru34HMPD33vZKze+ww4gvS3p76vVqzpNVsb4nZgOTJdkBvf
         7TuX/G19pD2UPFCBXZTjXSep2QaeJ/rJ810fqvrLET0LrgmFj1extvuDEdc7Rh99XbaS
         27Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVdn5i2dKvtAHYAq/Pr0Vlov8+yJ+Y9E1JbsSm8B1GEXKxP/vzxIiGfD1gr3dne3q16r5du5Pu8xhc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoBGkrXUF0cYxlqgsYDb3DSNj487uytO4IXvjGfvBK4wpTiVgk
	X4igHZNDO0vIxpUQJO0fCu3XWz4KWG0SxxL/D2xLTwyJ5cz6CzpMRRj4owHuG28Uig==
X-Gm-Gg: ASbGncvK0REzQ0ApAtJBd76bKIr7Zs5wedNwKJSGBgXwhSYeVHu8kjffb95iaYQY1OL
	vOjBDtAyN3rF1QE/lHftOeeOjZu3XC7d7EK/nmKWwO7sHcZNMw54u/5xiaos8bogyMoJozn7HL9
	6O9YZr7aP98QEgzR7/hZ5MfuxK7WASbdFYmlgcVCsELLTNPFXMBDBurmHeLl5feUtfQkTW7vc8W
	1lqTdhHfrHRkFozM9sM8kPpLgNxxUGoUjiprcvI7/KoVNMlbIShst3ldWQfiucuw3pXqVDbOfdb
	4axRI77P9VHHeC0M1DKgAGrEeyC6R7Rbjnkfp+kupS2n6d2pplasIR2mBlkh5PFVOFxjg9HjG7q
	dA/xtNjnaAvq6IzFKIq5V/Kw64dOnpPlSfraYcpJBC6mITVg=
X-Google-Smtp-Source: AGHT+IFOF4KmSNbYzhqpXnOOtBxXVvrGQHwcPOIv2mywKj+gjBNydfJ0xQOlcMtrTheFVJYyD4SwzA==
X-Received: by 2002:a05:6000:26d3:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a51d8f6075mr6515539f8f.11.1749128896130;
        Thu, 05 Jun 2025 06:08:16 -0700 (PDT)
Message-ID: <f2077d30-3324-4b86-91e5-54e3a6273c48@suse.com>
Date: Thu, 5 Jun 2025 15:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com> <aEGLjhw8kTXKbkdV@mail-itl>
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
In-Reply-To: <aEGLjhw8kTXKbkdV@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 14:20, Marek Marczykowski-Górecki wrote:
> On Thu, Jun 05, 2025 at 02:02:21PM +0200, Jan Beulich wrote:
>> On 05.06.2025 13:16, Andrew Cooper wrote:
>>> The format of the buildid is a property of the binary, not a property of how
>>> it was loaded.  This fixes buildid recognition when starting xen.efi from it's
>>> MB2 entrypoint.
>>>
>>> Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> I'll pick this up without a Fixes: tag, but I think it ought to have one. (I
>> didn't check whether MB2 or build-id support came later, hence introducing the
>> issue.)
>>
>>> --- a/xen/common/version.c
>>> +++ b/xen/common/version.c
>>> @@ -203,8 +203,11 @@ void __init xen_build_init(void)
>>>      rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
>>>  
>>>  #ifdef CONFIG_X86
>>> -    /* Alternatively we may have a CodeView record from an EFI build. */
>>> -    if ( rc && efi_enabled(EFI_LOADER) )
>>> +    /*
>>> +     * xen.efi built with a new enough toolchain will have a CodeView record,
>>> +     * not an ELF note.
>>> +     */
>>> +    if ( rc )
>>
>> Instead of dropping the efi_enabled(), I think you want to replace EFI_LOADER
>> by EFI_BOOT.
> 
> Part of the motivation for MB2 entry point in xen.efi is using the
> same binary in all boot modes, including legacy boot - in which case
> none of EFI_* checks would be appropriate here. The grub series adds
> support for loading PE binaries, and IIUC it isn't tied to booting via
> EFI.

"The grub series" being which one? I didn't know xen.efi's non-EFI MB2 entry
point could be used; instead I was under the impression that someone was
having (half?) a patch eliminating the MB data from xen.efi, as being dead
code.

Jan

