Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vkf8ESIsTmoyEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 12:53:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930337248B2
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 12:53:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=DsAIu8ji;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356852.1611384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whPti-0005R7-MC; Wed, 08 Jul 2026 10:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356852.1611384; Wed, 08 Jul 2026 10:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whPti-0005OP-JM; Wed, 08 Jul 2026 10:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1356852;
 Wed, 08 Jul 2026 10:52:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whPth-0005OJ-4n
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 10:52:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whPtg-00Ax3k-Cv
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 12:52:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4e2be7-e002-0a2a0a5209dd-0a2a4505e36c-46
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 12:52:56 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4e2c08-3cb2-0a2a45050019-d155dd34c50e-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 12:52:56 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47640541585so312060f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 03:52:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1e6ccsm42166741f8f.5.2026.07.08.03.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 03:52:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1783507976; x=1784112776; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zU6xXyd+I2Z7NZXB9gI8gPCFhJkd44KzgVFlD6YS8gw=;
        b=DsAIu8ji8X1Y8zQBFpOR71Zm7p6zoTSXnz5FzNkIHZZAhoXSB4XtCBfrb7CisXoVvI
         Ce1jLuz1QR4uAQFpJrUonnIafZinxUQkJpNhLd9WwedvLEdNoKM1uq6nfo9gDWBPYY3C
         1HBdXglwj+STWqPFc/n6KPLlym1ID8Hs9oQ5uAP5mIdva8XtZfD0Ads2FTgArzqZuP+n
         ZNKd3GBhRIq19ZwYRNQbwSgREqBhzFgzLq7wH4EUMj63czRfnaRx/krD+Pu4TsQXfdjQ
         HhERTNStdbGYep8M7RWocGnZAhrDNyBkaKnAsW4Zf8QiPHQzHJX9ipoFT9ik7GLc/9vq
         BSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783507976; x=1784112776;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zU6xXyd+I2Z7NZXB9gI8gPCFhJkd44KzgVFlD6YS8gw=;
        b=Y0LC4HQ3PLWvPSqmomAY6rHvf5Z4VK4ZFFeypK6BxLLrCk88ZGnea/AlKhKsNmN08R
         Bu6SIoYYZsC70obk1bZpSeAh5K78mOzWosJpMVxOqA1jIuzSV1629RHm2eJons3A3Sp3
         LpXgG46HClgcZVPOHzGulLl1P3vms/q98EcvyF/foDCExJFQZOyD89KRFr5WVTY75Vkp
         DjB6cQOW624JnAtb4d9MaZSoqzXhgQRg9mBSCzGbssFSBYuBmZFm7OFNNQd5EtldNvic
         MBrNNEaS7tyILgPYJMw8Ww8JNZjU3oby/RZmP08q4rwl4gHcaryK1J556ruuGPCo+2SX
         y4CQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOtYerPzSNNTZOPWi0w4mzBS6yVBtPtVb/LOpVQ138PSIVklC9u1XjaWX5SHqzUh4j+Ji/hzndJCY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1kKpHSjXpGfBwFORXeZ/ETKbetN/iRkyd1vRf9LvEdEZSZwKU
	Omz4xJdtSnQpB57POK/yZLwY8cgCLbciWM13qzPSE/LJLsGgMEmaYDwh1XaCld95xw==
X-Gm-Gg: AfdE7cmWCNiIoq/Raqf2nSlLZaeYLtELerZJzxNx7J5CdPrmj6y1nMsm9gdgeMSY8WQ
	lgB344mWT9Vmqh4KhwjCGtUvooR3y6YU1yWHObkdYuWNtuGCg9tx/xG8a3lZP6Md5RyLBqy7cFk
	S7sskJI7PbM1U09H3rtPVLHA4NFzRO5xU+VBCtlnatXp6UmqxCMfxnnTd+bs/43gW6g61qU3IGL
	mJuRNoLtzEpj3MHBhEroUsN1YelkMum7Y55HX4LPGn/ZqTkeOGgbmF/nvDBIy6SwsiPIXpTSX96
	r8Xni5jmeFMaqHGSeTM/TBCSVPa0n+a29+iZOA0fh+F5qmnRZa2coSLBq0wELwYFEsQyQFA1aOh
	bEDqF08vMex/zzjtGL5F4xyy+elCfwjUAb10sKyupZ3S3dpBOHsdZ23I8NkuYq0pL9b6U1BjUfz
	aS2U7Sln28zfa9oWh3yfvyo4wxA+QYn8GtyrsGZB1/3rlFP+BFhSTytHOYRHLDlbyCTFE7GvQ4s
	7fr
