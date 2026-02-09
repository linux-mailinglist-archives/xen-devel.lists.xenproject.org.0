Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNxCBvLsiWlpEQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:19:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD8110293
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225430.1531938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpS6k-0004p6-TO; Mon, 09 Feb 2026 14:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225430.1531938; Mon, 09 Feb 2026 14:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpS6k-0004mV-PN; Mon, 09 Feb 2026 14:19:22 +0000
Received: by outflank-mailman (input) for mailman id 1225430;
 Mon, 09 Feb 2026 14:19:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpS6j-0004TX-Iw
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:19:21 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52ec2749-05c2-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 15:19:20 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so4268431f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 06:19:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376accfc58sm12083437f8f.16.2026.02.09.06.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 06:19:18 -0800 (PST)
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
X-Inumbo-ID: 52ec2749-05c2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770646759; x=1771251559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SyHH6FsI9v902kl0sVA1FWIQqURFpxWXf1yAeuXN12U=;
        b=ERcH3DStGvHlASKk/UMsF717NdQi/tWA1zHQySRFf4qq3xDmZhVBWcJZWSlCsgaHDN
         9Q4jzJorUYFM1gSSfcSAs0foj2Y/wdRhwuIwbBKbAF1xIAEZUhYO3ER83tg/GNJ26d8h
         KVwMZ3c00MYGwGHz9HIEnPEivkY2nlTEbzP/MFDdDHt8evY52nXVYdpvUeXYcjOckyCD
         bQuxItKVTUSZa1y6DcIX1k+la/tyFRQcHxVEXUxHcF835+ZdO9Uu7UqiUD6GhfrIXT1H
         M/2g9A6XBF68DsCdhLWeHsJcrEKQESituzx4xm+uJt0gYvTe5D0Qj2g65dPwXpGAjBqk
         V3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770646759; x=1771251559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyHH6FsI9v902kl0sVA1FWIQqURFpxWXf1yAeuXN12U=;
        b=ghGoGcs4nEI5tld7/FLWB4CjFOiBCIPP6MZqEqsbfUKnqLLyvL4gTNnWk6Am5hdgCf
         zVU68YaTHh/yUTw4Vrx6F/iVI7oHlZCxQhQeYRt1b0271IBTfBjSCcm83i3xcx45oi8k
         UYgK6PzSvkGuDwT0gSKA2SncYr3cFNIQrk25liYrTbDSFTJ+FkvQfDaZMJiYS4o+Wmvx
         BDBf1Y2oXGxF896kZJuqw2CCB0z3BR4dYnZ1V3Q7qEM92ULWrZ0nT2dGnyaLU2J8sYIv
         GVp8/GKmBqu5xEJezo0saprWQk/tvWy6EQ5br3vLqbp9cAnNqm19I2UsvbNX+pt3S0aC
         mC0A==
X-Forwarded-Encrypted: i=1; AJvYcCX4pQpuTNGEqDHGSaGVSZU/GWcBKqLDLAkEfuhOV90P3SGr73n7h1CVZTIwkWCSD0zf0Lyp7Pj/+XQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAHRekry1CIBr1Wi6mdS/e7c67FLfrrvs1xq2awK3ILMCX1Ud/
	zQV4BwmcBRm0fK4gE19QUx80kTTWovgQW67mYX1RJHW7ME2u05CtMPpem3v7Z6UTlLysEx8Raix
	hLdM=
X-Gm-Gg: AZuq6aLqqpS+ScxxaMF1vXP4CMa1rF4aZj4imJ1KFcCJH7FmfGIIXMJro2Jo3SEX24u
	8Jc9/bAO2mChNwG1gSRaZoPl+AfE9OIq18cOtcxKkgzgPpPgtZiXL5lto4k1F1e7mM3nOyTaks8
	yv6m8KK0AnVJu/HfQNbSgQa164JPivdSTiUKb0v4zm6aehfU0ZC+mgpausun4YYO37l4gahUx3u
	BrUDmvu4G6U0CC36qxFkjrENo0dB6e0Qg4w8IR+K5MkFBjMh0OBY0THJK6hPSE7fuGVObUsvFGa
	+XrktG/K12fW6kAz+0D88CDUEwfBZVxWoTCPPxC/vI3CnJyQuMyz5ox6eBfcBYHxC2po+bI6M6W
	J5ozs9y5r4S8y5HHgniKA4nHdAIEJDDu0edh1Q+IjaaGtTl9WevL4ySwocpW9j+cRwVs249quej
	Ur1r7KxTg+cH0QSWKbWo5t6m5iZsQ81Z+UOWhNyFjTTU1/sFiXMiTadKF+pPNGCFx+XVCJ9PFPB
	6XwFn5yB+0mMA==
