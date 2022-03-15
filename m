Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42834D9DFC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 15:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290861.493438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU8Ot-0001FV-LY; Tue, 15 Mar 2022 14:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290861.493438; Tue, 15 Mar 2022 14:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU8Ot-0001Di-IS; Tue, 15 Mar 2022 14:43:51 +0000
Received: by outflank-mailman (input) for mailman id 290861;
 Tue, 15 Mar 2022 14:43:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1u5x=T2=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1nU8Os-0001DW-AR
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 14:43:50 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52cc8dea-a46e-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 15:43:49 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-6t54DpkdO-mMtdvZzz0Pxg-1; Tue, 15 Mar 2022 10:43:45 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DFC6811E76;
 Tue, 15 Mar 2022 14:43:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A695555C90;
 Tue, 15 Mar 2022 14:43:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 417E921E66D4; Tue, 15 Mar 2022 15:43:41 +0100 (CET)
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
X-Inumbo-ID: 52cc8dea-a46e-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647355428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3Y1eIuJE5MHxgIwEc5Fk8JyYg2+dU4dKOkAeXX524I=;
	b=S548N/LDeQqTJ6yJISHbwJWzNRUEks7RQqM0SHpT+623Z7e4o6j0MHT/qzub1X/hvSR/pT
	wPv89Gf5vhQyCGtMb7n5TT1x8WxVNOeZMVKESOTX+vCl3hovuAHQxLxv30amuRbJM+Ks1E
	nOIFSMEj/0fVtU5YTY5B8nsJmZevnt8=
X-MC-Unique: 6t54DpkdO-mMtdvZzz0Pxg-1
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
  qemu-devel@nongnu.org,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Gerd Hoffmann <kraxel@redhat.com>,
  Christian Schoenebeck <qemu_oss@crudebyte.com>,  "Gonglei (Arei)"
 <arei.gonglei@huawei.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Igor Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,
  Laurent Vivier <lvivier@redhat.com>,  Amit Shah <amit@kernel.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Anthony Perard <anthony.perard@citrix.com>,
  Paul Durrant <paul@xen.org>,  =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>,
  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Corey Minyard
 <cminyard@mvista.com>,  Patrick Venture <venture@google.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Peter Xu <peterx@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  Daniel Henrique
 Barboza <danielhb413@gmail.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Jean-Christophe Dubois
 <jcd@tribudubois.net>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Yuval Shaia <yuval.shaia.ml@gmail.com>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Magnus Damm <magnus.damm@gmail.com>,
  Fabien Chouteau <chouteau@adacore.com>,  KONRAD Frederic
 <frederic.konrad@adacore.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Artyom Tarasenko <atar4qemu@gmail.com>,
  Alex Williamson <alex.williamson@redhat.com>,  Eric Auger
 <eric.auger@redhat.com>,  Max Filippov <jcmvbkbc@gmail.com>,  Juan
 Quintela <quintela@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  David Hildenbrand
 <david@redhat.com>,  Wenchao Wang <wenchao.wang@intel.com>,  Colin Xu
 <colin.xu@intel.com>,  Kamil Rytarowski <kamil@netbsd.org>,  Reinoud
 Zandijk <reinoud@netbsd.org>,  Sunil Muthuswamy <sunilmut@microsoft.com>,
  Cornelia Huck <cohuck@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Eric
 Blake <eblake@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>,  John Snow <jsnow@redhat.com>,
  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  xen-devel@lists.xenproject.org,  qemu-ppc@nongnu.org,
  qemu-block@nongnu.org,  haxm-team@intel.com,  qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
References: <20220314160108.1440470-1-armbru@redhat.com>
	<20220314160108.1440470-4-armbru@redhat.com>
	<87y21c401e.fsf@linaro.org> <875yofl3k3.fsf@pond.sub.org>
	<02307072-4bff-dbbb-67fb-ca9800c34b3c@gmail.com>
Date: Tue, 15 Mar 2022 15:43:41 +0100
In-Reply-To: <02307072-4bff-dbbb-67fb-ca9800c34b3c@gmail.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 15 Mar 2022 15:07:36
 +0100")
Message-ID: <875yofjmxu.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:

> On 15/3/22 14:59, Markus Armbruster wrote:
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>>> Markus Armbruster <armbru@redhat.com> writes:
>>>
>>>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>>>> for two reasons.  One, it catches multiplication overflowing size_t.
>>>> Two, it returns T * rather than void *, which lets the compiler catch
>>>> more type errors.
>>>>
>>> <snip>
>>>> diff --git a/semihosting/config.c b/semihosting/config.c
>>>> index 137171b717..6d48ec9566 100644
>>>> --- a/semihosting/config.c
>>>> +++ b/semihosting/config.c
>>>> @@ -98,7 +98,7 @@ static int add_semihosting_arg(void *opaque,
>>>>       if (strcmp(name, "arg") =3D=3D 0) {
>>>>           s->argc++;
>>>>           /* one extra element as g_strjoinv() expects NULL-terminated=
 array */
>>>> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void *)=
);
>>>> +        s->argv =3D g_renew(void *, s->argv, s->argc + 1);
>>>
>>> This did indeed break CI because s->argv is an array of *char:
>>>
>>> ../semihosting/config.c:101:17: error: assignment to =E2=80=98const cha=
r **=E2=80=99 from incompatible pointer type =E2=80=98void **=E2=80=99 [-We=
rror=3Dincompatible-pointer-types]
>>>    101 |         s->argv =3D g_renew(void *, s->argv, s->argc + 1);
>>>        |                 ^
>>> cc1: all warnings being treated as errors
>>>
>>> So it did the job of type checking but failed to build ;-)
>>
>> You found a hole in my compile testing, thanks!
>>
>> I got confused about the configuration of my build trees.  Catching such
>> mistakes is what CI is for :)
>
> FYI Alex fixed this here:
> https://lore.kernel.org/qemu-devel/20220315121251.2280317-8-alex.bennee@l=
inaro.org/
>
> So your series could go on top (modulo the Coverity change).

I dropped this hunk in v2.

Whether my v2 or Alex's series goes in first doesn't matter.


