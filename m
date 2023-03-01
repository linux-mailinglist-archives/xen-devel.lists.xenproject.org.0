Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F24D6A683F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 08:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503856.776221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXGzs-00073i-0M; Wed, 01 Mar 2023 07:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503856.776221; Wed, 01 Mar 2023 07:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXGzr-00071h-Tp; Wed, 01 Mar 2023 07:35:31 +0000
Received: by outflank-mailman (input) for mailman id 503856;
 Wed, 01 Mar 2023 07:35:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p0wY=6Z=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1pXGzr-00071b-6o
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 07:35:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2b3498d-b803-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 08:35:28 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-RI74EMrUNE2QrJP1w4yKng-1; Wed, 01 Mar 2023 02:35:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33D0918E0925;
 Wed,  1 Mar 2023 07:35:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0751C400D796;
 Wed,  1 Mar 2023 07:35:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DC27621E6A1F; Wed,  1 Mar 2023 08:35:20 +0100 (CET)
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
X-Inumbo-ID: a2b3498d-b803-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677656127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HYF4RCZ3NLX6x5O6feGJIHu2VDXXKtj8N3eWJ+tbjLE=;
	b=J+px7h75QIsx6ckY0tkJjstTBxlbMT9lFFLwIPAeFDiximudlU99MsuHZ5Ke011E+vdKdf
	Qs02i4UpbFdVzbNKWUT6DZbrSnDfZXcdrDnezLQyOGpEhp8QrwcdfIjnrf+HiLSoLQaVK7
	6l8khwLEPjY8GkkEOww/kXhxRbdEnrk=
X-MC-Unique: RI74EMrUNE2QrJP1w4yKng-1
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  qemu-devel@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  qemu-arm@nongnu.org,
  Maxim Levitsky
 <mlevitsk@redhat.com>,  libvir-list@redhat.com,  Richard Henderson
 <richard.henderson@linaro.org>,  xen-devel@lists.xenproject.org,  Reinoud
 Zandijk <reinoud@netbsd.org>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
References: <20230227111050.54083-1-thuth@redhat.com>
	<Y/z4rwv09Ckhbtfp@redhat.com>
	<001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
	<Y/3C+jC3Lk5MJxfu@redhat.com>
	<99a83e65-273a-ea1b-e7d9-bbdd8ca32145@redhat.com>
	<20230228162938-mutt-send-email-mst@kernel.org>
Date: Wed, 01 Mar 2023 08:35:20 +0100
In-Reply-To: <20230228162938-mutt-send-email-mst@kernel.org> (Michael
	S. Tsirkin's message of "Tue, 28 Feb 2023 16:32:43 -0500")
Message-ID: <87lekg53gn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Feb 28, 2023 at 09:05:16PM +0100, Thomas Huth wrote:
>> Well, without CI, I assume that the code will bitrot quite fast (considering
>> that there are continuous improvements to TCG, for example).
>
> We have lots of hosts which we don't test with CI.  They don't bitrot
> because people do testing before release. This is what RCs are for.
> We did releases before CI - it is a cost/benefit thing.

Dropping 32-bit x86 from CI feels like a no-brainer in the current
situation.

As to deprecating 32-bit x86: the people by far most qualified to judge
the "cost/benefit thing" are the regulars who are bearing the cost,
i.e. the people who are actually maintaining it.  Their opinion should
overrule any "but somebody out there might still want to use it".

Maintainers, please state your opinion, if any: aye or nay.

Richard tells us "the maint overhead is large."  Makes me think he's in
favour of dropping 32-bit x86.  Richard?

Peter seems to be reluctant to drop 32-bit ARM at this point.  Peter?


