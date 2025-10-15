Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CABBDCA43
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 07:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143109.1476892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8uPK-0001we-J7; Wed, 15 Oct 2025 05:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143109.1476892; Wed, 15 Oct 2025 05:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8uPK-0001uC-D0; Wed, 15 Oct 2025 05:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1143109;
 Wed, 15 Oct 2025 05:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A2LK=4Y=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1v8uPJ-0001u6-LU
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 05:50:41 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0aacc9c-a98a-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 07:50:39 +0200 (CEST)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-pdZXh2k1OHqTGUKYh4e8Kg-1; Wed,
 15 Oct 2025 01:50:35 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2F4A118001D1; Wed, 15 Oct 2025 05:50:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.19])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4D9F019560AD; Wed, 15 Oct 2025 05:50:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D03E721E6A27; Wed, 15 Oct 2025 07:50:29 +0200 (CEST)
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
X-Inumbo-ID: e0aacc9c-a98a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760507438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=doYfQ04zxKVDefG+tjuoJ5edIX9ZvZ5HtUkiz/HfXAs=;
	b=gFHYjD3ItJLRBPOPOaNqDbh9eDmxgMtE+o97DyNsBbJup8y5D68cL4V75rpIJvEiOto/p0
	aJn7lpOn62dgy/StzEChB4RjAjtA74QxOzv0wociQ1gOXNmO3sBkUzOe4KsJHTv1vhaydY
	LUpA3dvA+eQV1BK9N92gfIpdaejS37o=
X-MC-Unique: pdZXh2k1OHqTGUKYh4e8Kg-1
X-Mimecast-MFC-AGG-ID: pdZXh2k1OHqTGUKYh4e8Kg_1760507433
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,
  sstabellini@kernel.org,  anthony@xenproject.org,  paul@xen.org,
  edgar.iglesias@gmail.com,  xen-devel@lists.xenproject.org,
  qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
In-Reply-To: <2cad2907-5a93-4630-856f-7237063eb3ce@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 14 Oct 2025 17:19:31
 +0200")
References: <20250729111226.3627499-1-armbru@redhat.com>
	<CAFEAcA-UrCD7mrmX_4dCK0urMmY5+qs=Y268WerQVq1c+7nB=Q@mail.gmail.com>
	<CAFEAcA-01WR=jgdiCY57P_88ez-mRw07ShU0eWyzLPB+WbT_xg@mail.gmail.com>
	<2cad2907-5a93-4630-856f-7237063eb3ce@linaro.org>
Date: Wed, 15 Oct 2025 07:50:29 +0200
Message-ID: <87y0pck922.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 14/10/25 14:59, Peter Maydell wrote:
>> On Tue, 14 Oct 2025 at 09:36, Peter Maydell <peter.maydell@linaro.org> w=
rote:
>>>
>>> On Tue, 29 Jul 2025 at 12:14, Markus Armbruster <armbru@redhat.com> wro=
te:
>>>>
>>>> xenfb_mouse_event() has a switch statement whose controlling
>>>> expression move->axis is an enum InputAxis.  The enum values are
>>>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
>>>> case for both axes.  In addition, it has an unreachable default label.
>>>> This convinces Coverity that move->axis can be greater than 1.  It
>>>> duly reports a buffer overrun when it is used to subscript an array
>>>> with two elements.
>>>
>>> I think also that Coverity gets confused by QAPI's convention
>>> in generated code of defining enumerations like this:
>>>
>>> typedef enum InputAxis {
>>>      INPUT_AXIS_X,
>>>      INPUT_AXIS_Y,
>>>      INPUT_AXIS__MAX,
>>> } InputAxis;
>>>
>>> Coverity thinks that INPUT_AXIS__MAX might be a valid
>>> value it can see in move->axis, because we defined the
>>> enum that way.
>>>
>>> In theory I suppose that since the __MAX value is only
>>> there to be an array or enumeration bound

Correct.

>>>                                           that we could
>>> emit code that #defines it rather than making it part
>>> of the enum.

I'd love that, but it's harder than it has any right to be; see the
message Philippe referred to below.

>> Also, there's an argument that this function should
>> ignore unknown input-axis enum values. If we ever in future
>> extend this to support a Z-axis, it would be better to
>> ignore the events we can't send, the same way we already
>> do for unknown INPUT_EVENT_KIND_BTN button types, rather
>> than aborting.

No objection.

>>                But it's not very important, so the
>> g_assert_not_reached() will do.
>>=20
>> (In some other languages, we'd get a compile failure for
>> adding a new value to the enum that we didn't handle.
>> But not in C :-))
>
> See this thread where it was discussed (until I gave up...):
> https://lore.kernel.org/qemu-devel/873564spze.fsf@pond.sub.org/


