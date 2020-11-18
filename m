Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF472B7B9A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 11:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29714.59339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfKz1-0006KZ-VD; Wed, 18 Nov 2020 10:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29714.59339; Wed, 18 Nov 2020 10:46:39 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfKz1-0006KA-RG; Wed, 18 Nov 2020 10:46:39 +0000
Received: by outflank-mailman (input) for mailman id 29714;
 Wed, 18 Nov 2020 10:46:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pym1=EY=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kfKyz-0006K5-Ca
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 10:46:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a10c9cb-ac2b-41cd-94c6-a5759a1173b2;
 Wed, 18 Nov 2020 10:46:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pym1=EY=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
	id 1kfKyz-0006K5-Ca
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 10:46:37 +0000
X-Inumbo-ID: 0a10c9cb-ac2b-41cd-94c6-a5759a1173b2
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0a10c9cb-ac2b-41cd-94c6-a5759a1173b2;
	Wed, 18 Nov 2020 10:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605696396;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ancuV2AV+elyPGV2VMZf6sKEM6gH0M0N47Gd+4HT978=;
  b=UF7cE/D7brA1SRI+lawcy9N55RFFYKDf5S601a8joc+nMz4biOVDtbV0
   sCXY61NIp0kwX/pAQRVyR2J8p8Q1VCGFk/Et0olj813jRloUZhuZhLBU0
   uxQCNovCDUa6hjW6fQW5a/riv8EJ0CoDsHLG0zNL79B1sP2xJnRsq+FoC
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1tWbEBLXUmBVlwxZZLLlvq82I0Zrbqa3Dih2OPssJw0McBDKgOg6BkwcOtxbT2uIkEZSyMZedK
 apGoUTZ/rkup4Kyi1JMu4LetNiPCjmeIyLerWfD6zHmEdWv4PpYnx54rUtCRy+8TcdlZhVW5Le
 mITmaBpSK9/2s34tv0aok/6M9G2FfODpI74Ospvjq5o8VZTy7gaD/bJbgPbVy7XI0omU3hKTWl
 A2c2gyv5u4MfPg9CaUZGRiDT/wXNzMzh2IvhShgSyOT15h2ZIyrOsyQnC4XzqlZT1/OmwH50ZW
 iDI=
X-SBRS: None
X-MesageID: 31758070
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31758070"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqjJToQqHsWivQTMYkSPujSMOGJaLRfZlICwy1MOPSByOaAqbJrw5Z1gPKStBcbuB3qbypxzEufAKEWLgBxd5MxJIlh2TLttDqjLt+IVvNOYo2Oe9g+Q52O7PHNEPRlLHIM7fOTAYdOVoTI8R8MZRj0HFeG4LQp5Aypb7blzotf+DVP58ckiNTO4tja+XTEobD6F+r7q2hnBi4/5KefPK12o9zV2CJGqtZRKQWhRbSioKV3XDCxjxZiSPsLoW1YiUyEhx/akM+n/aTmiC60EG4VNlUXdCQRJTCn/iv2e9YNzQdzo6bbXSyUSr50O8obc5fOg9Zg0OtSFPseXLxHwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTTHZPlnsZ/uKtKoOoXfEjYbBdMzIjdnd9G2ZQNTfqU=;
 b=J6PFVrG+OxhCCZlqbCiZsKp4W4LACudK9zPngpEYRRvEOAaZd6E4zNuwTM/mxgRNyQPT9p9fLg6AfJOq/m/3VqMQyxUMPLiKtE0OmEruU2olOuEuH/57B72s94hsdby20A6AotuPTbxASJfj4dq1mPVXuB5r1g4JdDkpME6AIXhw0oax4nEzvZCWYSyxyWz9bcgpV8Rain1OqtP4vTw4c8PgHwXXUrscKzrdnCQnuUlGi9PJ/ioXvkY2isETtwZ+i/5WYJB2fJovjjhD4qOhf3rWE8x41GIchvu8yv0CeV2LVCRtqcgzayuxPfA6YsWQzaMGLyOOOztrip+yCJ59Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTTHZPlnsZ/uKtKoOoXfEjYbBdMzIjdnd9G2ZQNTfqU=;
 b=ZBVR2ypkhVAuCKo4dTfmg68fyUtJWUdSjPpWQ5cUD2EW/2pZaIVXLBT8MyxB2520tBZ4tx3ci3wq/p0ElRkW3W+f7E64XuZGQEH/O4I+LsBrmB5M0bhcwXZBF5vrqphhQiwkFbLmzFAwtmQxwOpn3cbR/5mj4j6+UQOeeXnhgV8=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, David Scott <dave@recoil.org>
