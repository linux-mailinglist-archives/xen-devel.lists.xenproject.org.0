Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386286A8850
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 19:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505364.778101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXnMs-0008DV-4E; Thu, 02 Mar 2023 18:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505364.778101; Thu, 02 Mar 2023 18:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXnMs-0008B9-1P; Thu, 02 Mar 2023 18:09:26 +0000
Received: by outflank-mailman (input) for mailman id 505364;
 Thu, 02 Mar 2023 18:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuJ3=62=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pXnMq-0008B1-D2
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 18:09:24 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b4fac31-b925-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 19:09:22 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-oGMHrVdGOk-q1eVLl11_hw-1; Thu, 02 Mar 2023 13:09:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FA1A877CAA;
 Thu,  2 Mar 2023 18:09:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7E02026D4B;
 Thu,  2 Mar 2023 18:09:11 +0000 (UTC)
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
X-Inumbo-ID: 5b4fac31-b925-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677780561;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiVBqMnf1rJ1eG3Qv6m/ZxXVASAu56FD87PLiyS+zOU=;
	b=VcVs+QPid+TmI03PzQUuoWF8LHMIRaLPFi+I0sPYAfPwf2MSaF61Q0iNj/9+JRfxP5e52n
	7w7ui9dx6k3Ak3f/fBHxU/osqNmRBcNdhFHWVxPJq2Q6bHCjN8qKJNRcq2rGViVdBTdhWW
	KHnMvIglVdTha2o5xznWl9+lLpXrpMM=
X-MC-Unique: oGMHrVdGOk-q1eVLl11_hw-1
Date: Thu, 2 Mar 2023 18:09:03 +0000
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
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 5/6] docs/about/deprecated: Deprecate 32-bit arm hosts
Message-ID: <ZADmPwStkmFltjo7@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-6-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-6-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

On Thu, Mar 02, 2023 at 05:31:05PM +0100, Thomas Huth wrote:
> For running QEMU in system emulation mode, the user needs a rather
> strong host system, i.e. not only an embedded low-frequency controller.
> All recent beefy arm host machines should support 64-bit now, it's
> unlikely that anybody is still seriously using QEMU on a 32-bit arm
> CPU, so we deprecate the 32-bit arm hosts here to finally save use
> some time and precious CI minutes.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 21ce70b5c9..c7113a7510 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -229,6 +229,15 @@ discontinue it. Since all recent x86 hardware from the past >10 years
>  is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
>  should be used instead.
>  
> +System emulation on 32-bit arm hosts (since 8.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Since QEMU needs a strong host machine for running full system emulation, and
> +all recent powerful arm hosts support 64-bit, the QEMU project deprecates the
> +support for running any system emulation on 32-bit arm hosts in general. Use
> +64-bit arm hosts for system emulation instead. (Note: "user" mode emulation
> +continuous to be supported on 32-bit arm hosts, too)

s/continuous/continues/

s/,too/, as well as command line tools like qemu-img, qemu-nbd, etc/

> +
>  
>  QEMU API (QAPI) events
>  ----------------------
> -- 
> 2.31.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


