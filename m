Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NW7JeJS1mm8DQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 15:06:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A583BC8EA
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 15:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276054.1561676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wASbg-0006CU-Hx; Wed, 08 Apr 2026 13:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276054.1561676; Wed, 08 Apr 2026 13:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wASbg-0006AE-FI; Wed, 08 Apr 2026 13:06:08 +0000
Received: by outflank-mailman (input) for mailman id 1276054;
 Wed, 08 Apr 2026 13:06:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wASbe-0006A8-Jj
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:06:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wASbd-0022Ft-L4
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 15:06:05 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d652b4-2eae-0a2a0a5409dd-0a2a45089810-40
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:06:05 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d652bc-fab6-0a2a45080019-d1558035e9db-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:06:05 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so43851465e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 06:06:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488a3d6944bsm354821005e9.11.2026.04.08.06.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 06:06:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1775653564; x=1776258364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OnD147fsXayD4z4+xk5Eo9TO2Q3YPYXOTJ17GarW4qE=;
        b=T4nkiMr4dvn67/pbp7IBryxC/ZO1egg3v52w1FMlf6QCMoAOjKSlxY+61YSzK0iT75
         TEYy60XgtXKgHvKYnPeOrPzrfUmQ1XxEDpCSxRgnfebMXU9xRg3/v5a0+cgeW1dnZMnA
         /xUXkunpgocSHaBc0NiKtRLLDpTYpHLabmnlIO80Om7tEpiMbNPx2FR08UTTyDn3lsY2
         ne9bv6q5ehukWjcdrVtdvSvimDgzabCuC6yMws7RRZlPpK7eEbxgVMPhBydNGzMniOXs
         48WZkpzoHw6aI4bQeKVkTM/7z6XW4bgSQPSkfMx9OjqSEQos7tE5SK2QJZDcqODEORy+
         S74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653564; x=1776258364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnD147fsXayD4z4+xk5Eo9TO2Q3YPYXOTJ17GarW4qE=;
        b=iHUfPEpNK9xhn2AsYzE7HgdJ3aGbVojeJA9/ySNtecTojzdW14hXpQH9udwGAUExg5
         2Tx9ZyaVusQ8h7ZZIKA7UE4cMLbaPe5eMC/QLyfs6WLaQsK12XCjPwgzFBM+jaiIL8Ld
         C6MIBcPUnrZG6TRIdoqFaCA9h6tbqba7Dan/a0N36r9wD98cWgB/d9v+esSmUsLpWUbg
         DWEiFzwXzVkmtknhLanPxI9QV9gvT+vC614xIEJxJ6F1f1WVhkEhxUOSGl0hQn7HLOom
         0v2K4paOKd2+HGawIzlRk3m7F9xcXaNjXTUjYUQnS7awgQ6P17sjb0w8wmeyI0H4dqGE
         jErQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3OJWQhEsVWFAB1CUNiQbIrhRqI564an8UoZlbeNY2Tw9rbXwnhbmRuV1rMNMv1BmjNONoLuxMgjg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+gzLJMbCJu0ZIx33+BhDf1Oo45UXWVSemp7ZQAPQaE6RhalzF
	PVAd2bJHRLheKg27e5vaPRDeg6YezxJ49awpOInJr+3UhA9sJF8kWrUONwyr8y9bkg==
X-Gm-Gg: AeBDieuHB6Rw6f4x8bNyev2+hz2oC/xr3d2gjRKwjWJLyGJlh9mWtq+44e+eo0mdbKA
	/6D9uKJnyxnFN7z8Q4/CPhswgEJdI3L11vqrZhTIZW/k7jZCduvwOjYNZlTaOYu9Tjr3tCogXS4
	1AiRhCyHkESHAjg4eaDTBOF3IyI3IipbFyUmVPk+Of3aucH51Y/Y6zQskTA46yCpcjpff6wv0D1
	vEzUN4ErgGgT2booxfF8VGvIJKbgTczKJPfnCjaSENlDk29yZBqfJjSOTf9iSdC7qefdL26vUxE
	aYgjLg+fIU4lksMQnn/c9eFh8OV+BC8gJbV4bzxjl3VZfUlbEsjLx6CYaGKKYTYMl3aLl1Hx3Xb
	gpye9Slze2S/mF3p5JkVLWWankmqHpwempfUvn8UAg5fsGub6dizKPyvoS1jPlPCrhkTOofnwfy
	CKrLk+9OWT2cC7f69A/79x8THGVkQKkaeDfjcxpCJCfjoGEzGRDeJ+XkQ2Euw4LVMuA0zLLbmzZ
	Dmyf8tw/tyQ+Is=
