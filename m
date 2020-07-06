Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E07E21524D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 08:01:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsKAK-00052l-Co; Mon, 06 Jul 2020 05:59:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HS9e=AR=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jsKAI-00052g-Ia
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 05:59:42 +0000
X-Inumbo-ID: e10d61ac-bf4d-11ea-8c41-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e10d61ac-bf4d-11ea-8c41-12813bfff9fa;
 Mon, 06 Jul 2020 05:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594015179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RDj94LFWNXNG6l5HKQRtxvGkWU+Qk9Sz8iHMo0NKMBQ=;
 b=ISNmGHa3JUFGEK70SPIyJZbFPRljRpkKSeIU20TeOucGHMRl0UGdoLvdb8/KJRjjfy0rHa
 +wF2LxtYA/ivBI0NjWtbFg8X+gXXFTyK4AuSSaq5kmO7gzFxBvoi6aRbexg9mylwx8EYG9
 +TI+PKlqTvGOhH0Vo8NPsrIHDkuFT/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-XTMDI9ctPZSmrUKS_wxtNA-1; Mon, 06 Jul 2020 01:59:35 -0400
X-MC-Unique: XTMDI9ctPZSmrUKS_wxtNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0977805EE6;
 Mon,  6 Jul 2020 05:59:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9102960BF3;
 Mon,  6 Jul 2020 05:59:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 19C101138648; Mon,  6 Jul 2020 07:59:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v11 1/8] error: auto propagated local_err
References: <20200703090816.3295-1-vsementsov@virtuozzo.com>
 <20200703090816.3295-2-vsementsov@virtuozzo.com>
Date: Mon, 06 Jul 2020 07:59:25 +0200
In-Reply-To: <20200703090816.3295-2-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 3 Jul 2020 12:08:09 +0300")
Message-ID: <87o8otgp4y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 groug@kaod.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
> functions with an errp OUT parameter.
>
> It has three goals:
>
> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user
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
> ---
>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> Cc: Laszlo Ersek <lersek@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: xen-devel@lists.xenproject.org
>
>  include/qapi/error.h | 205 ++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 172 insertions(+), 33 deletions(-)
>
> diff --git a/include/qapi/error.h b/include/qapi/error.h
> index 5ceb3ace06..b54aedbfd7 100644
> --- a/include/qapi/error.h
> +++ b/include/qapi/error.h
> @@ -39,7 +39,7 @@
>   *   =E2=80=A2 pointer-valued functions return non-null / null pointer, =
and
>   *   =E2=80=A2 integer-valued functions return non-negative / negative.
>   *
> - * How to:
> + * =3D Deal with Error object =3D
>   *
>   * Create an error:
>   *     error_setg(errp, "situation normal, all fouled up");
> @@ -73,28 +73,91 @@
>   * reporting it (primarily useful in testsuites):
>   *     error_free_or_abort(&err);
>   *
> - * Pass an existing error to the caller:
> - *     error_propagate(errp, err);
> - * where Error **errp is a parameter, by convention the last one.
> + * =3D Deal with Error ** function parameter =3D
>   *
> - * Pass an existing error to the caller with the message modified:
> - *     error_propagate_prepend(errp, err);
> + * A function may use the error system to return errors. In this case, t=
he
> + * function defines an Error **errp parameter, by convention the last on=
e (with
> + * exceptions for functions using ... or va_list).
>   *
> - * Avoid
> - *     error_propagate(errp, err);
> - *     error_prepend(errp, "Could not frobnicate '%s': ", name);
> - * because this fails to prepend when @errp is &error_fatal.
> + * The caller may then pass in the following errp values:
> + *
> + * 1. &error_abort
> + *    Any error will result in abort().
> + * 2. &error_fatal
> + *    Any error will result in exit() with a non-zero status.
> + * 3. NULL
> + *    No error reporting through errp parameter.
> + * 4. The address of a NULL-initialized Error *err
> + *    Any error will populate errp with an error object.

The rebase onto my "error: Document Error API usage rules" rendered this
this partly redundant.  I'll try my hand at a proper merge, then ask you
to check it.

Should I fail to complete this in time for the soft freeze, we can merge
the thing as is.  Comment improvements are fair game until -rc1 or so.

>   *
> - * Create a new error and pass it to the caller:
> + * The following rules then implement the correct semantics desired by t=
he
> + * caller.
> + *
> + * Create a new error to pass to the caller:
>   *     error_setg(errp, "situation normal, all fouled up");
>   *
> - * Call a function and receive an error from it:
> + * Calling another errp-based function:
> + *     f(..., errp);
> + *
> + * =3D=3D Checking success of subcall =3D=3D
> + *
> + * If a function returns a value indicating an error in addition to sett=
ing
> + * errp (which is recommended), then you don't need any additional code,=
 just
