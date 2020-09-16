Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A126BEDB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:12:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kISXg-0007i5-OG; Wed, 16 Sep 2020 08:11:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCdG=CZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kISXf-0007i0-Ew
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:11:51 +0000
X-Inumbo-ID: 82c0a26a-8f65-4306-a5c5-a2bc47fb2b3a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82c0a26a-8f65-4306-a5c5-a2bc47fb2b3a;
 Wed, 16 Sep 2020 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=BbgiO1W1h3f9D09TGphRMmCRz5rss1za9/9oq8qVwXQ=; b=WIMBKhIXT0Yx3CA5BUUqXOCrPq
 4P03JqYTPZE/xG2NWRj6+DdjTVboVedrvQ7nf2iLrTyfcqwgGj5t1AvzCnWZjp01ZdajM57KjogAH
 Jwixkt97TedxmsLFrgAi4PRlchqhzaW6PyNIje3MRKfy/fm8bLbkOTuZkZp9xiOcNbOc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kISXb-0000Ft-EQ; Wed, 16 Sep 2020 08:11:47 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kISXb-0007ve-6m; Wed, 16 Sep 2020 08:11:47 +0000
Subject: Re: [PATCH v9 6/8] common/grant_table: batch flush I/O TLB
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200915082936.23663-1-paul@xen.org>
 <20200915082936.23663-7-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <88646635-1c6a-e661-f879-2a8f509ec0a6@xen.org>
Date: Wed, 16 Sep 2020 09:11:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915082936.23663-7-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 15/09/2020 09:29, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch avoids calling iommu_iotlb_flush() for each individual GNTTABOP and
> instead calls iommu_iotlb_flush_all() at the end of a batch. This should mean
> non-singleton map/unmap operations perform better.
> 
> NOTE: A batch is the number of operations done before a pre-emption check and,
>        in the case of unmap, a TLB flush.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

