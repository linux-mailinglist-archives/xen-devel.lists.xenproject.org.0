Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ybmGGbqAQmrW8gkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:27:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB66DC049
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:27:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=LRYrPsCa;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347581.1605423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCwq-0001ak-KU; Mon, 29 Jun 2026 14:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347581.1605423; Mon, 29 Jun 2026 14:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCwq-0001ZH-Hf; Mon, 29 Jun 2026 14:26:56 +0000
Received: by outflank-mailman (input) for mailman id 1347581;
 Mon, 29 Jun 2026 14:26:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weCwo-0001Xv-JS
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:26:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weCwo-00D9y0-04
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:26:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4280a9-2eae-0a2a0a5409dd-0a2a4502c552-12
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:26:53 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4280ad-5a27-0a2a45020019-d155dd2be19b-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:26:53 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-461edb387ddso3250315f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 07:26:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-472c7bec9c2sm15399181f8f.12.2026.06.29.07.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:26:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1782743213; x=1783348013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+58CVHUS93COtzJZpXCrKMYhN+LghCBez6NaEl5WcUI=;
        b=LRYrPsCapiDS+r+kB25QyygxeJM3JhE6J4VPo95DfKvLJ8x22/kFtOc4TrDiOQXMZm
         RlJk7c31fghp6ejcBhlZDH+RNzyMvW6ZbaxMYIhJM17tZN7LuvuyY2qunTTBBPNN0wwA
         AR7NeoDvVY0dWhHM+DfS+7cg9W6xJo53afLU1KkWJUMKg7RyqFHgF/QJiut7B4MdzQK/
         i7gtOs3rlFrB/KbPW0p9Ikl1TD6jxZbNaKhZepGdmVq86WPkgvbl8LoJHBUxiP+W5mOE
         rvapVe6e/kWhFypJpPK1CXGEIwY/GHhAXb0Ed3ePyg6gRedrH3LkKPxyDHNzsaziqMb5
         cOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743213; x=1783348013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+58CVHUS93COtzJZpXCrKMYhN+LghCBez6NaEl5WcUI=;
        b=dN/DnEJjB86FDjVokXgPIOtSPDp8uyi01oY5wA6LpY2Rv7hNj4iDKsapm2XLYAsdpU
         Yc22MVUvPHKq9LO1WBt4YTJqdZs1j0S+lGpAtQpzTVYRpFZqICIYE99u7D7EU4/yCkdd
         RtwcEw8rvzBrPsehYzFPTkBDPCfCsaXxSgDAL8EiE6umRbLv8/MatIJYPMcxyMfCBxQw
         CQZy/wv1xH1le3yv/JP2Hsh/MYtZGJ1Cnmu1RFPGUBUzdx96ehNSqNyxpGY2eE0gm3ZB
         rawbySSg9BOYK9t8wPSvpxZ7NAbJ429aW2wkISnTlvUDfq7eVN6/9Ph2H4SaSVv8gLEX
         ysJA==
X-Forwarded-Encrypted: i=1; AHgh+RoheZZqxAAPWlTrFPhJabTMC268V0yt/FlMKTaGi86wU+OLTP+SfT+NoDlrWmKqbT3tyQP8mrZRYec=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeT1DE0DlwhWu4cuQtz9Qh6j5iF88aQfp86BfLMTv+L/f7LJOm
	D/XnzaFcTgBo/yp73JiBCK7DnmQN/dTPDGN0zu5oJS3QgzpmsC4iw3vTJOQCR5VvpA==
X-Gm-Gg: AfdE7cnOWCYWVFaOfhBYzXZiXvSaIm5seNQKiRjXzjcTGwubhc4bWqHxpUzSyKhseuG
	utBYLpkuWu9eWpPfUWPuJqBsjwHsu+mErDGXGFgVEJXMNzbRN6w9AGdnU5n7SB80e2yRM6PUQPN
	juKj+aP34is/QlRTDsw2k5zOw3ifSZ2jQPs3UlzCuCZ55MVsXvZokszZ8ccn/shiawn6Hhazt1e
	w9Zlt/6Seh5rqjwEnMKUDISXxVJYPG4qg8AuHMbtjPiDJVHK/SfwmfzupuJpLVqlZ+PojQpbRES
	kjGT4/OiYhO4syxyFGWhYB+qUf654yge73KzSW2mAtevQXzV70O0VCi8vKVhxvW9+y19YXIFni/
	G/MI88qRp2EgZa6sJ7esWE6o/LdhLmZA9tduvpzOTaoQYG/tZOYtW18CrcM0U6c0mvPRUPwk5qv
	tC/sg4l3rdjvG5CZq2KS+qWGZ21jqn2Q6/aYZ/zwxrPMcYB1420T3s83YU6nMeremwVGAGJQJHN
	7ca
