Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90008A476C2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 08:44:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897857.1306483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYZX-000557-1R; Thu, 27 Feb 2025 07:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897857.1306483; Thu, 27 Feb 2025 07:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYZW-00052u-V0; Thu, 27 Feb 2025 07:44:42 +0000
Received: by outflank-mailman (input) for mailman id 897857;
 Thu, 27 Feb 2025 07:44:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnYZV-00052o-Ma
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 07:44:41 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b324bc8e-f4de-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 08:44:39 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-439a4dec9d5so6918985e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 23:44:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b736f75ebsm13773135e9.3.2025.02.26.23.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 23:44:38 -0800 (PST)
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
X-Inumbo-ID: b324bc8e-f4de-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740642279; x=1741247079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YsLr22eIy+C8o+NyADCrzMAUIJSRuRhyqwK+HDs72cM=;
        b=BHp76zlYufukALWW56otgUZ3rgCNR3xWu1ORbr/MRneQqfJ9O//GkZ8mZnAQRbor/C
         q7msFGuqrS3bFiv3UOmehnkUIl/uXehfV6huqfY9xBGcsZNLoUKsuCyV4rvE+DYZqhYw
         MJ24xeOUGRTr/gIHzi85pDRZhfHicYUQHWCpFzu5g07fpQ9miVad3olWOWF4TAJGccSo
         afKw0TKYqcdwS9OgLCT5CODqrcpEBZ/tEwul9eJE2ak2UXA/CzW+ACp+5WqzthVSCirZ
         b1w8wOjfx05XSVsA9OGDPFXtOt9ygBprnc0yhnHKbKOuu9fNdaE1uY6XSBGrBJzCYZXz
         xgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740642279; x=1741247079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsLr22eIy+C8o+NyADCrzMAUIJSRuRhyqwK+HDs72cM=;
        b=ALdHELL60BKR5vVhx6EqPZGzYGe88/hc+xfofKV8KSnG3BuMHLqMl/P1bwflPt8hRZ
         7G4t+dr9e0rnGqJSVyBLosOkJsgo7vuYPLPVP2Xu1e1LwID8KBp74j1XwLjFgzL7176+
         iCTfPJ+0KXRt/qdUwWUM5fSPj57Go+YOjEXewemcjkG/Yc7lz8r34aUvWhgJXvhRDbxE
         i/psBOQynfYY+21H7PDPz28f95ARDmyt8clmF7QxT/Lu93GBTdWGoxoszBP3O551vvLd
         WDwP/I+fNBgd35HBcWReo6cut3eAjis4ELuxvQXU1fB7X0N1P7NFY3VVnls9KwMAB31t
         EWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWth0hxQVRCiRvDTI7IV7hiX8kdPGGa0GXzso4bU8ah60F+JIcZw4vcTTvY9f5pI7q4gjTAbjlCdNI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaIMkcWPig4w40HI6dMrTdJlc5TA2leZIf7a0sbnnaKEaDQJYP
	t6obdNQhCrKt7x1DDOS/Aw9l//vxxo1YtFEjGX5621SuFnBLcJC3CcXL6o5FSA==
X-Gm-Gg: ASbGncvlHOzoSS0uvah9LSb1r0+PEMjZSz00FJfNBFyQz16KdYSZWJKAOzdeGP8E2BQ
	fsQygkbph4PWWxYOgEiHT8gRjhrtGCFMWwedquWzcq8Q6rh7xwyd+dtyw9GOrVsjirpQTUZk9fZ
	8RlwObgkwmjmZJW7avK9mKVamiPnj1gl64OtpEdTzwlsgH917elNBRNKzQjw//RWx59rVNPR1rL
	DSF3px+edgwxWlGs654lMlc+VK16pWZrp9M6MCdw6sNYlJCrs1N1lCzX0zuDfmkgbvLvNhwTNYv
	XB2ptmVvgkxF2x0V0w8JOhavb7cgX/zbkQdlcalOgjvSWsP3CTevVg3wYVcXCDC7gDChr9oYqbG
	A2TO3DBhRErg=
