Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C61E80D9
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:49:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegKI-0001Pl-UV; Fri, 29 May 2020 14:49:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jegKH-0001Pb-LW
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:49:37 +0000
X-Inumbo-ID: 9dc8ac26-a1bb-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dc8ac26-a1bb-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 14:49:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DDE61B01E;
 Fri, 29 May 2020 14:49:35 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] clang: don't define nocall
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200528144023.10814-1-roger.pau@citrix.com>
 <20200528144023.10814-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bbc9aab3-6cb4-79b3-f646-a9565d39d0e2@suse.com>
Date: Fri, 29 May 2020 16:49:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528144023.10814-4-roger.pau@citrix.com>
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.2020 16:40, Roger Pau Monne wrote:
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -20,7 +20,11 @@
>  
>  #define __weak        __attribute__((__weak__))
>  
> -#define nocall        __attribute__((error("Nonstandard ABI")))
> +#if !defined(__clang__)
> +# define nocall        __attribute__((error("Nonstandard ABI")))

I think a blank wants dropping from here. I also should have noticed
already on Andrew's putting in of this construct that in a header
we'd better use __error__. Both can easily be taken care of while
committing.

Jan

