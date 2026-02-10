Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHBtLX1Ki2mWTwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:10:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694311C4EF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226481.1533002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppO2-0004sJ-Di; Tue, 10 Feb 2026 15:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226481.1533002; Tue, 10 Feb 2026 15:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppO2-0004q0-AG; Tue, 10 Feb 2026 15:10:46 +0000
Received: by outflank-mailman (input) for mailman id 1226481;
 Tue, 10 Feb 2026 15:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vppO1-0004Vw-7y
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:10:45 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abdd5e04-0692-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 16:10:44 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-436356740e6so3442971f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 07:10:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376b62b835sm22250788f8f.12.2026.02.10.07.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 07:10:43 -0800 (PST)
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
X-Inumbo-ID: abdd5e04-0692-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770736244; x=1771341044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nVqPTEOVCLjdnU5LqwG1Y1chfSEJ/sb9yT3ftbtAuLw=;
        b=Et7jLlAGrAbiFnNw5SmMLdiNvFWVzE34iaMggonfYSO4XIT6mMnOF1BKwU/1pw1IXA
         HK8R12du0fBlPOWJ3fpIbjQ22kFnjr9+aLFf0Pf2LouT3bvjPe1pMrgJ3/PV0cunh9WA
         QVE8c9Goo75TfaLNEGNEwO8EdctCZcnkHSuR6+4Jx/vIpgt3y5g7roIzQ7stMQ4TsZa8
         Bb7/5wU2kRd/UvguDnhpPfLG2L00gtjXG5L3Bh0IUoFQf5NCeAqZ8hvRlVA+3e1wp1FP
         5Y2038jT6BG1B7ualFJmbT988aplJnG2VUAqJQiKRPyTWL9TYzqL9oytXCBNSf+BQdoQ
         +wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770736244; x=1771341044;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVqPTEOVCLjdnU5LqwG1Y1chfSEJ/sb9yT3ftbtAuLw=;
        b=d/RFbpDKqT0M/b9ykbrQZk9DSzijSkacq3WxDUl9ocmE2OQ27R55JvrrjPaN6g8AUz
         qExW/UmYmx1gaHc+e4sRHR7TsefH0JSf3OrlF4Ry/daeyBPlWV9IXU4yBTyX7BN5YG2n
         hZR8X1041PypSPI0a6IkEnio+aBfiY5OXAIooZTIQnTLt+tHKAxjO2f8PxGb1Dhomaqt
         G/QL+x/n9kPmJ0zOvOz3A1Qv3aZTjU8rgzk/4NX3NqZr/VXcaxl8th4K4Jcawxsd8ybr
         SC7mQU7rv+SN0/STGpeRl2P0phursps6gK1HA/DsHtqkEEom1GqMw3wGfeOyK5Rb7QUC
         gIyA==
X-Forwarded-Encrypted: i=1; AJvYcCWtcnUMUC5lrzsd82oxTDLa9CdE8y4IuJdrarG/MIAehAUz4MYF4SDENOjvlWWKaL8SKKzejZbM5j0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3mof5sMo1FfN9m/KCoP5Exj22UadTOQo2aUPbqyjl7cvBC8eW
	5foKqMNSE8HXU3R8aKXJfR8jkhl3P+pmQYRlHBFASFVHngsd9CVX6oIT/th6hGrnRQ==
X-Gm-Gg: AZuq6aIxKcs3MdMCs9FQT5rUWbAKs/gTtokhYBYXj/tdqslU2+2Rz6VHBPw84yJDNZQ
	7qakzFarZss7U6DtWJAfPemcFCKj6R9xsehR7BW2BEjbOtConaKkcqoK7jVow2K7TVZHlRhAPvH
	idguwbpKeIQg9bIfnJi8ZoUV1ST8uoakvRrTlFMy7H9f4CkFV+uLV2qEAza0b3oyuUZzoZA1BtY
	ftnZbcb/t8mNWrDGdYd50thk3ESpL8qvXJzP13ovOXxKEJiCgictUHLKSJRvAV8Qiy89/9TfaNs
	K/77slf/mEeDx0/5bkmj6VTDtCM8tTV5R1CgUJmTC7aCQ3Q/t9BKR8lG83AA9uYGqQs1M3etSiA
	yZbSmWznNN8begCFtjdGP4tIMhI3togJeVvt0h1p3YpLRtGxDOHqj4kraVITOfQk5myUYuKY7ZE
	AlultXLXUtMgVuQAAwjxIsEiKZ7ZRmSb5y9Rs5ZkL7lZplY3bTj0SFDbboORG+lzGdrndkkYlth
	7nRUwws2npEN2s=
X-Received: by 2002:a5d:588b:0:b0:432:5b81:480 with SMTP id ffacd0b85a97d-43629341fdbmr23647342f8f.24.1770736243936;
        Tue, 10 Feb 2026 07:10:43 -0800 (PST)
Message-ID: <75df20e0-70f0-454c-9797-e62725f53b63@suse.com>
Date: Tue, 10 Feb 2026 16:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] xen/console: add conring buffer size alignment
 setting
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-7-dmukhin@ford.com>
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
In-Reply-To: <20260205013606.3384798-7-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email,citrix.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2694311C4EF
X-Rspamd-Action: no action

On 05.02.2026 02:36, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Introduce CONFIG_CONRING_ALIGN_PAGE_SIZE to control rounding down of the
> user-defined conring buffer size.

What's wrong with the rounding? The more that, with the original behavior
properly restored in patch 5, it'll be a power-of-2 multiple of PAGE_SIZE
anyway?

> Also, update the logline reporting the final conring buffer size to report
> bytes instead of kilobytes, since the user-defined size may not necessarily
> be kilobyte-alined.

Yet making the number harder to grok.

> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Having talked to him, I don't think he meant what you're doing here. All he
apparently meant is to stop using alloc_*heap_pages(), which needlessly
supplies order-aligned memory.

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -95,6 +95,13 @@ config SERIAL_TX_BUFSIZE
>  
>  	  Default value is 32768 (32KiB).
>  
> +config CONRING_ALIGN_PAGE_SIZE
> +	bool
> +	default y

IOW "def_bool y". But what's the point of the option when there's no prompt?

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -470,12 +470,15 @@ void __init console_init_ring(void)
>          return;
>  
>      opt_conring_size = max(opt_conring_size, conring_size);
> -    size = ROUNDDOWN(opt_conring_size, PAGE_SIZE);
> -    if ( size != opt_conring_size )
> +    if ( IS_ENABLED(CONFIG_CONRING_ALIGN_PAGE_SIZE) )
>      {
> -        opt_conring_size = size;
> -        printk(XENLOG_WARNING "Rounding down console ring size to multiple of %lu KiB.\n",
> -               PAGE_SIZE >> 10);
> +        size = ROUNDDOWN(opt_conring_size, PAGE_SIZE);
> +        if ( size != opt_conring_size )
> +        {
> +            opt_conring_size = size;
> +            printk(XENLOG_WARNING "Rounding down console ring size to multiple of %lu KiB.\n",

This line wants splitting at the start of the string literal, and the full
stop wants removing if already it is being touched.

Jan

