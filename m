Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xB8jFUT9RWoDHgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 07:55:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07186F3A59
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 07:55:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VenJxO7y;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351187.1608422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfANH-0000V0-Af; Thu, 02 Jul 2026 05:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351187.1608422; Thu, 02 Jul 2026 05:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfANH-0000U1-7N; Thu, 02 Jul 2026 05:54:11 +0000
Received: by outflank-mailman (input) for mailman id 1351187;
 Thu, 02 Jul 2026 05:54:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfANF-0000Tr-Cn
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 05:54:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfANE-004TF7-2X
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 07:54:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a45fcde-5cb7-0a2a0a5109dd-0a2a4501b556-48
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 07:54:07 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a45fcff-400f-0a2a45010019-d155dd2ae9fc-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 07:54:07 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47721cd669cso254470f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 22:54:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dba3csm5702130f8f.3.2026.07.01.22.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 22:54:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1782971647; x=1783576447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QIM/eJO+4vUuJrCujFfM+G+/xQoMdtBlBmwgL/GpSq8=;
        b=VenJxO7ysHJy79oeHJ5AwtjqKROQPSh43czjcgLSs4A+xypyyUanagxD6ZEA8fLwBl
         jvSPqvdl9wuhd1d8LJqhc3uldZq/m1i4NSU0W0qblNUulP99lcrxMXudD9N8ZQgYTkak
         DmGNsXV+YghjjbbkjGc/guPFNTXk1hLV1FPit+KtONc5smNSbMNHPkUML+QlEc2Svtpv
         EPamPEOXsS5E9fQPSRji4oeY6g+VYrW9a/76M19+I41Y1IrIaJcDWZP6V4kQgYAxnOFZ
         3vkV/OwboGRQbHzc8uegSAg5WfLVgwlLTCT2aeZ/BQCnunqANNwvWtTrsn+QOqLg1hH7
         QulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782971647; x=1783576447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIM/eJO+4vUuJrCujFfM+G+/xQoMdtBlBmwgL/GpSq8=;
        b=LtyQm4nivtSzgLXeskgf0J/uyGE0/MHiueYiBlAZN+EaZ0xEjIjpJ45StNuWWkoLBI
         8dW2JNdsV+EwvojP0+2l+2BpOE5jtNTQmyjBuIQI65wjaq74igE9LikdxvxIb+TmPwcP
         BfhosDv6rp6NOxcEV20FrZ5ojosgsly8XVJ44xlpWupLXfF1mfPWHl793UxkBep4FU8F
         euT3ItcUY1MLue0BU6K+UV+XkNjdZeJ0KRLcQhb+EeYhw8Q5dOLcggDPjAVgPrxvcP2T
         yCOGf4dNQMbrj+SNOmAZtS/fv5JzQRbXdPzQcdQBlshuV4BaPVTm8T+gmdDqmTgaI6iJ
         uYoA==
X-Forwarded-Encrypted: i=1; AHgh+RoZxKWbFr+8MN1Om5R8+PVBOznHfpbRgkSVLFGQeODCESu3EryjFafV3ZSPgQT/3Fu0D02Bwr6Z0gU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVoghudQp5FIWyPNXwowc0/GT+ABgzGkz37woFpDSa86NbOSpr
	in6NSxyUeLHVvTm62N7MOixeuGv+Z2zX1I+uGktISUdDhsM18VzFAsWjdVMJMcyYBw==
X-Gm-Gg: AfdE7cl3IKeuntPadU3H7lrfncZ5/DIiViDrESDpNdv9iFmRJkF6xMtWNLhTpf+sXO6
	Onmik6GUCa0WPPuC8i3ybbjhkzNAQmpU6tl+f8r0UsB8Tze3UaeDicLiVNpv3iXtygzGbGHZ4l7
	WN49N0kl2+JCAgsNh1Nr+bzRc6ZSDBzeV+u882zSvMJAGXZCEJwqnWsJ+31RvlsfsqpMKVfLm2M
	8NRJYAcX57dgN9VKgDu8eoPkFlztBWC2sHI+2ht4FciOjQFqSlgyfO5++1ixah8omd9cc2ciHCN
	CmPaTGfkHDt/9UYSevHOWw8wloJxd5d67F/n19YcQmEG4pVIC7Qst8RLLoHyWJws37EhGM9f5yJ
	CFsjEpyKFLCfGYywliR2u1e6svbYo1xWfcEm25G+Y0Mifya00FJe7hk1E2iZXawMnESQh/st9xc
	Ca8YY5kP9xqp+C79x0duC453wUUX/O7wGB+efsFHnfOCU8k5hy9ty9xx/CIP5IYOahgra9/goDP
	2un
X-Received: by 2002:a5d:634e:0:b0:475:f0f0:9ecc with SMTP id ffacd0b85a97d-477b5d37ae9mr3638954f8f.55.1782971646961;
        Wed, 01 Jul 2026 22:54:06 -0700 (PDT)
Message-ID: <0c888832-9509-4e14-977c-ff1dc37768f3@suse.com>
Date: Thu, 2 Jul 2026 07:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Change XEN_DOMCTL_setvcpuaffinity interface
To: Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260701111606.4063972-1-jgross@suse.com>
 <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
 <d7da5a56-3d65-403c-9c3c-19e1566d2839@suse.com>
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
In-Reply-To: <d7da5a56-3d65-403c-9c3c-19e1566d2839@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1782971647-800EC1E0-D12F92E0/0/0
X-purgate-type: clean
X-purgate-size: 787
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:anthony.perard@vates.tech,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A07186F3A59

On 01.07.2026 17:34, Juergen Gross wrote:
> On 01.07.26 13:39, Jan Beulich wrote:
>> On 01.07.2026 13:16, Juergen Gross wrote:
>>> Today the XEN_DOMCTL_setvcpuaffinity hypercall will not only change the
>>> affinity settings of a vcpu, it will return the new effective settings,
>>> too.
>>>
>>> In case an error happens during this hypercall, the expectation of the
>>> caller is that the affinity of the vcpu didn't change. This isn't true,
>>> however, if passing the new effective affinity back to the user is
>>> failing.
>>
>> That'll be the caller's fault though. Any -EFAULT coming back are an
>> indication that the caller needs fixing.
> 
> The possible -ENOMEM isn't the callers fault, though.

Yet that'll happen ahead of any changes made, won't it?

Jan

