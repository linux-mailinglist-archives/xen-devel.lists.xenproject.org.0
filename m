Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B742976EC0D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 16:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576405.902505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZ4k-0003LJ-Mz; Thu, 03 Aug 2023 14:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576405.902505; Thu, 03 Aug 2023 14:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZ4k-0003IK-KF; Thu, 03 Aug 2023 14:13:14 +0000
Received: by outflank-mailman (input) for mailman id 576405;
 Thu, 03 Aug 2023 14:13:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRZ4i-0003I6-Ht
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 14:13:12 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df4d5cfe-3207-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 16:13:10 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691071984468195.7324363645455;
 Thu, 3 Aug 2023 07:13:04 -0700 (PDT)
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
X-Inumbo-ID: df4d5cfe-3207-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691071986; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GJfbRKFRS+y/0O+Mj7Mdf8Z65xM2UpksYeqiD1E2Fz2XbSCk1HPPuIuXSf6pSJ+Znxp+FfXvm3tmx5WWmh7lMcLsFChJiyXnKJEnCISXBiR+NY5I+3LzN0IPyx3sRrbaAOWQ7kZpk2c+uG+bhwoZ//NVGedm6Bhgd5g9BirVbTI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691071986; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=HXc+4giYhO4aml0XV6KxKu9+fo/2k40iM5wQljtnt8c=; 
	b=auoX3PJFjZ0JKCPWQxrfyRoNBLeL95unHoViE6LSfeHyo113goRAvUriQwxx9gccCA4cl7JML7tgjY9xCfuUGfmUHjdSMpBSYcuxKbF82bxcGNALymr0SfudBCMsWQtNQa2LOt2E9OyXbhj8tMAYaFjNCffI9/JDPKSO6EarCHk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691071986;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HXc+4giYhO4aml0XV6KxKu9+fo/2k40iM5wQljtnt8c=;
	b=ptL+HsDmz/DFX3QIijKecTmBfkdB4xWWw6fhgPOgC0IaV0AxgahWWbnc+h3pMh7u
	KW/NBDhbI8senF6AOIY00N69N01HeW90YMm16q2nA/RBtK8pauCwKwBqYkf5EXmMG7S
	La8I/pFyuRJUxSu9NekTLlzs470fsPi5A56B7GGw=
Message-ID: <a191581d-6b11-2156-c73b-954eed36306a@apertussolutions.com>
Date: Thu, 3 Aug 2023 10:13:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 3/6] roles: add a role for xenstore domain
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-4-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2308011757190.2127516@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2308011757190.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/1/23 20:57, Stefano Stabellini wrote:
> On Tue, 1 Aug 2023, Daniel P. Smith wrote:
>> Expand the possible roles for a domain to include a role for the Xenstore
>> domain.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thank you!

>> ---
>>   xen/common/domain.c     | 3 +++
>>   xen/include/xen/sched.h | 3 ++-
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 0ff1d52e3d..dbf055c559 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -633,6 +633,9 @@ struct domain *domain_create(domid_t domid,
>>           d->role |= ROLE_HARDWARE_DOMAIN;
>>       }
>>   
>> +    if ( d->options & XEN_DOMCTL_CDF_xs_domain )
>> +        d->role |= ROLE_XENSTORE_DOMAIN;
>> +
>>       TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
>>   
>>       lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index 695f240326..ec0f9baff6 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -470,6 +470,7 @@ struct domain
>>   #define ROLE_UNBOUNDED_DOMAIN  (1U<<0)
>>   #define ROLE_CONTROL_DOMAIN    (1U<<1)
>>   #define ROLE_HARDWARE_DOMAIN   (1U<<2)
>> +#define ROLE_XENSTORE_DOMAIN   (1U<<3)
>>       uint8_t          role;
>>       /* Can this guest access the Xen console? */
>>       bool             is_console;
>> @@ -1165,7 +1166,7 @@ static inline bool is_vcpu_online(const struct vcpu *v)
>>   
>>   static inline bool is_xenstore_domain(const struct domain *d)
>>   {
>> -    return d->options & XEN_DOMCTL_CDF_xs_domain;
>> +    return d->role & ROLE_XENSTORE_DOMAIN;
>>   }
>>   
>>   static always_inline bool is_iommu_enabled(const struct domain *d)
>> -- 
>> 2.20.1
>>

