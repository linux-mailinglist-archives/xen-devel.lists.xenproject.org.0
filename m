Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D48BB47C
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 22:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716662.1118818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2zB7-0005GG-Be; Fri, 03 May 2024 20:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716662.1118818; Fri, 03 May 2024 20:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2zB7-0005Ds-8g; Fri, 03 May 2024 20:06:45 +0000
Received: by outflank-mailman (input) for mailman id 716662;
 Fri, 03 May 2024 20:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yvxW=MG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s2zB6-0005Dm-IO
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 20:06:44 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a884ddfb-0988-11ef-b4bb-af5377834399;
 Fri, 03 May 2024 22:06:42 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-79100a90868so85985a.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 13:06:42 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 mi8-20020a056214558800b006a0f4921e8esm1473716qvb.119.2024.05.03.13.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 13:06:41 -0700 (PDT)
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
X-Inumbo-ID: a884ddfb-0988-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714766801; x=1715371601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SvrvTcBjNiOYqdsvXGCgHprTsvcyK02R/zm/8t8sx5Y=;
        b=YBXxaPv7HpDFlExiEnLNk7pHdsfrRrob8ZGe76sJxbUJC4g64mgBK5oOM4u26iT5l6
         pQKkJmS2dUGYCVPdSXMWAaG+8jkBzLe3oaoP1XNk9zWZJhlMjm+8pCeOKcD7ojWs9QP+
         zORBs20abG17UJnAL0EV49qh9tvSXeT1e/YIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714766801; x=1715371601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvrvTcBjNiOYqdsvXGCgHprTsvcyK02R/zm/8t8sx5Y=;
        b=FjI657dxr+/MJT9YAqi8Vduyp00M7q1/rGZ39IwW/nIXkdtc3ubXwwDiEIlyvF57i7
         rPytDiN0MSYqBvgxy4ZiY4KRkSoeaEJBk4RcRhB8XRuxqbjnhXOBSkE/YGZ9zxcq9lRv
         UjSPgrCdQSVpJ6fDQxy1A27y94iQQTn6idxtcNn+A7KPz9QKVE2yvlWtifrvI7S7VtBc
         1FV07vifVyXBxog4Etae5AUyYWQNUNw4gHFlTwEd2spVMaIeOnNsz7/BO/E+SejagHjz
         +q9GGX6P9pVZ3pWM1LKI+2G8/Fbi5gJI4xaYz1n8TmvTmyE9E1s+F6pEMDut5F2e3/Dg
         sv4w==
X-Forwarded-Encrypted: i=1; AJvYcCVgG2RsiupWDxuM/u66KO49CW8ERxy1Vl3HZiM7IGRTSJCT/p7s1Dz1pRddKJOKO0oQg4w54YxP73WaRKdemPRr0EY9bWN7kjnA/aYNTMg=
X-Gm-Message-State: AOJu0YyhtAYNxZc694Y3ntkksGWv2WJug/yKc+pMD0wDTMwyAngsE/JY
	/lCK7BcUcAPBHTkxne/fVP+HQf4JJYYqlx0GIU+X0GBq9m0TmX+cpZnH4cANU7AOYE/Suv0f1zy
	q
X-Google-Smtp-Source: AGHT+IEQ5QoCl109htOi9NZWCTIaoULc38q7qxYXiUlqUOd71bDp9bz3BGJ79y3lrWutgcnJizmmgQ==
X-Received: by 2002:a05:6214:21c4:b0:6a0:cca2:6513 with SMTP id d4-20020a05621421c400b006a0cca26513mr4478794qvh.46.1714766801365;
        Fri, 03 May 2024 13:06:41 -0700 (PDT)
Message-ID: <b2857b11-9ae6-4768-bd0d-8c93b9a3d604@citrix.com>
Date: Fri, 3 May 2024 21:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [XEN PATCH 0/3] automation/eclair: do not allow
 failure for triggered analyses
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1714401209.git.federico.serafini@bugseng.com>
 <d24c9ef6-a7c8-4ee0-baff-b1585c788db1@citrix.com>
 <ecebd04a-1b95-4055-9f1c-a5468cc3bb1a@bugseng.com>
 <e4468587-318a-44f2-ba66-9a9c5e504052@citrix.com>
 <518e455a-4233-498c-b7b1-afa485508543@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <518e455a-4233-498c-b7b1-afa485508543@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/05/2024 9:01 pm, Federico Serafini wrote:
> On 03/05/24 21:46, Andrew Cooper wrote:
>> On 03/05/2024 8:44 pm, Federico Serafini wrote:
>>> On 03/05/24 21:14, Andrew Cooper wrote:
>>>> On 29/04/2024 4:21 pm, Federico Serafini wrote:
>>>>> Patch 1/3 does some preparation work.
>>>>>
>>>>> Patch 2/3, as the title says, removes allow_failure = true for
>>>>> triggered
>>>>> analyses.
>>>>>
>>>>> Patch 3/3 makes explicit that initally no files are tagged as
>>>>> adopted, this
>>>>> is needed by the scheduled analysis.
>>>>
>>>> I'm afraid that something in this series is broken.
>>>>
>>>> Since these patches went in, all pipelines are now getting a status of
>>>> blocked rather than passed.
>>>>
>>>> If I manually start the Eclair jobs, then eventually the pipeline gets
>>>> to Passed.
>>>
>>> Can you provide us a link to those failures?
>>> I am looking at gitlab xen-project/xen and xen-project/patchew
>>> and everything seems ok.
>>>
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1276081658
>> is the first one I noticed as blocked, and I manually ran.  That ended
>> up working.
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1277724847
>> is still in the blocked state.  The build-each-commit failure is
>> unrelated.
>
> This is intentional and was introduced by
> commit 7c1bf8661db5c00bd8c9a25015fe8678b2ff9ac6
>
> The ECLAIR analysis under people/* need to be activated
> manually.

Yes.  I know, and that matches the behaviour I saw.

>
> Is this causing some problems to the CI?
>

Yes.

See https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines

Prior to this series, the manual actions were not used but the pipeline
was overall in the Passed state.  Specifically, they ended up being skipped.

After this series, the manual actions are now blocking the pipeline, not
letting it complete, and not marking it as passed.

~Andrew

