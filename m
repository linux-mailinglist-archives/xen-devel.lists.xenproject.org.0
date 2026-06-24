Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sLqhJcbAO2r4cAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 13:34:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19AF6BDAFE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 13:34:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=G4r2NjE4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344831.1603859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcLru-0004rC-1P; Wed, 24 Jun 2026 11:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344831.1603859; Wed, 24 Jun 2026 11:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcLrt-0004p2-Uf; Wed, 24 Jun 2026 11:34:09 +0000
Received: by outflank-mailman (input) for mailman id 1344831;
 Wed, 24 Jun 2026 11:34:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcLrr-0004ow-Tp
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:34:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcLrq-00037U-TH
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:34:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bc0a1-5cb7-0a2a0a5109dd-0a2a4502c186-44
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 13:34:06 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bc0ae-5a27-0a2a45020019-d155a730d03b-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 13:34:06 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5ad4c229861so669496e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 04:34:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad6954a4bfsm1680733e87.8.2026.06.24.04.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 04:34:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782300846; x=1782905646; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g45lG256BOEf+Fec+r2sXcrak1LrUUumSAl313u2QZ4=;
        b=G4r2NjE4haYpXRCRScnCjXt2YAj2u96zqB9vLp4KhAhsyE7/lOL+rMZE8JbY9/kFB2
         jNQCjEnVrLWYH9RtTpHa7pv7UwC+1WOxL+IKOSdbW5bERxbYia8ZsAf//W1k2fRs47w1
         WDggC2+cbxV+p818qGQuLwL2UmfACmXSTcv6OPhlHV9qD7jpSCgaimKnjpmtUozqfYnf
         3lDeVCVASVTdGQm/V3bLh2D9SPkkA6w3I7CEZ9gbom2/aS3FFr7BHkZj+NVLBoaS2pNj
         Ez/GX5XIVgKlpJxtVxSfPU+19kgWqGJlPdRTYag6Hi4+0qwAZpIIqFC6roQfbiUP659M
         SmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782300846; x=1782905646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g45lG256BOEf+Fec+r2sXcrak1LrUUumSAl313u2QZ4=;
        b=C1CndYBuWAYYanIeFaMs6av7a/43MfP7yN32CUhqEJFsO6Z8NZkOjoST1EUAbOk+tB
         KSR+zIbLngT9huXQ+lLGgxFxVGkjRBHloV1KsFRu24SZsv2C2u9lVk7NCoxMNCE1E8vb
         PVElBPp1I14xaklBU59VqXWZfKxSoP3QfXL//cl3qriPiw24ryVqmsw7+NpnBUUQ9W5a
         uJd3CYTDa5q7K6IUU7fFYKWSgLXF716cT6YUcfagWDeVxuHabaECnzqA4Zsh/OBhH2WN
         DAZxkzH3Sr61d9TF5UAl2UOcM5GITumF7KPZE0ep2YNVFasj2nV0QJkBhQDQxw4+R3N3
         q1qQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+JZO6jDdo4L6XxFGt2npeLuEQmCW6H+XxQ5o3zuh8zx1jJLewmFygxoGJAo/Dp3khyyOSv+rRWPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1XXg+/Wx3zjt0KabuaC1PYE97CXls3zJHkdaCulJlTFW1+gSG
	YursC+knU/zCBNrbFOlCgO2ZA87mDcqi0BmapxSheRMwjfIfRlHCyR8U
X-Gm-Gg: AfdE7cl38H3hIWEQxPIs7avq/YoBRM1LJqMIjAoAh810lCHKgjTd21/9g3FEXoJpbn1
	v7HZ/p/qLbEfiZwEybma/1haTyOgzLD44T+eMyFHnkCDIFkcg6Mkq7OCE4WHPDJfF8nTmv79gxO
	uI4YWN71a+m+bbVYQTJ5jEQQa/L7pg0qrr5gTYYkhPl5hBu7cWswDSVa8CSH+Y3mNzj7J1hAYUu
	/KxH2Zo0WbJ38cip2NBAZejZUVi2b4ovOGzSAYz6OuBcEavvzlynNIAJDFukSwDFYU4zEN7DCVL
	e6ErBMclx+xNoHocfhiPRN7Ce520nTvJ5FEjlH7FZDGajG9Lwp+tjArlSXdGRAs7c9DFqmpJfEq
	Aw/OyVUwZia/IG6GK9aYoHDsk9Q5tOAZeG9gKo4iuRWC7tCNnWDS+b8EO4QDcjuuy4bqDqexD8V
	RZVTFIkMhBd17wXor/Hs/jzBTQlzIGt7KhG1Xhw/EUv5krmV/pbGXPZIT8BbhlXK3vfQ8=
X-Received: by 2002:ac2:4147:0:b0:5aa:75c9:d304 with SMTP id 2adb3069b0e04-5ae9d57c9c2mr639377e87.31.1782300846020;
        Wed, 24 Jun 2026 04:34:06 -0700 (PDT)
Message-ID: <81b60619-28f7-42e9-a6c6-be9016fe5918@gmail.com>
Date: Wed, 24 Jun 2026 13:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/23] xen/riscv: introduce init interrupt controller
 operations
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
 <da217bc51799d46666a740f38e00efc6de554ffc.1781693963.git.oleksii.kurochko@gmail.com>
 <1bb1a400-ed4f-470e-8f20-779d2c09c03d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1bb1a400-ed4f-470e-8f20-779d2c09c03d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1782300846-4CB077C5-2BB7302F/10/73395122804
X-purgate-type: spam
X-purgate-size: 1348
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: F19AF6BDAFE



On 6/22/26 4:30 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> Introduce intc_hw_init_ops structure to avoid risky mix of init
>> function and non-init function.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> 
> Strictly speaking ...
> 
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -306,12 +306,16 @@ static const hw_irq_controller aplic_xen_irq_type = {
>>   
>>   static const struct intc_hw_operations aplic_ops = {
>>       .info                = &aplic_info,
>> -    .init                = aplic_init,
>>       .host_irq_type       = &aplic_xen_irq_type,
>>       .handle_interrupt    = aplic_handle_interrupt,
>>       .set_irq_type        = aplic_set_irq_type,
>>   };
>>   
>> +static const struct intc_hw_init_ops __initconst aplic_init_ops = {
> 
> ... I think this needs to use __initconstrel, as ...
> 
>> +    .ops                 = &aplic_ops,
>> +    .init                = aplic_init,
>> +};
> 
> ... both initialized fields incur a relocation.

Isn’t it needed only when `aplic_init_ops.{ops,init}` is saved in a 
variable that doesn’t belong to the `.init` section, so that a potential 
dereference of already freed memory could occur?

~ Oleksii



