Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C931324C34
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 09:45:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89645.169011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFCG4-0005H3-Se; Thu, 25 Feb 2021 08:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89645.169011; Thu, 25 Feb 2021 08:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFCG4-0005Ge-PD; Thu, 25 Feb 2021 08:44:28 +0000
Received: by outflank-mailman (input) for mailman id 89645;
 Thu, 25 Feb 2021 08:44:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFCG3-0005GZ-ES
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 08:44:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b4e0ab0-18d1-42e3-b3fe-4e8ad6d7d889;
 Thu, 25 Feb 2021 08:44:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 209F2AAAE;
 Thu, 25 Feb 2021 08:44:25 +0000 (UTC)
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
X-Inumbo-ID: 2b4e0ab0-18d1-42e3-b3fe-4e8ad6d7d889
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614242665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IjcG979P0LrZO32+Aw+dI+CvT5gBaMVcpWx8utENdVI=;
	b=SzpblRe2678xaohXvjP30pPO3PL1TvD4YBz0YbppEPzT9Bq4d8sx32S1wtjeHHYQxLSuop
	i5MlbBzmAYgJFzaHoazydofU8pIgwqlUnO8fMjpRMj5uwqRz2x8P6XORvR8PPctXZsf2Kw
	UtVyAHFsBO4jDeS1ljq2t1vfYeZa3co=
Subject: Re: [PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page
From: Jan Beulich <jbeulich@suse.com>
To: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>
Cc: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
Message-ID: <94ac725c-ae3a-5380-aaa0-c8523074b581@suse.com>
Date: Thu, 25 Feb 2021 09:44:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.02.2021 11:56, Jan Beulich wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -428,6 +428,14 @@ static void vmx_domain_relinquish_resour
>      vmx_free_vlapic_mapping(d);
>  }
>  
> +static void domain_creation_finished(struct domain *d)
> +{
> +    if ( has_vlapic(d) && !mfn_eq(d->arch.hvm.vmx.apic_access_mfn, _mfn(0)) &&
> +         set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE),
> +                            d->arch.hvm.vmx.apic_access_mfn, PAGE_ORDER_4K) )
> +        domain_crash(d);
> +}

Having noticed that in patch 2 I also need to arrange for
ept_get_entry_emt() to continue to return WB for this page, I'm
inclined to add a respective assertion here. Would anyone object
to me doing so?

Kevin, Jun - I'd like this to also serve as a ping for an ack
(with or without the suggested ASSERT() addition).

Jan

