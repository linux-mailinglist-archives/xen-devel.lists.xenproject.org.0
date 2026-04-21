Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHxiMWyZ52kV+QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 17:36:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EBB43CCB4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 17:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289124.1569331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFD8r-0001NY-Fv; Tue, 21 Apr 2026 15:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289124.1569331; Tue, 21 Apr 2026 15:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFD8r-0001KU-Ci; Tue, 21 Apr 2026 15:36:01 +0000
Received: by outflank-mailman (input) for mailman id 1289124;
 Tue, 21 Apr 2026 15:36:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFD8q-0001KM-OY
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 15:36:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFD8q-0007q2-5b
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 17:36:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e79958-bab6-0a2a0a5309dd-0a2a450bae2c-24
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:36:00 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e7995f-212f-0a2a450b0019-d1558030a5ca-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:36:00 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so13848895e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:35:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc375dsm34898334f8f.14.2026.04.21.08.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 08:35:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1776785759; x=1777390559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l6/61KmdCX4yGoKelBKeS/S3OXlgVgoqJPO2Ng/df3Q=;
        b=McOEZWrCOckaVKTvtDjw8RFQiRbrTa5XeMck0M/1TvcZRNjHj+ILUpLnkg8F+QpDUJ
         KkZiAwf73B3Lu4eUK3rU9nyhmmhJe9fJsW4QScaU/auHyAuSZRxWrtL3vNbs28qQxx/x
         cHSzF+gT7UgMixPuum4qx7Ys3O0yfRdrVdza00kJtUjJnCg/VebMgc6/OXQ0+4ho20wt
         3SzJRy1hXwPlHVj11eNsfOigFC3ZYd73oBlsU0Ti+4mM9W/tDkheh5tkPt8tUfFqlDts
         LV0eK80wB6yZoZTTp+kQN0X9+M3ucC4n2mvyC7VNy23GiCA3V889q2pnxX+SKs4uUcuN
         BPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776785759; x=1777390559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6/61KmdCX4yGoKelBKeS/S3OXlgVgoqJPO2Ng/df3Q=;
        b=qigXKNh9RyzIB/mh/ccLc7mEScf3HIlZF+/K7WbshYAq7AJ6NJBTVLGq1SD8TmJ1Js
         GWtwg9MRB2houZB//c09SVgrh7qAFv+Zaet6MO/rAg5q/rQxwfGGTlWS6VFfkjZni0im
         CNhR/d30tFmKhrRBRDL05lT3EMOg6kw6ScB0DcLZ8dQ3zdvWBztXLmHPWNWhjG29Gjwh
         ZQOtWZ7IweaFxFdrjusGbKOTGJfqICV45JyTMGECuMaWrC1HOHAPh+/YRNuka3c5lmv/
         AVluojFhkrVbM0gpqf+0P3nsisXDXIFgWQaHEyCA4QThVpCeq586H32iqXShtDiSjO8q
         b0MA==
X-Forwarded-Encrypted: i=1; AFNElJ8bAsV1WwwWmM4lCOlV2QvO0lgwxxsfpNn7+eJaommsU4p4Mk7Y650s1Ov/DkJoEF8MymMSTB6BzhE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx64BXkQKSp2mjTacgCpfcIT6nVZK2oDkySfNRo10KqGfmuTkcd
	GU7X+S7mUoYPKyw0GvTXN8eLQ3qRJyrhbDV/G9mALDZHRSnJkbyIvP2cKioIdmZKsQ==
X-Gm-Gg: AeBDieuPt6iaDegrRg+qNg7GG4w77wGZLQUEYEm0TJGOS/DFDfas5uz1Nd5l2ZH3hMd
	xzfOOLAOz32nNrXt8aGK0gGuYBQLongjYFS9vLUJZKHEL6q5nW1rSYwZtcSzZFz7sTgcipcoIRV
	0FE/zNZxbKM83hk/NXbi5KkB86G5mfUN4uNYEYexK6sd3MfuLEKos0yCeBG0V0dnxTkjQ2iGdwa
	iygF9q9CeG+/RzUDeBr1OUiSlu14YYNsuYAydBxPMcVvtIAJLHaP6/GYHtMIC25OSt6UoN6eAKF
	hZDqm7LLlPsm2WletOebiMXlShffmcc8HYN6kucDxhQgn8J4ybJeQUGe5WrSn21AHSci2Mr6DDg
	ujVMO7YUXsBKudC75nDlb8RJe4qfbGatq6f6oz/C09mN46WmHx8cqOLDPBWBOCpaURZ5zstCBQC
	L3t8SRGtClRdGz/Z9Pdk6PBPJUVlPTuqrzJSUyUqlMxqf6NHLqBCDpgLkoAgUJ/85E0q+eWI3pd
	b+EbMkNxuW5zig4CMdVwvdoxw==
X-Received: by 2002:a05:600c:1988:b0:489:1e5e:2cc with SMTP id 5b1f17b1804b1-4891e6d485cmr120595785e9.9.1776785759384;
        Tue, 21 Apr 2026 08:35:59 -0700 (PDT)
Message-ID: <2204fbae-be5b-4f56-ad2a-cd5692db81cb@suse.com>
Date: Tue, 21 Apr 2026 17:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenpm: fix FreeBSD build
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260421153224.36368-1-roger.pau@citrix.com>
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
In-Reply-To: <20260421153224.36368-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776785760-0757BF3B-3A8C9D87/0/0
X-purgate-type: clean
X-purgate-size: 1109
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 09EBB43CCB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 17:32, Roger Pau Monne wrote:
> ENODATA is not defined on FreeBSD:
> 
> xenpm.c:1380:17: error: use of undeclared identifier 'ENODATA'
>  1380 |         errno = ENODATA;
>       |                 ^
> 1 error generated.
> 
> Fixes: edb657887a60 ("xenpm: Add get-core-temp subcommand")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  tools/misc/xenpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> index 87107bd6c617..ecb39c911d84 100644
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -1377,7 +1377,7 @@ static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *te
>      {
>      case 0:
>          /* This CPU isn't online or can't query this MSR */
> -        errno = ENODATA;
> +        errno = ENODEV;
>          return -1;

"No such device", however, isn't quite what we want to convey here. If no
better error code can be found that's available on FreeBSD and Linux, I'm
inclined to suggest that we stick to ENODATA where available.

Jan

