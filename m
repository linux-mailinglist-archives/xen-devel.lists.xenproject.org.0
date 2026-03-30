Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LVyIq+Iymn09gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:29:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D5735CD93
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267725.1557172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Dbj-0007eV-NB; Mon, 30 Mar 2026 14:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267725.1557172; Mon, 30 Mar 2026 14:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Dbj-0007bS-K6; Mon, 30 Mar 2026 14:28:47 +0000
Received: by outflank-mailman (input) for mailman id 1267725;
 Mon, 30 Mar 2026 14:28:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7Dbh-0007bM-Vq
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:28:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Dbh-00Gzc4-Bt
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:28:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca8895-e002-0a2a0a5209dd-0a2a4504d44a-22
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:28:45 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca889d-c823-0a2a45040019-d155802fc1c5-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:28:45 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso37393375e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 07:28:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487270e7248sm134754175e9.6.2026.03.30.07.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 07:28:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1774880925; x=1775485725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HZH/H//Uzu8ragJ7CJo9ShkfED7j7s06uBVKfaGVCPs=;
        b=OkwaaZcFqM7Ldh01drRBv5s/DEPfyHZbJgP1Breg99PvsSL7DnCcMdww70aj3+pHGt
         H02jMUbrguwHCRYZ7q1P2dhJqIS63ty3lfuGaVWqh6lNOl8LUtP6IMf2e1yWF2pB0ULi
         tvV6JQ+r96m8uPJNRgv01eDkhuJfbvkfThy319emECEzUP7dSiEQ3PRiffbPsUrnOrLu
         Ue8LY/RODVUVIY3dAzyoEiaRGAHLSkh015V7Oky15ituEEd19sZnUGP6alNMggnJNiyH
         p3p86o/Itf2KwCLP69gpSTUxnAMpiSmHxM7E9IVrg+KYBdEvzvFVHjw9TuYHPB3MiPO0
         zuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880925; x=1775485725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZH/H//Uzu8ragJ7CJo9ShkfED7j7s06uBVKfaGVCPs=;
        b=J7/ru8ibX/nmLL/sPjwUyMnPpN/T2oZR1tA0HJ/MHHj1V1qLHQpS+Zt/glTZNqjsDP
         k7xi8ip8PZkwwkacEmw9okMjfSQELwBny2pHv3D9A75SRz9CnFCYPohZcS+RaYApsin+
         0EqTKVHuYSnUTBklOoqLA8vpQl9RMNFbyh5vI9KhJ/05VKn/BFqeKrrqASDtr6v3sMd4
         G5o+VNMBFtdMVrDyfmGOZImYvRcjAdJL4H++2UyY+hffLPSbQPcFBU0AwlB3vrSlbTaU
         Z2agDSlatkNvRnRYKT+Dcu6K/gzpnFsuDWkG6BIXHZONlR8HMtfjGYhPI/IQ48j3AWp7
         DcrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1c8L3aPlEDrnInQg3D3IjwOSXEIBlmoWqH2gFQJQLLn9iwBGAPIb3+UfjQdyhECLr1ffOAXCSlSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6rwGOkCwfApVRFeMD0ZcrPCU8w59PtJJJv8fjXm0EdBTO61Ua
	jL45tjX1l3urj31KNElNAzRq9OU0MHOrscGq1szFbR9DZVhgoC8l5UDmP/12cK6MtvbcrU1SLpe
	zXoEE6g==
X-Gm-Gg: ATEYQzxe/iCIjHEyFqw0z/WHGOKfRbJ/VEiHktXs492uwZJ7WxdGYkFvFQeB6AMHBN3
	/R5Fs5oSPH02Ax3Tk5RyT5aTGyjslv42ZoPDN2RYQHiri+QbsUzWtesttcqzUd3u6n7vNARFk4U
	f7OhqDWkL87zCVyaMQ4YN5zdjig+Tv2DtrEpV1WaMrPPD0rBB5NBAY/SVNGS+6m9Az1UyA+lidM
	FEyEXF0YTqK3cXHZTFZbRm8lvleW6hGLXOdLRXprK5WX2kLIcwgOeKqpLCn76DilLJdoRKlR4Sc
	qrlZ6qEgmXbnyXxHcZHRDy0UY/ABcYprSQftGRF9AU0x+nUCzUvLLjWhEPIYIuOUvTtm2Bvj9fM
	nqfCZnyZRO3xCQfc/GYyccqPuN2kDevazlkYxZ9MHLyUlmF94go/yovX/RahN+fSO7261MZEn/A
	IXVFDSiz3tQCaK7XF/dAYDr23VjeWLCevxBr+jtPf2dBS+p/Zk+o5ykQzP4K9Wy2rVoFqNHPz0S
	H4CB6UaggqfbCM=
X-Received: by 2002:a05:600c:8819:b0:485:3ff1:d5c5 with SMTP id 5b1f17b1804b1-48727d55fc3mr210696545e9.7.1774880924646;
        Mon, 30 Mar 2026 07:28:44 -0700 (PDT)
Message-ID: <c5379e9b-b759-437b-85e1-733751851504@suse.com>
Date: Mon, 30 Mar 2026 16:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] make ioremap_wc() x86 only (for the time being)
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
 <20adacfa-06ce-4508-916d-f15d8f17788f@suse.com>
 <3bf90b33-c028-4f45-bda0-9d1bd5386c02@gmail.com>
 <6fa82fcc-d21d-476d-b020-fc40a645a74c@gmail.com>
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
In-Reply-To: <6fa82fcc-d21d-476d-b020-fc40a645a74c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1774880925-B8A8E9D1-61DB22A2/0/0
X-purgate-type: clean
X-purgate-size: 1317
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.795];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F1D5735CD93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 16:24, Oleksii Kurochko wrote:
> 
> 
> On 3/30/26 4:22 PM, Oleksii Kurochko wrote:
>>
>>
>> On 2/19/26 4:53 PM, Jan Beulich wrote:
>>> Its use in domain building is questionable: Already at the point both 
>>> uses
>>> were introduced, ioremap_cache() existed. I can't see why kernel and
>>> initrd would need mapping WC, when at the same time other similar 
>>> mappings
>>> (in common/device-tree/) are done WB.
>>>
>>> With those uses replaced, neither Arm nor RISC-V have a need for the
>>> function anymore.
>>>
>>
>> It is okay for RISC-V, but for Arm, IIRC, likely it was done because 
>> guest might start with cache disabled and PAGE_HYPERVISOR_WC on Arm uses 
>> "Normal Non-cacheable" what could lead to that guest won't see some part 
>> of kernel and/or initrd as it could be in a cache and won't be flushed 
>> to RAM.
>>
>> But probably I misremembered something and 
>> clean_and_invalidate_dcache_va_range() or something similar should be 
>> called before guest is laucned.
> 
> okay, so for this case copy_to_guest_phys_flush_dcache() is called after 
> initrd and kernel are loaded.
> 
> Then it looks okay to me for Arm too.

May I ask whether that removes the RISC-V restriction on the R-b (thanks
for that) you gave in the earlier reply?

Jan

