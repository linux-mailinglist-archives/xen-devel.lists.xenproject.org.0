Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDlsHvrdeGn7tgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:47:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3074597092
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215003.1525257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklHM-0002Bw-TT; Tue, 27 Jan 2026 15:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215003.1525257; Tue, 27 Jan 2026 15:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklHM-00029Y-Qt; Tue, 27 Jan 2026 15:46:56 +0000
Received: by outflank-mailman (input) for mailman id 1215003;
 Tue, 27 Jan 2026 15:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vklHL-00029S-DE
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:46:55 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6753578b-fb97-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 16:46:54 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47ee9817a35so46085175e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 07:46:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cddffc0sm1389375e9.5.2026.01.27.07.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 07:46:53 -0800 (PST)
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
X-Inumbo-ID: 6753578b-fb97-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769528814; x=1770133614; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iTbCjvs2wDEsCHTImc0dEch9VLZ/c05EUGj1o2/zFs4=;
        b=O65WeHVHvk0XPbMOJKfBz7qzM4+CirTg2Vy4pyIcTOkd5oDuM1vW9HIXe4r1iGZQOm
         9PX8gu5lTAzcFE6vzXdFeXP2sEWJoX/xx0dLEJsFSCfiKhsNK5DFQ/mv7NCFyYBhO2cv
         3zb6ZiGqvBCNPTBf9C3EO/uj63xh7rMZ677DRceINrG/3nknHYYv/F81GXeVKC6KaXXG
         ZpYbdydQG8xFGlUdDAazoI7H4DRFFhTniIOry/V2xsTwJ4iqBYkCvspqWS5K245fXC/M
         NxNfNGjtUbZalKdhpEhrdB+szBZvFv2jrWwZifC7a+MFYj4xhzFxEGddHGeT6Zar26bv
         x2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528814; x=1770133614;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTbCjvs2wDEsCHTImc0dEch9VLZ/c05EUGj1o2/zFs4=;
        b=mFebzaLDGGiGZ1I11hAME4nk3YZ2tnPREyhVLjNcRZ45bQjBmvhjRO5f9CpMX4wLoJ
         JbR2rkWnvJIqRWo4lFiE3kN4g4MU16uOArCdXoDerx8aiIH6ctg894MMcf9WCIYU2Qsv
         qtqjN28NeQRW7dOaL1yj0q8XN9g7nKQjse7tSi+hN4o6M2tf528vdTpaBLwjaK2+yngT
         il9/pgNmuJYvFB9KLzq5Cn0SWHkKRD6lQZ2WzrWot2BChSp6rhx5if51rPqfeiIGcJm3
         rv/rquQ26WEtFfWpF5Gks7GPID2jIBW3yDR7IcfrTjS4bArssLNDmoPHk1bRW2v7MbvQ
         xeBA==
X-Forwarded-Encrypted: i=1; AJvYcCUqPtOkxzf/yyfrqOYY4sdlH7UWoqHwI4L7Mkf0CgTMcs6LRNKKHGVlahy+EsQxfkQIGMSLtYQR810=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi0ULZBYIzPqdXsJXfn7zuf3yoYYp7nXBZEmy6CZiE6Si+zRCE
	iZQB9Z9uEUyOdQ9aoC/RKgHt80/z+sagjG3aw7xfxxH2eCyuVhE6z0uSAldAPTnqLg==
X-Gm-Gg: AZuq6aJSdrMwdlY/bIwzuISKQxwFGPlHvJtUqdlmhCjR7BrXzeskz5Rjm3vVfhn5i4z
	4QFuwLHTDMO1Nas8dPmae/iUNvT+ZQUY/2zccSLd/0G0dlTlc+IVYGBcEspORaW31GbdhOV1cgY
	EBsD455BWQ9L4K+Xj6bdz4FI4x0pN7rv/gOum8ea1RffnymKYp/b1hfOvxaZmXuKRyoQtnvtEzd
	ui+e9Tdts5NgEF1GShtjIn1JZNzGGOGk2oTkGYF+tkP9eQ0gjIf5uflztLiyZiyTwoDkUWvoQ6b
	MkvVJyxdc4rQHL8K6MUkVq6ZSYbubRP3H9spimtFW5FNqYlXPHQ+QJEETVLTbtihNIlj9yLJPXV
	3CnTdsfuIAjk+S4LBZz2uFDNdLo7eRR0mhwEjcZFmOBwsLHBxzZskomQTTYNQpEd6mYBc26Yosi
	OEVVvFqLFgORPSXIa0NAT0E7BNSWFay1BgG5L1LaJ8rbJ0AuSCjm4avNls4UKEDUCem1YNcdEdG
	bo=
X-Received: by 2002:a05:600c:3b96:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-48069c353ffmr37100215e9.15.1769528813739;
        Tue, 27 Jan 2026 07:46:53 -0800 (PST)
Message-ID: <8ca9d75b-2812-41a0-b62a-7b8e3260bf07@suse.com>
Date: Tue, 27 Jan 2026 16:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] x86/cpu: Drop default_init() and default_cpu
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-15-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-15-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3074597092
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> While the comment is reasonable, clearing SEP as the only action for an
> unknown CPU is useless.  Drop the infrastructure.

Fair enough.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

