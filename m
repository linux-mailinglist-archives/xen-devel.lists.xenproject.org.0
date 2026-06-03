Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gNyNJFMiIGqLwgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 14:47:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17E6637ACC
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 14:47:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=RouxEI3L;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326170.1591600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUkzj-0007me-EW; Wed, 03 Jun 2026 12:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326170.1591600; Wed, 03 Jun 2026 12:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUkzj-0007k2-Bi; Wed, 03 Jun 2026 12:46:51 +0000
Received: by outflank-mailman (input) for mailman id 1326170;
 Wed, 03 Jun 2026 12:46:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUkzh-0007jv-Rx
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 12:46:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUkzh-003oNm-4h
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:46:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a20222d-5cb7-0a2a0a5109dd-0a2a4503ccea-24
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 14:46:48 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a202238-672d-0a2a45030019-d155802ce8db-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 14:46:48 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4903997fcb5so127906765e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 05:46:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e13eefsm142582095e9.2.2026.06.03.05.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 05:46:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1780490808; x=1781095608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qyNcOrdGaK0X8nxgJV8B3RCDaFQWCaJC5NisgjaTWfM=;
        b=RouxEI3Ll3YiMvtQCbfyuZ0hSncROLdWvgdfjSJ/2HAFqVXOdasqG0ArJrWtPQ6U9M
         rDQZNDX6Nm381QTP2gkAVCsHzXyKljAx/8DxOnxcJeHzfMz6c8aGWMMCpcFSQ2bEdMkR
         aKouOgZDmGWP75vAOADnMIkKbdkeNIrlk7hF3oBHVRng7RrWeDQiDtp+jGzI755zPyPr
         sOhDadWrGomBGP/PWLSxnyKdiZ4k5VblPtuc3K2flsKPI2ulECbO0tkWP9xpn7Y2E+X2
         UrpGSwpKwb+t/pxvCIUxEGWDn74efErE+aUQltWWFvb0Bgaudytvxa0eGD6vYKXDRahO
         qrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490808; x=1781095608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyNcOrdGaK0X8nxgJV8B3RCDaFQWCaJC5NisgjaTWfM=;
        b=EL5/+BLimQmQDGiRrfSexxcdJSElfICwPEHD+nuQkFvKkyMKrpXYxgtcV26+sQrJR7
         X+9wHvSK2z2bUyyz7/h4y6zo7zWuzhAyha4jIuF5Xqz6Ykvtb3D0P2P+tkLsYjFn3hSK
         3qx9frRSaePgrF3LODaHGaHOVVu+h2Q/XZDgqBSBQdCnpGKz4elFSMJDx9ugy8j7HOsZ
         bn/agOMaqB3kZXkuyLqKvod65DOmJKq6+sl5G8IMwYu26Iu9d5hju3y7Um5t2e3uWSPC
         5dbRvNGJOnU7UKJ/o/9SCI4/U3XjUHKfyD51yBbeow0ICzPxEam/pDNWur+veK56lF3U
         0UqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Mn5iygtEcN3+4WpW+steEviJPgrDPz4M213fVcuWx7biYcZZMcA2sjEBWhatsFyRysnxCVj8NQ1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjvS59YRZDrkn2m88PmGSSlx0cYBxdGHblbqYiJ6D+JdJiy4QG
	/L3QEmhnFb9YeVN/sL4fWoZ+WXWbrLrSG9x4nemB05HKJM5YWvlTX6BPmvsg5EWxHw==
X-Gm-Gg: Acq92OGXOEwrepZxtt16k+UsR4kKdUb6Bnb7Tr5mgpNBX89ltVFQNCg8ABQ9v7RpsQg
	EEG/lLWQG/q1nwJaNVdL/M87CJgligHnFe3FqXPxvKoSz3JjVvymdrsQnuzV/2Zhl87E7rakJKu
	hUOV5ZDv3fVwOs9ciA52pkxY4H7j4vEMpBHQtFT/JC/vtS6MYOFKlxg6fI+HXNReb+ez5WC9Akr
	rCBUpnIwpyufeC6rvTn6mo5rxOOX1hrhr518lJjRxBBglAmB5BFijNxKyL1NLIwVd3kKF6L+CS+
	Tpe/gG98jI/LoxBK5UI6PU0ca62xhNJCZikV1P02ipyUBTsnvIvut1ZDTHztuaEV2dssdJPWoZZ
	f2MBgHzNv2fkzUj0miKSAzlcvLd4AJzrLVg7GIXbh6qGEbcqmhm4e9GKGvViD87SP1EY8KtQGIG
	2C8Yl3N7nF9Mbxk/jsyp1tcFfWelmlW8IJmhKbrLEDlAYNeDMFMQImm+7Ul1dgL/MScDDyS+izJ
	Izr8MASoxf3QvQguA73iRPVqg==
