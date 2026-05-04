Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO9wLVOz+GmWzAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:55:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299E04C032D
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300033.1574596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuhH-0002xg-S1; Mon, 04 May 2026 14:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300033.1574596; Mon, 04 May 2026 14:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuhH-0002vv-P3; Mon, 04 May 2026 14:54:59 +0000
Received: by outflank-mailman (input) for mailman id 1300033;
 Mon, 04 May 2026 14:54:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJuhF-0002vp-SJ
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:54:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJuhF-001nhN-3B
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:54:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b33c-2eae-0a2a0a5409dd-0a2a45068c94-12
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:54:56 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b340-7371-0a2a45060019-d1558035e037-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:54:56 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so67872985e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:54:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fede418sm102714615e9.6.2026.05.04.07.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 07:54:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1777906496; x=1778511296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HYxFyw/SHcO8z5+lUDVlO7zXso1mT3OfOg+su8s6PHs=;
        b=UJSsDHRkdoMwNHqecxyYcx0E+he3G4G78umbwqToiZRno58flf8SBznZv1EwPfGIpH
         xLxT0pguRmPBsuba2FbstZPRO/W624zceiCn5Z6p2OWapVKFsOWQDXJooz5CD3UMI4+A
         GeMGz2eRQ3r3wb3wluc9XxaW4eSipTDp+rRZSBZc6nFWhCWKwsB75yj1NYxYR5JtzIbb
         grOBHS2Ph9WpStihKGsgtQ/VhoL0WlNVywaFgJn9VQIoEjS4rXGXo4Og0EZSl2Q1B1pH
         kSUT+ollCFXD9nwX3aVL65bkaeluAY5HSsrGo5P2aCTZLXKNVe4a+AoIwKIMQf37V4eL
         isCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906496; x=1778511296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYxFyw/SHcO8z5+lUDVlO7zXso1mT3OfOg+su8s6PHs=;
        b=fmEwbdn4NpzJNEQagGjkEuSzW1A2NBWwWraUUM1aqs57h233Ozexygrw2ruFyPc3tA
         qSB44CDN5pCOhIJEsGpjtKzOL39WZ3wVkHuhHkfzdSIY0v0rWdLTt1qo9Izp8wBv+KDD
         nI+bPzHLcjN5Z/E56pr66hDF0bW/YlyRk2VcsTOuh582lH8mCcTHbnCUDw94RW3f1DhL
         8h3zVo7gJ4VWLET31Wyyc2M2Iz7Sr2QBGlGEJhnMgi7gNpNCpe2ZA2YDsmdxgMHUMxP9
         6aIxFkOsvEKGjg14P0f9CdXM1VVbbJujUg5D9wkY1pCmXQK3EjziQ7FJn1EpPm70bVNs
         L4qA==
X-Forwarded-Encrypted: i=1; AFNElJ9cC9Kt/AvGoaFZMtWrBoW/3Dzs/fNbzgZFYxHavbbpZShu1rDFXV022oOIyanZ5ZYvv+e6itpayqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwA9FL6LaOYbZ8jabJXu7JqMOnblxMKFbEgV4tl+FO4SiisIXY2
	Epd1HdQl3eAyxpRMqJZFdtbE93d4XDwDUhetKAH3da75/ca2tzSDNFH6fy6iD0TErQ==
X-Gm-Gg: AeBDievSRPkDI+18H3Dm1dyFceOWHCUm31/r1xh/BZ1nhL8+1P1+atMMNFUUXhvGsVr
	LgnVUufNx0m2/OvDpLMl5xIZ3fANSJB4M9LAddOZEwAhK0GT+gkMH74o7hvqlREtAzOS5w2olY6
	Cuf5QjDoKv23WQyHhlA32uDI1r6IFdphiY9u8pT2RyBTUsxaHVHpiihJ2NZ3jNrsdRGQ8KuE1CV
	+BYGjWPePgWN4/PRHHP8wzSt75+Yl/9Jypq64HGoMXk/vnMlNuWeeOhmx4RtbiuRsjpFgZJNHwj
	86u5LALZc+Z1OSiVwF/PMia+/2bB5V6dXl5KU00F9ifpDfePGC+6tJQit1vzkAQqvEWOXW7WGTq
	Mrhc+zJWnlKA5sP/WbWvmfj8Zy4048JcW62bZeOrzUM6qg5R+SIywJij6I33M86P1k1xy4ZK2rn
	C4lJ80ruMqmA47K5HHIKo+ujIQ9TgVDtGZXW5Ohbf1xWIpTt+YWe78LTWfkx8Y7gJW0tmaEpD7I
	/eaxAWX8jjg9RV6Ntv0Rv17cVQ5LgMXPI1T
X-Received: by 2002:a05:600c:4ed2:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-48a98671da2mr173194135e9.25.1777906496238;
        Mon, 04 May 2026 07:54:56 -0700 (PDT)
Message-ID: <06f93b9e-e70e-4c92-92c8-e7835103356d@suse.com>
Date: Mon, 4 May 2026 16:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] hvmloader: add basic Q35 support
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-8-thierry.escande@vates.tech>
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
In-Reply-To: <20260313163455.790692-8-thierry.escande@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1777906496-CFF7BD75-392FDA4A/0/0
X-purgate-type: clean
X-purgate-size: 582
X-Rspamd-Queue-Id: 299E04C032D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 13.03.2026 17:35, Thierry Escande wrote:
> @@ -209,7 +225,16 @@ void pci_setup(void)
>      {
>          do { isa_irq = (isa_irq + 1) & 15;
>          } while ( !(PCI_ISA_IRQ_MASK & (1U << isa_irq)) );
> -        pci_writeb(PCI_ISA_DEVFN, 0x60 + link, isa_irq);
> +
> +        if ( is_running_on_q35 )
> +        {
> +            pci_writeb(PCI_ICH9_LPC_DEVFN, 0x60 + link, isa_irq);
> +        }
> +        else
> +        {
> +            pci_writeb(PCI_ISA_DEVFN, 0x60 + link, isa_irq);
> +        }

Nit: Easier to read imo without the figure braces.

Jan

