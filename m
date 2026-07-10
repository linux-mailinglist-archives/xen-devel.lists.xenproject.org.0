Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QhcTEPSeUGoe2gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 09:27:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905C27380B1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 09:27:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=UFiUgfgO;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358819.1612718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi5e4-0000ce-Bj; Fri, 10 Jul 2026 07:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358819.1612718; Fri, 10 Jul 2026 07:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi5e4-0000Zw-8s; Fri, 10 Jul 2026 07:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1358819;
 Fri, 10 Jul 2026 07:27:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wi5e3-0000Zq-OY
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 07:27:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi5e3-00EFFq-1Z
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 09:27:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a509ed2-bab6-0a2a0a5309dd-0a2a45018dde-32
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:27:34 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a509ee6-3ea4-0a2a45010019-d155802ab8e8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:27:34 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493f45e20cdso1763965e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 00:27:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b0cesm58688382f8f.22.2026.07.10.00.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 00:27:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1783668454; x=1784273254; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlwexyE0dX8aaWGYxq8kKzZEVQsDGXLLnvmpWTkYmyg=;
        b=UFiUgfgOaO586w9Jnc/MwglRkGego/kLVZyV0sFOSd3bknmwKLa0bMBmaEB3uS5pJJ
         hFlB8CJboWuuKLcAhhAIZhvNz+ydjPnUb+26PuWhzKosxsIRnnlc9dHmU/9C81VjaEUK
         RKOyh5aaYpkEqNkk63xWQIOyGCyy3iv/4WGDmoOgwMiGvUJokQ/OyXr5PIbiwYPypHJe
         9whphHmRmVJK2QY4eeXNQEMvqBqpqQhJLTQMCq3p54ATDiE6lr13NnbKl/z7xyqSOltw
         HaFwBjJlxX+IeRX8Uvw/kgD1xyj5/+uChWVag6+EzCAUQfVTsxwZYCgdnw4dJjojQmhF
         S1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783668454; x=1784273254;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlwexyE0dX8aaWGYxq8kKzZEVQsDGXLLnvmpWTkYmyg=;
        b=kQ1FxGlGjunnj7AKzrpj774QK7oL7E0FXLH+CxHeOkfmXaYU5nDc2IXU0aZAxiKhdF
         /DWFgFjXFvPB4NYFpwb2zeQXa1aUhX4V2F71oOlZKWMBgQO8UBYYMaeo4HgMeWPQnmNa
         aSM4tXcHYEkliAbnphz5d3Pa28ieYLIGLtBoYViAb4cK090Iod+iDyUUjLuKG+IINHHk
         zG+o1aLmFO0hNVXbByvoA/euGMLA7oZQg4tlaa2sojioF3qBzujCywkqmOx8kakrRPpp
         zueuyFbphZGFhCqh7qNoaz1EodPJkVEfhe4T5YmEsH9vFIpRdgYAB5W0V28QpiAOXxhT
         gyaw==
X-Forwarded-Encrypted: i=1; AHgh+Rok/C1yBNdUtPpcmFO2DCGJL4BiwkmbuSpFQfbguWs1r4Gh0E7/GM1XhrsX/ZjGrVuBdT0rVLu0Woc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIb+pvYlnx2fG0q3lNOtXk+KQg1Jfxrk3Sc3SA/PNRTnV8fRGg
	OFAW9gh012dWQo9yX4GjIZMBPPfS+sEK1rSZqUih2ZYrIfILc0UbH9GaR2nRNbqNu3XLkrgpazU
	rze/QhA==
X-Gm-Gg: AfdE7ckgpNOcwZQNEgGOFZV7QkHt6SX0fb/7ejy6vCcd2IzEiEEZ0EbhmiNQ8W/ODax
	kj1xTbtZAKRZn9LKuJ4+YKuvBcux89Pjnkr6x/t7aEjE23XnclhhqTyuiL0pmYvZcv8/XOqcvQn
	z1FYuVSQuFo7aFPdbl2uxxFY8gcmyFOPT2xevepwQiawpX3+K3r4nrV+Q1Zl/CH2cvF8fVQKCMa
	Rd/xvMERtLsK/hl9UH47d70hg3DNJSryEWUugKEdEpS9r1+ojlyn9MLPBHQ6pfn3ksXfY/WSdP3
	flzMVBIUKz8w3x9IILG0lqUBIIsXEiw4OWckP434Qd/IWj4H3oKxpw8H6Ejk50CK7Y91YkeXpW+
	Qn+dDJ0FvLnLWH6ESyI7tAEkZ+HKHNpah1D8EBX1aEgAKhFotRsX4UVNuQQzqiT/BkAlQsJ21ue
	iZRbqp28C6CNIMkTzyWS0VZb7FE26n/DeG7a0Hl8KIMwDjvUOZvxqzZ6anOfQfZms4vY09Zaas0
	3RW
X-Received: by 2002:a05:600c:3e0f:b0:493:9cb3:53fc with SMTP id 5b1f17b1804b1-493e7e84c21mr88909075e9.11.1783668454495;
        Fri, 10 Jul 2026 00:27:34 -0700 (PDT)
Message-ID: <0ca52731-df94-4b80-bae6-acba97aa6508@suse.com>
Date: Fri, 10 Jul 2026 09:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] xen/sched: Link CPU topology to scheduler
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260709220552.646462-1-taka@valinux.co.jp>
 <20260709220552.646462-3-taka@valinux.co.jp>
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
In-Reply-To: <20260709220552.646462-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1783668454-6D0A20A8-C24D4DB4/0/0
X-purgate-type: clean
X-purgate-size: 490
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:email];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,suse.com,xenproject.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: 905C27380B1

On 10.07.2026 00:05, Hirokazu Takahashi wrote:
> Make CPU topology information available to the Xen scheduler.
> Additionally, ensure that this topology information is displayed
> when executing the 'xl info -n' command.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
> Changes in v5:
>   Corrected the erroneous use of CONFIG_CPU_TOPOLOGY to
>   CONFIG_GENERIC_CPU_TOPOLOGY.

Same here - my v4 comments weren't taken into account at all, as it looks.

Jan

