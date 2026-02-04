Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAzjGMUKg2k+hAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:00:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7751E3746
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220238.1528949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYkF-0006lA-4I; Wed, 04 Feb 2026 09:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220238.1528949; Wed, 04 Feb 2026 09:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYkF-0006iS-0Y; Wed, 04 Feb 2026 09:00:19 +0000
Received: by outflank-mailman (input) for mailman id 1220238;
 Wed, 04 Feb 2026 09:00:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ke1/=AI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vnYkD-0006iM-AD
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 09:00:17 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec2b4999-01a7-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 10:00:16 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso55144155e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 01:00:16 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830ec5cc24sm21961265e9.3.2026.02.04.01.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 01:00:14 -0800 (PST)
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
X-Inumbo-ID: ec2b4999-01a7-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770195615; x=1770800415; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3eOJqHhjKxDuoHkcfX76ycl2IVwyQ77rcRwoU2Q/dg=;
        b=klSweW+EuawpBfiRIuvqaiQv3TeWKOIQbxszI9l1Mg6BtyCfh7ISllPE1vYPNchaFF
         q+TXFXeJ0wEYBGPgWZXldh7wNRfqblLnOSAqNWNeoPgTt1zEARZEvAGRCV/0Gx5/oVy6
         LR6XcV/e1paqqotxikTwseOrIljjR/z/WkSCs6vZ/fzRf67kI+bsKTrpjuCImw7mIYw2
         TALtAu00iHsG609sspF1U5cogwR9ych4AxqUXPTRo/nYUUo9hdvQB8qoMT5rVySG3j5d
         tScADgiZrCNQRr8a9ozi+Wd1DBMj44Uit/mwQblXDJRifcfBT4phbS5/pj6aMmpBc/wF
         tdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770195615; x=1770800415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3eOJqHhjKxDuoHkcfX76ycl2IVwyQ77rcRwoU2Q/dg=;
        b=pN34GInjfHpi+3O9XwFrf4cZkbPEPPklvRUCoda+A8wUxCoe5DO3xLBR2qOAA5HTTH
         9lWBkRcaPZYc5yhoUrFRU37aTqFcQPtjF5gdVoPU2jpagLFxCOcpVIFLAHeyRc8KdHFZ
         qgDbvNRtEp0makTSItD828ng36D1iQUlYY3cE0kEWo87Y3Ii8LnCNexYb49Q4WzBk+BR
         Ik/Ta1NyDXxV1XUDJ9osL/yPf3lqzNXxjbdxlIwScjK6itzyZZ50AIdJpyvLZpyPfqD+
         9gBEoe3zQQpUICNxi+v6TimvpmsaOUz1i66O+N7SKlwoSe+ErMglwyJIHwGGJGdnBh5C
         TeXg==
X-Forwarded-Encrypted: i=1; AJvYcCXMfSrG1Lcq176YpyaNRL2X/wZ1FLm1k7Bu22i9wz98N44KaLygd4zblJew/p0nk3DnhoaBYJdp2G8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxle3tM9B/7JkJbcRh2ltg7KXMGRgybhAwRg41zAbxLAJF8qxiW
	f4lAXOlkVjWrUcZ5+t+djENvemAd4ArPU4JIsEiCHiX9f1rN+k0lH5LX
X-Gm-Gg: AZuq6aLSjCP3FJTu5R2JERnio5PE7Odk0U6xZfzja0PZJygPby2wIpJLRqN827ooQY9
	lfo6EXZZrhS4GWHTzWpX+kI9mZCZRqDQB1m1Px2WAPm/x0pQi2KrzcGA8H2IGeL25AGSvsIStsd
	HB/0cYbtu5Tlggkn0UCWUVLHedGqwSzAyU3TisBM+GepEPI7FLqzvNTM0DbczVe4SafHjBEfYRz
	H+Ce55eWaiLfESF1bNG4NJU3dOzmLqyF+/TrbYp6vJ7RpG/1Lh5mQiFtrHtyRRSMSrRAxiXbxMZ
	jkweW/BxaoMzqzz1xnqvMRjprvSvAjGDOAOqVKVbi6RnwCIvdJ2BYxsBWHPhMTYN5uQJRx26rOz
	VORoQquhNJci+g8EbQ1Vq1Ui0dNHkyruDMoABYpvyqjallg+ueSYDXmZl5ctgdUY3aCJXfrIkLj
	Bx62NnprF3Ek2MO9ycAZq2GMifnBj3yXnoB6l6w+LeB95NTmHo37HeLbvJK/HOPT+vWdOJmdKY/
	Q==
X-Received: by 2002:a05:600c:19cd:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-4830e94c659mr29031495e9.10.1770195614516;
        Wed, 04 Feb 2026 01:00:14 -0800 (PST)
Message-ID: <b75649af-801d-4f74-9e67-aa921a060b9a@gmail.com>
Date: Wed, 4 Feb 2026 10:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] xen/time: move ticks<->ns helpers to common code
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <c7afd490ad9cbeb91b2b46b59cba094c7322edfd.1769099885.git.oleksii.kurochko@gmail.com>
 <2ff79945-f972-49ae-b50a-a7bbff9d4aa9@suse.com>
 <b5fa18dd-d831-4f32-9b29-ac431e54b7b2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b5fa18dd-d831-4f32-9b29-ac431e54b7b2@suse.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,wdc.com,gmail.com,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[oleksiikurochko.gmail.com:query timed out,jbeulich.suse.com:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: A7751E3746
X-Rspamd-Action: no action


On 2/4/26 9:13 AM, Jan Beulich wrote:
> On 29.01.2026 09:48, Jan Beulich wrote:
>> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>>> ticks_to_ns() and ns_to_ticks() are not architecture-specific, so provide a
>>> common implementation that is more resilient to overflow than the historical
>>> Arm version. This is not a practical issue for Arm, as the latest ARM ARM
>>> that timer frequency should be fixed at 1 GHz and older platforms used much
>>> lower rates, which is shy of 32-bit overflow. As the helpers are declared
>>> as static inline, they should not affect x86, which does not use them.
>>>
>>> On Arm, these helpers were historically implemented as out-of-line functions
>>> because the counter frequency was originally defined as static and unavailable
>>> to headers [1]. Later changes [2] removed this restriction, but the helpers
>>> remained unchanged. Now they can be implemented as static inline without any
>>> issues.
>>>
>>> Centralising the helpers avoids duplication and removes subtle differences
>>> between architectures while keeping the implementation simple.
>>>
>>> Drop redundant <asm/time.h> includes where <xen/time.h> already pulls it in.
>>>
>>> No functional change is intended.
>>>
>>> [1] ddee56dc2994 arm: driver for the generic timer for ARMv7
>>> [2] 096578b4e489 xen: move XEN_SYSCTL_physinfo, XEN_SYSCTL_numainfo and
>>>                        XEN_SYSCTL_topologyinfo to common code
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Nit: Flip the two (chronological order).
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Btw, if this got the necessary Arm ack, I think it could also go in ahead of
> all earlier patches in the series?

Yes, it is independent from earlier patches in the series.

~ Oleksii


