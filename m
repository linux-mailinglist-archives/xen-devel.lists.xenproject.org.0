Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F213514D8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 14:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104428.199708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRweg-0000ck-Hx; Thu, 01 Apr 2021 12:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104428.199708; Thu, 01 Apr 2021 12:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRweg-0000cN-Eg; Thu, 01 Apr 2021 12:42:34 +0000
Received: by outflank-mailman (input) for mailman id 104428;
 Thu, 01 Apr 2021 12:42:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRwef-0000cI-5Z
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 12:42:33 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af79d1b0-af77-4612-8a82-dbc6cadffa7b;
 Thu, 01 Apr 2021 12:42:31 +0000 (UTC)
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
X-Inumbo-ID: af79d1b0-af77-4612-8a82-dbc6cadffa7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617280951;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=c2FAstd0dm59Kju/X4V60meqn2OKdaSyzGFeglxU81Y=;
  b=bzl2YjhGVSKqIdD7fTxoha7BaPm1HJlNzImuhPOqjJ1cuYRvyT+aaTNq
   uA+VDRp2ounrxoa6b5PLngA35J6nFecJq5GWBPRAC8l/F6L2VumeR0D1F
   IwBMVHKATpXYozZp/aY7WJ3ket+2H9xxB5LdX5QojmYqfYM9vA4BhhAkX
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v7T7UkFmw1OXSdFKt3kxpk18i+95BlV/TQ9nwClFkiLDJejp/YXrfofgAz23YGWcWYT1beVqRq
 PR+Is3xOwTf3HXHDTS5jc6upLUXca4r85uVOz+/RFvmYJ2gaI6KF0pCftZviS4jLNXY3ktm2pV
 2YutuuEMrpVwq0V591dlj8zITtHwkh6MK3ZIUeetaKH/Qz6IxQ/OZUKid9G3uV1JaeQkISOS11
 xPa1gSo+BssvADN3l5M8sBaYzZnBvf036v0ahcf4Pvrdnr0MPa7/oWD4BoPp8VXk17gZzKSs10
 NnU=
