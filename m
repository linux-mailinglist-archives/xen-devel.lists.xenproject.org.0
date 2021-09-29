Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7B841C0A2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198823.352518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUsw-0001A7-35; Wed, 29 Sep 2021 08:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198823.352518; Wed, 29 Sep 2021 08:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUsv-000187-Uy; Wed, 29 Sep 2021 08:24:13 +0000
Received: by outflank-mailman (input) for mailman id 198823;
 Wed, 29 Sep 2021 08:24:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mM9C=OT=epam.com=prvs=09065c5b4f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVUsu-000181-6I
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:24:12 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 158a316d-e6ed-4f47-8d43-e507269985ec;
 Wed, 29 Sep 2021 08:24:11 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T6U8uo024294; 
 Wed, 29 Sep 2021 08:24:07 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bcjxa8bqr-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 08:24:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2802.eurprd03.prod.outlook.com (2603:10a6:200:93::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 08:24:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 08:24:03 +0000
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
X-Inumbo-ID: 158a316d-e6ed-4f47-8d43-e507269985ec
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBVpCuG66MRVuauC5xNxtX51wyl4CUTXc7JF0a7Xl6gR7teh6yMJm3MlvzWfBpnifPlKdsJjsj1U9XB1b/9FgsvCFxRX66S2wWxrTO4Z2iOdX45pQmPpATNvZDXysGftsVaIrjVA1UkiG1jAY5O9x3Uyw96yvmqE1hpyUJ5zOxJy11+7f+9KR3iKdV4yVgOZmd8Q2rEhAVU6EYlauDl2Ng7oGZKI5smmd+MCPXUhiK84g4KX36TR6KxbwcKorsP5NMAiU1/DFDLoNarivVu2UTUjasjuIqXWq+65JWrVKhPH5bE3UQCi5WFd9wI2pLLzzi8bV/Y2Smat2Yt0CZH8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4T6pSvEDVTQ1HJIa1MyHSz6tDGVwQKQ+pKNWCmHVUqc=;
 b=NwOITaERwHMa5xIwFsgpila6G9hvm9cRmzgGtDVybP5OOziirbPI4MFvRYOaukDxECEi7/MwX4T98fcObPG6b6RwW6y+mSizfaV0v6Ym/A+ATCH62QATXN1bgb/95XobbffvpJo9oKLAvx4Ux00GANAzbirEDXt28T7OUXqP7Ku3N1MI+QZa4+nCZZPqfDHHwbeAFZuIK62KI56uyJVEItYyeoN10oZQvuo6fybPuw5OyFL9G6PCzoh93nPM92lkIbyL4+yGC+ugyQhwCmHMTRZSlNEStoZzBlywU4FLgHsb3DANI25A52Np1pz2im9h7RH686JlCp8qIY0/+EIGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T6pSvEDVTQ1HJIa1MyHSz6tDGVwQKQ+pKNWCmHVUqc=;
 b=ELkVyJLsxDar8bkfY5zjvSsbAZ9LXwDXnq1c2t1AHAm0MaWnCRqhYAQy5H3vPfQu9spOdmYraUow4VhhZVYgk6Vu6Bm8lWVaUDzJbWJWG7gio3qtn8dZoZfIX9jMNx5CnvTJeIB4YWnerq4p5ii65kThqYgeHvGqjsgFbX1+37Np/P5gTyojvZGsq9oaXuTx0JvKJZD0Ia/8y4DaoHm40d1EMke9wF+0epV0SDSLu7gqk5BOg3DOI4NHTgTG+IVYyXVMqZKMyycyJr/96fMw0lGmXBh1EoncT2zEkEn1WWEulTCbVHFSXFU29ygQUT6z4ShNax+R9bcXdgCG220utw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@arm.com>
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
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 07/11] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v2 07/11] vpci/header: program p2m with guest BAR view
Thread-Index: AQHXsHpCfe0n3k8oF0eTl7KOfxT3R6u6ssAAgAAA3gCAAAIlAA==
Date: Wed, 29 Sep 2021 08:24:03 +0000
Message-ID: <7ae0fad7-499b-1bda-5c9e-9313265abf8c@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-8-andr2000@gmail.com>
 <1a341bc1-f7ad-e7ae-1241-a2d5f38f368f@arm.com>
 <f59b48fd-564e-64f8-1422-fb842957f213@suse.com>
