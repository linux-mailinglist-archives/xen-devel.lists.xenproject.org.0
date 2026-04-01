Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEFJOGsszWn7aQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:32:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C337C2EF
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270448.1559114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wbs-0004Be-I1; Wed, 01 Apr 2026 14:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270448.1559114; Wed, 01 Apr 2026 14:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wbs-00049C-ER; Wed, 01 Apr 2026 14:31:56 +0000
Received: by outflank-mailman (input) for mailman id 1270448;
 Wed, 01 Apr 2026 14:31:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7wbr-000496-AW
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:31:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wbq-001ohe-Ms
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:31:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2c53-5cb7-0a2a0a5109dd-0a2a450bb306-28
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:31:54 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2c5a-bca8-0a2a450b0019-d1558034cc53-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:31:54 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso84709755e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:31:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f1esm293360f8f.2.2026.04.01.07.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:31:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1775053914; x=1775658714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o1XKewLK3LBaB9H3KEKckYzFxCDadb3kNKtbvgmDaLs=;
        b=VMGlTpbCGOw2rGtbGL/YHle+P4QuSeXtroR4twXHr8sw4RCpEXw+hXDE1839cU6Key
         qnlCKsHW+iwUPWr0tvoZlZupiEhaRMDYpQO/hl2PNbvPGgiBwRdUu456hImMVVR+uqYg
         OUsaWzgl0ViR66/DK7SWFiSX11Olb/coIZHpBs/45dUWE2OIpK1IC4tQYlPS5xBwwNVb
         sj5LYE/yUtuewPLBOnoAxufhgPDbIm1QwB3PiDa6qj4MnKW10Mg5GTBWNJ4y88Fw+m6C
         8R+4MSMT9tQ8Qkauju8B77yvr8+JTjlHp5kxGW0RLKUZvp7VIj8J2dfLOtdqgtuBIuvC
         xMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053914; x=1775658714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1XKewLK3LBaB9H3KEKckYzFxCDadb3kNKtbvgmDaLs=;
        b=LcZcG1r1BcLMu0BpOLAHHXBEL6Q1KKA8es+DigPCWe8aYOBlBg3wjAeYAcQOPz2tEJ
         cd9MjRfiYlpQcgmrCnXqKGLnSklvqXGYIzfQFbGeI2CFSMZSLNeQjczvCe78iZP58xxL
         yTj55TDBilp3FwmJcD0WmBnkbH1Tts3lrSWqjHAs6VBQcOKSGCxPV6B3VMY+YwvxjGcK
         4rFYTYoudehYVUEDwszhuWCZdlKFpHaAIZUyf5tXxfFuN2uSsY6bXvFS+Jq5Tq/axIDR
         yAmxP0eVREOE8vhqoCLVa/UoFmdV8JrJ5OVZNwhjeEeuYvvc4p7uRGY5Qi6NXc7P+oWD
         Vb/w==
X-Forwarded-Encrypted: i=1; AJvYcCVud7u0AFAIQ9eFzdti2zYTSWoMdYpUTCDJ49cNxyHAPE+XU3tXvbb2GGh1+RtyZxrL5tcTcQe1kOM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc4kUjvXuRzZKjaDsS7FCLJCLfdCd7Q6NRgGCVytsEFLEgJFEc
	CkGv2oF1w91HcUeKWaMVwis8jLn1yCHLVupmv+kttpvapjUE7f21VI4uwR/F0+IxQg==
X-Gm-Gg: ATEYQzxYolUGAExzXWLSh5F1l9M4Y9e9CDtomMwa24u9IC2DGWfzBgJIrdVmNLps4bt
	tB6x92fQgGDx7ZOQBbBJAcz2dutHtrnUWS52lTgi/nHOrfpgf76i5Cfw4OOpYXHZROGMwV8DCs0
	GJd816yljUj+OSyqHurGjheMLBsUk0m8PbrpYbmx9oNbaMgSCx+tPefDRsLUYR5JlvPrSV8L+Bh
	Uti4WPOZBLQrMX25VufpILYeQejeB/CLe2Rjzcympk+IoUTIwj60KMKcNFqpU6LpZUCW8dL7sja
	QNxdONgZNV2bRG7ATRXrssDpC6OFBlam8ugMBUTnGqnYodM8Nqdu2T5rgyS1VpKdBx3Fp+lITWf
	z3eyhHr+5752ckxCykLd83ebbPh01ak9zH7Hrhgms9EpSrbTxAVD5zfK2Sv7bnfmonTYhu5p5lf
	72WeMXN4W8qxZFLnsIPoywQdCmH2ngN5TzLYLcAZPqcTkQe3tLnbL6iL0H7P5VWu45NMxAuaeAw
	GFt6utLlbX5gAIVEN+hUI4CUg==
X-Received: by 2002:a05:600c:c04a:b0:485:3f72:324d with SMTP id 5b1f17b1804b1-4888358b94cmr48552075e9.14.1775053913874;
        Wed, 01 Apr 2026 07:31:53 -0700 (PDT)
Message-ID: <eb89d0de-bf24-47fb-888d-31efffd28a09@suse.com>
Date: Wed, 1 Apr 2026 16:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fcb3a80f93ab16b880ed31e82bc61180f3586efd.1775053454.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <fcb3a80f93ab16b880ed31e82bc61180f3586efd.1775053454.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775053914-17F462A1-59C74028/0/0
X-purgate-type: clean
X-purgate-size: 1102
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 513C337C2EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 16:28, Oleksii Moisieiev wrote:
> In RTDS, removing the last eligible pCPU can kill repl_timer.
> When a pCPU is later re-added, rt_switch_sched() reinitializes the
> timer object, but pending entries may already exist in replq.
> 
> Without re-arming from replq head, replenishment can remain inactive
> until some unrelated event programs the timer again. This may stall
> budget replenishment for non-extratime units.
> 
> Fix this by re-arming repl_timer in rt_switch_sched() immediately after
> init_timer() when replq is non-empty, using the earliest pending
> deadline.
> 
> This keeps behavior unchanged when replq is empty.
> 
> Add a lightweight regression script,
> test_rtds_repl_timer_rearm.sh, to verify source-level guards and model
> the expected re-arm decision logic.
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

What is this last (improperly separated from the S-o-b) paragraph about?
No ...

> ---
> 
>  xen/common/sched/rt.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

... new script is being introduced.

Jan