X-SBRS: 5.2
X-MesageID: 40547795
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:43yJG6gPa/oWHC/CAZZWV/zAEnBQX35w3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGzGdo43Z2j+Kenme/Rwx5WPHpXQotn6Bp0DRveMmAefngLObMSEp
 2A6s1b4x+pfnoKZsq2b0N1JdTrjdvNiZ7gfFo6HBYh8gaDlneF77T9Hhie0H4lInxy6J0l9n
 XIlBG827W7v5iAu1Lh/kLwz7ATotvuzdNfGNeB4/J1FhzAghulDb4RIoGqkysypIiUmTQXuf
 3thztlAMhp8XPWeQiO0FXQ8i3tyiwn5XOn6XLwuwqaneXDSDg3C9VMiOtiG3OzgSdBzbJB+Z
 lGwn6DsN5vBQ7A9R6Nv+TgbQ1glUa/vBMZ4IoupkFfSocXZftwqoES7SpuYfE9NR/684wuHa
 1SCtjd7p9tADSnRk3e11MfpeCEbzAWJFOrU0ICssua33x9h3Zi1XYVw8QZgzMp6I89Y4Ms3Z
 WEDo1Y0JV1CuMGZ6N0A+kMBeGtDHbWfB7KOGWOZXz6CaA8PW7XoZKf2sR02MiaPLgziLcikp
 XIV11V8UQofVj1NMGI1JpXtjfAXXu6Rjao7s1F/ZB2tvndSdPQQG6+YWFrt/Hlj+QUA8XdVf
 r2EolRGeXfIWznHpsM0Bb5X5VUNHkCQMwYsts2QDu104f2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gF7k3DYA69vDHhH1fWPmDv95N5F6bXu8IJzpIWC4FKug8JzVCw5sSBLyxeorU7FX
 EOZ4/Po+eeny2b7GzI52JmNl52FUBO+ojtVHtMuEsNKEP7cbEKvt2FYmBM1H6bJhtyJvmmUj
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtMBgKGZ/NzkfZk5F54iX6R0GWzwZlpIsDcvjF
 0GRB4PR0fZGD+rtL6si4YMAvrDM/Nmhh2wHMJSoXXDlEmVqM01XEEHVzq2XcP/u3d2exNkwn
 lKt44Wmv6phCumI2pXupVEDHR8LECsRI9gICvAToNOgbzvcBx3Vg6x9ECnoiB2XHHr+UUUjn
 HmNguOd5jwcwFgk3hFz6fn9051fG2Bf0R2Lmt3q5F5CH6ugAcM7cabIqW0yGefcV0E36UUNy
 zEeyIbJkd0y8mwzwP9okfLKVw2gpEnPunQF90YAs7u82LoLI2DjqcdGfBIuJ5jKdD1q+cOON
 jvDTO9PXf9C+kz3RaSqWtgMC5oqGM8mfet3BH+9mC30Do+BvXVSW4WDo0zMpWZ72L+QeyP34
 g8hdUpvfGoOmG0c8WY08jsHkt+AwKWpXTzQ/AjqJhSs653vLxvH4PDWT+N0H1cxh0xIMr9iU
 t2etUx3JnRfot0O8ACcSNQ+VQk0M6CK0YmqQT6CO4zd1NFtQ6tA/qZp77T7bY/CEyIowX9fU
 SF+ypG5vHfQm+N06UZB69YGxUdVGEsrHB5uOWMeI3bBF/0K6VN/F+mPmS8d7EYQq6fArkUpg
 t75dbNn+L/TVuK5CnA+T9gZqRJ+CK7RMn3BgSGE+tB6ca7NlSBmbHC2r/GsB7nDT+gL10Fjo
 hEf1EKZstNijM+nJQ6uxLCOpDfswYgiR9C+jlpmV7mx5i+7GraFU9ANxfFgp8+Z0ggDlGYyc
 Lf8eaZ03zh4D9KnZnbfX0gD+1zJw==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40547795"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRQVCnnwJ8L4T+RAQ0JB0TX5KlRs5wsCtR79MReFXVguIdtQYiQeHYMjkmcnBjpFiQIrQExmI7J8VXOx/14Iq9ixBgYFKrktrOFPbiB67GaB5PMd9ihQVKjPCgBOwgu8r/w7rJpNEDfho49i1s3bYIwLB6EGJDlAYf9Xxmm5C1KOtB7O4o/Iocqq1h3Ppn6byw1oBOKDEeIf9s8rjXPnz7wI/GgVKA7zo8PZxHoCIVDMq9i0S37MTqDOze4+7t8BeaxmaaeN8rAb65P1htomVTrqCH5E4HtkjntRkyzyEjvFbwPiJKBLcBaZG045RZFUupql7LELRCCmiX9ms9ug+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2FAstd0dm59Kju/X4V60meqn2OKdaSyzGFeglxU81Y=;
 b=e8H+rnxjPxts/iveJFd0xrvBZptFGjaTtSaZ7jVgyH0Y77OXt8RoKRDcorFTPWGGeSW+BHPYwdX1uQlOkGhS5WMfU5AvWDsKzhjlS3Xr2haLtpE9S+DoBF9a/T8iOjj549w2c1b9Cbo+DG4U01dIb0it+/1xxSlgdEWQjoyalnngsf9SNhGY2VNIeWJfFQ8n2EG/32l1WdOIhAOVgeMt5H/odSqgF6Nf89u5YQ3fNja35ZSGSmGDg8vV/sG5lj/3DZmHZvN+6D9hEglSbx7PRGE0dw1x30icfBZ4+zG//W39dyEHAkpJmHpIvKCG6vnwE3PewYarYRqi6B2KpAEpGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2FAstd0dm59Kju/X4V60meqn2OKdaSyzGFeglxU81Y=;
 b=oFpVmHcvAkPF9pwGvB24RDIg147MtPuVJuNZiAe0nPBOvjUJp6f1/a+MYU6wFgkT/LaTvnCDAysdggPaCReoCtrJdPGKaezd7nK5g0e3fy6OUHCIc8RptY8vx1uBMH6GyOk1pPOVxnrG3fBVW/wrM2GD+clOv6IWBEkY9k/YqXk=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>
