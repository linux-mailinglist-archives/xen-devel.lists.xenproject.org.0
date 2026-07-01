Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f7t1CdcaRWpJ7AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:49:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074D6EE56A
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:49:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KJ2WNXdZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349970.1607557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wevIt-0005JL-JI; Wed, 01 Jul 2026 13:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349970.1607557; Wed, 01 Jul 2026 13:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wevIt-0005Gk-GB; Wed, 01 Jul 2026 13:48:39 +0000
Received: by outflank-mailman (input) for mailman id 1349970;
 Wed, 01 Jul 2026 13:48:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wevIs-0005GZ-Bc
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:48:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wevIr-003xrh-C9
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:48:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a451ab1-5cb7-0a2a0a5109dd-0a2a4505ba8e-14
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:48:37 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a451ab4-3cb2-0a2a45050019-d1558036dcae-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:48:36 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493a97fad2fso6087765e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 06:48:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4d1f1asm83687285e9.7.2026.07.01.06.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 06:48:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1782913716; x=1783518516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FZJ7FVfbTz+w5KSCQNEAopHFenppAWwmNKWbesF+99g=;
        b=KJ2WNXdZN9npSCi74F/z7yJeslgTUv4kHRDRD/4FakqmyqvbTUkR8vnM2Y0+XmvZpy
         GnGYmtULYo1gZYG/R99ANm6up95MqidKrhFI7JzbN7mBSjJ/jXqqeCseRc76ZbWJgOlq
         WR9pXjla4J2/MDEnl9fy9Fqcc3DRzeZEwa9cP6qHV6ivU4aSHcPaavKcdYDNCs04RWUM
         jlWKwti3mABtyt4TtT/l/JkVsK6oYq7uyA3BE4yWwV2B9Mu39GanhIX4eXZSIiuda6jh
         r4RxszjL6hYyB1EJxSfX7xcQ6fNR+poIw1OrDBrE90Rnp0W70e174xH6BzATlZa8CNKW
         yeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913716; x=1783518516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZJ7FVfbTz+w5KSCQNEAopHFenppAWwmNKWbesF+99g=;
        b=nJViyERRfG0ySt5QFu5Ehzd17BOFXoWrc1hs56MtyWEjyow6H7ryxP9mrdlV00pPr8
         zoE7hThnb0JRbmBnjLIndeMxlPzA+cjL21sBtzirXzkSyE6HTm0PiDatIZK60GXlZ7NO
         b66OvMuqdLAEGsbGHBr14ioPeo0pvgQMEmGlDdwwq5HVo6OZm4w5RS+8JhNMEhZIV1Es
         RRzqHkZsZxClmLph5aw/gwRixIPCfawmAHzwMXw8dS1GrMq7Y0ci6EnmQQQUOljkGhDq
         E/G2Yiz2SYNikpBUdpq5Eo4zeX+Oi0KxEB1x/jmoqLFCT3ZPrbjv2IyRNflgEcVGYqHM
         09lw==
X-Forwarded-Encrypted: i=1; AFNElJ/03R8LOymGd+iDzy+O8REA+rJem8ERJLcoQvZeJpu9KfduHwimuTd0aemH9PgJELbqzrgLpVBos9s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCNDw+oi30emjFHH7me8b8s2L7E1GQ9wooIFS6VZYzkEvxd+aD
	eabc8d6eirmg8KMHAXk07HmqudgJXDW9PT/WNMI2xOVc9rSjmiMcQFYUKcbZANt+sg==
X-Gm-Gg: AfdE7cnYPQ91jG6EYP2r31ZW07EDxNaCfrsBsniksEmRTL0iPAOCVFIgFQU8nFuD7q0
	jjhPZqFTjXBN1X/bMdoe+e+lDJS8oo5yxKOz+3wBeCNuraxTKBfK/bBZAQEb1+6GzZvidzoj6+c
	nTKbFCBd++ZWRI1mDllw21FnfY9igblO06SaEHMvHnpma2qwFrJUD+SI7UQDhBCQ1OGdAzYY1F7
	Vy383Mi/j5fg3h2emYFNn0qZNh/l7wHZnUVb3MoWwWB7xwDzVMQMXyEMioR70K2eWF1XdLUryWT
	nOFPsnz5j1HO7g1syYYsdPfwMry2iVTZHVYBL44YNwetXQhQT8CrXVPz6W9o2UHn0i4r5GqJaOC
	CAIYrZwCF3/r8Zssrdo9FKjbW5hGfi9LN/upLq2JqjA8k+sPP5SUYzwnGdyf3CSwUlVypvRWuOg
	ZJWu9WNyklhCjMXG5JfNQb9Qv6wtjww9j8fvaRFA8LRF0dCgXlGlIXeXqSJc4XOzAn0NFsK7aVV
	M6q
X-Received: by 2002:a05:600c:c093:b0:493:bb4d:4dfe with SMTP id 5b1f17b1804b1-493c3cf0d10mr11006325e9.23.1782913716355;
        Wed, 01 Jul 2026 06:48:36 -0700 (PDT)
Message-ID: <ff6cf07f-bc82-41d2-8a14-80cdcea54af1@suse.com>
Date: Wed, 1 Jul 2026 15:48:35 +0200
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
 <f4623033-ec0f-4b91-8443-724701c79f37@suse.com>
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
In-Reply-To: <f4623033-ec0f-4b91-8443-724701c79f37@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1782913716-14B012B8-335149DC/0/0
X-purgate-type: clean
X-purgate-size: 1672
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
X-Rspamd-Queue-Id: 7074D6EE56A

On 01.07.2026 15:08, Jürgen Groß wrote:
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
>>
>>> Instead of making error handling in the hypervisor even more complex,
>>> just change the interface by NOT passing back the new affinity. It can
>>> easily be obtained by another XEN_DOMCTL_getvcpuaffinity call if
>>> needed.
>>
>> At the expense of further increasing the pressure on the domctl lock.
>> When making the recent error code change in this area, I was actually
>> wondering in how far these two sub-ops might also be candidates for
>> moving out of the locked region. Yet with vcpu_affinity_domctl() not
>> using any locking that didn't look entirely straightforward to answer.
> 
> The calling hierarchy for the XEN_DOMCTL_setvcpuaffinity case is:
> 
> vcpu_affinity_domctl()
>    vcpu_set_hard_affinity()
>      vcpu_set_affinity()
>    vcpu_set_affinity()
> 
> vcpu_set_affinity() does the correct locking (takes the unit lock).

But that's not sufficient: The two involved vcpu_set_affinity() calls
want to stay together, i.e. not race with another domctl.

Jan

