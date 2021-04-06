Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8471E35565E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 16:19:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106030.202749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmXw-00075x-TJ; Tue, 06 Apr 2021 14:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106030.202749; Tue, 06 Apr 2021 14:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmXw-00075Y-Pt; Tue, 06 Apr 2021 14:19:12 +0000
Received: by outflank-mailman (input) for mailman id 106030;
 Tue, 06 Apr 2021 14:19:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9IE8=JD=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lTmXv-00075T-4u
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:19:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42381685-bf4a-4452-8cab-cec24832d533;
 Tue, 06 Apr 2021 14:19:10 +0000 (UTC)
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
X-Inumbo-ID: 42381685-bf4a-4452-8cab-cec24832d533
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617718750;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=u5c9XBbgMDKIZdqg3oA9/xbtuj9hx5VyQxHrwkf4znY=;
  b=T3+QHj6h9YHAbdQxQe5Hr6ngufc6HgRcloyh+5qeYS3RzOqBJXTW91Z0
   CME+MKmFJsTRcMHDRzAjZUEAv4VEk8WtureWrRReGoklBvw4gqjcWmzIP
   A0btXnyXukKyisctv9j0ofdLAWVJkKfHPvnFP3CW0KFN/hRaGsEY7VcPa
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Wb9b1E10YjXy9KFFRLN4Vm0yGUJVycsKPD4apNEyln0746wHAGJLfzKDoEk7zWATw5pBLKOwuE
 OSHZcYmPT+dYWIJpz1ltQ36wKmssGqXO/aWiDEtWP86e2AZGkNyGTbb0Tv+O4VUBHBpspykSha
 4q/w/Q9B8hkAQSq32QjyTO0Dn4oknckXc7sqTzgisAk9pSO0JhcHr/vIicSB3MsIhddqI+hOIx
 QGJU8QdYH1gB3I4siAsHmu1DAXONv2k4CASyMsSlKvqbKOTjT99F8r7xra/OouJpV3ByhezJXb
 rvo=
X-SBRS: 5.2
X-MesageID: 42439135
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nmDMnqigzSqiIE3uTCB6aKfBGnBQX6dx3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGzGdo43Z2j+Kenme/Rwx5WPH1XQotLhj0JbjqzOEtwWQVAGN4YOf
 Onl4t6jhCnfmkaadn+I3EDUfTKqdGjruOYXTctARk75A6SyQ6y4LnhHBSCmjsYWTVDwbAtmF
 K10zDRzKOlrv2911vgx3behq4m1ufJ5/liIIi3isYTIijxkQrAXuVccpCLoTxdmpDW1H8Ei9
 /Jyi1QXfhby3SURW2tpAuo5g+I6kdS11bH6Xu1xUTuutb4QjVSMbsDuat8fgHC40Qt+PFQuZ
 g7pF6xjJZcARPekCmV3bGhPHsG9jvWnVMYneEelHBZW4cFAYUh17A3x09JDIwGWBvz9YFPKp
 gyMOjn+P1UfVmGBkqp2VVH/d22Unw/WjeAT0QS0/blqgR+oXFjw0MUgPEYh3cLnahNLaVs2u
 KsCNUMqJh+CustKY5tDuYIRsW6TkbXRwjXDW6UKVP7UIkaJnPksffMkfcIzdDvXKZN4Io5mZ
 zHXl8dn3U1YVjSBcqH24AO2gzRQV+6QS/mxqhllt1Ek4y5YICuHTyISVgoncflie4YGNfnV/
 G6P48TJPP/M230G8Js0xflU5dfbVkSOfdl/uoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8NRz72KMJc7l26W3PxjRTLMkmdPHDXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHlDv8UNDR
 JDCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PoQcLNkjzYKsSotn3QxEL4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dmSAj3USo3qOR4wGmrKK4Nrkfp9QNOdgZIVBUSHwUzBlkwdjr2
 lOLCUeQFXEKz/ogaK5yIAPCPrHbNl6igezKctSoXbS3H/s/v0Hdz8+ZXqDQMSXiQEhS35onV
 V36bYYm6fFsy2oM3EDjOMxN0BsZGybDKldNhmMYJxZl9nQCVtNZFbPoQbfqhkoPkL26k0Zhw
 XaXFOpUMCOJmAYh1d1/eLB9khuemCUYkRqA0oKwLFVJCDhoXZ80eiCe6yp9XCeA2Fynt01OC
 3ZYDcUPwNlz8220hnQgzqZCXA63PwVT5/gJaVmfLfJ1ny3LoqU0akAAv9P5Z5gcMvjq+kRTI
 ukCkKoBSK9D+so3gCPz0xVSBVcuT0hkfny3gfi43X91HkjAeDKKFAOfcBRH/iMq2zlTe2Pyp
 N3kJY8uvaxKHz4bpqDxbvMZzBObhPVrmjedZBjlblE+aYzvqB0BZ/VTH/B02xGxgw3KIPsj1
 wFKZ4LlozpK8tqZYgfaihZ9l0mmJCGK1YqqBX/Bqs7cUs2h3HWMtuV69Pz2PYSK1zEoBG1NU
 iU8iVb8fuARSeF2LIAA687IGhdaiEHmTxf1fLHc5eVBBShdulF8lb/L2S0d6VFTrOZXboXtR
 R37riz7qCqXju93BqVuzR1IqhDqTn6BcyzBR+BAu5O/ZixP0+Wjq6j/c60i3P2RFKAGjAlrJ
 wAcVZVaMJJziQmhskw1CO5T6TsuEIrk1dE+1hc5xfQ85nj5H2eBF1MNA3Sn45fUjZSOGWZlM
 ity5ns6F3tpDxenYTZHEhefttSC8EdQ4j+ISBpM9URtteTjt0SqzUGZgwvAW46gC382O0j3a
 7R4oShZ9Hf