Subject: [ANNOUNCEMENT] XenSummit CFP Extended to 9 April
Thread-Topic: [ANNOUNCEMENT] XenSummit CFP Extended to 9 April
Thread-Index: AQHXJvR5JYhNZD80kE+cotELBxeaNw==
Date: Thu, 1 Apr 2021 12:42:27 +0000
Message-ID: <D7FEFC6C-D06A-40F3-902B-B7F892020C4A@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26a618c5-eb11-4aa7-fa4f-08d8f50b9baf
x-ms-traffictypediagnostic: PH0PR03MB5864:
x-microsoft-antispam-prvs: <PH0PR03MB5864BBCD1F89D01F3B1EB19E997B9@PH0PR03MB5864.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xl1+bnPN/FAmKn/T+/e+8X8OFTeEJwihqspvQEg1PlsYjcNz9zViYxebgMLng89enWIJjpRA1H67Xop4gZyPDrHopfhxsAV5AXiJD/yT6yohLw7yj+RZk98yAALWE+wrTKjEcfUaShDTDTji+w2Ca3XOwXpgh+/SUDC3fz1u5UNH0eNsL6Ypo72XZyR+QW4pfOvGZuFMBndVZzy5sGq6zrCVyP9b43M0hBDi7K2SJG0XxmjtdcFsfCrE5QN6eBpBIIY5VlFmq87Dp2WjWsSPcoc+zMK5I8Xw/cBBpTSlJWBeNAbJe299uzyZzwoTwq2m0dQryeGn+6aH9tunYWMYvXFThSd315ivG93B4kPVhwViprNywyBMEBnHJQmVFkEFoNNwNPtHdBJS40PjHvr49/xDUmxQHA4v/2aw1i9T80Q4pYJfuQzy3+yHSUh02xwbJWgp+oHD49Y7pspHMDmK1Ecc9ZfCF0S/UxHlKCDF6XDJP7SUfhwkOn72jLZSQGjaQn5l/xcpW462SQJdysI2AzKLdHxxm//b14MGs9mRztXd1duFf10yqr3LMGShvM8neNE7PgcPWxT8/8ryo2HFNBuFyNoKK5cjMB7O1G6IflWJr85aXlC2z5VHNzFQvYCUTisjz3Af6LPe3erqDvU8ANsFBoiaUV4G8csbvfNs9I7TvjRrqVnnFtuvXDXYIbFB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(76116006)(26005)(33656002)(8936002)(2906002)(86362001)(110136005)(6506007)(8676002)(186003)(450100002)(6512007)(36756003)(66476007)(66946007)(38100700001)(2616005)(66446008)(71200400001)(316002)(478600001)(64756008)(66556008)(91956017)(558084003)(6486002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?TtnFQZxff4Ctb0NIobWudCF8hiJ/8sUMRhzrYJss6/M6UL8ZkLJNKlM0fuQI?=
 =?us-ascii?Q?7RZHc+45LyN7FpkJ2r6fRNJkxfWuzlMnVYdJr1UGgy3e7EQngUmMvU69nuYz?=
 =?us-ascii?Q?w7BqYVP+jXPkHb/X8RQsF867JlAfxsOOtc/LHaeR0IRbYa1nSxsmwMKE1Vzs?=
 =?us-ascii?Q?tqvuFFAdwWFaU2FWTiVhFonKhBFViJU+CC83ZCoFqTOMX2yUT4e+7k82k4O4?=
 =?us-ascii?Q?htZuBRB+D1Ks0zEYG5YYpU176ld2jJv3S1X35RwWIxyhUsGmtx2u5Xm1eLXr?=
 =?us-ascii?Q?HeZhYt5IENvBjS+Gj5Fkq+5gVx4xZ+bCn60kshCUUeVTBKQKX2rhdTDCM/rm?=
 =?us-ascii?Q?iSHj1cL1Be38tNSM2X80x+OSUge8D4BBBTGwir81E5UZ3kcHE0quI9F+K7Ds?=
 =?us-ascii?Q?9g4kh5ZEhIV5HczMQAeoST7IwkX4eBYet4KdTrEcYbs4za7km7IzSGSbjVM5?=
 =?us-ascii?Q?oVc6lb8CjsdoHT/B53smpZClyQfzyBTW8AgQPybU3an+HGdmEmVljU7tvvE7?=
 =?us-ascii?Q?k5DEvVPBIOmIMT5OSMjEZZYEs7nOQuANIijTS88vfJ8NYGMR6K4ef3429yw5?=
 =?us-ascii?Q?XUzBejtp0+pLVTl/hPdY7eqeR+rcA1EmBasDcQpcI3rOC5pVm1kIE6HNueVC?=
 =?us-ascii?Q?Dn7vcWT8I7abAA11lPc1SL9ZxjfOq1HfjIR0enhoHY8mhYf0QBPRx7IxKS3I?=
 =?us-ascii?Q?UCrfu2L3jJrlpL6MflgA1Et8bL58EaWSDVNYCMggAmu180rteOTFMc+pJ7Kv?=
 =?us-ascii?Q?Rb7H94vduNK3B7Po/VjC7TMrQdrb+kHUx9vtLrQ1AxOZ13begyhz+Cw8SS2k?=
 =?us-ascii?Q?p9XoWfROA/ZZxhtBaL95LcTOD5zqhMshsEkF6Ce7SidRdcgV23lr+3ntMnSp?=
 =?us-ascii?Q?/6ETxXkp1D6FDfmwdsoYOdOsZRWWYnCe+Gj/zk3cfbTZ6oQkJNxSq84artYe?=
 =?us-ascii?Q?eO/+bqlVCGF+PFlND/WQXXPAPREdogMLnh9yrBDqEQhhcprSEGAbvS2pqdT+?=
 =?us-ascii?Q?bV+bTxG2zH+fdrfflilLIjc6JkqQTfXDdR83buw05EKgAq3iY8UNEqcZnAqA?=
 =?us-ascii?Q?pKrRnObUciYfKpQ26feBwPy5r0kVXNCkT4ntSr2vtDXaVOFuCP1iIEFt+9Vs?=
 =?us-ascii?Q?CVOi0EAPAJLxLPzuRuXgNp/wXrO1ZVrpoQgOxpwM/qwDgGJSofI1pNWsaUVL?=
 =?us-ascii?Q?5nkyaRaQFtU/fK9cOXoLQCyzKwhAx+d5euQqPydnjOgIyoCbXgNZb8LQzviv?=
 =?us-ascii?Q?vwDYXVn1QCgba3i82LNyar4xWPCEn5FRc/NanVb+Am1qMOWTsq5v8ySQyrny?=
 =?us-ascii?Q?3v/wotg0c2yson5v9cqwV4gmAzl45GYDWLViXK+3krtO9w=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FE24DBE060C5D847B335827CCF99BBB5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a618c5-eb11-4aa7-fa4f-08d8f50b9baf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 12:42:27.7276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +JQdQKB6XT6DT+VnNpO2GnEn5fP70gEbKwrlhGPDd8q2eJhuORZX/7M0A/QxjMwIt8GqylNdSu/1MOSG0tdyot7pgUw3IKgOBH4Eijp5GbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5864
X-OriginatorOrg: citrix.com

FYI, The CFP for the XenSummit has been extended from 2 April (tomorrow) to=
 9 April.

 -George Dunlap=

