Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPt6BvCF4GlPjAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 08:47:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A553C40AC3E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 08:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282983.1565299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDGUI-0007U1-AW; Thu, 16 Apr 2026 06:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282983.1565299; Thu, 16 Apr 2026 06:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDGUI-0007Sf-4p; Thu, 16 Apr 2026 06:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1282983;
 Thu, 16 Apr 2026 06:46:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDGUG-0007SZ-FT
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 06:46:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDGUF-00BoRw-PA
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:46:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0859f-bab6-0a2a0a5309dd-0a2a4503d80a-16
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 08:46:03 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69e085ab-02b3-0a2a45030019-d1558032a47e-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 08:46:03 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so1984315e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 23:46:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f08b4f7esm58847495e9.0.2026.04.15.23.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 23:46:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1776321963; x=1776926763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aGQaaIyORai5qktmzL8qZVGyiFGYScSPxNYKtpLC2b0=;
        b=P0sAktcKPpHZLFSxDVWEb6CEZtUOH6SnbLUiyp0uAroVaxVgumvU+C2J7XrBb7fAwX
         pBzv7dTodT8FGuifkyke/0g125HzeSvwvFWBMSL97cAd/PnW01am/uLxzTu+Q82V0VG8
         6Kgy8DbRgPIMAGJ1VZxz6fbSWTthy9EZZRBwt47W1W2Dvbqp4u9CX/NNebQ9hns65tV4
         g2dPhySQ2EkjHCq+JpRS5cEBnQM9S+EqxbaFuAQhV2n0G14i+EPoEo/y13eBAKvHxgSj
         iNU0k3FyrvwNyJ49ds7ToymdLYA9DIjbQY+Ti0oIkaHCNQOnzaxB48lT2QoJLdhMOR1a
         qo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776321963; x=1776926763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGQaaIyORai5qktmzL8qZVGyiFGYScSPxNYKtpLC2b0=;
        b=NrmokNQ3YbECugoyuvbVv89gYX19Z960libo+7EukoPQpnmB5/7R+is4/BAzHGxTCE
         AMKmSWhpBo+qA8trMruwMwq/K9xRzs0jql4nPRBFIPlDGF4y6EedRXq9JkFDo71Z2AD3
         CV0bIOlW3NcIZR9cnAXDU5+KB6aSmlMuPY0BtHIjizK7dk4CPbJo0OKM122JpNiKblPa
         OUHF/skQdF1m7RCUIisDQADms3dzAGfuXsJhFGBjEs3tq6jRzBbYkFynvRpUxlMPC7eX
         cSBXUaZpHbFpvOXMJKsq/RhRKUGfPi4kJflS0toz4Y3rTp5klYl27IEoQDl85zgxeoPd
         5LGQ==
X-Forwarded-Encrypted: i=1; AFNElJ86aRISEJMUXMxjOc32lJCaiTEsa+iboJJzSRcZwkbFtSS2TWOVPFARvgqtOy0X1n9/hVbfR4/UVNI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC7ptAILQow+R7iWllNOr6cOmEhwF6k8GDm9tyvxZ7BJcctXqA
	jSk2YhpuX3wqqtCEEUSUg9pXmgw1tDoq1EmvuC//rzBmUcKqAXLz1ad3zu5xE5KdPA==
X-Gm-Gg: AeBDieu64mtJCHS8OCkw8akNhVF8xAfxY1Rvgygds0O4tV9OSYl25RksbgdyQvPjTOe
	Jta3hsgYGYitofOMIgPZXqEvCJAEGHf8e0bVqsIovXQ7J6QafTqTpMwfbWLuoutxygFGGyi2Rii
	p8s/DEbqkSQUzf/wSEB/mp+xrrstYy7iL8cqcPGmpHm+73WUv9MmCT2Qzk1v4n8g1rR37R9AYkV
	AWgOVja50TBA+muAQ/8pyrTS+4VoekWbAMhWE4E6oYZeGKLWmxx/An+arzcGTBJfSg6lR27b1f1
	ZmwlGV47SIJvQbAvmAHpufkGTOcsZ9QhG6XbR/BabQ5q8rdQm0JmmL/5PS2V8hW+I3RdIVp4ZdP
	9iz0bx676w9aM9cVrIqTw+HWK0FDQ7KwkAITqTnzq3sUeHYe9mhn+dfaNAlB0vYG6aqwJUfBgL6
	As+IhuIAbJ+ZSCVubs97F82dIL2xF9LGmSZUp41Z967Xv0KoTMgv9CeuZe/sJ2nAE6yV2eE0lRG
	Ku2XTyTaeC4IL7HILzQtE7+mA==
