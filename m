Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEPVLGI4d2nhdAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 10:48:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3EA862ED
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 10:48:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213448.1523917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJCW-0004GE-90; Mon, 26 Jan 2026 09:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213448.1523917; Mon, 26 Jan 2026 09:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJCW-0004EJ-6H; Mon, 26 Jan 2026 09:48:04 +0000
Received: by outflank-mailman (input) for mailman id 1213448;
 Mon, 26 Jan 2026 09:48:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrcg=77=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vkJCU-0004ED-8R
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 09:48:02 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14a7a90f-fa9c-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 10:47:51 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so62928075e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 01:47:51 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d6160d2sm103200715e9.2.2026.01.26.01.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 01:47:50 -0800 (PST)
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
X-Inumbo-ID: 14a7a90f-fa9c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769420871; x=1770025671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xb3uG/R5vsjL2a359RoPR99kk2+Mo9/RkJpZ4UJlyzU=;
        b=Ruqyx2sVGwk0MfLM4yNN1/gPi2/SrRM1LKC+OjN8DkLfPyh/UCoqznL0A13x7g1K2b
         1kq6rCH2n26oiDglJuZwjLwN39rvFVU0WkRwI8cF5qo4jcUUBjNhXk/myU2JXkPJPIyu
         YY5mCfeI7eSfZZKJ+XbMK/976WJDKKspGxeT5n5B2VuTDFXfro3RtH9GJvErZek99hlB
         doQhY0sSz0w0/ZGhGlAjk9HDop+8gRaPQy/fFMyRvZsyaR8bJkCg5+YUhzHH+6XjFKQt
         H3wFlOmBuXGrEmx/pkBGyko3DY1TX/O6rFrgQMNsKcWX3p2GYdzyy3R9EI3VZYo2ytOr
         m5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769420871; x=1770025671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb3uG/R5vsjL2a359RoPR99kk2+Mo9/RkJpZ4UJlyzU=;
        b=cFTmQvyceKI+RHWXwejLEkdQN/INqdzat6M9lL1umNYJav2Mo5BWbpQDDhrFgGvfVr
         m379UbtBpjKKpjUXJJey5CdaZKSeeNJ+LIpNmYOhV/g5Lz2xAZrNbtNs6zKNm7r+o9XR
         PbdKIG663e5FS8QvRVnFKfQs6XvayNovKO1k1teK4cCkthHrYT1z6fWbrb+HbvA4AfZu
         cSpUruepZ923pwjnLuAHxUz5GfZ8TydAbzlshD7xOMz1j3FeMBudGku4ZTmYNgBEADsq
         Y29b/CDA4yMa2MYXsHQOGGkWPwI38fje2uKoWVigpxtdOg/sl0wfeU9eHIJ3pQH9GP6H
         /2RA==
X-Forwarded-Encrypted: i=1; AJvYcCVxPfxAxMVfMc9O8zNfqFByoeCsRlzaGBOTJLbj/sDTIJqrIb/rB8UoJjKY7c8cNpEUyCYsf1Z0G5c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzO5H4mOPquq28hXo76C/15vYv/R/92A2HSOsHYnoWLYb08O5Gb
	m5UVKWyyEhw8okT70aRyxAVKoKqFC7st2BY4QuBAuw14ZVfrtOtIHavM
X-Gm-Gg: AZuq6aJ27lksY0ULrDmtBYGDYltP0czNh2tepmRH2khRm4kvHPOY1YhqbY6+boglR0x
	c1rHmWh4AVES0C9gZJdSMuEe21jEVFM/aBvka5kP6AgskSN/pSDh/h3OVSvuAzj6vRzJ6HJd47v
	/6DTX/GKqIaRVcUVqqxpVmKvn21BmRvLNZY+84hChdtgAs5XH4Ohg7hsx6hJSkuY0TWxXLIscnp
	UW3ccs9Owut8ssoOcBqjJA/AoM/peiSrxPcmvYk14+eOOgTcJYp+YXg6AEYfhYChrwp29SGvVXg
	rV4A7BvXs0eeQKXgxCRClw0VLpj+IYViDcY6LcsDNapBowEiPgkSYdbp44MrOdYKMY9uheFbwhr
	BBYTm5/G01lHZ7gr0lZVWwc2jF8/cT8pRbxbEXa9fAmkjtu0L07kWZtNaVhTft9c1f04SMotMfw
	z00bgx3Yb0f3++kjDx35qie4ENRrzeJHM0hL3CGCYSI5tcHxrzt9awXz2nMPUFZ08=
X-Received: by 2002:a05:600c:3f18:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4805d06ae8dmr63545045e9.32.1769420871012;
        Mon, 26 Jan 2026 01:47:51 -0800 (PST)
Message-ID: <e184e146-b7f9-4ea1-bd14-af51c5ab201b@gmail.com>
Date: Mon, 26 Jan 2026 10:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] xen/riscv: implement vcpu_csr_init()
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <57ef3bcff854d4b50641641d300b3e8aa715c3c3.1769099885.git.oleksii.kurochko@gmail.com>
 <99289a63-b4be-42f8-974b-7445a6a479dc@vates.tech>
 <da0a5819-f811-4eac-95dc-9c8d33ea91fb@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <da0a5819-f811-4eac-95dc-9c8d33ea91fb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1D3EA862ED
X-Rspamd-Action: no action


On 1/26/26 9:36 AM, Jan Beulich wrote:
> On 24.01.2026 23:44, Teddy Astie wrote:
>> Le 22/01/2026 à 17:49, Oleksii Kurochko a écrit :
>>> +static void vcpu_csr_init(struct vcpu *v)
>>> +{
>>> +    register_t hstateen0;
>>> +
>>> +    csr_write(CSR_HEDELEG, HEDELEG_DEFAULT);
>>> +    v->arch.hedeleg = csr_read(CSR_HEDELEG);
>>> +
>>> +    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
>>> +
>>> +    csr_write(CSR_HIDELEG, HIDELEG_DEFAULT);
>>> +    v->arch.hideleg = csr_read(CSR_HIDELEG);
>>> +
>> To me, that feels odd to set machine CSR here. Especially if (I guess)
>> that we would update them anyway during context switches.
>>
>> I think it would be better to have :
>> - vcpu_csr_init -> sets initial state CSR in vcpu structure, doesn't
>> touch machine CSR
>> - context switching logic -> loads vcpu-specific machine CSR from vcpu
>> structure
>>
>> We would have to make a context switch to enter the vcpu for the first
>> time; but that's to be expected.
>>
>> With my proposal, we would also want to move the vcpu_csr_init()
>> invocation to the place we initialize the vcpu_arch structure rather
>> than the first time we schedule inside that vcpu.
> Aiui the writes were put here to be able to cope with r/o-zero bits. Yet
> indeed it can't be cone like this. While it may work for domains created
> during boot, these CSRs would be changed under the feet of a running vCPU
> when done this way for domain creation later at runtime.

Why these CSRs would want to be changed when we have already running vCPU?

Even they will be changed what is an issue, they will be sync-ed during
context switch.


>
> Instead, as I think I had also suggested earlier on, the r/o-zero-ness of
> bits in particular CSRs wants determining once during boot, and then that
> mask wants using when setting up vCPU-s.

Somewhere even before create_domUs() will be called?

~ Oleksii



