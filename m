Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ML6E8gTDGoZVQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:39:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F745793BC
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312490.1582582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPF3J-00060D-Mn; Tue, 19 May 2026 07:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312490.1582582; Tue, 19 May 2026 07:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPF3J-0005ym-K9; Tue, 19 May 2026 07:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1312490;
 Tue, 19 May 2026 07:39:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPF3H-0005yD-Lu
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:39:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPF3H-0034kA-1d
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:39:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c13b7-5cb7-0a2a0a5109dd-0a2a4503aa8e-44
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:39:43 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c13be-672d-0a2a45030019-d155da32c85a-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:39:42 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-bd394f4a931so698721766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:39:42 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4c31404sm673138166b.25.2026.05.19.00.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 00:39:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779176382; x=1779781182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ojdXVC2NxdZc5U92Upsaz8ZswxJ7GhnKFyDv+/nulg=;
        b=UMuVMTU1CdrD/+zUdsFsukUox4MwirENUdKpXuih00e3TG5/7tvxsrwIO9ibh8uQ7u
         eECckIpUnjhsfAGIRY8Mj/6BiBHdh7rJKolNVBqEOG/Qrfn3DJyXnu8o2WnByz/LLT+i
         Yr8geLPU1wbykIbek7bgKUdURafdL5nd/2FBJeY+9WG+UosIvxIr0nWph/uJGWGHYcSF
         Ggmcq/A/0RXQ5f+lAK/LdDSUJ6AW5nzI5UixzLFex71CUHzbOXRttyidQnJyzHmiQWGV
         S51P2Hjc600GkgOnNNvJAKzagtP6ddeD1lKOQRCtjbR8taFvyGaZRBBp+sFe5tJYKhK5
         I5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176382; x=1779781182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ojdXVC2NxdZc5U92Upsaz8ZswxJ7GhnKFyDv+/nulg=;
        b=J0QsC8QqftxjGp1InZAShbd2xlJIVmbqBNZs/nljKS8VdHUhMpNlG08dyqeCZiPJBc
         S8xkJDL0sw8MhF/lLz/Lh6v0OXXgNmYpZAMUe9e2rrdukEVu1P40oMLOaOMv1U1QNwpV
         a7fNU0QJ8HYP+ZkEFBiVMQRGcjxnIq3srpKwiB8p/x6P0SFbI61CW2ifjkdQPTVCwK7K
         ynTmUnX+7I3iAkQtwKgcM11e8cGVuXZuErAoNc2vHbyzG5JOekCay3HABJVgJlfa8Tag
         /dl8W/MEYahp4f/6gsGPNbdnlGUW4M6exCAbvk+ZClrxEvFIUWrRoLORP7YlkdzOTAik
         oIhg==
X-Forwarded-Encrypted: i=1; AFNElJ/8NTLoGYMZdmzpg8UL5F8iqelC6OEsS6vcmTZljD0NhbsgMGMEiU2YWYxz8c+c77ly+4/e69ATWsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5p9By0YQmcHQz9aWNJZJY/0CC+E/nMFUae1n/IbTX7kW1MrFD
	3Jj/cuJRuudB/9Ttf5zhiCJyFfG+1vbLo06oKsdKVdNkGrYu6lMiBrsX
X-Gm-Gg: Acq92OFX5P9HR1fBw6v6ekEyBHdJiZzoqRpW9b0bt34FdwouhooDfD24RU16RChexsL
	xFQPzBxPV5x8vg5yZWtQD0ncEfYr0Wf+/5ofxoZrtjhAoingfXaYehiZw2JnBMrFRCEaQFThc0+
	1puQWibmdHaMRm1BtGF7eJAqykZazXRXIUzKSm+a9Y+HD4yYfPw4qqF6GmH2xhR8SNj591poiIC
	9fpgdtA6aJmhh2udqma9bSo45UMcUgip1EzWSDUGRaL/JB09ifWQrGiLAztc2lQMtJJqO6uSJZl
	28qkx4Y9zhTFlG6h8yWkTJPJbFYWIdxkFrOdk9boPfqFdvR+LnpohP6CZKdPVhpoWgG/idLMr7t
	MzZlIu1ualrSq0aLXkenZUd6S5BLrqYtbBPc8PFDRGR/dNe0gRWIGC5LPr6yV/r0ZwJP1oGGPmV
	x3p0u9UYuiTGK4qlV7sigTtBwPhLvkNRKtgQepfY7Ufs4tblauT2MpACr+s3Zc7yTT5irzsY0nK
	VhguKSV9CMTiw==
X-Received: by 2002:a17:907:8b98:b0:bd3:413d:c51a with SMTP id a640c23a62f3a-bd5178848demr1045827566b.17.1779176381873;
        Tue, 19 May 2026 00:39:41 -0700 (PDT)
Message-ID: <24955932-dbad-435a-8cd6-08301d5201a5@gmail.com>
Date: Tue, 19 May 2026 09:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen/domain: introduce DOMID_ANY
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, anthony.perard@vates.tech
References: <20260507202840.293269-1-dmukhin@ford.com>
 <1778680300.8631fc262581453bbf619ec5b2062170.19e219b849d000f373@vates.tech>
 <alpine.DEB.2.22.394.2605151424030.52999@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2605151424030.52999@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779176382-3774E938-81D6A226/10/73395122804
X-purgate-type: spam
X-purgate-size: 1796
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,vates.tech:url,vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B7F745793BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/15/26 11:25 PM, Stefano Stabellini wrote:
> This patch has been around for a long time and has gone through the
> ci-loop multiple times. I think it is low risk.
> 
> Oleksii, can we have a release ack for this?

It looks low risk so we can consider to have it in 4.22:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> 
> 
> On Wed, 13 May 2026, Anthony PERARD wrote:
>> On Thu, May 07, 2026 at 01:28:40PM -0700, dmukhin@ford.com wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Add a new symbol DOMID_ANY to improve the readability of the code.
>>>
>>> Update all relevant domid_alloc() call sites and harden the domid_alloc()
>>> input value check.
>>>
>>> Also, fix problem with passing invalid domain IDs in
>>> XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
>>> uses 0xffff as domain ID.
>>>
>>> Fix failing tools tests too.
>>>
>>> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> ---
>>> Changes since v7:
>>> - aligned the DOMID_ANY comment with another patch sent separately to
>>>    unblock xenstore series: https://lore.kernel.org/xen-devel/20260429120619.1013440-2-jgross@suse.com/
>>> - added fixups to mem-claim, paging-mempool, resource and tsx tests.
>>> - Link to v7: https://lore.kernel.org/xen-devel/20260408234046.1314021-1-dmukhin@ford.com/
>>> - Link to full CI: https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2508345752
>>
>> For the tools part:
>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>>
>> Thanks,
>>
>>
>> --
>> Anthony Perard | Vates XCP-ng Developer
>>
>> XCP-ng & Xen Orchestra - Vates solutions
>>
>> web: https://vates.tech


