Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKtJF/zvlmngrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:11:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9E15E30C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236132.1538894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt1wW-0000qN-UJ; Thu, 19 Feb 2026 11:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236132.1538894; Thu, 19 Feb 2026 11:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt1wW-0000nX-RP; Thu, 19 Feb 2026 11:11:36 +0000
Received: by outflank-mailman (input) for mailman id 1236132;
 Thu, 19 Feb 2026 11:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt1wV-0000nR-NF
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 11:11:35 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c02f7d1b-0d83-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 12:11:34 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so13516605e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 03:11:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a78c89sm473314585e9.5.2026.02.19.03.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 03:11:32 -0800 (PST)
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
X-Inumbo-ID: c02f7d1b-0d83-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771499493; x=1772104293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HwqsIFbcyGKtVBg/7HtA57MGGkjQtv2OBrHcPRAUMWs=;
        b=RnQvXDOBI5leFWUWUzCx5HJF8vsBJH86LLRda0ix7DHJIqvKKGwEUDXYv8OKzMsT2M
         qy/yH5JwY/80LK6TUM2/Lb7AbgUiYqZakDxjgbSQiqQ8GB3DBYNkPXdeoj92HYr6H6DF
         5LtDXsiPFBjMcM3FjCHr6A9tmRfR4LabJDp5bnUs697Dbka0b3Yo6ZivJE5Xs+s6ZAxt
         im0MdI5SjKOQ0DaQjhKbC6dxX29gDPJgy8SV2Dp33soZiJPRQXDFAVLhlaY26N9/bfTe
         OTC3pDZOSQErw7Bwqyt8Xqacf5a560d3ba7Qlju7NmXZuII8ghh9xg5Swn/iVI1uvBCV
         8DjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771499493; x=1772104293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwqsIFbcyGKtVBg/7HtA57MGGkjQtv2OBrHcPRAUMWs=;
        b=E8D52VIlTEb0HcViznkoetixOlPkyKzSmpKuezaqo6jPiGTqsqJ8VGJTVrD+8yaHHb
         eNlvob8C93b5XDUFTDvYmEQo0kXh9UxmZ4kSCu9EfKYkZCD+F5fYiU9vBBBZWeTENuRf
         Ziga9WwTK0QXYRK/Bu37F0p7Ix2jq0lQ/qTdQb5WRNKuXWthrdQqrOpV4VA04UJUp9Xm
         m41yQGAUelrxvvVzMEL+NOJff2Pf86LZbQSIyd184Hej/80RGuhAmVjRMhdbegIkjqjF
         CmtMa/Py5xQOgxDzaL9Gogb5G+sKNFfcFXo58U37cY+euFN86VBRK6LYOvFuDSKmxj/x
         l8lw==
X-Forwarded-Encrypted: i=1; AJvYcCXLo+28huYR+b/FsDsLvEUYeL3syORAC4dXIDlqm+Z5yIfrl0hkcXcFRpJMi9sC0vyshmBAGXO075k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5DH3cyRmYirOxEwdMz1HzznIy5Hh8yi/Uyw5P82MwovWo+Ukg
	0G/SLQ/AHpkX29fCyo8GzsoWfVcXFLKGzPJjpSE7i7RUb5vg7CuFJlom0WeJIN3EKw==
X-Gm-Gg: AZuq6aL2aVsu135/y2r2bqRODNW5ZwV47Xa7w5mFcvU/xpGc4bK7+1P8FA99w310ZLo
	cQA2x2JUcAF8gm0QLml6RCo3JwIAPw2VAGBR9BSojKtyNVJNDJlzJOA6R1NSIP8+V9I5/flNzhf
	8FyaaffDRK4YRXFNGexjk8gzuMu1hsF+nDIkmbBddsFQbirOzaGwF2ZsOw1mlXuLCmqR1bSFL3F
	mwt6MtheZcExk8g44cPE2b2sPJ1OrCuTIYyjokvX3qFrzJtPCYURUc5m54REmAeznH/bOGTFwPX
	k2TKq3Pd4VucZLhrxSADoayp+w24JGiHrGIK6Q+wL8eL9G/ALGGN918IKY1A5sDmuw+atWui86z
	DDT8dQOx8+LRhrSZTh3KQUALUYdTIzOP0CA53XZJOWSU7zmsH/I+SQ/xyQKVozy1RpPIp3hKfQ7
	aZKUuqn2J1NQoSsxYKntKkKyMVne9CaOviGGiKn9M1PRhmGrtQ/dsyrYeMxHEBS9FffrK/XfFaY
	4hgsMtHwBf86xwjhRyzOE0a5Q==
X-Received: by 2002:a05:600c:214b:b0:47e:e051:79ee with SMTP id 5b1f17b1804b1-4839fe90522mr19820665e9.3.1771499493410;
        Thu, 19 Feb 2026 03:11:33 -0800 (PST)
Message-ID: <afc94229-16d9-442b-974c-9f038f2300a1@suse.com>
Date: Thu, 19 Feb 2026 12:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
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
In-Reply-To: <20260218190855.7272-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BCE9E15E30C
X-Rspamd-Action: no action

On 18.02.2026 20:08, Daniel P. Smith wrote:
> @@ -238,28 +242,39 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>  
>      while ( dom_state_changed )
>      {
> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom + 1);
>          if ( dom >= DOMID_FIRST_RESERVED )
>              break;
> +
> +        d = rcu_lock_domain_by_id(dom);
> +        if ( d && xsm_get_domain_state(XSM_XS_PRIV, d) )
> +        {
> +            rcu_unlock_domain(d);
> +            d = NULL;

This looks unnecessary; the next loop iteration will set d unconditionally,
and d isn't (and wasn't) used past the loop. Plus there is also no such
clearing after the other rcu_unlock_domain().

> +            continue;
> +        }

This cleanup here also is redundant with the one done further down. Imo where
possible we should prefer to have only a single such instance, which looks to
be easily possible by using ...

>          if ( test_and_clear_bit(dom, dom_state_changed) )


        if ( (!d || !xsm_get_domain_state(XSM_XS_PRIV, d)) &&
             test_and_clear_bit(dom, dom_state_changed) )

or

        if ( (d && xsm_get_domain_state(XSM_XS_PRIV, d)) ||
             !test_and_clear_bit(dom, dom_state_changed) )
        {
             ...
             continue;
        }

albeit then the reduction of indentation of the subsequent code would cause
quite a bit more code churn.

>          {
>              *domid = dom;
>  
> -            d = rcu_lock_domain_by_id(dom);
> -
>              if ( d )
>              {
>                  set_domain_state_info(info, d);
> -
>                  rcu_unlock_domain(d);
>              }
>              else
>                  memset(info, 0, sizeof(*info));
>  
>              rc = 0;
> -
>              break;

I don't think the blank lines need dropping for the purpose of the patch?
Yes, they may seem excessive, but nevertheless some prefer to have rather
too many of them than too few. (Personally I don't mind their removal,
but that really doesn't look to belong here.)

>          }
> +
> +        if ( d )
> +        {
> +            rcu_unlock_domain(d);
> +            d = NULL;
> +        }
>      }
>  
>   out:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -860,12 +860,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          break;
>  
>      case XEN_DOMCTL_get_domain_state:
> -        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
> -        if ( ret )
> -            break;
> -
> -        copyback = 1;
>          ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
> +        if ( !ret )
> +            copyback = 1;

Nit: As you need to touch this, please switch to using "true".

Jan

