Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDBuOwaH12mwPAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:01:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A253C96BB
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:01:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277025.1562309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAn8K-0000UH-FA; Thu, 09 Apr 2026 11:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277025.1562309; Thu, 09 Apr 2026 11:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAn8K-0000Re-Bm; Thu, 09 Apr 2026 11:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1277025;
 Thu, 09 Apr 2026 11:01:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAn8J-0000RC-BI
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:01:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAn8I-00DJlC-Mu
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:01:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d786e9-2eae-0a2a0a5409dd-0a2a4508cd18-36
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:01:10 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d786f6-fab6-0a2a45080019-d1558035a8e7-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:01:10 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso7600485e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 04:01:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cf9dc4e5sm46470225e9.2.2026.04.09.04.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 04:01:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1775732470; x=1776337270; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+dHQ3xdpPrtn7+Sv3WS1/VvWmma22TL4MllAMDLavT0=;
        b=a5ylJWqIZHdGH4SkqvEXfTiCCwnfKE/Uep6r1R951+GAIFi9vhMnlQrM43e8O0DSKG
         2z4Kxm7HYQO1UK8vL06t9T4AEsIQHtl831z/AaJhDOZkl2vU9NYsjCBPdMlYFRsbascB
         lLqp82q5EK+PsBV09jQaeDW3y4/f4Ai6DinbmkD4UtjlNg8mRlpoMb0jao+wW8opr8vp
         dxuMIfo4aoF4QryaxFPdiyyla6roGSYxnSIyQ8b7VKplOBQmiE9JFDDYuYF7fMlVqP41
         CBlCLz9ZJF/S4FFdekCyE7kGrZJplJyER8elJUhiZu67YzN4oX3p3dv0qGA2hbKAcMEt
         3zDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775732470; x=1776337270;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dHQ3xdpPrtn7+Sv3WS1/VvWmma22TL4MllAMDLavT0=;
        b=kO9FBcFXJDfHjeXRrIoGnhSigCiw+CsaTAX4nmi9Xq2EyVRvx7bbI91JmFpEIIbWvn
         tDVNrKTXeg8ut4mB7nurG5XwUgio5IUyfBpocucPAWDvKY9PWsa4y4JIJMRdGP31H1C/
         0HJ4gHvaJ0dhykjn8SSdLnO8lvP4aMWFcARQS32WzWYsD6V7OuVoe5dThIuvyMOknT/O
         98xqoKfPSlSujYuH8sSRXsQe+ySRDclLZ033bRv/tYvxSNJ+pDWPH9xZOtOQ3OghlsKx
         UQp3XlOuEl61LMxqE2MB5KdM0bymyUPMlVL8FrJe3zOqnv1IYFWRypQMF5oxZAq8wq3Q
         GlVw==
X-Forwarded-Encrypted: i=1; AJvYcCV3q2sG01hojzcUUBLtNM4kwFXZwcBUg3UWx3ne3MzgB3fK2b7uufSOICuhmwN01NnpA+42kymM+RQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMiB0R582WCe+Gdr70zf/yDJAN29quKB+tyn9s0FE+gwaFu4+o
	3DKUTJWisEOZaiQmdE7Xdl9ImWLDrjoOaxpg+QxoHwrH1HJbcfZ0j+EM5h50CLty5Q==
X-Gm-Gg: AeBDievlMH5+s7FsLeAD5PgO9LrISEFuwI2UFU/W9E42E5AODem+JT8En5xruoVr96s
	n7wrgi3hzLOqa39OwiYd7iMMHLHSYbl6nsWX+LsTs/CbDoQo3jkfeekNAnBiNYL+Kn7+oWZL2CO
	AltIUuHTcYI8pBdI+iOhBJ9NreKJklJ4LM4JoEQ1GhGpkNgRlrO1zyrGgK844j8Rvmaa2tlveoO
	i7ztf0NbEQQ9N/wHyiDVW0aGzbcK9+egWIZ7/ENEmGdtqamxNCQ6FUfcRt0Ua4bZfczG+oZBD9W
	ygJZr7WIcbF5E8k9CdcXZCi8hjXW91hMtrFCAsV3rHrgP7zQs5bmDt+z6OJHr9uB/eyyNJzDMKi
	lgXfa14RJljrLYYM53YM8S7vInvPerFCDHHmqqu4jHurOE0iFfF1/tsycQJixgNPoGxwrLVBKn4
	6KKBjybJEz57V+VlBr4KwAS3W9bFCyz5J1NeHt0FoqxWi8px/ThonlURr2bJvf98A7ZrxVM5bsY
	+EivtXQiHkuUlU=
X-Received: by 2002:a05:600c:3f1b:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-488cd55c1a2mr36599225e9.10.1775732469888;
        Thu, 09 Apr 2026 04:01:09 -0700 (PDT)
Message-ID: <65b04675-abbf-413e-abe7-6cd463913fdd@suse.com>
Date: Thu, 9 Apr 2026 13:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Reduce ifdefary in efi_exit_boot()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260409103805.176240-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260409103805.176240-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775732470-75557497-77A4F904/0/0
X-purgate-type: clean
X-purgate-size: 3389
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D1A253C96BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 12:38, Andrew Cooper wrote:
> Use IS_ENABLED() rather than #ifdef to give the compiler visibility into the
> block, which in turn removes the #ifdef from the varaible block.

Just to mention, if it was just / mainly ...

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1335,9 +1335,7 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      EFI_STATUS status;
>      UINTN info_size = 0, map_key;
>      bool retry;
> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
>      unsigned int i;
> -#endif

... this to be got rid of, we could as well use ...

> @@ -1371,31 +1369,32 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      if ( EFI_ERROR(status) )
>          PrintErrMesg(L"Cannot exit boot services", status);
>  
> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
> -    for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )

    for ( unsigned int i = 0; i < efi_memmap_size; i += efi_mdesc_size )

now. But yes, the typo aspect you mention can be avoided altogether by what
you change things to.

> +    if ( IS_ENABLED(CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP) )
>      {
> -        EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
> +        for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
> +        {
> +            EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>  
> -        /*
> -         * Runtime services regions are always mapped here.
> -         * Attributes may be adjusted in efi_init_memory().
> -         */
> -        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
> -             desc->Type == EfiRuntimeServicesCode ||
> -             desc->Type == EfiRuntimeServicesData )
> -            desc->VirtualStart = desc->PhysicalStart;
> -        else
> -            desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
> -    }
> -    status = efi_rs->SetVirtualAddressMap(efi_memmap_size, efi_mdesc_size,
> -                                          mdesc_ver, efi_memmap);
> -    if ( status != EFI_SUCCESS )
> -    {
> -        printk(XENLOG_ERR "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
> -               status);
> -        __clear_bit(EFI_RS, &efi_flags);
> +            /*
> +             * Runtime services regions are always mapped here.
> +             * Attributes may be adjusted in efi_init_memory().
> +             */
> +            if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
> +                 desc->Type == EfiRuntimeServicesCode ||
> +                 desc->Type == EfiRuntimeServicesData )
> +                desc->VirtualStart = desc->PhysicalStart;
> +            else
> +                desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
> +        }
> +        status = efi_rs->SetVirtualAddressMap(efi_memmap_size, efi_mdesc_size,
> +                                              mdesc_ver, efi_memmap);
> +        if ( status != EFI_SUCCESS )
> +        {
> +            printk(XENLOG_ERR "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
> +                   status);

Could I talk you into switching to

            printk(XENLOG_ERR
                   "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
                   status);

to make the line at least a little less long?

Jan

