Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486A78B568C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 13:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714004.1114950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1PB0-0005Fl-V6; Mon, 29 Apr 2024 11:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714004.1114950; Mon, 29 Apr 2024 11:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1PB0-0005Dq-SA; Mon, 29 Apr 2024 11:28:06 +0000
Received: by outflank-mailman (input) for mailman id 714004;
 Mon, 29 Apr 2024 11:28:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nq9P=MC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s1PAz-0005Dk-Gj
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 11:28:05 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89d4e0f5-061b-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 13:28:02 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55ffso14635785e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 04:28:02 -0700 (PDT)
Received: from ?IPV6:2003:e5:8738:9a00:3771:d6c0:aec6:f5ea?
 (p200300e587389a003771d6c0aec6f5ea.dip0.t-ipconnect.de.
 [2003:e5:8738:9a00:3771:d6c0:aec6:f5ea])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c445100b0041c130520fbsm5685436wmn.46.2024.04.29.04.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 04:28:01 -0700 (PDT)
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
X-Inumbo-ID: 89d4e0f5-061b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714390081; x=1714994881; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnaZrTm2zMEqLqJsiKORLWEAbOakg/EIVhq4/2f+JLk=;
        b=IGMxwB125rMgHyFW/2/nPb1GoKKm5StYZnWSl3KqDiCmEy8SoYFjduxQQIEkybF3V/
         txE0f9vaE4eA4GMD49P3FH0Nkkw8K/j2aiHjVNiVYRahem14SwGNI5Dz76BCm9J7GrED
         iiUAYq4Wzcxm5bpICbHJj2raYh4xQx3cfAZWUo9NzZlh11ObD2A3onS6YkLE7w9LLEJs
         F0G2rX5Hma4CLjFzbk1qHQOP5lUejP5qFbffG7bLUnyCBH+i42JdXgEVrtjOEyxcKnJ4
         SLh3ClWkDiblCw27EH12jkWSKproMsam33Fm/suv5bqDybZmsjPPKosuijjZ8Wzcl5xw
         MikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714390081; x=1714994881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnaZrTm2zMEqLqJsiKORLWEAbOakg/EIVhq4/2f+JLk=;
        b=TE9yEjtgHiQA1EuR1704iXJs/JB0JwqEGCTCj1DDkOyLMiM8odI9B2O2EvVKkX+WXv
         5jfC4x2W6dslTLxRypRHzkOcZWw25Kp4NgJCRCV81PMB1jMYODlVXGZd0Qc8u8YRVlfW
         NF703u38XSbEx6lkbOQ/Pa5Kym1/REvOSQ9/zz3o/6qHYL8EqO8Ki5cbSFXpUc4hUPxb
         1QGy3ezAkSrJsGJyv1ZUUwIkqTv/a9MwtojrFrg7vJ6RdsWmnd4sWnLq++5jFZIgA2Ca
         cWcsBYf9dwvc9Yq3CTlrMdoRMCNu8I4G7PDQYM6DnKzKBRW/FBWT9NPdcLFbpwK8jgXG
         yqzA==
X-Forwarded-Encrypted: i=1; AJvYcCVO3q00jWcWO1yAiadv9Do/O7DSoQkxBp+ThTmCaiI/aTDnsCZ8sqVl0N2Bo9JOUK2h/rwyOlss7U9uEbAH/6heCVaq7i7WhoNtmNG2oDI=
X-Gm-Message-State: AOJu0Yz658cmja91zzVkNHtrhOz0uOozz/3CZ4VknZmBm3FUJkPmq8ZL
	3b16wGYB1xj0Q0TJWUMAGNO6NJmNV34N1+iQR/V5BQ1BtSW5zw3Su5xXMHyySE0=
X-Google-Smtp-Source: AGHT+IGfPV0BCBkHWQilhUppwaLDuv2zbD1wQXCNQCEP+MTbr2/OE1kPC+4JLDeZ3CMXsOw1iMUenA==
X-Received: by 2002:a05:600c:3153:b0:418:bdcd:e59b with SMTP id h19-20020a05600c315300b00418bdcde59bmr5837518wmo.7.1714390081368;
        Mon, 29 Apr 2024 04:28:01 -0700 (PDT)
Message-ID: <29296e11-8d21-4867-9d31-fc94af828214@suse.com>
Date: Mon, 29 Apr 2024 13:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] xen: allow up to 16383 cpus
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-9-jgross@suse.com>
 <da1662ac-70f1-4ae4-9737-e10e617c8036@suse.com>
 <637c755a-9f24-4b86-af12-7c7d50bf40c8@suse.com>
 <d0714064-c544-47d3-84c0-a19391ccf496@xen.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <d0714064-c544-47d3-84c0-a19391ccf496@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.04.24 13:04, Julien Grall wrote:
> Hi Juergen,
> 
> Sorry for the late reply.
> 
> On 29/04/2024 11:33, Juergen Gross wrote:
>> On 08.04.24 09:10, Jan Beulich wrote:
>>> On 27.03.2024 16:22, Juergen Gross wrote:
>>>> With lock handling now allowing up to 16384 cpus (spinlocks can handle
>>>> 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit for
>>>> the number of cpus to be configured to 16383.
>>>>
>>>> The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
>>>> QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> I'd prefer this to also gain an Arm ack, though.
>>
>> Any comment from Arm side?
> 
> Can you clarify what the new limits mean in term of (security) support? Are we 
> now claiming that Xen will work perfectly fine on platforms with up to 16383?
> 
> If so, I can't comment for x86, but for Arm, I am doubtful that it would work 
> without any (at least performance) issues. AFAIK, this is also an untested 
> configuration. In fact I would be surprised if Xen on Arm was tested with more 
> than a couple of hundreds cores (AFAICT the Ampere CPUs has 192 CPUs).

I think we should add a security support limit for the number of physical
cpus similar to the memory support limit we already have in place.

For x86 I'd suggest 4096 cpus for security support (basically the limit we
have with this patch), but I'm open for other suggestions, too.

I have no idea about any sensible limits for Arm32/Arm64.


Juergen

