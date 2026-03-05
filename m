Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJT3MTgvqWmO2wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 08:22:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A18420C900
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 08:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246215.1545440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy32K-0004aT-Rs; Thu, 05 Mar 2026 07:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246215.1545440; Thu, 05 Mar 2026 07:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy32K-0004Yc-OG; Thu, 05 Mar 2026 07:22:20 +0000
Received: by outflank-mailman (input) for mailman id 1246215;
 Thu, 05 Mar 2026 07:22:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy32K-0004YW-1W
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 07:22:20 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b04010a-1864-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 08:22:18 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-439ce3605ecso322610f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 23:22:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439ae0e7abasm35460460f8f.23.2026.03.04.23.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 23:22:17 -0800 (PST)
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
X-Inumbo-ID: 0b04010a-1864-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772695338; x=1773300138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7e+isCW/I9FrRY3kOc/NnHm7ijvXSJCvzCcAYg5805Q=;
        b=bRGKWNX706lZ73geg5oZWWHAhrcu1atTyx693cuPz2N0yJ6FQN0e+rwRExEDwL185y
         KrF3PUCBfIKCxtTy6KIdwxa7VzdgoV8iyfR005mq1naoZxtF5sWQTuAxha7oIH1WCZL/
         nOORyO0BzZ4YtFQL+deyuEiJBtC5LsET0G1AhMU9w9ENDb/aaHlixo8L8K635FlMx1i0
         H+ajU+Dedl+5hCT9ckm6UctTFEdcsX8a3/W6DPi6rI1SBRNlx3H92VYsOagTZZpyN3oL
         hOfsdlJXRubY45Uzr0se/QRTYWI6+rMw/xgtftaMg5t/FWn05aUkM6862L0YERXX5S6V
         wPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772695338; x=1773300138;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7e+isCW/I9FrRY3kOc/NnHm7ijvXSJCvzCcAYg5805Q=;
        b=UNweELXWF/ur4geeOvEcpph1NCE/BfRzZfghwMpxQ35OzW/UkljTW/M6Qk7ZxGct4d
         VkRbIHeb4NdNF639FRSfDgG0i5trr+dFtKboXKguwzixRW7RdYY+/ropfFXGHYy0T8m1
         gNvak+cDFgJSeqHMgCL20j2cOSYi1Ps/RHIT0XGxWNJY6XxApdIFPvEHHTFubwjOSbM5
         Tww5FV1DKBrB8iRXjKBeg9c0hu8Te9s/k8zj5+2fZf+ohDPfsmHzxTTTHQM7uqy+ppOF
         z7B2lagBMVCGHc58h2v1lbKX1OLmqSSo8DifPx1D+gNo8LGG6/pafXzXrLpTl8R5kwSB
         zwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj/ueYTsL7dGDeLPvqOUlheFPMrqzRW8bvQe0/8vUOH847lwtoEefup8FpoOQIeHxwj6HLNGF2IGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy16TCkelDW8LlqZ2dVdwxOE2Me691RDeKfHpj1IQxPaQFjto6x
	pMr9T5uoOO5RSE1wi6oGpSb5jXD3JjrsCHGcTSlYkvr89ca/lbeinQITqGthwoWvew==
X-Gm-Gg: ATEYQzxfAhghSHerN0kv/rEfCAHanj9oWgf/H24mdo7B0QeKnZJptaslO1gb0UGhhL5
	YEZnEEiyFgm4WacT7YAHA+215bRvU2rP7xLWkix/cr0wYgxEnAtb86BDkuafmL2rNCeYnp+MTUv
	VpJt5eI3IUYlIqETLJFYZJJiOma9z5hlRbczPnMxbsvn33HhClq9O+FIe9M5RAEY+IUGVwC11zB
	kQd8NA70gYQP/6LkAscqGxyT2F2BP563Ddi9YvUpSP827cyXzyc5WXjcF0oklG37gqVaxLBH5l1
	TKY/oB+eqhbCZhNchK+N+6S6+K9Xf+taY84LBZ9Ryk26on7dz1O7WTOud+BbRGBMdT8g+2H+WH0
	1MurCPEEiS3+PDDkBmQ8REnFXw+ACQmTTZwSKt5pCJz6xG70dWlYyQQypLA5ZSD8SqQqdUIlQV3
	m3Rll7GyJm0Ke9sCK6a1haKgWFthDPojv3vGG+dAHdgMOHcMKp9uMcqJ+zdmqFrqzz9EzUnu6zw
	zo9xi/fcudP/lM=
X-Received: by 2002:a05:6000:609:b0:439:af25:e4ea with SMTP id ffacd0b85a97d-439c7fb73b9mr8778964f8f.25.1772695338085;
        Wed, 04 Mar 2026 23:22:18 -0800 (PST)
Message-ID: <63982343-6929-4ad6-9f33-61f6c1db5eb0@suse.com>
Date: Thu, 5 Mar 2026 08:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] xen/page_alloc: Optimize getting per-NUMA-node
 free page counts
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <c56658d1248660543fdba162810b0629c081bd94.1772098423.git.bernhard.kaindl@citrix.com>
 <5e4d4674-1e1a-4902-bcd0-a24fbd13dc8e@suse.com>
 <LV3PR03MB7707E83CF01464D69AF1E599877CA@LV3PR03MB7707.namprd03.prod.outlook.com>
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
In-Reply-To: <LV3PR03MB7707E83CF01464D69AF1E599877CA@LV3PR03MB7707.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3A18420C900
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 19:21, Bernhard Kaindl wrote:
> Jan Beulich <jbeulich@suse.com> wrote:
>> On 26.02.2026 15:29, Bernhard Kaindl wrote:
>>> This only needs moving the ASSERT to before the subtraction.
>>> See the previous commit moving the BUG_ON for outstanding_claims.
>>
>> Please can you avoid such statements? You won't know in which order the
>> patches are committed: Patch 01 may go in weeks or months before patch
>> 02.
> 
> Thanks, ok, will remove.
> 
> - NB. I do think the first 3 commits should best be applied in one go.

Such would want stating in the cover letter and in all affected patches
(outside of the commit message area of course). Preferably with a
reason (it's not quite clear to me, I have to admit, but then I also
haven't looked at patch 3 so far).

Jan

