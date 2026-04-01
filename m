Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA1cGGIkzWlkaQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:57:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA24437BB24
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270328.1559024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7w4d-0001rJ-Qt; Wed, 01 Apr 2026 13:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270328.1559024; Wed, 01 Apr 2026 13:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7w4d-0001pf-Nk; Wed, 01 Apr 2026 13:57:35 +0000
Received: by outflank-mailman (input) for mailman id 1270328;
 Wed, 01 Apr 2026 13:57:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7w4b-0001pZ-Vw
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 13:57:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7w4b-00BiaU-27
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 15:57:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2438-2eae-0a2a0a5409dd-0a2a4502d9dc-46
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:57:32 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd244c-42fa-0a2a45020019-d1558033c02d-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:57:32 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-486ff3a0fc1so63746065e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 06:57:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e829c43sm110119815e9.5.2026.04.01.06.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 06:57:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775051852; x=1775656652; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XZVH6ygFcgCX2n5i1JSwSYkFbwZ9ApzI3czu4SHxdNE=;
        b=WoSDFizSd16tA9cxH6xpyYvktGGwbr22/wJnAh9IScfHzzIAOR/UCWDd7i5C3YuT4l
         fcc05TNeh9HvuT7B1s5csVsCoQJ+Tf1fcKm9LikdVMt2k+/lHiRABfOmbc2xPpaP6zCW
         ZqjVKa8UbzmjZ+GIwX7HP99NFJoIaraARcOa4Plmi0/PJ9brKLwX4s8Ij48D85+obtsa
         jAt8vYgliGS8iuxfTT//MwFMct0LPAJyMZhMn2RGNUNDyY/xIopSj+WqoK1V37qGV8q7
         LLK4twzZKaT7SDBUwm0tT6E5c/CQIPq8IhfJJi1Ta5I4NLah83vka97niBryvO687vAR
         9LQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051852; x=1775656652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZVH6ygFcgCX2n5i1JSwSYkFbwZ9ApzI3czu4SHxdNE=;
        b=T2TJOJ9hONfJbVNcM7xcdublai+qbbrOJ71zbz/WLcI/FYl8sT5asEqTnuOFukGbQP
         pI0zr3TUlHCWjwEHIb16dNpWPKRlzg0agqV+Z7n2BmgIUw44lnH28JBLcSNHlGnf7Kc+
         UFjUKmO/84pHR9nKQf6lkzbXvaej2fppk5NaMUmUaINGVhiUkHJAmF+VShR22zOu1r6d
         F4tYDsFGhfAlPHbWNvL7uOYrQwlX1CY5mnnm4liZvy1WpeRJLvUom0/+O+3WrPHpinKf
         9k+kxO2XRy3BkcQ9VKvghK75njWJdnO9JrwM4NLWp9OE0m7STumGLSLJOcMF2exVoYj/
         L/kw==
X-Forwarded-Encrypted: i=1; AJvYcCUyqPUtabp4/5Cj+0atqZxtgNnbHKrQ1WhNImxuKEa4ko0qlTnB0Rd3K93a9iri1IJTnP4UsAVobNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzumTla3dgu4K1RO+6pgSNFZmvcxr5K99L/hnd6aT58MDeIu1K
	zVupRMR+nykM0oZcyEmCyc97lvM22FCUAXlw9Rvd1hzsh16x6drWO6pYlqGRH1JARQ==
X-Gm-Gg: ATEYQzwjb4bEWvTSwdtDxpizToIHZH3VP3xm6sa56k2L9IxxaBNS/1AZCO6F/1uIRfg
	/+zvTffkTgbvTYWb/6kvKt877sl1CN2uJ7d0XDDb4RpEU84eyUUI/Gq2xKS7z68HTbRxMy2pwuG
	HO2I1kmreppyBtEFyXX769COQeIcACh2wL4Pa9H3nGg3p0pueVBETEmb9QOBW0QXqRYHwxKEBvY
	O6/q1LBYv6f7bMxGCDv8XJoJudy/hPVnbelWYQ6TmtVFRpZJQqj31Z7lYiwNczvBZeA4DviHNng
	KkR6pB/LingUJFe8c6IZWMRVXNj/XzHC3aDlIS7wvKyFdJHJ7ZEDZxCiuQI+bUFZgegmrXi2Pu/
	Tdfu59oeYa96jGLIlhhlYZGB4DTCPJV/hBgM0LjYrYeLk5npMeP2sCycZwmW6WEFBMxPJ7/R6d3
	URzQozdK6WlnvriTMF3vdrkpdCWwNPTbkC0vIteaMwjPjPXqfKcEN4eZqzC5czfMOvx1I22mRIe
	Q4+qM/13HyK768=
X-Received: by 2002:a05:600c:821a:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-48883306dd5mr66033725e9.0.1775051852179;
        Wed, 01 Apr 2026 06:57:32 -0700 (PDT)
Message-ID: <34e89f92-43ea-4cfb-a7cc-668b0e915662@suse.com>
Date: Wed, 1 Apr 2026 15:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] xen/riscv: introduce p2m_gpa_bits
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <775374eab7b9868b7cabe6c76fa1b7ac2f8466d8.1774281309.git.oleksii.kurochko@gmail.com>
 <4a0f4313-2694-4986-810c-0f4eac191cef@suse.com>
 <c87ef4d3-abad-4e46-ae86-f078eb4a5f0e@gmail.com>
 <0f20593e-1cad-475a-9bc4-f4f1b38c5087@suse.com>
 <eeadb9f7-83d6-4335-ab72-8efb2ce4360e@gmail.com>
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
In-Reply-To: <eeadb9f7-83d6-4335-ab72-8efb2ce4360e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1775051852-AE926CD1-2F2D9564/0/0
X-purgate-type: clean
X-purgate-size: 1637
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CA24437BB24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 15:50, Oleksii Kurochko wrote:
> On 4/1/26 8:07 AM, Jan Beulich wrote:
>>>>> @@ -191,8 +209,13 @@ static void __init gstage_mode_detect(void)
>>>>>    
>>>>>    void __init guest_mm_init(void)
>>>>>    {
>>>>> +    unsigned int gpa_bits;
>>>>> +    unsigned int paging_levels = default_gstage_mode.paging_levels;
>>>> Deriving a global from a default, when ...

This earlier comment may have been placed a little unhelpfully. The global
talked about is p2m_gpa_bits. IOW ...

>>>>>        gstage_mode_detect();
>>>>>    
>>>>> +    ASSERT(default_gstage_mode.paging_levels <= max_gstage_mode.paging_levels);
>>>> ... the default isn't the maximum possible, isn't going to fly.
>>> I didn't get you here.
>>>
>>> If we want Xen uses Sv39 for G-stage, we want to limit guest's 56-bit
>>> GPA to 39-bit GPA, but not the maximum supported by h/w mode for G-stage
>>> mode.
>> I can only repeat what I thought I had got across already on an earlier
>> series of yours: What mode a guest is going to use is going to be a guest
>> property. The default mode therefore isn't the only mode that may be used
>> at runtime.
> 
> I remember that, but i don't really understand what is wrong now with 
> the ASSERT(). It should be changed or dropped at all when this property 
> you are talking about will be introduced.

... the comment wasn't about the assertion itself, but the mere existence
of default_gstage_mode. Imo you really don't want to redo this later, but
maintain per-guest settings per guest right away, even if for the time
being all guests may end up with identical settings.

Jan

