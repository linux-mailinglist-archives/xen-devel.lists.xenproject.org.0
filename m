Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B263AC9D3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 13:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144488.265937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCeM-0001rE-5D; Fri, 18 Jun 2021 11:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144488.265937; Fri, 18 Jun 2021 11:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luCeM-0001pP-1e; Fri, 18 Jun 2021 11:27:02 +0000
Received: by outflank-mailman (input) for mailman id 144488;
 Fri, 18 Jun 2021 11:27:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luCeL-0001pH-Bj
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 11:27:01 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49e9fd31-7be6-40e3-8fa1-bf030fb56409;
 Fri, 18 Jun 2021 11:27:00 +0000 (UTC)
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
X-Inumbo-ID: 49e9fd31-7be6-40e3-8fa1-bf030fb56409
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624015620;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yaY5N2tOVkTtdixDR7oGscyi7yL+PzB7ecTsnjFt21I=;
  b=Oi4dwMFjbY5mPblghPcqF7ovk1lsjMHNLOiGYeLUg7gD3RVo5tSI0T2l
   9xKvjdC69yTY1pPD2rum0Dt0SBryDkWzbqPdQZkaiPeblAHibguvK9e+U
   fwY81LOC1FBDHHGj8Ft+31pKn4Or334+WH+rKuRl/Yv1pDmZqNovMWytO
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JUa+CK9JZNyUc/NSgVFg7sTc5KfQscgOYni/+vBkJEaPv9dtfwWvFesc07P+h1xjT3XZUoosoV
 X48277J/7P6mGONd7853k56/Y4YwnI0P8oaKDxovWhUgVgq94DZnDZc5rnInAZljNyuAN+b9aO
 pekSt9OOj5n6Zu0BnahSClRLgjYXwaOnwODAFpdhZlGN8ZXUHNcHYYCsMxEwKzmdUIJAg0ERaN
 zg30yb9M92tbAUxxdhv8jO2eT49eUg0UiwmUYx9iyj7PKy4od/Q3qpNXntnS490wSz2abggtVl
 MEs=
X-SBRS: 5.1
X-MesageID: 46436750
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WgJQwK/aKpp1xFYluQ9uk+DfI+orL9Y04lQ7vn1ZYhZeG/bo8/
 xG/c526faQsl0ssR4b9uxoVJPvfZq/z/5ICPgqXItKNTOO0AHEEGgI1/qA/9SPIVyaysdtkY
 tmbqhiGJnRIDFB/KHHCdCDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46436750"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADucqfusRfRNAsB79eXdcKfO/9CNU8UKnfqYZ9EHD88hB/snKj/yl6a6+vdp9LDV6TDrSHoa2jrguYtTEJVbRlyliFEH+rmFQhzy3AGRfQmm7TQ1HaPOKn09278mAL/n4cV6jvg3F7T1EUKiQ0wIT/a2hD8BNEEG2qFRkF39MqDpTrZAlPDgHy/StXausTsXrh1NFKWMAcWJI/1CCpFJhBFUn5K344rFuvkDPnHF3yyWETWWnJsZCdL8/OI/iz8U/Od4d2qLRxGsog+YLVeY8QLijTRdAxwmkPk6/CpBc6zuHLpE0RCnrAb2q7qVZbcyMPCDiBXkArYOadIEqECv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaY5N2tOVkTtdixDR7oGscyi7yL+PzB7ecTsnjFt21I=;
 b=BXI/zhyqmkDV0JCHAk5MdmeXlEbBjv+Z/u7srrSYzgeDfdWrDEebpa3uC/VdwfXxb+PkOSVYhO8ZbCkBLriMwzu1lfSH7m6NTaMEbIi9sC3lizFgTsVErUVz77WdJfXlXPlZhMGbwrSOiYDRDH9t2qEcCadEIiNpDESW4kI/lHbf4ez6r6fWQk7Udpl/xfRvoOp6osIZlshMLREf7RQhBqOcg4Uy+9nlhS1HGjg0Fs/d92vNnzJFK13tEW7Bjts6ByfLHuXC6MFrBewVpHsR4auYnnNR/Qo8MyZKNWcN793xCc1uXpHlbm9H2xMdH5brBO0wmS19E3WVUmSmH1Dm1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaY5N2tOVkTtdixDR7oGscyi7yL+PzB7ecTsnjFt21I=;
 b=rxLgMBvec/J2In2xw+qWtlagaXSTmyudl8/rNUklOY/K5TQMmZ6aeZ1M0Y3oFaGJCMdw5CXPfT02Ssmw+s39PO7f3F497TBYTEtVyGczHISmF7+TBMgJrCtDhU6IDYXP9pL7yVHxVvS6qa2nnJE23er/jqugQomvWBr/mz7meJ0=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 05/12] golang/xenlight: use struct pointers in
 keyed union fields
