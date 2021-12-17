Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F625478E2E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 15:43:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248698.428981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myESE-00064H-2t; Fri, 17 Dec 2021 14:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248698.428981; Fri, 17 Dec 2021 14:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myESD-00061T-WA; Fri, 17 Dec 2021 14:43:25 +0000
Received: by outflank-mailman (input) for mailman id 248698;
 Fri, 17 Dec 2021 14:43:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myESC-00061N-8y
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 14:43:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myES9-00054C-UG; Fri, 17 Dec 2021 14:43:21 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myES9-0007gr-N8; Fri, 17 Dec 2021 14:43:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=45fT3HZdmHIyU5+qdTRu8J/nl+vxCT+pYN8JBODCuFA=; b=BbfoiSIQsDLab2mm7B0wosAHPH
	8dvN3mfu7RoTQIPeHF0ZCWnIa4YpSTwGSjHP/7AedZhIIyUzhA4I7PHHsxWaeGagmPfoJMi1dzXWz
	5ewLpSeUiBjuow7AnexmhbEBQ1MRIAsvM2l9Z3jiTIBLDOn1obEWpeLriO+heb/RLJH4=;
Message-ID: <efe0c869-e88f-eb14-93a9-866cb99cb1a8@xen.org>
Date: Fri, 17 Dec 2021 14:43:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v2 03/18] IOMMU: have vendor code announce supported page
 sizes
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <3f0adf5b-cc2a-1b72-8376-baad574fa824@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3f0adf5b-cc2a-1b72-8376-baad574fa824@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 24/09/2021 10:43, Jan Beulich wrote:
> Generic code will use this information to determine what order values
> can legitimately be passed to the ->{,un}map_page() hooks. For now all
> ops structures simply get to announce 4k mappings (as base page size),
> and there is (and always has been) an assumption that this matches the
> CPU's MMU base page size (eventually we will want to permit IOMMUs with
> a base page size smaller than the CPU MMU's).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