X-IronPort-AV: E=Sophos;i="5.81,309,1610427600"; 
   d="scan'208";a="42439135"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBvAGu9FcSPEj0eqx/C4wJj9RpBCVzALpax6e1IICG80zuaePAVhONuvc2T54J/5TltJmfDi1Kqy7wPMM1Mv8607fws69mFvOprfC6uM8W16x9b8HS45EUlKcC/GLfwFUiiZEaciafIfs92+kvcea0JvIhVym5kZPpEdxNX1CPaxaDXNwce5XzWT8ullkCLESzfoNpUdYyVo8JZJNZwCwomlsLgcS1i4EMyDp95PUb4z5CrW9Gi9qdA0/6bN9LN9BJs6s8qmUNsJeRnA6Po+gjrcXs62KN3ssI2WHD4/ETbnQB69u8agGH7BCgofQsgr0BtyGiQ9cnfhUqS9ktkaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5c9XBbgMDKIZdqg3oA9/xbtuj9hx5VyQxHrwkf4znY=;
 b=eDxgTL9D+gL7qwKcX7ly2OtafTfoIDso2ZxswjQ26FLGoANprekOnJZyWA8BQqP1+ceTbYQYtNNkCE9PoJ7VvCwpA2bwIgYNJjXHoP6E+PIxc71d1bxCrAe77KR44s1Zi7uMu6CiVp4Cx3QbeiFzfKR210mqbyk7rdW4puPZr5MpL8qMABq5H1Yi6TcVWogErKBCMUrE1lFTLv76+QIzVY0c+WOO/cTsv75wx0CklFx5naKowQAVc9RrvaJV/RgW3knJwGg/KMyhJzHfcQHU6sDravIYCFumtbcFoV+afVMvV3F6SagGXxhBtWX8mHxzoUrGXoFQsay9SdIIimyQ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5c9XBbgMDKIZdqg3oA9/xbtuj9hx5VyQxHrwkf4znY=;
 b=khKhInqCqH4Q+SY5MaNlsME16Fw8xurOcmDlEzf27N+lmHULc5IJSJxAt55O7z4oaU448GOojh7X4yPdLkDNL77dctDtvrfcnt/3BTvhuOEBs0qM3HnzQaScEGNbj+wQSv3UB8II+DJAHw0Z2Hd74giVwh0zR7dP2wury2J/IrA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 02/14] xen/sched: Constify name and opt_name in struct
 scheduler
