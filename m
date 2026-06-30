Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xnEuCp/XQ2rjjwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 16:50:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3311D6E591E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 16:50:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CrZcTdhC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349070.1606894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZm8-0008Fu-CP; Tue, 30 Jun 2026 14:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349070.1606894; Tue, 30 Jun 2026 14:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZm8-0008DP-92; Tue, 30 Jun 2026 14:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1349070;
 Tue, 30 Jun 2026 14:49:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weZm7-0008DJ-H7
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 14:49:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weZm6-000KPm-70
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:49:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43d75d-bab6-0a2a0a5309dd-0a2a4501b97e-44
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:49:22 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43d771-400f-0a2a45010019-d155dd2fb057-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:49:21 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-472326ca506so1571028f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 07:49:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-476792758aasm607901f8f.11.2026.06.30.07.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 07:49:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1782830961; x=1783435761; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ey2j6UqKa8bGiQo4bse+7U35xJTwoCVEV8Tt7RglG68=;
        b=CrZcTdhCgnrtByBydy1twJ/W38LlyxPUGeMSynWS3Jr9N3QZUVxoqRrH2XaJYPcIrj
         lt8RviEJBtCfkuUc0vyYKZu80ILxQUICZDyTV7OvPQi60lsTYO2wniFABcDbFT987LNU
         a2+okcAL2mWAkYdqPc0rwGpz6i70zoCnzrARJ+P3MSSRZYX99EO6QJBU7BKMGd+DnTm2
         by6PmuG6PhYR6t4ggv/TAMyqbd0fqWxZZNoj0mvIkd8YYrF4XkKrOlYQ4jpW21hqtu71
         6lgHmUzxz5XwI12Y0D07dLTp3vObxUMXzXyPnEpJakW5Ekpuy86eZMC1lwDr7GyvWJ9x
         zPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830961; x=1783435761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey2j6UqKa8bGiQo4bse+7U35xJTwoCVEV8Tt7RglG68=;
        b=KHvyEreBQKr/nhoOhUKeQsR+mFRdAqp/8KpqUSjQHZ4o3F6dwln0yrYpVZ62jjrHZu
         l4PvuMcVSEWp0JW2G1F2q2bGp1EHXnNjfz0OwPk+4LORfjPYhaK3GdNZsN739dTxXmi+
         9PeYiKDBdYaPNuCN8LqGHykN1jo8QNJpUIzzK60ObUJAize5DKPxMdbD/3uhZIDlskXY
         Vp66+QgXFYw4iENqrLvlbPnlFJuAkFnhY7P9cYGSa33TlO6mHI15/25TOCrlCUc/MgOh
         riBk/P+1N/jFSskSPryu3ILgxIVBZsZryzzztJ0ASKygUDxMdNgk9m7V5JKwBQ/y48LW
         5w5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqJmbyCbrobL+mc0wXpUAap+cKTKog0ravtkXKEqsG7vgfYQpOmh7Z94uiOf70A2nJGg++XmmA0c94=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyxe0D9oc7FS1M6ucO73zaUcsVBvSi2XVmPHYI4+iZoUcHrRMun
	MXz0PLkRByTqSwtuA5LEvonFXMCTEuWjz1xzxXgfdKpnS0UuIypd41Y4vmTT2QXFSw==
X-Gm-Gg: AfdE7cm+Zyh4BeCEaHgZ7p8pblJFWtlnclkuRD+IEvEkc6/SYUpos4FDWlGWn3d1Cfr
	gAZgN4ycnW3zSU7MgZYRzMxgOdGAOObJH0PfpKqLZ+F/c+KBXT57NgIlPjLHOdUXb+LCGQpKQFV
	bQJxDzkvG+ETkdKj7z8Cn8IqJYR/rZBEuVkDV+X9GXotPydtKUFtIamrWCtksO0BrD9UjKRr0UL
	ORbKf1jq3ccWxwRUbHzFyCjc8dXVYCN3ZDbfArXrBaNcC/76s4X3SR/+8LdESZplm05J7Bdwnl6
	8gPq8jjYeMkHm7BF4mS2AwWpQ1ZX8Syxfk/N+F2zLJOD1+T4b5z6/sXcdsnfi52OfhcbF/bF2Re
	RPzM1cSKkG2P9TtPA0b0Dp720JYxtFQNK99Dc9fzYXqoPN7KjQ1kNIXggLtfLwDJGEFdjrXlMad
	5Mf9bwuUHXaMPknduVt1yQHFLALIAS4H8Ab14oFh/uSHglKgoY6QgrqmNcirFNCH6RYGP/6hxiY
	ksb
