Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0621E80BD
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:46:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegGy-00013A-HJ; Fri, 29 May 2020 14:46:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jegGw-000134-PG
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:46:10 +0000
X-Inumbo-ID: 223dab74-a1bb-11ea-9dbe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 223dab74-a1bb-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 14:46:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A5CBBAFB8;
 Fri, 29 May 2020 14:46:08 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: Improve error information in handle_pio()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200528130738.12816-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7ba144b3-3741-8bc5-8417-ceb84e6d23ce@suse.com>
Date: Fri, 29 May 2020 16:46:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528130738.12816-1-andrew.cooper3@citrix.com>
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
 Paul Durrant <paul.durrant@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.2020 15:07, Andrew Cooper wrote:
> domain_crash() should always have a message which emitted even in release
> builds, so something more useful than this is presented.
> 
>   (XEN) domain_crash called from io.c:171
>   (XEN) domain_crash called from io.c:171
>   (XEN) domain_crash called from io.c:171
>   ...
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -167,7 +167,9 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
>          break;
>  
>      default:
> -        gdprintk(XENLOG_ERR, "Weird HVM ioemulation status %d.\n", rc);
> +        gprintk(XENLOG_ERR, "Unexpected PIO status %d, port %#x %s 0x%0*lx\n",
> +                rc, port, dir == IOREQ_WRITE ? "write" : "read",
> +                size * 2, data & ((1ul << (size * 8)) - 1));

I agree with Roger that potentially logging rubbish for IOREQ_READ
may be confusing, so initializing "data" might end up being better.
Perhaps simply drop (or put in a comment) the
"if ( dir == IOREQ_WRITE )" at the top of the function? (As an
aside, it's also odd for "data" to be "unsigned long" rather than
just "unsigned int" or, less preferable, "uint32_t".)

Jan

