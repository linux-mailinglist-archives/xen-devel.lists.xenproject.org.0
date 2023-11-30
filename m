Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 636CA7FFCFB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 21:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645142.1007046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8nso-0003UG-G0; Thu, 30 Nov 2023 20:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645142.1007046; Thu, 30 Nov 2023 20:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8nso-0003RV-DF; Thu, 30 Nov 2023 20:43:38 +0000
Received: by outflank-mailman (input) for mailman id 645142;
 Thu, 30 Nov 2023 20:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PSmm=HL=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1r8nsn-0003RP-6E
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 20:43:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21971f5a-8fc1-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 21:43:36 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-YVQAL4REMrW4yB-eXJoi0A-1; Thu, 30 Nov 2023 15:43:32 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13067828AC0;
 Thu, 30 Nov 2023 20:43:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5D84C0BDC0;
 Thu, 30 Nov 2023 20:43:26 +0000 (UTC)
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
X-Inumbo-ID: 21971f5a-8fc1-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701377014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cNAnS8dhB7e4TvDt7MCxzeAFcs3pq2oyNt9JbDuu0+0=;
	b=XQsADhPo9zzCyI4BfNmmG5MHeS7sHsgVA5kZfbtrXlyUw02+B6YwL6YBCgbQaWfqsnX/1Z
	t69HTR8FXzXonnxOzWr8yVu3RbJoqFpRFY40GJxIJ2BJC0tQ2NP3RR1s7psIC0XjU48ur1
	Ppo36AlZ/evJSjWH08ldvQjMQYky2wk=
X-MC-Unique: YVQAL4REMrW4yB-eXJoi0A-1
Date: Thu, 30 Nov 2023 15:43:25 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Xu <peterx@redhat.com>
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
	Anthony Perard <anthony.perard@citrix.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	qemu-ppc@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
Message-ID: <20231130204325.GE1184658@fedora>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-2-stefanha@redhat.com>
 <ZWjr0TKxihlpd1jm@x1n>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SBmcOIqLLg4zQdMA"
Content-Disposition: inline
In-Reply-To: <ZWjr0TKxihlpd1jm@x1n>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8


--SBmcOIqLLg4zQdMA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 03:08:49PM -0500, Peter Xu wrote:
> On Wed, Nov 29, 2023 at 04:26:20PM -0500, Stefan Hajnoczi wrote:
> > The Big QEMU Lock (BQL) has many names and they are confusing. The
> > actual QemuMutex variable is called qemu_global_mutex but it's commonly
> > referred to as the BQL in discussions and some code comments. The
> > locking APIs, however, are called qemu_mutex_lock_iothread() and
> > qemu_mutex_unlock_iothread().
> >=20
> > The "iothread" name is historic and comes from when the main thread was
> > split into into KVM vcpu threads and the "iothread" (now called the main
> > loop thread). I have contributed to the confusion myself by introducing
> > a separate --object iothread, a separate concept unrelated to the BQL.
> >=20
> > The "iothread" name is no longer appropriate for the BQL. Rename the
> > locking APIs to:
> > - void qemu_bql_lock(void)
> > - void qemu_bql_unlock(void)
> > - bool qemu_bql_locked(void)
> >=20
> > There are more APIs with "iothread" in their names. Subsequent patches
> > will rename them. There are also comments and documentation that will be
> > updated in later patches.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Acked-by: Peter Xu <peterx@redhat.com>
>=20
> Two nickpicks:
>=20
>   - BQL contains "QEMU" as the 2nd character, so maybe easier to further
>     rename qemu_bql into bql_?

Philippe wondered whether the variable name should end with _mutex (or
_lock is common too), so an alternative might be big_qemu_lock. That's
imperfect because it doesn't start with the usual qemu_ prefix.
qemu_big_lock is better in that regard but inconsistent with our BQL
abbreviation.

I don't like putting an underscore at the end. It's unusual and would
make me wonder what that means.

Naming is hard, but please discuss and I'm open to change to BQL
variable's name to whatever we all agree on.

>=20
>   - Could we keep the full spell of BQL at some places, so people can sti=
ll
>     reference it if not familiar?  IIUC most of the BQL helpers will root
>     back to the major three functions (_lock, _unlock, _locked), perhaps
>     add a comment of "BQL stands for..." over these three functions as
>     comment?

Yes, I'll update the doc comments to say "Big QEMU Lock (BQL)" for each
of these functions.

Stefan

--SBmcOIqLLg4zQdMA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVo8+0ACgkQnKSrs4Gr
c8jJmAf9E8P/Xu7G6FqCGvOsGt/mlsqbLE31vNsiYxVDEuJJ4a39lBYM8XOY3zUI
Gg064yxhG8tJGG9m/NXlySw6Sspev3/nD4NPnrVvUGbS7OGjFL9L4oeHzgeK/ude
U2mtVSBxhVHvx08ya0nKtF3i0ghiSWa+/X83V03smz5ZuMNU1ZXTAzSCp54dwQCH
nO4Q4Y7nQxE57jSy8rB5HTwxFpmfjfXlzYpF+3rYGj+pjy7vOEuD8jdGBZ3+ts9x
Cca0JUsQNEHbcUesyE4ToH5KQHOFUQKalbc+knFcT8JuoGXX3MwuS4mp22wi7Gv6
LDSh2bymbDqhY4xQU5BomaihozS0ww==
=QeIi
-----END PGP SIGNATURE-----

--SBmcOIqLLg4zQdMA--


