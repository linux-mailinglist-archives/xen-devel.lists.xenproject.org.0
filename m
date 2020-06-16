Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F412F1FAB15
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 10:26:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl6v1-000576-VQ; Tue, 16 Jun 2020 08:26:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl6v0-000571-Kf
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 08:26:06 +0000
X-Inumbo-ID: 044f7284-afab-11ea-b893-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 044f7284-afab-11ea-b893-12813bfff9fa;
 Tue, 16 Jun 2020 08:26:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A487ABCE;
 Tue, 16 Jun 2020 08:26:06 +0000 (UTC)
Subject: Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
To: Julien Grall <julien@xen.org>
References: <20200613184132.11880-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61a4dccf-4dc8-11a7-7428-f48e39b05276@suse.com>
Date: Tue, 16 Jun 2020 10:26:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200613184132.11880-1-julien@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.06.2020 20:41, Julien Grall wrote:
> @@ -73,10 +76,18 @@ struct xen_pvcalls_request {
>              uint32_t flags;
>              grant_ref_t ref;
>              uint32_t evtchn;
> +#ifndef __i386__
> +            uint8_t pad[4];
> +#endif

Where possible I think uint32_t would be slightly better to use.

>          } connect;
>          struct xen_pvcalls_release {
>              uint64_t id;
>              uint8_t reuse;
> +#ifndef __i386__
> +            uint8_t pad[7];
> +#else
> +            uint8_t pad[3];
> +#endif

For this I'd recommend uniform "uint8_t pad[3];" (i.e. outside
of any #ifdef) followed by a uint32_t again inside the #ifdef.

Expressing everything through e.g. alignof() would seem even
better, but I can't currently think of a way to do so cleanly.

In any event - I'm not the maintainer of these headers, so it
may be just me ...

Jan

