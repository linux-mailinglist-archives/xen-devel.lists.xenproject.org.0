Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC2A5A441
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 21:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906819.1314202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trjIJ-0001Gf-AP; Mon, 10 Mar 2025 20:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906819.1314202; Mon, 10 Mar 2025 20:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trjIJ-0001Dz-7G; Mon, 10 Mar 2025 20:00:11 +0000
Received: by outflank-mailman (input) for mailman id 906819;
 Mon, 10 Mar 2025 20:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UYYE=V5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1trjIH-0001Dr-C8
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 20:00:09 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44366cb7-fdea-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 21:00:08 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso15719945e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 13:00:08 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cea1e041fsm92235765e9.23.2025.03.10.13.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 13:00:07 -0700 (PDT)
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
X-Inumbo-ID: 44366cb7-fdea-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741636807; x=1742241607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OxW7Z5w1m+QU8mPxDLgCVrhTjj2pjgURoSloPRibUlA=;
        b=anGYHeGm3AlvmfycqjDFNOFDPjYPsNmsFgoE/1XJHvFuzSG4TioEL8IssEwnZr6X4H
         DY2sSCV8OZyra+a/MI1iQs3HJM2r1FnF8SiPUQhVEbtFb+BxW+o8EDdR3sroJBL4iLlE
         7tJjb7Tza4+z3XP9f9dZNR/GdZ1pvwzVyn578=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741636807; x=1742241607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxW7Z5w1m+QU8mPxDLgCVrhTjj2pjgURoSloPRibUlA=;
        b=WH1ACGuk7+Eo9UFv+h+PtaqIIwGlceUwqN8HLou8J6CESIENJuy5eFpREJRBqowwyH
         xWYD8v2g8a+TBrT/OyUMiSmrg31fnpTlXJBlSMpFTrDdSh57UVT97eks7Z19hlmpJ3or
         A281lMmTJxo2Q4fygfJCyk7a3FTAdUUHz/0ZbYwiUh1fr+amheEfemT3kfio+jFGIWtB
         /Vp+vYiVtz01MakLvEl4DXOr4/FkQU+vE4SjwhuI1zf+rjTXO9cD9sZ4fHyo2PXImlR6
         gODP7V057Pzcx3jozA22fqDjSWz5eMGmO2uBGexRu3FLAe44pv5vrVKXJZfVWM+eXLUw
         zE4A==
X-Gm-Message-State: AOJu0Yy2/euTiwZdihq+lvU+45y2yg19OBTvbvdi2oK56JXOYJJYe4Xr
	7w10HkY664VqQCvHoETk99Pxy0+nSKrYyhaLqRG2ThBZrnr2mbzcc+Fy6PGsWok=
X-Gm-Gg: ASbGnct7MY89pZWNqMl0IGWjrwTfylZFAm90QAfrkeoKSkaiF7l+uad5Y/ZjMPXELEq
	8C0uyN2dQT+utIVeom62ryW2582PFnnG6Lt7Vh+GLREDxqMf5e6s7L5z04PNu8Jr2+h6G+OKMk+
	mGOfkX8RDqJSzZpEub5hGuivXcMZZ9KX1RnWr7Gd0DmN0i/kQOXkdx7YqIZn9OEsvBWXQRq98Pm
	+3uIBUbX/IyOjugd9ihd8uWRqpcMejNLojeroxyEXuD1F+2VoEKT6jcTEj1FzxPGH6noexhAgk+
	MV4/vrm9tmBoxFdg5Qb5TX6cBZRhD0SznW+QuJhhwavRikjENq1qka6kZZuPyjJ2Ph0eZ4ZrDqh
	BNj2978CE
X-Google-Smtp-Source: AGHT+IE18akr9YEFppq34L2cPbXOF0emAS1qTK1oSEKxTbtgqeecpuIamQA+FimK5RT9349/7RC52A==
X-Received: by 2002:a05:600c:1c81:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43d01be6389mr16366575e9.14.1741636807602;
        Mon, 10 Mar 2025 13:00:07 -0700 (PDT)
Message-ID: <d9b90141-3af1-4247-b900-0032d70ade0e@citrix.com>
Date: Mon, 10 Mar 2025 20:00:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation/cirrus-ci: store xen/.config as an artifact
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250310181638.51196-1-roger.pau@citrix.com>
 <b95a2bcc-4ab8-46d5-9d92-1f2c37d4c279@citrix.com>
 <Z88xmtUGw5k1nsBN@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z88xmtUGw5k1nsBN@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/03/2025 6:38 pm, Roger Pau Monné wrote:
> On Mon, Mar 10, 2025 at 06:30:15PM +0000, Andrew Cooper wrote:
>> On 10/03/2025 6:16 pm, Roger Pau Monne wrote:
>>> Always store xen/.config as an artifact, renamed to xen-config to match
>>> the naming used in the Gitlab CI tests.
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Looking at this, I suspect my failure was caused by trying to capture
>> ".config" directly.
>>
>>> ---
>>>  .cirrus.yml | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/.cirrus.yml b/.cirrus.yml
>>> index e2949d99d73a..1a39f5026f9a 100644
>>> --- a/.cirrus.yml
>>> +++ b/.cirrus.yml
>>> @@ -15,6 +15,14 @@ freebsd_template: &FREEBSD_ENV
>>>      APPEND_INCLUDES: /usr/local/include
>>>      CIRRUS_CLONE_DEPTH: 1
>>>  
>>> +freebsd_artifacts: &FREEBSD_ARTIFACTS
>>> +  always:
>>> +    rename_script:
>>> +      - cp xen/.config xen-config
>>> +    config_artifacts:
>>> +      path: xen-config
>>> +      type: text/plain
>> Can't this be part of freebsd_template directly?
>>
>> Or is there an ordering problem with the regular build_script ?
> Exactly, that was my first attempt (placing it in freebsd_template),
> but then the collection would be done before the build, as
> freebsd_template sets the env variables ahead of the build, see:
>
> https://cirrus-ci.com/task/5086615544004608
>
> Thanks, Roger.

Ok.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

