Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AB01F56E8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 16:40:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj1tL-0006t3-03; Wed, 10 Jun 2020 14:39:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RI0U=7X=kaod.org=groug@srs-us1.protection.inumbo.net>)
 id 1jj1tJ-0006sy-BM
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 14:39:45 +0000
X-Inumbo-ID: 38c5919c-ab28-11ea-b452-12813bfff9fa
Received: from 9.mo7.mail-out.ovh.net (unknown [46.105.60.248])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38c5919c-ab28-11ea-b452-12813bfff9fa;
 Wed, 10 Jun 2020 14:39:43 +0000 (UTC)
Received: from player159.ha.ovh.net (unknown [10.108.35.110])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 45EC916B3C3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 16:39:42 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id 2FAE61338D640;
 Wed, 10 Jun 2020 14:39:22 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00574e510ee-3009-4990-8158-7d496a54c194,22147FB2222D4A9FBAB43F4367B50A808946A5A0)
 smtp.auth=groug@kaod.org
Date: Wed, 10 Jun 2020 16:39:21 +0200
From: Greg Kurz <groug@kaod.org>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v10 1/9] error: auto propagated local_err
Message-ID: <20200610163921.28d824aa@bahia.lan>
In-Reply-To: <20200317151625.20797-2-vsementsov@virtuozzo.com>
References: <20200317151625.20797-1-vsementsov@virtuozzo.com>
 <20200317151625.20797-2-vsementsov@virtuozzo.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 17342517742431344979
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudehiedgkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueekjeekiefffedtveeukedvteejgeeivefhgfejgfdtleduvdfgfeelkeeuveeunecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
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
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, armbru@redhat.com,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 17 Mar 2020 18:16:17 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
> functions with an errp OUT parameter.
>=20
> It has three goals:
>=20
> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user
> can't see this additional information, because exit() happens in
> error_setg earlier than information is added. [Reported by Greg Kurz]
>=20

I have more of these coming and I'd really like to use ERRP_AUTO_PROPAGATE.

It seems we have a consensus on the macro itself but this series is gated
by the conversion of the existing code base.

What about merging this patch separately so that people can start using
it at least ?

> 2. Fix issue with error_abort and error_propagate: when we wrap
> error_abort by local_err+error_propagate, the resulting coredump will
> refer to error_propagate and not to the place where error happened.
> (the macro itself doesn't fix the issue, but it allows us to [3.] drop
> the local_err+error_propagate pattern, which will definitely fix the
> issue) [Reported by Kevin Wolf]
>=20
> 3. Drop local_err+error_propagate pattern, which is used to workaround
> void functions with errp parameter, when caller wants to know resulting
> status. (Note: actually these functions could be merely updated to
> return int error code).
>=20
> To achieve these goals, later patches will add invocations
> of this macro at the start of functions with either use
> error_prepend/error_append_hint (solving 1) or which use
> local_err+error_propagate to check errors, switching those
> functions to use *errp instead (solving 2 and 3).
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>=20
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
> Cc: Stefan Berger <stefanb@linux.ibm.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: xen-devel@lists.xenproject.org
>=20
>  include/qapi/error.h | 205 ++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 173 insertions(+), 32 deletions(-)
>=20
> diff --git a/include/qapi/error.h b/include/qapi/error.h
> index ad5b6e896d..30140d9bfe 100644
> --- a/include/qapi/error.h
> +++ b/include/qapi/error.h
> @@ -15,6 +15,8 @@
>  /*
>   * Error reporting system loosely patterned after Glib's GError.
>   *
> + * =3D Deal with Error object =3D
> + *
>   * Create an error:
>   *     error_setg(&err, "situation normal, all fouled up");
>   *
> @@ -47,28 +49,91 @@
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
>   *
> - * Create a new error and pass it to the caller:
> + * 1. &error_abort
> + *    Any error will result in abort().
> + * 2. &error_fatal
> + *    Any error will result in exit() with a non-zero status.
> + * 3. NULL
> + *    No error reporting through errp parameter.
> + * 4. The address of a NULL-initialized Error *err
> + *    Any error will populate errp with an error object.
> + *
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
> + * to check success is by consulting errp; doing this safely requires th=
e use
> + * of the ERRP_AUTO_PROPAGATE macro, like this:
> + *
> + *     int our_func(..., Error **errp) {
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
> + *
> + * Note that any function that wants to modify an error object, such as =
by
> + * calling error_append_hint or error_prepend, must use ERRP_AUTO_PROPAG=
ATE, in
> + * order for a caller's use of &error_fatal to see the additional inform=
ation.
> + *
> + * In rare cases, we need to pass existing Error object to the caller by=
 hand:
> + *     error_propagate(errp, err);
> + *
> + * Pass an existing error to the caller with the message modified:
> + *     error_propagate_prepend(errp, err);
> + *
> + *
>   * Call a function ignoring errors:
>   *     foo(arg, NULL);
>   *
> @@ -78,26 +143,6 @@
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
> @@ -114,6 +159,61 @@
>   *         handle the error...
>   *     }
>   * because this may pass a non-null err to bar().
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
>   */
> =20
>  #ifndef ERROR_H
> @@ -322,6 +422,47 @@ void error_set_internal(Error **errp,
>                          ErrorClass err_class, const char *fmt, ...)
>      GCC_FMT_ATTR(6, 7);
> =20
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
>  /*
>   * Special error destination to abort on error.
>   * See error_setg() and error_propagate() for details.


