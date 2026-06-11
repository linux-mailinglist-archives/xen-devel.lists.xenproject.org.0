Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1lyFIf7cKmpWyQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 18:06:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09BE6734CC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 18:06:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=B84YQA0L;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335868.1598018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhuz-000571-HN; Thu, 11 Jun 2026 16:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335868.1598018; Thu, 11 Jun 2026 16:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhuz-00054V-EG; Thu, 11 Jun 2026 16:06:09 +0000
Received: by outflank-mailman (input) for mailman id 1335868;
 Thu, 11 Jun 2026 16:06:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXhuy-00054N-4J
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:06:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhux-0038JU-H2
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 18:06:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2adcdc-5cb7-0a2a0a5109dd-0a2a45078e5a-48
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 18:06:07 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2adcef-229c-0a2a45070019-d1558032b12e-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 18:06:07 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso79229615e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 09:06:07 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c0d360sm88228195e9.0.2026.06.11.09.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 09:06:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1781193967; x=1781798767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lr6cUvyDcugNQh1xznXABfZY74Bn2GQxNd0pbeVZbQ8=;
        b=B84YQA0LrU3ci0rzwqYbL4lLlGAi/09bivNSahvoRUPKvMoc7+HDVBOGhfh4TNqK2i
         ubcpfOQI626uZPy02ohvkenQiuqd18+UuCOmBiMz/FNwLY4KoQ+tzYNdi+O9sCght0BG
         uNN7LYptJoZCseLwKUGfZJIWWQRUcFJj87hIxNfkzGSSVmyCtN5xRJR8Ql0mzcWpUllw
         rb1gOyS+q47F45cndpXGaD2AV/Pc+Y3iUKVI6Z5/rg0+VpK5lD2c1LAt4MCQzK43s8aC
         xXKMtb6rFFMeacNXJAt9RbrRYESnofjYUm0Btwyo9Y+NqTuWbwK4nwCGzjeQ18zZ6kC7
         oEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781193967; x=1781798767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr6cUvyDcugNQh1xznXABfZY74Bn2GQxNd0pbeVZbQ8=;
        b=soTUySoPZwARFwjqrYxjCklYfhNyrRn7f0xLWkJChLkmTItACHNSDZNJYX3elqXNEC
         w5jyluLxzqidxGLFZfGtY4CjcEpLiyCt2VleMVp9vgLSImfJNQukkQJMiyWmmaT85nss
         B7KJgPwbCIIyA1FGlHVtJDGlDxiMhIMzNwQtQWwB9FRUxrtLA9p6KVVr42ePz1kWG82V
         pEXz+F6eUFkAX6Bd98NjgydCfMpMINLgLek5cPN6Ph1m5P0iaDyBauVTAvotoG7jXdxw
         MG6YptNE8k4dzizGTYiEjU8PZTs744z4rkS2fq/dgMbqgmMx5EFrQVE552UXmtiyx3TP
         H20Q==
X-Forwarded-Encrypted: i=1; AFNElJ9W0B+swBC/ZVeY1T9d1XQkc8tAbCIlnh+9RUxbPujrU5xYPrKwwbU2HfVVEijVHBim5qpBSGuhlK0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKNTdO+hJcQTxf656+zwoQ9W1T3Tbs+TYmltcK/Au8ljkt5WDe
	+EZb4rvCJGlzV0qSHsphasFtnLVLv7L+ZDGIg/EIUJR36fMfuxVvOJ6hHVHZ5BFWqA==
X-Gm-Gg: Acq92OESepnCsTsW38/ezJudLEE7v4ODC2mJrgUf+GXHpgCCqxkr/ZTNbd6SBr3MCea
	D8M6aLRlZ708kl1u3mAH5hR7FCdavMJE9PLijJqUBL4D8DnvJIWcV/wbzk0E8mn3Lyj6kTKLgsI
	G6JwfWC1514ESXXUeHs79C1sb/fWO8nBoM60zf/PVL2MDFI9W83prkBEy4agpm38KU4wN5D6rar
	zni6CgGjwyUHJ933d3386telICIj93I/f3klJD31rqWTeqw4oc8R24o2tyiHG+K37ploUzniDzc
	hki/58yZQ8Wcn6rTyYujS+SlRrZVgUhRYgvqspJZn4IujTnYDs/aXnB3xC9MHJOtbWC/gcPU5qz
	i+eAHEhkkLOqJiFEWV3MYihNlB2MlZLONvdwUz35LxOrmFaAZPXxarylLI36A+mQLItA3MMHw+g
	I+6BOW0OpGwngnFvtvlDCTAs9H6niW7F3Zu81iHMj9sIr72zEHj6nx9OfxnDbNxFNXXEl5cHD8e
	Dbm517pl0cmG6wUyWy8hSx4IT4WPgEYNkBSNG2c4pLML29dG2jWJftKJIWzLCbQ8NvJRNY=
X-Received: by 2002:a05:600c:3b19:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-490e5613937mr52771315e9.22.1781193966752;
        Thu, 11 Jun 2026 09:06:06 -0700 (PDT)
Message-ID: <a32680d6-e321-4c97-b53d-71d7041e1c0e@suse.com>
Date: Thu, 11 Jun 2026 18:06:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] domctl: Avoid taking domctl lock for certain ops
 used during migration
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <3034d82a-f1ae-4c6c-a293-ca44b7e086fc@suse.com>
 <552cac1b-2be9-481d-a687-01c965ade221@citrix.com>
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
In-Reply-To: <552cac1b-2be9-481d-a687-01c965ade221@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781193967-0A971C48-A29230E5/0/0
X-purgate-type: clean
X-purgate-size: 1426
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D09BE6734CC

On 11.06.2026 18:02, Ross Lagerwall wrote:
> On 6/11/26 3:55 PM, Jan Beulich wrote:
>> On 09.06.2026 17:15, Ross Lagerwall wrote:
>>> When performing multiple migrations in parallel, the domctl lock may
>>> become extremely contended:
>>>
>>> * Operations like "xl vcpu-list" were observed to take in excess of 20s
>>>    to execute.
>>
>> Does "xl vcpu-list" involve ...
>>
>>> * The "clean" shadow op may pause the domain, restart with a
>>>    continuation and then become blocked on the domctl lock, causing VM
>>>    downtime in excess of 20 seconds.
>>>
>>> These issues can be fixed by not holding the domctl for the frequently
>>> called operations during migration.
>>>
>>> Thanks
>>>
>>> Ross Lagerwall (2):
>>>    domctl: Handle XEN_DOMCTL_getpageframeinfo3 without the domctl lock
>>
>> ... XEN_DOMCTL_getpageframeinfo3?
>>
> 
> No, but "xl vcpu-list" takes the domctl lock

If this is still the case after XSA-492, then maybe the follow-ups I have
pending to post will eliminate (or at least reduce) this. I don't think
that's 4.22 material, though.

> and this contends with
> XEN_DOMCTL_getpageframeinfo3 and XEN_DOMCTL_shadow_op taking the domctl lock
> which are called frequently by the migration process(es).
> 
> Various other operations were slow due to the domctl lock contention but "xl
> vcpu-list" was the most obviously visible example.

I see.

Jan

