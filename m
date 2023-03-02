Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB46A8845
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 19:07:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505353.778082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXnKy-0006nY-IS; Thu, 02 Mar 2023 18:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505353.778082; Thu, 02 Mar 2023 18:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXnKy-0006kl-FF; Thu, 02 Mar 2023 18:07:28 +0000
Received: by outflank-mailman (input) for mailman id 505353;
 Thu, 02 Mar 2023 18:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuJ3=62=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pXnKx-0006kf-FW
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 18:07:27 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1599fa45-b925-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 19:07:25 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-HQifpbvcNp2xRQ326_T1bQ-1; Thu, 02 Mar 2023 13:07:20 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B25C38012D5;
 Thu,  2 Mar 2023 18:07:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60A0E440DF;
 Thu,  2 Mar 2023 18:07:15 +0000 (UTC)
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
X-Inumbo-ID: 1599fa45-b925-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677780444;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIFIu9FzFlmMJ7rjilkD4RNn39gojKgiNaI+RvmuVps=;
	b=FLLCE6PKLnnRwR03rUMpxuGCl3sfMfxR4aXlUng7tKjiIvcIYVGsB2OorKHk+2ZdGwZVxN
	lbjhjInti/HpFWEIq8XcTL+HkWApqZeNvkoB0JBXuljFlJnbr/mtcJ9ZpyBhoMrNuQse6l
	9SNrP0fXvGhsmeardWfd8W4zxBZt6W8=
X-MC-Unique: HQifpbvcNp2xRQ326_T1bQ-1
Date: Thu, 2 Mar 2023 18:07:09 +0000
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
Subject: Re: [PATCH v2 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Message-ID: <ZADlzSMBnjUgyyu0@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-4-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-4-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

On Thu, Mar 02, 2023 at 05:31:03PM +0100, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 environments for running QEMU,
> so let's stop wasting our scarce CI minutes with these jobs.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 16 ----------------
>  1 file changed, 16 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

There's still the mingw 32-bit x86 build, but probably wolrth
keeping that until we actually stop 32-bit from a technical
POV, because Stefan still publishes the 32-bit windows
installers currently

Similarly  the dockerfile can stay in case someone wants to
reproduce a flaw locally

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 101416080c..3ce51adf77 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -43,22 +43,6 @@ cross-arm64-user:
>    variables:
>      IMAGE: debian-arm64-cross
>  
> -cross-i386-system:
> -  extends: .cross_system_build_job
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check-qtest
> -
> -cross-i386-user:
> -  extends: .cross_user_build_job
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check
> -
>  cross-i386-tci:
>    extends: .cross_accel_build_job
>    timeout: 60m
> -- 
> 2.31.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