X-Received: by 2002:a05:6000:2307:b0:435:a9c9:159 with SMTP id ffacd0b85a97d-436293411e4mr17351430f8f.18.1770646759237;
        Mon, 09 Feb 2026 06:19:19 -0800 (PST)
Message-ID: <7064136b-38f1-4bbe-9ff4-14774c88f016@suse.com>
Date: Mon, 9 Feb 2026 15:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] xenpm: Add get-intel-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <489a4decf4367a9983a63fb4987d8c5f6267ed9f.1770632848.git.teddy.astie@vates.tech>
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
In-Reply-To: <489a4decf4367a9983a63fb4987d8c5f6267ed9f.1770632848.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,vates.tech,lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A3DD8110293
X-Rspamd-Action: no action

On 09.02.2026 11:31, Teddy Astie wrote:
> @@ -93,6 +96,7 @@ void show_help(void)
>              "                                           units default to \"us\" if unspecified.\n"
>              "                                           truncates un-representable values.\n"
>              "                                           0 lets the hardware decide.\n"
> +            " get-intel-temp        [cpuid]       get Intel CPU temperature of <cpuid> or all\n"

Sorry, thinking about it only now: Do we really want to build in the vendor
name to a command? "get-temp" would allow for adding an AMD implementation
later on?

> @@ -1354,6 +1358,131 @@ void enable_turbo_mode(int argc, char *argv[])
>                  errno, strerror(errno));
>  }
>  
> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *temp)
> +{
> +    xc_resource_entry_t entries[] = {
> +        { .idx = package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_STATUS },
> +        { .idx = MSR_TEMPERATURE_TARGET },
> +    };
> +    struct xc_resource_op ops = {
> +        .cpu = cpu,
> +        .entries = entries,
> +        .nr_entries = ARRAY_SIZE(entries),
> +    };
> +    int tjmax;
> +
> +    int ret = xc_resource_op(xch, 1, &ops);
> +
> +    switch ( ret )
> +    {
> +    case -1:
> +        /* xc_resource_op returns -1 in out of memory scenarios */
> +        errno = -ENOMEM;

And xc_resource_op() doesn't itself set / inherit a properly set errno?
We don't want to override what the C library may have set.

> +        return -1;
> +
> +    case 0:
> +        /* This CPU isn't online or can't query this MSR */
> +        errno = -ENODATA;
> +        return -1;

Here we "synthesize" an error, so errno indeed needs setting. However,
doesn't errno want setting to positive E... values?

> +    case 1:
> +    {
> +        /*
> +         * The CPU doesn't support MSR_TEMPERATURE_TARGET, we assume it's 100
> +         * which is correct aside a few selected Atom CPUs. Check Linux
> +         * kernel's coretemp.c for more information.
> +         */
> +        static bool has_reported_once = false;
> +
> +        if ( !has_reported_once )
> +        {
> +            fprintf(stderr, "MSR_TEMPERATURE_TARGET is not supported, assume "
> +                            "tjmax = 100, readings may be incorrect.\n");
> +            has_reported_once = true;
> +        }
> +
> +        tjmax = 100;
> +        break;
> +    }
> +
> +    case 2:
> +        tjmax = (entries[1].val >> 16) & 0xff;
> +        break;
> +
> +    default:
> +        if ( ret > 0 )
> +        {
> +            fprintf(stderr, "Got unexpected xc_resource_op return value: %d", ret);
> +            errno = -EINVAL;
> +        }
> +        else
> +            errno = ret;

Why would this be? How do you know "ret" holds a value suitable for putting
in errno?

Jan

