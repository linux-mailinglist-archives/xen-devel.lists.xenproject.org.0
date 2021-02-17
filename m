Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791CD31D7D0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 12:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86211.161658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKcI-0002Py-R8; Wed, 17 Feb 2021 11:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86211.161658; Wed, 17 Feb 2021 11:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCKcI-0002PZ-NL; Wed, 17 Feb 2021 11:03:34 +0000
Received: by outflank-mailman (input) for mailman id 86211;
 Wed, 17 Feb 2021 11:03:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCKcH-0002PU-HE
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 11:03:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCKcE-0001Hy-He; Wed, 17 Feb 2021 11:03:30 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCKcE-0006av-8e; Wed, 17 Feb 2021 11:03:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=7ALOija2AEB9dftlJYgOTQ5dqXwH3+OBL7GDBY1YNtg=; b=SxveSZHQHoy4gyVOHUpmi1YIJ0
	lOg8KuBAaht8/5MQGNPsJbjZkYDhqfVkF7A5YuVn/T4OtkGZ3hINOcIpiKJnnyYEp1F07rw9qfjMv
	DsGILgV6+Pu2H5HL7qfcCIrxK9fhBR/poiSmsuQyIVP7VUozkLOQ/Kb3lRkD3qfMav3E=;
Subject: Re: [PATCH 2/3] gnttab: bypass IOMMU (un)mapping when a domain is
 (un)mapping its own grant
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
 <5bb4fba7-a10b-90c4-82f7-8cde6e8cacfb@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a267959c-538e-0f90-f9a5-72e836f33cb4@xen.org>
Date: Wed, 17 Feb 2021 11:03:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5bb4fba7-a10b-90c4-82f7-8cde6e8cacfb@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/02/2021 10:46, Jan Beulich wrote:
> Mappings for a domain's own pages should already be present in the
> IOMMU. While installing the same mapping again is merely redundant (and
> inefficient), removing the mapping when the grant mapping gets removed
> is outright wrong in this case: The mapping was there before the map, so
> should remain in place after unmapping.
> 
> This affects
> - Arm Dom0 in the direct mapped case,
> - x86 PV Dom0 in the "iommu=dom0-strict" / "dom0-iommu=strict" cases,
> - all x86 PV DomU-s, including driver domains.
> 
> Reported-by: Rahul Singh <Rahul.Singh@arm.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1243,7 +1243,7 @@ map_grant_ref(
>           goto undo_out;
>       }
>   
> -    need_iommu = gnttab_need_iommu_mapping(ld);
> +    need_iommu = ld != rd && gnttab_need_iommu_mapping(ld);

AFAICT, the owner of the page may not always be rd. So do we want to 
check against the owner instead?

Cheers,

-- 
Julien Grall

