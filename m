Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK5BHpQNgmkKOwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 16:00:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F87DAF49
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 16:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219321.1528205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnHt1-0004hd-Mx; Tue, 03 Feb 2026 15:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219321.1528205; Tue, 03 Feb 2026 15:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnHt1-0004f9-Jt; Tue, 03 Feb 2026 15:00:15 +0000
Received: by outflank-mailman (input) for mailman id 1219321;
 Tue, 03 Feb 2026 15:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnHt0-0004f3-Ci
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 15:00:14 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a58f970-0111-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 16:00:13 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so4905069f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 07:00:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e474csm50972590f8f.2.2026.02.03.07.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 07:00:11 -0800 (PST)
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
X-Inumbo-ID: 0a58f970-0111-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770130812; x=1770735612; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6R18DRHSjMVdzjMhz9C9IFfVmUgXEpBSDJyJJvfFVM=;
        b=O0QVQM/N8SBrzg9c+so3nVmArog0ZZ2b2n35GQpmgaSkL5jwAn4+b4f1F/dqR5orSH
         h/RYehn6TJdvxUTBhCw88LhK/bcidn4CrMZIySfSQRWmdyrBil7emMnDcHHFiGQTDhsE
         G8V2WU5HlICw0Dc20L6qrCs01XD5faZos/hIZYX9SNxsy/AG0/w5FVp4y5dOu4UBkrrv
         0RUkqBx6FqtfPi57G16lfVm/9QlfH99J9Yltv/bR3ZH1M5uDDv36y0GFlLlIpqXq6pGF
         y9uF1ycZqc21At0jL304EYONcLGNhWl053f2DyISbMUCsStm2aYjkZ6fb6msQ7pW2FpZ
         q9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770130812; x=1770735612;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6R18DRHSjMVdzjMhz9C9IFfVmUgXEpBSDJyJJvfFVM=;
        b=biXyR3bKHBPNCWUv0Msrb95vdKbj3jYvkd1U1xDd3qLFbq0NuAum48opDbhoUpC1Su
         jsjHL9viRkuTEhtst5O5sOJxE0EdY68pAidxWYO3yOhmcE6bCk4PxpfA/r1igESK59jg
         LWbARAnY4UUGHOFpf5A8w9/h010cpiyQ7GnAAXq1pbT7PLR2qarn5NesQh5Y22MGwcnq
         HBaCRvCc6CuPjWAdiKTMxaVhUZvmepMsB7Q+5CEId8ZrpcSc8/JMWaSEep9s4cX4jDoH
         Yh5UjeS2f3pyjJ2va+kzCyy2SdwS7kGmkKrs2VVozyLnOLZ32rg6iNHMTLhaXs+sZCSg
         xgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWenZOgfvZNswqWleoj8LcUXF4gsArq5JvxQRmXW4Z/S2Xzyz5kecx4okggYgZI1CbBoX68P7sShg0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZeigQEh+uhWsYEynTi4qwcKl2A9SiXQzZQnU+NCJtmoIQz6DZ
	UX7ZDOVYLWwXYsk5XjzhMMwBmkhLfs0vbs/0LXF//vUoF1fN726EKruSkv8WORA3ow==
X-Gm-Gg: AZuq6aJ3s3Lit6MYdmbmTgPaD8+bMrvgWqvksBPors4sEK2juSHFRl89XzuIxYzewEw
	B35m+2XNziIYMywoE3O75J7fgMS3n29ww1jQo5jVaKS8qnE+TGZfIVz4G4XeQTj50SrJjKjT76R
	t0PCHx1wkhBa7IlXEmK8EFK+llBaI6kDev63DIkFvTk1v6DfmCcIdB5fCEkWiG75evgcUM7JM6G
	5P2q0FdQ7xzpYu0g3EEroa7DC8y3EFC2QScieygZ9BhTX1EVdibW9QsMvVnXsRlx9YKcAq3PWJX
	WCmj3Ggrys5qqoZjZERsBiCHAxsaFEf43OgZB9FdIQh98oDrKtOgWYFPOzetc0uYsb7YfzQLJXe
	nVd7hua+MZ2o2zErkDqpDb7eRXA72ICXqV2MmwsKTL/0IMyVyJWXiQImaQq3s80Dp76ThbFb0jr
	DYQbqLLGu2eettav310SnWnYklbyjrLCPuJDz3EY0wURo1MJcM+KsitzNdXhnqYn0XodgrpXStf
	ek=
X-Received: by 2002:a5d:5e01:0:b0:435:ae97:b31 with SMTP id ffacd0b85a97d-435f3a6a8cemr19971432f8f.2.1770130811997;
        Tue, 03 Feb 2026 07:00:11 -0800 (PST)
Message-ID: <2c2b6189-9404-4378-a101-3a93cbadee43@suse.com>
Date: Tue, 3 Feb 2026 16:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] xen/mm: limit non-scrubbed allocations to a
 specific order
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260130145726.85907-1-roger.pau@citrix.com>
 <20260130145726.85907-5-roger.pau@citrix.com>
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
In-Reply-To: <20260130145726.85907-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 25F87DAF49
X-Rspamd-Action: no action

On 30.01.2026 15:57, Roger Pau Monne wrote:
> @@ -1117,6 +1130,14 @@ static struct page_info *alloc_heap_pages(
>                      scrub_one_page(&pg[i], cold);
>  
>                  dirty_cnt++;
> +
> +                /*
> +                 * Use SYS_STATE_smp_boot explicitly; ahead of that state
> +                 * interrupts are disabled.
> +                 */
> +                if ( system_state == SYS_STATE_smp_boot &&
> +                     !(dirty_cnt & 0xff) )
> +                    process_pending_softirqs();
>              }
>              else
>                  check_one_page(&pg[i]);

Coming back to this, I see two possible issues. One is that on x86 enabling
of IRQs happens a bit earlier than setting of SYS_STATE_smp_boot. Maybe this
isn't really a problem right now, but it could become one if the "wrong"
thing is inserted into that window in __start_xen().

The other is that only x86 actually ever sets that state.

Jan

