Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D9iOLnzjWlw8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:37:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5045812F05F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:37:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229345.1535313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYkk-0001qh-7P; Thu, 12 Feb 2026 15:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229345.1535313; Thu, 12 Feb 2026 15:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYkk-0001oI-3W; Thu, 12 Feb 2026 15:37:14 +0000
Received: by outflank-mailman (input) for mailman id 1229345;
 Thu, 12 Feb 2026 15:37:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqYki-0001oA-QW
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:37:12 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b281e31e-0828-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 16:37:11 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso3314835e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 07:37:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd34sm213405025e9.7.2026.02.12.07.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 07:37:10 -0800 (PST)
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
X-Inumbo-ID: b281e31e-0828-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770910631; x=1771515431; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lWYbQ/yqgZFytVfQ7qtrWV2fwXV/DRrCkwiuNx0fBaM=;
        b=Gj0hne20+RH3Hd9YNQin457hfqY8Ku1JuZTJMfJh0lBuC1BfASpkrtvyIRq5RvoaOc
         hDPr9jVGavtI8UWsDosTAV6mshlgCkIeFzWGJ2Ebjusqt3qQhvx3NM99WRbVbSK89tXa
         KTONyfgw9USffGuTsZKYgIXdUG+wa8JPCYkaXPwTW1MbbbHxHvPZlL4RbBz/lUDg4ZEc
         VBG2y0jIjb5l+XzL3tIWGhaiw7gDfSty5nEQ1wij1tQaOyJhO91FDYj5oEfU/9VbM/6G
         qwAhwK1L9tiBULQX0szZSARnoW3DayDQxSUbNnyxBc7h6pn33qK1/kJc5TphzBhRS11J
         nEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770910631; x=1771515431;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWYbQ/yqgZFytVfQ7qtrWV2fwXV/DRrCkwiuNx0fBaM=;
        b=A2/MPk91s0PgUsxKvrKKyO9sP3rRuzBo7g8xAdSwfof9cw8yIlpEivQo+iz7b93i3o
         +Igmqhw3Bii562gtAMRfDLNg1q/7CZn6uHdfdLaPPgkIw8WU482joVkJeyUt3zS5UUwg
         vpKFmALTMQpw/vLeMdNAYQqINVie/xu2A/BT4zwrx7Ixt6FBxy//edn5fLMMRg+fEAzm
         07HNcGHFJT+gKDt74Kr3uwSXJCdpYC60IdZHODdTGrMkqHRhvoeqBmjpzAmWcWH2Whbe
         WCk34Bj/C2y0U1g3Zx6VDRwdWZ5ZFSHf8nPCZvD1CBjUvxKOEbDoeFEw4H0Txk4hFUxY
         ahiw==
X-Forwarded-Encrypted: i=1; AJvYcCUmaV58dTgfJ/CYXupkrzNmnp3mmuKD0F/Od62ZTtfJEkTdMnSiaYzB6Fsjtnsa2RlsiACDMZqf/gA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoRjxaRraNWeqRmTsXxBVIjiFsKKEG40v8LBWCqLvAaAwVjyo4
	Zm1nJPmFpbQ8p2yrQ+Dwawn4qeuO3o+vvfPEeGKAfMMot6lhVjwpRyyhegPnY27Jww==
X-Gm-Gg: AZuq6aLbAvXDURXEQmoZghRm/pgJtmNTDH5Tl++6a2HEgxh9ZbmOdU9vGATrW0EVyHH
	co/AuExQMIyn1kQrMFixBk9RC1jFkJk5CWeWyxqPX+7szcXWAu1KVwdFj9WgwgecicUApOpUahh
	5cX+BN+xvkhJ9Bgah03keTfKDqdB5xUVTbvOVOcJ4ltZ0f+udh6jCohNNB+KHpOBjQS93yLbPfE
	xFsqUa18QJ7M3Z9JgwUNw1Er0gznSvhbbuw4xQYSTrCm0g4NZIt7S+/CsB+4/uQnKKQpeOGmtxR
	JMqN1PhSFJj9uhykFWMxmLoHBPpJxPzXmo36EhQ0KlkJpH76QEJHfa5I7B+k1wh/TsXjQWfjWy4
	FV7WmMjJb3oiqY317IBPbNuiMMy6irCR3EHbvhghNbR6/das7upwQ4ViPGrXQOaDpxFxwHpsw73
	Kx63Qe4fUScgaXYc7MqVMJ+Tt4gw16/mk8AW5QOMVdPN9PsZkdd/f7f934u/FZLIky9YtQHs+pB
	o6Yp8wIMYwfddVHQc8rpdLZoA==
X-Received: by 2002:a05:600c:8b2f:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-4836570e519mr47787435e9.24.1770910630703;
        Thu, 12 Feb 2026 07:37:10 -0800 (PST)
Message-ID: <534c2e55-e5ec-4045-b08e-26916a18366e@suse.com>
Date: Thu, 12 Feb 2026 16:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] xen/tools: remove usages of `stat -c` in
 check-endbr.sh
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20260212144618.43200-1-roger.pau@citrix.com>
 <20260212144618.43200-3-roger.pau@citrix.com>
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
In-Reply-To: <20260212144618.43200-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5045812F05F
X-Rspamd-Action: no action

On 12.02.2026 15:46, Roger Pau Monne wrote:
> The `-c` option to stat is not POSIX compatible, and hence prevents the
> check-endbr.sh script from running reliably.
> 
> The first instance of `stat -c` can be removed by fetching the section size
> from the output of objdump itself, which the script already parses to get
> the VMA values.
> 
> The other two instances can be replaced by counting the lines in the
> respective files.  Those files contain list of addresses, so the size in
> bytes is not strictly needed, we can count the number of lines instead.
> 
> Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


