Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14536ABA87
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 10:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506855.780047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ7bm-0006A8-O7; Mon, 06 Mar 2023 09:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506855.780047; Mon, 06 Mar 2023 09:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ7bm-00067w-LS; Mon, 06 Mar 2023 09:58:18 +0000
Received: by outflank-mailman (input) for mailman id 506855;
 Mon, 06 Mar 2023 09:58:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyJo=66=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pZ7bk-00067m-IL
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 09:58:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6878010d-bc05-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 10:58:14 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-CJe-6B2XMuehfhRkcWvuEw-1; Mon, 06 Mar 2023 04:58:09 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC7643C0F180;
 Mon,  6 Mar 2023 09:58:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 748B42026D4B;
 Mon,  6 Mar 2023 09:58:03 +0000 (UTC)
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
X-Inumbo-ID: 6878010d-bc05-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678096693;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tODt+tZ1i+Zx/RZzFTW5f0IKFhRamX691WjUjGAq/Gc=;
	b=aqCsO1K3UgOSiEIUgozWGqzEDOdBewccKwKy7mo43xEwiUPSUSjBL0yasmderEO8DnQ7Ou
	CdKqP4WyeQxhVf2FBWqN/b/jXX05PtR3yJZfSu2544jqlB0uRi3sXvoX587Y+HlPESKK3J
	OfLZi7B30iNZgRJ+sEjtywrdNOYlR9g=
X-MC-Unique: CJe-6B2XMuehfhRkcWvuEw-1
Date: Mon, 6 Mar 2023 09:58:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Message-ID: <ZAW5KffNsA6/N87B@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com>
 <ZAWx5eBskd1cItDx@redhat.com>
 <e5a86d76-03af-6da9-a8ee-da4a494e0e23@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5a86d76-03af-6da9-a8ee-da4a494e0e23@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

On Mon, Mar 06, 2023 at 10:54:15AM +0100, Thomas Huth wrote:
> On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> > On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
> > > Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
> > > binary is a proper superset of the qemu-system-i386 binary. With the
> > > 32-bit host support being deprecated, it is now also possible to
> > > deprecate the qemu-system-i386 binary.
> > > 
> > > With regards to 32-bit KVM support in the x86 Linux kernel,
> > > the developers confirmed that they do not need a recent
> > > qemu-system-i386 binary here:
> > > 
> > >   https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
> > > 
> > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > > Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   docs/about/deprecated.rst | 14 ++++++++++++++
> > >   1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > index 1ca9dc33d6..c4fcc6b33c 100644
> > > --- a/docs/about/deprecated.rst
> > > +++ b/docs/about/deprecated.rst
> > > @@ -34,6 +34,20 @@ deprecating the build option and no longer defend it in CI. The
> > >   ``--enable-gcov`` build option remains for analysis test case
> > >   coverage.
> > > +``qemu-system-i386`` binary (since 8.0)
> > > +'''''''''''''''''''''''''''''''''''''''
> > > +
> > > +The ``qemu-system-i386`` binary was mainly useful for running with KVM
> > > +on 32-bit x86 hosts, but most Linux distributions already removed their
> > > +support for 32-bit x86 kernels, so hardly anybody still needs this. The
> > > +``qemu-system-x86_64`` binary is a proper superset and can be used to
> > > +run 32-bit guests by selecting a 32-bit CPU model, including KVM support
> > > +on x86_64 hosts. Thus users are recommended to reconfigure their systems
> > > +to use the ``qemu-system-x86_64`` binary instead. If a 32-bit CPU guest
> > > +environment should be enforced, you can switch off the "long mode" CPU
> > > +flag, e.g. with ``-cpu max,lm=off``.
> > 
> > I had the idea to check this today and this is not quite sufficient,
> > because we have code that changes the family/model/stepping for
> > 'max' which is target dependent:
> > 
> > #ifdef TARGET_X86_64
> >      object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
> >      object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
> >      object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
> > #else
> >      object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
> >      object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
> >      object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
> > #endif
> > 
> > The former is a 64-bit AMD model and the latter is a 32-bit model.
> > 
> > Seems LLVM was sensitive to this distinction to some extent:
> > 
> >     https://gitlab.com/qemu-project/qemu/-/issues/191
> > 
> > A further difference is that qemy-system-i686 does not appear to enable
> > the 'syscall' flag, but I've not figured out where that difference is
> > coming from in the code.
> 
> Ugh, ok. I gave it a quick try with a patch like this:
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4344,15 +4344,15 @@ static void max_x86_cpu_initfn(Object *obj)
>       */
>      object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
>                              &error_abort);
> -#ifdef TARGET_X86_64
> -    object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
> -    object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
> -    object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
> -#else
> -    object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
> -    object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
> -    object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
> -#endif
> +    if (object_property_get_bool(obj, "lm", &error_abort)) {
> +        object_property_set_int(obj, "family", 15, &error_abort);
> +        object_property_set_int(obj, "model", 107, &error_abort);
> +        object_property_set_int(obj, "stepping", 1, &error_abort);
> +    } else {
> +        object_property_set_int(obj, "family", 6, &error_abort);
> +        object_property_set_int(obj, "model", 6, &error_abort);
> +        object_property_set_int(obj, "stepping", 3, &error_abort);
> +    }
>      object_property_set_str(OBJECT(cpu), "model-id",
>                              "QEMU TCG CPU version " QEMU_HW_VERSION,
>                              &error_abort);
> 
> ... but it seems like the "lm" property is not initialized
> there yet, so this does not work... :-/
> 
> Giving that we have soft-freeze tomorrow, let's ignore this patch
> for now and revisit this topic during the 8.1 cycle. But I'll
> queue the other 4 patches to get some pressure out of our CI
> during the freeze time.

Yep, makes sense.

More generally the whole impl of the 'max' CPU feels somewhat
questionable even for qemu-system-i386. It exposes all features
that TCG supports. A large set of these features never existed
on *any* 32-bit silicon. Hands up who has seen 32-bit silicon
with AVX2 support ? From a correctness POV we should have
capped CPU features in some manner. Given the lack of interest
in 32-bit though, we've ignored the problem and it likely does
not affect apps anyway as they're not likely to be looking for
newish features.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


