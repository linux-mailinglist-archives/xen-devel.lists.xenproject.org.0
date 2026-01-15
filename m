Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE55D256E6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 16:41:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205404.1519684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPTW-00008K-Vt; Thu, 15 Jan 2026 15:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205404.1519684; Thu, 15 Jan 2026 15:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPTW-00006b-Rk; Thu, 15 Jan 2026 15:41:30 +0000
Received: by outflank-mailman (input) for mailman id 1205404;
 Thu, 15 Jan 2026 15:41:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgPTV-00006T-6j
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 15:41:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7fc5b0b-f228-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 16:41:28 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-652fdd043f9so2027998a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 07:41:28 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6541209b8e6sm2932867a12.30.2026.01.15.07.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 07:41:27 -0800 (PST)
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
X-Inumbo-ID: a7fc5b0b-f228-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768491688; x=1769096488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2D6QFyAr8NuX1z9WO0hjuOnj49SR8081LQJ1dRh8uk=;
        b=ErI8EtHIF0iLnrv34b7k8niPXtw4C331tenXk1eCehk20U3le04WMxS9R54L0+wugJ
         /kkfQJg4A1S5cM6jHjyU78cl45R6arB18gSv77OB5HdwIOiJIzi3CV09oDzfKs0LvQUr
         +bKvZcATT9QkYUJhtq/RLusiQcO5jctw14C0NoDRR2IS8JnFaJHbkHdFETpsI43p/dHV
         ClYH/poevwOQWoRUrqfuQTLVQ7RNE5Za/1dE/vmUSk6uDIIWDz81Qc9r36nEkgff3JK3
         heqUWZdOG5cG3U3DrGy/62s3+LYiBENZZPz2qpRYkoGS1TC3bxvSw0As0xiwSwzBWhpW
         RqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768491688; x=1769096488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2D6QFyAr8NuX1z9WO0hjuOnj49SR8081LQJ1dRh8uk=;
        b=t8Im8sMHT9LhQq6yHYq/JvNQZ9+Q4B5WsZbenmtH+vidcQfkfwmVsCFwd6uo8VWMBy
         hyJKmIRJa9T5CgFJfpxDTKaBwG/GrGXZZkx7w1CRwz0K2w/kdDENUuc98ARhmimyhfWp
         qsRfEno1jTE7lymIc7Euwv7rs0YCcYfhXsEl7+gQGtdRRtDAK72QQkD4RhE0cYHkJUga
         g9O6Udgi+1RaEhB45U6B7pAKHEww61EW1CqItVvCjW0LB+FiJiUCP3HA6EgPX4D3tvC2
         vOVuwleZih7MZKdAVUY+bEFwozeJRVJ5fcQC3qom2P+1+79wX7ms/+7n9nlFQhQmnad9
         BIrg==
X-Forwarded-Encrypted: i=1; AJvYcCWOt2CUjNRovKcg0mTGskFwmOWgmlfpU5whtacLxLqvhLY4CCE4kGe6gigWVc7TRwiupm4TC2v5SBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAstcudzWhYG5dKSs7une3rBLIi68MlUiPrTx0f11CGe1ElhNR
	bUOg5QEM8b/MnWodrjdrUVwawVVc9Hzs/4f+PxdGK72wKXuSGw2WogUx
X-Gm-Gg: AY/fxX5P6hUuaiIsVcThnZ2wRj67G2xSl45G2LAFGgCdMr79O9LB26gjStW1EdgjLff
	ZGYBm26dkAjKxeNkkZ5X4YxNzAOhkACKCSI3RPWuIQ4XicLwQA9ecqrjUIuT4J4Vb0AoPN8IDTM
	a3AVhhDfKOtI67gX3qCQXSJ057sjqP/uArCvy+2pzo+mqrcoNs0QaqULAUoY9qXy277b3ve7Mfr
	QghJ8AuYPME94nKQMbPqeXHj2pxuTZ0TCO/ZPx1jouo1ukZOUQr6PyFNDeuc51HA2EBFozFDL+C
	sm7qVek3Ifg76zJQKk57JMJ5bwst6FS/EJ4IzfKlzxG75ZHrLETQHMsWb6i3aQBKWDWkhio4l7e
	iRxRGsw4tmD+DLyMnZRSp2TTLrmjnJDfqpivYBWruU64f3mK7DZhdmNV/S4FHq+748SRXFamiJ9
	dZ0bof0LSmnKvkm5O42fLe97tPeUGMkHYUKkaaumFNBPTSzZ0mdrLKi2jSJF9Ojoc=
X-Received: by 2002:a05:6402:1d53:b0:649:5bb4:59e5 with SMTP id 4fb4d7f45d1cf-653ee2acb50mr5194153a12.30.1768491687467;
        Thu, 15 Jan 2026 07:41:27 -0800 (PST)
Message-ID: <a1d750dd-a13f-4f0c-86bb-b2d6edcb1f8d@gmail.com>
Date: Thu, 15 Jan 2026 16:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: dump CSRs on unexpected traps
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260115125601.70834-1-oleksii.kurochko@gmail.com>
 <8377bdc2-d92d-4c3f-893b-19c842cad3a7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8377bdc2-d92d-4c3f-893b-19c842cad3a7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/15/26 2:12 PM, Jan Beulich wrote:
>>   static void do_unexpected_trap(const struct cpu_user_regs *regs)
>>   {
>>       unsigned long cause = csr_read(CSR_SCAUSE);
>>   
>>       printk("Unhandled exception: %s\n", decode_cause(cause));
>>   
>> +    dump_csrs(cause);
>> +
>>       die();
>>   }
> Apart from CSRs, how about also dumping GPRs?

Just to double-check, do you mean GPRs which are stired in
regs argument of do_unexpected_trap?

~ Oleksii


