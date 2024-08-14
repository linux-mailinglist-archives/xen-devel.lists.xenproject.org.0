Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF04A951460
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 08:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776746.1186901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se7IN-0001lX-6f; Wed, 14 Aug 2024 06:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776746.1186901; Wed, 14 Aug 2024 06:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se7IN-0001jQ-3u; Wed, 14 Aug 2024 06:15:43 +0000
Received: by outflank-mailman (input) for mailman id 776746;
 Wed, 14 Aug 2024 06:15:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRlh=PN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1se7IM-0001jK-2z
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 06:15:42 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0cdae48-5a04-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 08:15:39 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5b5b67d0024so7141420a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 23:15:39 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd187f5671sm3541898a12.3.2024.08.13.23.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 23:15:38 -0700 (PDT)
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
X-Inumbo-ID: a0cdae48-5a04-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723616139; x=1724220939; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3chlWl+1x3+Shb73mTBLzYcM2aTWa0hMrJt3FPlTnr0=;
        b=ZfAKGar55huzgVFfHmMzlAJqGmMvnsSq96oAD2NGlDfbsWK41n1o6Xz6XS7mbLxVrR
         wWBugpbgWvfdlvjSXFFv+YD2DMMJ5O2AcxkspB7sLsna4EwV6pPt/SHx0xwtTQegr6z1
         6AJyC7/1PI9J3ezkKA1+8yYJPOAqTpzC186NpQFhqB0qqNvxJ5cjYppfvCpgKjF1qjdM
         gsqkNgdQRP4OIv34RNzI/Wqj5qa0GEqXiGkjnpVDh+IRAozyKp1Pwqz/6z0M8K+vN3Pk
         D5bY9Wuq1Yq+1rSpvHOO/Sqw/eGolaSFNcxN+x0BSLhrMeqcHMupCId/d+UYyN8exlFA
         F4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723616139; x=1724220939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3chlWl+1x3+Shb73mTBLzYcM2aTWa0hMrJt3FPlTnr0=;
        b=qGB2MmFGSmKAD6hehuRsdE+6S4lMY7PHjlp66KeTbqckIJ05atHNYxuYMVkFUmczcT
         99Et79xaoDuojfn8AtEt93vmC70YS7+E26Mufoyq5QTh/Ep4NEuEBrle/KL+xrHhht7+
         U4GlEMGzDVdhJ7Of2TXwn1bUysNPH8RIpKPSyOBQhx9BD+EjlVV0IEtgxAZbOWN+AVxZ
         YS1PqsWlGPM6IyZZ0jcmg4ObgOG95VxJnk87aRTI7G12wFnvNGjyS7fMGk/wsfA5K8Fu
         G8M7CdDR53gDkCW12W1xLEJckmXJauVWXVt05ixE7YTMMiNOXOM/Gc5QMxskKKVMa0lN
         qLxw==
X-Forwarded-Encrypted: i=1; AJvYcCU+9TuaXwbPP95U1M7SpW5/ht4hwCnHcwnET8rwwab4UhPPQiG2Lu/grUAsM0XL58dgRA+062/Eq88Wo/C23oP11jhi9NWTLiOetLW+Ml0=
X-Gm-Message-State: AOJu0Yw/LxyNrNm/gFAX2aI7RPmQRcoD5jTYYB+OmWLIhiQ8jxJWdCyc
	QX0Rwg4Z8L2BSqBRhFARCnfitjBuC81k/7ku/ROa2onTCA4xEgeca+Rc4/HYpGg=
X-Google-Smtp-Source: AGHT+IHzbR4VeJvIvZY0IgemNCUA0e3NYt/exS1BM2wN5LiN1xatG/kB8wYT0cHX82SZt/pNJorN3w==
X-Received: by 2002:a05:6402:51cd:b0:5bb:9b22:68f4 with SMTP id 4fb4d7f45d1cf-5bea1c7bc00mr1002969a12.18.1723616139053;
        Tue, 13 Aug 2024 23:15:39 -0700 (PDT)
Message-ID: <e95ab71d-b985-4ab7-994b-1c562efd5f9f@suse.com>
Date: Wed, 14 Aug 2024 08:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD EPYC virtual network performances
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <352bba40-27fc-416b-985f-20e66c0c4b72@suse.com>
 <Zrqykdarr7JHaeOZ@mattapan.m5p.com>
 <ab4ca68e-ec1b-467f-9b89-38f63cc19b7c@suse.com>
 <ZruckufSjT0GkpJt@mattapan.m5p.com>
 <d556e168-8542-4b93-81a9-a7054b5b69ba@suse.com>
 <Zrvf5wgm6xEI63x2@mattapan.m5p.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <Zrvf5wgm6xEI63x2@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.08.24 00:36, Elliott Mitchell wrote:
> On Tue, Aug 13, 2024 at 08:55:42PM +0200, Jürgen Groß wrote:
>> On 13.08.24 19:49, Elliott Mitchell wrote:
>>> On Tue, Aug 13, 2024 at 01:16:06PM +0200, Jürgen Groß wrote:
>>>>
>>>> I don't see a connection here, as spurious interrupts (as seen by the
>>>> hypervisor in your case) and spurious events (as seen by Andrei) are
>>>> completely different (hardware vs. software level).
>>>
>>> The entries seem to appear at an average of about 1/hour.  Could be most
>>> events are being dropped and 10x that number are occuring.  If so, those
>>> extras could be turning into spurious events seen by various domains.
>>
>> Even 10 spurious events per hour should not have a measurable impact
>> on performance.
> 
> Come to think of it, depending upon time that domain is sometimes low
> activity (build so it is either pegging or idle).  The 1/hour was during
> idle times, so during busy times it might be much worse.  I haven't been
> tracking `xl dmesg` as carefully recently.
> 
> Do the maintainers ever run machines with "iommu=debug"?  I'm actually
> rather concerned *anything* spurious is showing up as I'm left suspecting
> there may have been something lurking for some time.
> 
>>> There is a possibility spurious interrupts are being turned into spurious
>>> events by the back-end drivers.
>>
>> No, I don't think so.
>>
>>> Jürgen Groß, what is the performance impact of "iommu=debug"?  Seems to
>>> mostly cause more reporting and have minimal/no performance effect.
>>
>> I guess you are referring to the Xen option? I'm no expert in this
>> area.
> 
> Drat.  I haven't noticed much, which would match with simply enabling a
> bunch of debugging printk()s (alas I'm not monitoring performance closely
> enough to be sure).  Guess I wait for Andrei Semenov to state a comfort
> level with trying "iommu=debug".

You didn't answer my question.

Please send the Xen and dom0 command line options you are using.


Juergen


