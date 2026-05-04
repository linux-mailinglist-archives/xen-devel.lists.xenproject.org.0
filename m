Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAkHDXK3+Gn1zAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:12:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197D4C07F4
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 17:12:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300050.1574614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuy5-0006ld-D3; Mon, 04 May 2026 15:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300050.1574614; Mon, 04 May 2026 15:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuy5-0006if-9h; Mon, 04 May 2026 15:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1300050;
 Mon, 04 May 2026 15:12:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJuy4-0006iZ-0o
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:12:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJuy2-002tva-Sb
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 17:12:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b742-bab6-0a2a0a5309dd-0a2a4507b148-24
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:12:18 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b752-229c-0a2a45070019-d1558030b51c-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 17:12:18 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488b150559bso28646155e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:12:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fe93166sm80430365e9.7.2026.05.04.08.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 08:12:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1777907538; x=1778512338; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n2CidWxDlU6SIZM8V1WJC85VvMNijs8Wq+ouLKoasgQ=;
        b=DN+R+ViB6INFLWXx3fT0eJtfbFG+xs/YTRhiZgqTQQmS2KGXwed9MqW6qYYpRBf3D5
         nrpa2ca/1NNW/+zNiLZaZjsKf2Qpi6rPp01Oj09WiLh59/8BrTU3E76CaMkryB0wdQCb
         z3YPU5TSG2YRb94IVDxnO1Ix/CRpjcufanLyawdz+1neBELRYOaSz3T+DreQ0OmW0qSQ
         yg3qHYsQThLZK7JMVKdkruXeDulQS+5FcO66ApLpswiQSUDux0GxLWiL43Yti4pmGYHO
         Pk1BTFvst6nIODwlNj+XpyaYy4GBg7Kd+CiDnE7sR76Sjchy14mWZ2+W5sFxd6n5LA6/
         VOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777907538; x=1778512338;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2CidWxDlU6SIZM8V1WJC85VvMNijs8Wq+ouLKoasgQ=;
        b=PbypTlszUevLLK1SW8J+pExsxrSuOr3me/qPfK7T/gw4ZKsKadw7a6+Y2UcLrNH1F+
         JcME3Xh17KT2Atr7dUNwNJCKPNOpuu1yknSNhJSqGlMLi9ovfM/XhBafZCUJXZpdq2Py
         kOY84o4vsXWHgumUrhK7iXURxrBjf76xWl9xmW96Rc41AZCqBjxHXk+D6OQvpdGuRowY
         RWW6jFRWg1bxuXgt7VURLLkT4a6cAy846whDjekNkiMZCxsQ85RJd03333L0xx/cEJPF
         2an5Tc/hhfzuVqVQbP3RijQiei6mMb06Iu0KhE3eWDu5gclHObjR4IPlzpuKu9r6kC4L
         Ew/w==
X-Forwarded-Encrypted: i=1; AFNElJ+qhxzfMpDMPJiDjLzVEfpsOXpQFe9A7hBq1HSuMASHMLsz2kXSiv4MMvNZDWXdLrVGDwlhbODVFh8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzW3qCGncjWKK8rYZcmuOOVAwgfHZfJkTTs6Hd/sn1PUB3HvJlH
	KUDYgzkLNi8nIIInJb3jbsiOUalt73KI3nfBL7JJMK6iAPUWPfeQFK2DYd99aa6sCA==
X-Gm-Gg: AeBDieuIe5DwbJfJjiy5sWroWX2SmqLBrkOmVaWh78dwn7at2IFrdIkgevJedYhFbOp
	rnIlBAocrdfOPFqCWaHfRaWoNqXG+Zlol4EmG6VPtVYAz/zFAGRxV34ugQq+FA9rMCTyDlLEdtb
	3ANYJvYVXPCDE+O9BQUKc5tbTgraUnzxsRDjazqRIiKUKONz41uMyhAbYA71858GdPJ/gE1weHc
	BMfRUvNDL6XhNTb1wd2RyNRsdpSyrGVQwt0iy5acKxcGxY6F5Sg8ytIWzvQR2h0R+AIwUWW3Phv
	6pJtzhrKKZ0O8acACOiwbmxreMpiU4g4loakbwNLy1vnrPTXH/SELBsx5jLTtBouQcWq6pzVGuN
	LhomcUDrJkVRy1SCBGcyUhVeqILV8ecCkB1CXMphWaWfmxk7OUBJMD93T0YsN3e4iOx2F2rJUDl
	4wRz3dp1dLVpXpRHOP/b6loBafT3xc32cilRJsbt7WsQxfIFoB61cE4R1wNO6W2Z94/bDRTUlfC
	CReYbsV/Lf/WxPhJ549L7Z1QA==
