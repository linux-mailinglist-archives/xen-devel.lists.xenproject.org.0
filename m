Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FADC190990
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 10:31:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGfpy-00053H-Os; Tue, 24 Mar 2020 09:27:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGfpx-000539-Fi
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 09:27:05 +0000
X-Inumbo-ID: 9f2a9c7a-6db1-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f2a9c7a-6db1-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 09:27:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF307ABD7;
 Tue, 24 Mar 2020 09:27:02 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d28392f-b32e-717b-636e-1aa80a75243c@suse.com>
Date: Tue, 24 Mar 2020 10:26:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200310174917.1514-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v6 5/5] domain: use PGC_extra domheap page
 for shared_info
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, paul@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.03.2020 18:49, paul@xen.org wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Currently shared_info is a shared xenheap page but shared xenheap pages
> complicate future plans for live-update of Xen so it is desirable to,
> where possible, not use them [1]. This patch therefore converts shared_info
> into a PGC_extra domheap page. This does entail freeing shared_info during
> domain_relinquish_resources() rather than domain_destroy() so care is
> needed to avoid de-referencing a NULL shared_info pointer hence some
> extra checks of 'is_dying' are needed.
> 
> NOTE: For Arm, the call to free_shared_info() in arch_domain_destroy() is
>       left in place since it is idempotent and called in the error path for
>       arch_domain_create().
> 
> [1] See https://lists.xenproject.org/archives/html/xen-devel/2020-02/msg02018.html
> 
> Signed-off-by: Paul Durrant <paul@xen.org>
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Julien Grall <julien@xen.org>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: Wei Liu <wl@xen.org>
> 
> v6:
>  - Drop dump_shared_info() but tag the shared info in the 'ExtraPage'
>    dump
> 
> v5:
>  - Incorporate new dump_shared_info() function
> 
> v2:
>  - Addressed comments from Julien
>  - Expanded the commit comment to explain why this patch is wanted
> ---
>  xen/arch/arm/domain.c      |  2 ++

Julien, Stefano? (I'd prefer to commit the entire series in one go,
rather than leaving out just this last patch.)

Jan

