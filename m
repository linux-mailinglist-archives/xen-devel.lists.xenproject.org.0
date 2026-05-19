Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F5CFPQsDGq0XwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:27:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFC457B405
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312638.1582708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGj0-0002uk-MA; Tue, 19 May 2026 09:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312638.1582708; Tue, 19 May 2026 09:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGj0-0002sH-IV; Tue, 19 May 2026 09:26:54 +0000
Received: by outflank-mailman (input) for mailman id 1312638;
 Tue, 19 May 2026 09:26:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPGiz-0002sB-Cv
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:26:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPGiy-001Q1N-P6
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:26:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c2cce-2eae-0a2a0a5409dd-0a2a4509e726-42
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:26:52 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c2cdc-2497-0a2a45090019-d155d036c9e3-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:26:52 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-670ab084a39so7057140a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:26:52 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4bd099dsm682787366b.8.2026.05.19.02.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 02:26:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779182812; x=1779787612; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnO6T7eL0trFh6nVtBYNPzDopteyfzH9V9C8BBvHmKE=;
        b=gTN3DYr2rkcEUd/35f6z6p/nSXuxsUFYNimkFk2a/7wNm+HW9s1CoW2V/GAIXYZ8n8
         777JqzemIn6CJXLQpadW3knDRr1MrfKMzVt1nZG0ULmTKzAcwWpP0sVzFDYO/rZPnBgF
         jYgXLcj6WRj+kw3ezHknO3fBojhr2eJLenS2RXaGjls8ZBPCiOGco/orygGMpy61Dl39
         L6g8UumTwFmkuQAOQf/lZji0qxneIdtq/HNZK7y0f6adAuJjaJRg8ffapHo56rEDPlhq
         NPBewWjsEnCsppOmcQzwq595K/j6Op5DvOOiX2Pt0GIHImCxdDV2l86MqEzl6ScxCd7u
         Armg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182812; x=1779787612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnO6T7eL0trFh6nVtBYNPzDopteyfzH9V9C8BBvHmKE=;
        b=F3Q9IKwIklg0vYZXU81A0bplCeReAxI7XyABqcfKcdzSuxINX2taO24djMEEQCwDUS
         aJWgp891bhD1mS2mNPav37BZoZwR3ngkoka3TDK0GBx4RPd5lnkRW40lNzanylBvF+oE
         Q4/i+rxh9LDTmId9ttWLvQV7o0I07cpHcf3FRYuQqaqEWFdnU40jMMoJ3n+NzcTvKVOZ
         szeT/sliHDufYgUmkmkzn0+JoeX+dhxm+pSj8+DcOw0IuTtSBK9b5TPChf4pcgzL7wYf
         7sm9WRs56c1ZBF2YSqVk5wFZyZQRGc4KDHcL4+gn6o/QTt27o7o9IfwsepzUvn9e+2Zf
         glQw==
X-Forwarded-Encrypted: i=1; AFNElJ9YH5bM96U5qwqQZx8s35stm2CWOeLJscasfjgnAKykQ/Za/3GEps4o+amImEIcHL/qKXuxpkWsex0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwY2cWFnNQbcfisqnzNcH4GiVMS2nro5a6Zt3T1xF9+GWb6Zym
	ynuYWL0M7VmBIcd4wN4QYlzbyvebOfmQvFEMGm80ozCyYnm4ct0uXEaed4QNKA==
X-Gm-Gg: Acq92OEC7JqXlL3zlrE8XEAlqyY81muRVjJWSXl3uZmuX6MkRVGhKAUzr6Y3xOVuGHX
	vTP4QCmO2R4o0X7ji5kr8UplancFXM8r7jmjNTcgIOMcOT7LT0I/scSBRHk3ZhjRvSY0nfWTOnM
	KeyuEtxGstI21XYez3BzQIq49PLxzc3uF1HR014qbRrv9MdF5845LE91Q7Zm16J/XgRWqppQjck
	TZYRUWw5uuMXlHR13gYA16ure6tfRUh/DQnWEyx3dplQ84wogSC6tzOwWrz68It70AP8EF7rjkq
	mg9f8htPFwtCKlT7+gJ02znQrG/udkzL2Dd3PyOLF3JzxG0dc8XG/JIu3ZhfDK8lhYaCMreAe/w
	3mDs8WIqEerGZLpq92jvoDkR6cSXaU4swtk258b4VSgT6PAnLCEcJL2fqdX01ed9WKlHGCJemNl
	PaUZEocqz1owCZQoGFfUsPNvVHzW0hcS5Lmacia+r/hY3BST40f1vLqmKUd6A9/oSydmwOh1zOR
	7C9avJZ1Hbf3A==
X-Received: by 2002:a17:907:3ea5:b0:bd4:c64c:5a9a with SMTP id a640c23a62f3a-bd517aa757bmr1055753866b.36.1779182812038;
        Tue, 19 May 2026 02:26:52 -0700 (PDT)
Message-ID: <92e8f6fc-09e1-4149-b099-4a46e72e2af2@gmail.com>
Date: Tue, 19 May 2026 11:26:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/26] Introduce enablemenant of dom0less
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <0c732808-8bf7-4f8f-9a81-4c649f030a00@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0c732808-8bf7-4f8f-9a81-4c649f030a00@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1779182812-4357BA53-733C9EC5/10/73395122804
X-purgate-type: spam
X-purgate-size: 912
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:cardoe@cardoe.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,wdc.com,gmail.com,cardoe.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DCFC457B405
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 5:38 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> This patch series reprensent a bunch of patches necessary to enable common part
>> of Dom0less.
>> The stuff necessary to start/launch domains will be introduced separately.
>>
>> This patch series is based on [1], but a lot of patch could go even without
>> it.
> 
> What do I do with this kind of statement? This still leaves it to the committer
> to figure out which ones could go in earlier. What helps in this specific case
> it that ...
> 
>> [1] https://lore.kernel.org/xen-devel/cover.1778140240.git.oleksii.kurochko@gmail.com/T/#t
> ... the remainder of this looks to be ready to go in now (and I intend to commit
> that tomorrow).

I will be more specific in the future and specify which patches can go 
in without waiting for the dependency patch series to be fully merged.


~ Oleksii

