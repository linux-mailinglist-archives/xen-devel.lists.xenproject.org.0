Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE+vIESliWlU/wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:13:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13DF10D679
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225036.1531490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNKe-00027V-Q9; Mon, 09 Feb 2026 09:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225036.1531490; Mon, 09 Feb 2026 09:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNKe-00025z-NH; Mon, 09 Feb 2026 09:13:24 +0000
Received: by outflank-mailman (input) for mailman id 1225036;
 Mon, 09 Feb 2026 09:13:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpNKe-00025s-0X
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:13:24 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 952c6cab-0597-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 10:13:22 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43591b55727so2348447f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 01:13:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629754c62sm23517408f8f.38.2026.02.09.01.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 01:13:21 -0800 (PST)
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
X-Inumbo-ID: 952c6cab-0597-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770628402; x=1771233202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vxcxOb4ZYN3LxUIRHDGKbNbm08O3LiJuVEv3H4iXmeA=;
        b=EOvaOJGpaj+xE67F3V/srzllcTwWEgzZqrw7O4UavTzAuEloBDPAuzQjCKBbEhVMqU
         GAuHEJis1LbRukn0/k8hLo3MWJY2VF6I8vf7pkRI9GvHEVE6NP4eflGFdITPXZOLFqms
         M7AWwXLOaIPss65/7Ur1Z8o/9LZ08X/oCpdx2l8paj195NsPebE+EuSLwU6wnlTe9mEt
         EUIzPjnDJ+SEXMi8m6OPtGNopgCz/1QFEhPC5eurHjP6ISl2p6ivgrxoESJ7ds2BDMVT
         T2GFtImVLxndM9QJxtmoZGnjmYR6BivZskVvQRUqIxqkpj7ok7xMm57YMebjGEK2lMBY
         7RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770628402; x=1771233202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxcxOb4ZYN3LxUIRHDGKbNbm08O3LiJuVEv3H4iXmeA=;
        b=QIYFhzVlCmkvHiLs7KuERmZ0le3m23dmwdCjQQST284YZ04FMWzrctq/3rlWvLlGag
         JbQDD63M/p1GFpFn6eN7iHy/wPS2XO6Gj6oaH2mXuu1+av/UmhXnP1ZWQ0lJOCZEitVg
         BBF2qjKmmlpPPj8d3WL1bBYklUeEynqGKTYkC88Z6kZ4jXKQ0SZPZZISwJ5kzVo0vK9C
         xeS8lvJJFDAh9LTw7x1X0HYHDcb9jDrLEBoECWwr3Sp3VyOAGRe4XYPcBtNjZpqHHVk+
         C6jc7VGtcyQpNop8MFEUgFdCk/nIzZL/OOl8Dx8AGEnUpnTb3X/KnYsu1lK/KjKJmgR4
         Ok8g==
X-Forwarded-Encrypted: i=1; AJvYcCXTazjT4U6bwqVNCv/OADh2w9d7hdDSK1VbsE4Xgca5Yq1cyo5xJauM7LSniE7ibezaQCRd4ca0lIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUvOTFqNqcSmuYdiIoFpImRqTb2ysjpvkSzLYXL0aKSQZdHwgP
	XFwBgdzOoDvq8rQBcHNBZJjQ0L/Je2HsXP0itstsvz6okrwPThWaDUX1dXShnkFZNQ==
X-Gm-Gg: AZuq6aKL3b5/YIq4z0eCrjUqg0hSss+x92TU3eWkKPCldhqGbusaiA9wd/eUaP13CD+
	r/mSyujGS4k0K55DYWeYRVyJBk6Y4ABUCekp/cYq78GPgFl2hdAhCP2XwVbhSGseHEpwKGcphTk
	td8dm2syrPyEQuIxGVLXtao1f8OiHgH/FtCPTuzUT1VXHeEfcWnBWsJxpegsmfts4MPmNAykEUR
	b5sBZe/tPGL/jmtRXPG7oOC3q1PIvYFRtgndc1VEDUZ8z75pq17iokReA3DnzEKEWbMbtTBOhuq
	EHfaNLfQhOpAJrZsbwbKWppaGP/VZ9jzAGn1WpbI6vL2lY76ZmJiIVrrVBeQsfmQ7bR/7r/nx3N
	ROYJLTxm0FNrJ/xfASI0Mpyl/nzUW0Eqs6COfBjkLtf3gZm6o7j0NiHoGiesDTOJrLOvcLWdLDX
	ce2lnjnTiqLne+GOqg93CdaPNa3/CezEAtuqDj5uUjJL06JrpZ+1mBIkMPeZp7NeRmt7pePtoXu
	yU=
X-Received: by 2002:a05:6000:402b:b0:435:a815:dd93 with SMTP id ffacd0b85a97d-4362938617bmr15056339f8f.35.1770628402114;
        Mon, 09 Feb 2026 01:13:22 -0800 (PST)
Message-ID: <82c06e52-1db0-46e5-be9f-7ca0360ffc70@suse.com>
Date: Mon, 9 Feb 2026 10:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/5] xen: change VIRQ_CONSOLE to VIRQ_DOMAIN to allow
 non-hwdom binding
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: grygorii_strashko@epam.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-2-stefano.stabellini@amd.com>
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
In-Reply-To: <20260204233712.3396752-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E13DF10D679
X-Rspamd-Action: no action

On 05.02.2026 00:37, Stefano Stabellini wrote:
> Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
> global to VIRQ_DOMAIN to allow other domains to bind to it.
> 
> Note that Linux silently falls back to polling when binding fails, which
> masks the issue.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Technically this is an ABI change, and hence I'm uncertain it can go without
that aspect being at least mentioned, perhaps even its implications properly
discussed.

Jan

