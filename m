Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED67A4DB17F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 14:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291199.494093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUTjV-0000Da-8u; Wed, 16 Mar 2022 13:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291199.494093; Wed, 16 Mar 2022 13:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUTjV-0000BE-5D; Wed, 16 Mar 2022 13:30:33 +0000
Received: by outflank-mailman (input) for mailman id 291199;
 Wed, 16 Mar 2022 13:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5zDN=T3=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1nUTjT-0000B6-Oc
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 13:30:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eb97306-a52d-11ec-853b-5f4723681683;
 Wed, 16 Mar 2022 14:30:29 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-UC8-YLvZOc2NKSj3QhDYXg-1; Wed, 16 Mar 2022 09:30:11 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 447933802ACE;
 Wed, 16 Mar 2022 13:30:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51AA830B9D;
 Wed, 16 Mar 2022 13:29:23 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3eb97306-a52d-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647437428;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=TVu/CeOwg7TjRwgWWJUd3qigmb0rClTETSGukZB9kvE=;
	b=fED5cCUiCguwoFHGFb32sHckPXpg0kQcGdgipvfTsBaX8oVIh21DKIuC2RUXFS7C0LKDVn
	k9t3CLAw7ENN+X9lTLj7Gnl6p9WaCTH18uwZ9zQV+QKbLx8mu549YQXnqk6eytHt8LfV2p
	Pd5lCwwpDIo7e5dWW5PbHHZsaVcQtXI=
X-MC-Unique: UC8-YLvZOc2NKSj3QhDYXg-1
Date: Wed, 16 Mar 2022 13:29:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <huth@tuxfamily.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
	Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	"open list:blkverify" <qemu-block@nongnu.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
Message-ID: <YjHmLTI+geU4S9Wq@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 16, 2022 at 01:52:48PM +0400, marcandre.lureau@redhat.com wrote:
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 3baa5e3790f7..f2bd050e3b9a 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -79,19 +79,12 @@
>  #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) - \
>                                     sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
>  
> -#if defined(__clang__)
> -/* clang doesn't support gnu_printf, so use printf. */
> -# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> -#else
> -/* Use gnu_printf (qemu uses standard format strings). */
> -# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> -# if defined(_WIN32)
> +#if !defined(__clang__) && defined(_WIN32)
>  /*
>   * Map __printf__ to __gnu_printf__ because we want standard format strings even
>   * when MinGW or GLib include files use __printf__.
>   */
> -#  define __printf__ __gnu_printf__
> -# endif
> +# define __printf__ __gnu_printf__
>  #endif

I'm not convinced we shold have this remaining define, even
before your patch.

For code we've implemented, we should have used __gnu_printf__
already if we know it uses GNU format on Windows.

For code in GLib, its header file uses __gnu_printf__ for anything
that relies on its portable printf replacement, which is basically
everything in GLib.

For anything else we should honour whatever they declare, and not
assume their impl is the GNU one.


I guess it is easy enough to validate by deleting this and seeing
if we get any warnings from the mingw CI jobs about printf/gnu_printf
mismatch.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


