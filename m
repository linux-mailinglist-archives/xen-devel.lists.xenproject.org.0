Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF523CBC4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 17:40:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3LVn-0001pP-54; Wed, 05 Aug 2020 15:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3LVl-0001pK-Pz
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 15:39:25 +0000
X-Inumbo-ID: 204fbe88-f953-4f1d-a239-24f35f21e742
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 204fbe88-f953-4f1d-a239-24f35f21e742;
 Wed, 05 Aug 2020 15:39:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F029AC97;
 Wed,  5 Aug 2020 15:39:40 +0000 (UTC)
Subject: Re: [PATCH v4 02/14] x86/iommu: add common page-table allocator
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-3-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6eb5810f-b0ca-3b57-7dc0-93e705512024@suse.com>
Date: Wed, 5 Aug 2020 17:39:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804134209.8717-3-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:41, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Instead of having separate page table allocation functions in VT-d and AMD
> IOMMU code, we could use a common allocation function in the general x86 code.
> 
> This patch adds a new allocation function, iommu_alloc_pgtable(), for this
> purpose. The function adds the page table pages to a list. The pages in this
> list are then freed by iommu_free_pgtables(), which is called by
> domain_relinquish_resources() after PCI devices have been de-assigned.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

