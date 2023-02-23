Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828806A067C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 11:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500187.771445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV93g-0000Lq-2x; Thu, 23 Feb 2023 10:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500187.771445; Thu, 23 Feb 2023 10:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV93g-0000JM-00; Thu, 23 Feb 2023 10:42:40 +0000
Received: by outflank-mailman (input) for mailman id 500187;
 Thu, 23 Feb 2023 10:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPya=6T=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pV93e-0000JF-FM
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 10:42:38 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8c25e48-b366-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 11:42:36 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id ck15so41729734edb.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 02:42:35 -0800 (PST)
Received: from [192.168.1.93] ([188.73.239.233])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a170906234800b008ee95ccfe06sm465249eja.119.2023.02.23.02.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 02:42:34 -0800 (PST)
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
X-Inumbo-ID: c8c25e48-b366-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsN5YYuPdNocgRGsMLvv1OEBLpbu8D5TeM+joTYuWlA=;
        b=pu8kzaaA5GgVLX5muleJO5vAD7C7a7G/La2ERoIuSDAa/zmmtwace6bZnDV4on6Phk
         iGsdggHE/osbmHtQHEIXU38mrq37jPL/XD49FD1Q4GCxxvfQwYI9hpE3VqiBIQj3mlvU
         D2IhqkNsSKROm5+Kl46Y4uPzt682xc4+VvSCa6PS5jpcgJfubY2YRZguoRV3osznjV95
         ZSxfqo0bdH1wuWJuA4EOFMxQWE3zmG7PxozPFlVRD99RnK5AU++rgstirfyJTFLKeQ6U
         BITLekUYTKTsn1rPYN28bCYmQlUEcUtoVAz+vHAoG2K31IRdsMMX0YL+BM6L8wvePYC9
         +igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gsN5YYuPdNocgRGsMLvv1OEBLpbu8D5TeM+joTYuWlA=;
        b=2DDMoWFyxmEuhZRzC2eUze+2mLo0hD7RBAixKpIGKywkvvrty6LkoKsKD25ZUqvPNL
         WQpdbrqZ+6wzNHjnpDKjC0+/OyK8J/4upjck2q8FclUShJxgInx7BAcPfpSqjpKcIrdO
         mLQuudzfVWAouDnlWMHFHjPpU4uBslEY2ufEt4igDqDBVcsv8CrsnJO8P4ZiTfBVfItG
         KMsHAgK+cSpnXvAHr+sdQ1lvlmMMUDnPv7N4fnHOjskC7o2mMzAGlbrQjxc353sg+CjC
         /I7b1VInpVapZzJfh+uZOlu1OXbrut/g03S5LeZWgNDVNU6ui3fyCGnGJMGWzg2x6/zX
         VvfQ==
X-Gm-Message-State: AO0yUKU7HGRvf1GLwakVYQoJS7xAQx9eQkEVG1q3nasmBWRU3U7ZEm9x
	BovwzI9OgxZgtEtaWmO90Vo=
X-Google-Smtp-Source: AK7set+TL2O088dZFr6W/bEl5c4rfizD8VXVm5NaHQbeXSPZDbcGTM2/1eFwCsQDbBcnjBQuyZHt7A==
X-Received: by 2002:a17:906:ce24:b0:8bf:e95c:467b with SMTP id sd4-20020a170906ce2400b008bfe95c467bmr16947411ejb.63.1677148954996;
        Thu, 23 Feb 2023 02:42:34 -0800 (PST)
Message-ID: <b4b81320-7b3b-1712-29b1-82ffdd03a4c8@gmail.com>
Date: Thu, 23 Feb 2023 12:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/9] x86/vmx: remove unused included headers from vmx.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-5-burzalodowa@gmail.com>
 <63295275-fd2d-6145-6516-d2dfb95fbffd@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <63295275-fd2d-6145-6516-d2dfb95fbffd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/23/23 12:29, Jan Beulich wrote:
> On 22.02.2023 13:00, Xenia Ragiadakou wrote:
>> Do not include the headers:
>>    asm/i387.h
>>    asm/hvm/trace.h
>>    asm/processor.h
>>    asm/regs.h
>> because none of the declarations and macro definitions in them is used in
>> this file. Sort the rest of the headers alphabetically.
>> Fix build by including asm/i387.h in vmx.c, needed for vcpu_restore_fpu_lazy().
> 
> Nit: You don't really "fix" the build, you keep it working.

Ok I will rephrase it in v3.

> 
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> In principle
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> but ...
> 
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> @@ -19,14 +19,11 @@
>>   #define __ASM_X86_HVM_VMX_VMX_H__
>>   
>>   #include <xen/sched.h>
>> -#include <asm/types.h>
>> -#include <asm/regs.h>
>> +
>>   #include <asm/asm_defns.h>
>> -#include <asm/processor.h>
>> -#include <asm/p2m.h>
>> -#include <asm/i387.h>
>> -#include <asm/hvm/trace.h>
>>   #include <asm/hvm/vmx/vmcs.h>
>> +#include <asm/p2m.h>
>> +#include <asm/types.h>
> 
> ... can this please become xen/types.h (and move up accordingly), so
> things won't break here when my further work in that area lands?

Sure.

> 
> Jan

-- 
Xenia

