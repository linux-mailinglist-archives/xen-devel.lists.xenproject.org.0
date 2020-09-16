Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3025826BE8E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 09:54:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kISGU-0005Fw-A8; Wed, 16 Sep 2020 07:54:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCdG=CZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kISGS-0005Fr-US
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 07:54:04 +0000
X-Inumbo-ID: 72171734-a4ab-47c6-b8a0-ead54863ff20
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72171734-a4ab-47c6-b8a0-ead54863ff20;
 Wed, 16 Sep 2020 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=LzQSJqmW77NFk52zajdPWpus9tU2ZhszttkL+ERcTWU=; b=Zkpy9SEqmuuiETTtobopNGPbE+
 X7PTGEjGkGFlZ4sPDLQMfu7YE9eoiO+X721NuGWC3Kz74oEdcswsWhoAJKlQFe9X795ALfH1oQ9P+
 qy5cOlVMRXhiPeHF5pzqyAZqVzhAzsDc8/tJaRDrr/i6I4mQi1dDps35Tl1DLJw65kLI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kISGL-0007kE-54; Wed, 16 Sep 2020 07:53:57 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kISGK-0006Wx-U0; Wed, 16 Sep 2020 07:53:57 +0000
Subject: Re: [PATCH v9 5/8] remove remaining uses of iommu_legacy_map/unmap
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200915082936.23663-1-paul@xen.org>
 <20200915082936.23663-6-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <942516aa-dca4-6d39-c09c-f4e5a25203cc@xen.org>
Date: Wed, 16 Sep 2020 08:53:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915082936.23663-6-paul@xen.org>
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
> The 'legacy' functions do implicit flushing so amend the callers to do the
> appropriate flushing.
> 
> Unfortunately, because of the structure of the P2M code, we cannot remove
> the per-CPU 'iommu_dont_flush_iotlb' global and the optimization it
> facilitates. Checking of this flag is now done only in relevant callers of
> iommu_iotlb_flush(). Also, 'iommu_dont_flush_iotlb' is now declared
> as bool (rather than bool_t) and setting/clearing it are no longer pointlessly
> gated on is_iommu_enabled() returning true. (Arguably it is also pointless to
> gate the call to iommu_iotlb_flush() on that condition - since it is a no-op
> in that case - but the if clause allows the scope of a stack variable to be
> restricted).
> 
> NOTE: The code in memory_add() now sets 'ret' if iommu_map() or
>        iommu_iotlb_flush() fails.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

The changes in common code looks good to me:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

