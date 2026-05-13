Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJDPOJmFBGrVKwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:07:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951E3534B1B
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308094.1579642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAEz-000297-FX; Wed, 13 May 2026 14:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308094.1579642; Wed, 13 May 2026 14:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNAEz-00026g-Bd; Wed, 13 May 2026 14:07:13 +0000
Received: by outflank-mailman (input) for mailman id 1308094;
 Wed, 13 May 2026 14:07:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNAEx-00025d-W1
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:07:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNAEx-00DPNx-Cj
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:07:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a04858c-2eae-0a2a0a5409dd-0a2a450abbf2-12
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:07:11 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a048517-56b3-0a2a450a0019-d155dd2bc89a-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:05:11 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso4314438f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:05:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491ca383asm39787299f8f.28.2026.05.13.07.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 07:05:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778681111; x=1779285911; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZk4DuQaTrqFMq7vwcvBSZ7FBo8uSnF/2RWcSDO69h0=;
        b=C3fb7jLBC69BISNRV0TvBROsv/j+ka2awnHv0CR8smF1wQdylo0/f/Y/8lw8EPt/Er
         5R5ua/pgMVBx1hen+AQ9m3ranTK0fpd3Zogvb2Du+U9hT9ahdgNPHU52sbc8A/m8X49t
         aBf67qaG4ZN5z7LCfIQwqwOVMOnnBWQV2ILK1MNcCcV03TRakrtqtLXFgI3OCzzE/qAM
         C/Cz/uYcUzcxShmw/pPLZBDw+EsABxKx++RUejiknxBdbJw90qcjZpgwG70OW+7MDBaF
         XwMjtpP7HeejIqA2dketZ1Y5KwtEj7cLj6efNg2okFE5Cje/AY/EhGtGGtQ1lgYFIJxv
         aT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681111; x=1779285911;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZk4DuQaTrqFMq7vwcvBSZ7FBo8uSnF/2RWcSDO69h0=;
        b=k/WK6AxIExA3vRjPVzRvGSNX/4ic0417Dn2tsgjOfjWt2Ww7YDtTkeE5kQxg2S5YFG
         UR+pq8lGeb8R4XKJTHBL+JPR9fHzTAIUhVnTft8lS2vze/8QEGEfJA6BAUx+0vPwqdxg
         7FfZ9SORrHu04uF5q4D/ETn31Q1LzTDW2nUCGq2nySeVSQc8z4YGErn1Fnaen2X9akrf
         f2JaJ1IpU9amRXfK/UzSgxDJIFsoiYXUhuyjm+fuJcU+qb6fWViOIt6N6gtk5YtlRMGA
         l2yiOpWq5wfls6Xqi8kk2M9KbpN3Cg+r2aSqhd8m886FO2P4ij0oP5XSOah25zOLlOHl
         o7pw==
X-Gm-Message-State: AOJu0YzR/r2SXulx90cS5gyTRqV/439qmOzn+jzolN013/a3wMW3TevS
	vWPxMOAKh8U+bj4Fd/Y0Cp+8NCJf4gb6Z0vNl2AzOx5RnD9sd2txigWTRerkxziUz25PpxhntiU
	IGEw=
X-Gm-Gg: Acq92OEZhyzanA4wlDeYpocAbjKIpjxAlwlN4kOUaosz0Vt/F8HCiN7Bp0i4n7mQ8PZ
	T2DKyVrHjtaQBiYByUybFoi01lx/q6pRtEraisZr0mSnCBlXX66tzGfM4WkDUzSjNb7PCXZW7Iz
	CyS1W0hz2h/fjK6oalWfaAqDBAXxo80S3s6jMveCbb/6i96egFsBWRHjYND2NG9L3lpaF0tt4vX
	SiRACImeOR1GPD2V1fIJbc1SLVeVyTStynfs9ZUtDIwX33Cht4d/v0lZzZtP2oRusDVPCQe7fGH
	vnwC5TB0G5Jlut96NMl13E6cwgNn8+tsKrxLCxOnj/zyBwcupeFotaCcIfrbMHFnvBe8N2UcjKn
	0llUDq5+omhM39DtefJLmbupiakbcLCfvrr2NRcU4p8OcmdF6vOz4rT9XnCl7gV9emh1W+WmZOV
	Zw1iH69hdNbG4J/Xls9Cyg20r3mLulkBK4kAKwmyp+IdVhh22d5faxjfTK8R6UI65cWrB0Can4n
	iu4vvuUUIz5AJ0=
X-Received: by 2002:a05:6000:24c3:b0:448:8db5:410b with SMTP id ffacd0b85a97d-45c599ebcc5mr5726250f8f.20.1778681108528;
        Wed, 13 May 2026 07:05:08 -0700 (PDT)
Message-ID: <e3cdf68f-122a-4a41-a72c-8e6ed857b282@suse.com>
Date: Wed, 13 May 2026 16:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: Misra rule 16.2
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1778681111-7035B8B7-0E0B13A7/13/0
X-purgate-type: clean
X-purgate-size: 191
X-Rspamd-Queue-Id: 951E3534B1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,gitlab.com:url];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14351897188
(covering more than just this)

1: mm: address Misra C:2012 rule 16.2
2: PV: address Misra C:2012 rule 16.2

Jan