X-Google-Smtp-Source: AGHT+IGfsMaHrw+iMDq8DbI+AJixtCg2uTS+esPn7peiQ+rOFXsSizxjRMOdnTDfGNVjY61mwPnC0A==
X-Received: by 2002:a05:600c:4755:b0:439:9b39:b31 with SMTP id 5b1f17b1804b1-43ab0f2df0fmr105560085e9.8.1740642279271;
        Wed, 26 Feb 2025 23:44:39 -0800 (PST)
Message-ID: <933d52e1-3b78-4c1e-87ea-0620afac7997@suse.com>
Date: Thu, 27 Feb 2025 08:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/ucode: Drop the ucode=nmi option
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
 <20250225222905.1182374-3-andrew.cooper3@citrix.com>
 <4de478dc-fecf-4112-8e2b-a7f7a62344bd@suse.com>
 <83366a91-4768-4bb1-ae6e-112725ce84e4@citrix.com>
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
In-Reply-To: <83366a91-4768-4bb1-ae6e-112725ce84e4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 20:00, Andrew Cooper wrote:
> On 26/02/2025 2:46 pm, Jan Beulich wrote:
>> On 25.02.2025 23:29, Andrew Cooper wrote:
>>> This option is active by default, and despite what the documentation suggests
>>> about choosing ucode=no-nmi, it only controls whether the primary threads move
>>> into NMI context.
>>>
>>> Sibling threads unconditionally move into NMI context, which is confirmed by
>>> an in-code comment.
>>>
>>> Not discussed is the fact that the BSP never enters NMI context, which works
>>> only by luck (AMD CPUs, where we reload on sibling threads too, has working
>>> in-core rendezvous and doesn't require NMI cover on the primary thread for
>>> safety).  This does want addressing, but requires more untangling first.
>>>
>>> Overall, `ucode=no-nmi` is a misleading and pretty useless option.  Drop it,
>>> and simplify the two users.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Despite the reasonably large diff in primary_thread_fn(), it's mostly just
>>> unindenting the block, and dropping the final call to primary_thread_work()
>>> which is made dead by this change.
>>> ---
>>>  docs/misc/xen-command-line.pandoc |  8 ++-----
>>>  xen/arch/x86/cpu/microcode/core.c | 38 +++++++++++--------------------
>>>  2 files changed, 15 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>>> index 47674025249a..9702c36b8c39 100644
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -2721,10 +2721,10 @@ performance.
>>>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>>>  
>>>  ### ucode
>>> -> `= List of [ <integer>, scan=<bool>, nmi=<bool> ]`
>>> +> `= List of [ <integer>, scan=<bool ]`
>> With this (taking my comment on patch 1 into account as well) I think ...
>>
>>> @@ -123,9 +120,7 @@ static int __init cf_check parse_ucode(const char *s)
>>>          if ( !ss )
>>>              ss = strchr(s, '\0');
>>>  
>>> -        if ( (val = parse_boolean("nmi", s, ss)) >= 0 )
>>> -            ucode_in_nmi = val;
>>> -        else if ( (val = parse_boolean("scan", s, ss)) >= 0 )
>>> +        if ( (val = parse_boolean("scan", s, ss)) >= 0 )
>>>          {
>>>              if ( ucode_mod_forced )
>>>                  printk(XENLOG_WARNING
>> ... this function will want to transition back to what it was prior to
>> the addition of the sub-option, preferably adjusted to account for the
>> possibility of multiple "ucode=" on the command line, i.e. along the
>> lines of
>>
>>     if ( !strncmp(s, "scan", 4) )
>>     {
>>         ucode_scan = 1;
>>         ucode_mod_idx = 0;
>>     }
>>     else
>>     {
>>         ucode_scan = 0;
>>         ucode_mod_idx = simple_strtol(s, &q, 0);
>>     }
>>
>> That would then make patch 1 kind of unnecessary.
> 
> As said, I need to introduce a new option for the AMD fix, so it needs
> to stay comma-separated.

Right, and hence for the patch here
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Patch 1 may still need a little bit of tweaking, though.

Jan