X-Received: by 2002:a05:600c:3e0a:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488f47c90ddmr27973765e9.5.1776321962858;
        Wed, 15 Apr 2026 23:46:02 -0700 (PDT)
Message-ID: <589b36fe-946d-4a34-8227-a4dc558db304@suse.com>
Date: Thu, 16 Apr 2026 08:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] xen/domain: Add DOMCTL handler for claiming
 memory with NUMA awareness
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com>
 <7d439bb1-7381-4fa4-af79-423e8c7fafb1@suse.com>
 <LV3PR03MB7707A579E5CBD292B127995C87252@LV3PR03MB7707.namprd03.prod.outlook.com>
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
In-Reply-To: <LV3PR03MB7707A579E5CBD292B127995C87252@LV3PR03MB7707.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1776321963-40F6FC9A-A3BCF9AC/0/0
X-purgate-type: clean
X-purgate-size: 2913
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A553C40AC3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.04.2026 17:17, Bernhard Kaindl wrote:
> Jan Beulich wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
> [...]
>>> +int claim_memory(struct domain *d, [...]
>>
>> static in domctl.c? Otherwise with Penny's work to make domctl optional this
>> would be unreachable code.
> 
> Thanks, done: Moved it to domctl.c to be not compiled without MGMT_HYPERCALLS in v5/v6.
> 
>>> +    if ( uinfo->pad || uinfo->nr_claims != 1 || d->is_dying )
>>> +        return -EINVAL;
>>
>> As already alluded to in reply to patch 03, I can't help the impression that
>> usage of this sub-op with multiple entries would we quite different (i.e. it
>> would be not only the implementation in Xen that changes). I'm therefore
>> pretty uncertain whether taking it with this restriction is going to make
>> much sense.
> 
> I submitted this sub-op to support multiple entries with v5/v6 now.
> 
> In v5/v6 these checks are updated to support multiple claims in the claim set.
> For clarity, I renamed the .node of the individual claim entries to .target:
> 
> The target of a claim entry can also be a selector for a global claim
> or a legacy claim and the field have many bits for future use.
> 
> This wasn't needed but I think it's clearer that the claim entry specifies a
> target which is where the claim entry is aimed at, it's not just only a node.
> 
>> +    if ( claim.node == XEN_DOMCTL_CLAIM_MEMORY_NO_NODE )
>>> +        claim.node = NUMA_NO_NODE;
>>
>> What about the incoming claim.node being NUMA_NO_NODE? Imo the range checking
>> the previous patch adds to domain_set_outstanding_pages() wants to move here,
>> at which point the function's new parameter could be properly nodeid_t.
> 
> nodeid_t and NUMA_NO_NODE have (judging by the existing implementation) are not
> exposed in the public API to the control domain.
> 
> This separation is probably a good thing because it allows to change Xen internals
> like nodeit_t and NUMA_NO_NODE if so desired without changing the public API.
> 
> NUMA_NO_NODE is defined as 0xFF and nodeid_t is u8. But that is just an
> implementation detail of the Hypervisor itself. If needed, we could change
> the implementation like this series could do, if wanted.

You spell it all out here, but then you don't draw the conclusion that I was aiming
at: If someone passes in 0xff, that _should not_ be mistaken for NUMA_NO_NODE. Hence
for the time being you simply need to reject 0xff if you don't want to expose "no
specific node" exactly that way in the ABI. And indeed ...

> The public struct xen_sysctl_numainfo and xen_sysctl_physinfo define num_nodes,
> nr_nodes and max_node_id as uint32_t, for example. For type consistency, I opted
> to define this public API as uint32_t as well and not expose internal types/values.

... the proper representation there would then likely be 0xffffffff.

Jan