X-Received: by 2002:a05:600d:1b:b0:488:b8bc:6a32 with SMTP id 5b1f17b1804b1-488b8bc6cc9mr100600785e9.23.1775653564412;
        Wed, 08 Apr 2026 06:06:04 -0700 (PDT)
Message-ID: <d53d2b06-56d7-43bc-bb20-4df7b7bc3ca5@suse.com>
Date: Wed, 8 Apr 2026 15:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/domain: make shutdown state explicit
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <e9c45be41bb36ca341dad57196c753fbe82d1526.1774998397.git.mykola_kvach@epam.com>
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
In-Reply-To: <e9c45be41bb36ca341dad57196c753fbe82d1526.1774998397.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775653565-7654F497-8EF1F296/0/0
X-purgate-type: clean
X-purgate-size: 3942
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D8A583BC8EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 08:41, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The shutdown flow currently overloads is_shutting_down and
> is_shut_down to represent multiple phases of the shutdown lifecycle.
> Some users treat is_shutting_down narrowly as "shutdown still needs to
> be driven to completion", while others rely on it more broadly as
> "the domain is no longer in its normal running state".
> 
> Make the lifecycle explicit by introducing enum
> domain_shutdown_state and helper predicates whose names match their
> semantics: domain_shutting_down() for the transient phase,
> domain_shutdown_completed() for the final state, and
> domain_in_shutdown_state() for checks that need the union of both.
> 
> The conversion is intentionally not mechanical. The old flags were not
> mutually exclusive: once a domain became fully shut down,
> is_shutting_down remained set. As a result, sites that previously
> used the absence of is_shutting_down to exclude both the transient and
> completed states now use domain_in_shutdown_state(), sites that care
> specifically about the final state use domain_shutdown_completed(),
> and only paths that still have work to do before shutdown finalization
> use domain_shutting_down().

In how far is the distinction between domain_shutting_down() and
domain_in_shutdown_state() really necessary? What you describe above
still leaves me pretty clueless as to almost(?) all of the uses of the
latter (where I think the former could be used just as well). Many
paths simply can't be taken anymore for a fully shut down domain, so
the distinction between the two is moot there.

I'm also concerned of the name domain_in_shutdown_state() itself. To
me this is far closer to domain_shutdown_completed() than to the union
of both states. See how e.g. x86 CPUs can be "in shutdown state", i.e.
not responding to anything but a reset or init signal.

IOW an entirely mechanical replacement might in fact be easier to look
at. And in the one rare case where the distinction might indeed be
relevant, "domain_shutting_down() || domain_shutdown_completed()" could
be used.

> @@ -1423,9 +1423,12 @@ int domain_shutdown(struct domain *d, u8 reason)
>      return 0;
>  }
>  
> -void domain_resume(struct domain *d)
> +int domain_resume(struct domain *d)
>  {
>      struct vcpu *v;
> +    enum domain_shutdown_state shutdown_state;
> +    unsigned int shutdown_code;
> +    int rc = 0;
>  
>      /*
>       * Some code paths assume that shutdown status does not get reset under
> @@ -1435,10 +1438,18 @@ void domain_resume(struct domain *d)
>  
>      spin_lock(&d->shutdown_lock);
>  
> -    d->is_shutting_down = d->is_shut_down = 0;
> +    shutdown_state = d->shutdown_state;
> +    shutdown_code = d->shutdown_code;
> +
> +    if ( !domain_shutdown_completed(d) )
> +    {
> +        rc = -EINVAL;
> +        goto out_unlock;
> +    }

I can't help the impression that you're mixing two things here - adjustment
to how shutdown state is tracked, and enforcement of completed shutdown
right here. This separate change likely would better be split out, and then
come with a description saying not only what is being changed, but also why,
and why the change is correct for both call sites.

> @@ -1448,9 +1459,17 @@ void domain_resume(struct domain *d)
>          v->paused_for_shutdown = 0;
>      }
>  
> + out_unlock:
>      spin_unlock(&d->shutdown_lock);
>  
>      domain_unpause(d);
> +
> +    if ( rc )
> +        dprintk(XENLOG_WARNING,
> +                "%pd: Invalid domain state for resume: shutdown_state=%u, shutdown_code=%u\n",
> +                d, shutdown_state, shutdown_code);

The shutdown code doesn't affect whether the function would fail. The extra
variable just to log it anyway is therefore a little irritating. Is there
any reason to this that I'm overlooking?

Jan

