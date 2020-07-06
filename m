Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926242155C1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 12:46:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsOdV-000675-Qt; Mon, 06 Jul 2020 10:46:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7Mw=AR=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jsOdU-000670-O5
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 10:46:08 +0000
X-Inumbo-ID: e5de6e4c-bf75-11ea-8c5d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5de6e4c-bf75-11ea-8c5d-12813bfff9fa;
 Mon, 06 Jul 2020 10:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xwp9yo4EleNwCfsxcdeLA5xXMjZtsH6C6SVkY2ROUdI=; b=0xXVHXRjJH9CBHVCpq574JokTG
 dvm6rTsA3l3eBIpmdue8cizouswFFQ361HrHrcRMywJlsdyeO7o5Ew5Tepc0b/KsLJ/gNcJRvQwPb
 sA9dt4KEFG9b95fE0HaQ5Nq/JWCtugKg4psy1CgdS7lKj/b7/ffNpVe2o/tv78KOMCKs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jsOdM-000423-My; Mon, 06 Jul 2020 10:46:00 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jsOdM-00036i-Be; Mon, 06 Jul 2020 10:46:00 +0000
Subject: Re: [PATCH v5 04/11] common: add vmtrace_pt_size domain parameter
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <5d52b37e391a4165dc3775f77a621d34a33d22c2.1593974333.git.michal.leszczynski@cert.pl>
From: Julien Grall <julien@xen.org>
Message-ID: <9d7d63af-fcfd-f52b-2139-caf4197cbae6@xen.org>
Date: Mon, 6 Jul 2020 11:45:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5d52b37e391a4165dc3775f77a621d34a33d22c2.1593974333.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, luwei.kang@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 tamas.lengyel@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 05/07/2020 19:54, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Add vmtrace_pt_size domain parameter in live domain and
> vmtrace_pt_order parameter in xen_domctl_createdomain.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>   xen/common/domain.c         | 12 ++++++++++++
>   xen/include/public/domctl.h |  1 +
>   xen/include/xen/sched.h     |  4 ++++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index a45cf023f7..25d3359c5b 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -338,6 +338,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> +    if ( config->vmtrace_pt_order && !vmtrace_supported )

Looking at the rest of the series, vmtrace will only be supported for 
x86 HVM guest. So don't you want to return -EINVAL for PV guests here?

This could be done in a new helper arch_vmtrace_supported() or possibly 
in the existing arch_sanitise_domain_config().

Cheers,

-- 
Julien Grall

