Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EWIiGY4ERmqxHwsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 08:26:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE36F3CBB
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 08:26:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XiIL6OfS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351236.1608461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfAry-0007gJ-9R; Thu, 02 Jul 2026 06:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351236.1608461; Thu, 02 Jul 2026 06:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfAry-0007e2-6p; Thu, 02 Jul 2026 06:25:54 +0000
Received: by outflank-mailman (input) for mailman id 1351236;
 Thu, 02 Jul 2026 06:25:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfArw-0007dv-MU
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 06:25:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfArv-0069M8-Hz
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 08:25:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a460464-bab6-0a2a0a5309dd-0a2a450cb8d6-38
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 08:25:51 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a46046f-f399-0a2a450c0019-d155802dd8c0-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 08:25:51 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493b786d6c0so7052115e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:25:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c636cc08sm25751895e9.11.2026.07.01.23.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 23:25:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1782973551; x=1783578351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh+uU93M/cZqqz8CprtfE0r0tVxMNI51TmT2A6VaeTE=;
        b=XiIL6OfSjXukQabhXDIwPXUVFQP+EMETF04+uXOXG/jsm+RkNFVQDj0SH1M/HLmGs7
         U53xlo140dnbjFrGSBy1WJk6C/UziFHj4J6qTKaPaADh7JXG/NAdkfgqfPBWTwszDE7i
         WR7EiAyHefbVoDpwEq1dVmRvAPK2pisYjUbMSYR2rnpnwHSth1L0T/tFuGY7slf2QD7b
         Oapja6Jiog8QnvhIaUlwyZGQ+1x5j9TUO64UiqfF2Xs84tvkFQDeMtcbMuIyAMFTmsXb
         rskZam/5Y9wNCkIWurt2z8WoAxJNkZ3MFkcEkT0xMh6VuJBkq4yDwj1+ZkkDMLJonVbs
         mG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782973551; x=1783578351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh+uU93M/cZqqz8CprtfE0r0tVxMNI51TmT2A6VaeTE=;
        b=NsLScLieR6Vz4yAPPWtuHtXsUQDXyeJOkbehM5EDyTi0tEqyfEtfzXREo9yg6L8WpO
         2MEjrs+J+H4+h/vK+tkubm5XUcURrqKjnU4xu7jb/KUiQlATUloAEPJLDfNbBxidWbqQ
         iKzhX0RaysEW3mxMFhKpbqqX+R/6bKevd/RF6EsiZJ2h4jACJ0CDca357WLBDj0uKZPH
         HbdFX3cScIcCRBqw5gPf0SEtA0f5fa6tWPk9mAzaY6Pl0cgnPRh4XQIe3VoxoW27Fggh
         tzFAxmZxdPcfCVGkFDRi8Fv503xZOBAD9VR5UpX1J6yrA5tpWtTpxghWdSM/xyfXoBsS
         RCtQ==
X-Forwarded-Encrypted: i=1; AFNElJ81b6ThQhWBsXlBILlVMxpgMrm6vH8iCFEg5mgiIqLsK0qR3IpoukUmGaRouWpuTMX6Vj/isM1qoc0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFV2qBAt1kGd2ZZht0m57fZ2qfa0TSnF7nptToUORgPogWYBkw
	J0XraSpzUeF2g05hKLwRj3iKLuqvijpuTcUHXmVgs1swYaj1u2kwDV/L2qtHSvIvCQ==
X-Gm-Gg: AfdE7cnjHrc2qKg7fDQZPLmvcc/9rEjBrgbo0B91iaS8qzoR5qdUVNdk44lUVNLCUZU
	oB45F+W+w34GdUJKK7h57x9rwcF4OZiQ076jy3M/ZlHuN0wGpTC8aOdZQ2Tk5H9N8yKQfrLUOHZ
	pEqu+cUf7z91FHw+1Rxgcuhr2QVU/UdOUnaLBWGH6unqhb4cFeg1gYzGJ8ihQMHdS4tzNKC1HxZ
	omQ5dnF/IGowDJyvAAjGBp+yOHZ0HzgAWYcYS0LOgD1IqhHHCBaAeOXW5zK0Udfa07M7n/4ckHq
	L9LQgdR0dy+Hmtrb7ao68GGtCYeKuaY8DSvrsOHSayoqawz/0wN9GUYYOc5BuWSbF/O5Jg+nasK
	WVW2oSEeJ2vJFaikytwXl5yBZsKV81ONZkRCxfe3ONddF4ku17/B1EpHf1IQYInURTfQjTP5tly
	5d3UqofWro1pFSPl7hOxfSIku/dDdu9tBIHfwWxLYpKNkE5y61nqoGk5U5Iyw/4TulFcqZMJdql
	P+l
X-Received: by 2002:a05:600c:5851:b0:492:1e7f:d41e with SMTP id 5b1f17b1804b1-493c2b4e778mr50333285e9.10.1782973550953;
        Wed, 01 Jul 2026 23:25:50 -0700 (PDT)
Message-ID: <158eeb93-dec9-4805-98c6-3ea84b235d94@suse.com>
Date: Thu, 2 Jul 2026 08:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Change XEN_DOMCTL_setvcpuaffinity interface
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260701111606.4063972-1-jgross@suse.com>
 <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
 <d7da5a56-3d65-403c-9c3c-19e1566d2839@suse.com>
 <0c888832-9509-4e14-977c-ff1dc37768f3@suse.com>
 <72ffe654-8ba0-403c-91e0-100905467970@suse.com>
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
In-Reply-To: <72ffe654-8ba0-403c-91e0-100905467970@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782973551-91128D51-8D30E5E2/0/0
X-purgate-type: clean
X-purgate-size: 1153
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
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
X-Rspamd-Queue-Id: 8FAE36F3CBB

On 02.07.2026 08:13, Jürgen Groß wrote:
> On 02.07.26 07:54, Jan Beulich wrote:
>> On 01.07.2026 17:34, Juergen Gross wrote:
>>> On 01.07.26 13:39, Jan Beulich wrote:
>>>> On 01.07.2026 13:16, Juergen Gross wrote:
>>>>> Today the XEN_DOMCTL_setvcpuaffinity hypercall will not only change the
>>>>> affinity settings of a vcpu, it will return the new effective settings,
>>>>> too.
>>>>>
>>>>> In case an error happens during this hypercall, the expectation of the
>>>>> caller is that the affinity of the vcpu didn't change. This isn't true,
>>>>> however, if passing the new effective affinity back to the user is
>>>>> failing.
>>>>
>>>> That'll be the caller's fault though. Any -EFAULT coming back are an
>>>> indication that the caller needs fixing.
>>>
>>> The possible -ENOMEM isn't the callers fault, though.
>>
>> Yet that'll happen ahead of any changes made, won't it?
> 
> No, it can happen during the final call of cpumask_to_xenctl_bitmap().

Only hypothetically, on a big-endian architecture (which we don't currently
have support for anywhere, hence why the little endian special case was
added there).

Jan

