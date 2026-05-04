Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ9SGNa5+Gnt0AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:23:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8324C09F1
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300058.1574623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJv8A-0000EZ-8N; Mon, 04 May 2026 15:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300058.1574623; Mon, 04 May 2026 15:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJv8A-0000C9-5b; Mon, 04 May 2026 15:22:46 +0000
Received: by outflank-mailman (input) for mailman id 1300058;
 Mon, 04 May 2026 15:22:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJv89-0000Bz-A3
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:22:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJv88-009Wx2-4T
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 17:22:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b9c4-5cb7-0a2a0a5109dd-0a2a450886ea-0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:22:44 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b9c3-63b5-0a2a45080019-d155dd33c518-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:22:43 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-445795cf6f1so2500705f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:22:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8ebc4201sm447598155e9.15.2026.05.04.08.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 08:22:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1777908163; x=1778512963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TVW8Pe+K/LVN3HUZVZ16irKgUerdqb5H6RqVp0VpNsI=;
        b=QXwtUP6KTx05snlmkQKsxGyFI0n2wwCaUS2MipJ9R6LzB6e4KBVSgxsZhMQ5VkvgHL
         IiptrX8wnzN7gBO4cEFGRe8NHS15q0ZwF95pcaYCAqicsRuDcGobwX1i72ABl38HKmIQ
         XMQM65I4V9ra4xdDpqz+P4gbvz/L/TGIguiM1tKKQF3QfO7RSrKEc1+i2XijrAnwicvX
         1gP7zec7vzoUVm4PQxmUeFFsYKb/Lc6g0i1cYsla5HmZBWkeuzwT3eONYb+jmoR3Gxwp
         crwysNho6BiGYwIDkgbpBXZRBW65RmLas/jy+YFPtCS2FILd4SVJmKd0UoelBzukmWbl
         +nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777908163; x=1778512963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVW8Pe+K/LVN3HUZVZ16irKgUerdqb5H6RqVp0VpNsI=;
        b=SpGSM4rwiw6drKGRG5/bmI8evDpuwmi1WV4+Igpes1ZYJASaC4ymsQurKAmT6Erl8O
         oTysjIRX81HPILJh/+8L28kU3fj4/3V76yVZf1gJomFJ0vlhvf6sBwNEZJICmD/5pmbx
         M2wzi8mVlBwBxktmjhiqFXiXK9tIofPRnYmSs4j1kxk/tUexr06xOU8u6tyOuYCk4qhT
         560vUwgu95oTRthbuZgzHsbcPhmdiJgoH1Jko1wNFS4YtImSnT7JE+yGHzAMDJpsnf35
         frL0U8WKvav86Yz0lIG45Fr8n0TOQ9URns6s4NuXSZd0HrwxzjPMANmAsBt/cbaNQ2lt
         hMvg==
X-Forwarded-Encrypted: i=1; AFNElJ8qvrdH77iHf6mZCltouhQHRuY0llQPxwOSS/vkAml9PAcDVe228/uXEKbLKV+8DInLNKgC+DJvRuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxkyhi+tEjuS553hBdemSgtvZXHQJP5Nt4wnv6DhqnIhuLPnVWt
	FQAqQc8ssNdoRQZ7nCPlcXIDRkhPGq4C8XMXjwT6g+HacNbbC+8XBhGs3/aCjsRJzA==
X-Gm-Gg: AeBDieuqKTzyLGu9lgtJH3SlEjwzhVrMoSvigUOP4fFFMNS3LDovFESL+1BQViJlgf/
	S2N/xIsNXHRJ3575wtdvYsyICeRQVaGHt0eJn4Ot8g791tg5Ip9su3EOHUrdtZNNan5Zjw9GNKs
	Rr+PIZvR8WqDjgtggbq9UWofzVyOncdK9dSRtno74Ho0FRWXjhFNQRLmMXraOpuM+mJ5wZKf6LN
	J8bbo8B8oJjuD1dApkxmi7/cm4zx9OjLw/d6pVHKOdi4F0Oh5mTsCNUOUrQGNvtv9oON9u76jhr
	0pqqBNJWwf485K19NKiMegRFLS60KUWcS5wpIzyWs9pC8VKQR2LawhiG4KgZA66eqMqFb4wSSG/
	AW1Z76zqsjOR1nCAtBoHy2mJOL60lo6WH5JipbjAeE6vth7SVCKa4dined6lLAqEO5f+ehPTr0T
	XgvpPBdIF5LU1YYiGh22Whl/83XCTkgF2KoSto+dfJtIU4dG3gIt/oSlsvLQiBfQ7iFNldNoQoE
	iT5NkT/T9JuqiWPxyiLdvCupA==
X-Received: by 2002:a05:600c:c3d9:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48a9865b083mr133296745e9.13.1777908163475;
        Mon, 04 May 2026 08:22:43 -0700 (PDT)
Message-ID: <aacea333-6ae7-415e-aac0-353382ad34dd@suse.com>
Date: Mon, 4 May 2026 17:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] Handle PCIe ECAM space access from guests
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-17-thierry.escande@vates.tech>
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
In-Reply-To: <20260313163455.790692-17-thierry.escande@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1777908164-C0159DB1-D871B689/0/0
X-purgate-type: clean
X-purgate-size: 869
X-Rspamd-Queue-Id: BC8324C09F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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

On 13.03.2026 17:35, Thierry Escande wrote:
> @@ -298,6 +300,19 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
>                  *addr |= CF8_ADDR_HI(cf8);
>          }
>      }
> +    else if ( p->type == IOREQ_TYPE_COPY &&
> +              (mmio_start >= d->arch.ecam_addr &&
> +               mmio_start < (d->arch.ecam_addr + d->arch.ecam_size)) )
> +    {
> +        pci_sbdf_t sbdf;
> +        unsigned int reg = mmio_start & ~PAGE_MASK;

If you use PAGE_MASK here, ...

> +        sbdf.bdf =  (((mmio_start - d->arch.ecam_addr) & 0x0ffff000) >> 12);

... why not PAGE_SHIFT here? And why the masking by 0x0ffff000? Doesn't the
earlier range check make this unnecessary (as long as .ecam_size is plausible)?

Finally, nit: There's a stray blank after the =, and one pair of parentheses
could perhaps also be dropped.

Jan

