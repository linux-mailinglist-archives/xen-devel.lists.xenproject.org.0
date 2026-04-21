Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBmGMQd952nC9QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 15:35:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79C43B698
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 15:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288985.1569218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFBFZ-0001wY-F1; Tue, 21 Apr 2026 13:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288985.1569218; Tue, 21 Apr 2026 13:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFBFZ-0001tx-CL; Tue, 21 Apr 2026 13:34:49 +0000
Received: by outflank-mailman (input) for mailman id 1288985;
 Tue, 21 Apr 2026 13:34:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFBFY-0001tr-Au
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 13:34:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFBFX-007fFw-DD
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 15:34:47 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e77cf1-e002-0a2a0a5209dd-0a2a4507b86e-18
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 15:34:47 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e77cf7-229c-0a2a45070019-d1558029b59e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 15:34:47 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488b150559bso33589655e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 06:34:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8188sm390113645e9.2.2026.04.21.06.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 06:34:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1776778487; x=1777383287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kiknjX2Ay3mBLby+d1elOlQocFNxZsEw/GVELKW8si0=;
        b=KS3xCQaK4oCxtLNk/GQy7CO+fjAXksv9MMvbm3tYAdC1o0enpGky8fZqCzKWFThSq3
         Y754CLb/fkviA85KsXctQ8fpMoVQHGfLM6E4yAw6ipxd7YvGMcDwZAsabrZzhJSMfWBy
         7Ut847F7KupdFk66xxsDvUW0v73wMbQ4BwBV8kn2iBq79hqAzNLO305qTxD0rLxGuJ4Y
         wYT7R8mmFoUPltsIpmgR5T8scjtODnnf2lBsCyMQ1OwJZ3JrWP/B+nybHodfzx/Yj3i9
         AqmoLImQ8DFl/8VLG+g+Hyjm6FLwoR+YKBU3X1ug/7hKhNwfJ0ARLQ3ax0OFCQ4zfiYn
         sIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776778487; x=1777383287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiknjX2Ay3mBLby+d1elOlQocFNxZsEw/GVELKW8si0=;
        b=Kjk+ca7GE2dM6yToo6SkT/LMDjlwrDn1IfyUEXcgbReJRjn66b/R3aXB+Fh3vqdpOl
         sTOPZ3vpCEQ8sb/RPLJD71ll5vboIij770/NVIhPCsICYW2YkdELnqCA+lNvZmkpI/4U
         gppfsk+KQWAp/yv/jEfINTwu3/76kmwYLrZrXPyn3iDhv2Scvg/HqdBmp0X2G7kJPmig
         234znNfACm79jda5Zh/xoFWrfgWyLFgdjOoet4c5+6+LF7pO6Kvx3zME/qaM3kYFJx+b
         +q2NOhOyBZWAptJlCTpRE7xcDjcmKHBR4iWhn8qTN6izJU6hxmMXJIkt4OgNq3B5K1rb
         rYFA==
X-Forwarded-Encrypted: i=1; AFNElJ+ApOjO+In09HPKP23jleMhBqdd2ItEcCSRmz+qn1KaUE2AtKcer+mr9KeL4TrzhscgAAzwuHreDqc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxp3pDFacoNcFoi8sIMIVA41KH+FZu20lJLQB4XG2zVMZ/K3dFy
	do2S80KeFvhzO7YYxcHNSTqK6N29yxAVLu0+25pOZS5nuDi9yylE7adB9ZvySJI86Q==
X-Gm-Gg: AeBDieuZOxI/kIb3w580XOkxzr51ZP3m6UcmlFhIY3M53DCG/YPCVLgZbKxVAA1i9XC
	1LNtXXNxTSLMrqO+7m3o9roYCjquhNKENZQdddTH7cAg8fmP+AvGIya6tWcYMCrt9qMfS0FLgIM
	m8cOoX8lc7R/y380MUhvgzgzVtExQA90XsprI0F+iBbIpQW4U8RD+2EERbosE/ZMRNrTEzAMYxR
	x5hrqRziSDDqsE/vizUnPPx6qTL1mJOucGb/faWaeKL7QKAo6yEIu33+M+axp2Gd2ziW4gxs0ft
	FAe6P0QGfvM+EwmPh8IyOHhOjXquoDn00SRvLs5LlGiNS9YbUjgHTEm0K3K7ENJ5lxUOUSEM6nD
	Gn9Nu3cjPSolCP5HZ0QOiqDDXJLxpnmem6/PAbtOn1EC82AI2W5b29nDnqLqIolFUvk/HAwD88Q
	sqdcrSjAC7dyvtneysHhsKcCBaTtafZLX59Flez3MbhpQwsVCfdPcu7fSc86f+Cr5SpuRryxTf1
	MZ6H45EGVxsGFXWuukFHtGgpQ==
X-Received: by 2002:a05:600c:a108:b0:488:a82f:bbb4 with SMTP id 5b1f17b1804b1-488fb78a0famr220642855e9.26.1776778486586;
        Tue, 21 Apr 2026 06:34:46 -0700 (PDT)
Message-ID: <da157511-9977-4024-abf7-38556b942106@suse.com>
Date: Tue, 21 Apr 2026 15:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] vpci: allow 32-bit BAR writes with memory decoding
 enabled
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
 <20260406191203.97662-5-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260406191203.97662-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1776778487-15255C48-6B54B943/0/0
X-purgate-type: clean
X-purgate-size: 2291
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3B79C43B698
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 06.04.2026 21:11, Stewart Hildebrand wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -670,6 +670,7 @@ static void cf_check bar_write(
>  {
>      struct vpci_bar *bar = data;
>      bool hi = false;
> +    uint16_t cmd = 0;
>  
>      ASSERT(is_hardware_domain(pdev->domain));
>  
> @@ -683,19 +684,29 @@ static void cf_check bar_write(
>          val &= PCI_BASE_ADDRESS_MEM_MASK;
>  
>      /*
> -     * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
> -     * writes as long as the BAR is not mapped into the p2m.
> +     * Allow 64-bit BAR writes only when the BAR is not mapped in p2m. Always
> +     * allow 32-bit BAR writes.
>       */
>      if ( bar->enabled )
>      {
> -        /* If the value written is the current one avoid printing a warning. */
> -        if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> -            gprintk(XENLOG_WARNING,
> -                    "%pp: ignored BAR %zu write while mapped\n",
> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> -        return;
> -    }
> +        if ( bar->type == VPCI_BAR_MEM32 )
> +        {
> +            if ( val == bar->addr )
> +                return;
>  
> +            cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> +            modify_bars(pdev, cmd, false, false);
> +        }
> +        else
> +        {
> +            /* If the value written is the same avoid printing a warning. */
> +            if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> +                gprintk(XENLOG_WARNING,
> +                        "%pp: ignored BAR %zu write while mapped\n",
> +                        &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +            return;
> +        }
> +    }
>  
>      /*
>       * Update the cached address, so that when memory decoding is enabled
> @@ -715,6 +726,9 @@ static void cf_check bar_write(
>      }
>  
>      pci_conf_write32(pdev->sbdf, reg, val);
> +
> +    if ( bar->enabled )
> +        modify_bars(pdev, cmd, false, true);
>  }
>  
>  static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,

While this all looks plausible, isn't something similar needed in rom_write()
then as well?

Jan

