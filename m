Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C6B5F4077
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 12:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415344.659896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofehy-0007P0-TI; Tue, 04 Oct 2022 09:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415344.659896; Tue, 04 Oct 2022 09:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofehy-0007MB-Q3; Tue, 04 Oct 2022 09:59:26 +0000
Received: by outflank-mailman (input) for mailman id 415344;
 Tue, 04 Oct 2022 09:59:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d4Mf=2F=xen.org=julien@srs-se1.protection.inumbo.net>)
 id 1ofehw-0007M5-R3
 for xen-devel@lists.xen.org; Tue, 04 Oct 2022 09:59:24 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38a0a349-43cb-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 11:59:23 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ofeht-0007cU-6x; Tue, 04 Oct 2022 09:59:21 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.104.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ofeht-0005W1-03; Tue, 04 Oct 2022 09:59:21 +0000
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
X-Inumbo-ID: 38a0a349-43cb-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=5FN6rAoecXFWW8Wg641o9lU2sQND2cUBDx4uyNk4M0I=; b=oHyvXJa0QbvtRRUwfdBOnj704j
	3Ubs9OOC5Hr6t1xG2I8BPpUO+c9SXzYZsQYSbwaPhyXfNMfa2JxulpdL8/HILXrfcl0rJlabeTpS3
	Jo2Dl9uEPyLG6ZC/H/rrClLp3rtY5/sfKVgwRGhplLT44/ZCwrXkfaXIpVdPHazSzTD4=;
Message-ID: <a4907928-d3a2-f555-c30d-66aee18b2a62@xen.org>
Date: Tue, 4 Oct 2022 10:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH V6.1 3/3] libxl: arm: make creation of iommu node
 independent of disk device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>
 <ebcf40f0d5dfe6bfa27c11dc2fe3e65df48772fe.1662734469.git.viresh.kumar@linaro.org>
 <YxtVjpDU1HOrhiAE@perard.uk.xensource.com>
 <20220920102915.p55lt4ee5hbxiun2@vireshk-i7>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220920102915.p55lt4ee5hbxiun2@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Viresh,

Apologies for the late reply. I was away for the past 2 weeks.

On 20/09/2022 11:29, Viresh Kumar wrote:
> On 09-09-22, 16:02, Anthony PERARD wrote:
>> On Fri, Sep 09, 2022 at 08:13:28PM +0530, Viresh Kumar wrote:
>>> The iommu node will be required for other virtio device types too, not
>>> just disk device.
>>>
>>> Move the call to make_xen_iommu_node(), out of the disk device specific
>>> block and rename "iommu_created" variable to "iommu_needed", and set it
>>> to true for virtio disk device.
>>>
>>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>
>> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> I don't see these patches being applied yet, do I need to ping someone
> for that ?

We are currently preparing to release Xen 4.17 (plan for November) and 
have stopped accepting new code (other than bug fix) since the beginning 
of September.

Your series will be committed once the tree is re-opened (hopefully by 
the beginning of November). Please ping me mid-november if this is still 
not applied.

Cheers,

-- 
Julien Grall

