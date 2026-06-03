Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mEtvIW73H2p1tQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:44:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E296C63641E
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:44:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=MkocZVQU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325972.1591353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUi8k-00070t-7B; Wed, 03 Jun 2026 09:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325972.1591353; Wed, 03 Jun 2026 09:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUi8k-0006zW-4C; Wed, 03 Jun 2026 09:43:58 +0000
Received: by outflank-mailman (input) for mailman id 1325972;
 Wed, 03 Jun 2026 09:43:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUi8j-0006zQ-7E
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:43:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUi8i-006YVp-CX
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:43:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ff758-e002-0a2a0a5209dd-0a2a4502a1c2-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:43:56 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ff75a-af86-0a2a45020019-d155dd33d930-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:43:54 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45fd464d51fso2020014f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:43:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344541sm5708799f8f.22.2026.06.03.02.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 02:43:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1780479833; x=1781084633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wRfsqasosVksv1QB7QW8O49zBxwo2moY0A8xG0lqHVM=;
        b=MkocZVQUwr29zQw0XF2SZpT/dTIIHRw3zD7nYdk13wStPrd5VcBo2H3ZnMWI3iifj0
         nQuXHCSGMp5hjDLXgLr7u1/zz0KVN2QqdxBFIz64GU3RyV6GoQ/5Z+vV6op7/tX/tBxY
         WFQR1kW9bhEEGbjFv7lBX/s69M1Cl4WQx8muRrWkgUTuSYgnmdZK/+BERxjCjJrQQWFh
         O3g108pSSj95SdiI0QTtyoEogbrtXMVOdjDU4Iic8AhMP6sDUb/DtsbWS974hl2S6jsc
         CQbCa3Cd/Q0omDfdWfaLaBx2/T+qH/P57jZVm85G/FJU4/PMt84hUocgOr1hQ1HBoe0e
         rpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780479833; x=1781084633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRfsqasosVksv1QB7QW8O49zBxwo2moY0A8xG0lqHVM=;
        b=mqbzUvMVeUlzQkZYHGnxrTkXrEPd4K0woUdaRQld7SrHqfSX+S48ZhzGU9nGh6FkyU
         /hXWG6jX8KJurEyuv5qSKmCUmWZU/g6alf5TqQmyuPWW4k0EJPJBAqYAxuyV+xVWKozu
         TrJfB2/W8r45vfmiLx3gmArdUi57EL6/thVqF0nlp1rNXzdcUoeN7dILbKUdnOywLcJ+
         zaOTtiDEjfdgyR9eqrr3EWGRkGyJTKnHhczBjsc8azVvyuWcGTQOmt6MwQfK/kx9KYfU
         wsPuCzS3U2r+sFjj83XD4zf6wunmHymPJtx/XTT+7hT0glz47aeao3LSZLpiS0R4e13+
         CGFw==
X-Forwarded-Encrypted: i=1; AFNElJ+8PjLI6adWgXtXpEN6k5G1iMc1NlURN5AXKhIbXLz1rkPyTY4uQRvxHuAincGCGz62ydaxb/oRySI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGF1fQVM1JfIX9K1dyE31g0nzFiogPaG2SDxCVXJOQIDbdAwFo
	aiA0wxN5qHVIOk+Mvf3xnyrLwG6CHuaHyrquaDEvDr0c7iMniBVCGq3OIS4pfti38MciSZs+FB6
	tIKo=
X-Gm-Gg: Acq92OGSDUVBY8NpCPLFJ3iRWXj4zjV198xaEtSCC93cy9HnVmeQQUrqut/86bmQrP0
	f8QmWu+ADGZa33Iv7PB0hPNxjOx1Eh3DTYkLf9IDD3IJL/q153TsLWpfP1aRS86q8DlnTjuYh3y
	ssDdLUTvhMK70j/tt/LpUXbVncelFF5HeiGojLLODttHX5mlI8fmldlSX/GXBkwrvGRuwEL3x2h
	0CklxnaLrBrvyuHW+B06T6QCtAIC74cSiKxYFVlJ1KJqH7Ay9pSy5rcCWxkCEI0ny9uKfNB8+5J
	UYj9iGv21sKMj8ouRKIOtBaGAr40w1myh0TZtadSC31WYxHo0H5LCCrds+JN/B5rmfiBS/88Ejq
	HIpggEKzNFGCNF/bXiqpXMLg9DqlRFi09JjDq8z4NhJJZ5TF2gKJnGvlDa0g/JtxAkUu/guoC7V
	JCsD/qpqF1+PibdYi+iM/18J1EuUt6jSVdeBTvAc5OBCpFD2WwNcRCKEN6iXPIKUYAEUJZ3CxMP
	T2Z+J8W1OvuVSEiILbPbg4e+g==