X-Received: by 2002:a05:600c:1387:b0:490:a29b:e72f with SMTP id 5b1f17b1804b1-490b5d1cec7mr58990145e9.4.1780490808209;
        Wed, 03 Jun 2026 05:46:48 -0700 (PDT)
Message-ID: <621305bb-1df5-4185-8690-da7b05548817@suse.com>
Date: Wed, 3 Jun 2026 14:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/domain: make shutdown state explicit
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <a32975d6d5a565690ec9b9f3619a98c4362da95b.1780124807.git.mykola_kvach@epam.com>
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
In-Reply-To: <a32975d6d5a565690ec9b9f3619a98c4362da95b.1780124807.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1780490808-4006F938-5BC68C73/0/0
X-purgate-type: clean
X-purgate-size: 4116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
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
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F17E6637ACC

On 30.05.2026 09:23, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The shutdown flow currently uses is_shutting_down and is_shut_down to
> represent the domain shutdown lifecycle. The two flags are not mutually
> exclusive: after shutdown completion is_shutting_down remains set until
> domain_resume() clears both flags.
> 
> Replace the two booleans with an enum domain_shutdown_state. Keep
> domain_shutting_down() as the direct replacement for the old
> is_shutting_down flag: it is true once shutdown has been initiated and
> remains true after completion, until domain_resume(). Add
> domain_shutdown_completed() for users that need the final completed
> state.
> 
> This makes the state transition explicit while avoiding a semantic split
> between "in progress" and "completed" at call sites where the old code
> only cared that shutdown had started and had not yet been reset by
> domain_resume().
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - Keep domain_shutting_down() as a direct replacement for
>   is_shutting_down: true from shutdown start until domain_resume(),
>   including after shutdown completion.
> - Drop domain_in_shutdown_state().
> - Make old is_shutting_down conversions mechanical again; use
>   domain_shutdown_completed() only for old is_shut_down users.

And indeed this is now much easier to reason about, correctness-wise.

> @@ -442,7 +442,8 @@ bool shadow_prealloc(struct domain *d, unsigned int type, unsigned int count)
>          count += paging_logdirty_levels();
>  
>      ret = _shadow_prealloc(d, count);
> -    if ( !ret && (!d->is_shutting_down || d->shutdown_code != SHUTDOWN_crash) )
> +    if ( !ret && (!domain_shutting_down(d) ||
> +                  d->shutdown_code != SHUTDOWN_crash) )

Please can this be

    if ( !ret &&
         (!domain_shutting_down(d) || d->shutdown_code != SHUTDOWN_crash) )

? Overall less indentation and fewer pending open parentheses at line ends.

> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -2370,7 +2370,8 @@ static int cf_check sh_page_fault(
>       * already used for some special purpose (ioreq pages, or granted pages).
>       * If that happens we'll have killed the guest already but it's still not
>       * safe to propagate entries out of the guest PT so get out now. */
> -    if ( unlikely(d->is_shutting_down && d->shutdown_code == SHUTDOWN_crash) )
> +    if ( unlikely(domain_shutting_down(d) &&
> +                  d->shutdown_code == SHUTDOWN_crash) )

While at it please correct the bogus use of unlikely() as well:

    if ( unlikely(domain_shutting_down(d)) &&
         d->shutdown_code == SHUTDOWN_crash )

> @@ -2494,7 +2495,8 @@ static int cf_check sh_page_fault(
>           && ft == ft_demand_write )
>          sh_unsync(v, gmfn);
>  
> -    if ( unlikely(d->is_shutting_down && d->shutdown_code == SHUTDOWN_crash) )
> +    if ( unlikely(domain_shutting_down(d) &&
> +                  d->shutdown_code == SHUTDOWN_crash) )

Same here then.

> @@ -382,6 +382,12 @@ struct domain_console {
>      char buf[256];
>  };
>  
> +enum domain_shutdown_state {
> +    DOMSHUTDOWN_none,

This likely deserves a comment, as it has to remain first (with value 0).

> +    DOMSHUTDOWN_in_progress,
> +    DOMSHUTDOWN_complete,
> +};

We further may want to make this a packed enum, such that ...

> @@ -552,10 +558,9 @@ struct domain
>      struct rangeset *iomem_caps;
>      struct rangeset *irq_caps;
>  
> -    /* Guest has shut down (inc. reason code)? */
> +    /* Guest shutdown state and associated reason code. */
>      spinlock_t       shutdown_lock;
> -    bool             is_shutting_down; /* in process of shutting down? */
> -    bool             is_shut_down;     /* fully shut down? */
> +    enum domain_shutdown_state shutdown_state;

... it occupies only a single byte here. We could then fit three other
booleans (or alike) next to it.

Jan

