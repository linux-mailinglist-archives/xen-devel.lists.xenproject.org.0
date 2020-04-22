Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6D1B46C3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 16:01:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRFw1-0007sH-MO; Wed, 22 Apr 2020 14:01:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j4T=6G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRFvz-0007sC-Ud
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 14:01:03 +0000
X-Inumbo-ID: b3663de7-84a1-11ea-9289-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3663de7-84a1-11ea-9289-12813bfff9fa;
 Wed, 22 Apr 2020 14:01:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF032ABCF;
 Wed, 22 Apr 2020 14:01:00 +0000 (UTC)
Subject: Re: [PATCH] xen/grants: fix hypercall continuation for
 GNTTABOP_cache_flush
To: Juergen Gross <jgross@suse.com>
References: <20200422130753.14713-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b050b8e-72d2-2d4f-3e23-101596d31d40@suse.com>
Date: Wed, 22 Apr 2020 16:00:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422130753.14713-1-jgross@suse.com>
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

On 22.04.2020 15:07, Juergen Gross wrote:
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -3626,12 +3626,12 @@ do_grant_table_op(
>          if ( unlikely(!guest_handle_okay(cflush, count)) )
>              goto out;
>          rc = gnttab_cache_flush(cflush, &opaque_in, count);
> -        if ( rc > 0 )
> +        if ( rc >= 0 )
>          {
>              guest_handle_add_offset(cflush, rc);
>              uop = guest_handle_cast(cflush, void);
> +            opaque_out = opaque_in;
>          }
> -        opaque_out = opaque_in;
>          break;
>      }
>  
> @@ -3641,7 +3641,7 @@ do_grant_table_op(
>      }
>  
>    out:
> -    if ( rc > 0 || opaque_out != 0 )
> +    if ( rc > 0 || (opaque_out != 0 && rc == 0) )

I disagree with this part - opaque_out shouldn't end up non-zero
when rc < 0, and it won't anymore with the change in the earlier
hunk.

Jan

