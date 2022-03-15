Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05794D9CBE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 14:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290800.493292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU7i1-0005lB-CD; Tue, 15 Mar 2022 13:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290800.493292; Tue, 15 Mar 2022 13:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU7i1-0005j0-8i; Tue, 15 Mar 2022 13:59:33 +0000
Received: by outflank-mailman (input) for mailman id 290800;
 Tue, 15 Mar 2022 13:59:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1u5x=T2=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1nU7hz-0005is-LC
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 13:59:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 220ca81e-a468-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 14:59:30 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-Upv_Mb-OOSWIHvms5WArsw-1; Tue, 15 Mar 2022 09:59:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E16CB3C18527;
 Tue, 15 Mar 2022 13:59:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6292CC50943;
 Tue, 15 Mar 2022 13:59:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1623721E6821; Tue, 15 Mar 2022 14:59:24 +0100 (CET)
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
X-Inumbo-ID: 220ca81e-a468-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647352769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10cE4rX5AbTqcs0aOxAVWmDdYLmGBY4pMBpqNlvJA4U=;
	b=Mz6d7MRvE+R6RdUDAME0LXcTPbKdLy8CO6kCklO/epM2H43jw1K6plw07N/cMK8t4c5KMl
	41IW08UUnOjb560qxCiqnyby20BkINaiScDdZPWoT6nFzAsgijhHOR0hoZR0YQDeNou4KJ
	tYOD0BNVi5exL8VcFakI8BFYjSu+f2A=
X-MC-Unique: Upv_Mb-OOSWIHvms5WArsw-1
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Christian Schoenebeck <qemu_oss@crudebyte.com>,
  "Gonglei (Arei)" <arei.gonglei@huawei.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
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
	<87y21c401e.fsf@linaro.org>
Date: Tue, 15 Mar 2022 14:59:24 +0100
In-Reply-To: <87y21c401e.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Mon, 14
	Mar 2022 22:52:52 +0000")
Message-ID: <875yofl3k3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>> for two reasons.  One, it catches multiplication overflowing size_t.
>> Two, it returns T * rather than void *, which lets the compiler catch
>> more type errors.
>>
> <snip>
>> diff --git a/semihosting/config.c b/semihosting/config.c
>> index 137171b717..6d48ec9566 100644
>> --- a/semihosting/config.c
>> +++ b/semihosting/config.c
>> @@ -98,7 +98,7 @@ static int add_semihosting_arg(void *opaque,
>>      if (strcmp(name, "arg") =3D=3D 0) {
>>          s->argc++;
>>          /* one extra element as g_strjoinv() expects NULL-terminated ar=
ray */
>> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
>> +        s->argv =3D g_renew(void *, s->argv, s->argc + 1);
>
> This did indeed break CI because s->argv is an array of *char:
>
> ../semihosting/config.c:101:17: error: assignment to =E2=80=98const char =
**=E2=80=99 from incompatible pointer type =E2=80=98void **=E2=80=99 [-Werr=
or=3Dincompatible-pointer-types]
>   101 |         s->argv =3D g_renew(void *, s->argv, s->argc + 1);
>       |                 ^
> cc1: all warnings being treated as errors
>
> So it did the job of type checking but failed to build ;-)

You found a hole in my compile testing, thanks!

I got confused about the configuration of my build trees.  Catching such
mistakes is what CI is for :)