Thread-Topic: [RESEND PATCH 05/12] golang/xenlight: use struct pointers in
 keyed union fields
Thread-Index: AQHXUNzFppin6ei2JkOk4VRu7i00GqsZx/WA
Date: Fri, 18 Jun 2021 11:26:55 +0000
Message-ID: <0AAE0CB0-DE31-430D-A58F-B25B50CF8A2E@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <ebeb085b9b4b5d3dddd66607b409590f5e7cdfc6.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <ebeb085b9b4b5d3dddd66607b409590f5e7cdfc6.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34aa0d64-5509-4470-c88e-08d9324bfaaa
x-ms-traffictypediagnostic: PH0PR03MB6366:
x-microsoft-antispam-prvs: <PH0PR03MB6366AD787ACAAB6E5F2B37D6990D9@PH0PR03MB6366.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ahwG7lTcckshAtm+JXmJnbU6Edy2PsZc5HTa33qKgkM6LLK0mc7gT5Cp39DRVC03tXEKyOmnbLUJSu5qsEOVCbJshJdsUFCXnqXG60p7HDsgbf++yOf9xiqxAFxZmOqARS+uXKWSg0MfxmLGWv7BWxl0MNsNiXgieh0eMA1bw8CHFC4GnQ8g7eHla/286rKOXeKAfnQR3ASJFV059prDYU0Lm9W+XWawG3/cli78iP5NjZKHLRf/aVIqyn7qgnR3bMTTeR88HRcIuuRaETsRxnLddG2lEI/aFIjLj7nuQQjti7GfvuoulvBMy29G9fV7+y7SS/8/ePeYELyJzFeAxyOHHQPNZ6c0Uusv/A/U+4ApsBRLUeI7Yjm1A6gKdrT7rXu9pT2X3z1BcIIeUvQ89Ii0y7Rv697fsdjDnr/qGOj8YNGZqFovvapLxqdTQP8Awl/d9pP1WxZ3k0QiEdUsgTiiEjv5klYT5B2bg9NpH3m7z48uN7AMh6giHtc8Gs/CW49DIsJWatgdntA6hVSW4u0bKjldZ7cx6TREbnf2cyMVDmuSzCN4kiRdZh4FX4CQjK4zf58a4HL4fvavaqXcHdoC+7djKERYLvfVx6ssydo/6Mr/WH5k/X0OJRMStJ+EiyWB6d32BtkTkNc4TYT7u0x/11QN6T6m5UCoN4B1eUE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(8936002)(6916009)(4326008)(6486002)(26005)(33656002)(122000001)(66446008)(86362001)(66476007)(2906002)(71200400001)(6512007)(5660300002)(6506007)(186003)(54906003)(478600001)(91956017)(8676002)(66946007)(55236004)(83380400001)(53546011)(36756003)(66556008)(38100700002)(64756008)(76116006)(316002)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CxkwAp9+4FBGoAEbGcCCJ/vJ+1Ylcqc7BIJVsmWXwdxBBcyytsBD2/gMvTnU?=
 =?us-ascii?Q?QeQd8AfQDqmcpF4oMsVXpepO1p0owA3RO48uazlMW3pk0aNaxhyIjndvxArC?=
 =?us-ascii?Q?sdClwOSlAQh7DsNlzkrrzlmqqOqmsbc9aBXxf0DIxkOYlHiqaEEpc5D9i4bH?=
 =?us-ascii?Q?GXWoRoxecS/oQQOH+NiKfI+IjIFbYLbL9n6xJfnboXMjQtUBeEgou6PO6gof?=
 =?us-ascii?Q?8iwJXTTeNu2UjHv+89MTqBKjARTNgdIOTbMcAQUCpPmZbmcHXXNYC0e+Bvby?=
 =?us-ascii?Q?7zG5I1XDm4p+CxXAVm+LqqvnHek/URRjeR80aL0/yUyZI3QvgMFJpyLWdq5Y?=
 =?us-ascii?Q?MMUBuEfQDhNhDyZWnL/6BMR5Vw5iy9obSOAVAVC60xr7Lm8oiqOLgwZClSk6?=
 =?us-ascii?Q?cjjAcJ/KIptzjeCeqGwEmK5XqoEsuKHidAaFcCJFlBBFOuGgyoccb9DXWI4x?=
 =?us-ascii?Q?TAAW6r85M/plC4xh6dLwPZ1O+3pMisoe0OUvRiNvobgQ/BAzHW3+NOeo0IQ3?=
 =?us-ascii?Q?z/qLdvjxqv6+iXyNqG0pYwjdl7Tzafh8PGr83d3cgk6X+b7Z9HNhigp85vYR?=
 =?us-ascii?Q?3wCQl5PS6pVJli5AzHc+RnB3O+v9NTkuoa8zvPjLi4nzdtJjttxhUs+Klknm?=
 =?us-ascii?Q?x8GSvajLaYI50aabb1nfeJOElNYDmyxQVk6VeRun/3k6oxCx6ljZRq6dfC/v?=
 =?us-ascii?Q?WzxLsJzzxhcOw6up/gKfIsLeTjeAwh+OzHPu1GfMLm0EJJBs5DD9l2Lx0GUH?=
 =?us-ascii?Q?o8UiiXvp6Q3Yk6eNJTHNpo8KNvU31y9tPLIITthWVrqZscjUWjkZWs0idRi8?=
 =?us-ascii?Q?2k6peVr50P3WRcAqTX5jTs2rjK4CCrgQkfUQnmIS6W310gmhp+2iXc0Bh2Tw?=
 =?us-ascii?Q?H0iKHEkEWxas10gKFdAzd3zPwUg0kMOwVeCT6OKRa588UN2Fi1dzC12p8W2R?=
 =?us-ascii?Q?Sek8Mx0Hycgphz5hZ+Dll+fvqiHwZY7qrbGnTFcFA8P6roYd8lCfzSpNvQTR?=
 =?us-ascii?Q?EY4/nx/gsMff2XwvJLrU5tLfRCZySFszo8IE6Zm2sDfUGmfOg+v7LKky6vbl?=
 =?us-ascii?Q?XDorZnyAHDZTVwUqRBxMomms76ucKpVmlqfgYbEEnC2r2uWppp0IVZeov9fY?=
 =?us-ascii?Q?Xd+NP9YJSwr+c2t2B6aP6g9N0+DEWWGh1UpFR7f0L2GLs3YhTBgLIjueVuXy?=
 =?us-ascii?Q?Bm5Ad9206Z9Bw8KVfQqDUhwlzz4yGKGGzCDFiRHPLKDkSXq8bjxNcp1XdmMI?=
 =?us-ascii?Q?4wvafWcMA/iiKeMWFSVdiMxiDXIlxk5pCgusHR1scHYxKhle/z4Eu9Mnx0fS?=
 =?us-ascii?Q?5ykEn/elwJqWhVhnwtHKJFR0l2FMEXcMDqZR4DAXqY17dw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C80363BBB700445A428C54DCC04C9B0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34aa0d64-5509-4470-c88e-08d9324bfaaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 11:26:55.7485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zbrjSrBap7eA8n9oIUtoSEqZZs5GbHtt9zrq+O8m/U1ovtQGS91fCK98vDafguivGfrPphFtiSk/kqSlMc/XJR/ggbBD4P54cQrNlaRJSbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6366
