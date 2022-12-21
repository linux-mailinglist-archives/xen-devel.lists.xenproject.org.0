Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534465300D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 12:10:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467798.726848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wyz-0002z4-D2; Wed, 21 Dec 2022 11:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467798.726848; Wed, 21 Dec 2022 11:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wyz-0002wV-9t; Wed, 21 Dec 2022 11:09:57 +0000
Received: by outflank-mailman (input) for mailman id 467798;
 Wed, 21 Dec 2022 11:09:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eskD=4T=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p7wyx-0002wP-PW
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 11:09:55 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff5f6f51-811f-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 12:09:54 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id jo4so27069606ejb.7
 for <xen-devel@lists.xenproject.org>; Wed, 21 Dec 2022 03:09:54 -0800 (PST)
Received: from [192.168.1.93] (adsl-43.109.242.137.tellas.gr. [109.242.137.43])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b007adaca75bd0sm7101932ejc.179.2022.12.21.03.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 03:09:53 -0800 (PST)
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
X-Inumbo-ID: ff5f6f51-811f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lz7V62ob0W7ULFZR9Dt+uA/3bqsdmMb7IEf6Uj2oFO0=;
        b=iqNu7rEQ3RAu3XoUp1zeT04UvlfQU/PR+WyOz9yIkuyDlZIv035MW7ki8Ce0idPeaW
         t4AKUObyoH0+eSWa7swujbVG0XJBqJ4rBpnE3XuSxv9FA1ZSj1+HxBOzxkEs0dqatdH+
         uPA1gvc6eXuwi5y6Jgg+hg0/R5yOLXP0vBKVcs/mqrF5BhsozrJc6IhYz8n4sHctrB3i
         D8wVj9gYsae2xzLnP7S6uNCd6CzJU/hgfkvwaneIbK9CzqPqa6d56snjTPtm6gX6lxTu
         P8IvMa3Ov/X3uVh/cwL8jlHztd9PNKMovQ19GYMD4sX3+EUM0S8nfhj/1EGiaXUZoFcU
         xVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lz7V62ob0W7ULFZR9Dt+uA/3bqsdmMb7IEf6Uj2oFO0=;
        b=Xdl3t86DJz3/5+eSKUZvUXx9NaOQWIYByh97bR6Y1crKE52LJ2P+1dP6ykBG0GzWSx
         r954fa4dKiu7OMBl5toKkD/VaXJQJXMI51jnlxaqgtA3yafaCFFy/0Ls57ZhTLy75VPw
         iLB6QlM90rKjwzMz3Gxp4aFxMrK60enLghqEdn907Tkjy4pgA0uVxErR7w0N0vdK/dbN
         61tVkLpNa8dHnzjG2SLeW48H6MrfMwop2AJT4tJoEE622cT7wyIqiASIxwfaLIoLaDv1
         5wAm2O9WJojeb+3pb86MSbat/AExYA4xs0rRsAoDKjY61jnZbE91/pxNflBk+uDUh3cS
         sNsg==
X-Gm-Message-State: AFqh2kq88fzDmTW2IOgyXNod6CVQY5PKBrBayV78AupGlPU3VVJaBycG
	t+fiZ/cMBXnEoK4Nxvhma3w=
X-Google-Smtp-Source: AMrXdXsmiKO28F72bT4pxjHkdRyB2gUkZchePhrSIZqm4jztUc47FHMNCnqoOdEBkgj2O7m12sWCTQ==
X-Received: by 2002:a17:906:7747:b0:840:604:1da1 with SMTP id o7-20020a170906774700b0084006041da1mr505092ejn.61.1671620994308;
        Wed, 21 Dec 2022 03:09:54 -0800 (PST)
Message-ID: <30a7a4c5-4a5c-7610-e535-98cf8d95fc72@gmail.com>
Date: Wed, 21 Dec 2022 13:09:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 6/7] x86/iommu: call pi_update_irte through an hvm_function
 callback
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-7-burzalodowa@gmail.com>
 <d7f12b04-1077-cfc9-25a9-0eba37dde753@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <d7f12b04-1077-cfc9-25a9-0eba37dde753@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/21/22 12:13, Jan Beulich wrote:
> On 19.12.2022 07:34, Xenia Ragiadakou wrote:
>> @@ -774,6 +779,16 @@ static inline void hvm_set_nonreg_state(struct vcpu *v,
>>           alternative_vcall(hvm_funcs.set_nonreg_state, v, nrs);
>>   }
>>   
>> +static inline int hvm_pi_update_irte(const struct vcpu *v,
>> +                                     const struct pirq *pirq, uint8_t gvec)
> 
> Why "int" as return type when both call sites ignore the return value?

Because the original function returned int. I 'm not sure though why the 
returned value is ignored.

> 
>> @@ -893,6 +908,13 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>>       ASSERT_UNREACHABLE();
>>   }
>>   
>> +static inline int hvm_pi_update_irte(const struct vcpu *v,
>> +                                     const struct pirq *pirq, uint8_t gvec)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +    return -EOPNOTSUPP;
>> +}
> 
> I don't think you need this stub - both callers live in a file which
> is built only for HVM=y anyway.

That's true. I will remove it.

> 
> Jan

-- 
Xenia

