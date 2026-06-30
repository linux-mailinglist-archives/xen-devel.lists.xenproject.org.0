Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xfpJAYXoQ2qWlQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:02:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94A6E6367
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 18:02:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KMQOWPvX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349185.1607074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weauB-0000Nl-5s; Tue, 30 Jun 2026 16:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349185.1607074; Tue, 30 Jun 2026 16:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weauB-0000Ki-2q; Tue, 30 Jun 2026 16:01:47 +0000
Received: by outflank-mailman (input) for mailman id 1349185;
 Tue, 30 Jun 2026 16:01:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weau9-0000Kc-P2
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:01:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weau9-008OAz-5K
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 18:01:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43e865-2eae-0a2a0a5409dd-0a2a450b93e4-14
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:01:45 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43e868-ac48-0a2a450b0019-d155dd2aed58-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 18:01:45 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47231f1f8f3so4210153f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:01:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475641e4cdesm9360932f8f.13.2026.06.30.09.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 09:01:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1782835304; x=1783440104; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acjz6Z6ytcyRuVVD5Y8XLg7hRL2173IodehQr6wGnJU=;
        b=KMQOWPvXkqsT1z623Q8qjmEALx5nswr5Vr+sZK8sOo+fD54vLcTfUWT8qELQBV3Zem
         Aqpwt9sds6MH7auI59jwjnhv/aG/ODw1vGYoSP/K44mH8/GstmtK+T6Ym/wlgtWEmcU2
         5ffe/jHx3tWBaGSU7hJmMjHYeVjuArsLDNscOc+0WGPCHkuC7SMPjQpX9isjuvRbyziQ
         Sl6AQwpO7xA2+lfGTllxBl5YjWSTdiAJQAA7k/zgatHBzyvQqpNEs3YYaIJp4MaboDIt
         e7tgxSDDm2OgsNGGp0TETYcwCZWTZcmW5ZyTQS/v3mkgN6tCmHiCO+ReELDNJ1WbKX/c
         OhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835304; x=1783440104;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acjz6Z6ytcyRuVVD5Y8XLg7hRL2173IodehQr6wGnJU=;
        b=iPrM+C41p4BegMfqCR0Bb2M+itzWBhiwForH3eM6oyozr1RCA0YwLeUs80gfPOSU6b
         Y/PvoV7NHbgf4DFqupThhl2IuL0Pz83IbZZ47e4YWGdp41mpAXX9fYP5TOCtBML9JhTh
         P8Tt4xp0RIfdLCa953LzT6uiygbB7Op7+/6cT4KDa3ZThMVrjFEygQYAuxezfcdML7HR
         mGg7uoJTG3cDJDCJm56IHSPu6ozENLygvdxyyvrEDGo9pZg41NY8jA/iN7OLML8BQyVM
         /2ba11E1b+pIDFQVpP4DHGaF+fiH+DNkInPX/H3NFNP3xrQWvp+qRvsSDLN9vJzat/9m
         nB/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqHvM7DcQcOFmjVSatNkg2mVnHk+m7wHwm/7nLV6r6tKW7BRgVE0d4mOIvFQiUzK4riFu+Fia6u2lM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPoBtTCpCZSPAHMFYJY257Hj+IBNxByvpTwhMhoLk3VBQOJwsa
	1yvV/Xw2osrfSbaKFNOqQFFqRkULtqAqNHxRlAV73KHtymt2+smAz9UUXXh3zQSqmQ==
X-Gm-Gg: AfdE7cn5A/8XstpHrA3dqcsI17qKNokeLxnLHf6c1cJpZF/zbmUvny4hYuoWZOArQyD
	bZZ/1S1pQUvwJ3TaOvjjKbiNgjo2CBOhi5udmhpOGP0xgj2BWpU3jvLLMGyY3pJnm1rhGTE6IWN
	boNEfQB8d3fccddeYjgM6fkqk6/pcEWXfC99pApPRZmLyHygFg6quur+FVd553gceCVFQWqFXqJ
	yeQ565M332/SEPTfQRF1DQiok2E4eu9a5qmgc7n4BMB9kzjXRrZrV5qUaKP4EQDAcSoM41JT5GT
	fqH2n0aaeRU5zzIju9/TT/VIVsvGH8+zlF1AT8UrU1K4L1ThM6b4fPU6Ar39/DGG5y5GX1RVfwd
	VXvUlZxkA52/kQVfZRPpXrQgyXoToPT6h3vVRqCTwQikIrhQMuabtDL1JPXMtEUAZfOcI6R5dYU
	WtszJzL9mGsSgI6Yyv/GYI+fqq8g+CXigDsVZaWiKKNRUNYN79qHu2nqOEypQKxwTJM0e+uK/zT
	693
X-Received: by 2002:a05:6000:2884:b0:46e:6201:5d56 with SMTP id ffacd0b85a97d-475506e9994mr6178132f8f.7.1782835304241;
        Tue, 30 Jun 2026 09:01:44 -0700 (PDT)
Message-ID: <f94f3aed-279e-4320-942c-a79f06547f72@suse.com>
Date: Tue, 30 Jun 2026 18:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kexec: Drop compat_mode_gdt_desc
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260630155749.751977-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260630155749.751977-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782835305-A6F3E220-40702FCB/0/0
X-purgate-type: clean
X-purgate-size: 395
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich@suse.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC94A6E6367

On 30.06.2026 17:57, Andrew Cooper wrote:
> Given the need to calculate the base anyway, it's easier to do so entirely on
> the stack.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Since we've started using (the somewhat odd) PUSHW, perhaps not really a problem
to have another instance:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

