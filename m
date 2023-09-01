Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C7378FF77
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 16:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594633.928008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc5TU-00047z-MB; Fri, 01 Sep 2023 14:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594633.928008; Fri, 01 Sep 2023 14:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc5TU-00044j-JU; Fri, 01 Sep 2023 14:50:16 +0000
Received: by outflank-mailman (input) for mailman id 594633;
 Fri, 01 Sep 2023 14:50:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=odZU=ER=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qc5TT-00043K-3s
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 14:50:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da182dbe-48d6-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 16:50:12 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-esBF9IBpOe2aBcfYjXur5w-1; Fri, 01 Sep 2023 10:50:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F4641817905;
 Fri,  1 Sep 2023 14:50:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B9AE1460FE5;
 Fri,  1 Sep 2023 14:50:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3048A21E692A; Fri,  1 Sep 2023 16:50:02 +0200 (CEST)
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
X-Inumbo-ID: da182dbe-48d6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693579811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=paHLoHNKtg8UFBFt/WB+m2kHfbeuo7pAuQSEBP1sizg=;
	b=DJw4aklPsF2T5r1TEn1BGC9QVRLkFltxtmG+aUP5JLo1TR70ygctMwyoSoeL3Q4KpjV46z
	ZKexSWmDTds/AmMIdVQW4O1jMv6nBS5wvavC8juKTv5sLV+PPFoF+tLYYUSuqFV2SY9WNQ
	YbEdG2LqsD8uoAE+6cSxUY89FSziSts=
X-MC-Unique: esBF9IBpOe2aBcfYjXur5w-1
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Eric Blake <eblake@redhat.com>,  qemu-devel@nongnu.org,
  kwolf@redhat.com,  hreitz@redhat.com,  vsementsov@yandex-team.ru,
  jsnow@redhat.com,  idryomov@gmail.com,  pl@kamp.de,  sw@weilnetz.de,
  sstabellini@kernel.org,  anthony.perard@citrix.com,  paul@xen.org,
  pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
  thuth@redhat.com,  philmd@linaro.org,  stefanha@redhat.com,
  fam@euphon.net,  quintela@redhat.com,  peterx@redhat.com,
  leobras@redhat.com,  kraxel@redhat.com,  qemu-block@nongnu.org,
  xen-devel@lists.xenproject.org,  alex.bennee@linaro.org,
  peter.maydell@linaro.org
Subject: Re: [PATCH 7/7] qobject atomics osdep: Make a few macros more hygienic
References: <20230831132546.3525721-1-armbru@redhat.com>
	<20230831132546.3525721-8-armbru@redhat.com>
	<vfkfi6uld3gbd4urmqdlzkv6djtws6mkbluc5qvwcla6btszhu@ff66zfyd7smm>
	<7b8a4589-7f29-e564-4904-9b1a4fd342af@kaod.org>
Date: Fri, 01 Sep 2023 16:50:02 +0200
In-Reply-To: <7b8a4589-7f29-e564-4904-9b1a4fd342af@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
	Goater"'s message of "Fri, 1 Sep 2023 14:59:22 +0200")
Message-ID: <87ttsevtgl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 8/31/23 16:30, Eric Blake wrote:
>> On Thu, Aug 31, 2023 at 03:25:46PM +0200, Markus Armbruster wrote:
>> [This paragraph written last: Bear with my stream of consciousness
>> review below, where I end up duplicating some of the conslusions you
>> reached before the point where I saw where the patch was headed]
>>=20
>>> Variables declared in macros can shadow other variables.  Much of the
>>> time, this is harmless, e.g.:
>>>
>>>      #define _FDT(exp)                                                 =
 \
>>>          do {                                                          =
 \
>>>              int ret =3D (exp);                                        =
   \
>>>              if (ret < 0) {                                            =
 \
>>>                  error_report("error creating device tree: %s: %s",   \
>>>                          #exp, fdt_strerror(ret));                     =
 \
>>>                  exit(1);                                              =
 \
>>>              }                                                         =
 \
>>>          } while (0)
>> Which is why I've seen some projects require a strict namespace
>> separation: if all macro parameters and any identifiers declared in
>> macros use either a leading or a trailing _ (I prefer a trailing one,
>> to avoid risking conflicts with libc reserved namespace; but leading
>> is usually okay), and all other identifiers avoid that namespace, then
>> you will never have shadowing by calling a macro from normal code.
>
> I started fixing the _FDT() macro since it is quite noisy at compile.
> Same for qemu_fdt_setprop_cells(). So are we ok with names like 'ret_'
> and 'i_' ? I used a 'local_' prefix for now but I can change.

I believe identifiers with a '_' suffix are just fine in macros.  We
have quite a few of them already.

> I also have a bunch of fixes for ppc.

Appreciated!


