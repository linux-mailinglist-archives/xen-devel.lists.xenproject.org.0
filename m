Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C831679F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 14:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83597.155949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pIQ-0004Fk-6y; Wed, 10 Feb 2021 13:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83597.155949; Wed, 10 Feb 2021 13:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pIQ-0004FL-3v; Wed, 10 Feb 2021 13:12:42 +0000
Received: by outflank-mailman (input) for mailman id 83597;
 Wed, 10 Feb 2021 13:12:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9pIO-0004FF-Mf
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 13:12:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e4f410c-a7cb-4b50-bd62-2d3f9bd97ed6;
 Wed, 10 Feb 2021 13:12:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F51BAC43;
 Wed, 10 Feb 2021 13:12:39 +0000 (UTC)
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
X-Inumbo-ID: 9e4f410c-a7cb-4b50-bd62-2d3f9bd97ed6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612962759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KodbBIrLLtVpPc0B70pP4gcnK9uIr1vJtWfSMiDJuP8=;
	b=vRf8U6sFq+aFMtSZhNjg0g2liM3oGkOrVIRehY5FpwVBeTGDaUFM0lpbsTH+V4HmkeSOlI
	Ih+VTe0zhmpt30ZsrSTY95Q2+hUw0Rgl2hMTteFo8IK7MLIG01eqA9GQ97p1SbRB/DcXjN
	cacrWZAyFPpHelDgTgxhwIyK0FOYWMM=
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, hongyxia@amazon.co.uk,
 iwj@xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org> <YCOZbNly7YCSNtHY@Air-de-Roger>
 <5bf0a2de-3f0e-8860-7bc7-f667437aa3a7@suse.com>
 <YCPE0byWKlf/uOFT@Air-de-Roger>
 <65797b03-7bd8-92e9-b6c7-e8eccde9f8ba@suse.com>
 <e1c7c616-0941-b577-5842-a51374030798@xen.org>
 <71c4150a-0b81-cdc3-b752-814f58cb5ca4@suse.com>
 <df760d78-a439-db0a-4b88-813b002f0a64@xen.org>
 <YCPJXe1L1SCXoL7a@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb242b17-01f3-6312-b563-f82abc5d300a@suse.com>
Date: Wed, 10 Feb 2021 14:12:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCPJXe1L1SCXoL7a@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.02.2021 12:54, Roger Pau Monné wrote:
> On Wed, Feb 10, 2021 at 11:48:40AM +0000, Julien Grall wrote:
>> It feels wrong to me to setup a per-domain mapping when initializing the
>> first vCPU.
>>
>> But, I was under the impression that there is plan to remove
>> XEN_DOMCTL_max_vcpus. So it would only buy just a bit of time...
> 
> I was also under that impression. We could setup the lapic access page
> at vlapic_init for the BSP (which is part of XEN_DOMCTL_max_vcpus
> ATM).
> 
> But then I think there should be some kind of check to prevent
> populating either the CPU or the IOMMU page tables at domain creation
> hypercall, and so the logic to free CPU table tables on failure could
> be removed.

I can spot paging_final_teardown() on an error path there, but I
don't suppose that's what you mean? I guess I'm not looking in
the right place (there are quite a few after all) ...

Jan

