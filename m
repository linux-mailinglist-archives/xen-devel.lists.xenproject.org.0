Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17D823D053
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 21:48:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3POF-0008IK-UX; Wed, 05 Aug 2020 19:47:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8Yv=BP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3POE-0008IC-HZ
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 19:47:54 +0000
X-Inumbo-ID: 7a255ee2-1706-4ec3-ab00-a1104ec5ec9b
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a255ee2-1706-4ec3-ab00-a1104ec5ec9b;
 Wed, 05 Aug 2020 19:47:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w25so13624032ljo.12
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2020 12:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/yzQDCFHb8N/iu1mEclfX2vLmhK7Prxz29nas03P9gc=;
 b=tLK28cuHfe+Jku4cyAekXRvs/I7yBznKrFAZh7SlzogAEJkxFAx4Fxd4TwnOHhiuoX
 fOnV/8cspOuZyVIQBZHV9q5xqSFidHRE8LdEIlyVua4LV8WTOQPzTIz2PGePf++eRWcB
 Jl3HGYSceOo9q/Ky+XM0Laswh9pORc61ft+SBnjss2bInDZ/JBvj1kt3hLD+xnoBF+6q
 BhRLALuZWj8+1OAjG/aqTyIsmGQ9JFHlQnioWtl0gQPVnAZu5gSVmxGSY1BUafhMrvPc
 nZh1up4/DuZgdXXYAe6BtgObaf+54+17sHjEtYHB21B3vPAmh0MIUuztJdxrpkz466fI
 DPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/yzQDCFHb8N/iu1mEclfX2vLmhK7Prxz29nas03P9gc=;
 b=r598zQ10rIwXcOztKYdaj0Sn/8da8riBOcV665x5vCvJlY55cNj9EUyyWoq0Aq5QXH
 PNmJmvR1aBnsJFqaNGbrUrEX4QDdxPymoGKPB3hux4gttS8kD4UpbopHcs4i7N9Qn1bf
 9mOuRrx7upXF7Uj3klXIYXoCdnG/lwLXGKdk7ydm3CFDKzzAU5NsUZstqh9npzX+FJGB
 /65/r7CFZW/DSfSkH9msaNh1lMaAAx/muzQPVHOS4AO8PTfnPaFac0fmaViz0QfX3YrN
 NhOz3KLuildFBChXOt31VUd9EqKlJnSpSZIsj+Mmh9HV8iUa62RqFLL5K+uNxLL9Nm5l
 X/Eg==
X-Gm-Message-State: AOAM533vO80dgZHadGIznuonWFQeK0sVTsBc4M5q0/XnHz5b3LeT6Nph
 x3kEPP6OiB+7duCxd0+01Yk=
X-Google-Smtp-Source: ABdhPJz+jmjFLhuKpEPWc+xVepbfummzg7jPFn7vK7BVEAxGp6mDVWBf39u6y6Wb4D0C3846UTaNdQ==
X-Received: by 2002:a2e:8612:: with SMTP id a18mr2249468lji.149.1596656872510; 
 Wed, 05 Aug 2020 12:47:52 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a9sm1267009ljb.57.2020.08.05.12.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 12:47:52 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <a052e9ad-b6a9-ac61-ec04-4daa4bcd39f2@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c0437ed6-fcd0-8add-280c-a71224426cf0@gmail.com>
Date: Wed, 5 Aug 2020 22:47:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a052e9ad-b6a9-ac61-ec04-4daa4bcd39f2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 19:13, Jan Beulich wrote:

Hi, Jan

> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -713,14 +713,14 @@ static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int
>>       }
>>   }
>>   
>> +#endif /* CONFIG_X86 */
>> +
>>   static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
>>   {
>>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>>       return xsm_default_action(action, current->domain, d);
>>   }
>>   
>> -#endif /* CONFIG_X86 */
>> -
>>   #ifdef CONFIG_ARGO
>>   static XSM_INLINE int xsm_argo_enable(const struct domain *d)
>>   {
>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>> index a80bcf3..2a9b39d 100644
>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -177,8 +177,8 @@ struct xsm_operations {
>>       int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
>>       int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
>>       int (*pmu_op) (struct domain *d, unsigned int op);
>> -    int (*dm_op) (struct domain *d);
>>   #endif
>> +    int (*dm_op) (struct domain *d);
>>       int (*xen_version) (uint32_t cmd);
>>       int (*domain_resource_map) (struct domain *d);
>>   #ifdef CONFIG_ARGO
>> @@ -688,13 +688,13 @@ static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int
>>       return xsm_ops->pmu_op(d, op);
>>   }
>>   
>> +#endif /* CONFIG_X86 */
>> +
>>   static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
>>   {
>>       return xsm_ops->dm_op(d);
>>   }
>>   
>> -#endif /* CONFIG_X86 */
>> -
>>   static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
>>   {
>>       return xsm_ops->xen_version(op);
>> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
>> index d4cce68..e3afd06 100644
>> --- a/xen/xsm/dummy.c
>> +++ b/xen/xsm/dummy.c
>> @@ -148,8 +148,8 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
>>       set_to_dummy_if_null(ops, ioport_permission);
>>       set_to_dummy_if_null(ops, ioport_mapping);
>>       set_to_dummy_if_null(ops, pmu_op);
>> -    set_to_dummy_if_null(ops, dm_op);
>>   #endif
>> +    set_to_dummy_if_null(ops, dm_op);
>>       set_to_dummy_if_null(ops, xen_version);
>>       set_to_dummy_if_null(ops, domain_resource_map);
>>   #ifdef CONFIG_ARGO
>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index a314bf8..645192a 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -1662,14 +1662,13 @@ static int flask_pmu_op (struct domain *d, unsigned int op)
>>           return -EPERM;
>>       }
>>   }
>> +#endif /* CONFIG_X86 */
>>   
>>   static int flask_dm_op(struct domain *d)
>>   {
>>       return current_has_perm(d, SECCLASS_HVM, HVM__DM);
>>   }
>>   
>> -#endif /* CONFIG_X86 */
>> -
>>   static int flask_xen_version (uint32_t op)
>>   {
>>       u32 dsid = domain_sid(current->domain);
>> @@ -1872,8 +1871,8 @@ static struct xsm_operations flask_ops = {
>>       .ioport_permission = flask_ioport_permission,
>>       .ioport_mapping = flask_ioport_mapping,
>>       .pmu_op = flask_pmu_op,
>> -    .dm_op = flask_dm_op,
>>   #endif
>> +    .dm_op = flask_dm_op,
>>       .xen_version = flask_xen_version,
>>       .domain_resource_map = flask_domain_resource_map,
>>   #ifdef CONFIG_ARGO
> All of this looks to belong into patch 2?


Good point. Will move.

-- 
Regards,

Oleksandr Tyshchenko


