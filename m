Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM+yI3qJwmkfewQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:54:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03190308BE0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260766.1553971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51Gj-0004pk-SK; Tue, 24 Mar 2026 12:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260766.1553971; Tue, 24 Mar 2026 12:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51Gj-0004nI-P7; Tue, 24 Mar 2026 12:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1260766;
 Tue, 24 Mar 2026 12:54:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w51Gi-0004nC-Es
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:54:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w51Gh-00CfqM-R3
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:53:59 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c28961-e002-0a2a0a5209dd-0a2a45099936-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:53:59 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c28967-e484-0a2a45090019-d1558035ec7f-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:53:59 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-486507134e4so15393685e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:53:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b647120a1sm39593421f8f.30.2026.03.24.05.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 05:53:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1774356839; x=1774961639; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1kUb3qpcoojKN/ymsVn7QoE7+RGUkdewFnZZ6zFhVCI=;
        b=NhUwolTA3JTHki/uERRi265iPQBdER8Mw2JCh3y7ERo5OFVQexz28gQfkfv+5MygXg
         kaSFez1xGVl4keXU3cZzS8amnExwHbZkXGm/krI9eEytw8wF9C+0gUNbuWXf97FL8fTT
         0VkoiQBz4k3exGMo5ZgjlLoxD1hHMEAuMGLpTt+EuJar/XQOKU7asbN8MaZ/jz5xOCqb
         lTb+20mb0qlfYDDQfWhYVr+IrybBrTwdCzjJr4lfNdoUaNEJ0+vmzf2tNF6LA+paXqR8
         xnD9SCIDBm80Gl30rRd3sDSKskvOtjD1v/YB6KHQ8k3ZgOnNZqkHlS+k7LYUjCZB3eH4
         pHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774356839; x=1774961639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kUb3qpcoojKN/ymsVn7QoE7+RGUkdewFnZZ6zFhVCI=;
        b=BzkKRF9676vHYKxiQAGu/vCn7/XyTRe93VWxXnhEJdTVw2uskFOIY6W8HMbqPzkGad
         Qbg1WKhN6b1/tcJ/2XRMARIG0lClclLieL1lkEBQK+VvKhY84+79+6OEqERe/l2czK8E
         ItnnsYxkK9u+REvYikSh8Z8CJrUDVlKvkw7hKng1wQNB0hhwZ3YzMe5K0gwCk5gDzvx6
         bNVuSuOdZRA8U+FpZ6D84SKvLuia8C6zxBkr7pNln/M1+Fq8FQp2zpYYa8GHLNGvm5Zp
         97mNr7l15UK+WhreAihhMs8naLRXzwX1QMYOoyI5LHilxloZY2nqx0O927ENEJf8VYJ5
         Zw1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBlENDxqHtUHeZCrsw/KHc/z6gGkmEQ7JZZFmSyMe5o4mPKAgsVV/ddLjln96wweRGBYCggIrWA5M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuAmxTEd05eG7iolK7E8ZG0oII+mYzGIPfQaBAi0iiE8+e6/v4
	N/XIMfdDD4DoWdQdtcddhsbl8bXhxMl10ALH5yy1eH0m2WU+jS7rhbMnUFv6O6b+IA==
X-Gm-Gg: ATEYQzyj8XfoDphl/QMrID72nuhNUML/Lbe19QtrJQAstIqAopzjrIvBhejCHElDav9
	xKFGAUu0qIJHGT6WMywez+IayMRLlboIHlhnO1gWAt7JrC6CYoDXL9IId73UTc3wKkuoc00UBnY
	1gYxbk4240P9XEm7ro1dN8T8NP2K6GAzrKXcJ4SA7UqeAXYC1alYIR1MhnyBun8r5p2B/nt7j6G
	kMnt4/bWWXz3UWLhKyNgjMFduuSiZZdG0dxjbypTYQBkf26HxdXgrUcVQyTrduKYRbpVhwiTe/q
	cYxHgaDgE9epEKRUCIaWBDHJypo8sW/zl7f0UbSl/AZPJrTIwz6SlxPwWZGEi0Bs+wWzo7ZiT8E
	lQy0gHasGRHBhjXC9gLkDWpUCyHoeN62dh1R1vo7795xT/tuX6THajtlHT1XonJxxb+kvcWQScu
	0leDZoNqOd3MP1XHj6KDKiCqZ17u3g4fjJQtgs4qaf1HbWwnxcUvqnX8A2poWxBs/cuccEpGs6W
	UBTwknYOoa6C3U=
X-Received: by 2002:a05:600c:8215:b0:485:4388:348b with SMTP id 5b1f17b1804b1-486feb5a3camr213688305e9.0.1774356839052;
        Tue, 24 Mar 2026 05:53:59 -0700 (PDT)
Message-ID: <3882d56e-def9-4ff5-9014-f72e80c7a1c8@suse.com>
Date: Tue, 24 Mar 2026 13:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1774353053.git.mykola_kvach@epam.com>
 <581179709977ce4cebb22597411048dc93b11167.1774353053.git.mykola_kvach@epam.com>
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
In-Reply-To: <581179709977ce4cebb22597411048dc93b11167.1774353053.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1774356839-5B4A7A73-0109133C/0/0
X-purgate-type: clean
X-purgate-size: 478
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 03190308BE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 13:26, Mykola Kvach wrote:
> --- /dev/null
> +++ b/xen/include/xen/suspend.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_SUSPEND_H
> +#define XEN_SUSPEND_H
> +
> +#if __has_include(<asm/suspend.h>)
> +#include <asm/suspend.h>
> +#else
> +static inline void arch_domain_resume(struct domain *d)
> +{
> +    (void)d;

What use is this? None of our stubs does anything like that without a clear
need.

Jan

