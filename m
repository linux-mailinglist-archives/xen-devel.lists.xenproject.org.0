Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F5C6F04F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 14:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166059.1492706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLiXr-0005g6-Es; Wed, 19 Nov 2025 13:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166059.1492706; Wed, 19 Nov 2025 13:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLiXr-0005dP-BR; Wed, 19 Nov 2025 13:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1166059;
 Wed, 19 Nov 2025 13:48:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aBqX=53=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vLiXq-0005d3-Q1
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 13:48:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ab0f313-c54e-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 14:48:24 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-c9AsqnwVO_K6HMYJOAg8Tg-1; Wed,
 19 Nov 2025 08:48:20 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CC8DB180035F; Wed, 19 Nov 2025 13:48:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7A14B18004A3; Wed, 19 Nov 2025 13:48:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A94D221E6A27; Wed, 19 Nov 2025 14:48:11 +0100 (CET)
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
X-Inumbo-ID: 6ab0f313-c54e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763560103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xsySjUAW/OC81jZhGvxSBn3taIt42d+Gp2Dn5EiAh3I=;
	b=SglrrurfweQh+/BjeUuTzzF5itB3RQKTiD8mQVMTrk8+MLFP2EAH3DGvxv8LkxNa9PxhtK
	IXK7x7uwmVZruKQOj1MA+LqyCvYm9rTyxsN8usqcfiuAThZ/Fp24LXIRgt76Tnjzu3u1q8
	U2EiszZ773KK3mcsFG2IGguPn0dQlxM=
X-MC-Unique: c9AsqnwVO_K6HMYJOAg8Tg-1
X-Mimecast-MFC-AGG-ID: c9AsqnwVO_K6HMYJOAg8Tg_1763560096
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,  qemu-devel@nongnu.org,
  kwolf@redhat.com,  hreitz@redhat.com,  mst@redhat.com,
  imammedo@redhat.com,  anisinha@redhat.com,  gengdongjiu1@gmail.com,
  peter.maydell@linaro.org,  alistair@alistair23.me,
  edgar.iglesias@gmail.com,  npiggin@gmail.com,  harshpb@linux.ibm.com,
  palmer@dabbelt.com,  liwei1518@gmail.com,  dbarboza@ventanamicro.com,
  zhiwei_liu@linux.alibaba.com,  sstabellini@kernel.org,
  anthony@xenproject.org,  paul@xen.org,  peterx@redhat.com,
  farosas@suse.de,  eblake@redhat.com,  vsementsov@yandex-team.ru,
  eduardo@habkost.net,  marcel.apfelbaum@gmail.com,  philmd@linaro.org,
  wangyanan55@huawei.com,  zhao1.liu@intel.com,  qemu-block@nongnu.org,
  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  qemu-riscv@nongnu.org,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/5] error: Consistently name Error * objects err, and
 not errp
In-Reply-To: <aR3HpH88od11v8qL@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
	"Wed, 19 Nov 2025 13:35:32 +0000")
References: <20251119130855.105479-1-armbru@redhat.com>
	<20251119130855.105479-6-armbru@redhat.com>
	<3ffe11b9-db81-4930-aefa-e55d758645bf@citrix.com>
	<aR3HpH88od11v8qL@redhat.com>
Date: Wed, 19 Nov 2025 14:48:11 +0100
Message-ID: <87a50ixhes.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Nov 19, 2025 at 01:22:06PM +0000, Andrew Cooper wrote:
>> On 19/11/2025 1:08 pm, Markus Armbruster wrote:
>> > diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
>> > index b93ff80c85..3e62ec09d0 100644
>> > --- a/hw/xen/xen-pvh-common.c
>> > +++ b/hw/xen/xen-pvh-common.c
>> > @@ -101,7 +101,7 @@ static void xen_create_virtio_mmio_devices(XenPVHM=
achineState *s)
>> >  #ifdef CONFIG_TPM
>> >  static void xen_enable_tpm(XenPVHMachineState *s)
>> >  {
>> > -    Error *errp =3D NULL;
>> > +    Error *err =3D NULL;
>> >      DeviceState *dev;
>> >      SysBusDevice *busdev;
>> >=20=20
>> > @@ -111,8 +111,15 @@ static void xen_enable_tpm(XenPVHMachineState *s)
>> >          return;
>> >      }
>> >      dev =3D qdev_new(TYPE_TPM_TIS_SYSBUS);
>> > -    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp=
);
>> > -    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
>> > +    /*
>> > +     * FIXME This use of &err is is wrong.  If both calls fail, the
>> > +     * second will trip error_setv()'s assertion.  If just one call
>> > +     * fails, we leak an Error object.  Setting the same property
>> > +     * twice (first to a QOM path, then to an ID string) is almost
>> > +     * certainly wrong, too.
>> > +     */
>> > +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &err);
>> > +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &err);
>>=20
>> To your question, I don't know the answer, but I think it's far more
>> likely that the original author didn't grok the proper use of &errp,
>> than for this behaviour to be intentional.
>>=20
>> Surely we just want a failure path and abort the construction if this
>> goes wrong?
>
> In the caller of xen_enable_tpm, we just have error_report+exit calls,
> so there's no error propagation ability in the call chain.
>
> The caller will also skip  xen_enable_tpm unless a TPM was explicitly
> requested in the config.
>
> Given that, I'm inclined to say that the object_property_set_* calls
> in xen_enable_tpm should be using &error_abort, as a failure to setup
> the explicitly requested TPM should be fatal.

I *suspect* that the first call always fails, and the second one always
works.  If that's the case, the fix is to delete the first call, and
pass &error_abort to the second.


