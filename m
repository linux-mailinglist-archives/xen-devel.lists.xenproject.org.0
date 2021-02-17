Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E421B31D84C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 12:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86221.161698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCL5R-0005RC-MR; Wed, 17 Feb 2021 11:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86221.161698; Wed, 17 Feb 2021 11:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCL5R-0005Qn-JR; Wed, 17 Feb 2021 11:33:41 +0000
Received: by outflank-mailman (input) for mailman id 86221;
 Wed, 17 Feb 2021 11:33:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCL5Q-0005Qi-0U
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 11:33:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCL5K-0001mO-Tl; Wed, 17 Feb 2021 11:33:34 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCL5K-0000Lw-M6; Wed, 17 Feb 2021 11:33:34 +0000
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
	bh=oqaMdQ/nzsMQZ/Hlhzzn1T22q0aaSC/8cEbBXqyCgec=; b=TVPO+SeRi3SsoQLW4XeapTlcRb
	yuVreDMD831uGqs/pguBGUcBJeOyl7K052V3lvn+iM70iuPijqymqL9NoFk4I6w/vTAoJdLDHFZ52
	D+2cE/g3cD7FDTwClxLyvIPXtm6sdwMzZuGacBrLitcTvy8xPAtYa7tqBwkkVNugA5lU=;
Subject: Re: [for-4.15][PATCH v2 0/5] xen/iommu: Collection of bug fixes for
 IOMMU teadorwn
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, hongyxia@amazon.co.uk,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <20210209152816.15792-1-julien@xen.org>
 <24610.48309.568020.376765@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ff2d2f16-66b6-36a6-fb46-18b96686cf87@xen.org>
Date: Wed, 17 Feb 2021 11:33:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24610.48309.568020.376765@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 09/02/2021 16:47, Ian Jackson wrote:
> Julien Grall writes ("[for-4.15][PATCH v2 0/5] xen/iommu: Collection of bug fixes for IOMMU teadorwn"):
>> From: Julien Grall <jgrall@amazon.com>
> ...
>> This series is a collection of bug fixes for the IOMMU teardown code.
>> All of them are candidate for 4.15 as they can either leak memory or
>> lead to host crash/host corruption.
>>
>> This is sent directly on xen-devel because all the issues were either
>> introduced in 4.15 or happen in the domain creation code.
> 
> I think by current freeze rules this does not need a release-ack but
> for the avoidance of doubt
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks!

> 
> assuming it's commited by the end of the week.

I saw you extended the freeze rules by a week. So I will assume that I 
have until end of this week (19th February) to commit it.

Please let me know if I misunderstood the extension.

Cheers,

-- 
Julien Grall

