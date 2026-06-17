Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wVOaDKugMmrW2wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 15:27:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6E969A16F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 15:27:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=ButMZYw1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1340440.1601465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZqI1-0007LA-0N; Wed, 17 Jun 2026 13:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340440.1601465; Wed, 17 Jun 2026 13:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZqI0-0007Id-T5; Wed, 17 Jun 2026 13:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1340440;
 Wed, 17 Jun 2026 13:26:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZqHz-0007IX-Et
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:26:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZqHy-003rLw-Hq
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 15:26:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a32a07e-5cb7-0a2a0a5109dd-0a2a45019f26-20
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 15:26:42 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a32a092-e031-0a2a45010019-d155802fd95d-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 15:26:42 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so45720415e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 06:26:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b1056sm53521201f8f.18.2026.06.17.06.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 06:26:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1781702802; x=1782307602; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Dqh6J2CFvojmdE0SZGBgddXjTPZEecTRbDAY0kH87k=;
        b=ButMZYw12ccsC4MQGqpO1D47O0PmV/2izvOqL+ybEGriWA6nNZcTrIcsUMpRHkKML5
         nQXrV9vXu0ykUxzy/d9yyPVBeeLM9rU9Rj9IDuUsc/lezMIKHQTIfkgLah9plkWMirxr
         stRhdOdiRU7+5m1YwE7k1NomLtEGwORJZBTvvDty+cntZvWhv5tB6kGqcYipM6mQDESh
         pzSQuNsSbFDPTjp6TsfWCffprjJKJMVqx+ltl17AukhVfGRlUpdS8a6JJIU6g8gRUS5l
         YleONXt7M/kcEa48CtweZhzeixzgtjfAUmvmKNVKzXrF7zw00mwbUmH1hA8JJUAKoL59
         0DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702802; x=1782307602;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Dqh6J2CFvojmdE0SZGBgddXjTPZEecTRbDAY0kH87k=;
        b=CkcV7KQ8voy7FqBgPHxiAMVijE8XXfCPrUK7t26tQBjtpGRNzrW5+PhZoTWHpQab3w
         TEcv2K21V99HxXfDJYCOu48eisuLnWP8mAjwtcvvOFDo40st36LPXxo45+4qX0sKZyB5
         0F2WYbi9Rf0tbESJIougo0y8w23pIHkCg3ov/aNXoFtQTyZKoxSXRqGpIcn9IfeSfVQz
         Xf1vsDRuQMrARdc7ZNTT/Fs8fZzi8bw/jLLWOCpC+Y1GSSHyfldXpmjj5c7cTj6yqeQ4
         4LOZdaZRwsiQTZOceMAudnOxHLh3BTv+cBspP5wWAmADX/SlIhbvqVecN+aQTKSGRFIB
         duFA==
X-Forwarded-Encrypted: i=1; AFNElJ9PWuOpEgUT7QWr4pFEzwc8rPIfosdZl6vg1fZEU8skXxeEW6M8MDcRjEgBxqyK3zGTvg0eVF/7Ngk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw77VQKu59P0J/b2IMVXxUsW15mfExEUs2ES40L8RH1MoDmFszR
	g3s6Xm5uv71crxNoVpvEMxeJFSz/G1bCzEEOpAi0wj2BWnw6Pubh1tICzxRa2/iwxw==
X-Gm-Gg: Acq92OFhnfrenL3vHk0qNFLtCl+dtg9CNOWjhACSiH45HbwuAYhT3Ji71jAI+VcEvnw
	+6GjTurvP9AKYROPETT4S7HQt/KDab5SWwSGZFEjucf/dH+e07B4oFeYff7InEZ/5PUrGBtQfdn
	4y4PmvxPqCJ3U0/xdfoqhDN5g38mSDRM4IbCBnhfQml+GAhe0AmlVlK8p+0NpDsV66m/1xu050Q
	c66IchDGQPTIMn3buVQKAOCEAoYxJw+VauFioFQcY5ScAvClgxWBA162F4Y5JvwnUO1yBkaP+oZ
	DpILTZJHQ3IDY2PogG8GdpIbzdiiy2w5md4lXqMQeC3zgPvvFE4mObpmseDV4S7NTjOyZQPQxy3
	KeS1tT9luD6Pf20BGUItqp1u/E6IW1ecoHvquLKBFs8YB+Vqc+4T/2JxPf0jBQ8F4b/7+HXZ+be
	qo5eweTZ6dxfKJpdy+dPBbAzxLjiOmuzCkAyXtrzAg1V74at6eNVUYUDvmKweadcqPsZg8svo+s
	CIs
X-Received: by 2002:a05:600c:5287:b0:492:834:24a2 with SMTP id 5b1f17b1804b1-492333b1529mr70529345e9.16.1781702801712;
        Wed, 17 Jun 2026 06:26:41 -0700 (PDT)
Message-ID: <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
Date: Wed, 17 Jun 2026 15:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
 <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781702802-CFBA4E30-5315BB16/0/0
X-purgate-type: clean
X-purgate-size: 2626
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F6E969A16F

On 03.06.2026 16:25, Oleksii Kurochko wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -320,9 +320,9 @@ void vcpu_info_reset(struct vcpu *v)
>      struct domain *d = v->domain;
>  
>      v->vcpu_info_area.map =
> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
> -         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
> -         : &dummy_vcpu_info);
> +        IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
> +        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
> +        : &dummy_vcpu_info;
>  }

While the change here is likely okay, it points at possible further omissions.
You've dealt with all uses of shared_info(), but you've left alone all uses of
vcpu_info() (and __vcpu_info()). Reads are presumably okay, but writes to
dummy_vcpu_info open a side channel for possible info leaks. Looking over uses
in common code, no code changes may be needed; extending the description may
be all that's wanted here.

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -1323,9 +1323,13 @@ int evtchn_reset(struct domain *d, bool resuming)
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
> +            evtchn_fifo_init_ops(d);
>      }

The "else" part isn't needed, is it? evtchn_fifo_destroy() doesn't undo
what ...

> @@ -1624,7 +1628,11 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
>  
>  int evtchn_init(struct domain *d, unsigned int max_port)
>  {
> -    evtchn_2l_init(d);
> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
> +        evtchn_2l_init(d);
> +    else
> +        evtchn_fifo_init_ops(d);

... was done here.

> --- a/xen/include/xen/shared.h
> +++ b/xen/include/xen/shared.h
> @@ -43,7 +43,14 @@ typedef struct vcpu_info vcpu_info_t;
>  
>  extern vcpu_info_t dummy_vcpu_info;
>  
> +#ifdef CONFIG_HAS_SHARED_INFO
>  #define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
> +#else
> +void * shared_info_absent(void);

Nit: Stray blank after '*'.

> +#define shared_info(d, field) \
> +    (*(typeof(__shared_info(d, (d)->shared_info, field)) *)shared_info_absent())

How about the simpler

extern struct shared_info *shared_info_absent;
#define shared_info(d, field) (shared_info_absent->field)

?

Jan

