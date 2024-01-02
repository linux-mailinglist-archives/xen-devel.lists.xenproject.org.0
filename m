Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B45821EC7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 16:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660733.1030297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKgmL-0006lC-VD; Tue, 02 Jan 2024 15:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660733.1030297; Tue, 02 Jan 2024 15:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKgmL-0006im-RZ; Tue, 02 Jan 2024 15:34:05 +0000
Received: by outflank-mailman (input) for mailman id 660733;
 Tue, 02 Jan 2024 15:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JX1x=IM=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rKgmK-0006ie-FX
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 15:34:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5914675a-a984-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 16:34:00 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-pzkIouvUPDeibrT9BgRP0w-1; Tue, 02 Jan 2024 10:33:56 -0500
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0700881F02;
 Tue,  2 Jan 2024 15:33:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79635492BFA;
 Tue,  2 Jan 2024 15:33:46 +0000 (UTC)
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
X-Inumbo-ID: 5914675a-a984-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704209638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qivEXDFa8JGXsGjfK5660gJbyc7eHqwbc8ku83Ng7G0=;
	b=iFSyC9bH860ROgz/wPSstuq6Jiw04sVIsTqGNcSkpFt2QUciV4C1I2zb7yKEIOFprPTYyd
	JE1YMwPbZCB36cOqdBKosGeJs9eEdfzgTSS8J3Pi00Vx/lEJhlEZvB9OfImH/CwomBCAGp
	N38JVFom7ARByQTB2bh+CVCrVYr3VLg=
X-MC-Unique: pzkIouvUPDeibrT9BgRP0w-1
Date: Tue, 2 Jan 2024 10:33:45 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Paul Durrant <paul@xen.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Alexander Graf <agraf@csgraf.de>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
	Hyman Huang <yong.huang@smartx.com>, Fam Zheng <fam@euphon.net>,
	Song Gao <gaosong@loongson.cn>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leonardo Bras <leobras@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Cameron Esfahani <dirty@apple.com>, qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Weiwei Li <liwei1518@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
	qemu-s390x@nongnu.org, qemu-block@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Stafford Horne <shorne@gmail.com>, Fabiano Rosas <farosas@suse.de>,
	Juan Quintela <quintela@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Blake <eblake@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Halil Pasic <pasic@linux.ibm.com>, xen-devel@lists.xenproject.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH v2 1/5] system/cpus: rename qemu_mutex_lock_iothread() to
 bql_lock()
Message-ID: <20240102153345.GA485043@fedora>
References: <20231212153905.631119-1-stefanha@redhat.com>
 <20231212153905.631119-2-stefanha@redhat.com>
 <389fff8c-9f5d-4b6b-acd2-bc3e2110a9b3@daynix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DI3ersSYWO3ysvwX"
Content-Disposition: inline
In-Reply-To: <389fff8c-9f5d-4b6b-acd2-bc3e2110a9b3@daynix.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10


--DI3ersSYWO3ysvwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:37:00PM +0900, Akihiko Odaki wrote:
> On 2023/12/13 0:39, Stefan Hajnoczi wrote:
> > @@ -312,58 +312,58 @@ bool qemu_in_main_thread(void);
> >       } while (0)
> >   /**
> > - * qemu_mutex_lock_iothread: Lock the main loop mutex.
> > + * bql_lock: Lock the Big QEMU Lock (BQL).
> >    *
> > - * This function locks the main loop mutex.  The mutex is taken by
> > + * This function locks the Big QEMU Lock (BQL).  The lock is taken by
> >    * main() in vl.c and always taken except while waiting on
> > - * external events (such as with select).  The mutex should be taken
> > + * external events (such as with select).  The lock should be taken
> >    * by threads other than the main loop thread when calling
> >    * qemu_bh_new(), qemu_set_fd_handler() and basically all other
> >    * functions documented in this file.
> >    *
> > - * NOTE: tools currently are single-threaded and qemu_mutex_lock_iothr=
ead
> > + * NOTE: tools currently are single-threaded and bql_lock
> >    * is a no-op there.
> >    */
> > -#define qemu_mutex_lock_iothread()                      \
> > -    qemu_mutex_lock_iothread_impl(__FILE__, __LINE__)
> > -void qemu_mutex_lock_iothread_impl(const char *file, int line);
> > +#define bql_lock()                      \
> > +    bql_lock_impl(__FILE__, __LINE__)
>=20
> This line break is no longer necessary.

Will fix in v3.

Stefan

--DI3ersSYWO3ysvwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmWULNkACgkQnKSrs4Gr
c8gQ1wf/SKDGDIkJDmyj8M85Uyj3OSfk6tILO0qMqPCHK2Xyw3+EA0ugnFsOQ0eT
UcvEcmAyA0hewn7VKrk4Ge1wuPQ6Qm9DgLNb6oojftMAxktuhOAwC8VRaYiUFIF/
JP46P0qatEeghim4KwM4VV8EGGClPZU0vVsAQ/6rAxs2ZWbgBMPFfg9TSspauGWY
4tObr3E/T3RO4aajdJMcobO9ocG3TTdJAGwcOY6nGHnfS+DE/+a2yr4NwmQrxgqS
jcmYNPM+uSCzilu3csBqEtYtklAsVkArXGkf0pcSb73VmfgeBdHlIRupD0aCq3SE
4rE39ETbAHOxe0+sS7oasRYcUNKBxA==
=P1kw
-----END PGP SIGNATURE-----

--DI3ersSYWO3ysvwX--