X-Received: by 2002:a05:6000:3110:b0:472:67de:27c2 with SMTP id ffacd0b85a97d-47df077a95dmr2065638f8f.40.1783507975726;
        Wed, 08 Jul 2026 03:52:55 -0700 (PDT)
Message-ID: <2853c8c1-ea7f-46ba-ac65-a7473e9d3689@suse.com>
Date: Wed, 8 Jul 2026 12:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <6948fb2823ffa41cf2eabbd87952b236e4f379bf.1783085655.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6948fb2823ffa41cf2eabbd87952b236e4f379bf.1783085655.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1783507976-553E72B8-12B715D5/0/0
X-purgate-type: clean
X-purgate-size: 4050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 930337248B2

On 06.07.2026 17:57, Oleksii Kurochko wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -40,6 +40,9 @@
>  
>  #define consumer_is_xen(e) (!!(e)->xen_consumer)
>  
> +/* Defined below when !CONFIG_HAS_SHARED_INFO; call is DCE'd otherwise. */
> +void evtchn_none_init(struct domain *d);

The definition wants to be static, so this declaration needs to become
conditional. Assuming the evtchn_port_ops_none block can move up in the file,
it could be put in an #else there.

> @@ -1323,9 +1326,13 @@ int evtchn_reset(struct domain *d, bool resuming)
>          rc = -EAGAIN;
>      else if ( d->evtchn_fifo )
>      {
> -        /* Switching back to 2-level ABI. */
>          evtchn_fifo_destroy(d);
> -        evtchn_2l_init(d);
> +
> +        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
> +            /* Switching back to 2-level ABI. */
> +            evtchn_2l_init(d);
> +        else
> +            evtchn_none_init(d);
>      }

Do we really need to call evtchn_none_init() here when FIFO is available?
This is connected to ...

> @@ -1622,9 +1629,45 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
>      }
>  }
>  
> +#ifndef CONFIG_HAS_SHARED_INFO
> +/*
> + * Placeholder ops for domains with neither a shared_info page nor (yet)
> + * a FIFO control block.  None of these are ever reachable in practice;
> + * they only exist to keep d->evtchn_port_ops non-NULL.
> + */
> +static void cf_check evtchn_none_set_pending(
> +    struct vcpu *v, struct evtchn *evtchn) {}
> +static void cf_check evtchn_none_noop(
> +    struct domain *d, struct evtchn *evtchn) {}
> +static bool cf_check evtchn_none_false(
> +    const struct domain *d, const struct evtchn *evtchn) { return false; }
> +static void cf_check evtchn_none_print_state(
> +    struct domain *d, const struct evtchn *evtchn) {}
> +
> +static const struct evtchn_port_ops evtchn_port_ops_none = {
> +    .set_pending   = evtchn_none_set_pending,
> +    .clear_pending = evtchn_none_noop,
> +    .unmask        = evtchn_none_noop,
> +    .is_pending    = evtchn_none_false,
> +    .is_masked     = evtchn_none_false,
> +    .print_state   = evtchn_none_print_state,
> +};
> +
> +void evtchn_none_init(struct domain *d)
> +{
> +    d->evtchn_port_ops = &evtchn_port_ops_none;
> +}
> +#endif /* !CONFIG_HAS_SHARED_INFO */

... we wondering whether any of this is needed when FIFO is available. In
v4 all that was noticed was that SHARED_INFO=n together with EVTCHN_FIFO=n
is a problem. And having fewer cf_check functions in the build is always a
win (I think).

As to the comment saying "None of these are ever reachable in practice":
What do you base this on? In the SHARED_INFO=n + EVTCHN_FIFO=n case they
look reachable to me.

>  int evtchn_init(struct domain *d, unsigned int max_port)
>  {
> -    evtchn_2l_init(d);
> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
> +        evtchn_2l_init(d);
> +    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
> +        evtchn_fifo_init_ops(d);
> +    else
> +        evtchn_none_init(d);

Note how here you actually call evtchn_none_init() only in the one special
case. Imo this model should be followed also in evtchn_reset().

> --- a/xen/common/event_channel.h
> +++ b/xen/common/event_channel.h
> @@ -55,6 +55,7 @@ struct evtchn_expand_array;
>  int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
>  int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
>  void evtchn_fifo_destroy(struct domain *d);
> +void evtchn_fifo_init_ops(struct domain *d);
>  #else
>  static inline int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
>  {
> @@ -68,6 +69,7 @@ static inline void evtchn_fifo_destroy(struct domain *d)
>  {
>      return;
>  }
> +static inline void evtchn_fifo_init_ops(struct domain *d) {}

Why would this be needed? You (again) only need a declaration, just that it
needs to live outside of the #ifdef.

Jan

