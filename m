Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B360F42661E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 10:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204579.359745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYlRQ-0005zn-AZ; Fri, 08 Oct 2021 08:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204579.359745; Fri, 08 Oct 2021 08:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYlRQ-0005x6-76; Fri, 08 Oct 2021 08:41:20 +0000
Received: by outflank-mailman (input) for mailman id 204579;
 Fri, 08 Oct 2021 08:41:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HhL2=O4=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mYlRO-0005x0-PR
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 08:41:18 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 80fbcabc-2813-11ec-8025-12813bfff9fa;
 Fri, 08 Oct 2021 08:41:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E20A6D;
 Fri,  8 Oct 2021 01:41:17 -0700 (PDT)
Received: from [10.57.24.215] (unknown [10.57.24.215])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9100B3F70D;
 Fri,  8 Oct 2021 01:41:13 -0700 (PDT)
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
X-Inumbo-ID: 80fbcabc-2813-11ec-8025-12813bfff9fa
Subject: Re: [PATCH v3 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, xen-devel@lists.xenproject.org
References: <20211008081933.18546-1-michal.orzel@arm.com>
 <20211008081933.18546-2-michal.orzel@arm.com>
 <dce7709d-a68b-a8f0-a752-6eaeb2e0ce2e@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <48b0728b-fbdf-7f56-336d-c9623406f5ea@arm.com>
Date: Fri, 8 Oct 2021 10:41:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dce7709d-a68b-a8f0-a752-6eaeb2e0ce2e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hi Jan,

On 08.10.2021 10:33, Jan Beulich wrote:
> On 08.10.2021 10:19, Michal Orzel wrote:
>> --- a/xen/include/public/sysctl.h
>> +++ b/xen/include/public/sysctl.h
>> @@ -100,10 +100,12 @@ struct xen_sysctl_tbuf_op {
>>  #define _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share 5
>>  #define XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share  \
>>      (1u << _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share)
>> -#define XEN_SYSCTL_PHYSCAP_vmtrace       (1 << 6)
>> +#define XEN_SYSCTL_PHYSCAP_vmtrace       (1u<<6)
>> +/* The platform supports vPMU. */
>> +#define XEN_SYSCTL_PHYSCAP_vpmu          (1u<<7)
> 
> While purely cosmetic and easily fixable while committing, I still
> fail to understand why you did drop the blanks from the expression
> you adjust and why you didn't add blanks to the new expression.
> ./CODING_STYLE is quite clear in this respect, and even the code
> in context does not suggest any alternative style. (While code just
> outside of visible context does, it should not be used as excuse
> to introduce further style violations.)
> 
I was just biased by the previous entries.
Previous entries were not added at once but commit after commit.
No one did any remarks on that so I decided to stick to the "section standard".
From now one I will be looking only at the coding style even though the section
is doing something else. If it is possible, please fix it while commiting.

> Jan
> 

Cheers,
Michal

