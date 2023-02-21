Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857D369DEEF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498799.769717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQw3-0000Dh-HH; Tue, 21 Feb 2023 11:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498799.769717; Tue, 21 Feb 2023 11:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQw3-0000B8-EJ; Tue, 21 Feb 2023 11:35:51 +0000
Received: by outflank-mailman (input) for mailman id 498799;
 Tue, 21 Feb 2023 11:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RUos=6R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUQw1-0000B0-QU
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:35:49 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccb2448c-b1db-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 12:35:11 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id o12so16308154edb.9
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 03:35:47 -0800 (PST)
Received: from [192.168.1.93] (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.gmail.com with ESMTPSA id
 r3-20020a50aac3000000b004ad745b8506sm3195559edc.34.2023.02.21.03.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:35:46 -0800 (PST)
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
X-Inumbo-ID: ccb2448c-b1db-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grGr8FjyLpEbOiecwKSx+QmMcxw3brJvaL15RF60xw0=;
        b=hbG5uBKD4QWvF+/APB386Q/zkx4UdhJ7+2DBH9+dkWEj0ppU0XwViYwAUqnmwHNFla
         043lE9DhX5SMUh5kgUQwJTOpJDVTjv3K+xpvXGg/WZiRWaC3775RxvQaA5P4AwEQ/9J7
         UtM8jZ2wqizsU9AeEDO+/GCG+KAYf49HAccJvhq5QUd+Z0woRjzh84CC0qcUohESuRj/
         hY51bpIkpteyyIAY+RUXPpGNmRkp5Kq5DOc2YgH2U+aIMV3FDx2s2M9xD0xiPzBS6En1
         uE4B9fcChcYSnKBZFZkupSJgG0K5PJMqhGwNflI7s5+Y7K9EZI07rfj1l1+v+Dl96Vm8
         xo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grGr8FjyLpEbOiecwKSx+QmMcxw3brJvaL15RF60xw0=;
        b=LOfget5WK16LHQQilmrXWnAV3jmmkh3Ggsxp0HlmRhvNGhKM/rTssjMuPAXtOrIFtQ
         hz5X9TDKbpRl/CKlHM5cheKKC7QIdLqzaTu+IEeFdn2vpHEYfW376dd5i+EuQX3An2Og
         TX7YDxd/3bHimIZ8E7OxPLexzwK5kOgalC/wHogdumQMUoW0T0Ky9GtgHDciZBaqKrFO
         lWxnX/kffKRpXlo+psC58CLuJl2Ds0B5bYFdZwVa64CThusrXF0NWy7pUD0wR9X3RUM1
         im6Dqy6cPl0Vlf5DUplEgWO12KUJDrZX0pG7dYMq57lgWdc5qSyp2QhwWGXlRz4wBuTj
         y/9A==
X-Gm-Message-State: AO0yUKWiiE+oTyfzPYDY3KTSfe+3j5XK4r0JHbSsQJl2y2txEwjv2Png
	qS8sZX03GOj7yi2/3JDxDGk=
X-Google-Smtp-Source: AK7set8lRS6TB07A5bgoOcB6Kz47PcMvPomLkymjgWAB/RU4JA8sBzTPSM2+3JFDZxgM5afAT++NGw==
X-Received: by 2002:a50:ec8d:0:b0:4aa:a390:bf4a with SMTP id e13-20020a50ec8d000000b004aaa390bf4amr5433170edr.20.1676979347377;
        Tue, 21 Feb 2023 03:35:47 -0800 (PST)
Message-ID: <dc7f5a3f-2a5a-e745-991b-13f12126677f@gmail.com>
Date: Tue, 21 Feb 2023 13:35:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] x86/vmx: cleanup vmx.c
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-4-burzalodowa@gmail.com>
 <3477e48c-e6bc-af9d-65a9-c6c0556318ad@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <3477e48c-e6bc-af9d-65a9-c6c0556318ad@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 2/21/23 13:26, Jan Beulich wrote:
> On 17.02.2023 19:48, Xenia Ragiadakou wrote:
>> Do not include the headers:
>>    asm/hvm/vpic.h
>>    asm/hvm/vpt.h
>>    asm/io.h
>>    asm/mce.h
>>    asm/mem_sharing.h
>>    asm/regs.h
>>    public/arch-x86/cpuid.h
>>    public/hvm/save.h
>> because none of the declarations and macro definitions in them is used.
>> Sort alphabetically the rest of the headers.
>>
>> Rearrange the code to replace all forward declarations with the function
>> definitions.
>>
>> Replace double new lines with one.
>>
>> Reduce scope of nvmx_enqueue_n2_exceptions() to static because it is used
>> only in this file.
>>
>> Move vmx_update_debug_state() in vmcs.c because it is used only in this file
>> and limit its scope to this file by declaring it static and removing its
>> declaration from vmx.h.
>>
>> Take the opportunity to remove all trailing spaces in vmx.c.
>>
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>   xen/arch/x86/hvm/vmx/vmcs.c            |   12 +
>>   xen/arch/x86/hvm/vmx/vmx.c             | 5844 ++++++++++++------------
>>   xen/arch/x86/include/asm/hvm/vmx/vmx.h |    1 -
>>   3 files changed, 2913 insertions(+), 2944 deletions(-)
> 
> I'm afraid this is close to unreviewable and hence absolutely needs splitting.
> With this massive amount of re-arrangement (it's half of vmx.c, after all) I'm
> also concerned of losing "git blame"-ability for fair parts of the code there.

I understand. Let me split the changes apart from the one that 
rearranges the code. Do you agree in principle? or do you want me to 
except and sth else?

> 
> Jan

-- 
Xenia

