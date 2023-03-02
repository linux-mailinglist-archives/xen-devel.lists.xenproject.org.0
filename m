Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41076A883E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 19:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505346.778072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXnJe-0006AM-89; Thu, 02 Mar 2023 18:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505346.778072; Thu, 02 Mar 2023 18:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXnJe-00068I-51; Thu, 02 Mar 2023 18:06:06 +0000
Received: by outflank-mailman (input) for mailman id 505346;
 Thu, 02 Mar 2023 18:06:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuJ3=62=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pXnJc-000686-Kg
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 18:06:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e20b0d5c-b924-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 19:05:59 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-cgKAbBlxMrmaZJ1R6OIDbw-1; Thu, 02 Mar 2023 13:05:54 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7D1F3C10C70;
 Thu,  2 Mar 2023 18:05:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DD6C2026D4B;
 Thu,  2 Mar 2023 18:05:51 +0000 (UTC)
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
X-Inumbo-ID: e20b0d5c-b924-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677780357;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uq28CY84X2a6rgRGcIFR8HUgJVL3s2wDxCarfoJ7rwk=;
	b=TRzWdhgVeEB97PJf5rHoKQDwn0Sfnd/oAno9/jk+GMwnyVIlgW8TnjZ4fSuuoWbBje2wnB
	fBKvhfh637oPsX8QdyjKG2W+gwSiDh9rx9Fzlw5oXstvo7TkbbBFBJW3m7K5Ln+6LHh4j1
	JqSjoH6piLYkSljPwfmiUG4fW9XSYa0=
X-MC-Unique: cgKAbBlxMrmaZJ1R6OIDbw-1
Date: Thu, 2 Mar 2023 18:05:48 +0000
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
Subject: Re: [PATCH v2 2/6] docs/about/deprecated: Deprecate 32-bit x86 hosts
Message-ID: <ZADlfILU11Akp5MT@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-3-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

On Thu, Mar 02, 2023 at 05:31:02PM +0100, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 hosts today, so we should start
> deprecating them to stop wasting our time and CI minutes here.
> For example, there are also still some unresolved problems with these:
> When emulating 64-bit binaries in user mode, TCG does not honor atomicity
> for 64-bit accesses, which is "perhaps worse than not working at all"
> (quoting Richard). Let's simply make it clear that people should use
> 64-bit x86 hosts nowadays and we do not intend to fix/maintain the old
> 32-bit stuff.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 11700adac9..a30aa8dfdf 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -208,6 +208,18 @@ CI coverage support may bitrot away before the deprecation process
>  completes. The little endian variants of MIPS (both 32 and 64 bit) are
>  still a supported host architecture.
>  
> +32-bit x86 hosts (since 8.0)
> +''''''''''''''''''''''''''''
> +
> +Support for 32-bit x86 host deployments is increasingly uncommon in
> +mainstream OS distributions given the widespread availability of 64-bit
> +x86 hardware. The QEMU project no longer considers 32-bit x86 support
> +to be an effective use of its limited resources, and thus intends to
> +discontinue it. Since all recent x86 hardware from the past >10 years
> +is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
> +should be used instead.
> +
> +
>  QEMU API (QAPI) events
>  ----------------------
>  
> -- 
> 2.31.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


