Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA8F6A06E4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 12:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500217.771488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9LF-0005BG-JC; Thu, 23 Feb 2023 11:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500217.771488; Thu, 23 Feb 2023 11:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9LF-00058a-Fp; Thu, 23 Feb 2023 11:00:49 +0000
Received: by outflank-mailman (input) for mailman id 500217;
 Thu, 23 Feb 2023 11:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPya=6T=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pV9LE-00058U-Cc
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 11:00:48 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53693e03-b369-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 12:00:47 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id o12so41062875edb.9
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 03:00:47 -0800 (PST)
Received: from [192.168.1.93] (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.gmail.com with ESMTPSA id
 f4-20020a170906738400b008e40853a712sm2481851ejl.97.2023.02.23.03.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 03:00:46 -0800 (PST)
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
X-Inumbo-ID: 53693e03-b369-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVXWTUrNd1TNix77QqBFuAw8kf5KseOjZOnzVlXKMrY=;
        b=omehPegF0APS39BHtT3MT63qJ/GUp4wq3H2wUNZEuJ62tQBQWVwx/7hnHjDP6/d9I4
         YDD37oRDnuuwfhrR/jcnLA91MTFVub8fmORE2DWGh4umuf8fuE6tvooFuRrQQkxfn+J8
         9oqnPbanl33cF+LYfF/gzKfd04kEWvVvyMgl8qRWmkaYglardVtxjzCifAb9QOvHyisK
         2AZxJXI0OrAAfG0ZmhTeX3IlWVSctjc+KsOypP7xkrzbh2ZZqYoasdVybdUHd99iM2tU
         qyi/NQtEw+3Hm6DEZL6TOGlSipF1S/gOUZwNvvg/GrGuL7IIBrmvHV7x8XabpWGy0/Za
         F4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVXWTUrNd1TNix77QqBFuAw8kf5KseOjZOnzVlXKMrY=;
        b=MmcmFQd09ybH+JpPdOu+FFX3RVVdRHVMwGKuhwc7HZPM/y+IctSjbqfK+jRfBrn9ZI
         okoNMd+mRc1FueATnkZxRUv4WOHNuIFmVKAxrH4JjKP+YEFErFC0TYrrY7eAFC4Q+Snw
         RJ3BjUMLotnvyqhafc5TDuxjC3SjuGFVMZL5EFA1gAmXb6vYBh6+Ho0TxsNYDI76hceZ
         aFEjrUMS1SFi3olgIvLTNk5IvJrABNzAfv8RmzD8XuNsHr9EOUxq1g7Zoy143aVMEjPr
         tDE+BOg5LXW/q2t62y2MLZMl07ZD22Yia15JptwkO0paAjk2rF/Gy45prABAcIkhiLGz
         o2jA==
X-Gm-Message-State: AO0yUKWkTTBcZ8+kLYa+gjgc1hbWf6cw34d2rL0qfIPIytCGePV4Twgi
	wgAdeqjHaF1J9KcNln3KqqY=
X-Google-Smtp-Source: AK7set+b9HPf+kOSIoGwBhTrCLkWIXobRscwIEB7WfIX7peDwxglVbLG8lwdlND7OE+9ZwusC63Lxg==
X-Received: by 2002:a17:906:10d8:b0:8b1:2dd3:cb45 with SMTP id v24-20020a17090610d800b008b12dd3cb45mr19122668ejv.42.1677150046755;
        Thu, 23 Feb 2023 03:00:46 -0800 (PST)
Message-ID: <5635ff9b-1ec0-2798-1bb9-6e18c2cc7d54@gmail.com>
Date: Thu, 23 Feb 2023 13:00:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/9] x86/svm: remove unused forward declaration of
 struct vcpu from svm.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-2-burzalodowa@gmail.com>
 <d3d892a5-c641-c945-0f07-9bf0e8cf5e80@suse.com>
 <fddfa8d2-fa32-83a6-0781-08999dea31d7@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <fddfa8d2-fa32-83a6-0781-08999dea31d7@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/23/23 12:50, Andrew Cooper wrote:
> On 22/02/2023 12:59 pm, Jan Beulich wrote:
>> On 22.02.2023 13:00, Xenia Ragiadakou wrote:
>>> Remove forward declaration of struct vcpu, that is a leftover since
>>> the removal of svm_update_guest_cr()'s declaration from svm.h.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>>> Fixes: b158e72abe30 ("x86/hvm: CFI hardening for hvm_funcs")
>> I'm a little puzzled by this (a stray forward decl of a struct isn't
>> really a bug imo), but ...
>>> ---
>>>
>>> Changes in v2:
>>>    - leave the forward declaration of struct cpu_user_regs in place,
>>>      suggested by Andrew
>>>    - add a fixes tag based on Andrew's comment
>> ... I realize you were asked to add it. (As a minor remark, more
>> commonly the Fixes: tag would come ahead of the S-o-b: one, I think.)
> 
> I didn't intend my reply to mean "put in a fixes tag".  I was just
> trying to make an observation.  But it doesn't hurt either.
> 
> But I do agree that a Fixes tag ought to be ahead of a SoB tag.  Where
> possible, we put tags in chronological order.
> 
> I can fix that on commit.

Thanks. I ve added it just for reference. It s ok to remove it.

> 
> ~Andrew

-- 
Xenia

