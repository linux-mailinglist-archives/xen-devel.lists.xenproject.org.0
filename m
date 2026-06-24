Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o9NmBBSkO2rqaggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:32:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712E26BCF74
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:32:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=riJ+YWMe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344701.1603741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcJxE-0000WT-00; Wed, 24 Jun 2026 09:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344701.1603741; Wed, 24 Jun 2026 09:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcJxD-0000Tr-Tg; Wed, 24 Jun 2026 09:31:31 +0000
Received: by outflank-mailman (input) for mailman id 1344701;
 Wed, 24 Jun 2026 09:31:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcJxC-0000Tl-Do
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:31:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcJxB-00Ez2X-54
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:31:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3ba3e9-5cb7-0a2a0a5109dd-0a2a450be17e-28
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:31:29 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3ba3f0-5e53-0a2a450b0019-d155802ab165-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:31:28 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso7382875e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 02:31:28 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd15470sm505901305e9.2.2026.06.24.02.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 02:31:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782293488; x=1782898288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6V4MnC1EYqEZ8uXBDgYH8y/TCT0GKFOgCEgc7x2BdM=;
        b=riJ+YWMeaR3mFaAD/FkqYzY5VNlhxqZQvEovnNDBHn3z6tiOS6HKEEIq985pWLbriO
         a1NkIiMpaGU7PPL6TjSJuWhxlGM3ONvb5wzGexoXmtNoDmYyrCsx22k1/4c0HfczaqT1
         bqM5gPohS7lwUVOD6TJGrxJXPKmZDmrtvseCQmmOcXkdEgL+0uvoo70GVwDvpcairNJh
         HJ5YtItlULBwUdrUbwgdce3HijOMj7cYlH0Ky9XINagpk679iWndCvCO3KZB8H4BWzSc
         meG95mDY4gO2LEgQBsGH5nrI14oD6rxmk22csb4dwfnik+dhZwpV9Hjmwgl34aaRIZoF
         W5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782293488; x=1782898288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6V4MnC1EYqEZ8uXBDgYH8y/TCT0GKFOgCEgc7x2BdM=;
        b=tITg3S53UnOaTrPwzbPJjTjgCScu/yZjVdDzGQyRC+WPsclDrZ8mLH6a2PX6WJHP2L
         j4NUDNBJqglESk5pzx2QZj9DQDWCH842nscpvhc4oLKW/fgeQxMQa0rcJXATbAAwSeDC
         D49n2j3v5bfN+j8IMPm+teVcp7HyqdwZUciaclHsCOof4uo75WsX0FE3Fz1lOJUugqws
         Fh8EVQumPHOkcUA0lYGyWE2oW0p/dhuBOtXDxig52erPxtpLL0kx7VKy9IkYCFH3Iqll
         zX+Ie6E9AnqTjZeF9Ns/nsKTtLXn6h0Az6Vm6Eb6azuJqfq52w3Q7+FWGgsM1AmhpysQ
         J5aA==
X-Forwarded-Encrypted: i=1; AFNElJ/vwFEXMMHzxRrwZ+Wq2dlY5KbNnEfurjUn42mCzIt+pLRtltRn/jwBxZtn/lJVZyQUKvZ4oC/5IWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNEUw9RNp1q1iA0AbZA+ZHroOd62VhDcb8mvjFwUbemejR8gae
	X4sXZF6KurIYw3Urt1ndLJ6360Q4AyxxqcovswHHR0lqpG8jmY1yEfWK
X-Gm-Gg: AfdE7cl7AMEdrXX3gkl+pUT7qgizN8OK60qhEVj7Hmh9yWSk94CFmBjVQWlAwTByTnc
	Tt3eN3EQ7lNuDtn+NASkXxi/pTCPzuKzxrSnepbAOZyNf/5o2WEK0PHNHCVEJ2h1dH+H2Dc65KL
	cygos/HucAtzbgZJ5oObj7FvfvHvevGBW4/xwPT4cuQwW6gCMpkbrHqTW5Uaf4hDMp6HNmI1VVQ
	3kwvBHiaPhte6+d8lAmraXA9GReyYUk471VsxLvpEVFyP2VfnMHDQj7arn3P/QuYexmcE4WA9rK
	tIiq3eKvW2IiRS3VTlNGjVHtoKws0OP5qg2VDBsRV42aVEAUja/uEbBH4Z6MD3EbKUdpRRk5C8O
	xrkPvKPlgEcy8y8hWhlQ1XWg4gw1d/FUehJ1IQWyU0hCfFuSQFoETgCisTUXuIrtoX2+oup91l6
	9cygT9IPbLU8v/70fcXUH/wrbAja6wDN1W653Jvu/Gc2TAV7jQyrGNJ48giUPM/8z2+7I=
