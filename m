Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OUjZHPuAImqVZAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:55:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D2D6462F1
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:55:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=BgI0i2lz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1329139.1593346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPOg-0003ac-C9; Fri, 05 Jun 2026 07:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329139.1593346; Fri, 05 Jun 2026 07:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPOg-0003Yk-9J; Fri, 05 Jun 2026 07:55:18 +0000
Received: by outflank-mailman (input) for mailman id 1329139;
 Fri, 05 Jun 2026 07:55:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVPOe-0003Ye-RL
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:55:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPOd-0050jw-RD
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:55:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2280d2-bab6-0a2a0a5309dd-0a2a45088938-44
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:55:15 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2280e3-63b5-0a2a45080019-d1558033b480-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:55:15 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso18408035e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:55:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc413541sm139258255e9.14.2026.06.05.00.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:55:14 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780646115; x=1781250915; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xemTQrjJIL7wnMPSHNgom6Eq+r4qH97OnpIubMDnK48=;
        b=BgI0i2lz6ttuQhs+0EA3VkjzxTL76/xY7RF/lp+rR3Hks1Plw5jztuoB6iMZMZpfZG
         9q80EAwJcxmoLYRDQqgn5DYxIUhlkeuFyiIRN4Me1Cw/Bpp6OzZmrDUTKuE94Wdc6xqf
         DBR2kKGKLtw20Sd/XzjRPPvUwh2g19h2gX0zWkipa0bFtUxsHBmLqtVd/D97iGvQgtdb
         ytyHJRz1TrjVK/a/39VT6bMzdzgEx5kvw+ZEFYFBOu1KI4qs/7lugFzBNp0ys5UVx8Iy
         Bp3oyDP9z5zvy12xGZzNHzWDkydKWVp427jjQusB5WZNYEIkAju2n4IfUK5X0nmNN/QM
         8/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646115; x=1781250915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xemTQrjJIL7wnMPSHNgom6Eq+r4qH97OnpIubMDnK48=;
        b=o/BsDxmlBr+0444vzugIfzes+Oh8vhO5towKXuZSpLBkDViE+p+AbvTUEabHyHrPDx
         KA4yJNKyuJ+iwN5ULtZPmCARNbnCW3FujETyFuT1mJntg8bn03kKm1s5MicDlx7OncDr
         +MxIHSEFOXSlQJAVItQlmk9nguF8araQLtsfuGHC11zltNFj25BCuH4qHnVSOaV/QYXi
         8QdlcdMAXPQGUKlZ2hZ9xX3DtUM7TxbTMS6Fp1kwgQsjj9Bd/noAHjT7CdSMnRScRPGC
         MeOZEWKlm/oa8hAqkXOwSF0IhjSUlb489CzXxCTUrwM94VZzEpHKsKlX6L81u5aRPLG0
         BAdw==
X-Forwarded-Encrypted: i=1; AFNElJ+vX4iY93oOXV+75fRuXtLsmm9PstI5PZQQ7edA9aKb5vSu5MMIbDhACWhytZ++DlnZjej1po4FD2I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxu7//i5WP2bAVjAoC3yX5RwkDeMmhmDo6U8MpUgTHI7lHVX1FD
	an+Fgidt/o0eV/d8JWqpo5pWkLtPJ/0GIgyWU6E4cQE+eL5EwBKVqiZVjEMK0iqVLQ==
X-Gm-Gg: Acq92OHsYDMkUE/9iE88shl1YCwKAQGvzrgzfIPrWg7KKM2CVKI2TouxfyHc4NzJ7bG
	X/TjnV/82xlDlRSzHaJxZFOyoEyvV2/Gyg8m2epS3Il+T0OWPaO9EyUtwkLT6P0R5yGmLfaRQRb
	/bNWyjVXkLsEj1vTvqVFlZQC3u7qc6iZVEY1orkuib1prL6RtHQiBGLJ5nIuyOwIPKzTKnfoKSy
	GD1nZx+J+9m1zWBPjaLunGZp9NUgv8jNvJkByA1F9xX3ZzTjgdiJMawb8ISgt3Sstf/TwIwRW3T
	5Zx8489y2axNy0gDDqdUZWsLjdO4AfgfAm6ne37HNHWsvMx8e1zGmeUa2AnaGRRaIPCmHCRTEq0
	nHo1kQPYL7vafQ1M0nkDasT/sWbzdn8GZKXwtVB6UMMqy9zOLyhhIeRsP+vpi9VDXFXzI5ba4Pn
	g9Tk5UME0feCgbx+pxiBtYGRwKm2ZrPJ2qevlcfvEg7dnJIFu4L5JS3KbeGJjSSJAZbDC6o6Sts
	cT6nft0tlSfKtX/eICHoOPO7w==
X-Received: by 2002:a05:600c:83c8:b0:490:40f1:5314 with SMTP id 5b1f17b1804b1-490c25b2b7bmr35185985e9.1.1780646115050;
        Fri, 05 Jun 2026 00:55:15 -0700 (PDT)
Message-ID: <7bb9c344-e23b-4f74-ac68-ea813afb5c35@suse.com>
Date: Fri, 5 Jun 2026 09:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86/efi: discard .text.header for PE binary
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-4-frediano.ziglio@cloud.com>
 <35a67929-aaef-4b1f-8370-7dcdf096fbb1@suse.com>
 <CAHt6W4fXPy9o2VzO-E+PkNv+VA2FcRPTzJzH6gAyqwXuV6ytmg@mail.gmail.com>
 <9859bb92-d532-4169-9b0d-1d7543491d6c@citrix.com>
 <CAHt6W4eojHTfRU8mmLDn=c2USXt4_=seRtu08wCvanUQ5O0oog@mail.gmail.com>
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
In-Reply-To: <CAHt6W4eojHTfRU8mmLDn=c2USXt4_=seRtu08wCvanUQ5O0oog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1780646115-B6368DB1-28BDDD9A/0/0
X-purgate-type: clean
X-purgate-size: 1280
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0D2D6462F1

On 04.06.2026 16:53, Frediano Ziglio wrote:
> On Thu, 4 Jun 2026 at 15:31, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 04/06/2026 11:28 am, Frediano Ziglio wrote:
>>> On Tue, 2 Jun 2026 at 13:15, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> --- a/xen/arch/x86/xen.lds.S
>>>>> +++ b/xen/arch/x86/xen.lds.S
>>>>> @@ -57,6 +57,9 @@ SECTIONS
>>>>>    __image_base__ = .;
>>>>>  #else
>>>>>    . = __image_base__;
>>>>> +  /DISCARD/ : {
>>>>> +    *(.text.header)
>>>>> +  }
>>>>>  #endif
>>>> We already have DISCARD_SECTIONS, so I think it needs clarifying why that
>>>> can't be used / extended.
>>>>
>>> Yes, this can be done that way. Roger, do you agree on this ?

FTOAD: I did _not_ suggest to make use of DISCARD_SECTIONS, as that
won't work. Instead I did ask that it be clarified in the description
why DISCARD_SECTIONS cannot be extended for the purpose here.

>> You'll need to add a general ARCH_DISCARD_SECTIONS, and have x86 fill in
>> {ELF,EFI}_DISCARD_SECTIONS conditionally.
> 
> I think binutils simply ignore sections not present so this is not
> necessary. I'll test it.

But you can't discard .text.header blindly everywhere. The reason it can
be discarded on x86, and only for xen.efi, is very much x86-specific.

Jan

