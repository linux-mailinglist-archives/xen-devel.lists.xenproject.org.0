Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D231DBDB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 16:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86310.161959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOKb-0001Ji-Q2; Wed, 17 Feb 2021 15:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86310.161959; Wed, 17 Feb 2021 15:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOKb-0001JI-Mn; Wed, 17 Feb 2021 15:01:33 +0000
Received: by outflank-mailman (input) for mailman id 86310;
 Wed, 17 Feb 2021 15:01:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCOKa-0001JD-Ej
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 15:01:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f981051a-7bad-430d-a71a-ae8792356cb3;
 Wed, 17 Feb 2021 15:01:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5B0CB8FB;
 Wed, 17 Feb 2021 15:01:30 +0000 (UTC)
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
X-Inumbo-ID: f981051a-7bad-430d-a71a-ae8792356cb3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613574090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlcbOFN/qMdHxITM+PVmddFB6cOmVw5dejK6K51LolI=;
	b=FS1iGIboZm/U7U2+XCcEC5N9I/3YxiV67EeRH2I8NxEGTk3khhfkOPHG7tWwTMXZ+z+H6Y
	cM5f2Qccs7C0V18WRZ5WgfZZOiZO2yplNQZz9I5ZOgquxhWjPUGaiUrNaymqvy6PpoUTYC
	S6CtRZx2YWWhHHdB7QJaSukbLz0GLSo=
Subject: Re: [for-4.15][PATCH v3 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20f68b12-a767-b1d3-a3dd-9f92172def5f@suse.com>
Date: Wed, 17 Feb 2021 16:01:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210217142458.3769-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.02.2021 15:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The new x86 IOMMU page-tables allocator will release the pages when
> relinquishing the domain resources. However, this is not sufficient
> when the domain is dying because nothing prevents page-table to be
> allocated.
> 
> Currently page-table allocations can only happen from iommu_map(). As
> the domain is dying, there is no good reason to continue to modify the
> IOMMU page-tables.

While I agree this to be the case right now, I'm not sure it is a
good idea to build on it (in that you leave the unmap paths
untouched). Imo there's a fair chance this would be overlooked at
the point super page mappings get introduced (which has been long
overdue), and I thought prior discussion had lead to a possible
approach without risking use-after-free due to squashed unmap
requests.

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -273,6 +273,9 @@ int iommu_free_pgtables(struct domain *d)
>      /*
>       * Pages will be moved to the free list below. So we want to
>       * clear the root page-table to avoid any potential use after-free.
> +     *
> +     * After this call, no more IOMMU mapping can happen.
> +     *
>       */
>      hd->platform_ops->clear_root_pgtable(d);

I.e. you utilize the call in place of spin_barrier(). Maybe worth
saying in the comment?

Also, nit: Stray blank comment line.

Jan

