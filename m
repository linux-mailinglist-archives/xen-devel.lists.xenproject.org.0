Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE57ADF5C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 21:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608088.946373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkqow-0001Iz-Rh; Mon, 25 Sep 2023 19:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608088.946373; Mon, 25 Sep 2023 19:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkqow-0001GG-Od; Mon, 25 Sep 2023 19:00:38 +0000
Received: by outflank-mailman (input) for mailman id 608088;
 Mon, 25 Sep 2023 19:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NadZ=FJ=epam.com=prvs=36323676f0=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qkqov-0001G9-Gs
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 19:00:37 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce417412-5bd5-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 21:00:35 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38PF90ct016303; Mon, 25 Sep 2023 19:00:09 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2171.outbound.protection.outlook.com [104.47.51.171])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3tbckes02f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Sep 2023 19:00:08 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS4PR03MB8181.eurprd03.prod.outlook.com (2603:10a6:20b:4f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 19:00:04 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 19:00:04 +0000
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
X-Inumbo-ID: ce417412-5bd5-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yysm/82hI7XzKvnTv0h7sHT1Hfcej1SHuxuzoK7bEihCsCF9p9evDMdGLxrN+pAItrzvxlQmOqrguo1rlF2rgBMlZrV+YJtYZDq0gEZDR3amOcXDEDc/ACNAcrslGwaSHaq2/HGBsn5w16wKNZDI84pDRx/IsO76ybZ0so7vnmFnBNIx1xcQJIoshQgIMvVj6nRnTdommyauf1O5yaIuRBEMRJw95q8C7z7xlYHd5tRrxxEV65OTmi45/pEm9eB8QsJUTWQZ4OQ0OxGJ8QbbHU0ebzR4jk0xk/iteadtgdYzWs1u7cMgoCmvD0VNLZJ/RxD2Sa5TTrkEpwDy1g1Qcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/OmtigUtL1lxpsBRCVJyMs0Iq3fnMq4OK68yx0cMR8=;
 b=Dv56OZ2XMB72srEMt8/ismsPPwqGuQSFxcoqY91Vjc4zGEr7+gTTm59YkdRb/D4D/89rH3LtJ6alKGG+jFQ0d4XWmBT2wMU5fak/eovuMAGbiI6M6sRV52maHk07lzniwvtF1TBUOgwYCuh1LgsJhekaJf2MYPsZ7T0IRszpcu0kIUQaH4aUOghKWrcqHjp4xy7sSqO1Nn87BU3x/xa7wJJalbEVCuPIyQxnJJOBWOu2V/x9b+Roo0X6jSGN7OgXSlSWe4pwPnMNZCvP3YOcb/QVWW2v/eMLRWMbZBw5uH0Yk8y1K0PTG1fv5BzL250vil5LguIPSEHcFCjaTkRqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/OmtigUtL1lxpsBRCVJyMs0Iq3fnMq4OK68yx0cMR8=;
 b=CvxaTgWUiHTjWcxKuZVM23SSY7ukk3b0bew/ZvLjHKKQ/AxNRL5+pekMUsihvHUbxfDNqtiPQF0LyXL4u9+iN+jsaDw/CkWeQYJy/QNQiFFlHEzQ6SmfM7Yinv4Ym1OiEXM3PD6Pua7FMpQZB+R1d0HOY6446oO+RWuJwSN1YegCy7Agy7MDuzbqKXXN0I6H9grPnSWis6MHRz+Z1/k6zwochzDPr+T4tYa56i5p0iGFClww/SKp0pPs0pZrMSVN9aENrh3n/9v0DiVCW2KySOCSiX14DL3RLVDpHbF5azz/8xH9TwYULbTCD6PM+Psa7Fmr1uUgRL95kel/2JKLKQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Henry
 Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.18] Re: [PATCH v2] ARM: GICv3 ITS: flush caches for newly
 allocated ITT
Thread-Topic: [for-4.18] Re: [PATCH v2] ARM: GICv3 ITS: flush caches for newly
 allocated ITT
Thread-Index: AQHZ7aPwbLIfEqCF/k2PKMU6gFIgCrAr4kMAgAAG4gA=
Date: Mon, 25 Sep 2023 19:00:04 +0000
Message-ID: <87lecudqon.fsf@epam.com>
References: <20230922222710.1383808-1-volodymyr_babchuk@epam.com>
 <d4ab6108-b190-437e-bd15-af9afb086794@xen.org>
