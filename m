Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO/2Da6c6GlNNQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:02:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7EF444627
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290199.1569865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFUPJ-0003Wa-QI; Wed, 22 Apr 2026 10:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290199.1569865; Wed, 22 Apr 2026 10:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFUPJ-0003Tw-My; Wed, 22 Apr 2026 10:02:09 +0000
Received: by outflank-mailman (input) for mailman id 1290199;
 Wed, 22 Apr 2026 10:02:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFUPH-0003Tq-Pb
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:02:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFUPH-00EDky-1O
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 12:02:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e89c9a-e002-0a2a0a5209dd-0a2a450ae558-28
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 12:02:07 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e89c9e-56b3-0a2a450a0019-d155d0b1bd3a-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 12:02:06 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-38e12c67a6fso51334771fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 03:02:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38ecb4f5119sm32544131fa.2.2026.04.22.03.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 03:02:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776852126; x=1777456926; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xy+ApHmByFuc1t0vGq2pFeEBqU6k6Tlo57xhbmenYgk=;
        b=HXaJwlBxarQJ7qgWeT210XJY/hFRqfTG8Mo5Z7Zt3TK1/lS/bY5yADH8kIwlTT7V9m
         hv3UpV8ZGZ+J9zO5Hnk2eVWeGOooRz2DuLk6BLVMBsglkj+QVG7HCimbTx75DeCljrCC
         N8hK17wjrjC0kxJE8Jr4KHgPPDpTIHmd7LTTaXlFOL/Vse/6AFek/4epFQnvE/D4PLTQ
         CSwhyWGtZrOPc08E1qt9gbK+bPj/NswgX8074he87Z1YNT+CFj9aK177wfPAvuC3XcvM
         FftQW/nSG3N0J0fwxrydDOZzIIujhcF+UHkG7qUBuVxyT9PJ4eytd6VuhJlinz4lPxjf
         tTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776852126; x=1777456926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xy+ApHmByFuc1t0vGq2pFeEBqU6k6Tlo57xhbmenYgk=;
        b=sknPQLFQOuajfedM07o1FCtWvHzVUrwku5yw0hIPTIaMrvKy39fEFnjC+II2vWi+5g
         Ux7yV5xqyc9AXQ49AC0rrdfxCnP5oMUGOfCJi5JTU80Eyv6Xzd8q9muXH1XMHZ34XkzK
         YwE8adf0xTFBZfSh+TAMtrb8MDw9p/0fwh7QZu7blZ8l/vkdyki9yPHWwgC8tyXJUlK1
         JDaNVWB30hdpzAs8oKOYWva7lkzzuM2rBRzmfTs4fX1pv8ByJNhp8Vldu33KmZJTF9UJ
         ix8YCmj9YpmAUOdWpt9M28HqnuzL+r5DhaQ36IANAwZlCIjVA59pKJaKy4JXIn6gGE3o
         uSoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7jBi9UstIhoDOCkMhsl2/BQlJSjT3NN3n4nd8D1T2ZOSTM51WrJl8QH0varHzKZpcPoH5QGinO6E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztPAuuSjAfDuuj1jUjUmt/bA22gDRXm5JFAkdTUSANsBhhDzha
	PucjA2TeWzb5yI6hoQ/+26zcTpE3Nfu6662ePdsI4pheWV6e4QkA3V0L
X-Gm-Gg: AeBDieszfWpJIBuT7f2guUznQiov7ACILsu2rQwcvOVaYWcAFPU/qFLPZTPnTE9uG7B
	D9fKNtS4wfckZBeXcfZp9gyl0vzeICI3mv8c6moivmySW06Ml9q+bFfdapnW/k5/clf1Ccqa6BS
	R/a91V6EkzXzxKwiFymi7nQV5rErbD8yhYZIp12k1FTpYe1rWzrInB0UqAFXqaAerQKo2t9NpZt
	cn2Y9S4y7hIYSsUOw8xXxlXqaLtFkQ+Gg0voXO7+jPhgFyznaWBpuPzVylqftzraYk4YG0S49uC
	pnhrGr77CIqRYGwfcx1tkROG4pm5Y2o3czvrQovrUXK7/F78oUNjhCPhBiwjEMXYoth9bUq28rk
	mBRnILkx6Vz8YcmEGLQ+Iz+YcWAxHJr+UtzAd+86NbLOk0mIrwkCbYkRok0KWWd8Pzd/Pjqz7/i
	kh6PLEu4D7OXlVkcTFw9qoqmSAyAiQ6v44m9apTMouY+tGTMV+LKAwdfGcjPjtebHL4+XWNdtPp
	onqf7a+aKKYQYuJ5Zp4xpK9
X-Received: by 2002:a05:651c:54f:b0:38e:48fb:cf65 with SMTP id 38308e7fff4ca-38ec77fb141mr66374671fa.1.1776852125898;
        Wed, 22 Apr 2026 03:02:05 -0700 (PDT)
Message-ID: <c08b9944-d64b-4ae2-85aa-75c978d9a7ab@gmail.com>
Date: Wed, 22 Apr 2026 12:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] xen: fix len type for guest copy functions
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <9154aea41a11bc0ba95ad15c217db79d029dd119.1775836193.git.oleksii.kurochko@gmail.com>
 <d942bf90-6f8d-4389-90e6-a486ac510e1b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d942bf90-6f8d-4389-90e6-a486ac510e1b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776852127-47D788B7-5B0C380E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1394
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9C7EF444627
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 5:44 PM, Jan Beulich wrote:
> On 10.04.2026 17:54, Oleksii Kurochko wrote:
>> Widen the len argument of copy_to_guest_phys_flush_dcache() and the
>> copy_to_guest_phys_cb typedef from unsigned int to unsigned long, as
>> the function can be used to copy large blobs such as the initrd which
>> may exceed 4GB. Update the internal copy_guest() len argument to
>> unsigned long accordingly.
>>
>> Change the type for local variable size in copy_guest() to avoid
>> compilation error because of type mismatch.
>>
>> raw_* wrappers above copy_guest() keep returning unsigned long to
>> avoid type narrowing; it is not an issue for raw_*'s len argument
>> to remain 'unsigned int' since the assignment to copy_guest()'s wider
>> unsigned long parameter is safe and there is no raw_* users who
>> are using a value bigger than what can fit into 'unsigned int'.
>>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Actually: You say "fix" in the subject. How about sorting out a correct
> Fixes: tag then?

I will add then before Reported-by:

Fixes: 2986481b3d9e6 ("xen/arm: guest_copy: Extend the prototype to pass 
the vCPU")
Fixes: 5302bd490bea7 ("xen/arm: Introduce copy_to_guest_phys_flush_dcache")
Fixes: d07b7369aa65b ("xen/common: dom0less: introduce common 
domain-build.c")