X-Received: by 2002:a05:600c:a111:b0:48a:568f:ae6d with SMTP id 5b1f17b1804b1-48a98634d87mr118618085e9.8.1777907537996;
        Mon, 04 May 2026 08:12:17 -0700 (PDT)
Message-ID: <df1aff17-1fb1-4ae3-995f-944a1750659b@suse.com>
Date: Mon, 4 May 2026 17:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] xev/hvm: Add HVMOP_get|set_ecam_space hypercalls
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-10-thierry.escande@vates.tech>
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
In-Reply-To: <20260313163455.790692-10-thierry.escande@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1777907538-AC563C48-ECD8A3C7/0/0
X-purgate-type: clean
X-purgate-size: 2640
X-Rspamd-Queue-Id: 8197D4C07F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 13.03.2026 17:35, Thierry Escande wrote:
> This patch adds 2 HVMOP hypercalls, HVMOP_get|set_ecam_space, used to
> set and get the base address and size of the PCIe ECAM space as
> configured by hvmloader.
> 
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>

Just in case we want to stick to these (see Roger's earlier comments
throughout the series), a few remarks here:

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -5195,6 +5195,58 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_op(arg);
>          break;
>  
> +    case HVMOP_set_ecam_space: {
> +        xen_hvm_ecam_space_t ecam;
> +        struct domain *d;
> +
> +        if ( copy_from_guest( &ecam, guest_handle_cast(arg, xen_hvm_ecam_space_t), 1 ) )
> +            return -EFAULT;
> +
> +        d = rcu_lock_domain_by_any_id(ecam.domid);
> +        if ( d == NULL )
> +            return -ESRCH;
> +
> +        if ( d->arch.ecam_addr ) {
> +            rcu_unlock_domain(d);
> +            return -EFAULT;
> +        }
> +
> +        if ( (ecam.size >> 28) || (!ecam.addr) ) {
> +            rcu_unlock_domain(d);
> +            return -EINVAL;
> +        }
> +
> +        d->arch.ecam_addr = ecam.addr;
> +        d->arch.ecam_size = ecam.size;

Shorter (and easier to follow as well as less error prone as to the
rcu_unlock_domain())

        if ( d->arch.ecam_addr )
            rc = -E...;
        else if ( (ecam.size >> 28) || !ecam.addr )
            rc = -EINVAL;
        else
        {
            d->arch.ecam_addr = ecam.addr;
            d->arch.ecam_size = ecam.size;
        }

all utilizing ...

> +        rcu_unlock_domain(d);

... this.

The magic 28 also needs (a) explaining and/or (b) abstracting (a
suitably named #define might address both).

> --- a/xen/include/public/hvm/hvm_op.h
> +++ b/xen/include/public/hvm/hvm_op.h
> @@ -166,6 +166,17 @@ struct xen_hvm_get_mem_type {
>  typedef struct xen_hvm_get_mem_type xen_hvm_get_mem_type_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_get_mem_type_t);
>  
> +#define HVMOP_set_ecam_space    16
> +#define HVMOP_get_ecam_space    17
> +struct xen_hvm_ecam_space {
> +    domid_t  domid;
> +    uint16_t pad[3]; /* align next field on 8-byte boundary */

The comment, as is, is wrong for 32-bit HVM guests: There ...

> +    uint64_t addr;

... this is only 4-byte aligned, and hence the entire structure only
has 4-byte alignment, and hence the padding also only guarantees 4-
byte alignment.

Jan