X-OriginatorOrg: citrix.com



> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Currently, when marshalig Go types with keyed union fields, we assign the
> value of the struct (e.g. DomainBuildInfoTypeUnionHvm) which implements t=
he
> interface of the keyed union field (e.g. DomainBuildInfoTypeUnion).
> As-is, this means that if a populated DomainBuildInfo is marshaled to
> e.g. JSON, unmarshaling back to DomainBuildInfo will fail.
>=20
> When the encoding/json is unmarshaling data into a Go type, and
> encounters a JSON object, it basically can either marshal the data into
> an empty interface, a map, or a struct. It cannot, however, marshal data
> into an interface with at least one method defined on it (e.g.
> DomainBuildInfoTypeUnion). Before this check is done, however, the
> decoder will check if the Go type is a pointer, and dereference it if
> so. It will then use the type of this value as the "target" type.
>=20
> This means that if the TypeUnion field is populated with a
> DomainBuildInfoTypeUnion, the decoder will see a non-empty interface and
> fail. If the TypeUnion field is populated with a
> *DomainBuildInfoTypeUnionHvm, it dereferences the pointer and sees a
> struct instead, allowing decoding to continue normally.
>=20
> Since there does not appear to be a strict need for NOT using pointers
> in these fields, update code generation to set keyed union fields to
> pointers of their implementing structs.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


