Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FY0N+TwcWlKZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:41:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863BD64B11
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210592.1522231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virBx-0008OG-9c; Thu, 22 Jan 2026 09:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210592.1522231; Thu, 22 Jan 2026 09:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virBx-0008Ld-6d; Thu, 22 Jan 2026 09:41:29 +0000
Received: by outflank-mailman (input) for mailman id 1210592;
 Thu, 22 Jan 2026 09:41:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1virBw-0008LX-0y
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:41:28 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85700530-f776-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 10:41:26 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-480142406b3so5392205e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 01:41:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480424b18cesm48843975e9.4.2026.01.22.01.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:41:25 -0800 (PST)
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
X-Inumbo-ID: 85700530-f776-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769074886; x=1769679686; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY4of4wZVXqJ4i7T1N0G0Je3n9ZPZD7LNw16h8CICfc=;
        b=U7Iudd1Zx2aJty13COOIdCDVeQ4rlktaj52jdg2ri6LVyQtI2Nsfjt6yHga0ukd7im
         1BJhTj+lraO3HdMYRxgJOYGWgOAX7ikUt6BOlP4rMZzBFcwxINuzguuL0F2kXJNQuweG
         I0DMkAtsNRb8OvHI4Y1faWZcvVeH8EZvbVfeluNTXJ98Tv87bo+jLqb7gP6FdzjRzcIo
         HRolxbf7JhwqVbi2ShEyfiplHBSTQbfgHzJJSyC5V2nJOk1bIPstIrt/NukQHyQEwTfr
         tdE4TVugxQxHR7ESvJ2JzbTlq1EC81Npxk9IDbYe4Vm85KIUJeqQ2FglW+SD3Msfundp
         SNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074886; x=1769679686;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OY4of4wZVXqJ4i7T1N0G0Je3n9ZPZD7LNw16h8CICfc=;
        b=BLcydK1UagVVoXxzCp+By0Nl4eqOcb00J8Ji9ZmZJdCrhJ6R2e5LPnd7xepYkW+gXx
         nMCY7YC0E746/WpbD/k9bxgp1BC2x8yc9DU7bd1NDcb/Oy0HMXMb0aedq31ckRULdj6d
         0qfmo2KDSxqRq5PUbmA0Lq4a2z97ZNer1J7Tdwl7ztKtBjRGeBnd6hSkJGMtGVLaB08s
         7A8TH9tLMGwLRyZ3rhFFLshZMRXFBQO5eigAtKLyWAVkFWeIfHtPgicXooWZc2G6uI+S
         yNSfW/lmAqcb4zZG5tFs04Onu/HMpKb1IN3UHZhauRNND4PrfRJboydgXA/e0g4JGlQr
         FuVQ==
X-Gm-Message-State: AOJu0YwZb6bek9iHPVrCAsiVpcTxFU2TYU+3UEymjXrQnzJ7wySBxkzo
	JS9niNShAzvCuKbd9V8LOR5Aynehxxo089E7P0+1TyXXC5Bo4iV5/1kZuCAo2l7/A6ABTTKTQ0o
	zpxM=
X-Gm-Gg: AZuq6aIf8lDO3hm32ilCpVZFbUB85dJz+YQhva4e/v/ORq2CmUoz1xilw8mjpq2sO0n
	GrbnfW+tcphqJ1kuEQu3M+4tdjewOm9/fCZJMBRqoW+NZYKQiay15qCgantVpiluuOZsb1JVSKS
	oOYRlhSpFWnsAvV9gNKYezd/ioLzDoTs5+DLFPrTpBJIGBeLhS2mmXSsKVmKpuNKvAJcVH/jm0c
	SxiDf/zkqhQ/LAGvOi7B8mjr1E8qEhPDMqbCTegqaqLuQpZjTm+Ux86cdqaZb3dh9+zixqHvPuG
	/D6XUNuqSlPCwfS3W0TBYliw+leWDP0gRTXeektBKRkpdWoAFovvl98Mk0uy7Sv0rJ6J1LDtDTr
	IZbiaf1MB+MtVoZE16jKUihY7461J1eGtHdMkX5uSUgR2U65NcC9KJe5tlZvJuVYpSy08dumKk1
	7PJTq+jkkeiZhEJ9HmG44gEuG5vjy85uI5C1LGJ8+NAW6GF8/97ckbsKYjj3iqzccwLEhSXX2Di
	wM=
X-Received: by 2002:a05:600c:4e4e:b0:477:7725:c16a with SMTP id 5b1f17b1804b1-4801e30b74emr313302865e9.10.1769074886003;
        Thu, 22 Jan 2026 01:41:26 -0800 (PST)
Message-ID: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
Date: Thu, 22 Jan 2026 10:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] cpufreq: driver data
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 863BD64B11
X-Rspamd-Action: no action

Main goal being to eliminate the somewhat risky, as identified in earlier
discussion, use of per-CPU data indexed by struct cpufreq_policy's cpu
field.

1: eliminate cpufreq_drv_data[]
2: hwp: move driver data into policy
3: amd-cppc: move driver data into policy
4: amd-cppc: move epp_init into driver data
5: amd-cppc: move pxfreq_mhz into driver data

Jan

