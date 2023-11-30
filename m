Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CF97FFCB6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 21:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645137.1007037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8nmv-0000HL-RW; Thu, 30 Nov 2023 20:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645137.1007037; Thu, 30 Nov 2023 20:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8nmv-0000Fc-OT; Thu, 30 Nov 2023 20:37:33 +0000
Received: by outflank-mailman (input) for mailman id 645137;
 Thu, 30 Nov 2023 20:37:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PSmm=HL=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8nmu-0008JW-CE
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 20:37:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4879d134-8fc0-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 21:37:31 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-342-EGzAGfmtP1Gfd_b9MrP_Pw-1; Thu,
 30 Nov 2023 15:37:25 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D6F62802292;
 Thu, 30 Nov 2023 20:37:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDF641C060BD;
 Thu, 30 Nov 2023 20:37:19 +0000 (UTC)
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
X-Inumbo-ID: 4879d134-8fc0-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701376650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+iKxVT3Aoxm2ETYbHgSKpvUXyQ0XJ8rFvA2vgboplHU=;
	b=WoHDYjhkWvUNMfzjEK6PZ0HXews1WDTt9so/SenbNYE1HA+vZFbBw3YmZQcZ/QHjg0PjGb
	1gAkW1XaCsKosYmFfaxmPBGTDhz3bAhdgfoh2Ol8dZR/YjwqRH0rhBw6EGS3VNDm6d1zuR
	EwzU0fYTJUyWoFmJufYYS7eT80IXIFQ=
X-MC-Unique: EGzAGfmtP1Gfd_b9MrP_Pw-1
Date: Thu, 30 Nov 2023 15:37:18 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
	Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Paul Durrant <paul@xen.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Juan Quintela <quintela@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Huacai Chen <chenhuacai@kernel.org>, Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Alexander Graf <agraf@csgraf.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>, Eric Farman <farman@linux.ibm.com>,
	Stafford Horne <shorne@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	John Snow <jsnow@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Michael Roth <michael.roth@amd.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
	qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	qemu-ppc@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 6/6] Rename "QEMU global mutex" to "BQL" in comments and
 docs
Message-ID: <20231130203718.GD1184658@fedora>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-7-stefanha@redhat.com>
 <fcaff24d-0ced-4547-898f-a9b8bf49be45@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rAX955JzN10OrQ/Q"
Content-Disposition: inline
In-Reply-To: <fcaff24d-0ced-4547-898f-a9b8bf49be45@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7


--rAX955JzN10OrQ/Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 02:49:48PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 29/11/23 22:26, Stefan Hajnoczi wrote:
> > The term "QEMU global mutex" is identical to the more widely used Big
> > QEMU Lock ("BQL"). Update the code comments and documentation to use
> > "BQL" instead of "QEMU global mutex".
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   docs/devel/multi-thread-tcg.rst   |  7 +++----
> >   docs/devel/qapi-code-gen.rst      |  2 +-
> >   docs/devel/replay.rst             |  2 +-
> >   docs/devel/multiple-iothreads.txt | 16 ++++++++--------
> >   include/block/blockjob.h          |  6 +++---
> >   include/io/task.h                 |  2 +-
> >   include/qemu/coroutine-core.h     |  2 +-
> >   include/qemu/coroutine.h          |  2 +-
> >   hw/block/dataplane/virtio-blk.c   |  8 ++++----
> >   hw/block/virtio-blk.c             |  2 +-
> >   hw/scsi/virtio-scsi-dataplane.c   |  6 +++---
> >   net/tap.c                         |  2 +-
> >   12 files changed, 28 insertions(+), 29 deletions(-)
>=20
>=20
> > diff --git a/include/block/blockjob.h b/include/block/blockjob.h
> > index e594c10d23..b2bc7c04d6 100644
> > --- a/include/block/blockjob.h
> > +++ b/include/block/blockjob.h
> > @@ -54,7 +54,7 @@ typedef struct BlockJob {
> >       /**
> >        * Speed that was set with @block_job_set_speed.
> > -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_=
CODE).
> > +     * Always modified and read under BQL (GLOBAL_STATE_CODE).
>=20
> "under the BQL"
>=20
> >        */
> >       int64_t speed;
> > @@ -66,7 +66,7 @@ typedef struct BlockJob {
> >       /**
> >        * Block other operations when block job is running.
> > -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_=
CODE).
> > +     * Always modified and read under BQL (GLOBAL_STATE_CODE).
>=20
> Ditto,
>=20
> >        */
> >       Error *blocker;
> > @@ -89,7 +89,7 @@ typedef struct BlockJob {
> >       /**
> >        * BlockDriverStates that are involved in this block job.
> > -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_=
CODE).
> > +     * Always modified and read under BQL (GLOBAL_STATE_CODE).
>=20
> Ditto.
>=20
> >        */
> >       GSList *nodes;
> >   } BlockJob;

Will fix in v2.

Stefan

--rAX955JzN10OrQ/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVo8n4ACgkQnKSrs4Gr
c8hqqggAtuleOhegca1BHCQqICnBO4Olum6obo9K4B6RhmNaK9kIfqeO3kNFY9K0
xy7SGfNACel07j3Lttl6p+xHJOe1zaE7IV2o9jKqMK0J09vpTZSXq06ssaTJrYZn
p2hGeneWnTJU5O3qUpotRsBp19PdMJLL3o2V7fJ+FRmE+0bc1KTCfzaIDC0IWFQD
rc5d8Et49WwA+aKWhDsn3GeRlvfxIxk/TFHsfdkLSdpU/LVU9lP/ExNVLqwYTNl9
OChcXKr+5mvuONgflXwub4uzX8FbIS/HoPIIC7uBG5xE+gao+EYmNRXVFFHRC+CP
/rjI7iW5qJHCSKa8tj2XY0KwbTSlcQ==
=hoap
-----END PGP SIGNATURE-----

--rAX955JzN10OrQ/Q--


