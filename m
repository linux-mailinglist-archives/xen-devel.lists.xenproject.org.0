Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O/iAgGrHmq3IwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:05:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7343162C200
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324706.1590213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUM0I-000462-07; Tue, 02 Jun 2026 10:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324706.1590213; Tue, 02 Jun 2026 10:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUM0H-00044b-Sh; Tue, 02 Jun 2026 10:05:45 +0000
Received: by outflank-mailman (input) for mailman id 1324706;
 Tue, 02 Jun 2026 10:05:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUM0G-000441-N1
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:05:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUM0G-00GVvh-3S
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:05:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eaaf0-2eae-0a2a0a5409dd-0a2a4501abaa-22
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:05:43 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eaaf7-c1f2-0a2a45010019-d155802fd979-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:05:43 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so2442105e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 03:05:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1049f8sm95754285e9.18.2026.06.02.03.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 03:05:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1780394743; x=1780999543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mIrY7zJmyZ876FfkoH1obVzFi6ar/9EMiCr3M74tAVw=;
        b=RT2/u9gklx/vKD0rXSxRQVDynyA1wBE3p7M3YIOGPhyxd10CPiv68V0kRjU16rNIzd
         gt0zltzNZ2ww9qDlYOxh76mOYeNNL1CM0NtIv6toZqeLdaFYdVxE3eBPQmd6AsyLFFNG
         hGdMvLoahyx7WX0k0HnfqYkpDySLp3HsjGk/S3oDiDsJWK056ae+FSPAoGmwH/K/V1A6
         pKAdaLEMXSvhyoF1wMl/cbCGWijq//964QVP/HBiHOutidxXViwtbcv6VNPhfF9dYDGM
         ZR6rArkjz/zGpikAUrXk4SWzxeKYb8ADeRk7YOVyxgNek9MtxrSQfqdjCqH77oeaoAuY
         4DDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394743; x=1780999543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIrY7zJmyZ876FfkoH1obVzFi6ar/9EMiCr3M74tAVw=;
        b=ZPrzgW0tgskoFzkJNRc6NbEeE6wO1b8qU19vERSj84Khb/DIb45F0tOw7UD1FqWNj/
         rhxxKoV+lXab/hNnInEp8HvQ9K7eny6DrvFHPCAgGOgEeag5KbNnwp41JteDthNr+EM7
         TPEqhj5EMx5v0yaF9nQ727UFoQSDuXwe2v4nxJr33eDcEX5apnYw6MT3vOI+Y9CZl9CH
         ZP01FSWDiSCWSGfGwzUQMSafT1KHdwkOCP8YaAgUKs94yvYUS0/VCoI43rcOzLR6rPdd
         4M7dKx6piuTV5qYVoVmRbJuMaWdH4+7nJWMstIrl4cGfAUC8oBh9LIaCz3Haf5BVV0tY
         CWvw==
X-Forwarded-Encrypted: i=1; AFNElJ88E0KDy7nhr0bl7bgxWlxuJYxedyTkAXwvhVvmJmcxYprs9nX5Gfvcuy5m7JfKvVbp1CGB1aL5INE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwK8bVPalQREkK8cLtCaMZLN07xSx9wNF1qEGAw68rvMzSbqgS
	Vfpku7qq6Id8RNsSzd8JUui4ol3e9nsHXVHS1HysqiYsqiVAWvtYR/fvv/EuWMKEOw==
X-Gm-Gg: Acq92OGkJNYQYS3tsQCr/HX75ZXKtG5fyBxOo31mbzqniILFOPwlEwwSV37yJd2Zy6j
	y7Ku7WBLzYT1tABhn8oUvdaDrhHEuaUhuS/Xw3Vl2YMZY7/Y/2hnXJJ6yNkylcI+/F3y45/jBAH
	9h2kTU1xO4qsFShEeO1kZUIuuclNmC7nm8gXjjyIrTQPZTqzu71th8gqjdhpSZrN5LJJcoNmkuV
	ET1ZgulMs0EVJs2rfh+eBshlWp95hXCsxHGdx5255/vIqQiX+Uq5JxJVnm2arDJCnLVO6eQop0K
	6iDO/Li0A1SibvoQQ13wZpQrBW/KUsnS4n0xpctjO8bPdkUtNTT++HGE8xXxmCc7g2xC/+NPQBH
	XFr+dDIj1LGH7sBMxa8Iws2Yk/qyqmlnjzJZArDq16xoqj6OXpst5vBmGb/dP1/2BBrtd2cneYC
	d8azZlHKKWLvdsBtcgMB6BbKVmjUREnwwrCMsfXGYCWFyU75Z1kNRZoS73D+JzV1A/gVczbrr8I
	0s+s603c817sWWogLqlXFeO9w==
X-Received: by 2002:a05:600c:8b01:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-490b06a6547mr62570725e9.25.1780394743469;
        Tue, 02 Jun 2026 03:05:43 -0700 (PDT)
Message-ID: <a3b289b0-8bf8-42f3-8dd0-997e663c2ed4@suse.com>
Date: Tue, 2 Jun 2026 12:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/process: document AI-assisted patch tags
To: Cody Zuschlag <cody.zuschlag@gmail.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20260527174528.27903-1-cody.zuschlag@gmail.com>
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
In-Reply-To: <20260527174528.27903-1-cody.zuschlag@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1780394743-B4F48FF4-6F76E87F/0/0
X-purgate-type: clean
X-purgate-size: 360
X-Rspamd-Queue-Id: 7343162C200
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cody.zuschlag@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:codyzuschlag@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 27.05.2026 19:45, Cody Zuschlag wrote:
> Add documentation for the Assisted-by tag to clarify how
> AI-assisted tooling may be disclosed in Xen patches.
> 
> The guidance follows the Linux kernel documentation.
> 
> Assisted-by: ChatGPT:gpt-5.5
> Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


