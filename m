Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47A1D0BAC
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 11:14:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYnSU-0007qF-M1; Wed, 13 May 2020 09:13:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYnSS-0007qA-Io
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 09:13:44 +0000
X-Inumbo-ID: 0adb0f94-94fa-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0adb0f94-94fa-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 09:13:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1481AAB8F;
 Wed, 13 May 2020 09:13:45 +0000 (UTC)
Subject: Re: [PATCH] x86/build32: Discard all orphaned sections
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200512191108.6461-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a1d1135a-8f9c-81c3-5fc8-bbc3787ebd0f@suse.com>
Date: Wed, 13 May 2020 11:13:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512191108.6461-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>, Stefan Bader <stefan.bader@canonical.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.05.2020 21:11, Andrew Cooper wrote:
> @@ -47,6 +47,14 @@ SECTIONS
>           *
>           * Please check build32.mk for more details.
>           */
> -        /* *(.got.plt) */
> +        *(.got.plt)
> +  }
> +
> +  /DISCARD/ : {
> +        /*
> +         * Discard everything else, to prevent linkers from putting
> +         * orphaned sections ahead of .text, which needs to be first.
> +         */
> +        *(*)
>    }
>  }

To be honest I'm not sure if this isn't going too far. Much
depends on what would happen if a new real section appeared
that needs retaining. Granted the linker may then once again
put it at the beginning of the image, and we'll be screwed
again, just like we'll be screwed if a section gets discarded
by mistake. But it would be really nice if we had a way to
flag the need to play with the linker script. Hence perhaps
on new enough tool chains we indeed may want to make use of
--orphan-handling= ? And then discard just .note and .note.*
here?

Jan

