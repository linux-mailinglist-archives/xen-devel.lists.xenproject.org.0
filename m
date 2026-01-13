Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED6D19F66
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 16:42:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201972.1517590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgWg-0002mj-DW; Tue, 13 Jan 2026 15:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201972.1517590; Tue, 13 Jan 2026 15:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgWg-0002lG-A1; Tue, 13 Jan 2026 15:41:46 +0000
Received: by outflank-mailman (input) for mailman id 1201972;
 Tue, 13 Jan 2026 15:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8AK=7S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfgWe-0002l9-W0
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 15:41:44 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c5fc91c-f096-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 16:41:43 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-64b9d01e473so12923661a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 07:41:43 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4048sm20891759a12.2.2026.01.13.07.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:41:42 -0800 (PST)
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
X-Inumbo-ID: 5c5fc91c-f096-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768318903; x=1768923703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTZVzT2/QMWTHb01rWpmc2mXtzalprZmDt3PPYaGzIw=;
        b=hpf/6vVx2VFIPLsLd6hx3sKFWIys/2IYv1uYYy05ghMvb60zcrLLOMXW/Jap335Td2
         SuLAwYzUc9GHA/Kg+/pl1y+FEV5aCetHteBqE+XszIOOIMYfclotvADqcP9c2LcaXvjy
         LTwMmAdShy3GSxHhBbZ/n3lcEm9t8JkuMZYloYDNPuttAR1uTRD57wC7elHXJMvku7Vq
         jxa5eLiZps9tUwUgU4K73l48HUh//qYYrFaI3ppRPJJ8/IU9sx6MDMZSq0f74Yz9QZbB
         TRoVQYI+kcTK0K8Et+RHLfFbbO5NAsGJTei654nPReiXGLB87BHaTZ5xAKv1Rinow2yZ
         r7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318903; x=1768923703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTZVzT2/QMWTHb01rWpmc2mXtzalprZmDt3PPYaGzIw=;
        b=fL270vbBOisfeCzokpGk6qG6cFJkX22dn0s5wjw9nijm8hRU/ymHpgsJk8LQoWiAYA
         pVRjUJZsIkiPyiwO/IUFk0naALghCHtfsYEZqMqGPINDsfwCCJv2gdJjRHnvxHxliFcT
         gKSypkSTrsz+glNr7OPnEsdHW9aYFsghp/s0SRiCwLA9S2glQl/S5XlnjF/gB2cFEJXy
         jRyDY9VeE8+qYpeMmFCHyF8iZZrJ/d9l8yfw1m14u7YCf4PcBJiXMlVleo24tb+WAFgZ
         Zfy6wGo3krcQExtMaDAaethIMIH2o5qsIC+hi7vNEF1IxZfpye0coR06YoOqPLaZEKhe
         R6wA==
X-Forwarded-Encrypted: i=1; AJvYcCWEiNqgQ773Q4jIap2I+nmYiSIqGrImQOcL+XTDukXFoFd8xSDrd2CKm6PbzjNiHdY2dVvWXXGowiA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMKi/w5rheaOSTusKTgVTeObFGBzK7U4ogAEhlyvEDcA6tDl/Q
	czicKnbVgmxhTFLzTeXYmeqA1rOPlo+8WlEOn1QaDm8of158QFsnhPU1
X-Gm-Gg: AY/fxX7tNFYob1Zi1I64i/WqklxEoMyb4X3zypFg388h5RzCn4KHJi3rmFSYyg4wKek
	aizfC47eKjOBqaq9wg51SUrUB/Y1IB7Yeub+YkwqBSKddz6+t3iRz8An2wvsfWNflHH8X4Htzto
	W2Zok3gaAhY9GTR+4z8fXMpP+IfGPxDcb3PUjlSahT5cELTisR4viAlzyvjjvWn5tYMwlfU+/Pz
	YobxjG5z7/mBgP2znad0e/wtlQkIJ6hsJjGlhW0EctKw9w2JGhX5ADDXtcyzFC5w7qP8Vg1Jp7D
	aWnC+Gro9mcMjJAc51HPNHsKlj3JPI7Frus4h57P0NadsKqfy560Ls+TZ80cHgsTvbqR8Zqs1eD
	pcVjQqmgn/22zUV5TdOm9qhsmyUSNM4gmTCvSosWNXqUfBRYpNbbm6OpNpcebwalZmr3vbtd6PD
	HEz6ECYRbc1ol4qvqJsfQf0y6enDZsAkeFQ0qRHhCVtprE4CxJDEKTyqrM8EsJHPN1D5Flr/kgz
	Q==
X-Google-Smtp-Source: AGHT+IE8QuKlQdgRmTHkjRPscmCuWQ9D6w9z/VgR5PyaVZpXvZw6ojiPqQLRMFKrZOXMhPEhM9NW0Q==
X-Received: by 2002:a05:6402:b01:b0:64b:60e4:f898 with SMTP id 4fb4d7f45d1cf-65097df5b9dmr16783596a12.15.1768318902811;
        Tue, 13 Jan 2026 07:41:42 -0800 (PST)
Message-ID: <3bae3547-dbff-4d1d-b5b3-827101ea2467@gmail.com>
Date: Tue, 13 Jan 2026 16:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/15] xen/riscv: implement SBI legacy SET_TIMER
 support for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <dfead0f29d2b93350acc5a20b9f75d534dde5d25.1766595589.git.oleksii.kurochko@gmail.com>
 <53913b1f-5413-4cb8-9758-9f891a704445@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <53913b1f-5413-4cb8-9758-9f891a704445@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 11:45 AM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> Add handling of the SBI_EXT_0_1_SET_TIMER function ID to the legacy
>> extension ecall handler. The handler now programs the vCPU’s virtual
>> timer via vtimer_set_timer() and returns SBI_SUCCESS.
>>
>> This enables guests using the legacy SBI timer interface to schedule
>> timer events correctly.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> What about the more modern timer extension, though?

Handling will be the same, as the API is identical:
   struct sbiret sbi_set_timer(uint64_t stime_value)

The only additional work needed is to add handling for the new extension
with EID|0x54494D45| (“TIME”), which was introduced in SBI v0.2.

Interestingly, we currently report to the guest that OpenSBI v0.2 is
available, so technically this modern timer extension should be usable.
However, the guest still tries to use the Legacy extension, as it has not
yet received an indication in Xen that the EID|0x54494D45| (“TIME”) isn't
implemented.

~ Oleksii


