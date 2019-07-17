Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F79D6C118
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 20:44:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnor0-0005Bp-OP; Wed, 17 Jul 2019 18:40:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MqU0=VO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hnoqz-0005Bk-HH
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 18:40:37 +0000
X-Inumbo-ID: 5b843b96-a8c2-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5b843b96-a8c2-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 18:40:36 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 18:36:43 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 18:39:10 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 18:39:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6TGlc/eFiecVgLxoZ0ATGGOX8sxTzwjBjHasm18ZLkpHd0PcRbQmN7M1W0JoVKaDlBmLdicMpNfdqQWQwLJ0Faeqga7HGj9j6wHw3fDGLCqKFnbo2UsUc+atJ7qxkZnBFH316KAIFhVEvpq/sNtG8aPvJsadrsUfrEeXk/cD98OvWs7OWGPAuEx7F9vHnLC8qXm905nFGP8ONK9yHHnHI8rr5WgMsC5vIreZEh0a9CazcJP2lr+3Dq4PJOxCG8w+NOd6HyV+PJfitfQEg+8NeFf6pxo33uojomWpfvJPd/SIkc9VzeObEJUJWap1p32aCyLBKtqxf0eff+Lx00Dfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWveNn9+qCvKUuizUHQE0XYcZ9Hh6FHGcf6KF5suvcI=;
 b=QkkWH4vWbOnkPdlwwlLgQdYVdJCjmAuu/6v5+thK/gr1HAlOUYyVIY1+5LWxc3gc8yZLgpHQLg6DIw//bHzMjwhFOKEBq6+mf/P3h9WThQFqxTqBa606fa7lB3VV9lIG0KdvvdUX10zIi1qZtAxgAAkOkH4xXvdL9WD2lK08RxJjTWsj4vSlTkLKAS0RiSiq7uLFkcYspMa8cL+jQ+by8+JasLsQBJow1Lw9mzh2vgMRmODSmpA+ihK7MMJkkezFI+ZZM0ZBg3e5EM6QzLVpVWCxxzAv2grYjBl4zwap8rk+bfR2zQx5xmFe/uPTDyOL03KbZBoRQ64sd5sbjeFo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB2118.namprd18.prod.outlook.com (52.132.143.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Wed, 17 Jul 2019 18:39:09 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 18:39:08 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v1 3/5] xen: sched: null: deassign offline
 vcpus from pcpus
Thread-Index: AQHVPLldBnQTmgAVAEKMCBR/SPQnEabPJF+A
Date: Wed, 17 Jul 2019 18:39:07 +0000
Message-ID: <9d4acfa8661eb571492405be91b0cdce1bb069c0.camel@suse.com>
References: <153515586506.7407.8908626058440527641.stgit@Palanthas.fritz.box>
 <153515651319.7407.3000873927341886165.stgit@Palanthas.fritz.box>
 <533decf6-7ae0-cc43-0162-695151cde292@citrix.com>
In-Reply-To: <533decf6-7ae0-cc43-0162-695151cde292@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49bc83c9-b1b3-43a1-010a-08d70ae60df5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB2118; 
x-ms-traffictypediagnostic: DM5PR18MB2118:
x-microsoft-antispam-prvs: <DM5PR18MB21184C8E4493EF4C9C67A22DC5C90@DM5PR18MB2118.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(199004)(189003)(53376002)(53366004)(486006)(476003)(6246003)(2616005)(11346002)(14454004)(66066001)(446003)(5660300002)(2501003)(7736002)(305945005)(99936001)(54906003)(110136005)(118296001)(14444005)(6506007)(256004)(102836004)(81166006)(53546011)(316002)(2906002)(81156014)(71190400001)(71200400001)(76176011)(6436002)(6116002)(3846002)(6486002)(8936002)(66616009)(66476007)(64756008)(66946007)(91956017)(25786009)(478600001)(66446008)(4326008)(76116006)(8676002)(26005)(66556008)(186003)(68736007)(36756003)(86362001)(53936002)(966005)(6306002)(6512007)(99286004)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2118;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dBqA9kxZpl1+eIIWSDmdXeR/cxC5zbxQFoVEUgCsuPPIoc2qMBc3V11thL4ehfGynTF2RZTKzUjyvBiIivXTqz5fTuM/+Ipo2wCuqvu9SDdVyzhc8reMc7zt+anDoxoA3IFwRa2QPjBFkXmVmWzhI0RCHh86nzuu4ELmoKazm1AZTzzvOVAzO/pfjx2DsSFnKwLIMHVojmeiBjuh8APfooDnsimpLiRqen43LFNw6nL0/uQx+Q2hpd+jrkXIidk1yFp93FUw2oC+xUAAgHC93SutY3BgOa1QhDrAUdGI+27LgSHxhQJKbLnaRYGJu4crGhtvq//a+NKUIu3DqnQQWO/TBz9bJx/mAENqYYxdLEobvb62HhmMOMraHznUQRWHNGNE7XOTjORSl52ajlo73snkT+2u7ecfoxd2d6IWL6o=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bc83c9-b1b3-43a1-010a-08d70ae60df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 18:39:08.3586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2118
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v1 3/5] xen: sched: null: deassign offline
 vcpus from pcpus
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6366262508701912587=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6366262508701912587==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-gBAZeqJZFEi4wDLqL0zh"

