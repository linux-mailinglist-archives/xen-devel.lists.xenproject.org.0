Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s8f5AvCJMmq91gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:50:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F61699467
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:50:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kteTZ6bB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340344.1601394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZomL-0007Gw-MB; Wed, 17 Jun 2026 11:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340344.1601394; Wed, 17 Jun 2026 11:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZomL-0007Ec-JW; Wed, 17 Jun 2026 11:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1340344;
 Wed, 17 Jun 2026 11:49:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZomK-0007ET-Em
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:49:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZomJ-008uUz-Rb
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:49:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3289c1-2eae-0a2a0a5409dd-0a2a4505b4f4-42
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:49:55 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3289e3-aaa8-0a2a45050019-d155dd35bdc8-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:49:55 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso3198173f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:49:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26392esm52807421f8f.3.2026.06.17.04.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:49:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781696995; x=1782301795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+JmMRdiQ2ZDHjhBhjtyk7zXEv8dXcz/l8u/XLNspV8=;
        b=kteTZ6bB8Vnapr3F5O2w7IfZdk2ggS9RETiew5V3lBfF55h9HyHe5Y3J2lSFuthOHt
         TPaoS0/HRmjMdwTahn+oxokvUysO3RinOmfxyslY84uuQSETIYJ4GkVsoyb7ew7iugpM
         ZgNAeBLwcBGGCz/cHM/p0wTWejjHwXONswtt9+0UT3IaYOiAwn55hO96QPCkoT8th7m3
         wtX38ETFxscubyJZxeOj1sV3v3IZeIaYTXfxliO6i322SOw1T1XqOOGIsfwi0YCncTRg
         pPFivuRe8ups3A0hUQ3CPnIblVlGelWKFP6GYeYIFmggt6LxS+hPF64EOIgumR13jIN2
         Jyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696995; x=1782301795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+JmMRdiQ2ZDHjhBhjtyk7zXEv8dXcz/l8u/XLNspV8=;
        b=aU0uWT7Gx1xXCtGkWIBnpENC98JhU2fXqkFS26OarZIO2G2/hdcXW40kVZD6LhBpe+
         V/+lhNo2Er8w5ryZHiFhJOZyaKln9ycWQiwm0DaYEnpCVi8KCr1W2Tf8KRUzqz2CKdJF
         QDCsv9m9c5JOxZNM/8VtclBVt1QtYlwznboxarg6n2YLxweMxsWQSzcPzX7B3NcCQEFi
         Zwn4X9CkKSxqfsgeprhDNu/uB7JhJ8u3413Sj7U7SQ9MbvMy7Psr9yzRrP83NX2V75sV
         wmChNQBRcay/j0i57BbVnKOIL9+GAbjBPCXb/zLF4z76clJSQOIyeY1R8G5sXvL19XgM
         cvqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eBInmnTzjkFheesF+L2Bsp1NxpqwggUft6wlsDkvt4TwfxobJRomb3arAOWVESxZZhOm85A4JPf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUPmOclWkKDnnoJstxcKVOnY1rTUyOfL11hb6lPvZzqrNBVczs
	ftKpwjt1fdH43P4iKn4ryIuhVGBSk0bmalQa6ThGcWDc+2IGyaKoey4c
X-Gm-Gg: AfdE7ckxMPFEcZJ0wVvlOSUU+mx3rjASif52Fweghf0s/zypf2nlcHbbKq+ecOPHEu5
	873MU4eCjSYFjMe0Mi0MN0WtGFGtlZ26xjMFenMLqHG4BzOHQQEHqi/fKc63lJfS1I/+sxefxqM
	hgTN/XzjsBtXKAUSIuweG5BNIXZ+7zOWWHD981tuBYIW90wITPJQI5nWyCh4oZgrTIq3HkHPRHV
	CA8nRNc3Y6SoYvYSveoKyVYytznqo6a6itK+y6LV8uWsi+Oi/Ob0Uv3VA/3WeI5xWv206WRMpnx
	2xfNEw1JmpAktGNEqfBtJgYn4H7n7hw6G1QJx0tCVQS9K3RJWVsk1YaqaiOtIIL87XCRslGOLxv
	rdY2LUQBSc7kgyGJG9VHXhnW4S50zuAWUMltUbdUoESxjJqM/BGaG+f+tVo5fs4xsel2UFQlEPK
	I7q4B+f+l9crrxHCY1zNvgAFe+q8PX22ZBvzLV1Jumx1+z8gASDfGSj2cKAiDvCfflGso=
X-Received: by 2002:a05:6000:2088:b0:463:1885:6b72 with SMTP id ffacd0b85a97d-46318856dfbmr2298480f8f.11.1781696995086;
        Wed, 17 Jun 2026 04:49:55 -0700 (PDT)
Message-ID: <c4538a3b-23e6-4bb5-bc12-1bfd32095d16@gmail.com>
Date: Wed, 17 Jun 2026 13:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/23] xen/riscv: implement make_arch_nodes()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <738f97f8ea8bb588742c3f03d3cb2d24f399b602.1781693963.git.oleksii.kurochko@gmail.com>
 <d55f0b2b-3352-4d05-85dd-9c89b73bd338@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d55f0b2b-3352-4d05-85dd-9c89b73bd338@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1781696995-E2193443-97D37A76/10/73395122804
X-purgate-type: spam
X-purgate-size: 662
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6F61699467



On 6/17/26 1:30 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> No RISC-V-specific nodes need to be created at the moment,
>> so make_arch_nodes() is implemented to simply return 0.
>>
>> It is placed in dom0less-build.c as make_arch_nodes() is
>> only used in the dom0less code path. In the future, it will
>> be extended to create an emulated UART node.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v3:
>>   - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
> 
> ???
> 
You gave your Acked-by in v2 of this patch but I missed to add it.

I am really sorry.

~ Oleksii

