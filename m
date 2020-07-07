Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E1D217773
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:03:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jssrp-0003r4-OL; Tue, 07 Jul 2020 19:02:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om5Q=AS=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1jssrn-0003qz-RV
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:02:55 +0000
X-Inumbo-ID: 76ad438a-c084-11ea-8496-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 76ad438a-c084-11ea-8496-bc764e2007e4;
 Tue, 07 Jul 2020 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594148574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KI8ePZl9TDbDjrxDfDqnNlC+04UP8bDvXEL9iQK5BS0=;
 b=WMA3Ie0lgx/n0gbNS1yziw62jZYjOqH2419WEB39BlC5xEK9DIglyvnMRqQzEv87VfGfrg
 m9cJWOIFghYHaXUbaQ6Gu3Dp7lC9EtZl+Zjb2rawT79+Ygd5gh98tQMfp2GT+rXVGGqM3U
 /z5sAagCigepG+TnLK6vJyqwHKAFrb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-UBMfkjp5NNKkrI0n77hKaA-1; Tue, 07 Jul 2020 15:02:50 -0400
X-MC-Unique: UBMfkjp5NNKkrI0n77hKaA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED476107ACCD;
 Tue,  7 Jul 2020 19:02:48 +0000 (UTC)
Received: from [10.3.115.46] (ovpn-115-46.phx2.redhat.com [10.3.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED170797F3;
 Tue,  7 Jul 2020 19:02:41 +0000 (UTC)
Subject: Re: [PATCH v12 1/8] error: New macro ERRP_AUTO_PROPAGATE()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200707165037.1026246-1-armbru@redhat.com>
 <20200707165037.1026246-2-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <afd4b693-2aec-247b-c0a7-7d061ed5bdff@redhat.com>
Date: Tue, 7 Jul 2020 14:02:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707165037.1026246-2-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, groug@kaod.org,
 Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/7/20 11:50 AM, Markus Armbruster wrote:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
> functions with an errp OUT parameter.
> 
> It has three goals:
> 
> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user

the user

> can't see this additional information, because exit() happens in
> error_setg earlier than information is added. [Reported by Greg Kurz]
> 
> 2. Fix issue with error_abort and error_propagate: when we wrap
> error_abort by local_err+error_propagate, the resulting coredump will
> refer to error_propagate and not to the place where error happened.
> (the macro itself doesn't fix the issue, but it allows us to [3.] drop
> the local_err+error_propagate pattern, which will definitely fix the
> issue) [Reported by Kevin Wolf]
> 
> 3. Drop local_err+error_propagate pattern, which is used to workaround
> void functions with errp parameter, when caller wants to know resulting
> status. (Note: actually these functions could be merely updated to
> return int error code).
> 
> To achieve these goals, later patches will add invocations
> of this macro at the start of functions with either use
> error_prepend/error_append_hint (solving 1) or which use
> local_err+error_propagate to check errors, switching those
> functions to use *errp instead (solving 2 and 3).
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> [Comments merged properly with recent commit "error: Document Error
> API usage rules", and edited for clarity.  Put ERRP_AUTO_PROPAGATE()
> before its helpers, and touch up style.  Commit message tweaked.]
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/qapi/error.h | 160 ++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 141 insertions(+), 19 deletions(-)
> 
> diff --git a/include/qapi/error.h b/include/qapi/error.h
> index 3fed49747d..c865a7d2f1 100644
> --- a/include/qapi/error.h
> +++ b/include/qapi/error.h

> @@ -128,18 +122,26 @@
>    *         handle the error...
>    *     }
>    * when it doesn't, say a void function:
> + *     ERRP_AUTO_PROPAGATE();
> + *     foo(arg, errp);
> + *     if (*errp) {
> + *         handle the error...
> + *     }
> + * More on ERRP_AUTO_PROPAGATE() below.
> + *
> + * Code predating ERRP_AUTO_PROPAGATE() still exits, and looks like this:

exists

>    *     Error *err = NULL;
>    *     foo(arg, &err);
>    *     if (err) {
>    *         handle the error...
> - *         error_propagate(errp, err);
> + *         error_propagate(errp, err); // deprecated
>    *     }
> - * Do *not* "optimize" this to
> + * Avoid in new code.  Do *not* "optimize" it to
>    *     foo(arg, errp);
>    *     if (*errp) { // WRONG!
>    *         handle the error...
>    *     }
> - * because errp may be NULL!
> + * because errp may be NULL!  Guard with ERRP_AUTO_PROPAGATE().

maybe:

because errp may be NULL without the ERRP_AUTO_PROPAGATE() guard.

>    *
>    * But when all you do with the error is pass it on, please use
>    *     foo(arg, errp);
> @@ -158,6 +160,19 @@
>    *         handle the error...
>    *     }
>    *
> + * Pass an existing error to the caller:

> + * = Converting to ERRP_AUTO_PROPAGATE() =
> + *
> + * To convert a function to use ERRP_AUTO_PROPAGATE():
> + *
> + * 0. If the Error ** parameter is not named @errp, rename it to
> + *    @errp.
> + *
> + * 1. Add an ERRP_AUTO_PROPAGATE() invocation, by convention right at
> + *    the beginning of the function.  This makes @errp safe to use.
> + *
> + * 2. Replace &err by errp, and err by *errp.  Delete local variable
> + *    @err.
> + *
> + * 3. Delete error_propagate(errp, *errp), replace
> + *    error_propagate_prepend(errp, *errp, ...) by error_prepend(errp, ...),
> + *

Why a comma here?

> + * 4. Ensure @errp is valid at return: when you destroy *errp, set
> + *    errp = NULL.
> + *
> + * Example:
> + *
> + *     bool fn(..., Error **errp)
> + *     {
> + *         Error *err = NULL;
> + *
> + *         foo(arg, &err);
> + *         if (err) {
> + *             handle the error...
> + *             error_propagate(errp, err);
> + *             return false;
> + *         }
> + *         ...
> + *     }
> + *
> + * becomes
> + *
> + *     bool fn(..., Error **errp)
> + *     {
> + *         ERRP_AUTO_PROPAGATE();
> + *
> + *         foo(arg, errp);
> + *         if (*errp) {
> + *             handle the error...
> + *             return false;
> + *         }
> + *         ...
> + *     }

Do we want the example to show the use of error_free and *errp = NULL?

Otherwise, this is looking good to me.  It will need a tweak if we go 
with the shorter name ERRP_GUARD, but I like that idea.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


