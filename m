Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39D6217881
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 22:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstma-00028v-NV; Tue, 07 Jul 2020 20:01:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gwtg=AS=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jstmZ-00028q-Gm
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 20:01:35 +0000
X-Inumbo-ID: a8575bde-c08c-11ea-bb8b-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a8575bde-c08c-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 20:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594152093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ANH7oWwKRrDk54ynkXpx8px3Vbl0w8cuK3dMy77nJTc=;
 b=dGCbrmzpOA0yopaLK+qU/FxIl/PTPB3xGo1VrisrewTa6aH11ekeDPhjBv80JLxJtZplRo
 1G2S1jCOaonSaqv0qq3JmfsxwLOzdHQW8Nzvr0zwRDENObhIjOP0ooA6RXF91rHNWgSLtZ
 60KlOEdvyHpbKXJEyvtrQG+hz5Y8P+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-PFsI-5sUPva7wvO5__2oNg-1; Tue, 07 Jul 2020 16:01:32 -0400
X-MC-Unique: PFsI-5sUPva7wvO5__2oNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 717C318FE860;
 Tue,  7 Jul 2020 20:01:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F079E1A835;
 Tue,  7 Jul 2020 20:01:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5BAA71132FD2; Tue,  7 Jul 2020 22:01:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v12 1/8] error: New macro ERRP_AUTO_PROPAGATE()
References: <20200707165037.1026246-1-armbru@redhat.com>
 <20200707165037.1026246-2-armbru@redhat.com>
 <afd4b693-2aec-247b-c0a7-7d061ed5bdff@redhat.com>
Date: Tue, 07 Jul 2020 22:01:21 +0200
In-Reply-To: <afd4b693-2aec-247b-c0a7-7d061ed5bdff@redhat.com> (Eric Blake's
 message of "Tue, 7 Jul 2020 14:02:41 -0500")
Message-ID: <87h7uj6qni.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, groug@kaod.org,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Eric Blake <eblake@redhat.com> writes:

> On 7/7/20 11:50 AM, Markus Armbruster wrote:
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
>> functions with an errp OUT parameter.
>>
>> It has three goals:
>>
>> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user
>
> the user

Yes.

>> can't see this additional information, because exit() happens in
>> error_setg earlier than information is added. [Reported by Greg Kurz]
>>
>> 2. Fix issue with error_abort and error_propagate: when we wrap
>> error_abort by local_err+error_propagate, the resulting coredump will
>> refer to error_propagate and not to the place where error happened.
>> (the macro itself doesn't fix the issue, but it allows us to [3.] drop
>> the local_err+error_propagate pattern, which will definitely fix the
>> issue) [Reported by Kevin Wolf]
>>
>> 3. Drop local_err+error_propagate pattern, which is used to workaround
>> void functions with errp parameter, when caller wants to know resulting
>> status. (Note: actually these functions could be merely updated to
>> return int error code).
>>
>> To achieve these goals, later patches will add invocations
>> of this macro at the start of functions with either use
>> error_prepend/error_append_hint (solving 1) or which use
>> local_err+error_propagate to check errors, switching those
>> functions to use *errp instead (solving 2 and 3).
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> [Comments merged properly with recent commit "error: Document Error
>> API usage rules", and edited for clarity.  Put ERRP_AUTO_PROPAGATE()
>> before its helpers, and touch up style.  Commit message tweaked.]
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   include/qapi/error.h | 160 ++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 141 insertions(+), 19 deletions(-)
>>
>> diff --git a/include/qapi/error.h b/include/qapi/error.h
>> index 3fed49747d..c865a7d2f1 100644
>> --- a/include/qapi/error.h
>> +++ b/include/qapi/error.h
>
>> @@ -128,18 +122,26 @@
>>    *         handle the error...
>>    *     }
>>    * when it doesn't, say a void function:
>> + *     ERRP_AUTO_PROPAGATE();
>> + *     foo(arg, errp);
>> + *     if (*errp) {
>> + *         handle the error...
>> + *     }
>> + * More on ERRP_AUTO_PROPAGATE() below.
>> + *
>> + * Code predating ERRP_AUTO_PROPAGATE() still exits, and looks like this:
>
> exists

Fixing...

>>    *     Error *err = NULL;
>>    *     foo(arg, &err);
>>    *     if (err) {
>>    *         handle the error...
>> - *         error_propagate(errp, err);
>> + *         error_propagate(errp, err); // deprecated
>>    *     }
>> - * Do *not* "optimize" this to
>> + * Avoid in new code.  Do *not* "optimize" it to
>>    *     foo(arg, errp);
>>    *     if (*errp) { // WRONG!
>>    *         handle the error...
>>    *     }
>> - * because errp may be NULL!
>> + * because errp may be NULL!  Guard with ERRP_AUTO_PROPAGATE().
>
> maybe:
>
> because errp may be NULL without the ERRP_AUTO_PROPAGATE() guard.

Sold.

>>    *
>>    * But when all you do with the error is pass it on, please use
>>    *     foo(arg, errp);
>> @@ -158,6 +160,19 @@
>>    *         handle the error...
>>    *     }
>>    *
>> + * Pass an existing error to the caller:
>
>> + * = Converting to ERRP_AUTO_PROPAGATE() =
>> + *
>> + * To convert a function to use ERRP_AUTO_PROPAGATE():
>> + *
>> + * 0. If the Error ** parameter is not named @errp, rename it to
>> + *    @errp.
>> + *
>> + * 1. Add an ERRP_AUTO_PROPAGATE() invocation, by convention right at
>> + *    the beginning of the function.  This makes @errp safe to use.
>> + *
>> + * 2. Replace &err by errp, and err by *errp.  Delete local variable
>> + *    @err.
>> + *
>> + * 3. Delete error_propagate(errp, *errp), replace
>> + *    error_propagate_prepend(errp, *errp, ...) by error_prepend(errp, ...),
>> + *
>
> Why a comma here?

Editing accident.

>> + * 4. Ensure @errp is valid at return: when you destroy *errp, set
>> + *    errp = NULL.
>> + *
>> + * Example:
>> + *
>> + *     bool fn(..., Error **errp)
>> + *     {
>> + *         Error *err = NULL;
>> + *
>> + *         foo(arg, &err);
>> + *         if (err) {
>> + *             handle the error...
>> + *             error_propagate(errp, err);
>> + *             return false;
>> + *         }
>> + *         ...
>> + *     }
>> + *
>> + * becomes
>> + *
>> + *     bool fn(..., Error **errp)
>> + *     {
>> + *         ERRP_AUTO_PROPAGATE();
>> + *
>> + *         foo(arg, errp);
>> + *         if (*errp) {
>> + *             handle the error...
>> + *             return false;
>> + *         }
>> + *         ...
>> + *     }
>
> Do we want the example to show the use of error_free and *errp = NULL?

Yes, but we're running out of time, so let's do it in the series that
introduces the usage to the code.

> Otherwise, this is looking good to me.  It will need a tweak if we go
> with the shorter name ERRP_GUARD, but I like that idea.

Tweaking away...

Thanks!


