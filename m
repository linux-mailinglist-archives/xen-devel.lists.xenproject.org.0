Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP+XO5WDjWlb3gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:39:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3851412AFBB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228428.1534608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqRHO-0000r7-8s; Thu, 12 Feb 2026 07:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228428.1534608; Thu, 12 Feb 2026 07:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqRHO-0000oI-5w; Thu, 12 Feb 2026 07:38:26 +0000
Received: by outflank-mailman (input) for mailman id 1228428;
 Thu, 12 Feb 2026 07:38:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqRHM-0000oB-Vv
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 07:38:24 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceb64f83-07e5-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 08:38:22 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43770c94dfaso3036511f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 23:38:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835ba69160sm36310695e9.8.2026.02.11.23.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 23:38:20 -0800 (PST)
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
X-Inumbo-ID: ceb64f83-07e5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770881902; x=1771486702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EcldGGRbfTtZTWazZegixBdoikoRC7VdgToN8CwQU8A=;
        b=flDIvAi4iIIvadOTDe6kBYeyo4VW8JRFJpsrVJYNC+5kW96W50zKVMrm3gmn9co9IO
         sUvTIH8qmXrKjkntqgHnkD8baKIK0Z2Mu6at2fE1yBOyCoNF+R6Ge0uKncr64KOhd8w6
         d0fQOQKLUoU/cjNALSiWP+XzVj7kxcIaTyJMRkfnzTHJWibmkcwMjU7QUmcXRZJvhKIy
         WWBjMmq2ta62mvAlzTPXkINwOu849tFnF0MHR3dXt1075KHrzQWKulL5Q7C27QXTJWs9
         lmnnADIm5PMf/OGoTOhs+vmDuE0ZqoDGNNTV7kV9wiztz5odXvBmm4JfWPyPAYzsgBes
         KpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770881902; x=1771486702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcldGGRbfTtZTWazZegixBdoikoRC7VdgToN8CwQU8A=;
        b=oX5XLuoxlBzRtSaBhf6pv8NVgAOhT6GFG9gbcVHLZd03yY8n/uGwCQb50wmq6yLS8k
         Im5gOtLJg5+GR50VeonWreGOHxwf+2MwQqdyMUWPLRo6ZCVUSw7un6U/L9u14CwLlVu8
         s4zbs54bX7KOPVUDcqaT5GP1jyIcMd14+j6iCY9oBuNEmVoSozdy4Pw+f1Xp9lkx/1MP
         WHXHowZFYXK/Z8Tl8dBEh0coDBnTxwK82bp4YJ2cvXIA3R36y/BFubyWAnvnshFFTzw4
         vh2osPDFnDPQ8o38hTU15/U2MyYxc2Re4DeOc/6Xo7CVGyfWQ5MPA11x7ZkTP3fTe0Zy
         pqVw==
X-Forwarded-Encrypted: i=1; AJvYcCXkUDjMLONk+QMl2V3X9w9GHepPGH4tyse0bRJhoodkuFiIiQ9eEZ1XLVLU59Q0rJ65wFK1PRRU7iw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPqxh8esujylEr4gsNsCrXPbPYy/92tsYhD3epV6SoIres8oPK
	Z+CbNf2SkhF9pKDMZOlKZb8EcFf7GSiv7j8kyukXjcChzEFOzCzQRnEhDHump6ekTA==
X-Gm-Gg: AZuq6aKFFalGeuiS3QAeNjWjjG9tyYkOUS2oAt5cqiHrSDIiAoi2FXZbfhifU1FAlpg
	VfhfTrS9j/8FQdVYmrAJH7axHu+KAiXKArkpKSUCoMQ1ZGMiXk3peCncSI2ZsUh0FVH4zapJvnJ
	CFoJpnE8kwlCLKjKJBAw67MM/Gpb5aaRhUrWMOBad8RD+X5BcFke/EWkJsu71DQ7F1nU27xvBOT
	ogK8B3KDCvHJHyinzSEUqKX0WRp9Vcibjm9Vxmuvs9r9Klo3QRCZ5SoqNTADTVQnUNv4cDIiowj
	WDKPn0LYqYp6DrEY17YRzAwnLwmJBh/GyEW+keWO6vP2aZzjh4EdySuA/vs2mbt5mOxzyQVaD9a
	7q3VKnoxcjNRRUdpGg4S37K4bSTF3tOOQlDdKc28xU6GGq0321zPRnCLBeHzimQF9MVCfJqnm18
	iBaqEpJ0BJb8odp2MSyNUhtp88JrJ7pUjnY1fpncPRFux6KGEVwgI5g1NzvmfA0bfUL2CUc4hNM
	82aGDBn0pAMLjA=
X-Received: by 2002:a05:600c:5252:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-4836715a470mr16831405e9.21.1770881901661;
        Wed, 11 Feb 2026 23:38:21 -0800 (PST)
Message-ID: <cb5da09b-66c2-4dee-8cc1-f67f596a3c18@suse.com>
Date: Thu, 12 Feb 2026 08:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Put wait.c behind CONFIG_WAIT
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20260211170118.109946-1-jason.andryuk@amd.com>
 <73bf621d-0795-4fbe-b926-71be3525b4c7@citrix.com>
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
In-Reply-To: <73bf621d-0795-4fbe-b926-71be3525b4c7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3851412AFBB
X-Rspamd-Action: no action

On 11.02.2026 18:30, Andrew Cooper wrote:
> On 11/02/2026 5:01 pm, Jason Andryuk wrote:
>> wait.c is only used by vm_event.c.  Make CONFIG_VM_EVENT select
>> CONFIG_WAIT, and use CONFIG_WAIT to control building it.
>>
>> Provide stubs of functions called from common code.  entry.S needs an
>> ifdef to hide the symbol from the assembly.
>>
>> Also conditionalize .waitqueue_vcpu in struct vcpu to save space.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> I'd really rather see the API/ABI changes required to purge wait.c
> entirely, but I guess this will do in the short term.
> 
> Two things want further thought.
> 
> First, because ARM uses per-vCPU stacks not per-pCPU stacks, it doesn't
> need this infrastructure in the first place, but it looks like it's
> still compiled in and half wired up.  I suppose you don't notice because
> you compile out VM_EVENT on ARM too?

But if we want it compiled out altogether on Arm, ...

> Second CONFIG_WAIT isn't great name because there are many things it
> could be.  I'd be tempted to just reuse CONFIG_VM_EVENT and go without
> CONFIG_WAIT.  I do not want to see any new users of wait.c, and it will
> disappear at some point.

... don't we need a separate kconfig control, for it to be selected only
on x86 (or for it to be dependent on x86, and then imply-ed)? Imo
CONFIG_WAITQUEUE would be okay, as long as it won't have a prompt. We'd
then simply want to prevent further select-s / imply-s to appear.

Jan

