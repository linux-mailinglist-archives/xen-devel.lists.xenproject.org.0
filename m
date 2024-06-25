Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2039161AE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747474.1154900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1uH-00080T-5c; Tue, 25 Jun 2024 08:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747474.1154900; Tue, 25 Jun 2024 08:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1uH-0007y7-1o; Tue, 25 Jun 2024 08:52:05 +0000
Received: by outflank-mailman (input) for mailman id 747474;
 Tue, 25 Jun 2024 08:52:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOoF=N3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sM1uF-0007xw-L8
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:52:03 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3052d26b-32d0-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 10:52:01 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6cb130027aso342445766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:52:01 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d303d7ddcsm5629039a12.17.2024.06.25.01.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 01:52:01 -0700 (PDT)
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
X-Inumbo-ID: 3052d26b-32d0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719305521; x=1719910321; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q2MFqd8Yxs4B1CsyjqgzZvbJzcSnJ7Xj7Owz0JLjSf8=;
        b=QT1oz4+otHEJGExt2WFqO/n1sOszXWTwjU0PBnefvasoqbLsnH+rzxGr/+w5yQpu1o
         US5SW0N8dSh7qDY+RlNSkLKgH8ILFK1mckp9EaHjz62ZYEn+BOJ4msL2tn/Ls09fm5MX
         IU25mxyuREi1w4NhtKOREWJ92hZ1CYBCGUtlDyWqI0VEwoWQhmA4ulGXn0COiH756UL1
         +2U7MSO/G28mCQDA/CpmYCT2IuOzDGs+W6WTooYXA7Q2YB0GmG9x7Wa7+iyevZNvouVu
         //6nbAIMv8mK+IN6+6qcysc2nVFzE2Ho4icqWJRL8XZQDmnnieaywa1Vxw7RGLxbYl1P
         y/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719305521; x=1719910321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2MFqd8Yxs4B1CsyjqgzZvbJzcSnJ7Xj7Owz0JLjSf8=;
        b=tQj6SaSYfvL6Ot09t5wEKVsVqJDwORfLCUoImu2SEKCmYSwVfV1xvw75OVaqWBXTOF
         hyPQnu+L/m1Ap35ziIZ48AzohjSEdGDCfzV09TcsZhxt88zniI+xiY8/unV+rWzJyJ2y
         zeprOCXWhwCd4czhOAqh+cnZlYpSK4grAl8iE/sZ9sRbjNRRMjAzgmvR80+9O1STNVaY
         0Mo+yHIKsNhwr/lrsaKMNjPD6EigjgxwxXWhxXV2nLSXSO69HNfJ5+XYT9p6qTmI1VQc
         QZdEy1PtZpW5w84y0mo7L/QM0bm/1sw4mGbNZpGMvk4WqklciQURttyptXva6FfrrW5k
         zpHg==
X-Forwarded-Encrypted: i=1; AJvYcCWkNB5Axp4/JmcMkhc0Pl6o3Y3D+7crOA/S5kxvPABSM9657DJmBrG8mhfDSW3CZu6nwYs1bPFZDurlQLhC4TC12n6yQEAhrPm8ybQ9pWU=
X-Gm-Message-State: AOJu0Yx9goJKeSJNAKGDQ0cHa0QLAxI33GQXpI6a3NpAQj/j1DYO0cVS
	N5tzQN6Cs+Fuw+vZFV9oAZNcLM1MavOdfGK4XNfBrlqsj+YKvctNTmhmaqRrwW9dFEgKsr519U2
	s
X-Google-Smtp-Source: AGHT+IHxZioJ1ivSj7/6vhriNcf7lJvLiIzsNQXjwmdbS4OHSpGw6KNptDMdy5RyDtqnQJc7P0v4eQ==
X-Received: by 2002:a50:a69d:0:b0:57c:5d4a:4122 with SMTP id 4fb4d7f45d1cf-57d4bd59fbamr5445027a12.9.1719305521250;
        Tue, 25 Jun 2024 01:52:01 -0700 (PDT)
Message-ID: <9645ed2d-4e80-4214-853b-0186d4806a26@suse.com>
Date: Tue, 25 Jun 2024 10:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix rare error case in cpu_schedule_down()
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20240625082736.7238-1-jgross@suse.com>
 <1ed2364d-6960-4bb2-9f3c-ac672a97e74b@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <1ed2364d-6960-4bb2-9f3c-ac672a97e74b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.24 10:33, Jan Beulich wrote:
> On 25.06.2024 10:27, Juergen Gross wrote:
>> In case cpu_schedule_up() is failing to allocate memory for struct
>> sched_resource,
> 
> Or (just to mention it again) in case the function isn't called at all
> because some earlier CPU_UP_PREPARE handler fails.
> 
>> cpu_schedule_down() will be called with the
>> sched_resource pointer being NULL. This needs to be handled.
>>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Fixes: 207589dbacd4 ("xen/sched: move per cpu scheduler private data into struct sched_resource")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> You didn't tag it for 4.19 and you also didn't Cc Oleksii, so I expect you
> deem this minor enough to be delayed until 4.20 opens, despite the Fixes:
> tag?

Correct.


Juergen


