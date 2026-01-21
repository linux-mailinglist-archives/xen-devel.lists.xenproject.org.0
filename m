Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI3YM7/XcGkOaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:42:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400E757A9C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 14:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209800.1521714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viYTN-0000Eu-Ox; Wed, 21 Jan 2026 13:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209800.1521714; Wed, 21 Jan 2026 13:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viYTN-0000CA-MH; Wed, 21 Jan 2026 13:42:13 +0000
Received: by outflank-mailman (input) for mailman id 1209800;
 Wed, 21 Jan 2026 13:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viYTM-0000C1-Qi
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 13:42:12 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc90b268-f6ce-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 14:42:11 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so5363453f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 05:42:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921facsm35233789f8f.5.2026.01.21.05.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 05:42:10 -0800 (PST)
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
X-Inumbo-ID: fc90b268-f6ce-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769002930; x=1769607730; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cs5bIakwvvdAUWgATm5aIb+v+sRloirld+uTq/fbZLM=;
        b=A0H4LPkouQUMxDrR2z47aVg3jLDeHicZTlWHhSwhX9y2LOR1m6xz2OugGaz2vkInEP
         yTVjFW+1LX4NSU6E2WGOo1o/zfOIP0Rt4+KTZgUHqWOtBDn8NL/7dWD2j0yK8TJ2HlnS
         qPmnm49Fvav0JcalZfu6W7xYzGrGSs1tBrLJlqXqQ+9ZAd0Nz5Vj9gfrws0IyyIqMzZZ
         yPGQc+qSWykeDbj9WgKIlINZcb54WgHkjyrEAxB+GXhZDGgkTbV3T3gLJ+SEbenxjtDK
         JQHK0xCbU664crU60ydZd72RxNSc00QHUAVjEhekxK3/6I98RTWuZFOJzOdDdJwtohPw
         cxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769002930; x=1769607730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs5bIakwvvdAUWgATm5aIb+v+sRloirld+uTq/fbZLM=;
        b=SO/iyRXXuDt7tMPNtH1sJkck+Lr6rC2UNBuBJNVhnzqiQCkBU4XuuiJQSwe103Nnxk
         /kkNmSWH+OSRO6ui6M0jRiq5mqmgjUfAKIUHC3R2IToR1E6mIgo0H1WRmTUzLGEZYPnp
         5qhPJe/YExQ4iAjmqI8cQSp7Ttaf5KOJm4pWQsbpx8AJGoUGc5+BBGjd4hoBa+yuFUez
         kGQEtgQSon8o5ruV2u7f4xU+izMgijZK/qW8qB/Lhr7bR0dRGTz0Txi2VR2aLrcXb9bs
         NQS9ZaqnzpvQ1tmEtweHibfYsPudtXzEJ/YHTnNG3h+VI6DF6iNdiXOZQZ1CEpaeierz
         15Lw==
X-Forwarded-Encrypted: i=1; AJvYcCU73MewJWgkeSYtGnZkxf9LNW0Rwxs9MfuhzpPC/dg27EeGtnx5Rm9Nx7ufoNDjylqbD0h7Ky4ap5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTf7p+fP6bcXv4poJc7GAqomlz5c0r409GACIN9yMX1owu/u9u
	dAimXvKkta4Ce0utoluqAI9JXWDluTnc9fGf00WCezeCqHY2EwxJa3lag6PcuTV9FA==
X-Gm-Gg: AZuq6aI7M+9HePpNPsUh9kjB+p/SffByxkRwGTtTkvm1RPG0mofaoUpe4mp93NUy28h
	X37TtNkaHJRuXPUYRBFBsOsN8MWajFqvROxSeIek6+Q/HUMqXlBU7pBudM32DupyhD9Qd5w6G+5
	S3tvnhPW1mhY67W3h3Kq/kBN/PWTs7uGnwEcWzU47hPPN6+kNfYkKeE+VpPgEtY1RO8hwyacd41
	tHZYIO1NBy+BGoR4lU07zu598+e8aoI+k3mzcrg3jNZCYdqj/qcw3lceFJYXxkdN6Z+EHNkZ70r
	mWsCo01M4AFpzVy1kW9kayihDRfoy2xX5uK43Ye01iArKpT7pmbxvKUQp0zpbs/jxHRKRwnLKgO
	tte6uRgrt1+W4Dyo1UTLjRoYaavFfnWYvmy52dp1/jesZbYTUwYBiu3f3IS5LKU47WP3jrINxBV
	zjICwrIwU0YTklqiXRtD1HWMlZ9ER0Kmof3jZ2J3tzPnoChGqkO8IF14t3jvWrqQyHxthBCGlgO
	XM=
X-Received: by 2002:a05:6000:208a:b0:430:fd0f:2910 with SMTP id ffacd0b85a97d-4358fed868dmr9707003f8f.26.1769002930333;
        Wed, 21 Jan 2026 05:42:10 -0800 (PST)
Message-ID: <a5389c57-d924-47e2-a76a-baef4d8ef690@suse.com>
Date: Wed, 21 Jan 2026 14:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/amd: Exclude K8 RevD and earlier from levelling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
 <20251202105710.1472927-3-andrew.cooper3@citrix.com>
 <7d019929-24df-4523-9817-6c17017c2320@suse.com>
 <4762dc23-cf30-43b0-ae19-fceabea5d8c3@citrix.com>
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
In-Reply-To: <4762dc23-cf30-43b0-ae19-fceabea5d8c3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,suse.com:dkim,suse.com:mid];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 400E757A9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.01.2026 12:52, Andrew Cooper wrote:
> On 08/12/2025 9:25 am, Jan Beulich wrote:
>> On 02.12.2025 11:57, Andrew Cooper wrote:
>>> Between RevD and RevE silicon, the feature MSRs moved location.  This property
>>> is highlighted by the suggested workaround for Erratum #110 which gives the
>>> two different MSRs for the extended feature leaf.
>>>
>>> The other feature MSRs are not given and while they're easy enough to figure
>>> out I don't have any K8's to test the result with.
>> I can see where you're coming from, but shouldn't we then first document those
>> extremely old models as unsupported in SUPPORT.md?
> 
> Not especially, no.
> 
> There are Intel CPUs with no levelling capabilities at all, that have no
> (non)support statement.  The levelling on most AMD CPUs is incomplete too.

Hmm, true.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

