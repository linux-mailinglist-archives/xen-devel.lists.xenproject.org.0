Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C8B637F9C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 20:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448034.704827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyHkk-0000sf-Bm; Thu, 24 Nov 2022 19:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448034.704827; Thu, 24 Nov 2022 19:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyHkk-0000pc-8s; Thu, 24 Nov 2022 19:19:18 +0000
Received: by outflank-mailman (input) for mailman id 448034;
 Thu, 24 Nov 2022 19:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6S+4=3Y=xen.org=julien@srs-se1.protection.inumbo.net>)
 id 1oyHki-0000pW-RG
 for xen-devel@lists.xen.org; Thu, 24 Nov 2022 19:19:16 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e158948a-6c2c-11ed-8fd2-01056ac49cbb;
 Thu, 24 Nov 2022 20:19:15 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyHke-00042F-22; Thu, 24 Nov 2022 19:19:12 +0000
Received: from [54.239.6.186] (helo=[192.168.1.238])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyHkd-0007XS-RR; Thu, 24 Nov 2022 19:19:11 +0000
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
X-Inumbo-ID: e158948a-6c2c-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=7LkqjOngDsmt1vHQJQpK0c7MEk/z00Zc1oBFYxn4XeU=; b=62EHk/powPg0zY7vML0SxCL9MJ
	S5yl1Rk3ZSEbAExowDDgGp0Mn7u/1toaQS4m1Vn4qE5NSp3EGvrboVbEwY5pOg776gYKuJpMkzFDu
	oAGLWiJFrscHowwgBPPnovjVD1CNB+Z+l0zdLSTg2q4uKxKQzh+V82rHPtHtwsfLmRN0=;
Message-ID: <4bb29058-3133-bc66-ea33-8077f91a473b@xen.org>
Date: Thu, 24 Nov 2022 20:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH V6.1 3/3] libxl: arm: make creation of iommu node
 independent of disk device
Content-Language: en-US
From: Julien Grall <julien@xen.org>
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
 <a4907928-d3a2-f555-c30d-66aee18b2a62@xen.org>
In-Reply-To: <a4907928-d3a2-f555-c30d-66aee18b2a62@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Viresh,

On 04/10/2022 11:59, Julien Grall wrote:
> On 20/09/2022 11:29, Viresh Kumar wrote:
>> On 09-09-22, 16:02, Anthony PERARD wrote:
>>> On Fri, Sep 09, 2022 at 08:13:28PM +0530, Viresh Kumar wrote:
>>>> The iommu node will be required for other virtio device types too, not
>>>> just disk device.
>>>>
>>>> Move the call to make_xen_iommu_node(), out of the disk device specific
>>>> block and rename "iommu_created" variable to "iommu_needed", and set it
>>>> to true for virtio disk device.
>>>>
>>>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>>
>>> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> I don't see these patches being applied yet, do I need to ping someone
>> for that ?
> 
> We are currently preparing to release Xen 4.17 (plan for November) and 
> have stopped accepting new code (other than bug fix) since the beginning 
> of September.
> 
> Your series will be committed once the tree is re-opened (hopefully by 
> the beginning of November). Please ping me mid-november if this is still 
> not applied.

Unfortunately, we had some delay for releasing 4.17. So I have pushed 
this series in a branch for-next/4.18. This will be applied to staging 
once the tree has re-opened.

Cheers,

-- 
Julien Grall

