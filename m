Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCKELBxW52nz6gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:49:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1E439BD9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288872.1569105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8ey-0005OK-SL; Tue, 21 Apr 2026 10:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288872.1569105; Tue, 21 Apr 2026 10:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8ey-0005Lv-Pn; Tue, 21 Apr 2026 10:48:52 +0000
Received: by outflank-mailman (input) for mailman id 1288872;
 Tue, 21 Apr 2026 10:48:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF8ex-0005Lk-KY
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:48:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8ex-0076m1-1B
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:48:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e7560a-e002-0a2a0a5209dd-0a2a4505b9a8-26
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:48:51 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e75612-aaa8-0a2a45050019-d155d0b6b08b-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:48:50 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-38e91b06006so33424231fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 03:48:50 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185c8b57sm3612425e87.37.2026.04.21.03.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 03:48:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776768530; x=1777373330; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7dfEqXjFOI806a7YVa+NUHKbsxapeHBxldkN1O9/k4=;
        b=NwYZ1Q1cIt0lD52gUXcubbJqMyrij6j69kLyCzoGKOREvhig15q8rI4fT4K0v1My1d
         lgEUd8OcI2OZbRQAZM06h8D0j1MnF/yEhlw+m5TsTriMeFNUtuov3w22QJ8oCCI6oYUV
         X3sTrjGFRc8Wo2t642p6khMKAdKvUOpjUAnSTfy1YCU+jV8Hu8I1fCFojUusfZaUxQTx
         WlD/FT/Pa+eXP+Vmra66JT8g488rxuXFtHzgTU3bVKlUK8jQwEFldmbVIU/qTg1/afWU
         cQGTXNrXWJbYhVkVs3NMolGhuYJI83oWDFY1GdGMdby4V0xN7OXtDPl5xNw5JMEceMr2
         LLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768530; x=1777373330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7dfEqXjFOI806a7YVa+NUHKbsxapeHBxldkN1O9/k4=;
        b=oUveOOYpvQFXMuQ+Fowr8SVfq0ew9gag7TU2hUQ1Uf0D4KmkWcfoFXK/2w0PtFgZoG
         NSBQ7HGIMYySEcr4tGgPxOG6mPyDxPPhxlGhhWtjKW1Y1ZDe6EswPz9uKQQzrDHcYisJ
         2s5vdj/bO++UFG4nuoZFg6sjFanE0v9GNZ9d6WVDhXpiOQwdwyETrfKGLmY35/sgtIlC
         3o5iviuqgFoQRy/Pc5Om1pDxmqoIZDuP+XeQdpcVUcKtRUT9sKUKCmhzERbsST9253NQ
         lBHkcsdSo4hHCuFXdD5baCi2IndrU0M/F5xp2of0JEMUzgMN7C+fiBYgnzKniBf0dEcb
         /nMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+58LjZe4L4Fo9hOqHg0nLBqnwvPOuOH4pZIYdpuOhywxgwWRbCoL/TI2bfahGcJWGPp2TouLVd+gw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztfF7pf7CizFD89hAe/OpqqszeKdCrQNu7kZxzTz9NAfvnMjOh
	sumaSV0mnybuLC01/+M/dRMTADuz1UIZ2xe6aOqPJq5ME9VWPYpx0oO1
X-Gm-Gg: AeBDievoJwLazKv7xQV8aqBWGumReGRGShqoCBYmFr1E9yVRvKO2n5VUb2z79J57QO5
	YPwZmsVFixfUQRhtc91hkceRcqPESj/HZE0NgObVxeU85BXvsmshHp64o8Yr8PTrKoKugMR0jFw
	8TNhZb6APhqe21eoerJM7wwWqcnHXFwga08pYHzHN5AjMbw/oVhI/1PgFUG9piTVD0+GXkXTt4e
	Z6mbaogPoK0lYBMenzj8FBKSRMsOevbyCXNRaNlY0OlYCD82HXG1g19x+cJnsc7fdfdmnbLTLkV
	en/Mo0xrYnprBZEQcwJ+ld0rgZkt19RMN67gKQofMXzU0FvtXXxIpaqIe1eGOHQeRRhE2hEsN4t
	XVGPVFO/loXqiTNoQ8GkBZ3r4XxbHVzFfNsS/1L/NxOJG45V4TcW/qdzfQ9H/K/ggcP2PRqSoj5
	dE3duLF32T8tICOEXpEW1c00PA0ME9+KAMNdqw48GDU4WrhiGCDaL4KBlZdeDwXgnkOP0QSufZw
	Zj1vkNGnjL1/A==
X-Received: by 2002:a05:6512:10cc:b0:5a3:cd94:df73 with SMTP id 2adb3069b0e04-5a4172e7f45mr6753956e87.38.1776768529991;
        Tue, 21 Apr 2026 03:48:49 -0700 (PDT)
Message-ID: <5f6fdec5-1ad7-40c5-b346-8177f639c52a@gmail.com>
Date: Tue, 21 Apr 2026 12:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: pass kernel_info struct instead of
 fdt to make_cpus_node()
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
 <a897d880738f5b3be2d6fc5ec2b6cab1fd8b9dc4.1776340422.git.oleksii.kurochko@gmail.com>
 <b97cbb48-5bd9-4887-bb1e-24b7f001e5a5@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b97cbb48-5bd9-4887-bb1e-24b7f001e5a5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776768531-E3563443-85CD6779/10/73395122804
X-purgate-type: spam
X-purgate-size: 1660
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 61F1E439BD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 9:29 AM, Orzel, Michal wrote:
> 
> 
> On 16/04/2026 16:20, Oleksii Kurochko wrote:
>> There are two reasons of this change:
>> 1. Align prototype with what other make_*_node() are passed.
>> 2. A follow-up RISC-V patch will call get_next_free_phandle() inside
>>     make_cpus_node(), requiring mutable access to kinfo->free_phandle.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>   xen/arch/arm/domain_build.c             | 5 +++--
>>   xen/common/device-tree/dom0less-build.c | 2 +-
>>   xen/include/xen/fdt-domain-build.h      | 2 +-
>>   3 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 60a7cbf915a5..6740da3d324b 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1164,7 +1164,7 @@ int __init make_psci_node(void *fdt)
>>       return res;
>>   }
>>   
>> -int __init make_cpus_node(const struct domain *d, void *fdt)
>> +int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
>>   {
>>       int res;
>>       const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>> @@ -1178,6 +1178,7 @@ int __init make_cpus_node(const struct domain *d, void *fdt)
>>       /* Keep the compiler happy with -Og */
>>       bool clock_valid = false;
>>       uint64_t mpidr_aff;
>> +    void *fdt = kinfo;
> You're assigning kinfo to fdt pointer which is a bug.
> Instead, you should do:
> void *fdt = kinfo->fdt

Oh, right. Missed apply changes properly. As you noticed it was fixed in 
the next patch.

Thanks.

~ Oleksii

