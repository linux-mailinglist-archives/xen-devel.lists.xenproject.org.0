Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C563B1D77DE
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 13:52:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaeIa-0007yl-Nl; Mon, 18 May 2020 11:51:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jaeIY-0007yg-Vn
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 11:51:11 +0000
X-Inumbo-ID: dd60b4d0-98fd-11ea-a854-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd60b4d0-98fd-11ea-a854-12813bfff9fa;
 Mon, 18 May 2020 11:51:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 55EF4B01C;
 Mon, 18 May 2020 11:51:11 +0000 (UTC)
Subject: Re: [RESEND PATCH v2 for-4.14] pvcalls: Document correctly and
 explicitely the padding for all arches
To: Julien Grall <julien@xen.org>
References: <20200516102157.1928-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31a7d5b0-4e4f-960c-d4e0-8e87bf489db2@suse.com>
Date: Mon, 18 May 2020 13:51:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200516102157.1928-1-julien@xen.org>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.05.2020 12:21, Julien Grall wrote:
> --- a/xen/include/public/io/pvcalls.h
> +++ b/xen/include/public/io/pvcalls.h
> @@ -65,6 +65,9 @@ struct xen_pvcalls_request {
>              uint32_t domain;
>              uint32_t type;
>              uint32_t protocol;
> +#ifndef CONFIG_X86_32
> +            uint8_t pad[4];
> +#endif

There's no concept of CONFIG_* in the public headers, the dependency
(as you'll find elsewhere) is on __i386__ / __x86_64__. Also whether
there's any padding really doesn't depend directly on the architecture,
but instead on __alignof__(uint64_t) (i.e. a future port to a 32-bit
arch, even if - like on x86 - just a guest bitness, may similarly
want / need / have no padding here).

Jan