X-Received: by 2002:a05:6000:40c8:b0:472:c96c:eeb with SMTP id ffacd0b85a97d-472c96c110cmr9632849f8f.0.1782743213242;
        Mon, 29 Jun 2026 07:26:53 -0700 (PDT)
Message-ID: <5d344cec-bb97-4d3b-87ff-e7175772fd45@suse.com>
Date: Mon, 29 Jun 2026 16:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, xen-devel@lists.xenproject.org
References: <775c88457e5ec7fc7889002c6f9829669f9bce97.1782388193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <775c88457e5ec7fc7889002c6f9829669f9bce97.1782388193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1782743213-4CD007C5-AF690B61/0/0
X-purgate-type: clean
X-purgate-size: 3982
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6DB66DC049

On 25.06.2026 18:02, Oleksii Kurochko wrote:
> On architectures that run guests in dom0less mode without the PV ABI
> (currently RISC-V), no shared_info page is allocated and d->shared_info
> remains NULL throughout the domain lifetime.  Several places in common
> code access d->shared_info through the shared_info() macro or directly,
> causing UBSAN null-pointer errors on such architectures.
> 
> Rather than adding runtime NULL guards that are logically unreachable
> on x86 and Arm (where shared_info is always allocated), introduce a new
> Kconfig symbol CONFIG_HAS_SHARED_INFO selected by x86 and Arm.
> 
> On !HAS_SHARED_INFO the shared_info() macro expands to a dereference
> of a pointer returned by shared_info_absent(), which is declared but
> intentionally never defined.

This looks to need updating.

>  Any use of shared_info() that is not
> dead-code-eliminated will therefore cause a link-time failure, making
> missed guards impossible to overlook.
> 
> The 2L event-channel ops call shared_info() and must not be compiled on
> architectures without a shared_info page, so event_2l.o is gated on
> CONFIG_HAS_SHARED_INFO.  On such architectures evtchn_init() installs
> the FIFO ops as a placeholder instead; evtchn_fifo_word_from_port() is
> guarded against uninitialised d->evtchn_fifo so the FIFO ops are safe
> before evtchn_fifo_init_control() is called by the guest.
> 
> With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
> dummy_vcpu_info, so writes through vcpu_info() could leak data between
> vCPUs. Reviewing the write paths in common code: the write in
> map_guest_area() stores the constant ~0 so nothing serious would happen
> if it were leaked; the event_2l.c paths are unreachable because the
> preceding shared_info() call would trap first;

Why "trap"? You can't build an image that way, can you?

> @@ -1624,7 +1626,11 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
>  
>  int evtchn_init(struct domain *d, unsigned int max_port)
>  {
> -    evtchn_2l_init(d);
> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
> +        evtchn_2l_init(d);

For this to build when !HAS_SHARED_INFO, all you need is a declaration of
the function. The compiler will DCE the call. Hence ...

> --- a/xen/common/event_channel.h
> +++ b/xen/common/event_channel.h
> @@ -44,7 +44,11 @@ static inline void evtchn_port_print_state(struct domain *d,
>  
>  /* 2-level */
>  
> +#ifdef CONFIG_HAS_SHARED_INFO
>  void evtchn_2l_init(struct domain *d);
> +#else
> +static inline void evtchn_2l_init(struct domain *d) {}
> +#endif
>  
>  /* FIFO */
>  

... this hunk should be unnecessary?

> @@ -55,6 +59,7 @@ struct evtchn_expand_array;
>  int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
>  int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
>  void evtchn_fifo_destroy(struct domain *d);
> +void evtchn_fifo_init_ops(struct domain *d);
>  #else
>  static inline int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
>  {
> @@ -68,6 +73,7 @@ static inline void evtchn_fifo_destroy(struct domain *d)
>  {
>      return;
>  }
> +static inline void evtchn_fifo_init_ops(struct domain *d) {}
>  #endif /* CONFIG_EVTCHN_FIFO */

Unlike these two. Which raise a different question though: What will be the
behavior when EVTCHN_FIFO=n and HAS_SHARED_INFO=n? Taking
evtchn_alloc_unbound() as example, afaict evtchn_port_init() will stumble
over a NULL pointer. Looks like for that (and only that) case we still need
your earlier dummy fallback.

> @@ -420,6 +423,11 @@ static const struct evtchn_port_ops evtchn_port_ops_fifo =
>      .print_state   = evtchn_fifo_print_state,
>  };
>  
> +void evtchn_fifo_init_ops(struct domain *d)
> +{
> +    d->evtchn_port_ops = &evtchn_port_ops_fifo;
> +}

Isn't this unreachable code when HAS_SHARED_INFO=y, violating Misra rule 2.1?

Jan

