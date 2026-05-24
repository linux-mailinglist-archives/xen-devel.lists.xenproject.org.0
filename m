Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKyOMksYE2oi7gYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 17:24:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1E05C2D87
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 17:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318725.1586785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRAh6-0006Kj-0M; Sun, 24 May 2026 15:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318725.1586785; Sun, 24 May 2026 15:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRAh5-0006Ip-Tg; Sun, 24 May 2026 15:24:47 +0000
Received: by outflank-mailman (input) for mailman id 1318725;
 Sun, 24 May 2026 15:24:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wRAh4-0006Ii-Hm
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 15:24:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRAh3-00BQfG-QI
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 17:24:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a13181f-bab6-0a2a0a5309dd-0a2a450abbb8-8
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 17:24:45 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a13183d-56b3-0a2a450a0019-d155dd2cad9b-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 17:24:45 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-459bf19e87bso5128602f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 08:24:45 -0700 (PDT)
Received: from ?IPV6:2003:ca:b727:851f:6065:3b2:383f:b228?
 (p200300cab727851f606503b2383fb228.dip0.t-ipconnect.de.
 [2003:ca:b727:851f:6065:3b2:383f:b228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d48e23sm19066355f8f.20.2026.05.24.08.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 May 2026 08:24:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1779636285; x=1780241085; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wz0ce+1bAd2vC1HYkRJekSw0wiuP/YDW2GhoK1lI1CY=;
        b=FKYVQOFFF7TWT/ghzBgv/SKcMqOQlOmrStwfMBUGvKtPOVRCheRoZPSAao5knSo1QQ
         1rCZcYQB2IuyPVuBQrZghT7k76tenRIRhy7l3wZy3nnguoqwrsPn+ksZ9hOxluiEAUsO
         b02acb5N5WLCDviyPS3jUxLH/pZbVOxVf8n2v42j7tQLSCSdJSI8WsftZWS9Bi9+7JIc
         2ohijxQJh6E7pqHL5tnxgIAn3vr8odfjpOYZh7E/BLWDlCOMQOBC5VVQ1djqGsj9kDHw
         RIUyx3sGWBDT3lXOAYG/tEgrdCiUeMPqW6mOqMALWtZ05z3fLGSlkRqBUnVp9bftZ+eT
         VAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779636285; x=1780241085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wz0ce+1bAd2vC1HYkRJekSw0wiuP/YDW2GhoK1lI1CY=;
        b=NziIgYACSTPi2M0bWWA1qZnF61forraGnuaOjLrCYzmRgVmOKos65K/PMR3jFUN14R
         1DZY5jxDkt2a6cJAgLogW7GZ4fZIb8UDl9quzr2Q7+iCnYEYJlRABPT56/YrEQxTflp9
         CbuRKT4D7A8aHTy5yQI1KF6zpaKXbEOg+ky70/vCZlR4Ld3i2KGPOiZbLqyKQ20lA/Zw
         NE/XXQr52xuyovgDZ7IGV3gG6f5gT+CmwJu5dnptT4q6e80v/WklZAXcG874spQ6Tnpv
         fVKvHAm5Vr9HuQXOJ67bx/3S6EuycAZEQ4ELTAsoNf3natfoJVUVdD2+hnM64a8PTGqI
         3GQA==
X-Forwarded-Encrypted: i=1; AFNElJ/3D4/76isbk1gPEpzzGydiVjSxdxq7yY2YI0AJTuZsjOay0jDzgKHDcliYvwTwtkJtdS/hKBqlvnw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOgbQfUr2DlxuOtG5tUwj/uRHagPpw7aeuCSD2yuVc+vTQwURM
	OlVvZ4AHucXBAubdz3YaDvtv8kOpNQVWHhPrk+EKUZvvzFA3uEG0UacNJkGbkqv1FQ==
X-Gm-Gg: Acq92OGVqY2RdMmPFCM4cbpfnQqQbC3YwR3fhE0+kur+K6jUaJuCfAUbPGzwoJIHUs9
	XKcnrFIk20ABiuIrRvK/QghJere11j7TAF5rSDveo8oyEzchnawYqrvMVeuN9Tvej/sPHwSaUoC
	Kw/KTW0tWwy6OFhqr4UqNc9Rsjwuoieo2rmQGdcmt5gPxE9YVDMVqr2Bch0BcsOABeAACDyhE6A
	PFmH9Bu+IYIH8AmfbXlhf/T7VhWLhHEB6rtQDiImdx8lEQUNhU3MUWK1dasxxvZ5hl0L3scKoK9
	FVphthlUZt/z/u1zh6bDPa7Rg8OXQsbsitpoB7Tfz5Woz7dyvX4cmjyYWtn0LY6Nfu8nmVoqN4U
	MqDHl1wYkH5TLefItz9DxRRW5AGBZFjX0ItvPAxkxhYgL2nQvic6qGf0SmM84DnoSzrAvCgV4Ij
	r1vrnId75I4N7UB8ZrLqa64oLYwo42eyK+WixTXlaVteAnJO8Td7kPcC/tSK6Az0QI++m4/Inok
	i/WGLj9uOjzcz9t99t5XDVqNcEGJuBCJj/pwx/Nbs144tgm1beWhso9NXlSzDiTfE+W
X-Received: by 2002:a05:6000:2003:b0:43b:4136:1e6f with SMTP id ffacd0b85a97d-45eb38e4b46mr18775261f8f.38.1779636285246;
        Sun, 24 May 2026 08:24:45 -0700 (PDT)
Message-ID: <b9ccc68d-011f-478f-9911-94c746b2a930@suse.com>
Date: Sun, 24 May 2026 17:24:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] xen/sched: Link CPU topology to scheduler and
 display via xl info
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 sstabellini@kernel.org, jgross@suse.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, dfaggioli@suse.com, gwd@xenproject.org,
 xen-devel@lists.xenproject.org
References: <20260524000209.292370-1-taka@valinux.co.jp>
 <20260524000209.292370-9-taka@valinux.co.jp>
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
In-Reply-To: <20260524000209.292370-9-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1779636285-7357C8B7-2B499D98/0/0
X-purgate-type: clean
X-purgate-size: 542
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3F1E05C2D87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.05.2026 02:01, Hirokazu Takahashi wrote:
> --- a/xen/include/xen/cpu_topology.h
> +++ b/xen/include/xen/cpu_topology.h
> @@ -14,6 +14,9 @@ struct cpu_topology {
>      cpumask_t thread_sibling;
>      cpumask_t core_sibling;
>      cpumask_t cluster_sibling;
> +    int to_core;
> +    int to_socket;
> +    int num_siblings;
>  };

What significance do the to_ prefixes have here? And what's the meaning
of any of the fields holding negative values? (If they can't hold
negative values, use unsigned int please.)

Jan