X-Received: by 2002:a05:6000:43d4:20b0:460:f36:79b0 with SMTP id ffacd0b85a97d-4602182b90dmr2893291f8f.19.1780479833485;
        Wed, 03 Jun 2026 02:43:53 -0700 (PDT)
Message-ID: <0d7d0f0d-ab1e-455a-8588-00b3a2842526@suse.com>
Date: Wed, 3 Jun 2026 11:43:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/fred: Enable FRED by default on AMD systems
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260602164519.2634144-1-andrew.cooper3@citrix.com>
 <ca4eafc3-8699-4903-aad5-5cb95ea6e409@suse.com>
 <9fe33fbc-be7c-46ab-b32d-f39ac619bb08@citrix.com>
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
In-Reply-To: <9fe33fbc-be7c-46ab-b32d-f39ac619bb08@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780479834-8057B161-1E487C4C/0/0
X-purgate-type: clean
X-purgate-size: 3041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: E296C63641E

On 03.06.2026 11:36, Andrew Cooper wrote:
> On 03/06/2026 7:27 am, Jan Beulich wrote:
>> On 02.06.2026 18:45, Andrew Cooper wrote:
>>> FRED is now believed to be complete for AMD systems, and has had its tyres
>>> kicked by both XenServer and AMD.  Enable FRED by default on capable AMD
>>> systems (Zen6 and later).
>>>
>>> Support on Intel is still not yet complete.  Leave it as tech preview and not
>>> security supported.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> with one remark:
>>
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1259,12 +1259,12 @@ does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
>>>  ### fred (x86)
>>>  > `= <bool>`
>>>  
>>> -> Default: `false`
>>> +> Default: `true` on AMD, `false` otherwise
>>>  
>>>  Flexible Return and Event Delivery is an overhaul of interrupt, exception and
>>>  system call handling, fixing many corner cases in the x86 architecture, and
>>> -expected in hardware from 2025.  Support in Xen is a work in progress and
>>> -disabled by default.
>>> +expected in hardware from 2026.  FRED is fully supported on AMD hardware.
> 
> Along with the year, I suppose I should name the CPUs specifically now
> that they're public.
> 
>>> +Intel hardware is still tech preview and not security supported.
>> Is having "security" here really appropriate? There's a functional issue to be
>> sorted. That's expressed by "tech preview", yes, but it still feels somewhat
>> odd. If you want to keep the word, may I suggest to insert "in particular"?
> 
> I was just trying to make things clearer.  One of the common audience
> groups for this file is not liable to know Xen's precise definitions of
> experimental/tech-preview/supported.
> 
>> May I further suggest "On Intel hardware it is ..."?
> 
> How does this look?
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index ef3c7371895b..ff6d08affb63 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1259,12 +1259,13 @@ does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
>  ### fred (x86)
>  > `= <bool>`
>  
> -> Default: `false`
> +> Default: `true` on AMD, `false` otherwise
>  
>  Flexible Return and Event Delivery is an overhaul of interrupt, exception and
> -system call handling, fixing many corner cases in the x86 architecture, and
> -expected in hardware from 2025.  Support in Xen is a work in progress and
> -disabled by default.
> +system call handling, fixing many corner cases in the x86 architecture, and is
> +available on Intel Panther Lake and Diamond Rapids CPUs, and AMD Zen6 CPUs.
> +FRED is fully supported on AMD hardware.  On Intel hardware it is still tech
> +preview, and in particular not security supported.
>  
>  ### gnttab
>  > `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`
> 
> 
> ?

Looks good, thanks.

Jan

