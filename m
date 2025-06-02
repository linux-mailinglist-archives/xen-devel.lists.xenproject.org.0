Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F1EACAC70
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 12:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003146.1382611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM2Qe-00015u-FG; Mon, 02 Jun 2025 10:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003146.1382611; Mon, 02 Jun 2025 10:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM2Qe-00011h-CB; Mon, 02 Jun 2025 10:30:04 +0000
Received: by outflank-mailman (input) for mailman id 1003146;
 Mon, 02 Jun 2025 10:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKOU=YR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uM2Qd-0000gS-0F
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 10:30:03 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88119ac6-3f9c-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 12:29:58 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so26204075e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 03:29:58 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fb00ccsm117601985e9.17.2025.06.02.03.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 03:29:56 -0700 (PDT)
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
X-Inumbo-ID: 88119ac6-3f9c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748860197; x=1749464997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/8c2hU5Ue9eYT7KD2Rw85cVz8HZowY2V5aBlyfr3DLI=;
        b=kgjACyfaUwPkuc52t91ATOVxEZoxn4GtcPwS9U6EM17lAdOm7JeO80bdNF7WD/LMth
         AcUqi9FV2BK18zZ1yaQLksY0Eb0LjgJuNZfSKeEP69Xr3eqqICsekXBM5TwkaO635m5x
         Rn+aOJOcsN4ULix1Pa5HdyeftFZqEIt70PQmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860197; x=1749464997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8c2hU5Ue9eYT7KD2Rw85cVz8HZowY2V5aBlyfr3DLI=;
        b=OxLaeiwt9jRMLtOXFtUStIAnMX6z/O9aVXqcnRZHDvKYlfmzfM/vSehPHEna1hfHwH
         18R9UU2/U8eKtsIJAee+M6htB3gIu7QTYB/OCX3wa/tA594q4E+97jW7raNWMx7dvDtZ
         MvBOCwFcF2w2HQASmtttX/xk8kpXgq9MsxJSmgZJaZjWbL7alrIAgidyX/96MxECuWcu
         KRBR85xIuKuSCfXfukRxcFlG0E4Gour122FPXipWHMXHZxa9arZ5PFOWvU+d37aC4l3o
         ZlVOLkqiK2lIOCo0xDtJwz9d3smQa6wLto32IMr/8fm58fHXGZUuXqlCTEZzAWwOC5ra
         XqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkGSPqOa+ucYbrfvD+1NdT4/x4y9EisHxXJPvYsfqKNxgIUk42tHMVdpvNerKTF5G0HcnCtSOYw7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeFe6LFCyI4w6EmyotgcdSKai4mqA3B3rCJrFpwsYnWGHbAaQq
	Qa6+LkzskwBybSAh9GLcY6/WBY+D39Uf4aJrrKgBqWhRZxvQcDyhvtt0ENdS/Xgk06U=
X-Gm-Gg: ASbGnctZMr6Vf49jgAbWiwJtHdASRXVMQmMJyExOTDM2a+QaWsCBeB34aj2R9ogu9Cb
	OQxljLl4DCMcV1eyDmPchlUjBpRT4vZCOHRGZHyCTwLRVzvfw1OLwHYzGTDZjVrOAoiSZvRYNgM
	bNsse4A4GfdX84wsq1uj+f+n8T8M39NFqVaofBI1/GQ9ECBTz3f9mQr6dqL1O1zKzIj1E55k+nc
	RuEpQeZXYd5yfcpTlSca1KRk4xFoluzLxmecr5dMvApeEJdW0IkKaWAbzJHcF32ZgTnN1hu9VWC
	GnJ2830L8LO0CmZ/2X2Mbkuth/rbvNj0xixJnRltvPrQIcGYbxtvwvCoYdcyAH/a/NLXT9YSc9Y
	VKB/1eIIItV1O8Ijg
X-Google-Smtp-Source: AGHT+IH0QCKABEKIXAitKe2B9IsXkKrYBeIr/qvBp+oDnZbnWWNDiWx1+EWYP21X3ik8F9WSrvhVrA==
X-Received: by 2002:a05:600c:314f:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-451191fd426mr64754465e9.2.1748860197371;
        Mon, 02 Jun 2025 03:29:57 -0700 (PDT)
Message-ID: <af78b918-3ac3-442e-a128-97a72dbfcbb1@citrix.com>
Date: Mon, 2 Jun 2025 11:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Remove is_periodic_irq() prototype
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <20250527223753.47055-1-jason.andryuk@amd.com>
 <1c850e02-0d87-4fd1-8504-0aee53949136@citrix.com>
 <2c4f4c2a-b1d7-4cbb-834e-cee0fd3d2433@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2c4f4c2a-b1d7-4cbb-834e-cee0fd3d2433@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/2025 10:04 am, Jan Beulich wrote:
> On 28.05.2025 00:39, Andrew Cooper wrote:
>> On 27/05/2025 11:37 pm, Jason Andryuk wrote:
>>> is_periodic_irq() was removed in the Fixes commit, but the prototype
>>> remained.  Drop it now.
>>>
>>> Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer...")
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>>> ---
>>> The full Fixes line is:
>>> Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer (PIT/RTC/HPET) programmed as periodic timer and adds them to abstract layer, which keeps track of pending_intr_nr to avoid time interrupt lost and sync'ed timer with TSC.")
>> Yeah, the older commit messages weren't as well structured as we insist
>> on them being these days.
>>
>> How did you find this?  inspection, or a tool?
> What I'm curious about: Why didn't Eclair spot this?

I don't see how this case is distinguishable from the DCE case dropping
calls to compiled-out functions, which is a deviation because of how Xen
wants to work.

~Andrew

