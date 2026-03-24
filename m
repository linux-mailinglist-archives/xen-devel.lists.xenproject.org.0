Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOoUHWS2wmlilAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:05:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F72318AE0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261039.1554176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54GG-0002hV-VF; Tue, 24 Mar 2026 16:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261039.1554176; Tue, 24 Mar 2026 16:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54GG-0002ee-S9; Tue, 24 Mar 2026 16:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1261039;
 Tue, 24 Mar 2026 16:05:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w54GF-0002eS-0g
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:05:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54GE-002nIk-Cy
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:05:42 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2b650-bab6-0a2a0a5309dd-0a2a4503b4d8-10
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:05:42 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2b656-1947-0a2a45030019-d155dd2ff1c8-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:05:42 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43b40fb7f95so1429246f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:05:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b647120a1sm40889336f8f.30.2026.03.24.09.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 09:05:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1774368342; x=1774973142; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SntnK1aNpVDkUy3UNMoJXCG2P2jMe4re9JFd2R1gDXQ=;
        b=KCTe8eRdUs13vT6njgHacZp7nJw6/Jm1jE3XRFMXjneet/ZcNig/k9XbCWlNIKBPFm
         3rYGV8wZOA/dFDTUkxDT8GtBDwyFYUxGte4OR2b1tyhKZs59TKnuHKIVKEy8B6iHBu95
         Jpw13S/C4BZNHbV5bJESvfNF46RqYRZzvA+Mj8kfotssdVpmsblWMElkpU1rKcOcVGTf
         8zMd8sq/Qr3PdkvYZeT7E6bOjeOfSo6D4aSCyRtwHoS303XOox/O23dwe95cn/uj7xsi
         nt2WZndEVHhLaZW3RbeojLuc7VkrU9zEof2TkatPMDJbPerEnFOkiYF/LFwjkbye8nPb
         f2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368342; x=1774973142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SntnK1aNpVDkUy3UNMoJXCG2P2jMe4re9JFd2R1gDXQ=;
        b=NRfjYczN5EzvoDSjK4lYSEzQ13bbh5Mxe4vfgTgMRtQGK6ai1BROAKYHgMoEv1jzYx
         H8KKpGO8u/zhTrndTUz8b/vPCi9HQdNbzmcINiEZ3D3xAFe17IIdEUQRDiIovPR/SHmt
         RcZQrlBkqwPSD35maDbATejUaftL4VYoqQ/YXM6Rl4W4GQ4chVhrD1+qVPBVSnoogFZX
         I3e6rW0Ujv5aKGCgpxUWb21Pc0VkSE8vXxR9nKje3+lQgKlYsSm0ClLzWrkLTTR22OAt
         jbyXZ4pm3jZTbmGnZPvye5sZTLgCJ3CvUBgUs7Vk3vH79L6VKbqcou2mBgFLjIU7g2Qb
         qM9g==
X-Forwarded-Encrypted: i=1; AJvYcCW/byVpXCSKmqvg30/JmWrO2TGN2zeglu7HiZxf9aRh5mwe3Ywxvh9MDmGYolxJ5N99Fg8GZl9FRwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJKTwjITSed+k2LxKG+lXTfbF+QC4+DjvhyUoC+iGZIpV3ocGL
	TD0506UIPAiv+WqXqSx0kplcZtgl64arBz9nB5peMGVCilKqn5vhQJT1Z6Hj8T7MTrLspAixL72
	//91bkA==
X-Gm-Gg: ATEYQzxTs4wZkmquRJhzKI44Fv5zebopSe1IbRH6O1T94YNnFhO20cpTwmT1LtGT/ge
	9EPk6LkVGcflb7jdaFlKwB007KjVGlFxOfSJ/bZ/1G5SPpA4Ju2pkiauFCRQFpOApB59hLRjxU/
	pNd9/mNSoeCM0VHfJDcC5SETNwUftJtknhTAGCMRpvcwgjbMOlJmjzmeyG42vSIlLABx2Re/AHq
	bWr4PSFJujr+5Wh0fIITUcg+BkogTNOdCL+ybjw09kM+1T1hyf1W8qDR0WftUht1LRayfkBycHq
	P//iZ7okY7Qm81QknBolwpVzWV8hqJfBh0/A0BzXGxEnTv9l7zyHEzI2k9z7batTC7YIfJRQo8u
	iHimey14m3UrCpEH8o8rGkdVIEiLavloRJSskFMf5rnyDJ4T0U4Qe3L25JYs82asD21wGvIn/51
	99CnkKm51yRQUlrofCek6Ilns1JUJpi4fq3gujpYcP69o01P2XkTYSm1i/Uspx3IYDwfz4LuxFV
	9rhImKctE3r6wU=
X-Received: by 2002:a05:6000:2308:b0:43b:6a16:17e with SMTP id ffacd0b85a97d-43b88994d97mr77119f8f.11.1774368341533;
        Tue, 24 Mar 2026 09:05:41 -0700 (PDT)
Message-ID: <a6f3a73a-ff5d-4a84-a35f-8b5c53d50183@suse.com>
Date: Tue, 24 Mar 2026 17:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/vpmu: Limit to using supported general/fixed
 counters
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <854c5fe569f1a2f1f60e0768ee3d9a921ad54215.1773160025.git.teddy.astie@vates.tech>
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
In-Reply-To: <854c5fe569f1a2f1f60e0768ee3d9a921ad54215.1773160025.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774368342-77E8D72C-95E51F1B/0/0
X-purgate-type: clean
X-purgate-size: 849
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D3F72318AE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 17:44, Teddy Astie wrote:
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -276,6 +276,12 @@ switch ( p->x86_vendor )
>          if ( p->basic.pmu.version > 2 )
>              p->basic.pmu.version = 2;

The literal numbers here are already on the edge, but ...

> +        /* Truncate control register count to what we support */
> +        if ( p->basic.pmu.num_gp_ctrs > 8 )
> +            p->basic.pmu.num_gp_ctrs = 8;
> +
> +        if ( p->basic.pmu.num_fixed_ctr > 3 )
> +            p->basic.pmu.num_fixed_ctr = 3;

... these surely go too far. How do you suggest would one (easily) identify
all the 3-s or 8-s that belong together when wanting to bump the limit?
(Altogether therefore already the earlier patch wants to introduce a
#define for the max guest-visible version.)

Jan

