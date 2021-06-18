Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4073AC9B6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 13:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144481.265926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCXb-0000bB-AC; Fri, 18 Jun 2021 11:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144481.265926; Fri, 18 Jun 2021 11:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCXb-0000Xp-5E; Fri, 18 Jun 2021 11:20:03 +0000
Received: by outflank-mailman (input) for mailman id 144481;
 Fri, 18 Jun 2021 11:20:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luCXZ-0000LJ-5b
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 11:20:01 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d69e02a-c7a3-46e8-8c3e-b5f632e57377;
 Fri, 18 Jun 2021 11:19:59 +0000 (UTC)
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
X-Inumbo-ID: 6d69e02a-c7a3-46e8-8c3e-b5f632e57377
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624015199;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hvFv158S8RiXxmD9m4q8jv6XDa46ldr+WqVA4byRFXQ=;
  b=GJ0Wf/r1O1y4xUe4OjvpjIa8tpj78KpmOu9NHd6E0xlPp5fZ3o/cSHIE
   BaKsrzjGP1AT7eKaV/fR0bhAIRSEyNTXQ0ZqkyCx2DXdNCKJmFaLUyaZh
   yF/FlLFQSPMNDFAlV4fm67iZhG80/9qJsS9NdCrcKSYyZCGNDrGznUX2h
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oyNCA5/t2MZ3NC8Mq6uJ6aBzAETaWmhjWTPT537remw0cvWzitjmpkEv5zs3GK+c/gyv9idzc8
 rX2v2UEjeqO5RLIO8P5pkWD7jWCvfdXmIVBv29nNxvuj5EvWjM0j4hSLCFWiSJzNvNxMDJlECJ
 ZQD6E9JxkXb+9IMGFcQUZgxRnF/AJPPM9WzcSA24SqT62JlvPbdEmXIAm/hFik4QT586GpTfuX
 NF632F/oXfseYZQakklH1K1fHBJAdZDhhV8MBTkS2VMIZ2ZTd8K27jNHLYdUfqpDU7qsbKNSC8
 djE=
X-SBRS: 5.1
X-MesageID: 46817966
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VQ7jyKpJYfPMCThjzaCZBjsaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46817966"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQInDp0VlqLrubc+dyGr2O8W4L2idhnAsvr3rZ6LPd6hdPMr8wGowTrU1BA6Iunqt59gs+mOSjSsGb4i+w1oWEC4rqfCrbDE0bVuinuw0VCU2CXa4vsQGjrWsL51p3v9hIrDogVtRYV4IV+mT8ZaipjpK7faRy373Dv9teBdTYFH87Ut+XIjbiD+iTva23ZBz9oX8f0E8frU14C+2njtXVgkWDkh5Wa2MgCcoweZ716Lg/aCPDGmcAagqEdUbjpS+lH+6VqLOOnTWJdVs3AEzjtaEP87xD/80mxTUHETw6noMSZXMz3PH89hOEeb7ImUZKgnnkX9+UIgk1CYY3RXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VG88R5PVfkjFw5U9c/NPxl2z90BrcCABs6qe9+IKPHI=;
 b=R2mlTAIyiEwwRA7V07F1KXl7wlMgFp6s63a1m+IA5ACXFC3VL09S5vMapu5JekMxMiREZZWvqrDECqsA/LqqwfvpeWxkdzNkv6p3jfLY/f1fFzKsNX2lFIhuP1ZbQhlIm+upVi7ibCJgBqem+RNnh7unpMJOTlV18vHFPsEorRy8KeIQDRmu1gm5DyVzXrV9hLiAhmMM+s/w1fLeAyKDZ2uvPmI24s+R2bTqILz5B08Y+HJejmeqMOgZR/s0TYk7mNOqdNaciwJLuyBSlu+wDp619+JfQtX0ml4EvOJhurJmBdOjAqbdtWf1+0OazyfGQyq/kRW32jeS2MsDmLatlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VG88R5PVfkjFw5U9c/NPxl2z90BrcCABs6qe9+IKPHI=;
 b=ShRcB0M2HdrCLX+GaafdLjMPY1B0KdGrcsKK5ODjJ4R6mrKJKR6Fyz2QbKDElDjmGov71z9eBKo5fRnLYOYWbeQ4GKt4ojpH5t2Sq6PsBJsyArvq2lM1+b6BlnLq3oUUZ8PlW03T288TqvJx4NJV+3lTHOf0akaWtOxVJWqYx20=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "xen-devel@lists.xenproject.prg" <xen-devel@lists.xenproject.prg>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 04/12] golang/xenlight: export keyed union
 interface types
