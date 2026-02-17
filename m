Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLLHET+JlGmxFQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:29:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E19D14D925
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 16:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235149.1538205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsN0R-0006uH-6H; Tue, 17 Feb 2026 15:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235149.1538205; Tue, 17 Feb 2026 15:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsN0R-0006rF-0z; Tue, 17 Feb 2026 15:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1235149;
 Tue, 17 Feb 2026 15:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsN0P-0006qe-Lm
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 15:28:53 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58ff8469-0c15-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 16:28:45 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso35250665e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 07:28:45 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a3647asm108277915e9.22.2026.02.17.07.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 07:28:44 -0800 (PST)
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
X-Inumbo-ID: 58ff8469-0c15-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771342125; x=1771946925; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SEC8wNtR0aHxyEtQVj9l4OAuk5+mxZl0JEVCvALBNvQ=;
        b=jPV/lAfcKfX1DYHKJzEF6z7mYUkxFNV0XdqYNaT0hkvbYM4l7EzLaaaMViSDbjVq8G
         Nqe7KWng8+WluXU6q/4u7Nfsf/6UDkCaRgIgqk3tg0DybUAtJA8z+OJy4xZ9SLvckTXG
         cbZ6/aNVNW4QRIjsjDKLHpclQ5gzevT2qb28iEbOsPkS+FJzOsTI9Rno6rjXBHF3VCb4
         DcHgeqbYEl0QEIgvK3Rt6Opq7QoHEIwk1QR/t1rKn29LBy0E977gTW4wNaICo/D2vGX2
         715FenIKns7KRAQIP6IwWDH/bDXOaaLbgpqQD6XQW9sikXLN92jOntsWkDPNT5K+uC61
         oMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342125; x=1771946925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEC8wNtR0aHxyEtQVj9l4OAuk5+mxZl0JEVCvALBNvQ=;
        b=JMYTqDEzBza4+S+MwIVEcka2Iqo5yJgLxUJyWDGYobqdcprISx01qoCxnDk+z0HpJY
         r6yC+ox7Zai+behCru7MvtaDc3cqGA+Cf4Zt+gVsrpCz+mRerZ3QU3lrgcFz2bwyfmH/
         GEKOAUknbyBkiSnIkZB7hq+PUwlJtNRWU8x9Znfa3nNryaU08tsxj4n1YSA0CSMn3N8S
         W2c3iEvn7Sn9NujftxuxfJKlPYZUgoik1x/Wq7ZiHpN9m8WZ4tuOiXwv//dNurVTnTCw
         EBVn0lF8ypCAhEg257RGwO7jG5fuzvR5I4LAxPRVeAr77+68mqGHt6YVVczBut82+dkX
         2O3g==
X-Forwarded-Encrypted: i=1; AJvYcCUxzzi9Rb+W/I/5k4SBrc2AsiL8CX9hCvuZ4kp5ioTbNkPnWTrgieRQUZ4n9ygI1sExe+nSipvSa98=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAPpAPd372Lu5msMLlkA3pHooVm9p+VrNJ90wgA31E4Iyao3Ce
	nTZl8nPfT0EUwPCS/PzOPlSNG0BGFp8HXWS1rHYuSGuG8E00jOMgA/f9
X-Gm-Gg: AZuq6aKVubBlgUp20+Z5b8I9bFkVeUUYQz2TGqOiHFmfTtno0C4hQMIIWAgx9Cbmcpu
	wAj7jF2jVwxyWDpfNL1MRkKg5LxOfgDkDFC5xOLIQU1q+K1uX0EXXBEil3vjnYV3XbKuRKJ7hQ8
	OMzxIjVs0xM7uPQOhk/An/iHFpoIOyOJxvgOyk0WvDTZS2ZIa4A8Y/aBXQKvc7Rnnkt3s5/16sp
	FPiXVqn6rEiqslBvRrI1IiMqQlE6Srz8z+oiCRmbme12/k+BX2MLK3kLtATqsbeUwjctyGZ+bX7
	x9hFUhIJCF6T1BeMdoM86Jk0D6ZwycR2ox4SMxvb2+fVRxL5Cm+xf/P7HMKur+L8FUrh2117dgw
	Xh/aQgScMQwFDMUbIc3CgCmjkPLi1QvTVLAJrwG8JuDe7WYe836+0Cft74EjNwP+mvbXJ5HKZlj
	hWni4JhxbLBE6BrVyL6zuH573okbof9I7FV8D3WoxW2UYCi82ay2sqpGjeDxt31Ql5QFEG2Ts8Z
	2O0QKw21Gap9w==
X-Received: by 2002:a05:600c:3d87:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-48373a5d6d5mr205557355e9.23.1771342124745;
        Tue, 17 Feb 2026 07:28:44 -0800 (PST)
Message-ID: <ad227fe5-7ffe-4c80-aebf-cbaa89ae9636@gmail.com>
Date: Tue, 17 Feb 2026 16:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/riscv: add zImage kernel loading support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <308c5bc1de15b23c643d48f975799739f44dde8d.1770821989.git.oleksii.kurochko@gmail.com>
 <0bca8843-9c52-4544-88a6-87ddb110095e@suse.com>
 <f95c9cae-0d57-42bc-b435-3f29c54b67b9@gmail.com>
 <4253dd88-b408-43dc-90d3-f2d1d3c892b0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4253dd88-b408-43dc-90d3-f2d1d3c892b0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3E19D14D925
X-Rspamd-Action: no action


On 2/17/26 2:02 PM, Jan Beulich wrote:
> On 17.02.2026 12:58, Oleksii Kurochko wrote:
>> On 2/16/26 5:31 PM, Jan Beulich wrote:
>>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>>> Introduce support for loading a Linux zImage kernel on RISC-V.
>>> Before I look here in any detail - where would a zImage come from? I can't
>>> spot any support for it in Linux'es arch/riscv/Makefile (whereas
>>> arch/arm/Makefile has such).
>> Good point.
>>
>> It is something that should be renamed as not Arm64 (Arm32 really has such
>> target), not RISC-V doesn't really work with zImage. They are using Image plus
>> Image.gz as compressed image.
>>
>> Maybe it would be better to rename kernel_zimage_probe() to something more
>> generic kernel_image_probe().
> Well, it's two things. In the description you explicitly say zImage. That's
> simply misleading.

Agree, it should be just Image, I'll update that part of commit description
in the next version.

>   Renaming the function (if indeed it copes with more than
> just zImage) would likely be a good thing too, but needs sorting with its
> maintainers.

I will suggest that then in a separate patch.

~ Oleksii


