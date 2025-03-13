Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084DBA5FBAD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912830.1319027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslPt-0004M3-HJ; Thu, 13 Mar 2025 16:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912830.1319027; Thu, 13 Mar 2025 16:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslPt-0004Iv-EJ; Thu, 13 Mar 2025 16:28:17 +0000
Received: by outflank-mailman (input) for mailman id 912830;
 Thu, 13 Mar 2025 16:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tslPr-0004Ii-L8
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:28:15 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27bfb1a3-0028-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:28:11 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-390f5f48eafso705616f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:28:13 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c888117csm2589754f8f.44.2025.03.13.09.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:28:12 -0700 (PDT)
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
X-Inumbo-ID: 27bfb1a3-0028-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741883293; x=1742488093; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i5RvvgV+xGeNraS9mFKNe1AZZsaGX4hrdWBw+Z5Yepw=;
        b=jO3ZRnDdCBW40hzlpz/rkhqCkdfPL3LtWZizSb329lZeDOEJPLnqPeuI/Jux/LReq2
         yf7fwmEddL/KqRlM/X8FuAGaERmq6ysLvBJWBaZYkNxDnheribqgNgzUjPlJ4SuC+47T
         tZRAuvd8dBwE3/HX4FasQohrcUxjzz1LkM8DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883293; x=1742488093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5RvvgV+xGeNraS9mFKNe1AZZsaGX4hrdWBw+Z5Yepw=;
        b=ujWzWt9y4NT88rKZwdorhiJJX1ln5w6996oLHl+GAZl+NAKIQgaKPUWdTrYRGO2OnA
         54Q+t1W9YJ2YD8CwMd8WDy8QeXmZdQLoXtWWC2TPPS3gfFFxPsUWXyRY8PvY9HZLz3fx
         LOQd8Y4GdBWWtxJdXf4xDRDrhjOlrC+JY33nxJ+YTeAHprLrJogXRi8ZpYjeGzByZ5cr
         isd4BmRC69qfT2fsCX7S17E70oiC8v2OEG1TfR6dPCtt09fW2XJjhk0lnL9QZnVT+4PN
         heRkaE/ebS4XBd1Aih/IwAS7CTh75f/Zh4Rp9Hk2ar6f8UDeozovlXERczNZzJmTJ5sb
         hUwA==
X-Forwarded-Encrypted: i=1; AJvYcCXGay9M5kP6L7g8xu49w15iRNTOhsf8KDgtACem/yBqRGmce1elPuJ5k9oqs05xbIAqypEKXapv2sI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhWRLbvyoIHUvADDPGEVhyuZ0GblxcHf2a6+gRh50hxLsl+Xj3
	ofDKIgH51eSuPsbnkBF4CVIpbAPtXmUnDXDQQAEUa2xlykJ+g9R73cu71tgte+Y=
X-Gm-Gg: ASbGncts6Keavv+MoOVrUZMWox+pf1JCHclqNk31K4WfzOeiOPPejqC+c2l/IJHtA5a
	czJd3eag8sIW4Iml79dNx6C7GWIQQPu36Y9JpfaNKfQKgM3qReDTBwnRAwRdXuOl9+fEiEVmCcL
	BEJSlCNLGvGJldCwgxGC3H4B7gTVE2PcEuKLapjcOwTTYtjJ2oRfd+d6hc/7o+Jvr8rT8tPsUxA
	+k/XAu55Qajiy6ifNnKdSIXcEYij9AGYbN5vj14+YfZYnYa1+OSw2hvILkcrUFS3XYGM/dQjZ9A
	go698BNTWeA58i4SHhveTv7VAkqcV5sIrWTpCdiHUIZRF3ZakE4XNAnBZ1aWUrGfaIXu0J/N/IV
	sJLNQC/kX
X-Google-Smtp-Source: AGHT+IGSb3EFi0Jg5LxNuLwhIdqkuj0AKeh/a9F3kNfcctNxtsLajZ6NBkGx8DjRURuFwoAJrBityg==
X-Received: by 2002:a5d:5f47:0:b0:38d:d9bd:18a6 with SMTP id ffacd0b85a97d-396c33669f3mr191781f8f.42.1741883293115;
        Thu, 13 Mar 2025 09:28:13 -0700 (PDT)
Message-ID: <d597523c-aa3a-4682-824f-e6e2f8ce753a@citrix.com>
Date: Thu, 13 Mar 2025 16:28:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
 <6ff81326-762c-46ec-a06a-254ba166433b@citrix.com>
 <b59ea14e-0bce-4c3e-b1fb-021b53af1780@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b59ea14e-0bce-4c3e-b1fb-021b53af1780@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 2:19 pm, Jan Beulich wrote:
> On 13.03.2025 14:58, Andrew Cooper wrote:
>> On 13/03/2025 1:38 pm, Jan Beulich wrote:
>>> There's no need for each arch to invoke it directly, and there's no need
>>> for having a stub either. With the present placement of the calls to
>>> init_constructors() it can easily be a constructor itself.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> This has a side effect of wiring it up on RISC-V and PPC, as they
>> process constructors.  It looks safe enough, but have you double checked?
> I've been looking at this differently: For both it can't be right for the
> function to _not_ be called.

Eventually, sure.  But they're both in the early bringup stage, still
getting the basics working.

So really, the question is "does this (not) cause CI to explode".

In c/s 8c3ab4ffa953 I noted it was easy to make CONFIG_TRACEBUFFER build
for PPC, but I didn't try running init_trace_bufs().

Anyway, I've kicked off
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1715210166
to check.

>
>> However, the position and logic during init is nonsense, I think.
>>
>> It registers a cpu notifier which only does spin_lock_init() on a
>> per-cpu variable, which I think only works today because 0 is the init
>> value.
>>
>> alloc_trace_bufs() on the other hand has a for_each_online_cpu() loop
>> because it's too late and ought to be a presmp_initcall().
>>
>> Also the allocations could be NUMA-local for all but the biggest of
>> servers (given the 16T upper limit because there are raw uint32_t's
>> involved in the protocol).
> ... there's certainly further room for improvement, init_trace_bufs()
> is all just "normal" code, which was already built before.
>
> If there are missing pieces to make trace buffers fully working there,
> that's no different from before the patch.
>
> As to alloc_trace_bufs() - that has a 2nd caller, so converting to
> presmp_initcall() may not buy us all that much.

Another bug I've realised is that this fails if we hot-online new CPUs
later, because tb_init will be set but nothing allocated on the new CPUs.

>
>> I'm tempted to ack this on the basis that it is an improvement, but a /*
>> TODO this is all mad, please fix */ wouldn't go amiss either.
> I understand you like adding such comments; I, however, at least
> sometimes (e.g.) don't. Especially without at least outlining what
> would need doing. Just saying "this is all mad" doesn't really help
> very much.

I was being somewhat flippant.  But a /* TODO, try and make this a
presmp_initcall() to improve alloc_trace_bufs() */ would be fine.

~Andrew

