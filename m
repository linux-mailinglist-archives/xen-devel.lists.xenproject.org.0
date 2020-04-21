Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C71B228F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 11:22:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQp6F-0001OT-4P; Tue, 21 Apr 2020 09:21:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQp6E-0001OO-1v
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 09:21:50 +0000
X-Inumbo-ID: 87426744-83b1-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87426744-83b1-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 09:21:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82D34AD8E;
 Tue, 21 Apr 2020 09:21:47 +0000 (UTC)
Subject: Re: [PATCH v15 2/3] mem_sharing: allow forking domain with IOMMU
 enabled
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1587142844.git.tamas.lengyel@intel.com>
 <0be7501ace42d856b344828755ece18659dabd33.1587142844.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d9a7e20-3f8b-2a32-fe65-1a14630489db@suse.com>
Date: Tue, 21 Apr 2020 11:21:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0be7501ace42d856b344828755ece18659dabd33.1587142844.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 19:06, Tamas K Lengyel wrote:
> @@ -2063,9 +2065,10 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
>      case XENMEM_sharing_op_fork:
>      {
>          struct domain *pd;
> +        bool allow_iommu;
>  
>          rc = -EINVAL;
> -        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] || mso.u.fork.pad[2] )
> +        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] )
>              goto out;

Rather than outright dropping this, you now want to bail on
any bits set in flags except the one that's currently defined.

Jan

