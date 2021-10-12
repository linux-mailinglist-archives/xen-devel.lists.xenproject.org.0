Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6842A145
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 11:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207007.362722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEFc-0001LV-LE; Tue, 12 Oct 2021 09:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207007.362722; Tue, 12 Oct 2021 09:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maEFc-0001IW-Hb; Tue, 12 Oct 2021 09:39:12 +0000
Received: by outflank-mailman (input) for mailman id 207007;
 Tue, 12 Oct 2021 09:39:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fUjJ=PA=epam.com=prvs=091947bc67=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1maEFa-0001IQ-OO
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 09:39:10 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df25a5bf-0985-4a30-b363-006f4abde3b4;
 Tue, 12 Oct 2021 09:39:08 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C9TMgF024244; 
 Tue, 12 Oct 2021 09:39:04 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bn7sar2rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 09:39:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6769.eurprd03.prod.outlook.com (2603:10a6:20b:284::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Tue, 12 Oct
 2021 09:38:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 09:38:29 +0000
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
X-Inumbo-ID: df25a5bf-0985-4a30-b363-006f4abde3b4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2k2YQlQh44fZjBLVj8/ejiyeDEElNCwFZsti/jFbuCnusa/VXWabGqcTAwL/fYV62+tkHIdYxaWd2FV1N925Dp9xdulmYTkJZFxqWiy5M1g99QslGsiCYFNq+yMVevXL33KYWOxj1tY7bQd7RPlSrv6RIV704z+IH0Gs2nImeuHhM9BiVbXSxkC+oC33RbhIaZWPBz+7jQhWzgjyH+6Ch2ndXycOIN12INPnIB2tCeIvNWhm7JrOdam2KpJxN05WKyzVZB4NqXpfEi2yb+I9GtqFdWb/9F3gkbjD/8zOIihx1sRpzgBxlXPppL+JbWUX+dkv0X86+9HHOZUzCLw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nadob0BJi1S5cYNUrOWwvfMRuGbbvlMx+zTvAkdCFDM=;
 b=WvEtlMLhLD617i/N7ihPMrIY2LTPxrJU2pgZhsUuCjYE49670moiwQKggX7P+4fpLIdV9rxlhdoAVhwtkbFRsX3tNjXIqTyl/y8sdwatAIM0bi+Aj64Kj3f6n/yOEOawjUwzx+IfhrDMW4+pb8CsCWO/ZeE+f2GWyEfg2ct+Fo99LZFMS2JB8ztjp+PlqujkKr85vTcEOOBDENdw3azBTRkO5/Ktjgp3NDtWGTI6XucNBFVd9evhxfo1wL3mnx/v+zKZbLFw4lD29jVQaBp8BvuBjV5dOiaJWHronjaAqM7PgekLw8yy+0J7FUNMvv4tNs1mgfk3X6bHa5P4+3vGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nadob0BJi1S5cYNUrOWwvfMRuGbbvlMx+zTvAkdCFDM=;
 b=uelhjWl1sQzGmsF+TQ2SqUVLTaQqNpE6JTtdRHO9C6yfzqU/JugLrhbjlBZdAvmJL3R6Wapa0jXxLSBRXt8LEnx55EYBozZwfMRn7jsaQNDlV2qpiA/w229vDMXKb/N1K8H5TlFOOSFjnFsIKhED5laO/IGfp0C45iHLCIv+4URSa5Q2C6T0WMWxw7HWqeIq8J09dDhsVuTnkiEEOnnHwxDSYwdOY1qZDPEnOzlM2tc8cv6lG7LtTKDig+HCyuAOdo0NlZZUUDvFBhrbT7siUPU2pLfYoozJb93ffP0Yvx4T1smrTVTjNosEzxt3VCc4/KaGdpMRiQNpInlc+SbTOw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
CC: Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Andre Przywara <Andre.Przywara@arm.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Juergen Gross
	<jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index: 
 AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4CAABOEAIAABXoAgAAEuYCAAAVHAIAAJiWAgAAK0ICAAQCPgIAAA0qAgAAOJYCAAAHCAA==
Date: Tue, 12 Oct 2021 09:38:29 +0000
Message-ID: <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <YWRnMfAi808TQ4Gt@MacBook-Air-de-Roger.local>
 <EB1CB53B-9D5A-49C5-A687-841BF94A153F@arm.com>
 <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
 <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
 <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
In-Reply-To: <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc5a68ec-2a26-47f1-d81e-08d98d640c7c
x-ms-traffictypediagnostic: AM9PR03MB6769:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB67694DA5D6D537FB4A080A7CE7B69@AM9PR03MB6769.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Y/lCQr7otf80wNb3r9WvzeLzzSr3refenWxyUNM/YMmKEnFUpVrfZ9FLsIwBI8M3Gk72cU8WyrIMN5C+CQuKdgSGC4FCJlIt94WrMoVe+hIcuI4J504v2RtuPxTNuOiFv9/ZtMeoUWFvGlmjsQuzncngZMHpCVop40U3yK4Hzw5T3Eb/S59mtUwldzd1GE7agMLojzixfZbMWwCOLcZdQz8oG0ofbIB6aBuoTmEI8FKXC2W6chjb1v3br9h1GouZUpMNLHfWQQRcbXUEaW7PejVcksVSq4KaQwpkNFEYJ1dDDchXYQsTzO9G4Vn7s6IUTGLlELj06ZVglyNEs4wqwcG4gPWVBjlOK/6Awln7LJ8tETLVyroIDLHWmQpPNejOTXrrIFwR300P5o8k3kyR5At+iKhEYcFZ4gtvwooKhDLUbgRBlkj11dD2VG7MY8/hCnNz2I8565uV6P3IjElB2KP2FxhDZMXpcReqUgA02gfZ30GFw5oymV+vAaJhFJ/8IHAEpNTmL8R85WNppnS77VqQQDZa0CK/sSbaaIAkKvrOEaKsrxq7DhuS5HiNdxo2ijYcmOSZPHyrlsiLUYXyTes59rbCwarqsad83DltEQr6XDfgkyrsbc/libsunlioTD1oGIgJvtKDdMS08OQjTA9NCwrYS3nNd9zH719rCyTpdHA3bBTZayOrSSfV2fHMRsPM++6jQw+eq6K7FJCNZ2V7Xse7sM0L/RlwU8OURTPz2uQdRAZQn7vZU2ftD2lb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(6512007)(53546011)(186003)(36756003)(107886003)(71200400001)(6506007)(38070700005)(5660300002)(54906003)(110136005)(8936002)(8676002)(6486002)(55236004)(316002)(31696002)(508600001)(86362001)(4326008)(66446008)(2616005)(83380400001)(66556008)(64756008)(66946007)(76116006)(91956017)(7416002)(66476007)(38100700002)(122000001)(2906002)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dEJFMGtpMmZmd1lKQVRjSmlSVE1rbFU4M0N2dERUU3pqNE95WEFwK0o4TEww?=
 =?utf-8?B?bVc4ZDlnQTZDWDU5WHZnb2VJdWllNkRjWE5NSGpVSmdZaW02UjRsQ2ZnR2lS?=
 =?utf-8?B?Tk5WR2tIUDNZUnJ3VUI2LzVlYzdzNjMrUktweEg4aGIxWldHWWZrUXNMRVVi?=
 =?utf-8?B?VTk1ZTZINHdaZWp1UXdrNlY0WTE0VkJ0R1VkV2gzSCtwN0RNcFhVYnpIcXl4?=
 =?utf-8?B?cjZ1RC9MZG84V2UvMFhpOWZJK0lFckxYU2VYNm1Sb2M0b2lEMEV2TWJkbDJY?=
 =?utf-8?B?SHNiY050MEpocEh0ajI4eHNSTi90ZHp3QUlOOXRYOEVBd2JTbXpEeUNxR1JN?=
 =?utf-8?B?TzJTQzRmaHd1OGtrSkpZT1grSGtyeXVQMVllS2ZyOE5HOWxQZUFaS3FZN21p?=
 =?utf-8?B?U3hoM3JhVFNGOXQ2OS9hM3NNQW5KSkpLekVCOHV1N01HRDVIcEdBeXVJMVEr?=
 =?utf-8?B?YWttOWhISG1YanVVWm5HODBESlRpR1Q2UlczYml6SCtZMFh0bGJBQUZ0N2t3?=
 =?utf-8?B?VGdOSWM5bkM5R0hSUHU4YnA0dS8rMk5OOGlVSnkyeEpkZ0tIZFZyTGJOVGZE?=
 =?utf-8?B?ckNUQWlocUt0NmMzS2VpSkkxUmV2RmxUTjdSUlY0dGZ0RHZOTjNKd05ZaERx?=
 =?utf-8?B?aXhsQy9EcUFFZkFCMjR5N25TVkExQlUxcWkyMVMzZXVTaGRQQmh2bUo1bXBN?=
 =?utf-8?B?VGVBWHBqb0MvL25RRmg5OXRrMGZtTDhZSW9BSXhHMFM5azhEN2xVQmZXSmRv?=
 =?utf-8?B?RzZGRHhjSUV4SUpjZGdCUkdIV3cxNjM2QUZvZkR2RzZ4WU9MeDUwZnZiYUhp?=
 =?utf-8?B?bzBqU1J4QlhoaE1wY0hyU1plenVTTDhpRUJyekRoNXFTcDEybWM0SzFVblNn?=
 =?utf-8?B?VlhaN3VJeXZiRVd4a0dkcTM5WW5vNHFYd3g5WEhmaFFCSE1iOGdQWUIyY1k3?=
 =?utf-8?B?em9GVzdqSHNoRE5IdkMxcXM2Vy9Yc253TCtOSmd0bGZjbHJCanptZ3A0UzdF?=
 =?utf-8?B?c29VcDdPcENRWFpKTFUyWmpqQUJiM1EzemRSS2lPcHl6cFM3bEJaaWpBSFRO?=
 =?utf-8?B?Z0hDbXdadkg5bm1UOTMvdzQvSGtxR29XUHF6aWtNVzJwT2lEUitUWlRQUlla?=
 =?utf-8?B?MXE5OG0xdnZ6cytsNlIyaU1Ma1N4dFlSNm84akJST2Nwa21PaTNNZ0hlbjVB?=
 =?utf-8?B?czJlS0JHZ2RXWEpXY3JXUHJLSGxLQ2pDdCtvcTlhY2dhdk5hTEhDOEFjVDFY?=
 =?utf-8?B?YUpVWjllWm1uM3luZ251bnJ2Nkt2clh4cVYyM2tNYk9LeCt3Mlc2TFdQOGtH?=
 =?utf-8?B?c3RUeFZ1UjN5OEJGNTIxVzdzKzlmUW5RT2RmZUczaUtPRVNyZkdsbmdjd0ZP?=
 =?utf-8?B?U1pUQmtzZzlQL3A3K3cxK1AzZ3NzQVhCTStzaVplWnp6UDNDdlBXcit5OWpp?=
 =?utf-8?B?SGdKeWtERC8wZHA2L0dJM3BNbGdhS2s5RFZKdUQrTE85Q3VwRnUwbGJXNHBT?=
 =?utf-8?B?WVpnZFFuSGowSU5qOVdCbElpditheFBBZmZDWVFEUHNVTFlhRmpUSkFUUDVO?=
 =?utf-8?B?SGNLcXVnL1VhREY4SE41eU5DdG91ZWhOWk5zM1JSZFhQK1RGZldUalBsUC84?=
 =?utf-8?B?cXpOdG5yVFpQcVZmdTd3V2JSMjh6OVZkeUpLMVhpOWw3NTExK3BpdUxiN3o2?=
 =?utf-8?B?SzZWZXkwS1pNcnEzSVUyR21yQWlOWXMyY0lqbjd6WHhERVhNZ2NDSzh3ay96?=
 =?utf-8?B?b01oTWZnZmZJZ0dxVUoxS0ZmempRTmFwWlZ5QnZNNzREck5CWTNjd3JmZGE0?=
 =?utf-8?B?Q2ZIZjkvYUhPUzBpcmppdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC0440E8BCA3584C9C4A49E96842143A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5a68ec-2a26-47f1-d81e-08d98d640c7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 09:38:29.4563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5K+Lg5zB10Z80LGOzWoCsBwLspDPaABdSL0ocm21k/QVNFHR3gCiAA6SFFoFv+1+9eEklpCIsXXwQE512hdfFF4ZJCCJibO9U5yBtYvp/gDSV1JLWMWCk5lxotx3Np1I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6769
X-Proofpoint-ORIG-GUID: -jHCU8QPPXcjjY-ZtjajZwVzIGW5Vk30
X-Proofpoint-GUID: -jHCU8QPPXcjjY-ZtjajZwVzIGW5Vk30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-12_02,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120054

DQoNCk9uIDEyLjEwLjIxIDEyOjMyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMTAuMjAy
MSAxMDo0MSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEhpIEphbiwNCj4+DQo+Pj4gT24g
MTIgT2N0IDIwMjEsIGF0IDA5OjI5LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOg0KPj4+DQo+Pj4gT24gMTEuMTAuMjAyMSAxOToxMSwgQmVydHJhbmQgTWFycXVpcyB3cm90
ZToNCj4+Pj4+IE9uIDExIE9jdCAyMDIxLCBhdCAxNzozMiwgUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+Pj4gT24gTW9uLCBPY3QgMTEsIDIwMjEgYXQg
MDI6MTY6MTlQTSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4gT24gMTEg
T2N0IDIwMjEsIGF0IDE0OjU3LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4gd3JvdGU6DQo+Pj4+Pj4+IEkgdGhpbmsgdGhlIGNvbW1pdCBtZXNzYWdlIG5lZWRzIHRvIGF0
IGxlYXN0IGJlIGV4cGFuZGVkIGluIG9yZGVyIHRvDQo+Pj4+Pj4+IGNvbnRhaW4gdGhlIGluZm9y
bWF0aW9uIHByb3ZpZGVkIGhlcmUuIEl0IG1pZ2h0IGFsc28gYmUgaGVscGZ1bCB0bw0KPj4+Pj4+
PiBmaWd1cmUgb3V0IHdoZXRoZXIgd2Ugd291bGQgaGF2ZSB0byBoYW5kbGUgSU8gcG9ydCBhY2Nl
c3NlcyBpbiB0aGUNCj4+Pj4+Pj4gZnV0dXJlIG9uIEFybSwgb3IgaWYgaXQncyBmaW5lIHRvIGp1
c3QgaWdub3JlIHRoZW0uDQo+Pj4+Pj4gQWxsIG91ciBpbnZlc3RpZ2F0aW9ucyBhbmQgdGVzdHMg
aGF2ZSBiZWVuIGRvbmUgd2l0aG91dCBzdXBwb3J0aW5nIGl0DQo+Pj4+Pj4gd2l0aG91dCBhbnkg
aXNzdWVzIHNvIHRoaXMgaXMgbm90IGEgY3JpdGljYWwgZmVhdHVyZSAobW9zdCBkZXZpY2VzIGNh
bg0KPj4+Pj4+IGJlIG9wZXJhdGVkIHdpdGhvdXQgdXNpbmcgdGhlIEkvTyBwb3J0cykuDQo+Pj4+
PiBJTU8gd2Ugc2hvdWxkIGxldCB0aGUgdXNlcnMga25vdyB0aGV5IGF0dGVtcHRlZCB0byB1c2Ug
YSBkZXZpY2Ugd2l0aA0KPj4+Pj4gQkFScyBpbiB0aGUgSU8gc3BhY2UsIGFuZCB0aGF0IHRob3Nl
IEJBUnMgd29uJ3QgYmUgYWNjZXNzaWJsZSB3aGljaA0KPj4+Pj4gY291bGQgbWFrZSB0aGUgZGV2
aWNlIG5vdCBmdW5jdGlvbiBhcyBleHBlY3RlZC4NCj4+Pj4+DQo+Pj4+PiBEbyB5b3UgdGhpbmsg
aXQgd291bGQgYmUgcmVhc29uYWJsZSB0byBhdHRlbXB0IHRoZSBoeXBlcmNhbGwgb24gQXJtDQo+
Pj4+PiBhbHNvLCBhbmQgaW4gY2FzZSBvZiBlcnJvciAob24gQXJtKSBqdXN0IHByaW50IGEgd2Fy
bmluZyBtZXNzYWdlIGFuZA0KPj4+Pj4gY29udGludWUgb3BlcmF0aW9ucyBhcyBub3JtYWw/DQo+
Pj4+IEkgdGhpbmsgdGhpcyB3b3VsZCBsZWFkIHRvIGEgd2FybmluZyBwcmludGVkIG9uIGxvdHMg
b2YgZGV2aWNlcyB3aGVyZSBpbg0KPj4+PiBmYWN0IHRoZXJlIHdvdWxkIGJlIG5vIGlzc3Vlcy4N
Cj4+Pj4NCj4+Pj4gSWYgdGhpcyBpcyBhbiBpc3N1ZSBmb3IgYSBkZXZpY2UgZHJpdmVyIGJlY2F1
c2UgaXQgY2Fubm90IG9wZXJhdGUgd2l0aG91dA0KPj4+PiBJL08gcG9ydHMsIHRoaXMgd2lsbCBi
ZSByYWlzZWQgYnkgdGhlIGRyaXZlciBpbnNpZGUgdGhlIGd1ZXN0Lg0KPj4+IE9uIHdoYXQgYmFz
aXMgd291bGQgdGhlIGRyaXZlciBjb21wbGFpbj8gVGhlIGtlcm5lbCBtaWdodCBrbm93IG9mDQo+
Pj4gdGhlIE1NSU8gZXF1aXZhbGVudCBmb3IgcG9ydHMsIGFuZCBoZW5jZSBtaWdodCBhbGxvdyB0
aGUgZHJpdmVyDQo+Pj4gdG8gcHJvcGVybHkgb2J0YWluIHdoYXRldmVyIGlzIG5lZWRlZCB0byBs
YXRlciBhY2Nlc3MgdGhlIHBvcnRzLg0KPj4+IEp1c3QgdGhhdCB0aGUgcG9ydCBhY2Nlc3NlcyB0
aGVuIHdvdWxkbid0IHdvcmsgKHBvc3NpYmx5IGNyYXNoaW5nDQo+Pj4gdGhlIGd1ZXN0LCBvciBt
YWtpbmcgaXQgb3RoZXJ3aXNlIG1pc2JlaGF2ZSkuDQo+PiBBcyBFQ0FNIGFuZCBBcm0gZG9lcyBu
b3Qgc3VwcG9ydCBJL08gcG9ydHMsIGEgZHJpdmVyIHJlcXVlc3RpbmcgYWNjZXNzDQo+PiB0byB0
aGVtIHdvdWxkIGdldCBhbiBlcnJvciBiYWNrLg0KPj4gU28gaW4gcHJhY3RpY2UgaXQgaXMgbm90
IHBvc3NpYmxlIHRvIHRyeSB0byBhY2Nlc3MgdGhlIGlvcG9ydHMgYXMgdGhlcmUgaXMgbm8NCj4+
IHdheSBvbiBhcm0gdG8gdXNlIHRoZW0gKG5vIGluc3RydWN0aW9ucykuDQo+Pg0KPj4gQSBkcml2
ZXIgY291bGQgbWlzYmVoYXZlIGJ5IGlnbm9yaW5nIHRoZSBmYWN0IHRoYXQgaW9wb3J0cyBhcmUg
bm90IHRoZXJlIGJ1dA0KPj4gSSBhbSBub3QgcXVpdGUgc3VyZSBob3cgd2UgY291bGQgc29sdmUg
dGhhdCBhcyBpdCB3b3VsZCBiZSBhIGJ1ZyBpbiB0aGUgZHJpdmVyLg0KPiBUaGUgbWluaW1hbCB0
aGluZyBJJ2Qgc3VnZ2VzdCAob3IgbWF5YmUgeW91J3JlIGRvaW5nIHRoaXMgYWxyZWFkeSkNCj4g
d291bGQgYmUgdG8gZXhwb3NlIHN1Y2ggQkFScyB0byB0aGUgZ3Vlc3QgYXMgci9vIHplcm8sIHJh
dGhlciB0aGFuDQo+IGxldHRpbmcgdGhlaXIgcG9ydCBuYXR1cmUgInNoaW5lIHRocm91Z2giLg0K
SWYgd2UgaGF2ZSB0aGUgc2FtZSwgYnV0IGJhcmVtZXRhbCB0aGVuIHdoaWNoIGVudGl0eSBkaXNh
bGxvd3MNCnRob3NlIEJBUnMgdG8gc2hpbmU/IEkgbWVhbiB0aGF0IGlmIGd1ZXN0IHdhbnRzIHRv
IGNyYXNoLi4uIHdoeQ0Kc2hvdWxkIHdlIHN0b3AgaXQgYW5kIHRyeSBlbXVsYXRpbmcgc29tZXRo
aW5nIHNwZWNpYWwgZm9yIGl0Pw0KPg0KPiBKYW4NCj4NCg==

