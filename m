Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621BB6A883D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 19:05:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505342.778062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXnJ0-0005iG-Vp; Thu, 02 Mar 2023 18:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505342.778062; Thu, 02 Mar 2023 18:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXnJ0-0005fg-SR; Thu, 02 Mar 2023 18:05:26 +0000
Received: by outflank-mailman (input) for mailman id 505342;
 Thu, 02 Mar 2023 18:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fuJ3=62=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pXnIz-0005fX-Il
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 18:05:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd59bc75-b924-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 19:05:24 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-AIj7fARBOjSNf1O77iVNPw-1; Thu, 02 Mar 2023 13:05:19 -0500
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5315802D2F;
 Thu,  2 Mar 2023 18:05:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C865492C14;
 Thu,  2 Mar 2023 18:05:16 +0000 (UTC)
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
X-Inumbo-ID: cd59bc75-b924-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677780322;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qk1L8nuZFv/j90fcvdYsTtDGs9Int4rt+yuUv0I7X5s=;
	b=ZnFsiuPJf59ZAcccLa3LCSgokfyCBYIyFkPon8gKrJbIQv9KNbIKYojBfb4QndWXQQlWk7
	swubj8E9CbxeCR0fuHmrdMo8t2Q8jNpul1ZC8IxMDI+C9Jv5Cdf8mT51fQSaC6/xli42+1
	QV0GdGcKFs1GCfFyYktHhgeSJg9mRmM=
X-MC-Unique: AIj7fARBOjSNf1O77iVNPw-1
Date: Thu, 2 Mar 2023 18:05:13 +0000
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
Subject: Re: [PATCH v2 1/6] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Message-ID: <ZADlWR/jmGsaPGh0@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-2-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-2-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

On Thu, Mar 02, 2023 at 05:31:01PM +0100, Thomas Huth wrote:
> Hardly anybody really requires the i386 binary anymore, since the
> qemu-system-x86_64 binary is a proper superset. So let's deprecate
> the 32-bit variant now, so that we can finally stop wasting our time
> and CI minutes with this.

The first sentence isn't quite true wrt to KVM. Change slightly to:

Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
binary is a proper superset of the qemu-system-i386 binary. With the
32-bit host support being deprecated, it is now also possible to
deprecate the qemu-system-i386 binary.

> With regards to 32-bit KVM support in the x86 Linux kernel,
> the developers confirmed that they do not need a recent
> qemu-system-i386 binary here:
> 
>  https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


