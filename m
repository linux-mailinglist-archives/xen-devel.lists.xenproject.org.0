Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bXVQMZS/KmqAwAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:00:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFB3672850
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:00:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=gg5yt6IP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335569.1597757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXfx0-0005gF-5j; Thu, 11 Jun 2026 14:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335569.1597757; Thu, 11 Jun 2026 14:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXfx0-0005bn-2X; Thu, 11 Jun 2026 14:00:06 +0000
Received: by outflank-mailman (input) for mailman id 1335569;
 Thu, 11 Jun 2026 14:00:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXfwy-0005Dw-2B
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:00:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXfwx-006jA1-75
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:00:03 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2abf53-2eae-0a2a0a5409dd-0a2a450c9314-26
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:00:02 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2abf62-62f1-0a2a450c0019-d1558035b9f4-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:00:02 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490b915ded5so71721875e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 07:00:02 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c7ea21sm69275655e9.1.2026.06.11.07.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 07:00:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1781186402; x=1781791202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gAKTHP2t7nuqCN93yJrgDm27S1CUkTxm064xhGemVZE=;
        b=gg5yt6IPzoEJXh9J1fpS6KhpJAp7hZPtrgKY6N4lS3+dFzTpqZeMA/+hTq6K8deNAp
         8Edk4h1QbZ5ubGS2Y75X4bAKaJ2oH8LkgUZzwUEvm0Aj7vaaBAaQNskTitwH9xq2meXW
         8j8W3IfXl1ajJzHmkkAHAHSsbCHalSQ5Sqxt9f8AqmauXuGbc1fyNxn/aw9zsRNnnz9w
         Ij5ARpaT4vptikyNrbZSBSaMAv/SY3QzpSqur9VOwc1osVHIU3qyaqjdpu6mTgiV5see
         GBDZrk9Xog6vy/6BTGTbEshdWDtkn2RV4ORI/W6qdJ0MuzUONCgF/nO40QoH67RF0Uyd
         9RSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186402; x=1781791202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAKTHP2t7nuqCN93yJrgDm27S1CUkTxm064xhGemVZE=;
        b=A9ZKdmnk0dri7oEqqo8vKLBGuOBjbERLYMHMZJ6ZNsRrVZMbhbB8/2XtP3vqDDeY8U
         n/ElkD11IFsOI4oCZ2JUVFicfXKTdG+K81+Y2HKToPoRlse4Azj2Yw+erjIqHrnplKRl
         Vv5MsQ6FgYdWAm+J/l/IcG9mYHpto2X+nA1Lshq8OchkPUPcvCRql2fIGAc4RsfQuynx
         6mI7F6XZdXJxr4nQSH1WPB1z0ahLNwcInMNFCGMstQBVgG4aV//ehB0ZOeMMRmIbrSap
         OGgkqGJW7GX8d1VQsn/vDYQToBhj8Znl9wEkV0nriBlu4CUJMf8tIDV2nwYVe75mKJc+
         jf1A==
X-Forwarded-Encrypted: i=1; AFNElJ9as/3DtWOAVuFhuTRpZfk6AabAQUBq6uDcegZg4Dab9imJnHZfqhRKBS73/U+2IDuuOQZhjfotsAk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAt/0wRJHoc6RqAtp+7bK+9oBdnWc8sIKdLfGhuBHsrKCBnM6k
	DxwkNLEGgq0NkekXFHh62oqZR5j7D2GswCoBL1YzAv1ZcmZv3INQ8mDntCmap1AmPw==
X-Gm-Gg: Acq92OG/B5FtSctdq1658Kv8IzDH6vpteJX1627AbMrQ9nr7w3S/4Q6Yux/yUu+bWmW
	+5yZpvyvbXn+YrvUIwJefqxuS6lZEo/K2WtPJmCjNtaEzlKABlzs28f0Z/3jlwKp46NGZBHM18v
	fn7AYmiXHf58xl/nJ6XkyW0gs4gLXE3D7a96/gpO7WhJh++bmxqWGRk6su7q4HmEWGk5oZvKhWa
	r+51TG3QVgoRBkfPWckItPS83Vre1loJOGa40uIScyElyf1jiLDhoy0J2HRjzTDKVLcRyIJVV0f
	UChz5Hrv7t08v1+rwbyuAVVJYobgsmqJTF28Mt2bYNnx6OvSwr4IfSKjVdZTyHdkarwIKUtBoyI
	rX0FP+s9gc18JRy/l+cg84c459EKxkPFtF7DOmBMyxhKFi5Fp1n85oH9hz3Izs0CMFydSGOMhNQ
	t1fN4De7ZBAVQFf4RSmTPLmxHbpxLnhuQQ07yA1+piFS7hrhwjiHaEgRuux4sBG2jxyIonfqmM9
	f4i/f6quDmnMczXIORhgKYlCuNIoFp2NX7DNTIQ5+fLi9HLrhNEOqXwhpI0peczXJxgdPSPIuFp
	09dJVA==
X-Received: by 2002:a05:600c:8585:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490e562a82emr38806375e9.16.1781186402446;
        Thu, 11 Jun 2026 07:00:02 -0700 (PDT)
Message-ID: <a0838cac-d75b-40ba-a2c7-bc099e817535@suse.com>
Date: Thu, 11 Jun 2026 16:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] ns16550: add support for WCH CH382 and ASIX
 AX99100
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20260610054030.1624662-1-Zhao.Jiaqing@amd.com>
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
In-Reply-To: <20260610054030.1624662-1-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1781186402-F447DCF5-DEEC04AC/0/0
X-purgate-type: clean
X-purgate-size: 729
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Zhao.Jiaqing@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[lists.xenproject.org:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich@suse.com:query timed out,xen-devel-bounces@lists.xenproject.org:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DFB3672850

On 10.06.2026 07:40, Jiaqing Zhao wrote:
> This series adds ns16550 support for two PCIe serial adapters found on
> market:
> 
>  - WCH (Nanjing Qinheng Microelectronics) CH382, available as
>    CH382 2S [1c00:3253] and CH382 2S1P [1c00:3250].
>  - ASIX AX99100 PCIe to Multi-I/O Controller [125b:9910].
> 
> Both chips expose 16550-compatible UARTs through PCI I/O BAR0 and
> work with the existing ns16550 driver once a matching device table
> entry and parameter set are added.
> 
> v6:
>  - Add Reviewed-by from Denis and Acked-by from Jan.

In reply to the v4 cover letter I already said that there is no need to
re-submit just for adding tags. Now you have again needlessly increased
mail volume.

Jan

