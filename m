Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBIsH0uX4GlMkAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:01:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62940B438
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283056.1565353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHeS-0004Cn-Q2; Thu, 16 Apr 2026 08:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283056.1565353; Thu, 16 Apr 2026 08:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHeS-0004A7-NC; Thu, 16 Apr 2026 08:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1283056;
 Thu, 16 Apr 2026 08:00:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDHeQ-0004A1-Hx
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:00:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDHeP-008lFI-E8
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 10:00:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e09723-2eae-0a2a0a5409dd-0a2a450581bc-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:00:37 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e09725-aaa8-0a2a45050019-d155dd2adccd-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:00:37 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43cfe71e5d3so5942623f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 01:00:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3d5c8fsm12169840f8f.19.2026.04.16.01.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 01:00:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1776326437; x=1776931237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XKZwicmqb2cHpd/GbOmMhjuShjCWstgKPs70YGlsOyY=;
        b=PsiH7BSAfcFn2hbqfCUVKSeF5HbmqaK7qq8Cno9a/kTjtrTBdImk8Gc5oCtghRezRL
         RGvftkMJoorQGuZwo0749KxI5E/NjVrA5V+UujwQ8A+lfFKpNIqhjs2e4Mn1JvzGc3Xn
         9MBkooRCb3SNf9IAy+XKfJazXpevDcsWmfqnP7L6wLNXOyRZdIcfWVJK1bdVjigVlCbu
         jbpEeGCyByT/tanWzrBSgALw4n/DCh+XUeoiDtA8XHpzcQgS2zwIwrFWE7RuOHuTarZi
         nKyLQgm3KDFA469MI1+7PXDsjnvrgDkysg3aUbXtiCQjUm/YGBWQdi1K00QRTth3zP4U
         dbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776326437; x=1776931237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKZwicmqb2cHpd/GbOmMhjuShjCWstgKPs70YGlsOyY=;
        b=WAn94WJWmBIPZqJvDoVRdmag7azWe/05294Jd1Sf0GHey+WCw1dkGydumEhZu+ePnl
         2k2R78kbCpxQ/bVAaLY6KUrJkZqc7xIILlUArrBgnTPF2K2K9rKF5uQGfy+9y2mFTPTK
         c6o/Z2mhpKDdRFMdO5lWrQO3D9XhlVyPqR8aAlqK6DuqdsmX8rlYLu0sk3U3EvsYnyfP
         OfFFxaXLO39bS8EwokrtYxB1KMlJrACkiHZ1Jpqy2iX7qYZqzv8SyG0ro9/CwW+vwWMU
         jp/oMlLFD/sfD34eDJQW6g5zd5BxppkqV3phtMfKTX6VYLpFDX4Dq8u9sKREF2WBogcY
         VB3w==
X-Forwarded-Encrypted: i=1; AFNElJ/AzvKtmAuEttyyRkLATh5GImCtz0d18p8mdwkMnB4Ek/nZyOjS1zKSgWGLUTojX9OF7l7sTopE9x0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxX+uUDBuRUXx5iEjQtzZVOvOlGbH3rAeaxsIslomojYRYm7Or4
	KZjdoraaBu6PSHb9+PYfHMzshHjaHEa3ZAwbBksCzPfsKpUox0/K+XrBlszdzahbXw==
X-Gm-Gg: AeBDietYSMF6YAO1ko5BYTwwc1j6oPDys1JAZ8dvMdcGdFL5MviTNZf4Cy3AS5K32lX
	EBwdDDXAxsKhNtB+4Rlr8ORvZYE+vFdBA+UDTxPgYc/kPb7i9d/n5+a1M3Zz/erl5+dBf5x6vjv
	jqtphLhZpoNmHLspHlJinQiRwN9HHfulQ1LK8g1ylIh+kq+JhV61nAzaamgQTOhMYFgyTTFfr+L
	BdWr/UzbpUAbPq4v1Z5HjehBRJLqWY0+/td42CJgbCRNdjQ3av7RfNBSOgmb2g3NXtjFEZcpvPg
	Ss8HYKLw7+ik/c4E+T7x/8VeEAXBgmDC+1wYxQQ2HwwDDf5WQ4A3bbTYpSDlGdaIGKzyujdtNkb
	/uL1dlfWS4feDl2ZWraDpHviJRT3nQ1dppvBWhXlkSYjHzS7Qdl08BBzBJZdDc0ZPCVLRkvltFq
	XV5YYTNQo8RRecvboK9hlqyzi3ag2Z/sq6t2JRWzGNRXUIwai9wEBouiCKRbzOWamPsA4s3Th3n
	A4GiBY+spgA/Ze4pcm7NzP2fg==
X-Received: by 2002:a05:6000:1a8d:b0:43d:1bf6:30f3 with SMTP id ffacd0b85a97d-43d6424c4f6mr36834838f8f.14.1776326435656;
        Thu, 16 Apr 2026 01:00:35 -0700 (PDT)
Message-ID: <4347d816-f838-443c-aaed-5e0bf615bbf9@suse.com>
Date: Thu, 16 Apr 2026 10:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix scheduler callback verification on init
To: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Cc: volodymyr_babchuk@epam.com, Ruslan_Ruslichenko@epam.com,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260410164039.1000284-1-ruslichenko.r@gmail.com>
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
In-Reply-To: <20260410164039.1000284-1-ruslichenko.r@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776326437-E23D8443-AB5D4AF8/0/0
X-purgate-type: clean
X-purgate-size: 1001
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruslichenko.r@gmail.com,m:volodymyr_babchuk@epam.com,m:Ruslan_Ruslichenko@epam.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:ruslichenkor@gmail.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[ruslan_ruslichenko.epam.com:query timed out];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email]
X-Rspamd-Queue-Id: 0A62940B438
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 18:40, Ruslan Ruslichenko wrote:
> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> 
> During core scheduler initialization, each registered scheduler
> is sanity tested in two steps:
> 
> - it must provide required callbacks (e.g. init, do_schedule).
> - if global_init callback is present, it must succeed.
> 
> If any of the steps fail, scheduler entry is cleared in global
> 'schedulers' array.
> 
> However, in the current implementation, if verification fails during
> the first step, the scheduler entry is cleared but verification
> sequence is not interrupted. This lead to NULL pointer dereference
> when subsequent required callbacks verified, and possible during
> the second step.
> 
> The patch fixes the crashes by adding check inside sched_test_func
> macro and skipping the call to a global_init if first step did not pass.
> 
> Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

This likely also wants a Fixes: tag.

Jan