X-Received: by 2002:adf:fb11:0:b0:460:3233:beef with SMTP id ffacd0b85a97d-47553ca1fd1mr4370403f8f.43.1782830961190;
        Tue, 30 Jun 2026 07:49:21 -0700 (PDT)
Message-ID: <e8fe20b3-4c12-45a3-b5b4-c20d485339cd@suse.com>
Date: Tue, 30 Jun 2026 16:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/18] pci: Drop parse_pci_split{_seg}()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753823.8631fc262581453bbf619ec5b2062170.19f14688af5000701b@vates.tech>
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
In-Reply-To: <1782753823.8631fc262581453bbf619ec5b2062170.19f14688af5000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1782830961-834CA1E0-6448C4E4/0/0
X-purgate-type: clean
X-purgate-size: 3009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3311D6E591E

On 29.06.2026 19:21, Teddy Astie wrote:
> No user of these functions remain, collapse all the logic into the
> recently introduced pci_sbdf_t variants.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

In order to see whether the style issues introduced in patch 08 actually help
here keeping the diff small, I looked at this patch first. Hence a question
and a few nits here right away:

> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -151,18 +151,7 @@ void pci_intx(const struct pci_dev *pdev, bool enable)
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>  }
>  
> -const char *__init parse_pci_split(const char *s, unsigned int *seg_p,
> -                             unsigned int *bus_p, unsigned int *dev_p,
> -                             unsigned int *func_p)
> -{
> -    bool def_seg;
> -
> -    return parse_pci_seg(s, seg_p, bus_p, dev_p, func_p, &def_seg);
> -}
> -
> -const char *__init parse_pci_split_seg(const char *s, unsigned int *seg_p,
> -                                 unsigned int *bus_p, unsigned int *dev_p,
> -                                 unsigned int *func_p, bool *def_seg)
> +const char *__init parse_pci_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg)
>  {
>      unsigned long seg = simple_strtoul(s, &s, 16), bus, dev, func = 0;
>  
> @@ -180,39 +169,21 @@ const char *__init parse_pci_split_seg(const char *s, unsigned int *seg_p,
>          *def_seg = true;
>      }
>  
> -    if ( func_p && *s == '.' )
> +    if ( *s == '.' )
>          func = simple_strtoul(s + 1, &s, 0);

And the function part being optional goes away entirely silently?

> -    if ( seg != (seg_p ? (u16)seg : 0) ||
> +    if ( seg != (u16)seg ||

Nit: uint16_t please when you touch this line anyway.

>           bus != PCI_BUS(PCI_BDF(bus, 0)) ||
>           dev != PCI_SLOT(PCI_DEVFN(dev, 0)) ||
>           func != PCI_FUNC(PCI_DEVFN(0, func)) )
>          return NULL;
>  
> -    if ( seg_p )
> -        *seg_p = seg;
> -    *bus_p = bus;
> -    *dev_p = dev;
> -    if ( func_p )
> -        *func_p = func;
> -
> -    return s;
> -}
> -
> -const char *__init parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf)
> -{
> -    unsigned int seg, bus, dev, func;
> -    const char *out = parse_pci(s, &seg, &bus, &dev, &func);
> -
>      *sbdf = PCI_SBDF(seg, bus, dev, func);
> -    return out;
> +    return s;
>  }

Nit: Blank line please ahead of a function's main "return", and ...

> -const char *__init parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg)
> +const char *__init parse_pci(const char *s, pci_sbdf_t *sbdf)
>  {
> -    unsigned int seg, bus, dev, func;
> -    const char *out = parse_pci_seg(s, &seg, &bus, &dev, &func, def_seg);
> -
> -    *sbdf = PCI_SBDF(seg, bus, dev, func);
> -    return out;
> +    bool def_seg;
> +    return parse_pci_seg(s, sbdf, &def_seg);
>  }

... more generally between declartion(s) and statement(s).

Jan