Thread-Topic: [RESEND PATCH 04/12] golang/xenlight: export keyed union
 interface types
Thread-Index: AQHXUNytQQDjetM7BUSIz+lNSh+ZXasZxf6A
Date: Fri, 18 Jun 2021 11:19:55 +0000
Message-ID: <A972F792-5327-438B-BA92-DB5A334AAA3E@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <29a3fbc93262cb9b31f02d6c94c018b200dfa43e.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <29a3fbc93262cb9b31f02d6c94c018b200dfa43e.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b19d3218-ff25-4067-0725-08d9324b003e
x-ms-traffictypediagnostic: PH0PR03MB6366:
x-microsoft-antispam-prvs: <PH0PR03MB63668A501A1E7CFBCF0D272F990D9@PH0PR03MB6366.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aZoco1ovgO54chQ6NJwwTd4up0IxbWZo2vbOIa7isxJoE/gxhvLxmG/06pvHqoqauPQh9/M+OX1ARfX1tQb07qQYJeZubZ5dEUXiOHECCOtzZQLQErKDsVwk7vX2SID2MCkcWMkRv/zRvuDE7MVuPyL4K3BA0gW1e9DEpJ8mt4TFrFy+x8qfpFSTIhiRLL6rycpp7orL+9Sa3jvGQmG+K9fZfNWwE7o66IIxCc8NAWn0e+bcJ0HUT51qvdjQemTb/3EYXfCrdZaef4BqoFnQYCOP/lO8s3K7uk3hXCbqmUtJ6oJe5mnGyIqefUvcBRS1zBOpmHTs2gDWwpFsSl9ypwdN7XsULSms8LCHhh7Le/pAxJoDJbMnSztuWga0U3xV9Hn8G7JkM9NlnBvKpJwT99DHnUi7gr0lcAWExh4ldbk4lp7mHa3FC7wuu1a5EQsBvdKL6OicbgigAu3IP+OcUmQHpiL9lqtzMcJXlPCn5XzXofdGwLXq2xfgp9Y3VefOSMJRPLk22w5uTZZvl6dLMSTKXuUdCLOfFgR6QskdThPWGCzO4GTJVSPS4A6sCaHifgh+i0JR7dp3IDwZz2aw9fci5yBWuZuOjwzCgmJquZkJiidhK1F9wGRXvTygiOI0WdPYBR45ogiuSZWnKTZZiVLKq6GEchd2gGYF7ih+y/P5F/Wcij5xBbJN6VhQV9qKxGjg5QbGHyYTwqAUAQsJA2WvBzrdllQg0GUZG5ZTSfHZFtQNoOAogxTjSTRvED2t9vUso5yD1Cb1suNr7kvDSQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(8936002)(966005)(6916009)(4326008)(6486002)(26005)(33656002)(122000001)(66446008)(86362001)(66476007)(2906002)(71200400001)(6512007)(5660300002)(6506007)(186003)(54906003)(478600001)(91956017)(8676002)(66946007)(55236004)(53546011)(36756003)(66556008)(38100700002)(64756008)(76116006)(316002)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Kip1NJkSaxwpMEOsTyQOYfbMQXkm8DeFhn3W4Bp3HxxXQDkr+nwIDhLdp5Qy?=
 =?us-ascii?Q?8oT6bW/0TJ0Pbd/O+Sl9imaqCFo6LtzXLcvDCq9/LdHnvGsnonbgJlMGBv9h?=
 =?us-ascii?Q?qNC8G6xKSkfpieGX/wpyZ/6YyUUx9ULO8hQD/b6indWBiIw6qnDfTWRQa6jf?=
 =?us-ascii?Q?H0cdbz2YlcAL8KoOcC8iQnOUU8pSPfFPFSK0lXqQYt6VCCPsNhfAksoGbLSl?=
 =?us-ascii?Q?DvKuNOZdXKeQXLnoh2cK81yyDBFtGc6xWfRg8U5TIgo14LkxwNaZ1hDdRYRF?=
 =?us-ascii?Q?aH/0pWJCvvf7pwZHkMje0/fDZ6Of8zgrhDX9zxJ8PaG6tCs08ASYC4CPmhRp?=
 =?us-ascii?Q?0Ld7k5RV/VDMNeF/tNO4ebek0szZI/dFlFiQr9z3EBAUlCqHUq4TEHDBcCeU?=
 =?us-ascii?Q?zW+8ni7a6kyvbrdcktGq1UZBECgTMKiz4KkqaaGrxyDTBX/eVcBIVGNVR88A?=
 =?us-ascii?Q?XXd9bY7y0+VyP66KZki0K8/94hSHqXZ7050hIE5efVy196RHXpKxNL4spzMp?=
 =?us-ascii?Q?rLk387Laj48wBkgQ5OBCSISrYaMcpI6Pe0aIbfmPZHeWFhC6NrufJEB2SeSU?=
 =?us-ascii?Q?Djz2n3Dn9RvMQ2qjS0gSeCYQpPBXQO5oxMjFLioAlZjZ12ku30xn9PgOodTb?=
 =?us-ascii?Q?sJd0Yp43lW1yUcdZnaLAfMiL5aPZNPdDWqHJkhuKPh2VROtBxIFh5ioTYHiA?=
 =?us-ascii?Q?gtUUTVztR5rg4UEZD9RRWsMUgpyax7RhdgYDBZJLANP/Tzpmoj4vG5u6DKqT?=
 =?us-ascii?Q?OxsRvWyksTVLO9TxsnX9R97LFqOuOwr6NWRuV+sjIJTo/EDI4jQAy9hX4Rli?=
 =?us-ascii?Q?pw4EwXAx8MTnxemMRBLtx57e6AJYYUmB9c/07nUdQE6Apy4PkC4KIWa/aSr9?=
 =?us-ascii?Q?Oz4HVRZJdFREKmvu6QOzg4DJUvvP4Ta6V2FAXTf4SLZtsPqTdhN0uIk8+Co0?=
 =?us-ascii?Q?r6E9pyc7JNKSe5ZwWVY82QCZzj9qEwGcSQb1+Mhiu9f1lahKXo+xAAyjtf5c?=
 =?us-ascii?Q?+pmD2sAXg5M5eFJAmK1FaP/euNynk1EH0+AZZnqqTd7NOxKuYpOGllarPWZQ?=
 =?us-ascii?Q?sNjwB8oLtiyod+4jCMXGzMSy9alPGM/dBTh353gfYUUjzPBNLgmLR8yW42ZB?=
 =?us-ascii?Q?FUt7JCnzh+hY0rweokjGRWX+bzXW9k9qIyS46fsQUA8d7bXTs8kjSurWElvA?=
 =?us-ascii?Q?7MLeefJgQmbzpd5du+H5atsUQlkUGxVqCW5PWu9Om7ULki71Mf4+xB79qSUY?=
 =?us-ascii?Q?sU4w18wQpNPcrMEMziPWKUWsanT+kHwQRt2Kb+CfQvCcekz7BvyEv5lJqSZ+?=
 =?us-ascii?Q?U1QWLYlzWkK+xTlAKSgtcQxLfrBJZopmPZl+XDt104UmpA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <31ADC93EE25C8243B33C9E47A271F057@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19d3218-ff25-4067-0725-08d9324b003e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 11:19:55.6382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PhzBXRx33OfxxL8fQFRaznVGFUKeYvvAs+DSaBieWSjt37UwNJasrFabVsx8UVq0ass8ca2fLG+bSYEuJyj+WqEBwH4LaqKE8qBrwVxYfzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6366
X-OriginatorOrg: citrix.com



> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> For structs that have a keyed union, e.g. DomainBuildInfo, the TypeUnion
> field must be exported so that package users can get/set the fields
> within. This means that users are aware of the existence of the
> interface type used in those fields (see [1]), so it is awkward that the
> interface itself is not exported. However, the single method within the
> interface must remain unexported so that users cannot mistakenly "impleme=
nt"
> those interfaces.
>=20
> Since there seems to be no reason to do otherwise, export the keyed
> union interface types.
>=20
> [1] https://pkg.go.dev/xenbits.xenproject.org/git-http/xen.git/tools/gola=
ng/xenlight?tab=3Ddoc#DeviceUsbdev
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>

I wonder if at some point we should add documentation to the definitions of=
 specific union types, saying explicitly what union type it implements, and=
 maybe what the Type field should be set to.  e.g.:

DeviceUsbdevTypeUnionHostdev implements the DeviceUsbdevTypeUnion interface=
.  If DeviceUsbdev.TypeUnion is set to this type, DeviceUsbdev.Type should =
be set to UsbdevTypeHostdev.

Might be overkill tho.


