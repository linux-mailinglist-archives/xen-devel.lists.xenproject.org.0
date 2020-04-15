Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9180D1AA45D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:26:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOi41-0003Ja-Mo; Wed, 15 Apr 2020 13:26:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HSXo=57=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOi40-0003JU-4O
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:26:48 +0000
X-Inumbo-ID: c164df40-7f1c-11ea-8a4d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c164df40-7f1c-11ea-8a4d-12813bfff9fa;
 Wed, 15 Apr 2020 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x41VIlJivgIAl7su1MrknNaAlw7LUAGcP9Z9yp7xm+g=; b=CC0u9RzuO/gvCYdJuHP9wQGQJp
 ErJHn3u5zLzJvSDFS7aF22m2sWUTw9K+gIVVtPj37wEImsmOPFnBPIMV+M/Dt7hyLOj7jMJPzldEk
 hI57KuEkwcig+HVM7QEPPG+70HxM2+QNwYSBwRGh7VyrsdF6Xh73dE6uj77tHoItA5tM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOi3w-0003mu-0b; Wed, 15 Apr 2020 13:26:44 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOi3v-0006iK-Px; Wed, 15 Apr 2020 13:26:43 +0000
Subject: Re: [PATCH 01/12] xen: introduce xen_dom_flags
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-1-sstabellini@kernel.org>
 <aede4742-03e1-e47b-354a-5475f63fff86@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <992bade3-7717-62b0-06a8-88c9dc15937e@xen.org>
Date: Wed, 15 Apr 2020 14:26:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aede4742-03e1-e47b-354a-5475f63fff86@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 andrew.cooper3@citrix.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 15/04/2020 10:12, Jan Beulich wrote:
> On 15.04.2020 03:02, Stefano Stabellini wrote:
>> We are passing an extra special boolean flag at domain creation to
>> specify whether we want to the domain to be privileged (i.e. dom0) or
>> not. Another flag will be introduced later in this series.
>>
>> Introduce a new struct xen_dom_flags and move the privileged flag to it.
>> Other flags will be added to struct xen_dom_flags.
> 
> I'm unsure whether introducing a 2nd structure is worth it here.
> We could as well define some internal-use-only flags for
> struct xen_domctl_createdomain's respective field.

+1.

> 
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -529,7 +529,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>>   }
>>   
>>   int arch_domain_create(struct domain *d,
>> -                       struct xen_domctl_createdomain *config)
>> +                       struct xen_domctl_createdomain *config,
>> +                       struct xen_dom_flags *flags)
> 
> const (also elsewhere)?
> 
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -706,6 +706,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>           .max_maptrack_frames = -1,
>>       };
>>       const char *hypervisor_name;
>> +    struct xen_dom_flags flags = { !pv_shim };
> 
> Here and elsewhere please use field designators right away, even if
> there's only a single field now.
> 
>> @@ -363,7 +363,7 @@ struct domain *domain_create(domid_t domid,
>>       ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
>>   
>>       /* Sort out our idea of is_control_domain(). */
>> -    d->is_privileged = is_priv;
>> +    d->is_privileged =  flags ? flags->is_priv : false;
> 
> Stray double blanks.
> 
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -364,6 +364,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>       bool_t copyback = 0;
>>       struct xen_domctl curop, *op = &curop;
>>       struct domain *d;
>> +    struct xen_dom_flags flags ={ false };
> 
> Missing blank.
> 
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -63,8 +63,13 @@ void arch_vcpu_destroy(struct vcpu *v);
>>   int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
>>   void unmap_vcpu_info(struct vcpu *v);
>>   
>> +struct xen_dom_flags {
>> +    bool is_priv;
> 
> Use a single bit bitfield instead? May even want to consider passing
> this struct by value then.

This is an alternative if extending xen_domctl_createdomain is not a 
solution. The bitfield is easier to extend because we don't need to 
create a new field for each flag in struct domain.

Cheers,

-- 
Julien Grall