Subject: Re: [PATCH v1 0/4] tools/ocaml/libs/xc: domid control at domain
 creation time
Thread-Topic: [PATCH v1 0/4] tools/ocaml/libs/xc: domid control at domain
 creation time
Thread-Index: AQHWvQ7kpc/nzF74N0aOmOwyv2vIBKnNtIjn
Date: Wed, 18 Nov 2020 10:46:03 +0000
Message-ID: <DS7PR03MB565534B0FBF8C837C5DCDB49F6E10@DS7PR03MB5655.namprd03.prod.outlook.com>
References: <cover.1605636799.git.edvin.torok@citrix.com>
In-Reply-To: <cover.1605636799.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5e5b6d5-70b5-44c8-67e9-08d88baf25b0
x-ms-traffictypediagnostic: DM6PR03MB4266:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB4266DE8BB35B42EA406835ACF6E10@DM6PR03MB4266.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NgEP9ymwyfWitAYy0tDWpOs1UcdjIdE1ZVKRPta6tCFXYuWIQR/cbF+H5Lz4/SESW/6BB3TUuTRYkZGScUda4krG0V2/y3ktG3G6gZwfsp0O956VIUFUB3XEBPBpXmEIwDQOrhE2UqQjFbCNIiJ8y3BFNaIgMHkY66/DieOYYr1mwvWI0dqhq8FHr01A2MGO2bcAQmhtkVbpAQzpi9CClDIoK0Dga6Q4njjtpWvMW0kwT9tdnNuQBeUbrkeU/L+2AGZzxHFnoXjJViXPclxjZ8+JkPnZYS0aF7pF1XhQrx1b0y+rhj/hM3jz079us048HOtJnMwyqrhcI8JJVZ7NhA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5655.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(7696005)(186003)(52536014)(478600001)(66574015)(66446008)(64756008)(76116006)(91956017)(66476007)(71200400001)(66556008)(4326008)(53546011)(6506007)(316002)(26005)(55236004)(66946007)(33656002)(54906003)(55016002)(83380400001)(110136005)(9686003)(8936002)(5660300002)(8676002)(86362001)(44832011)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +k+nqbDquqJ4OjKTaK9dpyc8WYVUXESNScfAdicxf5Oq1pgaSXEDBxQrAysMv1nePsl74Iv2R6CefIPQpqyqKPIzUW4fCN6/TOqDx4dlANxxFevg1Mu77ATeOUDZAKY3wRBw5mrgG4pTRHJBMihLBDiuAAfalsYxZVwusqtRUxjRtVyD0DKp9A8NMlELAjD9fxNtcPrynpcNKCWBsPpCRYKzXOKptH5Dh5lplXYPg0E1GELd30I2WynhG09rY3jOh6bVQRvMjtdZ4rT1HqAjbJNK//J3pg/LEcMKUPPhzrSsRmz00AiMZ4pz+k+iOfMB+ao6BCDqropxvSWscLx+PA4TBXO+oKpu5jgliqH8AxrwxXGdtkYXFU5uWaPQEksvHXHFaV0/sloefOEPrNmKYX4QptXHylmARqV1djt9YOPrA5F+dSokH9nOoc8163YUlJa2yoDe5bbabn3GCN/uqA2vtd6Rxw99ls2A39mDqnu3DFDbbXvx1H+v51WoaeycLs1se3S6LrOfrjmI8tVGVY9KIzYjrScvzTj2v3jD+HGqvTDLnCsXK9YW3TbkMz7lWbdBOwlO3N1nHslNmlFfdbMqY8bofq7ACWfZv/pSp6kkzYdtE2bRAyiKOo8CFQKcAkXNL3u5GJktAaOSJPM6kg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5655.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e5b6d5-70b5-44c8-67e9-08d88baf25b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2020 10:46:03.9526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lg/sDh4anFFECWuvY9C6RBSxnZI1Ixy2pWBsWIw3na1EWMHnU7UNjCZjagTBWlETdWTwdT3RA3FXtyau3pphL02RfUTp7ieb6/L+iw0UnxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4266
X-OriginatorOrg: citrix.com


