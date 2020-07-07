Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B462179AA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 22:45:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsuRN-0005o2-Md; Tue, 07 Jul 2020 20:43:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gwtg=AS=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jsuRM-0005nx-9j
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 20:43:44 +0000
X-Inumbo-ID: 8be18320-c092-11ea-bca7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8be18320-c092-11ea-bca7-bc764e2007e4;
 Tue, 07 Jul 2020 20:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594154623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OSUiNs2fk9vf5Yf2XiF6PjTmNHMFGvknvlUiA71OCsM=;
 b=YnL9K+zPlgkYK2giTSJwivIg8J3vPsoQoplVkdyAV9b7UQOtahZMPkWkiCjIfiB4hSkFG7
 mIzlAFHtPpDGeRW2ZzypIQdyGPmAoGX5KdgQNPOj1nZcIW4/IHJbJsr7p1cncr+3Eg+uJR
 v1d5VG43NKhNB2X1vCQbi9b+/8h0Ni0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-RP6EYJbuNYOpi3320bjyLw-1; Tue, 07 Jul 2020 16:43:41 -0400
X-MC-Unique: RP6EYJbuNYOpi3320bjyLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 368F1108BD15;
 Tue,  7 Jul 2020 20:43:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAC8110013C2;
 Tue,  7 Jul 2020 20:43:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4FE451132FD2; Tue,  7 Jul 2020 22:43:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v12 1/8] error: New macro ERRP_AUTO_PROPAGATE()
References: <20200707165037.1026246-1-armbru@redhat.com>
 <20200707165037.1026246-2-armbru@redhat.com>
 <3bea211a-4522-f713-2edc-261730702114@virtuozzo.com>
Date: Tue, 07 Jul 2020 22:43:29 +0200
In-Reply-To: <3bea211a-4522-f713-2edc-261730702114@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 7 Jul 2020 23:08:19 +0300")
Message-ID: <87a70b5a4u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, groug@kaod.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 07.07.2020 19:50, Markus Armbruster wrote:
>> From: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>>
>> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
>> functions with an errp OUT parameter.
>>
>> It has three goals:
>>
>> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user
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
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>> Reviewed-by: Paul Durrant<paul@xen.org>
>> Reviewed-by: Greg Kurz<groug@kaod.org>
>> Reviewed-by: Eric Blake<eblake@redhat.com>
>> [Comments merged properly with recent commit "error: Document Error
>> API usage rules", and edited for clarity.  Put ERRP_AUTO_PROPAGATE()
>> before its helpers, and touch up style.  Commit message tweaked.]
>> Signed-off-by: Markus Armbruster<armbru@redhat.com>
>
> Ok, I see you have mostly rewritten the big comment

Guilty as charged...  I was happy with the contents you provided (and
grateful for it), but our parallel work caused some redundancy.  I went
beyond a minimal merge to get a something that reads as one coherent
text.

> and not only in this patch, so, I go and read the whole comment on top of these series.
>
> =================================
>
>    * Pass an existing error to the caller with the message modified:
>    *     error_propagate_prepend(errp, err,
>    *                             "Could not frobnicate '%s': ", name);
>    * This is more concise than
>    *     error_propagate(errp, err); // don't do this
>    *     error_prepend(errp, "Could not frobnicate '%s': ", name);
>    * and works even when @errp is &error_fatal.
>
> - the latter doesn't consider ERRP_AUTO_PROPAGATE: as we know, that ERRP_AUTO_PROPAGATE should be used when we use error_prepend, the latter should look like
>
>
> ERRP_AUTO_PROPAGATE();
> ...
> error_propagate(errp, err); // don't do this
> error_prepend(errp, "Could not frobnicate '%s': ", name);
>
> - and it works even when @errp is &error_fatal, so the error_propagate_prepend now is just a shortcut, not the only correct way.

I can duplicate the advice from the paragraph preceding it, like this:

     * This is rarely needed.  When @err is a local variable, use of
     * ERRP_GUARD() commonly results in more readable code.
     * Where it is needed, it is more concise than
     *     error_propagate(errp, err); // don't do this
     *     error_prepend(errp, "Could not frobnicate '%s': ", name);
     * and works even when @errp is &error_fatal.

> Still, the text is formally correct as is, and may be improved later.
>
> =================================
>
>    * 2. Replace &err by errp, and err by *errp.  Delete local variable
>    *    @err.
>
> - hmm a bit not obvious,, It can be local_err.

Yes, but I trust the reader can make that mental jump.

> It can be (in some rare cases) still needed to handle the error locally, not passing to the caller..

I didn't think of this.

What about

     * To convert a function to use ERRP_GUARD(), assuming the local
     * variable it propagates to @errp is called @err:
     [...]
     * 2. Replace &err by errp, and err by *errp.  Delete local variable
     *    @err if it s now unused.

Nope, still no good, if we replace like that, @err *will* be unused, and
the locally handled error will leak to the caller.

No time left for wordsmithing; let's improve on top.

> may be just something like "Assume local Error *err variable is used to get errors from called functions and than propagated to caller's errp" before paragraph [2.] will help.
>
>
>    *
>    * 3. Delete error_propagate(errp, *errp), replace
>    *    error_propagate_prepend(errp, *errp, ...) by error_prepend(errp, ...),
>    *
>    * 4. Ensure @errp is valid at return: when you destroy *errp, set
>    *    errp = NULL.
>
> =================================
>
>
> May be good to add note about ERRP_AUTO_PROPAGATE() into comment above error_append_hint (and error_(v)prepend)).

Good point.

> =================================
>
>   /*
>    * Make @errp parameter easier to use regardless of argument value
>
> may be s/argument/its/
>
>    *
>    * This macro is for use right at the beginning of a function that
>    * takes an Error **errp parameter to pass errors to its caller.  The
>    * parameter must be named @errp.
>    *
>    * It must be used when the function dereferences @errp or passes
>    * @errp to error_prepend(), error_vprepend(), or error_append_hint().
>    * It is safe to use even when it's not needed, but please avoid
>    * cluttering the source with useless code.
>    *
>    * If @errp is NULL or &error_fatal, rewrite it to point to a local
>    * Error variable, which will be automatically propagated to the
>    * original @errp on function exit.
>    *
>    * Note: &error_abort is not rewritten, because that would move the
>    * abort from the place where the error is created to the place where
>    * it's propagated.
>    */
>
> =================================
>
>
> All these are minor, the documentation is good as is, thank you!

Thanks for your review, and your patience!