In-Reply-To: <f59b48fd-564e-64f8-1422-fb842957f213@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 851b1c07-8a40-4cec-f5b0-08d983227f2c
x-ms-traffictypediagnostic: AM4PR0302MB2802:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB280231291F080309CC45F4EDE7A99@AM4PR0302MB2802.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aGVo7xuI/7auVbLLZ+9OTNcbOK1IAweOvP7/4x5FcLOiEqMmSMeMcnBCiXChP4LuvfiMMZrzuzdU625I16g0v7XPCue+67fYXPagCjjV9VzbasudfvJvQZTm5qGSzsSfGlNdH2KD6kehFDiyOmHGn48bL9rS6p3E2U68YJ3BS7IeE1Cr+3EJxMdkcUCO61SKkWyxGYqVdyvpiPqE6ONWOvNM8GzD99F+HEscrm17nLqrbJnYSXmcihxyLKsur7ndEaDnt0jOutFK3UkMr9jkkHNePhvstgrZH1jioVfLSE33M6Q5DhfLzADNXzIHQipmBzPj6c4hrVZ7EaMhSI00tIBnH22ZTEOQy/B0lh0sX2iVpI4F5Vm+mDt0PxI7m/tbZzpgy5R6iFdDUz+Q8RzPGs2trHRIvCXmbp8R52JSw99vHv2yMqgzhCk03jwEtwiR2cz5wcJvDOX0B5KnFt4a6ELaYmAc7fUlc8XOQKNNB2WDgTKkRt+yBCsa+EIv9L428ISW+yEtGdAk4l2ak/ygQuHWEHmnUh6T2m5m3UOYG2dZ/6I7bkIUG87Ds+3cP/6HTGiQmgDK+utw/AiOudiEgToc+SQbcoveIT9Y2t20diwymg2zOdrTBsq8xE3F62yJk+MhCURKkSQoceaUydhEot/pkUSvvtkhmXciw95hKTqgTYFbSpDeaHnk4wVMVIoLSd0c+KmDP6aN8eU9cTQdvG/XFWOWzk1nj/Pdi2JrWYA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(64756008)(66476007)(110136005)(38070700005)(66446008)(508600001)(53546011)(55236004)(6506007)(86362001)(71200400001)(54906003)(2906002)(186003)(26005)(66946007)(76116006)(4744005)(122000001)(8936002)(4326008)(6512007)(8676002)(316002)(2616005)(6486002)(31686004)(36756003)(5660300002)(31696002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dFhBZWIvWlg5bmQ1R0hyMDE3UHo2T2FUSzdqQ2p5emNUV1FhaFd2VUJDL2Fa?=
 =?utf-8?B?anVlOXlCdnlhRUlYZUVQbDYyV0EvbE1iandnMTV4Wm55SnhQRHNzTUJCTU9n?=
 =?utf-8?B?YzFrc0tDWng1NkZDODYrZ0RveWRwZjJVYUdZM203SXRCeW9UdnNOdmo3MlA2?=
 =?utf-8?B?Tk0vSTJRZzF5S2w4OE9Qc2Z4UURCVVYvNjk5VnlSZUsvS0FkdDR0ZDdycWxW?=
 =?utf-8?B?c2NEODFsWERKRE5SS0UxOGhhblVEZk8vcCtPZHFrQ0pqa1h1bkF6OUZuU2lj?=
 =?utf-8?B?RGtGRTRoc3Z5V05jQ3ZPOHpjNjFKU1Z5cHNmM3Q1Q1RXZHZ1aDBYeWx3SjJY?=
 =?utf-8?B?RWNUSHpuZFNHdSt1SEo4Q1JWa1RiaGxodjNGQkdLM2pVRVVpcFJPZStqMzNE?=
 =?utf-8?B?V0FRSmFzLzFqSEluZ2k3dk14cUFxczNlQmhJQ1ZkZ0l1R2ozRHh3MWJxTk1o?=
 =?utf-8?B?cms4aGJuUWRoRHh2L01jNjA0aEpGWVE2LzNZNjJMRUJuUUNpUEhMVCthQ1Nw?=
 =?utf-8?B?bVVyYmxOemFkaUFieExLOS9HU2dkM0dORVJkbWdGK0dpZTE1SUdyMzFjUGlB?=
 =?utf-8?B?YkhJMVRhdGtuQUNlQ1kzTE1Ba1BsWUp1b2tyMzRMWkt6VGN6cHdFQ2RCMkpk?=
 =?utf-8?B?WnVxQkljVzVJa0RPalFaeXErd3ZmdmpyRkRacFB4OXJETXRZN09mbW90Mitm?=
 =?utf-8?B?K3dPaUIwdmlQdDA5U3JBRmk0cFpDbzA1SG5aZDBRL21ZaDhFMUZocGh6MnpI?=
 =?utf-8?B?Y0hBKzlqSmhtK3pqdUVsb3Y4b3BUdGgrdnU2SXB3cldMVkc1WTdaOG9LKzZy?=
 =?utf-8?B?cS9Qa0U0TGIxSFA5QTNyeStGa3ducWtQTkFqS244NnJkcXhZWE5heGJMMy9l?=
 =?utf-8?B?ak9QcnRYbExCOFRHdzgrQ0E5UVkrY2xTQ2VmbDY3RE92V2MzNW5aWkNYYnpI?=
 =?utf-8?B?akRydnlXTFJTYWlMUDRENkNzcFVZUUM1MHQvMHVBUzhHNWRFamN1U1V5NCtw?=
 =?utf-8?B?ZmxJWDJkaWYralV3N00xbURGQVQwL1hUQWxwS2lucit0UGdZTWhaZzdBWHJU?=
 =?utf-8?B?b1NGcXhtVXFBaWRNdWRnN3RlVzhVNnIxTlVJbTdUbVNGeGpyclVYWWxRWUVm?=
 =?utf-8?B?d1NoenZUdzRMRW9hOVE4NEh3dVI0MytQb2VYVnFsUElaNlI1L1N5RnVibDNp?=
 =?utf-8?B?RHJ5YTlWVjIyV29Jc042Q0pTVS9QNkwzNEF0cXBVM0VuVHNEZXlOV0VEVTBN?=
 =?utf-8?B?a2hLZExDVWNtb3BXYm1rdk9sb1lDUWtsQ3UvY0JzR0NHUmtOb3lMbld1ek9v?=
 =?utf-8?B?L3R4aTVhbHZoQjFEUWtjSy9xLzRKYW8wU2lZa2gwbnhoU3BORW54eTRBVkZG?=
 =?utf-8?B?WkZCUmdJOEpIMDIyZVR1ZWVqRDVFSGlrcXpDa1dwUWl5KzU2MnBndExySmFI?=
 =?utf-8?B?WUtiSTgwTnNqYkt4UFV1QkYxTkR5TkxDbHVubHdqSG83WmFuZjFsQ3RJR0lx?=
 =?utf-8?B?ZFFTL0lRZUZ4MDBTa2d3ZlZ6TDZEVlNObVc4MG1uSlJNVTE4bXl4R2J2VEFp?=
 =?utf-8?B?c3RaZGhsaEYxRW1BUnVLQ0N1MCszQ2tIOWM3YjBNTnkvQWwzd2hGenF5RDFk?=
 =?utf-8?B?TG9IazdWMDQ1QkEwMmxWTjdKekNDYWhKMytUTFplK3kxZVdxaG5Za2xqdFMv?=
 =?utf-8?B?aExScXBmY0xUMlpQOEdyckp5NDV2NmpseGFRRTA1NTFxTUpqVWhwRVMxdzFO?=
 =?utf-8?B?MHJraGRzdUR1a0thWHJKYXo0bjh3QmRZM0dtR1FYd04wVjdzUHI0STlBYkJq?=
 =?utf-8?B?T3hldktQUUNINklFK2cydz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <178AF666B789784897F7097CB2F977B2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851b1c07-8a40-4cec-f5b0-08d983227f2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 08:24:03.3623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oy90Bu9wZ8Nm1GPMcj03Qd1k+M0M3VIy/JDBeLaiG2+4KESxDBCAS+iQSdKqfe4mMqrto3J3TtBSIFrJprfaXh+kLFjpBioAjfIxZBbrjkBQLRsoWen04hkFaSBMA687
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2802
X-Proofpoint-GUID: Z9DqsPZ9OCHJxSAfyoFTEMl3jvcx9vAd
X-Proofpoint-ORIG-GUID: Z9DqsPZ9OCHJxSAfyoFTEMl3jvcx9vAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_02,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=747 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290049

DQpPbiAyOS4wOS4yMSAxMToxNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI5LjA5LjIwMjEg
MTA6MTMsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+IE9uIDIzLjA5LjIwMjEgMTQ6NTQsIE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+IEBAIC0xNDksNiArMTcyLDEwIEBAIGJvb2wg
dnBjaV9wcm9jZXNzX3BlbmRpbmcoc3RydWN0IHZjcHUgKnYpDQo+Pj4gICAgICAgICAgICAgICBp
ZiAoICFiYXItPm1lbSApDQo+Pj4gICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+Pj4gICAN
Cj4+PiArICAgICAgICAgICAgZGF0YS5zdGFydF9nZm4gPSBpc19oYXJkd2FyZV9kb21haW4odi0+
dnBjaS5wZGV2LT5kb21haW4pID8NCj4+PiArICAgICAgICAgICAgICAgIF9nZm4oUEZOX0RPV04o
YmFyLT5hZGRyKSkgOg0KPj4+ICsgICAgICAgICAgICAgICAgX2dmbihQRk5fRE9XTihiYXItPmd1
ZXN0X2FkZHIpKTsNCj4+IEkgYmVsaWV2ZSB0aGlzIHdvdWxkIGxvb2sgYmV0dGVyIHdpdGggdGhl
IGZvbGxvd2luZyBhbGlnbm1lbnQ6DQo+PiBkYXRhLnN0YXJ0X2dmbiA9IGlzX2hhcmR3YXJlX2Rv
bWFpbih2LT52cGNpLnBkZXYtPmRvbWFpbikNCj4+ICAgICAgICAgICAgICAgICAgID8gX2dmbihQ
Rk5fRE9XTihiYXItPmFkZHIpKQ0KPj4gICAgICAgICAgICAgICAgICAgOiBfZ2ZuKFBGTl9ET1dO
KGJhci0+Z3Vlc3RfYWRkcikpOw0KPiBGV0lXIEkgYWdyZWUsIHlldCBwZXJzb25hbGx5IEkgdGhp
bmsgdGhlIGNvbmRpdGlvbmFsIG9wZXJhdG9yIGhlcmUNCj4gZXZlbiB3YW50cyB0byBtb3ZlIGlu
c2lkZSB0aGUgX2dmbihQRk5fRE9XTigpKS4NCg0KSSBjYW4gZG8gaXQgYXMgd2VsbDoNCg0KZGF0
YS5zdGFydF9nZm4gPSBfZ2ZuKFBGTl9ET1dOKGlzX2hhcmR3YXJlX2RvbWFpbih2LT52cGNpLnBk
ZXYtPmRvbWFpbikgPyBiYXItPmFkZHIgOiBiYXItPmd1ZXN0X2FkZHIpKQ0KQnV0LCBoZWxwIG1l
IHBsZWFzZSBicmVha2luZyBpdCBpbnRvIG11bHRpbGluZSB3aXRoIDgwIGNoYXJzIHJlc3BlY3Rl
ZA0KDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