I like the improvements for the build process but I wonder whether these sh=
ould be mixed with functional code changes. But that is only a cosmetic con=
cern as it might impact identifying patches when they are backported. The c=
ode change looks good to me, too. I support moving to Dune for building the=
 OCaml part in the future.

Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Edwin T=F6r=F6k <edvin.torok@citrix.com>
Sent: 17 November 2020 18:24
To: xen-devel@lists.xenproject.org
Cc: Edwin Torok; Doug Goldstein; Andrew Cooper; George Dunlap; Ian Jackson;=
 Jan Beulich; Julien Grall; Stefano Stabellini; Wei Liu; Christian Lindig; =
David Scott
Subject: [PATCH v1 0/4] tools/ocaml/libs/xc: domid control at domain creati=
on time

The xl toolstack allows some control over the domid at VM creation time,
allow xenopsd similar control by exposing the appropriate domid field in th=
e OCaml xenctrl bindings.
A new API function is introduced to preserve backwards compatibility withou=
t merge ordering
requirements between the Xen and xenopsd patches: Xen can merge the patch a=
nd xenopsd will keep
building with the old function, and a new version of xenopsd will start usi=
ng the new function.

I've also included some build system fixes to allow me to test the build
in an upstream build environment:
```
cd automation/build
podman build -t registry.gitlab.com/xen-project/xen/ubuntu:focal -f ubuntu/=
focal.dockerfile ubuntu
DOCKER_CMD=3Dpodman CONTAINER_NO_PULL=3D1 CONTAINER=3Dregistry.gitlab.com/x=
en-project/xen/ubuntu:focal automation/scripts/containerize make build-tool=
s-oxenstored
```

It'd be good if someone could test whether containerize still works on non-=
SELinux systems now, or
whether we need more detection logic in the script.

This works around bugs in the OCaml makefiles that end up in "inconsistent =
assumptions" by doing a
'make clean' before building the OCaml files every time. This is inefficien=
t, but works.
Long term it would be beneficial to switch to Dune as build system,
which can do correct incremental builds with minimal configuration.
I'll send a separate patch series for that.

Edwin T=F6r=F6k (4):
  automation/scripts/containerize: fix DOCKER_CMD=3Dpodman
  automation/: add Ubuntu:focal container
  Makefile: add build-tools-oxenstored
  tools/ocaml/libs/xc: backward compatible domid control at domain
    creation time

 Makefile                                 |  6 +++
 automation/build/ubuntu/focal.dockerfile | 50 ++++++++++++++++++++++++
 automation/scripts/containerize          |  7 ++--
 tools/ocaml/Makefile                     |  8 ++++
 tools/ocaml/libs/xc/xenctrl.ml           |  3 ++
 tools/ocaml/libs/xc/xenctrl.mli          |  2 +
 tools/ocaml/libs/xc/xenctrl_stubs.c      |  9 ++++-
 7 files changed, 80 insertions(+), 5 deletions(-)
 create mode 100644 automation/build/ubuntu/focal.dockerfile

--
2.18.4