X-Received: by 2002:a05:600c:348b:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-492490a771dmr284567375e9.24.1782293488155;
        Wed, 24 Jun 2026 02:31:28 -0700 (PDT)
Message-ID: <3f88322d-a8bf-4f9e-b631-dd7ce9c7ce38@gmail.com>
Date: Wed, 24 Jun 2026 11:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] xen: arm: update p2m_set_allocation() prototype
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <a63794ac32e157ea44c3450fc5fb6f2842e00680.1781693963.git.oleksii.kurochko@gmail.com>
 <0343b00c-2553-4df2-98a5-327636a4cb05@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0343b00c-2553-4df2-98a5-327636a4cb05@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782293488-4C1CA00E-0676ABB2/10/73395122804
X-purgate-type: spam
X-purgate-size: 2954
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FREEMAIL_CC(0.00)[microchip.com,kernel.org,xen.org,arm.com,epam.com,vates.tech,suse.com,citrix.com,wdc.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 712E26BCF74



On 6/23/26 1:29 PM, Andrew Cooper wrote:
> On 17/06/2026 12:17 pm, Oleksii Kurochko wrote:
>> p2m_set_allocation() signals preemption redundantly: via a bool *preempted
>> out-argument (set to true) and via -ERESTART return code, both at the same
>> time. This led to the caller-side ASSERT(preempted == (rc == -ERESTART))
>> added solely to document their agreement.
> 
> Well no, it's not redundant.  A NULL pointer is used to signal that
> preemption is not permitted/available in the current context.
> 
> You notice this below, but it does invalidate the description given in
> this paragraph.

I will reword commit message to:

```
p2m_set_allocation() uses a bool *preempted out-argument that overloads 
two meanings. When non-NULL, the value written back (true) duplicates 
information already carried by the -ERESTART return code — pure 
redundancy, which the caller-side ASSERT(preempted == (rc == -ERESTART)) 
only documents. Separately, a NULL pointer is an implicit calling 
convention meaning "preemption is not permitted in this context.

Replace the pointer with a plain bool can_preempt that explicitly 
controls whether the preemption check runs, making the NULL-to-suppress 
convention type-safe and self-documenting, and rely on the -ERESTART 
return code alone to report that preemption occurred.

...
```

Would this rewording work for you, Andrew and Michal?


> 
>> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
>> index 51abf3504fcf..e5c6be7c0890 100644
>> --- a/xen/arch/arm/mmu/p2m.c
>> +++ b/xen/arch/arm/mmu/p2m.c
>> @@ -133,27 +130,24 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
>>           return -EINVAL;
>>   
>>       spin_lock(&d->arch.paging.lock);
>> -    rc = p2m_set_allocation(d, pages, &preempted);
>> +    rc = p2m_set_allocation(d, pages, true);
>>       spin_unlock(&d->arch.paging.lock);
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index eacfd93087ae..c3818ffed45f 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -747,7 +747,7 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>>                   domain_p2m_pages(mem, d->max_vcpus);
>>   
>>       spin_lock(&d->arch.paging.lock);
>> -    rc = p2m_set_allocation(d, p2m_pages, NULL);
>> +    rc = p2m_set_allocation(d, p2m_pages, false);
>>       spin_unlock(&d->arch.paging.lock);
> 
> Passing booleans like this makes the code unnecessarily hard to follow.
> 
> At least use ", /* can_preempt */ true);" so the context is available
> directly to the reader.

Did you mean `false` here: ", /* can_preempt */ true);"?

I assume I should apply this pattern throughout the patch wherever true 
or false is passed explicitly as an argument to p2m_set_allocation(), right?

Thanks.

~ Oleksii

