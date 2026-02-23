Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O+SOdV8nGm6IQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:14:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD541797E0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239210.1540656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYZK-0003oe-Vj; Mon, 23 Feb 2026 16:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239210.1540656; Mon, 23 Feb 2026 16:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYZK-0003nk-Rx; Mon, 23 Feb 2026 16:13:58 +0000
Received: by outflank-mailman (input) for mailman id 1239210;
 Mon, 23 Feb 2026 16:13:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuYZJ-0003ne-Rl
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 16:13:57 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6dd3f2a-10d2-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 17:13:55 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4833115090dso43261745e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 08:13:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4c96csm22101500f8f.30.2026.02.23.08.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:13:54 -0800 (PST)
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
X-Inumbo-ID: a6dd3f2a-10d2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771863235; x=1772468035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jGxTOybbCg22+4Rnf6nxIvif+/gZPfu2k1JRyAn1xpk=;
        b=I7U5fXAUN56GAEQYWv/8xdxPbBbQowxvFVel7B6FcwuiIYfM/W+xGH1QOL5/7fdoJ6
         JoRjHVovUNcyX9HbEMqvpGKEJE52OLwLPFO8YS4CAKR/SbjRyL2eOuhHj5j+u6j8efn5
         RqVXNKD/wkrE5VBZufhzVc0mQS2BZwpTNAONGp3vNkUopn0/sOFy1KAwypurMCFS5BzN
         9OI0XH7jO/HCwzSaOF2kSX8JtuflITO4kyq2Ak48KmO/SnE4LE37n33HUrSmpTw8NN2l
         YH2Csy/j31HRii3zNwjTuDxCk7LWhWYIAtquQbNBClUP0Y3e6HBeB5/A43gcan9Bh46T
         4Uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863235; x=1772468035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGxTOybbCg22+4Rnf6nxIvif+/gZPfu2k1JRyAn1xpk=;
        b=DjODDE1wuhDjIvXC9N2yjK2Z97SYP3lGieLajES2nV5FWX9NNHOaAMPmwUbJvJtte+
         HVeVe64bNA38+/uRxQwciBhr8BNrAz02SdXT8v05tVDqrCQgZJT7R4R/B7ployvYvvq2
         2C5eZP/H7Em0VfBNemB240w5i3EUpwPhPhhY3C6GsUQogPDCNACzPpVTmQUGvJW+oZSS
         CEtyBKu8CEG4q0DPjBX7n/gsHONZWzrg94uXKoC06Ew891wWVREpiqqJr9MHZBg0Q/C/
         bQ1jZF1Sz1717e3eb51KmHDdaPsI18pu/7iW/Olz8z/n2moQ237613/5fK77/yYdnjlO
         RMIA==
X-Forwarded-Encrypted: i=1; AJvYcCUwuDixUeRBCnPiKD/JTh80w3KTOwikZuiKLS6YWU9PLk9A0ybqwYy2Hb9J8O3kVEQLs+Swwa3xbqM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5mxAwVfiRWgzpzWNmp6r95DUqq4oOB+U9DUnVexSK0pnhgfYJ
	88yT6SgI8Xo5Ra19ELeWswEmlSOcVd2QUsttzoxbIBFYbeBZOkiaxBFfFr/9hxAUvQ==
X-Gm-Gg: AZuq6aKTvRSfe602G25mJ0M5pxKG+O+jIR+7GNG5S9Q0GJg/JU68M8anzYTyUFASxfk
	hGCK/ZaC3olbFRXTntEOjtfQ8li8Hw62H/AQYsuCXzYsMvPeEmnGhPok1ZF1pG8Z0eJrcXGhvJn
	6L+eHVCbScZ9o/SiYnNB+d3cBEIzcE9y4oSzDjWCHwhJf58v4qhK4fvWKRLGfsxbVCVxwnJdLol
	1uPRHouXl73oE7LC0ppgAz3hEoIlZRYN4T5YtJ05LogBqE7al0FqGrvx2ZSvBL2HST82WZIQ1WY
	V+sztowItGj6Rt9FFP8iJUbOqUmQITxIvp6kcxu/J8nXpgSm/surwSnOennsxV2xY77nNblXAc5
	36iFcz2MHiMNqwediQUESa9SYeZ7nZ+nhd/n4tUVFDXshaGpWOv8MveBU83QRtQrahNoDEP9Rt9
	NfavcmKl2oXxMyReEAIB/ITH1uZVQUSwI/MCjfTdJi1FchYb3iPTEV7ffpVMuu49IDSW4q02iyr
	wYaYIqg5sabRs8=
X-Received: by 2002:a05:600c:6206:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-483a95b6debmr145465435e9.6.1771863234942;
        Mon, 23 Feb 2026 08:13:54 -0800 (PST)
Message-ID: <0d7afac2-d358-4b0e-b828-31ebba6357d2@suse.com>
Date: Mon, 23 Feb 2026 17:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] libxc: Report consistent errors in xc_resource_op
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <c8677e4588eff14197e47070587f31df1567c030.1771860109.git.teddy.astie@vates.tech>
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
In-Reply-To: <c8677e4588eff14197e47070587f31df1567c030.1771860109.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7BD541797E0
X-Rspamd-Action: no action

On 23.02.2026 17:06, Teddy Astie wrote:
> xc_report_op returns -1 in some error conditions.
> Make sure it returns -ENOMEM in out of memory errors and -EINVAL
> in invalid usages errors.

Isn't this a move in the wrong direction? -1 as a return value is quite okay.
errno wants setting to indicate the cause of the error (if called functions
don't already set it properly).

Also nit: s/xc_report_op/xc_resource_op/ .

Jan

