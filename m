Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IMcJmL94GlloAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:16:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5024241070D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283668.1565831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDORy-0000uz-Nq; Thu, 16 Apr 2026 15:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283668.1565831; Thu, 16 Apr 2026 15:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDORy-0000tm-LA; Thu, 16 Apr 2026 15:16:14 +0000
Received: by outflank-mailman (input) for mailman id 1283668;
 Thu, 16 Apr 2026 15:16:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDORx-0000tg-BC
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:16:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDORw-00EVg7-Nj
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 17:16:12 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e0fd15-5cb7-0a2a0a5109dd-0a2a45048d66-44
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:16:12 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e0fd3c-1dec-0a2a45040019-d155dd32c93e-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:16:12 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43cfd1f9fd1so5210761f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 08:16:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3ebd38sm15135081f8f.31.2026.04.16.08.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 08:16:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776352572; x=1776957372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lryr14uWjXql+DBUqhr+y/rp93dt2ZB+sZGWum38uxM=;
        b=r0V1fwjNukafO0huUW8bzgcsAVscatDu8CiO3VIWrA9aybxU9YPbtUpFRyoDrG2iHB
         HPBmgmdxYFx6RqXleUVyAi9FMsmvIApmrH0Zly9xbbohuSR+Sp0QlJkty+PicbcxA2jT
         Lp0tSipfUi1707GZeMj4Cg/LOzcTTTvAQ9vk/FMG4V/TrJ8Pm69rH8AzNZdjI3kX6eut
         Y7co65o6/nW+WWDfNCAnix6QFu5HW3riM4uhIjtMOr0Y1spQwV2OtIEfDzBD4wuRJzhe
         ASlX81jDpLMbSj97oXj5nOEGMcXM3Bh8I3T6tFXRYpWY39McA6C5MvAWKtYprXnSgKwk
         sCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352572; x=1776957372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lryr14uWjXql+DBUqhr+y/rp93dt2ZB+sZGWum38uxM=;
        b=CMDQz5hViHVVucaVqqseFRTFhVIdxJDIBrYTzFcZYGn8e1JjHoDhg0UerOAj15zt3S
         o7fFbwMQ8srBSCi5BwlEt2eT7ISPBZqj3T0WfYwxW+0lyUFLygYy3bDEm5DBc3eU82xX
         gF6sT/Y/N6cpQ/fZJruDWUIO/K0ZHuNZCnwvmgkF10YObImOl1XsyMBhVPBwyAp6gXtE
         w/MWTrwWAeo1qI6AjsLjmmXQYZNEsWrJDtAEzTL7ayEUSasSD38G9AfPhkbpYgPLe91y
         +U0fGUWzd07obfcXR2GBotrhZdd9DF328mzpL8OaMLELJbs6Kq3hUJJfzW6TlGjpgVxi
         w/yA==
X-Forwarded-Encrypted: i=1; AFNElJ8S88BOj14hQ2fryAuZjRjcJf8NYwZpWV7XQBKpq826sEqCon8OLPqHxxndshoGp65gsgIcVYve+iA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvFSeXsFgNZMQ/wSDRpvuk7af0Uk+9OejyQAiTygkMYHQmGj3Q
	GKmU3Bt92LlA1/Lf7pHCgurIf5lNFbDf3azOHJffI6yfOkoZ+qZwF6TZ
X-Gm-Gg: AeBDieuUcbuRSYMI2XmcZDsFUUPLbcGkxXThjVCbzi4c8ODtej2TGKbBfqet7+fHpFj
	MIBfHme3tlaAPs5jgYQ23v2VSnRPWsEZEuMScmVMAnuSmPisnxne3rbdiknpmET5efbkUD006OL
	mTerN65A+WN2VRzYW0TBiyx8VlanH8vof0UEJMD0RU1xKWv/PQJTF1I9FjpTYIHSTtwGQCh0NWv
	0ZQAVjKBpyEa1arAQXAKusWPTYzqmhJScCuZ+IuKBTF+jIEfS4m2ph4qJiDgclgHfvzmZRqL3fR
	CwGq7CWvggfS/J9F5duFeed8NAmMiQ1SPVv1Wx0YGks4vTXzBo08p5Y/F4JCW/41fe9uX5GLm7R
	DeWzh+mg3ta2Bmj2RfyJHvZO/V56EIo6/43GkJjQ49OzZStUp4oSZkY5DvUz4CXJC3szC9Apovv
	ham+tK6TYjKkUFvZgSAVSKa0zUm5zcOWCcdDxiLeGjtRsTR6pQTZLM3tffjFONjrc0xc4fUpPo+
	WPnA6O0CdQjlM2iG41P+698
X-Received: by 2002:a05:6000:2403:b0:43d:4b00:9ee7 with SMTP id ffacd0b85a97d-43d642d1b1cmr39446558f8f.33.1776352571943;
        Thu, 16 Apr 2026 08:16:11 -0700 (PDT)
Message-ID: <f8673ca0-b625-4a7d-9801-48cc5a48bcf1@gmail.com>
Date: Thu, 16 Apr 2026 17:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com>
 <c48562eb-e22c-480d-a736-9037a8c6c2ca@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c48562eb-e22c-480d-a736-9037a8c6c2ca@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776352572-4B3673FF-0144E247/10/73395122804
X-purgate-type: spam
X-purgate-size: 504
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5024241070D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 1:34 PM, Jan Beulich wrote:
> On 10.04.2026 17:45, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -396,6 +396,8 @@
>>   #define CSR_VSTVAL			0x243
>>   #define CSR_VSIP			0x244
>>   #define CSR_VSATP			0x280
>> +#define CSR_VSTIMECMP		0x24d
>> +#define CSR_VSTIMECMPH		0x25d
> 
> This list looks to be sorted numerically, which you now break.

I will sort them.

Thanks.

~ Oleksii

