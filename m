Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jp5BBiMcNWqJnAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 12:38:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E886A5428
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 12:38:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=bttcDIMQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1342054.1602344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waWbN-0002g2-M5; Fri, 19 Jun 2026 10:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342054.1602344; Fri, 19 Jun 2026 10:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waWbN-0002e0-Iu; Fri, 19 Jun 2026 10:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1342054;
 Fri, 19 Jun 2026 10:37:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waWbL-0002do-T4
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 10:37:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waWbK-002P4G-A7
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 12:37:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a351bd8-e002-0a2a0a5209dd-0a2a4505bc7e-40
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 12:37:30 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a351bea-ef3d-0a2a45050019-d1558034c5bf-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 12:37:30 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4924593f45dso2222155e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 03:37:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd01fecsm53846225e9.8.2026.06.19.03.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2026 03:37:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1781865450; x=1782470250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9dl/yC3dtfgoYRvwB4AyGAOGuUTsmuyoli7UBAbwsTE=;
        b=bttcDIMQciJZT91DhWDJeaSFDDlEnyixXKHoLeQqr0hYTkHbMhXXd/BsVWiH6S/rZA
         3OYyunP9OOUTlgrmsjIOYbB/x0t62ZW+qfo36tduxFX9CH9AXOPQvxBf/xKre2poLMdZ
         WnRpWQRU2sZzyVHNMTAhXNBLmHQef+uS7Dk2qUHnz+fkzriVY9k3bxSgetOt7bNDs0M6
         7lb4eLMge5DrH2qlUZIvKABLA4/3eCkh+lJ6UX9XsPwpDwNbGqoyNg12jcf/eyWRIVGF
         bYDvRMzhPhLc5UO+G9IQ8d2eem41qCklQlOqyOtYEXZ8x+V4bBW0toluTAUOgN1dBDDR
         /iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865450; x=1782470250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dl/yC3dtfgoYRvwB4AyGAOGuUTsmuyoli7UBAbwsTE=;
        b=IGpnLG6LmzFZVpeUxjKyhQDnWm/ByBFpRx2Mp1gRKyQp0Gqd9P9ZCZ3hGsfXV1/OFZ
         Np7IdUz59zTjQ8bPMcyJ5zjC3sjo68LSK169EzyIlJx6SmbNKllCe0ix9BhDb7n+ijcy
         AgNE57H0hfzZ6T6OGAYYkXQEpSuKIIkTrHidD+IFoBCREYnAA+gWXrRSaXVWmPYXIE44
         gjD3ZzNSoFQXV3ASUca37gcuwiMncDgYRK64UZOt9Yye0I9viSoiY35URSqT4u4pgLxu
         TypkfxnCJYY/9IORlY9RZ9v3XjmzeI/lNt1abvgXAE8phYv11gxfYkzXYajjIu0RCnja
         H2vw==
X-Forwarded-Encrypted: i=1; AFNElJ8X+UHY63RE4efOryvwtqboM1HNegSOHr7hroEiDONmai/xAg8tYjM3ekcyzb3xWpIEz5Yy7zrY/fA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQF+ng0D4wYRdB7PLm/IQQBDdDEg+ugann8q8lAeJp9RRGr9Wu
	G7vWrMnc+Owv3TMj9hx6KcKDicPQgfxfLeH3EHl7n8j2z9DZBVu/Kw9d0e+/Eu4gFw==
X-Gm-Gg: AfdE7cm6u611pnfhfvJ1WmIEVWuLgLZgfCoUDZDZLQDMKcO7v1AMaKqPyrMXA/hbb8w
	B9qoqwW87H4dMfZahQLQ4SeXlU+r3LDJka0e6tOw0H5d+jvTW1AlSR50D//Z7MOfq54md2uHZHZ
	+U8kKyoZryheK7uX9MjLql5zW4LCsRUtrBg5T+sCyWLaXb58b611CFJZahJGWNqZcpbr4LglXjn
	OX8MNj5s4tn9lTKWU/ClYObycmF+wKtD16aqmV0Ea9Wv/P6CocK9Kiy6Tb2qSk0ttAdknTdkq0S
	Hrtktx1u/gjfqkFqqeqOtKqlL7EMir/Quet/huTppEgpPcmaolUdRGroo0tz4qphW5Qbbx84kD+
	l0brwEQ3nUgB9SSZGqGCn/BTNVA7xAlk8+CWgkjVqifxS414UzhhJlJxm5Ipncv4siJDnQH2yau
	6HgIgqKO+uxHlxsdGTOeG6lv8oYnJL7zKD6miGZC5RMycU/hNsKyfDKoHEUqE79SexFwgQof1nd
	Oci
X-Received: by 2002:a05:600c:c48e:b0:490:b0e0:3de2 with SMTP id 5b1f17b1804b1-4923f5a8fd6mr52259795e9.33.1781865449693;
        Fri, 19 Jun 2026 03:37:29 -0700 (PDT)
Message-ID: <8066deba-9d20-4698-8a37-16f1f7ab8128@suse.com>
Date: Fri, 19 Jun 2026 12:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] pci: Use pci_sbdf_t in pci_prepare_msix()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794554.8631fc262581453bbf619ec5b2062170.19edb3b42ec000701b@vates.tech>
 <f3d0016b-782d-4085-8f97-cddba10231af@citrix.com>
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
In-Reply-To: <f3d0016b-782d-4085-8f97-cddba10231af@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781865450-9FFD2127-DB717828/0/0
X-purgate-type: clean
X-purgate-size: 2085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75E886A5428

On 19.06.2026 11:31, Andrew Cooper wrote:
> On 18/06/2026 3:50 pm, Teddy Astie wrote:
>> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
>> index 5bbcf3b530..984fb99aa8 100644
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -512,15 +512,16 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>      case PHYSDEVOP_prepare_msix:
>>      case PHYSDEVOP_release_msix: {
>>          struct physdev_pci_device dev;
>> +        pci_sbdf_t sbdf;
>>  
>>          if ( copy_from_guest(&dev, arg, 1) )
>>              ret = -EFAULT;
>>          else
>> -            ret = xsm_resource_setup_pci(XSM_PRIV,
>> -                                         (dev.seg << 16) | (dev.bus << 8) |
>> -                                         dev.devfn) ?:
>> -                  pci_prepare_msix(dev.seg, dev.bus, dev.devfn,
>> -                                   cmd != PHYSDEVOP_prepare_msix);
>> +        {
>> +            sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);
>> +            ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf) ?:
>> +                  pci_prepare_msix(sbdf, cmd != PHYSDEVOP_prepare_msix);
>> +        }
>>          break;
>>      }
>>  
> 
> You say "clean up", but IMO this is not much better.  I would much
> prefer if it turned into this:
> 
>     case PHYSDEVOP_release_msix: {
>         struct physdev_pci_device dev;
>         pci_sbdf_t sbdf;
> 
>         ret = -EFAULT;
>         if ( copy_from_guest(&dev, arg, 1) )
>             break;
> 
>         sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);
> 
>         ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
>         if ( ret )
>             break;
> 
>         ret = pci_prepare_msix(sbdf, cmd != PHYSDEVOP_prepare_msix);
>         break;
>     }
> 
> 
> It is slightly longer, but the cognitive complexity is far lower.

This is pretty subjective, isn't it? I for one prefer forms with fewer
"break", as long as indentation doesn't get overly deep.

Jan

