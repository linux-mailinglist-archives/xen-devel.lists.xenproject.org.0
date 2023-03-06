Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F9C6AB9D0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 10:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506831.780028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ77j-0001gD-0i; Mon, 06 Mar 2023 09:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506831.780028; Mon, 06 Mar 2023 09:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ77i-0001e0-Ts; Mon, 06 Mar 2023 09:27:14 +0000
Received: by outflank-mailman (input) for mailman id 506831;
 Mon, 06 Mar 2023 09:27:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyJo=66=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pZ77i-0001du-2d
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 09:27:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12772c21-bc01-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 10:27:11 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-tuDuK4RnONuyfVEmCP4RgA-1; Mon, 06 Mar 2023 04:27:07 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFFE1811E6E;
 Mon,  6 Mar 2023 09:27:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79A0140CF8F0;
 Mon,  6 Mar 2023 09:27:03 +0000 (UTC)
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
X-Inumbo-ID: 12772c21-bc01-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678094830;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVCxoISPsMUUVKX9jBhQfLyhrTTxfK/FPc4RIMTqVfU=;
	b=VFUr4viTTY1MKxnUvosvWDJVgfykQ0yWrgMTmTREHEDpiTUrbl313MY4MG4iV0jSleSo7k
	rWT9qf6rmHd4rxrm378XP8vEzDu1AkJcCvtzsgFlMX28E3KLrkJJNoEV/5mXv0CqnnWe8B
	vD7bC1ZHBGObOKO/tyWWXZRDQjC8Zvk=
X-MC-Unique: tuDuK4RnONuyfVEmCP4RgA-1
Date: Mon, 6 Mar 2023 09:27:01 +0000
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
Message-ID: <ZAWx5eBskd1cItDx@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306084658.29709-3-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
> Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
> binary is a proper superset of the qemu-system-i386 binary. With the
> 32-bit host support being deprecated, it is now also possible to
> deprecate the qemu-system-i386 binary.
> 
> With regards to 32-bit KVM support in the x86 Linux kernel,
> the developers confirmed that they do not need a recent
> qemu-system-i386 binary here:
> 
>  https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 1ca9dc33d6..c4fcc6b33c 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -34,6 +34,20 @@ deprecating the build option and no longer defend it in CI. The
>  ``--enable-gcov`` build option remains for analysis test case
>  coverage.
>  
> +``qemu-system-i386`` binary (since 8.0)
> +'''''''''''''''''''''''''''''''''''''''
> +
> +The ``qemu-system-i386`` binary was mainly useful for running with KVM
> +on 32-bit x86 hosts, but most Linux distributions already removed their
> +support for 32-bit x86 kernels, so hardly anybody still needs this. The
> +``qemu-system-x86_64`` binary is a proper superset and can be used to
> +run 32-bit guests by selecting a 32-bit CPU model, including KVM support
> +on x86_64 hosts. Thus users are recommended to reconfigure their systems
> +to use the ``qemu-system-x86_64`` binary instead. If a 32-bit CPU guest
> +environment should be enforced, you can switch off the "long mode" CPU
> +flag, e.g. with ``-cpu max,lm=off``.

I had the idea to check this today and this is not quite sufficient,
because we have code that changes the family/model/stepping for
'max' which is target dependent:

#ifdef TARGET_X86_64
    object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
    object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
    object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
#else
    object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
    object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
    object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
#endif

The former is a 64-bit AMD model and the latter is a 32-bit model.

Seems LLVM was sensitive to this distinction to some extent:

   https://gitlab.com/qemu-project/qemu/-/issues/191


A further difference is that qemy-system-i686 does not appear to enable
the 'syscall' flag, but I've not figured out where that difference is
coming from in the code.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