Thread-Topic: [PATCH 02/14] xen/sched: Constify name and opt_name in struct
 scheduler
Thread-Index: AQHXKjRgzH2T4dsdykuVmMERTuYzlqqniy8A
Date: Tue, 6 Apr 2021 14:19:06 +0000
Message-ID: <DDE49869-1FB8-4350-A09E-92981028E7F9@citrix.com>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-3-julien@xen.org>
In-Reply-To: <20210405155713.29754-3-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60c4ec13-384d-4510-756b-08d8f906efe3
x-ms-traffictypediagnostic: PH0PR03MB6268:
x-microsoft-antispam-prvs: <PH0PR03MB62685C09086B43303E4867B599769@PH0PR03MB6268.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6S/Qao9//ZYVeFws2mmdAbHcSZrb/J9HpJ4aT9q4r+UQNPHDrjtZZJ29+nJz/NG0zznWD0dT4rpp6vx/WN9EvfaGY2P8L9q1eVujTrz4SQhFpx5x93TBLYQprA+6Ee3YSM+ppmzdXV/7qhlXEcWc4DuO5ZyZ/qenyoE591D2zpMOML2DUM0PbyHmVJX5YkKtN8i/KWiRR5N92VMnlL9q8r80XBY/nAjdhj8UCSWWBVezMw26ivCbcYUxlC6fah8vehg+l4N8hrgFQqos8XfRBVTruqAql6ceAij1GVRiJYhUUq/n9KnccBXBpLZwM0yNuMurLctiXYQutcuDnDZDW6PCSJjz7HPyCdSZjSzelcF+uqM/8qWu66Z3pfvZPGVK8wap3m2NUVC9ji2V89qcSKxVItVK97mZBZcqhg6oGPBEZMHVFKr2nuSkQm884BCyZ0i9QWzvqXXIs7AFzGC1VjVPSdz+02eGsqZPIQaLm4cggYWWpt2+ioZ4lkS9nbiyuOyf7xZY6xd2cDYlYc2kFtXJvKmodlJy6ugtAukaYaGZ+xURqJH3SKsxF1QMnqPXVP/OxlMCUzC3jsDVgKyxxvTZeeCwHX95NB3KDbdBPb6XlqTuVEx/GI2vh1ONCJN2CvvQhSdxbejXaUT+4E6JvejVZVgVfnffzqjJTTroh3J5HLDUqLfbrM149KO5uZjO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(2906002)(5660300002)(478600001)(8936002)(38100700001)(8676002)(316002)(54906003)(36756003)(71200400001)(6916009)(86362001)(6486002)(4326008)(26005)(558084003)(33656002)(64756008)(66446008)(66556008)(66476007)(53546011)(6506007)(66946007)(76116006)(91956017)(6512007)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0VqvDMb9vwpCywvG5pfniMcYi/Namdhm0Ij4t1iuO4xZKy5TRFlgg0SZ1wGX?=
 =?us-ascii?Q?qYmt9KapGE2pWinBUUZzf9K+rhwBYMV4C8ILHHOr24XVgUsYuSEHhhpMmC+a?=
 =?us-ascii?Q?vMdmuAXUvpajhbNHwR/xhfGvRhBDGEvzn7kS94dhVjZgn25zGQppPn8r4Kjg?=
 =?us-ascii?Q?UQs2qiwGRCVHniWRw8JanGo+q2+fMwRrEvGG5V+0PuWILV5Q3Uikm5rwnHJ/?=
 =?us-ascii?Q?aPg91sih3twATQbM1inGI3u32orZGeX6ybct/SYl7jz8D0gkJUlLmgM75yez?=
 =?us-ascii?Q?orAUVKHl8EqB/SBBHQdIx68hvuVgNiDl2qK/GRL+sUoBN0f9dkLTxELE1hyq?=
 =?us-ascii?Q?V89qKOQ4U2rSpYIU7UiYJPzZEuNU9uGwIZ71Vh6crBHtSfLdUYx+S3VqKBq7?=
 =?us-ascii?Q?XxVns+zrQPPAv0h7JQcO3Ef20esWaTYd8kBywGkUtJ0jTng3fwCUC9qFv3fu?=
 =?us-ascii?Q?ldUaHB1cq8LaCGWP/dMqXHUkbf8/t8avw5HZWldm9OqpH5aTzkb6eSIN5Jok?=
 =?us-ascii?Q?xet7/begehmR81LQTYRi1W0VxBSTxTs50ulZ8tD9tqNmR2LIBmJZUTimh9hd?=
 =?us-ascii?Q?6lokaLOU7qTYow9t/XaSTGVjppKaZq8NB17SJXxIbYVHlMuiCoWdahrRO9DT?=
 =?us-ascii?Q?486RoEHQ67xUHdpyEap5Er3a5wUg5JDXl7qdUm2HWEg9SG6jmhieThCg+pOa?=
 =?us-ascii?Q?n49JCcoKa7qTzsabzjjfiaFcop9yEDsG9Zpg9HOxzp+Xp1LdecJmVSfVvcju?=
 =?us-ascii?Q?nbmK5TYK8xxfzbNhZGpE6ws6flRaLqRJQu0tAsb6Jj5AYrkb7qIB630trMSj?=
 =?us-ascii?Q?VgBrFOzYMncE6BJXzec5zHuudpvwqE8ZhTAwtHUDtcOZBqIdrMsfUWOGEJtw?=
 =?us-ascii?Q?etXz1I0VMhqM7QgHD5U0dlRxmnAnZEUqm1tnSntbUbp9zSzF2R4/e+TknT1P?=
 =?us-ascii?Q?331bioa6bu0mJAWIpJjCWHMor158+dTpuzrxT2aJm/Q6xDbGuTrMl9mMBDpm?=
 =?us-ascii?Q?r67r51d5M4v7UFEx3LwKfaYZEZ9H5ETzMwWYELG5osXDsAmCrJGjy4UX9zfx?=
 =?us-ascii?Q?jeu5X+Psq14x5tNl1e+qEE4BuaDbY/d1Mb8B9ohnGuLzkho8qV1iufJI5HV0?=
 =?us-ascii?Q?l0GAoaecB9gzcvvci2xFBHjVXEOjXRBbl4oN0KMkHO4H40J0KmDvJybkYGCv?=
 =?us-ascii?Q?QFvR8dNjdB83VeVoG5CDlb+A8vWLgle3370/YyrVWCtFWVbCEY3Soc1r3R9s?=
 =?us-ascii?Q?ah5uWE2XXXuvj9RvCwk2vKaAwyDOANxrdRW/i4kMLCtzgO9p3xPqj6KKV+4S?=
 =?us-ascii?Q?dxoHLXH8dgapKOijJRpvwL3Bg+YDFfoGVY6nUQcFKIMDsw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D8F9F39F85517743B91B6E68800AE4C8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c4ec13-384d-4510-756b-08d8f906efe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 14:19:06.1173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFFPxxjYqYTmA9kgN2xDvdihrz0cvSHVBUnwJS1I8s90PgIQ7fQ0VgmiJkMRWkKVe2WpDZnvfsPJUR4JttaLvYWRYErZQaxSeOgURH7Eo3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6268
X-OriginatorOrg: citrix.com



> On Apr 5, 2021, at 4:57 PM, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Both name and opt_name are pointing to literal string. So mark both of
> the fields as const.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: George Dunlap <george.dunlap@citrix.com>


