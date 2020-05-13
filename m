Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77341D1736
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 16:12:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYs6K-0000sc-EU; Wed, 13 May 2020 14:11:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYs6J-0000sX-8Z
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 14:11:11 +0000
X-Inumbo-ID: 97a5c9cc-9523-11ea-a383-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97a5c9cc-9523-11ea-a383-12813bfff9fa;
 Wed, 13 May 2020 14:11:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96891AD10;
 Wed, 13 May 2020 14:11:10 +0000 (UTC)
Subject: Re: [PATCH] x86/build: move -fno-asynchronous-unwind-tables into
 EMBEDDED_EXTRA_CFLAGS
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20200513135552.24329-1-andrew.cooper3@citrix.com>
 <20200513135552.24329-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88c734e9-fd99-c157-ae9c-0900157bf1b6@suse.com>
Date: Wed, 13 May 2020 16:11:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513135552.24329-2-andrew.cooper3@citrix.com>
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
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.05.2020 15:55, Andrew Cooper wrote:
> Users of EMBEDDED_EXTRA_CFLAGS already use -fno-asynchronous-unwind-tables, or
> ought to.

It's not really well defined what they're supposed to be used for
(and where it's not supposed to be used). I notice in particular
a use in stubdom/Makefile which I'm unsure whether it indeed wants
this adjustment. Therefore ...

>  This shrinks the size of the rombios 32bit stubs in guest memory.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with the request that Samuel also ack (or otherwise) the change
from a stubdom perspective.

Jan

