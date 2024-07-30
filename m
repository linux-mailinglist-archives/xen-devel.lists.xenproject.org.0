Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB23940B27
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 10:20:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767362.1177962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYi5K-00043m-PK; Tue, 30 Jul 2024 08:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767362.1177962; Tue, 30 Jul 2024 08:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYi5K-00041T-Mo; Tue, 30 Jul 2024 08:19:54 +0000
Received: by outflank-mailman (input) for mailman id 767362;
 Tue, 30 Jul 2024 08:19:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnHO=O6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sYi5J-00041N-5F
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 08:19:53 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dfda483-4e4c-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 10:19:51 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-59589a9be92so6571704a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 01:19:51 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41462sm599013366b.119.2024.07.30.01.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 01:19:50 -0700 (PDT)
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
X-Inumbo-ID: 7dfda483-4e4c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722327590; x=1722932390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Avtw4N1eR+GiFCtanmTPhq54KY38UjoQBkTBOJ8ucHg=;
        b=Xum7bXlai1fQZqzw7cDEYLb9NIeBYy5UmOVrkjLYUHm7QuqCC5OrH3yiqsw14kY0v1
         85HIGGWSe+PWcZ9m7S4UWECwuyqkAz8PQIhf5NlXPxT9O3HWjB/KGRvWt8xUkF2hODe8
         jJaoJL7KuKljA388V/gbShskb2yiTvHxR3tYexwI3aTcS3mW2LcBwIrizdUSPsOa9rVN
         w6qAYTHjWJQRlH8CYwVMKlheJXSxcFBeRh2pQ+XwhK7whM0kqBH4LXv3SaG3D5hlJAzk
         ZhcHxuwmXDbyIA2IErSIzqJQ2enZFxJJgjWk1aqX2k6UtRN/riwskzSkdqIH7JIUB/Nw
         RZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722327590; x=1722932390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Avtw4N1eR+GiFCtanmTPhq54KY38UjoQBkTBOJ8ucHg=;
        b=S1FehHXPD9DR4/zyY07dsFZlMqztSH9dxixDN/TBXVQ0eaoDSbg+nryhjIAz71ojhj
         zdzMYROSywtPqD4vxNc3kj9OjU7CIXex+QKAc28fjvQO9TRVCyNdN+Iq46XQaFRRJYXK
         7dzn7CQJmyOKcW4kLn/IyL3xSp/TtmXHNNTvvuBa8YFDH4vu8tVrK+1mojkMoMsbOgt/
         Zr45IX99P/stCMWQoURqlGwvSup/8LyQYRqI/7ZrnDSYn/WO/ky2KjHop4cYSDxgUkAR
         oSWurFV+UXbPM1ockxD0kXrfz1znUclqlCRCG4u+N2ePmwXaMSKSPOQO9A4DohwOidu9
         BT4w==
X-Forwarded-Encrypted: i=1; AJvYcCU1PSBrY4HmN5ridwesezYHoZvxMIcekpRHMWX5Tj+unqn8Dg3NNnuYVLJwK/Kb6p8mh/Ufqv3wDEr4zlCsVtv03sFvq+Ape4v1pfqnpLc=
X-Gm-Message-State: AOJu0YxR+o7WWWGnu/W9cao2ZIR3WLDR9vWb40a69xwfaoZGa+2TTWTh
	sOb1BTagpVR9Bj5wKUEztYXOvAWzXR4hd6xUHwIOfnYM5X4wn0Ex+deTVocOsss=
X-Google-Smtp-Source: AGHT+IFtJfbuc2u/eqs3fRRONElGEKaG14fTy9PG8wn0MX65Vt4oWxjVm5SNDXnIIsDaAG7fIWy+1g==
X-Received: by 2002:a17:907:72c1:b0:a7a:8876:4427 with SMTP id a640c23a62f3a-a7d40071af4mr757772966b.25.1722327590535;
        Tue, 30 Jul 2024 01:19:50 -0700 (PDT)
Message-ID: <8270bede-d548-481b-b349-e305a4f574c8@suse.com>
Date: Tue, 30 Jul 2024 10:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen: silence maybe-unitialized warning
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-3-stewart.hildebrand@amd.com>
 <b49f76cb-f22e-498e-83ae-68cc9840c48d@suse.com>
 <e816ca86-3b1f-42ea-b338-de73d9fb6370@amd.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <e816ca86-3b1f-42ea-b338-de73d9fb6370@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.07.24 21:01, Stewart Hildebrand wrote:
> On 7/29/24 11:03, Jürgen Groß wrote:
>> On 29.07.24 16:24, Stewart Hildebrand wrote:
>>> When building with gcc with -finstrument-functions, optimization level
>>> -O1, CONFIG_HYPFS=y and # CONFIG_HAS_SCHED_GRANULARITY is not set, the
>>> the following build warning (error) is encountered:
>>>
>>> common/sched/cpupool.c: In function ‘cpupool_gran_write’:
>>> common/sched/cpupool.c:1220:26: error: ‘gran’ may be used uninitialized [-Werror=maybe-uninitialized]
>>>    1220 |                      0 : cpupool_check_granularity(gran);
>>>         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> common/sched/cpupool.c:1207:21: note: ‘gran’ declared here
>>>    1207 |     enum sched_gran gran;
>>>         |                     ^~~~
>>>
>>> This is a false positive. Silence the warning (error) by initializing
>>> the variable.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Thanks!
> 
> It just occurred to me: should the subject prefix be xen/cpupool:
> instead of plain xen: ?

Probably, yes.


Juergen

