Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088241BF753
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 13:57:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU7p2-00063o-CU; Thu, 30 Apr 2020 11:57:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU7p0-00063i-Ue
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 11:57:42 +0000
X-Inumbo-ID: cb6817c8-8ad9-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb6817c8-8ad9-11ea-9887-bc764e2007e4;
 Thu, 30 Apr 2020 11:57:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 12525AB89;
 Thu, 30 Apr 2020 11:57:40 +0000 (UTC)
Subject: Re: [PATCH v2 5/5] tools/libxc: make use of domain context
 SHARED_INFO record...
To: Paul Durrant <paul@xen.org>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe6e5919-ee1f-7a35-ff37-ca2b304a7682@suse.com>
Date: Thu, 30 Apr 2020 13:57:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200407173847.1595-6-paul@xen.org>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.04.2020 19:38, Paul Durrant wrote:
> ... in the save/restore code.
> 
> This patch replaces direct mapping of the shared_info_frame (retrieved
> using XEN_DOMCTL_getdomaininfo) with save/load of the domain context
> SHARED_INFO record.
> 
> No modifications are made to the definition of the migration stream at
> this point. Subsequent patches will define a record in the libxc domain
> image format for passing domain context and convert the save/restore code
> to use that.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Wei Liu <wl@xen.org>
> 
> v2:
>  - Re-based (now making use of DOMAIN_SAVE_FLAG_IGNORE)
> ---
>  tools/libxc/xc_sr_common.h         |  7 +++-
>  tools/libxc/xc_sr_common_x86.c     | 59 ++++++++++++++++++++++++++++++
>  tools/libxc/xc_sr_common_x86.h     |  4 ++
>  tools/libxc/xc_sr_common_x86_pv.c  | 53 +++++++++++++++++++++++++++
>  tools/libxc/xc_sr_common_x86_pv.h  |  3 ++
>  tools/libxc/xc_sr_restore_x86_pv.c | 40 ++++++++------------
>  tools/libxc/xc_sr_save_x86_pv.c    | 26 ++-----------
>  tools/libxc/xg_save_restore.h      |  1 +
>  8 files changed, 144 insertions(+), 49 deletions(-)

The underlying interface being arch-independent, shouldn't at least
some of the new code go into other than xc_sr_*x86*?

Jan

