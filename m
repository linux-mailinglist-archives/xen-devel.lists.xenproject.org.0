Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9dUnJ3UZQmqt0AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 09:06:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE96D6B72
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 09:06:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=L97kVzF3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347244.1605116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we640-0002Ip-1d; Mon, 29 Jun 2026 07:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347244.1605116; Mon, 29 Jun 2026 07:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we63z-0002GP-VA; Mon, 29 Jun 2026 07:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1347244;
 Mon, 29 Jun 2026 07:05:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1we63y-0002GJ-H2
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 07:05:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we63x-003u2n-Mv
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:05:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a42193e-bab6-0a2a0a5309dd-0a2a45038c32-18
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:05:49 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a42194d-ec1a-0a2a45030019-d1558035ac6e-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:05:49 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4926fe5be4bso21476945e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 00:05:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268ff9f40sm268343225e9.6.2026.06.29.00.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 00:05:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1782716749; x=1783321549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zPRE/Q93m/e5z8Xj2xFdGHltsG8Q66dHkG6wgO/Y5go=;
        b=L97kVzF3y6r74LFFVxkdmdAhvG+GC9ZyyQe61W2C/o0/ZQhetBHZxYP4WcnBUg9PUX
         5WdOkI5n3v/PhM51YY8vyOjDsPcwBdXJxiHSt2IkaoNpHwMcguvE+udEA6X8Wi4PUS0l
         zdJjQ9fazHaPLCNQW38hl1LNwJ4dgIp5Ia8efUyIK/M4LXLjCaQzs3aL9xSOmwbvSrf/
         QctaWOrsjkg2exrPkmAJXKGt9KzwO39E2tnjgq7m9OnN1JDAONcf39troUOJhDETFk4d
         IRUqwPV1Mwcs/aLvsI06UkLnuFeVReqZUsGwYzst3GsDSD1tD/yiQP7oMvsbCkjShmOP
         mN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716749; x=1783321549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPRE/Q93m/e5z8Xj2xFdGHltsG8Q66dHkG6wgO/Y5go=;
        b=pS3OMdaUZqu4/reCKo6isrgODT8HSZdCCZSE9dgtZLBZDwuVDBkKar7E5GO7uXvVPM
         qdi9hhk4kWzNffqmtgu62BfsVEMcloC7Za0kEI8Im+uj9K6autjtYNrjYxKja2zoRbVH
         W+elseOmzdm00rrGVXEJYOa+l2IkEhYO17eXhrdwmYWyMA9Bic8j8uhJWqs4AaEZjqAn
         JV7+DZf9Aap54EiMl52TD1bmwQsiNYNIndi1k6lgN1Rrlc5ZCQn3VEWpe0X+2PLKx0q4
         PSvE2s1PleqWsMK2hLJfRzvKgLkIiLyGAzv/iDpxWOAYWSXyPvxR0FwiEmM3ecPGgfUs
         PrPw==
X-Forwarded-Encrypted: i=1; AFNElJ+u2llv5waiD66OnYl7eIdZ5RxM7Vove/TSSn7jrQr9edaIpYOmFqLjEAr4EjPf0Jfza3esHy97tps=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yykf9t1QsdAB5sNG6sjIBvyesWr8kUdnlagaYIX1UCY3CkzElf4
	vjytovpJuOVhzZnxjNyuaCAdhLoD2rMsHp5SqfOThzwwMIz2UOV6HAQx9/7owqdvhQ==
X-Gm-Gg: AfdE7cl7ds0/fOF5yXJ3RPqj4SFrfM/T6lDMzASFmNOhKywinLPVyuzzcsUs1Ij6TsZ
	OKTHZAeYVCYU8icxgrjySci8sKAxcsnFnthQPrqjCleL8IE3okHi0GqfxbastBPpvCKuhq+ozDf
	Oqc72f4I5M2oApwHTAInbTMrIaMwh84+X4SstwFGuP3KBHZgwff+H89A/OVxQKCSZcTWOcnlnYh
	re0P9+yl4h3UYSQCzzn8kZwekaABYeLTSPkG8OWTPn1Us+oyDV3z91idmX8Tp7PZtlkERIkuBBz
	6DFIO2Nd9r/5vptvxU9VvTGvlcMWUsPcy3DylBxNYgR+blDzDiktrnBVZ3chIezy8/p3m+kgE7e
	e2yBEadFanBJLocvH3+PF/qDNWcW6lU0h3sbq4tTOssjC2Vvs/vL31bKfRijHha7QU774FSCRzy
	BEKltaCw4OJZZAi7GDVDScpFnlSgAZliA0Z2fpQaFQIL/ISmLZuVa/JjSb3VoL6qYXVbMFUl21V
	ZO7VYOQu27hYJ8=
X-Received: by 2002:a05:600c:6d8e:b0:490:b9c3:6c48 with SMTP id 5b1f17b1804b1-4926fc91b2cmr119044165e9.29.1782716748989;
        Mon, 29 Jun 2026 00:05:48 -0700 (PDT)
Message-ID: <857771ab-e3f7-49cb-9e84-180d21ae15b5@suse.com>
Date: Mon, 29 Jun 2026 09:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/25] xen/Kconfig: introduce HAS_STATIC_MEMORY
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <ae555155a60327e3aebb70fcaeade33349910a69.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ae555155a60327e3aebb70fcaeade33349910a69.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782716749-B73285D1-507365E6/10/73395122804
X-purgate-type: spam
X-purgate-size: 533
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1BE96D6B72

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> Introduce HAS_STATIC_MEMORY so that STATIC_MEMORY can be enabled or
> disabled on a per-architecture basis. ARM selects the new flag; RISC-V
> does not, so CONFIG_STATIC_MEMORY is unavailable on RISC-V and
> randconfig builds no longer require an explicit STATIC_MEMORY=n override
> to avoid a compilation error.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


