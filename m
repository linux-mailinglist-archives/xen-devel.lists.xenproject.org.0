Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIaSGRWlsmnwOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:35:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8392710FF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:35:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252154.1548923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eKJ-0003h8-Ae; Thu, 12 Mar 2026 11:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252154.1548923; Thu, 12 Mar 2026 11:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eKJ-0003ea-7h; Thu, 12 Mar 2026 11:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1252154;
 Thu, 12 Mar 2026 11:35:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0eKG-0003eO-Vq
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:35:36 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95ade7c5-1e07-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:35:35 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso946961f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:35:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1b22e7sm8145182f8f.16.2026.03.12.04.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 04:35:34 -0700 (PDT)
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
X-Inumbo-ID: 95ade7c5-1e07-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773315334; x=1773920134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yfVZWoOf5y1hseaIR/V1s9D943lTLQym8jqc7vHY4HA=;
        b=KR4lic9YvhOcW3VgE4zkf2HuBoD+ebbd10w45Vg3pG0v+B4PkJEWJ+fwqtEzcMAy9g
         bxjNCFk7ho1Q51yEQvWc7KR7nCnaMi3aIfNTajqB/qsBMygOYfrQOCImei6nC9mTBdQq
         IPUFc8CAnRCdr/yviESHHBkq/1H+Ppdpid4xoYtF5Gfjf3HAgGLNN/VGq1fWMBtvJuj4
         r4HkXd7d+otpz7TaUlaEuIXSQWpvVofXPjzWO5r2BS6BL+TeXxiVIV5u5LfR6khReN3+
         dYfGrK4w1iPAfdQs0SdlODGkmPyHm/aU3nNTIvFJnFSw7vdsormNTwvUa8Z0jO24Fcga
         axPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315334; x=1773920134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfVZWoOf5y1hseaIR/V1s9D943lTLQym8jqc7vHY4HA=;
        b=Bn0X/POGlvfzfcER9DeOFccdpIl5A1+wUT8OONvndTAGLtPeV1+4+hg04rsltAzZnz
         SzIy1vcnTEqJRMKyDcbbQJVOQQPC4PQRZsyD38JLNisNXrxiOUxxus9G/QB1JvWrYPFf
         tLbm7OwLwDY2nspCw0X3nIh+nSC3GkqC8WP1l6t2+9VXX8v/EFQ09dwfgfjocDVmyCPk
         bHv4/FAsbJvfs8+e1QlGWVgd+gNnRoNkttVsSW89JjrXxfE07twi2KSDN8os0h5kKFa7
         6MXeCqytWPWP3On7IZw87ZOHDB8sWlee9x0qECHJh8uSTr/6BCDSoAX63vyM7n8UsHiA
         LhZg==
X-Forwarded-Encrypted: i=1; AJvYcCWVaIvqvPc+aB7DrDZw0ESW5vaB5kPOU0iTBNP5Pw9cw0jM3kyDCBY1HY/myBRH+LrHl5YUMYRAZQo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOpHq9WLSMbSXDe+eXBNfgnV0UNm/tIyHJoVluDL1Ay31mgt5E
	sZToj549r52AYATG8XkfyVr7uhx5YR4q9e5oTGWjhk8MYvzNVp/LjjamMA4GrV/oTA==
X-Gm-Gg: ATEYQzwdzHEdOhOLn64KpZIyrM59OFARXtiod7Qrl97xHFe+AfxJg/MnTECf1ldPf8O
	+acNll1OQsocPy+lNBKHlbk9nzJSMQLnagBuXSN8hfm0Em6dfx74ZbVhLUdsde+s4L9/9XWxZ37
	gyTwi390C74IuIhF926Z4wE/QvUMIHBMorRTCM4IMAQZlpmiTdoh4jR8ZVrJwwOsOQEHG0FyqJO
	qnNjA9na3I7XQ8Zj8NrvUoJPvezYr0uYxCxoI+EMtgBww+BxEdOgvb7vfATCnwPXGT3iwZ4DrN1
	n2g7qDVssl1KQDd3TS+3aAF8Hf6f3FOqbRjhd2tv2Ouc4tf1fLi2W7epuJpTgp7tgZjlTVVaHSG
	S4s8+CkzRtGDawRfcqADvNFJql2rGDHYOD6HlXUwuzQqCv0OqMIooYGrM3pCf7/QhC4Hz9LMSux
	NmeQUMC2zVBZ93JMr7oCLacIHBrDyp5PONuDkL+wyCIJmvl7RuTXfXPtY3aueOZBkVUCSJW8vJ0
	8Wj4srSmxIVe1E=
X-Received: by 2002:a05:6000:4028:b0:439:b7c9:2ef0 with SMTP id ffacd0b85a97d-439f822a7c3mr10343137f8f.33.1773315334536;
        Thu, 12 Mar 2026 04:35:34 -0700 (PDT)
Message-ID: <18fbb44c-92b8-4298-9931-6db1c252b043@suse.com>
Date: Thu, 12 Mar 2026 12:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] x86: Drop cross-vendor support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1A8392710FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 12:21, Alejandro Vallejo wrote:
> Patches 2, 4 and 5 missing acks.

What's missing for patch 4?

Jan

