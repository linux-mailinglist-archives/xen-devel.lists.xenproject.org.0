Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DB6215365
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 09:42:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsLlK-0005vk-Tu; Mon, 06 Jul 2020 07:42:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HS9e=AR=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jsLlI-0005vf-WC
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 07:42:01 +0000
X-Inumbo-ID: 2cdf0528-bf5c-11ea-8c46-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2cdf0528-bf5c-11ea-8c46-12813bfff9fa;
 Mon, 06 Jul 2020 07:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594021319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPclBdxcEAnChhlbJZsDBWI14QCfYuM438hdr/HHVjs=;
 b=EFQxPy/8bqPr7E/cr2Z60XZpz45djrLJUP+I00+3b6lFmNAOtFgT3QrKrdKPPohK6USSCg
 RZL0A8vJFH6yJciKh3AHYH0Ixwrdv7qAKGJhPfTfiA5XOyb2yhTPVhcJoeBgwXtguXgSqa
 HuNAtZ8fgntyCvE58fxabmEgJCMl+cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-GXwXvf9pPU6o06QHFW7HIA-1; Mon, 06 Jul 2020 03:41:56 -0400
X-MC-Unique: GXwXvf9pPU6o06QHFW7HIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6529A801E6A;
 Mon,  6 Jul 2020 07:41:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 369D110013C2;
 Mon,  6 Jul 2020 07:41:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9139B1138648; Mon,  6 Jul 2020 09:41:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v11 8/8] xen: introduce ERRP_AUTO_PROPAGATE
References: <20200703090816.3295-1-vsementsov@virtuozzo.com>
 <20200703090816.3295-9-vsementsov@virtuozzo.com>
 <e2b4f10a-162c-ebb8-3232-381c4d820f9f@redhat.com>
Date: Mon, 06 Jul 2020 09:41:49 +0200
In-Reply-To: <e2b4f10a-162c-ebb8-3232-381c4d820f9f@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sat, 4 Jul 2020 18:36:07
 +0200")
Message-ID: <878sfxgkea.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org, groug@kaod.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 7/3/20 11:08 AM, Vladimir Sementsov-Ogievskiy wrote:
>> If we want to add some info to errp (by error_prepend() or
>> error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
>> Otherwise, this info will not be added when errp =3D=3D &error_fatal
>> (the program will exit prior to the error_append_hint() or
>> error_prepend() call).  Fix such cases.
>>=20
>> If we want to check error after errp-function call, we need to
>> introduce local_err and then propagate it to errp. Instead, use
>> ERRP_AUTO_PROPAGATE macro, benefits are:
>> 1. No need of explicit error_propagate call
>> 2. No need of explicit local_err variable: use errp directly
>> 3. ERRP_AUTO_PROPAGATE leaves errp as is if it's not NULL or
>>    &error_fatal, this means that we don't break error_abort
>>    (we'll abort on error_set, not on error_propagate)
>>=20
>> This commit is generated by command
>>=20
>>     sed -n '/^X86 Xen CPUs$/,/^$/{s/^F: //p}' MAINTAINERS | \
>>     xargs git ls-files | grep '\.[hc]$' | \
>>     xargs spatch \
>>         --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>>         --macro-file scripts/cocci-macro-file.h \
>>         --in-place --no-show-diff --max-width 80
>>=20
>> Reported-by: Kevin Wolf <kwolf@redhat.com>
>> Reported-by: Greg Kurz <groug@kaod.org>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>  hw/block/dataplane/xen-block.c |  17 +++---
>>  hw/block/xen-block.c           | 102 ++++++++++++++-------------------
>>  hw/pci-host/xen_igd_pt.c       |   7 +--
>>  hw/xen/xen-backend.c           |   7 +--
>>  hw/xen/xen-bus.c               |  92 +++++++++++++----------------
>>  hw/xen/xen-host-pci-device.c   |  27 +++++----
>>  hw/xen/xen_pt.c                |  25 ++++----
>>  hw/xen/xen_pt_config_init.c    |  17 +++---
>>  8 files changed, 128 insertions(+), 166 deletions(-)
>
> Without the description, this patch has 800 lines of diff...
> It killed me, I don't have the energy to review patch #7 of this
> series after that, sorry.
> Consider splitting such mechanical patches next time. Here it
> could have been hw/block, hw/pci-host, hw/xen.

Probably my fault; I asked for less fine-grained splitting.

Finding a split of a tree-wide transformation that pleases everyone is
basically impossible.

The conversion to ERRP_AUTO_PROPAGATE() could be one patch per function,
but that would be excessive.

Vladimir chose to split along maintenance boundaries, so he can cc: the
right people on the right code.  I agree with the idea.  The difficulty
is which boundaries.  Our code is not partitioned into maintenance
domains.  Instead, we have overlapping sets.  Makes sense, because it
mirrors how we actually maintain it.

Because of that, a blind split guided by MAINTAINERS won't work well.  A
split that makes sense needs a bit of human judgement, too.

This part makes perfect sense to me from the cc: point of view: it's
Xen, the whole of Xen, and nothing but Xen.

I acknowledge that its size made it exhausting for you to review.  I
didn't expect that, probably because after having spent hours on
reviewing and improving the macro and the Coccinelle script, I know
exactly what to look for, and also consider the script trustworthy[*].

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thank you, much appreciated!


[*] I've learned not to trust Coccinelle 100%, ever.


