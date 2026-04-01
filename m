Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABmwHaAxzWn0agYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:54:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD03537C7F4
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270532.1559177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wxH-0002TU-UX; Wed, 01 Apr 2026 14:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270532.1559177; Wed, 01 Apr 2026 14:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wxH-0002Rh-R4; Wed, 01 Apr 2026 14:54:03 +0000
Received: by outflank-mailman (input) for mailman id 1270532;
 Wed, 01 Apr 2026 14:54:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7wxG-0002Rb-Hv
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:54:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wxF-007GUn-UJ
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:54:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd317d-2eae-0a2a0a5409dd-0a2a450aaddc-26
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:54:01 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd3189-ee98-0a2a450a0019-d1558035a58b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:54:01 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-486fc4725f0so13566105e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:54:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa?
 ([2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c8d07cesm40615615e9.28.2026.04.01.07.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:54:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775055241; x=1775660041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x18CamjqcpqcCAvMAgi2ortnoWMbij82oStnuyc+r70=;
        b=LOk2Gs866PULF0x7H90RZh5DZiPu+kBp1flTzpP8OANEjXwkOuuXdNckk8UsH3aSqJ
         huxfGkjQhTXOOr9r6AU4BjNnFn0GqhzFFM6IwMhywzJjTAixdfXSpTMo1zKHSzlNtjyB
         5wYLnfGQdxzOH4q+CSv/p9wSIGsr1/Xcof9A+yG/1yi1Y8hl1VPOvIcBYy54v8f+G+u6
         gKVeZZ1hdvpL0Kmohj4w0RuUWgSby08BQokzRA2n+xergS184/ZR/FdR+KTixzvH7+jI
         mnKjsd5VE3DSaRqP9ysGUqh7Kfkq9ii8VY0HbGchIm+I3l3PD8KyKuNlr5bWiaJIGojQ
         XSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775055241; x=1775660041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x18CamjqcpqcCAvMAgi2ortnoWMbij82oStnuyc+r70=;
        b=pvwHuaVuZz2DokPQMdu+uqaCqwE3L+P2TumglCCVL33qFxQClOWUHVAdv5D4+xKapV
         StNO4EorMCLxQ43j9LzICTE1VntDY6LfF04nzGZpIBdwQTP59SZyEfhPt66bikyKfLlC
         JbxmLTNOhB7PYOybxUybIn+qVbfk1F7usp0palNMbsI6wtR81ORMEUYuZvN51N3EZaI9
         yhkQX0M0XESm355G9H41fBvVPA6CEgzRJfPwZrP3W0w/vFR23/jILbivgFBRhSEk1sdr
         bmpBj0eHqFA2LEljaIQvxaJ4f/kgZDtwro8tUoUTibvHG257ZfeziAqeyxx0PQgb+GHK
         BZTg==
X-Forwarded-Encrypted: i=1; AJvYcCX7oHmM75woY3vtEF7/uDucKEhwQj+ecQrKut40F2D+OAQeyyHU8b3fIdH8TPTL3vW6UA/rmbHEpiY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeIz/z9KBF3VprAbWEDLvlndpudoVXmyfz2uxOHWMP2IBOPI+/
	eCCw09LqriGkymt6VU/eHpgxX7EpaxaAkKbuuXy9p88+GhAYC54sowmi
X-Gm-Gg: ATEYQzxNEUDdWMVeTl2mjHuzY+MICO/ttoN2PWYC4+MIemx5gXxbV9KqJ0VkZ0vStpZ
	tAGncClX0fcCA34430JZOKql5kG87S93h5vd3j6SQpV7EWfzARdomMUDEVDG8RN4MQ0hmcKYIEH
	NlfT8wRoERJNeIxKZX62QNwoXllfy0H87a3jaSiyBUwUvWaBkwC9wP+PeecbgFe6o74R51i8ATy
	YTWtaruH05zngS04rjM5xc40fZ8OLGclDoEY/cJgSP+WiJU/Jtv2Gx+TV5Z7b0TbGdq/91Lk+ye
	vxW/pJmlojXZiIteNItuzgLYkAEBMS0oXTS8Ll15+OuEDOhQ2rBTY03F+gaGAkAHWKteWSGL2lq
	ma7hXeAZWF96nKUszFLz30XdQW8+uiygeUikd5Jy0TO2TuV7GnadLqTmWbShG+A4kS2PTCxg6Fi
	DWrdHjM59xF1uqSmW9vUZ1D97B4zmvpI6geSFyxOzEWfoTkurj4DbtsjQXe/WYtUmF8yJ+lzdKu
	ypVA7gQ88Lb
X-Received: by 2002:a05:600c:1d0e:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488835bc1acmr62516155e9.12.1775055241099;
        Wed, 01 Apr 2026 07:54:01 -0700 (PDT)
Message-ID: <bc5a9826-c1ff-43b2-a3d1-1a4862301aea@gmail.com>
Date: Wed, 1 Apr 2026 16:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
 <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
 <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
 <dfd2a666-f3a5-4d88-b034-438f8fbb85ba@suse.com>
 <2bae9e12-8f71-4ff0-b077-bfb4215e5e14@gmail.com>
 <ffd3a7cd-8c47-4a9b-864a-26a053b5b7d2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ffd3a7cd-8c47-4a9b-864a-26a053b5b7d2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775055241-BFB450B1-75D45DB8/10/73395122804
X-purgate-type: spam
X-purgate-size: 1990
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CD03537C7F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 4:22 PM, Jan Beulich wrote:
> On 01.04.2026 15:57, Oleksii Kurochko wrote:
>> On 4/1/26 8:17 AM, Jan Beulich wrote:
>>> On 31.03.2026 18:14, Oleksii Kurochko wrote:
>>>> On 3/30/26 5:51 PM, Jan Beulich wrote:
>>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>>> The dom0less solution uses defined RAM banks as compile-time constants,
>>>>>> so introduce macros to describe guest RAM banks.
>>>>>>
>>>>>> The reason for 2 banks is that there is typically always a use case for
>>>>>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>>>>>> there are other things under 4 GB it can conflict with (interrupt
>>>>>> controller, PCI BARs, etc.).
>>>>> Fixed layouts like the one you suggest come with (potentially severe)
>>>>> downsides. For example, what if more than 2Gb of MMIO space are needed
>>>>> for non-64-bit BARs?
>>>> It looks where usually RAM on RISC-V boards start, so I expect that 2gb
>>>> before RAM start is enough for MMIO space.
>>> Likely in the common case. Board designers aren't constrained by this,
>>> though (aiui). Whereas you set in stone a single, fixed layout.
>>>
>>> Arm maintainers - since a similar fixed layout is used there iirc,
>>> could you chime in here, please?
>>>
>>>> Answering your question it will be an issue or it will also use some
>>>> space before banks, no?
>>> I fear I don't understand what you're trying to tell me.
>> I meant that there is also some space between banks and pretty big which
>> could be used for MMIO which could be used for non-64-bit BARs.
> I don't follow: Bank 0 extends to 4G. There's no space above it, below
> bank 1, which could be use for non-64-bit BARs.

So we have two banks:
bank[0] -> [0x80000000, 0x100000000)
bank[1] -> [0x0200000000, 10000000000)

So i think we have some space between them [0x100000000, 0x0200000000) 
-> 4gb to be used for non-64-bit BARs.

And also we have another 2gb before bank[0].

~ Oleksii

