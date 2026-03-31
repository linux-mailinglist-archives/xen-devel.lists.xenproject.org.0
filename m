Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBinBhaby2lBJgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:59:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6179936775F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:59:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268840.1558032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Vse-0002uO-Uv; Tue, 31 Mar 2026 09:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268840.1558032; Tue, 31 Mar 2026 09:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Vse-0002rT-S8; Tue, 31 Mar 2026 09:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1268840;
 Tue, 31 Mar 2026 09:59:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7Vsd-0002qr-N2
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:59:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Vsc-007Ozm-HK
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 11:59:26 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb9aef-bab6-0a2a0a5309dd-0a2a450cdbb2-42
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:59:26 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb9afe-f93d-0a2a450c0019-d155802df192-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:59:26 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso72639015e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 02:59:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e86ecf6sm23714945e9.14.2026.03.31.02.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 02:59:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1774951166; x=1775555966; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sS2nHryiWM0mGeohuNnvLhWkN0jFyzpKtftQ53VBeSk=;
        b=YAVEaZeR5xkWFa8gxhUZ3hRN6DlnL3MT+2tNzFtPPfihPf1jiDlvfQcwhQSKgmUePK
         L1RgVOErRYdnnvkkoTA1L8/CCYAIq0FCbRawR7TikUNR0Ez2ovw6d0kdWxr3RXMC1mj/
         GZBsXEfX/LSozMZjdT1/4gnd9eZVgEG5L99EIqpSXqcnKzfFWipYNtT0IAGASnM1sxDy
         TrLpl8C3XRuKp3sowHr+xjW1xCZ2h3wI5gsdEpIU5tnlmzL3oV3CNwJ6vdEI/EStosC9
         LJoiDWujPRNDF9gSGVHLrOSuCxQ6Mn5YQFTM9YxDLtGRrpZcfP8gE1P72pkbBABKmt5E
         nFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951166; x=1775555966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sS2nHryiWM0mGeohuNnvLhWkN0jFyzpKtftQ53VBeSk=;
        b=BsnceyzWFEWIs00JXUFRmJFG7GrV9Ypv8B3kqhS0jCaDqs7tsIQsfwpxnVf6oVDsUq
         RjmTHBxquHLCoEHT5bowf3BwC6idbmcqysn3VJuTbvgtD+WWaVOsl58jNW0FbKPRlj0n
         9s3E3ULUE8sjtL8og4HDfFIVN4wHy/L2pTKj0qQYzYf6bYXzblzYuOGIGMguV9qKKNaB
         kz0IXB3+j9E97dWESgqgZOACF8PickWFkUUkKw4rEbiliBcF6rLYHh082orSCZooTvoi
         72rQDjurcbulN1dX6xJJ56MasZto39W+ciLZSZftUU2lzMLiKtW3qySC285KDAzO2CtH
         4ucg==
X-Forwarded-Encrypted: i=1; AJvYcCXVlARYWsbrfFzAnNQskbXNMYGpYrBKZ5SXx09+KO06hekfx9gJJsQ2joNdf9I0U+k0cWojMeLhTKc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSaH/ua1PrGin8OHnq4J3+Fr7w2y3tqUnXoRZe9EdjLA5yPENa
	E4Hptdurhes3iQf9LnVLq9nHHrHSqOI0kDVdDwMozRNC5KiI/OVs1K02D/rCK348mg==
X-Gm-Gg: ATEYQzxZXJR2/kBWDydmewEuYaUAlQcxdJ1cxEhoSMVuIYjQ34TPmoT5CMWEG4GICyl
	WlOVtk/sqifIzUlrqP5fwSpAMsQ1DLWSqEWxoCTIlwrOKS3Z6pR1hi80uO7rfH8+CgQeynkGbCs
	uvgU7BKLn92nK0DubGEOSxnkUsoJVQRJg/uDpOZLwT9E4QFWLk/5X4gR3AqHpbgpLrcbq+JiRNo
	mZgppUj8/fuKUvPP7wnRoSB0JLfUxkUStyi8BxXLHsh+bW1xxnTm5XlPaFnmsmidHi2bUb4A1nU
	hDMhWVnfQr3jdu/tiIJVGHl/XJItpbq3NMJGv0Ce+mLW49MBp3C3MU7GWLBqVfFK5BmOvGLyHPg
	KSq2cOG6+xgho8VdOZG9NJ4yQC+y4ZPQMyPNwZ7Lq7IYErHRy9ZHrvXFvcDq+O9DgNaRSaCTzjw
	xDKc9DROf/m0BG4RRMCZgZCJYAOVULuopCDDzMIe67Wld/8C4XI/p5zrhIVsKS00RWU0E9WIK+R
	6T7qSy+i65BD/4=
X-Received: by 2002:a05:600c:46c4:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-48727f0e53bmr283709465e9.23.1774951165783;
        Tue, 31 Mar 2026 02:59:25 -0700 (PDT)
Message-ID: <5edfcb6c-c36e-48cb-a8ec-39e0ff7ceb91@suse.com>
Date: Tue, 31 Mar 2026 11:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] vpci: Use pervcpu ranges for BAR mapping
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <43ce584a124f0bd07e641934e15e5ab56548e1ba.1772806036.git.mykyta_poturai@epam.com>
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
In-Reply-To: <43ce584a124f0bd07e641934e15e5ab56548e1ba.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1774951166-6E0B0734-2D8D8576/0/0
X-purgate-type: clean
X-purgate-size: 449
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6179936775F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.03.2026 12:08, Mykyta Poturai wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -454,6 +454,14 @@ static int vcpu_teardown(struct vcpu *v)
>   */
>  static void vcpu_destroy(struct vcpu *v)
>  {
> +#ifdef CONFIG_HAS_VPCI
> +    int i;

Nit: No plain int please when ...

> +    for ( i = 0; i < ARRAY_SIZE(v->vpci.bar_mem); i++ )

... its values are only ever non-negative. (Applies elsewhere as well.)

Jan