--=-gBAZeqJZFEi4wDLqL0zh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-07-17 at 17:04 +0100, George Dunlap wrote:
> On 8/25/18 1:21 AM, Dario Faggioli wrote:
> > If a pCPU has been/is being offlined, we don't want it to be
> > neither
> > assigned to any pCPU, nor in the wait list.
> >=20
> > Therefore, when we detect that a vcpu is going offline, remove it
> > from
> > both places.
>=20
> Hmm, this commit message wasn't very informative.
>=20
Ok, we can certainly improve that. :-)

> It looks like what you really mean to do is:
>=20

> > @@ -518,6 +521,14 @@ static void null_vcpu_remove(const struct
> > scheduler *ops, struct vcpu *v)
> > =20
> >      lock =3D vcpu_schedule_lock_irq(v);
> > =20
> > +    /* If offline, the vcpu shouldn't be assigned, nor in the
> > waitqueue */
> > +    if ( unlikely(!is_vcpu_online(v)) )
> > +    {
> > +        ASSERT(per_cpu(npc, v->processor).vcpu !=3D v);
> > +        ASSERT(list_empty(&nvc->waitq_elem));
> > +        goto out;
> > +    }
>=20
> * Handle the case of an offline vcpu being removed (ASSERTing that
> it's
> neither on a processor nor on the waitqueue)
>=20
So, IIRC (sorry, it's been a while :-D ), this is for dealing with
remove_vcpu() being called on a vcpu which is offline. So, yes,
basically what you said. :-)

Point is the work of removing such vCPU from any CPU and from the wait
list has been done already, in null_vcpu_sleep(), while the vCPU was
going offline. So, here, we only need to make sure that we don't do
anything, i.e., that we don't call _vcpu_remove().

> But wait, isn't this fixing a important regression in patch 2?  If
> after
> patch 2 but before patch 3, a VM is created with offline vcpus, and
> then
> destroyed, won't the offline vcpus reach here neither on the waitlist
> nor on a vcpu?
>=20
I'm not sure I understand the point you're trying to make here, sorry.

In general, considering what we've said in other mails, if you think
that patch 2 and 3 should be merged, we can do that.

My reasoning, when putting together the series, was the one I already
stated: this is broken already, so no big deal breaking it "more", and
I continue to see it that way.

But I appreciate you seeing it differently, while I don't have a too
strong opinion, so I'd be fine merging the patches (or doing other
series rearrangements, if you feel strongly that they're necessary).

Or is it something completely different that you meant?

