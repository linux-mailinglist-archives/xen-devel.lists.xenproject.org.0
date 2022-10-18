Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C27D60294F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 12:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424828.672547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okjpC-0002ls-QG; Tue, 18 Oct 2022 10:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424828.672547; Tue, 18 Oct 2022 10:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okjpC-0002jR-Mp; Tue, 18 Oct 2022 10:27:54 +0000
Received: by outflank-mailman (input) for mailman id 424828;
 Tue, 18 Oct 2022 10:27:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5CF=2T=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1okjpB-0002jL-Q8
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 10:27:53 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8427ee09-4ecf-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 12:27:52 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id b12so19775074edd.6
 for <xen-devel@lists.xenproject.org>; Tue, 18 Oct 2022 03:27:50 -0700 (PDT)
Received: from [192.168.1.93] (adsl-46.176.58.194.tellas.gr. [176.58.194.46])
 by smtp.gmail.com with ESMTPSA id
 3-20020a170906318300b0078c213ad441sm7330127ejy.101.2022.10.18.03.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 03:27:49 -0700 (PDT)
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
X-Inumbo-ID: 8427ee09-4ecf-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zX11Xw/h+8sd4YDjRtPuRoWYPSIUhHXGmBSMfYZQbFA=;
        b=fS6k+MjNP1ipepGVqqH7rPzuAluGBrqbOUrz0rIxFagdBwCKp1Hr/2ugkP80BAjRyz
         2eRmO73AJi8WKIpiGz/O8Xuwc0FnOgaDbeDrnLsSGsczba5fB10v5W42aPtIcWTrDsAn
         FZRPPTgnmj/PaHbimABGK43pMh4zWAwVnTWdc9uoiqLEC6e0U/DIWfqjn+JxKL88Rc7H
         /0vUtSQD/YggSomGHsSEviNyXf3BdNvK+ChP5/gW13CE2TclbW1FD8mWgY62CknhPd+T
         iFjpOPwqlGVFHTkdgYYJX67div/0L5+B3tlJzoaOJ7ywr3zxnfhSdVAsyh5TkXmAGL7o
         YUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zX11Xw/h+8sd4YDjRtPuRoWYPSIUhHXGmBSMfYZQbFA=;
        b=aDVOFPcVj9ajEYo7LQLncJI3OWcZb7ItraZkg/6xD9PPxWm9EQ7SRh5gbCHL6DXVmo
         b4FHhcVzl+Pl1BZ+JZEgqpDniCRPViCujQYtv9WZfm6PuiZQa6X/k2Fgh0ZHRN5usSRi
         c43PCrd7TP0CbhM+W9avG0suE9pWDo5NZDUtAAZutrNPBSPVzSbWoa4GL/gFgTDMOOyL
         rpDbFCg0xarmHeG9qsF20gjM6Sfocw/RQdmUe3PlEC0mdI7bpuU458FDfr+BSmcCElZx
         HZ0PelVQpJQ7uCgnxabI9PK8CQLo6mGTFoherlDrRUCC38gcS+HzACR31IMMKHjNM3aP
         la9g==
X-Gm-Message-State: ACrzQf0M4gHDml4vwXbo8v34Y267KhBYZzh7Ul4F2EVb5xtmhh69yj/q
	kkBjg5+l0rf60dr6QUci8oen/7Uk0ZY=
X-Google-Smtp-Source: AMsMyM7HmJLyte/OXb/kzVr/8xo8o9M/HQWXaAOSPOu9x+Id4tJi/ISeMDEz3fRuxELi9GM7EhyFow==
X-Received: by 2002:a05:6402:51c9:b0:45d:5efe:d1a3 with SMTP id r9-20020a05640251c900b0045d5efed1a3mr1944881edd.58.1666088870032;
        Tue, 18 Oct 2022 03:27:50 -0700 (PDT)
Message-ID: <65b46c0e-3499-ce6c-dcd6-76c506115c6e@gmail.com>
Date: Tue, 18 Oct 2022 13:27:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm: p2m: fix pa_range_info for 52-bit pa range
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221017173209.236781-1-burzalodowa@gmail.com>
 <ddef5ab7-c217-546d-0e5d-294465a49586@amd.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <ddef5ab7-c217-546d-0e5d-294465a49586@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/22 12:02, Michal Orzel wrote:

Hi Michal,

> Hi Xenia,
> 
> On 17/10/2022 19:32, Xenia Ragiadakou wrote:
>>
>>
>> Currently the pa_range_info for the 52-bit pa range advertizes that the
>> p2m root table consists of 8 concatenated tables at level 3, which does
>> not make much sense.
> I think the current code advertises 8 concatenated tables at level -1 (sl0=3 -> root_level=-1)
> which is obviously incorrect, but the commit msg should be updated.

I did the same mistake in my email but I did not want to hijack the 
thread that 's why I did not come back to correct my error.
According to the manual, to support 52-bit pa range with 4KB granule 
with the root table at level -1, you need to set SL2=1 and SL0=0.
SL0=3 configures the root table at level 3.

> Funnily enough p2m_root_level is unsigned so it would lead to overflow
> (p2m_root_level would end up with (1 << 32) - 1 instead of -1).

Actually, currently, there is no support at all in XEN neither for LPA 
(LPA support for 4KB is not checked, VCTR DS and SL2 are not set etc) 
nor level -1 (the root table level is determined only based on sl0, the 
number of possible levels is hardcoded to 4 in many places etc). I don't 
think that there is even support for accessing other than the first 
table of concatenated root tables but I need to verify that (I assume 
this based on the way LPAE_TABLE_INDEX_GS is implemented).

This entry is populated in the pa_range_info table just to prevent XEN 
from falling into this
if ( pa_range >= ARRAY_SIZE(pa_range_info) || 
!pa_range_info[pa_range].pabits )
         panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", 
pa_range);

> 
>> In order to support the 52-bit pa size with 4KB granule, the p2m root
>> table needs to be configured either as a single table at level -1 or
>> as 16 concatenated tables at level 0.
>> Since, currently there is not support for level -1, set the
>> root_order and sl0 fields of the corresponding pa_range_info according
>> to the second approach.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal
> 

-- 
Xenia

