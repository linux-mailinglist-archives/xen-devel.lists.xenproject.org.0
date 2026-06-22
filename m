Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2rBCJjMSOWpLmQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 12:45:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B86AECED
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 12:45:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=GeyxewuE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343618.1602873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbc92-0008Nd-Bs; Mon, 22 Jun 2026 10:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343618.1602873; Mon, 22 Jun 2026 10:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbc92-0008MI-9L; Mon, 22 Jun 2026 10:44:48 +0000
Received: by outflank-mailman (input) for mailman id 1343618;
 Mon, 22 Jun 2026 10:44:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbc90-0008MC-W5
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 10:44:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbc8z-005hHO-NT
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 12:44:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a391211-5cb7-0a2a0a5109dd-0a2a450c9792-30
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 12:44:45 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a39121d-94a4-0a2a450c0019-d155dd30e557-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 12:44:45 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-46066e640easo2507243f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 03:44:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46667221de7sm24401088f8f.33.2026.06.22.03.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 03:44:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1782125085; x=1782729885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LjYYBC+PySamCowp98NQsvisf2cTKrktagoqgALZYWM=;
        b=GeyxewuEua6tf44cTCyWAuVvBw7JKochuC1eoP8QgGBrKtvw/qdf3Wq4fQvtHncX5o
         OSPv6yNALqdef9PWjcKJbe+mc1RnxBUdoKv/EQWtpznmkxSynjvrR+KcV7xIs4atSZFH
         z7K9DtpkFDCY7o2Fv3HiIxgB8ZrSGGn53C8u8XAYmBMVfdkhMIFSd4WjQg6ao18WnALI
         I6GoJeykX7ou8uXx/VvGm8L5945Uma/vZgjPOVUscoi2TxTwBHid483OtUmUJVjEXNUY
         Mq81gwkp245q/mJn5rDD//e24Lat/QpkuMaNzjpTGWR29E5SeBvDC2dSJ6uQLvn6pKcq
         jqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782125085; x=1782729885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjYYBC+PySamCowp98NQsvisf2cTKrktagoqgALZYWM=;
        b=DzF0yojhvCskTKto5Npsk1h0SSbeReJSaTn8wRWCa/uQ3RzyHtUI56ewPsdq6cUFeM
         8E96asWO0x1Ip3h1nBSpva/Zlg0MnGCouLMDURPUEUqvU9xIgHGfYdBpOZ3uecNcAqbJ
         GGIp8ZNcPNjBPKWmgt8aSa4v7nSPjJtk8Ix2Rjfj+H3vnkbo++BBpJWYAA1ByIeOft9W
         OHvXxIdiMniGA3TErgQMc1DugijDmSbcmXftJOzs6SOu4RYzAD1lvnMoZx4soZzunF8e
         gP/LAI4wPZ+0kGgEVrpC2kibhXctcRYEOs7zx+3vXu/4zHlz6Vy+XvFltzK7wbbA888a
         0Zqw==
X-Forwarded-Encrypted: i=1; AHgh+RqTJK4xE9gKLqvGjwFip6yduK5B+TVXyMmsOUFgywjQ6Vp/+GYkV4S5heMDAiBgKcyotlMIIY58+Dg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYCmOBNpkedLfwc4MXaulKnrsSbksmVTq5l4jXFG3f8ESJQhuQ
	+jKudiMe61zfF6KFe9kWiVIv00db1vNNILsQcO64NZtFoOz51jFJG5UbzlV4Jc6A7w==
X-Gm-Gg: AfdE7ckc+CwZISvb8IxfPWRX3gOExRUmc96UF9l/oNm0/A2fFL7rxCxC+gwIc0oqzh8
	dBs8ZItg2wHqhrL+DMYZRm3VNKqsl+LPDUXAyhaAoPplUcZ1fvzH3JZ175bAu6vw4YWIxZkEfiA
	2P3F9I3ZdhctUmz1xTA0ZMqAgE/ZdVeCihAxF5kPgjXC6tlVZ6VrwUC5tflfgV7Z8Cis9ocVJWn
	fzn/+GXl6CLwUbBjFgFQh6+thN6y3xplaIAFcCMXmoGLPlG2MpBt01hhdh+CdHqL0z0Ka480usD
	chAKghqyVHni6e6YjqZnbxYDfU/yiDg9i2BkKKEPLuCiyq8QSfRh6WoZ3a67J7hiVAe8druCSpO
	tkh39mpNt1TBRsAxKaItLwx996byz9RCaabmCX+IuMXtIETuLoiufpQOgnDzOw23eWUgSD8C4Sp
	gSoUxeDwNBX2IRWWRpde3eniVfr96hIPaqJDhvGhQ7zwqWiVVzRUxQCTTuGUaJMD9s1X5L7XcMJ
	HQD
X-Received: by 2002:adf:ebc5:0:b0:461:a15f:6df4 with SMTP id ffacd0b85a97d-46509f4d2e1mr19505923f8f.35.1782125085084;
        Mon, 22 Jun 2026 03:44:45 -0700 (PDT)
Message-ID: <81417260-2313-4bb4-b3bb-21ca3a5d22b3@suse.com>
Date: Mon, 22 Jun 2026 12:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] xen: implement new foreign copy hypercall
To: "Daniel P . Smith" <dpsmith@apertussolutions.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <freddy77@gmail.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-13-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260619130501.272832-13-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782125085-539E2ABF-58D27519/0/0
X-purgate-type: clean
X-purgate-size: 1245
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,lists.xenproject.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:freddy77@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 016B86AECED

Daniel,

On 19.06.2026 15:04, Frediano Ziglio wrote:
> @@ -1545,6 +1545,139 @@ static int acquire_resource(
>      return rc;
>  }
>  
> +/*
> + * The "noinline" qualifier avoids the compiler to create a large function
> + * consuming quite a lot of stack.
> + */
> +static int noinline mem_foreigncopy(
> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> +{
> +    struct domain *d, *const currd = current->domain;
> +    xen_foreigncopy_t copy;
> +    int rc, direction;
> +
> +    if ( copy_from_guest(&copy, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
> +        return -EINVAL;
> +
> +    direction = copy.flags & XENMEM_foreigncopy_direction;
> +
> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
> +    if ( rc )
> +        return rc;
> +
> +    if ( copy.nr_frames == 0 )
> +    {
> +        rcu_unlock_domain(d);
> +        return 0;
> +    }
> +
> +    /*
> +     * Check we are allowed to map and access these foreign pages.
> +     */
> +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
> +    if ( rc )
> +        goto out;

can you please clarify whether such a re-use of an existing predicate is
acceptable?

Jan