> > @@ -567,11 +578,31 @@ static void null_vcpu_wake(const struct
> > scheduler *ops, struct vcpu *v)
> > =20
> >  static void null_vcpu_sleep(const struct scheduler *ops, struct
> > vcpu *v)
> >  {
> > +    struct null_private *prv =3D null_priv(ops);
> > +    unsigned int cpu =3D v->processor;
> > +    bool tickled =3D false;
> > +
> >      ASSERT(!is_idle_vcpu(v));
> > =20
> > +    /* We need to special case the handling of the vcpu being
> > offlined */
> > +    if ( unlikely(!is_vcpu_online(v)) )
> > +    {
> > +        struct null_vcpu *nvc =3D null_vcpu(v);
> > +
> > +        printk("YYY d%dv%d going down?\n", v->domain->domain_id,
> > v->vcpu_id);
> > +        if ( unlikely(!list_empty(&nvc->waitq_elem)) )
> > +        {
> > +            spin_lock(&prv->waitq_lock);
> > +            list_del_init(&nvc->waitq_elem);
> > +            spin_unlock(&prv->waitq_lock);
> > +        }
> > +        else if ( per_cpu(npc, cpu).vcpu =3D=3D v )
> > +            tickled =3D vcpu_deassign(prv, v);
> > +    }
>=20
> * Handle the unexpected(?) case of a vcpu being put to sleep as(?)
> it's
> offlined
>=20
Well, that printk, really shouldn't be there! :-(

> If it's not unexpected, then why the printk?
>=20
Because it was a debugging aid, for while I was working on the series,
and I apparently failed at killing it before sending.

Sorry. :-(

> And if it is unexpected, what is the expected path for a cpu going
> offline to be de-assigned from a vcpu (which is what the title seems
> to
> imply this patch is about)?
>=20
This is the vCPU going down, when do_vcpu_op(VCPU_down) is invoked on
it, which then calls vcpu_sleep_nosync() with _VPF_down set in
pause_flags (which means vcpu_is_online() would be false.

So it is indeed the _expected_ path, and sorry again if the stray
debugging printk made you think otherwise.

> > @@ -615,12 +646,12 @@ static void null_vcpu_migrate(const struct
> > scheduler *ops, struct vcpu *v,
> >       *
> >       * In the latter, there is just nothing to do.
> >       */
> > -    if ( likely(list_empty(&nvc->waitq_elem)) )
> > +    if ( likely(per_cpu(npc, v->processor).vcpu =3D=3D v) )
> >      {
> >          vcpu_deassign(prv, v);
> >          SCHED_STAT_CRANK(migrate_running);
> >      }
> > -    else
> > +    else if ( !list_empty(&nvc->waitq_elem) )
> >          SCHED_STAT_CRANK(migrate_on_runq);
>=20
> * Teach null_vcpu_migrate() that !on_waitqueue !=3D on_vcpu.
>=20
> It looks like the comment just above this hunk is now out of date:
>=20
> "v is either assigned to a pCPU, or in the waitqueue."
>=20
Yes it does.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-gBAZeqJZFEi4wDLqL0zh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0va0kACgkQFkJ4iaW4
c+56LA//eKD8LoJk0DpQOMKy+DMiJS9cIYJTlHlloANt+ZAr/BPIBhbntclMrxlW
ew280L3M84wy6B3e6jzvFD+dgx9ONxgIkbGchyacQCArC1W5RkHLT5v7/gmK3B7r
yHC+A8uzP3JwO2EoaG2cBoEedIR57M2rHFbEBEauuQK57nWUrE+wgCHRDhsPDUGr
o8ykrPRsCQnvQlKYn/sN6SDbUxXgeLOZLAF+iSajrR8UaXEoeRKEGaPDr5k3O0vV
IThaC746RfwAhNOXqQaxYO/W8SyA2wzJhhI0SQdfKZNMKi3v5El5LMPZifkFAkKx
wicLX4LMiTDeIglNGaDnVoUhrjc2NcQ4P7Hd4BsQX09VrgpQDhluzVVT/m1m8tLv
izGayyo3LNO9pTwomjPT4xDvq4iMf5b1n/E1/YEU8jNVZJr7XQ427be0PPZhj0BQ
zutHw6dYAd0nC2B1FojkS165PU+tqbSlIVR0OHEygYQnuCMJevRzHVi3TXECHJMd
Fly3czY4z74NF2CZWSifEsEA/zJ+LVZPsoMd7rrbGysBew0vSBkBGo01MUTfn4mj
XK5iGBwaz9AuMtkUOIO490b7JAqN4MNxfMAW/KJqgs9MCcPqno8eA8GJoPUE3J4F
YI5CozZdu2HEOadgLPzO53rAsNaXzd+VNg6WvnguRGNL6hq9ARc=
=B2yn
-----END PGP SIGNATURE-----

--=-gBAZeqJZFEi4wDLqL0zh--


--===============6366262508701912587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6366262508701912587==--

