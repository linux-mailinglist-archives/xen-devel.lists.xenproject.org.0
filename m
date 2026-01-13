Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671CDD1A6CB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 17:53:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202198.1517822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhdv-00045x-Uc; Tue, 13 Jan 2026 16:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202198.1517822; Tue, 13 Jan 2026 16:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhdv-00043X-RX; Tue, 13 Jan 2026 16:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1202198;
 Tue, 13 Jan 2026 16:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8AK=7S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfhdt-00043K-Td
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 16:53:17 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55db249f-f0a0-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 17:53:07 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64baaa754c6so11309366a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 08:53:07 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b871e383217sm562886366b.71.2026.01.13.08.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 08:53:06 -0800 (PST)
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
X-Inumbo-ID: 55db249f-f0a0-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768323187; x=1768927987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quR6N57RKz+5wdEK9dYC/7627WTrMtYCBE5SL1cVH24=;
        b=m9Br7jjYadDQ3hM20Pt7xjdC9nLmuIH4d5sHF+L7aPHtPGqZvx0XGrZ1EAV9tWGfZ6
         7KNqFf/dnTCYswsBFeu59ewsN5ulQ3AQYmzSCSa7h9wxFwGfPYX3n4QFhDMh6LxMUdhu
         PXCC82GuVHjHqNJ7CaJHHsWMwoCYDYW5zbBFqsPS8qG2QnXTG1Ag6bqrKmqv6Q+ymYSE
         Kamgl2QcC/LnyyjBGOFvw12wzsGsOHJyO80dVHPV8t3S21IZBSXHSf9A2oBSJO5LHk8c
         zXPJ2WO2zVoVIZJFNUV90CrlnA2kZjREIs9S7YXsPLKpc8jDPvYnIn/6eSY6JmqphjGI
         3hrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323187; x=1768927987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quR6N57RKz+5wdEK9dYC/7627WTrMtYCBE5SL1cVH24=;
        b=wPcexVVHDMDg3tHOso7yvT7GEZXehoQ/OpUqJT+k3p9O80UGzWQeO95upv1hhsNq2P
         B7DmQbRwJ5nIFqeTPbHjxnrLtvOjW7OpFKOrVtgD+PG+xHWIj+8Ok8ecdrXho1D4dCTX
         EAEBjmTwIgPABP2s91pwI4bQCXxfm6XkyIc2dR890QGEAt9Jj3cBmc7BsQpjO3tJHalj
         GUiIVe9XIYYhEhYyniMuU863Zexmun/9b2v49TVI9zSM4Rxr3mqJ1GR0IuRYTjltFd8P
         l+pjO3VDA1XzOLzoWW2MOU7l0++LLfz0fiywZGDT3QqFF6uh/S7OYdxn8CgX6+EPD/Ea
         hE6w==
X-Forwarded-Encrypted: i=1; AJvYcCWfl8GKzixw/wTKLOT0DMzsKTJlxWgMdYva5RA95zP9t57C7XeWi4MEoIdM1Y5Z3LhmQeyZrKyOToY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3thzaaWeKd6EtHdF405pXcfy2lVLetGFHc+UvJP9C2Nb2Q36N
	H0t66NPvmb9ftq0WxWmyQAsj/arxnMBZH5/eKYSxDvBzw7JYWu8ce2aU
X-Gm-Gg: AY/fxX4FusKnpd3WviXkWpRYwuNWQzuVEdWoaP4iKXIqv7p7Ji7DeD+QGPHsZMWlII9
	VYL8c9NyB4VXWic7iCJrNH6ks8ZpHxf9oX7aMWfkoELMJ+oPqCSzJKOZ5oWZCycydDw/afsaQy7
	1khfIAFmeec5B83OP9q5JJZ5q6KMrMrbNMjYoePYRw4FZJPqnimQHnD8uY1SAN71bLTWJAPqq1P
	+RyuDbFmCt6ss5KMcBZgtXfeB6HddQnjYJ4A2oABKuvpjETwTVHhHFJvHo2/lUoAgdLJdbipP1X
	Jn6sKnWA+kupM+ReXXN7TfsyJRlEToYOS/a/wK4c8/bCnwsERfQIRlExqpE98rkKKCT3BvnCNce
	UqakiGDg9Pce9Ylnh+DKy/W1xYhP6SHL61kOFMGYjczCyfbmt0mpNOGSGPkxzKMPgKUQCpfV2ZY
	QPN2/BqaNMxRFFAtqaT7Bk63TQJYw5k7bpgpvJNyhdXLRXS0ZGRyGHhWWpTeZGh7e8iHsBk6spi
	A==
X-Google-Smtp-Source: AGHT+IHuWjVoL7E1svo16dpvYexcmqlADS/kdgWQsDmPmGyT52fboynC+8J2+zVwxSmqZ5Ga2XwSRg==
X-Received: by 2002:a17:907:780b:b0:b87:1fe8:9534 with SMTP id a640c23a62f3a-b871fe8af72mr429814766b.48.1768323186762;
        Tue, 13 Jan 2026 08:53:06 -0800 (PST)
Message-ID: <a77f0dbb-61e1-4372-b0f4-7544cebffca1@gmail.com>
Date: Tue, 13 Jan 2026 17:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/15] xen/riscv: handle hypervisor timer interrupts
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <c63eef564d0d350f009e253b24b567488e47eb13.1766595589.git.oleksii.kurochko@gmail.com>
 <c673a353-76e2-4607-beb6-13371abf8550@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c673a353-76e2-4607-beb6-13371abf8550@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/12/26 5:15 PM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> @@ -108,6 +109,15 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>>       die();
>>   }
>>   
>> +static void timer_interrupt(unsigned long cause)
>> +{
>> +    /* Disable the timer to avoid more interrupts */
>> +    csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>> +
>> +    /* Signal the generic timer code to do its work */
>> +    raise_softirq(TIMER_SOFTIRQ);
>> +}
> Why is "cause" being passed when it's not used?

Good point. No any sense in it. Even more I think the cause is
pretty known in such handler, it should be definitely = IRQ_S_TIMER.

I will drop an argument for timer_interrupt().

Thanks.

~ Oleksii


