Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DFAB3E1E1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104542.1455571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2uj-0003r7-Di; Mon, 01 Sep 2025 11:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104542.1455571; Mon, 01 Sep 2025 11:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2uj-0003or-B4; Mon, 01 Sep 2025 11:41:33 +0000
Received: by outflank-mailman (input) for mailman id 1104542;
 Mon, 01 Sep 2025 11:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut2ui-0003nz-2s
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:41:32 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99d3c8dd-8728-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 13:41:29 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b042cc397dcso105626866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 04:41:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff15fccb15sm654552566b.98.2025.09.01.04.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:41:26 -0700 (PDT)
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
X-Inumbo-ID: 99d3c8dd-8728-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756726889; x=1757331689; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9gF53h55/t81qctesrJN23RtwDJtucTO++o6vR9AyGM=;
        b=DwquACM0pORBgTNYGabh7Jv5uP9uYsMltQfYJMOfwWspVIpyZthxub/vk1ohDEWfHL
         GIwAmbvk/ArVdz0EIxZmcNoXrK6Ijma4Oc37Zjza/kzhJZhqS/HO6kQ68APmg6zaFIhZ
         KdYTSu9vRzUwdS9Gq37WTTy8Vt+wne83r8L3mP+CIn5mULOPoixwenbwXHQp0yylD72x
         n+HswDZklq4pqhWDmMTL53U8LthTf36X0+zHbYFfSk/2MwUijuLdfyCmb7fZ+ALP2SNW
         GXv8w+xBcSORs6agqku9s0IiU1D4RSZOjFeM5cIq1uzVLoiRH97f04Yc/Nuu7TvwEPcx
         mb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726889; x=1757331689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gF53h55/t81qctesrJN23RtwDJtucTO++o6vR9AyGM=;
        b=GpXBmDSmaKUqLdX0TMve1Bjv3ftYfKECJIMcDFy7+aIicbeysxMxSW4ebsxFIfzGMj
         G5gxsQmAbgFzF8X6D+B2oKCEedhy6fUWwIT5AxMGcIDBTCfT1zm5RLxp7n2pNhb2MUON
         IsXKSR/jm1vD959J9SZYY59CZ2mqs3Qn3p3F4tVUwLIORCYUyC2s6uI4o1cCFS7ZjHzJ
         kWrULP9za7/hVifFUzv6yczkp5IBGCWv4ziOu9zXtspY8ahrWEaBsDIgz+lbQDBVB0Zf
         7bVuZvAjp9bSmfFjqXItkgT3mjOWA4tXiKZqIhQG8XtqZTkCVOsUJ/81qLMpftAChP++
         hB7w==
X-Forwarded-Encrypted: i=1; AJvYcCXKlQSWLiQ9eAN+L+apvE2kaLUrN3gQqbGJWS4XFZUk0ZjEzOZLhJnwaPr3JgCizdwzG8OPBlJdR3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yznmw11x3AQWXhf3HLik4QlI1PhrGGmG8965PC92PHjpB8NTBBP
	PlOPm2KIsohcQgpUCjW40fwNTVD6VAtSrUNafOPLjZ0nfv5SGDTk89iDMz6XNM7QpQ==
X-Gm-Gg: ASbGncsC0JXetu5eOO+pqhreRv4ocEVCELvSvtksEgYK81tnB3tnD1G2/4NNEQlv3Ly
	k5HcdoHffX/7TxgvnewYQqlwNEfCoOLaaLjNHNCrniCtID6RY32bOlIIvqgfQ1V14s60GR1uff6
	jhPg2BMJMBPELm1UC7+U9Kb1TlAUzzzKeBn94wIhzaiCrWt7SSkQguXXuJ695sJgV13O8RXWlM8
	4bPGnS8GnJVXQOkCcNQpNHhQ7uJKY1nMUrp9ITslI2LboeYCZyTiIhVR9TkNL0Ng40alfSsJAp0
	ZT+GJ0igXoMUs568YnkP6e6wAjB49Wrs6V9BXgOEE2UpvZ2txBO5tqUjVX4YkK0SrNpKHSAET51
	lhsB845EXqCep2CX/Y/kFwXnPgSdRWyxexbkQ8P8FbkYTpA0zC38cP2zEH5sR4rxEFyx0euZRSb
	+zngUimKw=
X-Google-Smtp-Source: AGHT+IGceUg7TElhbBGWipz6AfH8kUzoM8OjhtVo+6udC/h+FRDMiR/HvMaRzQNu5ljSVz9UNvQQZw==
X-Received: by 2002:a17:906:48d2:b0:b04:2214:9499 with SMTP id a640c23a62f3a-b04221497cfmr380016066b.8.1756726889171;
        Mon, 01 Sep 2025 04:41:29 -0700 (PDT)
Message-ID: <7675f3d9-add2-4ed3-a2ce-ec9b676850ab@suse.com>
Date: Mon, 1 Sep 2025 13:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/23] x86/entry: Alter how IRET faults are recognised
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-17-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-17-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:04, Andrew Cooper wrote:
> Right now we have two IRET instructions that can fault for guest reasons, and
> the pre exception table gives handle_exception as the fixup for both.
> 
> Instead, we can have compat_restore_all_guest() use restore_all_guest()'s IRET
> which gives us just a single position to handle specially.
> 
> In exception_with_ints_disabled(), remove search_pre_exception_table() and use
> a simpler check.

And, peeking ahead, a similar check will then appear for ERETU. Probably indeed
a fair exchange seeing that in the next patch you drop the pre-exception stuff
altogether.

>  Explain how the recovery works, because this isn't the first
> time I've had to figure it out.
> 
> The reference to iret_to_guest highlights that any checking here is specific
> to CONFIG_PV, so exclude it in !PV builds.
> 
> Later in exception_with_ints_disabled(), it suffices to load %ecx rather than
> %rcx, and remove a stray semi-colon from the rep movsq.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