> + * do:
> + *
> + *     int ret =3D f(..., errp);
> + *     if (ret < 0) {
> + *         ... handle error ...
> + *         return ret;
> + *     }
> + *
> + * If a function returns nothing (not recommended for new code), the onl=
y way

Also when a function returns something, but there is no distinct error
value.  Example: object_property_get_int().

I shouldn't criticize comments without suggesting improvements.  But
since I'm going to mess with this text anyway to merge your work with my
prior work, I take it easy and only note what I think needs work.  I'll
then try to address all that in or on top of my merge.

> + * to check success is by consulting errp; doing this safely requires th=
e use
> + * of the ERRP_AUTO_PROPAGATE macro, like this:

"Requires" is inaccurate.  Using a local variable with error_propagate()
also works (there's even an example right below).  We prefer
ERRP_AUTO_PROPAGATE(), because it's more readable and improves the
debugging experience.

> + *
> + *     int our_func(..., Error **errp) {

A function's opening brace goes on its own line.  More of the same below.

> + *         ERRP_AUTO_PROPAGATE();
> + *         ...
> + *         subcall(..., errp);
> + *         if (*errp) {
> + *             ...
> + *             return -EINVAL;
> + *         }
> + *         ...
> + *     }
> + *
> + * ERRP_AUTO_PROPAGATE takes care of wrapping the original errp as neede=
d, so
> + * that the rest of the function can directly use errp (including
> + * dereferencing), where any errors will then be propagated on to the or=
iginal
> + * errp when leaving the function.
> + *
> + * In some cases, we need to check result of subcall, but do not want to
> + * propagate the Error object to our caller. In such cases we don't need
> + * ERRP_AUTO_PROPAGATE, but just a local Error object:
> + *
> + * Receive an error and not pass it:
>   *     Error *err =3D NULL;
> - *     foo(arg, &err);
> + *     subcall(arg, &err);
>   *     if (err) {
>   *         handle the error...
> + *         error_free(err);
>   *     }
>   *
> + * Note that older code that did not use ERRP_AUTO_PROPAGATE would inste=
ad need
> + * a local Error * variable and the use of error_propagate() to properly=
 handle
> + * all possible caller values of errp. Now this is DEPRECATED* (see belo=
w).

I'd prefer not to shout DEPRECATED.

> + *
> + * Note that any function that wants to modify an error object, such as =
by
> + * calling error_append_hint or error_prepend, must use ERRP_AUTO_PROPAG=
ATE, in
> + * order for a caller's use of &error_fatal to see the additional inform=
ation.

"Must" should be reserved for situations where failure to adhere is
categorically wrong.

While we *want* people to use ERRP_AUTO_PROPAGATE() with
error_append_hint() and error_prepend(), failure to do so need not be
wrong.

Apropos error_append_hint(), the "Show errp instead of &err where &err
is actually unusual" part of my "error: Improve examples in error.h's
big comment" now feels premature to me.  E.g.

    * Create an error and add additional explanation:
  - *     error_setg(&err, "invalid quark");
  - *     error_append_hint(&err, "Valid quarks are up, down, strange, "
  + *     error_setg(errp, "invalid quark");
  + *     error_append_hint(errp, "Valid quarks are up, down, strange, "
    *                       "charm, top, bottom.\n");

is actually bad advice until ERRP_AUTO_PROPAGATE() turns it into good
advice.  I think I'll drop it from my commit, then see how I like the
comment with yours applied.

> + *
> + * In rare cases, we need to pass existing Error object to the caller by=
 hand:
> + *     error_propagate(errp, err);

Out of curiosity: can you describe such a case?

> + *
> + * Pass an existing error to the caller with the message modified:
> + *     error_propagate_prepend(errp, err);
> + *
> + *
>   * Call a function ignoring errors:
>   *     foo(arg, NULL);
>   *
> @@ -104,26 +167,6 @@
>   * Call a function treating errors as fatal:
>   *     foo(arg, &error_fatal);
>   *
> - * Receive an error and pass it on to the caller:
> - *     Error *err =3D NULL;
> - *     foo(arg, &err);
> - *     if (err) {
> - *         handle the error...
> - *         error_propagate(errp, err);
> - *     }
> - * where Error **errp is a parameter, by convention the last one.
> - *
> - * Do *not* "optimize" this to
> - *     foo(arg, errp);
> - *     if (*errp) { // WRONG!
> - *         handle the error...
> - *     }
> - * because errp may be NULL!
> - *
> - * But when all you do with the error is pass it on, please use
> - *     foo(arg, errp);
> - * for readability.
> - *
>   * Receive and accumulate multiple errors (first one wins):
>   *     Error *err =3D NULL, *local_err =3D NULL;
>   *     foo(arg, &err);
> @@ -151,6 +194,61 @@
>   *         error_setg(&err, ...); // WRONG!
>   *     }
>   * because this may pass a non-null err to error_setg().
> + *
> + * DEPRECATED*
> + *
> + * The following pattern of receiving, checking, and then forwarding an =
error
> + * to the caller by hand is now deprecated:
> + *
> + *     Error *err =3D NULL;
> + *     foo(arg, &err);
> + *     if (err) {
> + *         handle the error...
> + *         error_propagate(errp, err);
> + *     }
> + *
> + * Instead, use ERRP_AUTO_PROPAGATE macro.
> + *
> + * The old pattern is deprecated because of two things:
> + *
> + * 1. Issue with error_abort and error_propagate: when we wrap error_abo=
rt by
> + * local_err+error_propagate, the resulting coredump will refer to
> + * error_propagate and not to the place where error happened.
> + *
> + * 2. A lot of extra code of the same pattern
> + *
> + * How to update old code to use ERRP_AUTO_PROPAGATE?
> + *
> + * All you need is to add ERRP_AUTO_PROPAGATE() invocation at function s=
tart,
> + * than you may safely dereference errp to check errors and do not need =
any
> + * additional local Error variables or calls to error_propagate().
> + *
> + * Example:
> + *
> + * old code
> + *
> + *     void fn(..., Error **errp) {
> + *         Error *err =3D NULL;
> + *         foo(arg, &err);
> + *         if (err) {
> + *             handle the error...
> + *             error_propagate(errp, err);
> + *             return;
> + *         }
> + *         ...
> + *     }
> + *
> + * updated code
> + *
> + *     void fn(..., Error **errp) {
> + *         ERRP_AUTO_PROPAGATE();
> + *         foo(arg, errp);
> + *         if (*errp) {
> + *             handle the error...
> + *             return;
> + *         }
> + *         ...
> + *     }

This is another spot where we need to merge your work with mine
properly.  When foo() returns a distinct error value, then checking that
is even better:

          void fn(..., Error **errp)
          {
              if (!foo(arg, errp)) {
                  handle the error...
                  return;
              }
              ...
          }

>   */
> =20
>  #ifndef ERROR_H
> @@ -359,6 +457,47 @@ void error_set_internal(Error **errp,
>                          ErrorClass err_class, const char *fmt, ...)
>      GCC_FMT_ATTR(6, 7);
> =20

The ERRP_AUTO_PROPAGATE stuff starts rather abruptly.  I'm afraid an
unprepared reader will get what's going on only at
G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(), or even at #define
ERRP_AUTO_PROPAGATE().

Let's move the typedef, helper function and macro invocation behind the
definition of ERRP_AUTO_PROPAGATE(), similar to how we declare each
error_FOO_internal() helper function right after the macro that needs
it.

> +typedef struct ErrorPropagator {
> +    Error *local_err;
> +    Error **errp;
> +} ErrorPropagator;
> +
> +static inline void error_propagator_cleanup(ErrorPropagator *prop)
> +{
> +    error_propagate(prop->errp, prop->local_err);
> +}
> +
> +G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(ErrorPropagator, error_propagator_clean=
up);
> +
> +/*
> + * ERRP_AUTO_PROPAGATE
> + *

No other definition comment in this file repeats the name being defined.
Let's keep the comment style locally consistent.

> + * This macro exists to assist with proper error handling in a function =
which
> + * uses an Error **errp parameter.  It must be used as the first line of=
 a
> + * function which modifies an error (with error_prepend, error_append_hi=
nt, or
> + * similar) or which wants to dereference *errp.  It is still safe (but
> + * useless) to use in other functions.
> + *
> + * If errp is NULL or points to error_fatal, it is rewritten to point to=
 a
> + * local Error object, which will be automatically propagated to the ori=
ginal
> + * errp on function exit (see error_propagator_cleanup).
> + *
> + * After invocation of this macro it is always safe to dereference errp
> + * (as it's not NULL anymore) and to add information by error_prepend or
> + * error_append_hint (as, if it was error_fatal, we swapped it with a
> + * local_error to be propagated on cleanup).
> + *
> + * Note: we don't wrap the error_abort case, as we want resulting coredu=
mp
> + * to point to the place where the error happened, not to error_propagat=
e.
> + */
> +#define ERRP_AUTO_PROPAGATE() \
> +    g_auto(ErrorPropagator) _auto_errp_prop =3D {.errp =3D errp}; \
> +    do { \
> +        if (!errp || errp =3D=3D &error_fatal) { \
> +            errp =3D &_auto_errp_prop.local_err; \
> +        } \
> +    } while (0)
> +

Let's align the backslashes for consistency with nearby macros:

   #define ERRP_AUTO_PROPAGATE()                                   \
       g_auto(ErrorPropagator) _auto_errp_prop =3D {.errp =3D errp};   \
       do {                                                        \
           if (!errp || errp =3D=3D &error_fatal) {                    \
               errp =3D &_auto_errp_prop.local_err;                  \
           }                                                       \
       } while (0)

>  /*
>   * Special error destination to abort on error.
>   * See error_setg() and error_propagate() for details.


