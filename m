Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gT+oJIkkTWobvwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 18:08:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5A71DAD6
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 18:08:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qRfPinQK;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356403.1611038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh8LM-0001pG-3x; Tue, 07 Jul 2026 16:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356403.1611038; Tue, 07 Jul 2026 16:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh8LM-0001nS-0p; Tue, 07 Jul 2026 16:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1356403;
 Tue, 07 Jul 2026 16:08:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wh8LJ-0001nJ-Sk
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 16:08:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh8LJ-00EcjV-66
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 18:08:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4d2455-5cb7-0a2a0a5109dd-0a2a450bbc16-38
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 18:08:17 +0200
Received: from [209.85.208.176] (helo=mail-lj1-f176.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4d2470-ac48-0a2a450b0019-d155d0b0b089-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 18:08:17 +0200
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-39b237fb695so39194001fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 09:08:17 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39c623cfc44sm6565081fa.14.2026.07.07.09.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 09:08:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783440496; x=1784045296; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWxMpHg7lAWkCq6epiSXOIyG9B64F/IjH7XWnjuduO4=;
        b=qRfPinQKxaLqqO6krowpx5rYAolyw+SVwpoZ3tyesz/XUKCItIL35KXC9ZQNcad9/R
         UN84ybvv/wRhZ3ydvN5R6NuLy5MUgS8/qLo6aF8yMUuHgXlN6t+21QFry4XiF8s3cFzh
         d/iV0lyF5jk3LsVLzgGGqJyidMqPrwJwJy4yLmX1FrY+9AbmeSovJfJAaBzXqYtw1q8Y
         QWU/0Ko0KEqIlaU/oRGYjWJhiAtYxr01WxRjVusQEav7sBjbrTUExFcuA09xAI2mWNWm
         ZnENGXBv40XgLYAfmkiindbKwSqrcMMkidd5pZAdanwhe0QqyxkTvOnMhDC7YrLvKcd+
         1mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783440496; x=1784045296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWxMpHg7lAWkCq6epiSXOIyG9B64F/IjH7XWnjuduO4=;
        b=BcsqdJc3snA3kW2VN1Yv1DWxJoFZVambdJjq8FRbLV8Oddg9eVhkFVz++7M3bEIEww
         Rhugsd/ge2uSfiSaNCXRFcwSD4g97Pi+unpmTT1SC2S8k9/9Ga9MixtZeM/a0gfvMcBg
         oceVM8EeP3ypi7b+gOmDfprEIJ2y72n+ytFTq9DvdAMgARlS+eWBwPnB3Ra7KDESc9CZ
         QW3/WfDNomkHaq3LLVi/1YAWB9Ug4XIOO5SvD+xOQgLD4EQJci/dNcLBkHaz6NN3B8Kd
         NshCJcCsyZAFW+pqJN+SDBEEaBLSZRlTEy5eg2on4lxzPSlsJ3y9Vzqw3ChNXK0J5pe8
         SVTw==
X-Forwarded-Encrypted: i=1; AHgh+RqHauLdDuktm1pPXyzw/+JKz7VkwIamB42M0cjYY9RXYBnx4OhR5uuwD/qN+78HgYTy+z1lsT4jzwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTpETPHhwYGMkyF74T3eSxR/v4fPl3g5kYhr23LqgsfplpdU2E
	ExXXRN3el0ZQ/sMiWJMCA/NQiL1/nTGneoL6ewYb7yJrpgE8rxIflxC+
X-Gm-Gg: AfdE7clziYpVeXNCR1svkQbunj44SKYAYr0npttPd/RHC1X99EC6uCc2r8o1psi3aH0
	b3K/Kjzs4u0tqeCMKnal42vQgcOaZQQA380S/SM8UL4V/ALlgQi0SCJ6Sm9JFU2o7olRlwDGoXi
	e2hkXoReckZyEe9ei/13NdYYrAybY/huhN3+zOTnZJQ3r1zTx47oZ1UAtq60CxfVvjG6YIcGIH2
	XP+9J8n/2nLWzclAQSDoWaR+yhmf/7EBL3lLQ5/MB4st3TH46eaxLI32UUV8Hy42765XMN8o1i6
	nu5Y7rd047Aonhz4/BFUXy3KH4NTvsGJ4Zzr3+li4c6ANVLTtyx1LvnzYLiavWeKiXpzq4uIuo1
	J8kFoPf4qZ+JqctUECQh8GiI9phvsBj9ScsuEQr4fKvfzwXKOVXx7hbUbprT4g7H2jxnPoNCFYG
	6Ika3siePKHq1Ep15g5hJOVD5/Rutaozi05mLa/nCZV/KDSeGiAJrrhxfgTbPzIRn2zKM=
X-Received: by 2002:a05:651c:2206:b0:39b:1f5:e041 with SMTP id 38308e7fff4ca-39c6006d7dfmr13205781fa.37.1783440496054;
        Tue, 07 Jul 2026 09:08:16 -0700 (PDT)
Message-ID: <e494980c-485e-4dc6-ba84-e40fd53442d6@gmail.com>
Date: Tue, 7 Jul 2026 18:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cce2493855ce3b610a2d36cbcd149292254170aa.1783436517.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cce2493855ce3b610a2d36cbcd149292254170aa.1783436517.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1783440497-A5B20220-024207E6/10/73395122804
X-purgate-type: spam
X-purgate-size: 2148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: C0C5A71DAD6



On 7/7/26 5:16 PM, Dmytro Prokopchuk1 wrote:
> A malformed provided partial DTB specifying both '#address-cells = <0>'
> and '#size-cells = <0>' causes '(address_cells * 2 + size_cells)' to
> evaluate to 0. This sum is subsequently used as a divisor when calculating
> the number of regions in the 'xen,reg' property:
> 
>      len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>                                          sizeof(uint32_t));
> 
> This leads to a division by zero exception in the Xen hypervisor during
> boot, causing a hypervisor panic/crash.
> 
> Fix this by validating that '(address_cells * 2 + size_cells)' is greater
> than zero before performing the division. If it is zero, log an error
> message and return -EINVAL.
> 

Fix tag is missed.
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>   xen/common/device-tree/dom0less-build.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index eacfd93087..6796851844 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -154,6 +154,13 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>   
>       /* xen,reg specifies where to map the MMIO region */
>       cell = (const __be32 *)xen_reg->data;
> +
> +    if ( (address_cells * 2 + size_cells) == 0 )

Considering that this calculation happens second time here ...

> +    {
> +        printk(XENLOG_ERR "Invalid address/size cells combination (both 0)\n");
> +        return -EINVAL;
> +    }
> +
>       len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>                                           sizeof(uint32_t));

... I think it would be nice to calculate that once.

Generally I am okay to not declare local separate variable for these 
calculations.

With adding Fix tag:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

