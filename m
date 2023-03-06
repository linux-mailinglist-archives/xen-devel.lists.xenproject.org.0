Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9FE6AC24E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 15:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506957.780177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZBU8-0007x9-D0; Mon, 06 Mar 2023 14:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506957.780177; Mon, 06 Mar 2023 14:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZBU8-0007uG-AC; Mon, 06 Mar 2023 14:06:40 +0000
Received: by outflank-mailman (input) for mailman id 506957;
 Mon, 06 Mar 2023 14:06:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyJo=66=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pZBU6-0007u8-OE
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 14:06:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ac225af-bc28-11ed-96b5-2f268f93b82a;
 Mon, 06 Mar 2023 15:06:36 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-l5ZckLzFOV6jvPPgyotFqw-1; Mon, 06 Mar 2023 09:06:33 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F118830D44;
 Mon,  6 Mar 2023 14:06:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C159C1602A;
 Mon,  6 Mar 2023 14:06:10 +0000 (UTC)
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
X-Inumbo-ID: 1ac225af-bc28-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678111595;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=voMt6AB+9qNIUfz/3mjHZ4ciEx34KDCiHB56iJwYfX4=;
	b=UtH/Yat60eW1qiWD/RrYxN7Ieal9/DmQxispGNoIFVCP3gEZs2z2Uf16c1SAfuE5fNysT7
	Nm6qirD4c9osWR/QGydl/GL/lPXJ37AKPU7N5jIJdTZ8BbF3EcmJ6rSOo//ulFnOpmO5HX
	GLoQYBu3HD6w1c9iT7CAQAuxUTEE95E=
X-MC-Unique: l5ZckLzFOV6jvPPgyotFqw-1
Date: Mon, 6 Mar 2023 14:06:08 +0000
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
Message-ID: <ZAXzUIs6wODe7/hf@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com>
 <ZAWx5eBskd1cItDx@redhat.com>
 <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

On Mon, Mar 06, 2023 at 02:48:16PM +0100, Thomas Huth wrote:
> On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> > On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
> > > [...] If a 32-bit CPU guest
> > > +environment should be enforced, you can switch off the "long mode" CPU
> > > +flag, e.g. with ``-cpu max,lm=off``.
> > 
> > I had the idea to check this today and this is not quite sufficient,
> [...]
> > A further difference is that qemy-system-i686 does not appear to enable
> > the 'syscall' flag, but I've not figured out where that difference is
> > coming from in the code.
> 
> I think I just spotted this by accident in target/i386/cpu.c
> around line 637:
> 
> #ifdef TARGET_X86_64
> #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
> #else
> #define TCG_EXT2_X86_64_FEATURES 0
> #endif

Hmm, so right now the difference between qemu-system-i386 and
qemu-system-x86_64 is based on compile time conditionals. So we
have the burden of building everything twice and also a burden
of testing everything twice.

If we eliminate qemu-system-i386 we get rid of our own burden,
but users/mgmt apps need to adapt to force qemu-system-x86_64
to present a 32-bit system.

What about if we had qemu-system-i386 be a hardlink to
qemu-system-x86_64, and then changed behaviour based off the
executed binary name ?

ie if running qemu-system-i386, we could present a 32-bit CPU by
default. We eliminate all of our double compilation burden still.
We still have extra testing burden, but it is in a fairly narrow
area, so does not imply x2 the testing burden just $small-percentage
extra testing ?  That would means apps/users would not need to change
at all, but we still get most of the win we're after on the
QEMU side 

Essentially #ifdef TARGET_X86_64  would be change  'if (is_64bit) {...}'
in a handful of places, with 'bool is_64bit' initialized in main() from
argv[0] ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


