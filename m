Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B85940475C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 10:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182799.330573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFlb-0007JN-Rp; Thu, 09 Sep 2021 08:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182799.330573; Thu, 09 Sep 2021 08:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFlb-0007HJ-Ol; Thu, 09 Sep 2021 08:50:43 +0000
Received: by outflank-mailman (input) for mailman id 182799;
 Thu, 09 Sep 2021 08:50:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOFla-0007HD-43
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 08:50:42 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18203bc2-7ebc-4f9f-aee2-8a044f7ba926;
 Thu, 09 Sep 2021 08:50:41 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1898nQs3031071; 
 Thu, 9 Sep 2021 08:50:38 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0b-0039f301.pphosted.com with ESMTP id 3ayf3bg03p-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 08:50:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3281.eurprd03.prod.outlook.com (2603:10a6:208:a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 08:50:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 08:50:33 +0000
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
X-Inumbo-ID: 18203bc2-7ebc-4f9f-aee2-8a044f7ba926
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvIoCU1C4d9RnGGqwH8u1CwTSHxaVbB8PB53MTqF67Ix3+Cet1D0Rb2EOwPGolMOvdwmq+oEjTxbm/zH++Gda/Cx/6mpt51A2Kn9/eBhtLc9IfqUClI8fAkoKf5Jrd7c3eLml/ixebDY+0hffHD/m6F45YfF5xljOZW/2K2Sb5M2IDQe3Dg3xLgwA5Q+g3JdVXeK0I6tetYFvGTW/sQGlCav324cNn9enKC6toq/i+vUqFeDYKwzvvXqz1IG+2NBd+spK3O/+Xmugfa99ujdYaolC46o5isWUuTwO6ZhkyxqFOx8dQULLFIbQ7By3oPupUBbtcHeWI+Rq9fRELVi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=iqLuCiWGA7vzMyytONa+qXpS50N6PCZ5JTuyAmXc0Ec=;
 b=dGWeeWs6sxQrJDVqqSfbgTRoprhCZVJZwDAuRZ2Bvvz31EiMY+JmSt14sdmi6LovG0NoQBNGRF1t92825T3DOW4H/7RoW+PAAplpwLJjw+37OtPTj9fF788Ozxt4jzmChxErt38A1xYe4XFqfgxOAuBK2lRurqwbVzowLkxsOC0K8WK2L4l3ENlUzAFvNWoS/ii4m5lOcfShVACL0C7qq0MsBVUIrf/e/djby9HAKGVs+mgPfjS2nino98oeXgtLQccwJU5dxafdV35Ys1DfArMj3mS0hkJ/9eUoE1UMHyIBIlInvSMJRSNjqzv1lRCpqUEU0jvF1yGgZ9hFUa5CGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqLuCiWGA7vzMyytONa+qXpS50N6PCZ5JTuyAmXc0Ec=;
 b=kFYklUI0p2yyUBCt8CLPWIAZLtmUaXhGbQldOXJ5Gy4gRyeF0z2GkxANTQF95NZMqDxM3HDyUcFm0yUcRi32E8RwX5KEtdEpCbheoXpXZKfESsauPcD61Di5eLv91IHWZU4LBaFmMJRGRREcUGq68tWEuugzWVKAyjdz4qS7o7XRVzr6AWm6ph/x0Z93NH/pBpK8P2b1wTP+RpyPcrV508gqYr3ykOl5Amf1jIei6VunjLwC/KOgiDPrjGTvCMSXHOsFlMc2vO1eqzB3lN8NrfE+jAR0bF2LNIVkA6Oem4iohxewujW0QI1wd6SAxs4IzpNiQQSK5OCBvFcxAHa97Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Topic: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Index: 
 AQHXoKxjFI8WSqpeJkWkpzZfft/zi6uXHR6AgAEZm4CAAASsgIAABSgAgAAIrgCAAAT5AIAAA1EAgAAJNYCAAAPZgIADDJuAgAAA+ICAAAH/AA==
Date: Thu, 9 Sep 2021 08:50:33 +0000
Message-ID: <6d8a4bae-cfed-07fb-d6e0-7587eb85069c@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
 <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
 <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
 <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
 <5d0d345d-db16-f0c5-9a78-4ad5f4733886@epam.com>
 <5ffbd0a6-b34f-4de4-b316-2376211039f1@suse.com>
 <6db7c55c-93c6-7901-6097-687287463c78@epam.com>
 <d78f2211-ff79-6bbc-f8ca-95cf07e3d7ae@suse.com>
 <73697ef0-85de-a530-7601-d8b1490ec5b5@epam.com>
 <f4758911-0927-f31a-a617-9d8566edd2b1@suse.com>
In-Reply-To: <f4758911-0927-f31a-a617-9d8566edd2b1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1eab9de8-f72b-4729-970d-08d9736ee2d3
x-ms-traffictypediagnostic: AM0PR0302MB3281:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR0302MB32812DD6C6D739040B38F4F9E7D59@AM0PR0302MB3281.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2dd/pFpK9FIm+2GyWs5bYh7bkPLTkaeMO0tA8kAkG5cYwGuxaU6dbZwQe4xAVKnUb5Ixe6wc+VX2XEUWf/WJ7tuCabOdOdztqfyHMDkiQCjzPqC+YfBty3B+7WNmyPTr01aPw5MECgHoZ/DXZrm8s+w2UQ5o0z0XuDXTYR5lgZNM1hNKa1WhSQfyFuZqRmTQVISNDA9WhOwSEWzNxftZZUgh6UJDrri4RsJpftcvZZXdKj6THxz80fFYhcpwVo9A2gGjGenGYiBkZI0cXoNEsNyN4LlAQB31UXr3MiaD8XGp4AoaunGHTmZ279co10Mij3KHIqJHAw3b1MjME7bvBYv7eyBjgQ0eeLWPjqL4/jaLn7RFuTUAVqFKtf4ckvu2GyqCu77qkzjbp3qyzu1k1ymiUbgyPHqZThND0HWhjv51+KhW6+VaMRBgNpC39o9t8qUJvzcILOdqspNbGNxF/JmR6OuhVowXVdToPectTfRTsMwxEQ6fo9YV0H7HbxIatzOLEeYeHtbSbm9B9xOOQTxeR5Phz70E5mewLffZNsXfFbfqffmXmbh6haEmfHgrNzRsEjqgySeuGBI4u+ra4cARXtgEpEReNbgg8yp4JHzVyxIzsnpo6a3uehDqqR5O3KqaY88EW1oNP+aMIfrXTGWAYBkc3UmARGgduzkcNyknyedb5i+YwScg/zv6YfRI7L2NH6nHHePiD3MTdni8H/Th9PWLQACxVfJL/9I4vtkGWFDwyoSao6DJwwXZVfWI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(316002)(26005)(31686004)(76116006)(36756003)(5660300002)(83380400001)(110136005)(6506007)(54906003)(2906002)(4326008)(38070700005)(6512007)(122000001)(31696002)(66556008)(6486002)(8676002)(86362001)(64756008)(38100700002)(2616005)(66476007)(8936002)(91956017)(66946007)(71200400001)(186003)(478600001)(66446008)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K1JnQ21jT1RKSTJDWGFhelBXUGNuaUFTMjgrQVdlYzhzZG43ZDRDU0NpQUM2?=
 =?utf-8?B?ZnBKSUUzTmtOWEZjeHA2SzJWcE03SE5Ud2p2cWZNSXFVQUV4alhtNlBsdHNX?=
 =?utf-8?B?TEw0c1RKRzJwTTNHT1QvOHBMdCtxRXVFTjNSekQyOVNucy81cUNGdFRXL08x?=
 =?utf-8?B?MXZBYklrcFFLaThpOTJ6cXlPV1BsK0l3em43WU4zZ05FdFRoclRDZlByOUNM?=
 =?utf-8?B?TUFaeThuMnptY1drMGgxWmhBekhmNnJpV3BUVkVSekxaeVJ0YmxZWDFpelI1?=
 =?utf-8?B?WXcyUjV2Nmt1WjlMWTZhdmRJWjZmeHVjSmxCY0J0VE45LzdIYTB5cG12S29P?=
 =?utf-8?B?bDRYcDlBR1luLzg4U0t4TXJTUEh2c0Y0bjFXaDlXRmZzS05uUW1Xc3F2aUdN?=
 =?utf-8?B?Tm9VVWFRUWNMdmpOaHRsdDFQQmJGZXhlb3JJelF5eTNpdlNOT1FTaC9jeDhm?=
 =?utf-8?B?cnA5MHlKMnYzZkorSURkak11S29XRk5kSm9sNDNpVElscitDY0lleElNNS9B?=
 =?utf-8?B?UWgyUW15YVBKaEt0TTRyVEhYdmNzS1l5TXBvT0ROVjE2MXcvdGQ2KzB2NFRz?=
 =?utf-8?B?MEFQajk3elhLTEE4Q24ySHFxRGx5K3NWUEwzdFdUUUdSSkl4TzBlL0NxV1Fl?=
 =?utf-8?B?ZHRDcnNrTm8wWi9TUE85MGRRWktaS3o2T2VSUTJCT2ljTUxUMkRwbG5nSWl4?=
 =?utf-8?B?Z3M5K3d0dUZNSE9LckZXdHJac0xUcFNpTnhTbmp6YUo3bTRpTXMrQ2NGeWRo?=
 =?utf-8?B?dVk4NThZaDVlRmJKU2RQdkd3MWdvUmM1QnJVVnBCUERxTG4rY0J2OUxkV1Fp?=
 =?utf-8?B?SytUM1BBd1BnNTZFV2JOTWgyUGVVYkVnRFV1U2ZkUHpaYzRhMDFiaHRlbHMz?=
 =?utf-8?B?RXdjR3VucFJ5cXRjYWxXTlM0d2h0c0FXUUVSbkJ2SEpiSzdoeTVWa3RRa3oy?=
 =?utf-8?B?YUlza1p2R0ovNStXNzh0UzQ0ZUZ2c2pXZDk1OFBzUldzeXovYkh3d0tZaFVi?=
 =?utf-8?B?RXNQRmZEU3JOSHpreEpNZFRFMDVUb1VZeFdqLzRJS1pKZUZGdld0TjlobUpK?=
 =?utf-8?B?cUZsWTdOS1JxS1RLZEdmQ2JMK0p2c1FRdVhNTVBtcXRQMHhHSmlQUFFUOUJF?=
 =?utf-8?B?alByS2c4QmNrYUpPd1k0bitKVkMwODZINVpUaktpY0lGRUJZbkpDUVh2a3ZG?=
 =?utf-8?B?Z0h2UTNpZkZ0OUpFMlFHamllNHBVaUVnOWxEZGNmQW9MVE1sTHZrWnJsWWti?=
 =?utf-8?B?clF4S3dmVUNrR1BvemYvcW9TK0VVMkJOOHRpTFV4UmRvcmlaR2ZsSFJHRWZV?=
 =?utf-8?B?bzZUSlBBRzVoMkhBWDh2N283MG1oWXdZN1hqb0pyZE83MUFGdW1takthYTQx?=
 =?utf-8?B?blpTY2tqMklGeGJ0VUxGMmlRbHd0WnlUUHlxQVNNTXd0T0pRK0VxRmxFTVRR?=
 =?utf-8?B?SlZOdDAzNnhwcjZHTjcrKytTclYrWXd1U0IwM1BWMWRTbDlqeVJkQzd5aS9W?=
 =?utf-8?B?a0xWVU5HcVk1eERhc2pSV29VSTBDVE5RM1F0Y3plYjl0ZVlyRUNON0FuVVpu?=
 =?utf-8?B?bTBqQjB2dXZobUFnVjZQemNCLzlyeVIwckNHSkdjZC9GNk1Zd2dyKzJJZzVW?=
 =?utf-8?B?SmhlMmFEUmZ2MXE1YU5FcVVhTUIrUlFrOGt1OXhHWngxQTc1SllOZjJDbFBX?=
 =?utf-8?B?ZitRc3BKV3o0N2wveVB6MTFnOEdqMFMwUWxmcURveWFCNjIwK1U1TU5aSFky?=
 =?utf-8?Q?9wxI1fDGykd9UHD+lgDYuJkeAWFOw5Gv0JNW6gj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B64E875B08D33458C3D2AA62E84616D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eab9de8-f72b-4729-970d-08d9736ee2d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 08:50:33.7645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nLPZqDczDRkq5ENj+UUHPLKbc0cOYNM/36lOB94kbj4mcvdB+iC9A04vwGbt8OgKQPcauolVBQ1fbeuq4h9C/jcjzWI8dlZr9/+mLy4qosUInogIKno8ZpUHY6mxNkwY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3281
X-Proofpoint-GUID: JqSHGRpxHxgnqX7tm9a4Ydnj7Dew-9IE
X-Proofpoint-ORIG-GUID: JqSHGRpxHxgnqX7tm9a4Ydnj7Dew-9IE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_02,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109090053

DQpPbiAwOS4wOS4yMSAxMTo0MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA5LjIwMjEg
MTA6MzksIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDcuMDkuMjEgMTM6
MDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjA5LjIwMjEgMTE6NTIsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNy4wOS4yMSAxMjoxOSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwNy4wOS4yMDIxIDExOjA3LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNy4wOS4yMSAxMTo0OSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+IE9uIDA3LjA5LjIwMjEgMTA6MTgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+Pj4gU28sIGlmIHdlIGhhdmUgYSBoaWRkZW4gUENJIGRldmljZSB3aGljaCBj
YW4gYmUgYXNzaWduZWQgdG8gYSBndWVzdCBhbmQgaXQgaXMgbGl0ZXJhbGx5IHVudG91Y2hlZA0K
Pj4+Pj4+Pj4gKG5vdCBlbmFibGVkIGluIERvbTApIHRoZW4gSSB0aGluayB0aGVyZSB3aWxsIGJl
IG5vIHN1Y2ggcmVmZXJlbmNlIGFzICJob3N0IGFzc2lnbmVkIHZhbHVlcyIgYXMNCj4+Pj4+Pj4+
IG1vc3QgcHJvYmFibHkgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2lsbCByZW1haW4gaW4gaXRzIGFm
dGVyIHJlc2V0IHN0YXRlLg0KPj4+Pj4+PiBXaGF0IG1lYW5pbmcgb2YgImhpZGRlbiIgZG8geW91
IGltcGx5IGhlcmU/IERldmljZXMgcGFzc2VkIHRvDQo+Pj4+Pj4+IHBjaV97aGlkZSxyb31fZGV2
aWNlKCkgbWF5IG5vdCBiZSBhc3NpZ25lZCB0byBndWVzdHMgLi4uDQo+Pj4+Pj4gWW91IGFyZSBj
b21wbGV0ZWx5IHJpZ2h0IGhlcmUuDQo+Pj4+Pj4+IEZvciBhbnkgb3RoZXIgbWVhbmluZyBvZiAi
aGlkZGVuIiwgZXZlbiBpZiB0aGUgZGV2aWNlIGlzIGNvbXBsZXRlbHkNCj4+Pj4+Pj4gaWdub3Jl
ZCBieSBEb20wLA0KPj4+Pj4+IERvbTBsZXNzIGlzIHN1Y2ggYSBjYXNlIHdoZW4gYSBkZXZpY2Ug
aXMgYXNzaWduZWQgdG8gdGhlIGd1ZXN0DQo+Pj4+Pj4gd2l0aG91dCBEb20wIGF0IGFsbD8NCj4+
Pj4+IEluIHRoaXMgY2FzZSBpdCBpcyBlbnRpcmVseSB1bmNsZWFyIHRvIG1lIHdoYXQgZW50aXR5
IGl0IGlzIHRvIGhhdmUNCj4+Pj4+IGEgZ2xvYmFsIHZpZXcgb24gdGhlIFBDSSBzdWJzeXN0ZW0u
DQo+Pj4+Pg0KPj4+Pj4+PiAgICAgIGNlcnRhaW4gb2YgdGhlIHByb3BlcnRpZXMgc3RpbGwgY2Fu
bm90IGJlIGFsbG93ZWQNCj4+Pj4+Pj4gdG8gYmUgRG9tVS1jb250cm9sbGVkLg0KPj4+Pj4+IFRo
ZSBsaXN0IGlzIG5vdCB0aGF0IGJpZywgY291bGQgeW91IHBsZWFzZSBuYW1lIGEgZmV3IHlvdSB0
aGluayBjYW5ub3QNCj4+Pj4+PiBiZSBjb250cm9sbGVkIGJ5IGEgZ3Vlc3Q/IEkgY2FuIHRoaW5r
IG9mIFBDSV9DT01NQU5EX1NQRUNJQUwoPyksDQo+Pj4+Pj4gUENJX0NPTU1BTkRfSU5WQUxJREFU
RSg/KSwgUENJX0NPTU1BTkRfUEFSSVRZLCBQQ0lfQ09NTUFORF9XQUlULA0KPj4+Pj4+IFBDSV9D
T01NQU5EX1NFUlIsIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSB3aGljaCB3ZSBtYXkgd2FudCB0
bw0KPj4+Pj4+IGJlIGFsaWduZWQgd2l0aCB0aGUgImhvc3QgcmVmZXJlbmNlIiB2YWx1ZXMsIGUu
Zy4gd2Ugb25seSBhbGxvdyB0aG9zZSBiaXRzDQo+Pj4+Pj4gdG8gYmUgc2V0IGFzIHRoZXkgYXJl
IGluIERvbTAuDQo+Pj4+PiBXZWxsLCB5b3UndmUgY29tcGlsZSBhIGxpc3QgYWxyZWFkeSwgYW5k
IEkgZGlkIHNheSBzbyBiZWZvcmUgYXMgd2VsbDoNCj4+Pj4+IEV2ZXJ5dGhpbmcgZXhjZXB0IEkv
TyBhbmQgbWVtb3J5IGRlY29kaW5nIGFzIHdlbGwgYXMgYnVzIG1hc3RlcmluZw0KPj4+Pj4gbmVl
ZHMgYXQgbGVhc3QgY2xvc2VseSBsb29raW5nIGF0LiBJTlRYX0RJU0FCTEUsIGZvciBleGFtcGxl
LCBpcw0KPj4+Pj4gc29tZXRoaW5nIEkgZG9uJ3QgdGhpbmsgYSBndWVzdCBzaG91bGQgYmUgYWJs
ZSB0byBkaXJlY3RseSBjb250cm9sLg0KPj4+Pj4gSXQgbWF5IHN0aWxsIGJlIHRoZSBjYXNlIHRo
YXQgdGhlIGhvc3QgcGVybWl0cyBpdCBjb250cm9sLCBidXQgdGhlbg0KPj4+Pj4gb25seSBpbmRp
cmVjdGx5LCBhbGxvd2luZyB0aGUgaG9zdCB0byBhcHByb3ByaWF0ZWx5IGFkanVzdCBpdHMNCj4+
Pj4+IGludGVybmFscy4NCj4+Pj4+DQo+Pj4+PiBOb3RlIHRoYXQgZXZlbiBmb3IgSS9PIGFuZCBt
ZW1vcnkgZGVjb2RpbmcgYXMgd2VsbCBhcyBidXMgbWFzdGVyaW5nDQo+Pj4+PiBpdCBtYXkgYmUg
bmVjZXNzYXJ5IHRvIGxpbWl0IGd1ZXN0IGNvbnRyb2w6IEluIGNhc2UgdGhlIGhvc3Qgd2FudHMN
Cj4+Pj4+IHRvIGRpc2FibGUgYW55IG9mIHRoZXNlIChwZXJoYXBzIHRyYW5zaWVudGx5KSBkZXNw
aXRlIHRoZSBndWVzdA0KPj4+Pj4gd2FudGluZyB0aGVtIGVuYWJsZWQuDQo+Pj4+IE9rLCBzbyBp
dCBpcyBub3cgY2xlYXIgdGhhdCB3ZSBuZWVkIGEgeWV0IGFub3RoZXIgcGF0Y2ggdG8gYWRkIGEg
cHJvcGVyDQo+Pj4+IGNvbW1hbmQgcmVnaXN0ZXIgZW11bGF0aW9uLiBXaGF0IGlzIHlvdXIgcHJl
ZmVyZW5jZTogZHJvcCB0aGUgY3VycmVudA0KPj4+PiBwYXRjaCwgaW1wbGVtZW50IGNvbW1hbmQg
cmVnaXN0ZXIgZW11bGF0aW9uIGFuZCBhZGQgYSAicmVzZXQgcGF0Y2giDQo+Pj4+IGFmdGVyIHRo
YXQgb3Igd2UgY2FuIGhhdmUgdGhlIHBhdGNoIGFzIGlzIG5vdywgYnV0IEknbGwgb25seSByZXNl
dCBJTy9tZW0gYW5kIGJ1cw0KPj4+PiBtYXN0ZXIgYml0cywgZS5nLiByZWFkIHRoZSByZWFsIHZh
bHVlLCBtYXNrIHRoZSB3YW50ZWQgYml0cyBhbmQgd3JpdGUgYmFjaz8NCj4+PiBFaXRoZXIgb3Jk
ZXIgaXMgZmluZSB3aXRoIG1lIGFzIGxvbmcgYXMgdGhlIHJlc3VsdCB3aWxsIGJlIGNsYWltZWQg
dG8NCj4+PiBiZSBjb21wbGV0ZSB1bnRpbCBwcm9wZXIgZW11bGF0aW9uIGlzIGluIHBsYWNlLg0K
Pj4gSSB0cmllZCB0byBzZWUgd2hhdCBvdGhlcnMgZG8gaW4gb3JkZXIgdG8gZW11bGF0ZSBQQ0lf
Q09NTUFORCByZWdpc3Rlcg0KPj4gYW5kIGl0IHNlZW1zIHRoYXQgYXQgbW9zdCB0aGV5IGNhcmUg
YWJvdXQgdGhlIG9ubHkgSU5UWCBiaXQgKGJlc2lkZXMNCj4+IElPL21lbW9yeSBlbmFibGUgYW5k
IGJ1cyBtdXN0ZXIgd2hpY2ggYXJlIHdyaXRlIHRocm91Z2gpLiBQbGVhc2Ugc2VlDQo+PiBbMV0g
YW5kIFsyXS4gUHJvYmFibHkgSSBtaXNzIHNvbWV0aGluZywgYnV0IGl0IGNvdWxkIGJlIGJlY2F1
c2UgaW4gb3JkZXINCj4+IHRvIHByb3Blcmx5IGVtdWxhdGUgdGhlIENPTU1BTkQgcmVnaXN0ZXIg
d2UgbmVlZCB0byBrbm93IGFib3V0IHRoZQ0KPj4gd2hvbGUgUENJIHRvcG9sb2d5LCBlLmcuIGlm
IGFueSBzZXR0aW5nIGluIGRldmljZSdzIGNvbW1hbmQgcmVnaXN0ZXINCj4+IGlzIGFsaWduZWQg
d2l0aCB0aGUgdXBzdHJlYW0gcG9ydCBldGMuIFRoaXMgbWFrZXMgbWUgdGhpbmsgdGhhdCBiZWNh
dXNlDQo+PiBvZiB0aGlzIGNvbXBsZXhpdHkgb3RoZXJzIGp1c3QgaWdub3JlIHRoYXQuIE5laXRo
ZXIgSSB0aGluayB0aGlzIGNhbiBiZQ0KPj4gZWFzaWx5IGRvbmUgaW4gb3VyIGNhc2UuIFNvIEkg
d291bGQgc3VnZ2VzdCB3ZSBqdXN0IGFkZCB0aGUgZm9sbG93aW5nDQo+PiBzaW1wbGUgbG9naWMg
dG8gb25seSBlbXVsYXRlIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRTogYWxsb3cgZ3Vlc3QgdG8N
Cj4+IGRpc2FibGUgdGhlIGludGVycnVwdHMsIGJ1dCBkb24ndCBhbGxvdyB0byBlbmFibGUgaWYg
aG9zdCBoYXMgZGlzYWJsZWQNCj4+IHRoZW0uIFRoaXMgaXMgYWxzbyBjb3VsZCBiZSB0cmlja3kg
YSBiaXQgZm9yIHRoZSBkZXZpY2VzIHdoaWNoIGFyZSBub3QNCj4+IGVuYWJsZWQgYW5kIHRodXMg
bm90IGNvbmZpZ3VyZWQgaW4gRG9tMCwgZS5nLiB3ZSBkbyBub3Qga25vdyBmb3Igc3VyZQ0KPj4g
aWYgdGhlIHZhbHVlIGluIHRoZSBQQ0lfQ09NTUFORCByZWdpc3RlciAoaW4gcGFydGljdWxhcg0K
Pj4gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFIGJpdCkgY2FuIGJlIHVzZWQgYXMgdGhlIHJlZmVy
ZW5jZSBob3N0IHZhbHVlIG9yDQo+PiBub3QuIEl0IGNhbiBiZSB0aGF0IHRoZSB2YWx1ZSB0aGVy
ZSBpcyBqdXN0IHRoZSBvbmUgYWZ0ZXIgcmVzZXQgb3Igc28uDQo+PiBUaGUgcmVzdCBvZiB0aGUg
Y29tbWFuZCByZWdpc3RlciBiaXRzIHdpbGwgZ28gZGlyZWN0bHkgdG8gdGhlIGNvbW1hbmQNCj4+
IHJlZ2lzdGVyIHVudG91Y2hlZC4NCj4+IFNvLCBhdCB0aGUgZW5kIG9mIHRoZSBkYXkgdGhlIHF1
ZXN0aW9uIGlzIGlmIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRQ0KPj4gaXMgZW5vdWdoIGFuZCBo
b3cgdG8gZ2V0IGl0cyByZWZlcmVuY2UgaG9zdCB2YWx1ZS4NCj4gV2VsbCwgaW4gb3JkZXIgZm9y
IHRoZSB3aG9sZSB0aGluZyB0byBiZSBzZWN1cml0eSBzdXBwb3J0ZWQgaXQgbmVlZHMgdG8NCj4g
YmUgZXhwbGFpbmVkIGZvciBldmVyeSBiaXQgd2h5IGl0IGlzIHNhZmUgdG8gYWxsb3cgdGhlIGd1
ZXN0IHRvIGRyaXZlIGl0Lg0KDQpTbywgZG8gd2Ugd2FudCBhdCBsZWFzdCBQQ0lfQ09NTUFORF9J
TlRYX0RJU0FCTEUgYml0IGFsaWduZWQNCg0KYmV0d2VlbiB0aGUgaG9zdCBhbmQgZ3Vlc3Q/IElm
IHNvLCB3aGF0IGRvIHlvdSB5b3UgdGhpbmsgYWJvdXQNCg0KdGhlIHJlZmVyZW5jZSB2YWx1ZSBm
b3IgaXQgKHBsZWFzZSBzZWUgYWJvdmUpLg0KDQo+IFVudGlsIHlvdSBtZWFuIHZQQ0kgdG8gcmVh
Y2ggdGhhdCBzdGF0ZSwgbGVhdmluZyBUT0RPIG5vdGVzIGluIHRoZSBjb2RlDQo+IGZvciBhbnl0
aGluZyBub3QgaW52ZXN0aWdhdGVkIG1heSBpbmRlZWQgYmUgZ29vZCBlbm91Z2guDQpPaywgSSds
bCBhZGQgVE9ETyB0aGVuLg0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