In-Reply-To: <d4ab6108-b190-437e-bd15-af9afb086794@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS4PR03MB8181:EE_
x-ms-office365-filtering-correlation-id: 5efb0185-ddb6-471f-5a2a-08dbbdf9a088
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yUfD4+WK/9KvT2Z0v1jhflpM3p9Yi9j28ZwGZ8DpHvvYxDx/rvT4eBdlTHR2wT2wsERNPxVQL71GUlTYyZTIplRqv1tRYfN7vlDRSAyIVKO0uPYnRoC5cBifG07xw7YMKxjqE8YWZ86jm/2wpg4CHDCaY61q+kC1z3EmuEl7EdnWI/FKVyTUlNByXq2Z4QFbxqOSQbYFN87rjMWILILXOfdnUMjfGIt74zBlPTPAmCz/OPXnAASKg/k1v/U64OiClXIAUcgiAuaEmz1S+PuQNEfjL5E5Z0UVS5PZ2EuE2Oi/iHRt/ypwkh9bwHeUQEM/VO0ZbO6hfGnUwJCOjsNkWoTltIokhSl7UrnHtRzsAvqOFbDV09cvAozTVrMtfU+RDuInVxvvkEDUwcNDZjYNq/Av+lRt5Yj203FMSyWGNRZNbtFqDIjk5Nu5VQ5Q6C5B7K+sTWJZUrpSRITwOYh1Bp0vmni49kIhr1+Q+vc4u5x3T0dRRolWghNI1hgV7OWXiSts4U9qsP8g/0+bx5KY/ZREa1jSADatSkhr6zLDOGJQiJZi8gXLaoxh71fjWGkOxa+3GJCj/Co6TW7gfOWxUQt3pPKRifQLYewL8MEHCw35lm19iIZE0cJZsbCDolkb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(451199024)(6506007)(53546011)(6512007)(26005)(55236004)(6486002)(71200400001)(2616005)(66476007)(66556008)(66446008)(86362001)(76116006)(66946007)(91956017)(64756008)(38070700005)(478600001)(122000001)(38100700002)(83380400001)(54906003)(2906002)(4326008)(8936002)(8676002)(36756003)(5660300002)(6916009)(316002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?t8TpCvv9SpS0pzBopqi4sFgwhRLnwmI040eEAjAY7IrYp4JvvEwTIPpAeo?=
 =?iso-8859-1?Q?tNVpTHEfq6jcX7AiZZtYPlcDzzweVYdmESQQeGoloth7yO+BIrJeYA5/cm?=
 =?iso-8859-1?Q?TEL9rCKHuTwVWctDUXj2+ILg+ue6pQ6/HYn/oRBjhyw/NTxaJFh/pfqCow?=
 =?iso-8859-1?Q?lIPwFjnl3Ax1CuXN8KoZImHJ6IgMHQs0CvUk7Q8LDSd8e6cCYnIHgJRUEQ?=
 =?iso-8859-1?Q?Fb1dIljt2ovKG0zYXPAoLksmYof15hZ7+fqqRwTtXszMArd8+RozrKP70H?=
 =?iso-8859-1?Q?AFkq1xVB73eF4dj2XytnSuE+9Vd3EBn95JZdqrKl9zxDE3WEoMeqCeQMID?=
 =?iso-8859-1?Q?+xQUJOhWSqMwRSFYh3S2HlPbpuJZSvG9wsYKzzq6gAEj3cts22s2r91ofL?=
 =?iso-8859-1?Q?oJ0FAUPafkKL6LFE3D24fUPnFb0UTj2YcV/u7QYWrnLb6BppdoVBMMzENm?=
 =?iso-8859-1?Q?qRRh6Y+i5O+Nk1EuZkDLnvOLtb7A1WuU48YSGxRK6E7JYmL/PJNX8jVOCA?=
 =?iso-8859-1?Q?OHUuPPepkBkZwEcEC5BfoTg0EoPLib0iXtBfc+/8lkH5RMDmf4lXsiIVHR?=
 =?iso-8859-1?Q?mJ0JVAe1d2IUPNLAgWHOAnwsFlkUIv5MR4rflB+hgsmebrpbwbX7Xpi31+?=
 =?iso-8859-1?Q?CyR6xd8xTGhDo6SpMshB5RH5IUsdynIiWS8c5BqHD7V+xtVNVAKoL+KlnO?=
 =?iso-8859-1?Q?60ZroIFzocJ5Ua4gsXQiFzebYgs5rrTTotrKFYi6pxZOXFqbF/SH220qKl?=
 =?iso-8859-1?Q?M2ui/CuijnfzmUmRMZmJVoTYwLk6raUqusrb2P2b/ej7nHYPsjFHM19ju6?=
 =?iso-8859-1?Q?+ohME3sk9BkIg9vLZ3gpMXMArIeJSra5Ph6LpvddkoAT3gkGscw3K+Lud2?=
 =?iso-8859-1?Q?g/Bn9fs5I9b9O+lmv2JoQWRALzW7NrkaQTB4HNEaQnuknwfnpSYLl5lSym?=
 =?iso-8859-1?Q?8myyTmWDZGhx+/s+6weqSrNHfyprmD+fct2pCHKHs9zOmFSTXEFyWXGipU?=
 =?iso-8859-1?Q?ZQb0+NZadBc00/daQM0AWyJCCbyuz6eAMXObI9TgMwk4bWhCmxeulvmmYc?=
 =?iso-8859-1?Q?YqCM5meYQEMbAt49F503JXII7N3POXUIGvnBu24o6JDulR2EbhHIsais51?=
 =?iso-8859-1?Q?+4YLUq3Miw+ZeSPvGwlkw6fV+eBw5Xb9uerv7btALfzNEFoJEe7OFRe4Yk?=
 =?iso-8859-1?Q?W5xRGmyizX4fp6y7W0TozffgYjUDZyYJC+ql7jKdKwYoa+NJWh9b/WN2ef?=
 =?iso-8859-1?Q?H/eWY7U5XZDawBPjSHKMBEgC+HldiDBl+i6IZl1HKcdXLEyJWT4QFc1sFm?=
 =?iso-8859-1?Q?i/ClVV/C8ZqT6ARN9zECcqL2VmAVgGrWAO9BbTKyUF5/UuYUSO/y86zcD8?=
 =?iso-8859-1?Q?68hfgo2nXakg51Lvpmm+ShTvP1sXd+eXigNZMEe5rKtqS3ppp32socN6jz?=
 =?iso-8859-1?Q?vdAaUtSvGp6S+Bbf4Tt5d766RvpHb2abIuhYE0MRC+ZbNaDgsV6psj1b8q?=
 =?iso-8859-1?Q?Fzs0xeyf+A0VJIUkGefgVu2oCGutrSoDtED5DQgDrPI5Ltt+4ZdhifsEPL?=
 =?iso-8859-1?Q?OdmyUXvimpIuqlV6UYSpuSjJUphAhZSUg0vJGR+Uta046awbCgicIbGQKq?=
 =?iso-8859-1?Q?gZyO8cSX4ZfHjqHAqRdpU9Twe/q9GzDI7dM5LuWA/V5WmW/TnlEtMMjg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efb0185-ddb6-471f-5a2a-08dbbdf9a088
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 19:00:04.0500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /xypYmrMSa+p9JZxxGAm6cVRjlf2WnYcw34pKXUHtLQTMUfG7VZdv0UP3do+QjeZmV7rnyjWmyYSlneWac6RPLBce2KtznZqSw5VyJPt5kM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8181
X-Proofpoint-ORIG-GUID: 1BIRCYRrtHfk9HS4IxIE12M5ayYwXj2J
X-Proofpoint-GUID: 1BIRCYRrtHfk9HS4IxIE12M5ayYwXj2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_16,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=676 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309250148


Hi Julien, Henry,

Julien Grall <julien@xen.org> writes:

> Hi,
>
> (Adding [for-4.18] in the title for Henry to spot the request)
>
> On 22/09/2023 23:27, Volodymyr Babchuk wrote:
>> ITS manages Device Tables and Interrupt Translation Tables on its own,
>> so generally we are not interested in maintaining any coherence with
>> CPU's view of those memory regions, except one case: ITS requires that
>> Interrupt Translation Tables should be initialized with
>> zeroes. Existing code already does this, but it does not cleans
>> caches afterwards. This means that ITS may see un-initialized ITT and
>> CPU can overwrite portions of ITT later, when it finally decides to
>> flush caches. Visible effect of this issue that there are not
>> interrupts delivered from a device.
>> Fix this by calling clean_and_invalidate_dcache_va_range() for newly
>> allocated ITT.
>>=20
>
> I would consider to add:
>
> Fixes: 69082e1c210d ("ARM: GICv3 ITS: introduce device mapping")

May I ask you (or Henry?) to add this when you'll commit this change? Or
should I publish an updated version?

>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
>
> @Henry, this patch should be low-risk. We are cleaning & invalidating
> the cache, so there should be no change for platform not requiring
> cache maintenance. This should hopefully had support for more
> platform. Note that the GICv3 ITS feature is still experimental.
>
> Based on what I wrote above, would you be OK to have this patch in 4.18?


--=20
WBR, Volodymyr=

