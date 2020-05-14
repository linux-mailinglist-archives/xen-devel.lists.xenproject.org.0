Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70051D30B8
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 15:11:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZDdx-0001Jh-AF; Thu, 14 May 2020 13:11:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZDdu-0001J8-OT
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 13:11:18 +0000
X-Inumbo-ID: 658974ae-95e4-11ea-a488-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 658974ae-95e4-11ea-a488-12813bfff9fa;
 Thu, 14 May 2020 13:11:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 39B46AC5B;
 Thu, 14 May 2020 13:11:19 +0000 (UTC)
Subject: Re: [PATCH] domain_page: handle NULL within unmap_domain_page() itself
To: Hongyan Xia <hx242@xen.org>
References: <a3ddf0c755227a3c742f6b93783c576135a86874.1589384602.git.hongyxia@amazon.com>
 <20200514100133.ne3ed6laazrta3xa@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94343df1-64bc-2b07-acbc-4f4b6c54fb55@suse.com>
Date: Thu, 14 May 2020 15:11:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514100133.ne3ed6laazrta3xa@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 12:01, Wei Liu wrote:
> On Wed, May 13, 2020 at 04:43:33PM +0100, Hongyan Xia wrote:
>> From: Hongyan Xia <hongyxia@amazon.com>
>>
>> The macro version UNMAP_DOMAIN_PAGE() does both NULL checking and
>> variable clearing. Move NULL checking into the function itself so that
>> the semantics is consistent with other similar constructs like XFREE().
>> This also eases the use unmap_domain_page() in error handling paths,
>> where we only care about NULL checking but not about variable clearing.
>>
>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> 
> Reviewed-by: Wei Liu <wl@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


