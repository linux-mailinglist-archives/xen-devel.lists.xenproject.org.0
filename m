Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC53943DFAF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 13:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217866.378076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3B7-0005vB-Dc; Thu, 28 Oct 2021 11:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217866.378076; Thu, 28 Oct 2021 11:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3B7-0005sA-9U; Thu, 28 Oct 2021 11:02:37 +0000
Received: by outflank-mailman (input) for mailman id 217866;
 Thu, 28 Oct 2021 11:02:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikAZ=PQ=epam.com=prvs=19352d112c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mg3B6-0005s2-GJ
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 11:02:36 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e36c030-37de-11ec-849d-12813bfff9fa;
 Thu, 28 Oct 2021 11:02:35 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S9dPcc017739; 
 Thu, 28 Oct 2021 11:02:33 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56])
 by mx0b-0039f301.pphosted.com with ESMTP id 3byr860p2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 11:02:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2832.eurprd03.prod.outlook.com (2603:10a6:800:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Thu, 28 Oct
 2021 11:01:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 11:01:59 +0000
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
X-Inumbo-ID: 8e36c030-37de-11ec-849d-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJdC6HbESxAW1rX2Usv6+w1J/nE02+/QBDfl69pKyTnfof9XKNtIfc48Kjs/0pswXhE3VrQ7TjWvSiiz49hwcB7N0b3417rg24MCllDdjDhxpCGByR30Wxj/GyN7RsJVDSymoBTMiWld6e1I03srlmifqndy5aUQXXebBQiC+f2bc62zF8Upgqfeefk8v92G+MwhwiRUx3R+cwpM8VRnaiaojST6vxvoUiIq7mBnB9h2mA8hLG6BScYox6NUzf/0+bI/svW9M39uvFp7mIb27upY1IlJQKlw82z3uBO6z1PCYY1trx6ecZd9Uu3Yzo2cnakuz8B67UDqX3chhPtwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cna+XBVUvbxaMDXQFakSFpPkvrHlNy9J4yfLgCRUvKM=;
 b=JG2wbq84pw9/ZoSGXQ6Ts1EbRVaCcVUF3aPApcbN3juapWrVnuhTbR1ZjM/dJxMOvHM1HxwiLyiLpTpy0X85OfdacxW+dPxhk1Okx6tJ/007T5/JbYEn9G7OEp+PB7FqaxhP+E7bJzZ9eTDRr+ymOKOvjQNvggkT+cdd6F9K7AhoazjwQnC7ceGgr6TgmQp6K5cFfEccevDqb+7VoJjgsrRif+nbSftfamrQemUEnWq7acRfJlcyNd4n5zA4Je87R0AyFnJ485DpUx68pvn8DtYO6OwBVLqAKR8Islp0bx0eCjw6kFZLRhtkScbbnc5aXet3R6gWhw2v8vGgET5lRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cna+XBVUvbxaMDXQFakSFpPkvrHlNy9J4yfLgCRUvKM=;
 b=TG56jZ0XL22SYC7f6MuCk7Kck54rp+ZBq2YEKTOdyqTYMI/ABU01WSHG767V40vM3jQOJODsUe55PWk67EoJ7choe+rL8n5sKg0IybNNvD84b0XvYxVtaq68n0YETVczmvLPzcZsBOUSY6ZCNn5uckrth0KpuuoxucDzlrzi7qsnyvLeixn27WxyENc7zYqgSbI61uK0B5TXCqXP3xQb35gUYPE7PL42gCLzzqD5V9+kGKJ8m5AdgAOp11QFsUNTTQLPlvKECLsK579f+ZqyGuKVz59uf9AD5GJntzmE2YqKR1EOX0cUNHSUObLMRMZw1uHhBP4y4lWKTTJZHTIhTA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
Thread-Topic: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
Thread-Index: AQHXyw3lMiQK+jRYtUWdkzZ53OfPJavnJMeAgABhyQCAALX3gIAAA8+A
Date: Thu, 28 Oct 2021 11:01:59 +0000
Message-ID: <1bb4f2d7-958f-4408-c04e-88d9b580d2a2@epam.com>
References: <20211027083730.1406947-1-andr2000@gmail.com>
 <7a97bbef-68a9-8f52-0c93-88d4e84a07fc@xen.org>
 <alpine.DEB.2.21.2110271649240.20134@sstabellini-ThinkPad-T480s>
 <c3602294-0ab4-10df-77cc-2a9e13ddc73f@xen.org>
In-Reply-To: <c3602294-0ab4-10df-77cc-2a9e13ddc73f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22de76ff-9649-4f62-1381-08d99a025d28
x-ms-traffictypediagnostic: VI1PR0302MB2832:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB28321972BA284005A43CA5E9E7869@VI1PR0302MB2832.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jnBwJ+m505kFdw2xNR0pUdJDQnU4O8U3v5QIi2X+WGFZ/h9t+rY3nCXFFjO+ODTn0TNy4ZOa2bZ5eq5q+5S3ToxVZUWMc8lwFBejR2TYke1F/H8qFWzGHzuTdCUqvxLlkrPxUBJgjXaMmd5wqVdy59uZbiZi46und1+Hwojc6kW3p4YJVZC9L4aiFXh7agC5s4iRGogPDbf4+QPnvDTGNPfFMYqL7UkTxwsULx+Ky9SREE8jGa8NZSH0VRHK/jMNXdJahIj9gm0KfUQrxxFURQyHhA9DuNRufBCUUmc1D7x/dMassFQzqGv5URK+O0f+MQQvhk8f/ExO6vYqTum3lkA7OLGQTf5k/93r9So3IIHREy2FEeRVLG4qvRzKZNK5F+RHQy5apGC0Wqfhg8As/dYkoclK28xQ0jvAjlxkQN2dnt45D/f3OAsNgd3i9vb1ijJZmylVsy07tvULtn+mg8twlLeWMbV0uvN9/Bdd6wg7mqIFNyODxJ9zjg4xFBFjfqB/vZx5lrBd9Y+RkMCCQdQ8kKdS4V6xOUj0ZzKxjV62xZA3eHNIdg3cQYdL/TjELZewV6xahS+qhFNeRqHHUrei7heSb3jXTY7UZFmVE6nsGDjVbC3ZPHb8Nh6+2O6zNVv0kBWPHU2J3r/6LiZNXKzYWwINuZ6ZO4kt3ntg7yK+wEjOMF+m89tDMYMKjNwoBIfBkRAmtxwfP22+qfXQDrv7S2eS7Inum+4vPpWOW20gIKtuoAbtD27IMkkpjMHE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(26005)(122000001)(66446008)(8936002)(186003)(91956017)(83380400001)(508600001)(5660300002)(31696002)(8676002)(66946007)(4326008)(54906003)(2616005)(36756003)(6486002)(71200400001)(31686004)(38070700005)(86362001)(66556008)(4744005)(55236004)(6512007)(2906002)(316002)(64756008)(110136005)(38100700002)(66476007)(6506007)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y1pJUjdQd21oTG1QMGdhVDNGR3FZTVNlZ3Q2dHRJQTRwa1JQOXRLejBwSkpP?=
 =?utf-8?B?Q0RBd1I2YnB5NkdDcVdOVmJjb0dnb1VDa3JtQ3Q2a215RmZMdmxzSXhkb2pH?=
 =?utf-8?B?dEM2ck03Ukg5eFUxMWtYS2Y1VHhMM1RrR0laM2d4aGhyUXpMYTVWYmkwMHpi?=
 =?utf-8?B?Zk5jRUc2Wm9qM0hYR2wzZWlXVXltRlMrQXUyL3J0d2VBMzh2a2ZLRmlQRUZ0?=
 =?utf-8?B?OCttMyt4a3lGaU14MVBacnlEcXB3dUY5dlloR3gxbnpZb2ZsTWYxT0dTOEV4?=
 =?utf-8?B?K1pUQmVnVk51R2lsaXNwZGdWbDd2VDNJMVBPSGJkU3pRS0xRYjJBcEkrOHBp?=
 =?utf-8?B?S0pxa1R6VGd5QTdqMXhBYytzYjZYQTFHZmlhbm93aVZsenpDamNJYlNwdVBk?=
 =?utf-8?B?VUl2S0FqeUNIMk9QWmZtcFZhdzBTaitSdTMzYUtPQXBiY2Vmb1YxbmZxN1hm?=
 =?utf-8?B?TDFwUTRNOVBRbEpPVzZIY3JkSVE0S0gzSUs5cUVydmVzWS9SSkJsV2lEZHZL?=
 =?utf-8?B?WkJIa05IMUU3R1hyTXM4V3RWV2NUT0ZoQWh2YjlObldnbi80Q2ZnVDBVTFJ2?=
 =?utf-8?B?dkhPVnRnSlYyMHN6MzhadXZ4V21tU21lWjVJOFNES3J3TWtXOWFWTlE2UEtK?=
 =?utf-8?B?SW41bHZCbUROeGNmMWVMRzFQVHBZNEdYMS9vdUVxNThEQWlvajM1SCt4ME9q?=
 =?utf-8?B?NllpT1JxNVpZMDd6VUVwYTJiN0I2TnBFK29wVmw0ejh0YWZtb1JnenVVVnlr?=
 =?utf-8?B?MnpkQUYyZXBHbUxDdDVuNTdGVE9UTXRhNU5aTWZiamVZcDAyeDB5NGVsWURs?=
 =?utf-8?B?djF4SFJzckZ5Y1k5SFFWTFBQVGVKRnhVT1RTd2ZtaHNlSFVlM3lUbitTY3ht?=
 =?utf-8?B?WmFFdnJBU0xjR2dGNm80eVM4VlZtQVhlM1ZsZVBidWFMcFlpWG1ORTZhSDF2?=
 =?utf-8?B?S1J4QzVBR0VUYjNqUWhvTUZXdlgzdkQ4Nk1sMllpWG5HbXN1K2lVU2N2eFMr?=
 =?utf-8?B?VXY0VDVBa0cyMld0VzA1Ly9MWEhVQ2FwNVFQa0hITmpFM21nVEZjRGZSc1gr?=
 =?utf-8?B?RjdGMksvaEpTa3o3UXNPZHNCM2lXTzQ0MEE0dktTQ3NqSXRnT24zZWJRcmRM?=
 =?utf-8?B?YlBETTJPajA2VTlVMkVxazFDZXY0alVvRys0RWhzeVR6NzJRNklnYWtwVEYv?=
 =?utf-8?B?ME9VQkIzR2gzQ29vaVVwZ2k4VWFjU01hQ3BQR0FkUkFsdzZrT081aWJvblBV?=
 =?utf-8?B?YTNtSzdySStLNFBjR0toM0RUTzVoS1lvWkxMeUx5cmErZ0syV0xXOWVWcUlZ?=
 =?utf-8?B?dnJKdDhUVTNnVWNVSVFmSXhzbUFROFdFVTExcGZwNE1paWJ0TUErbFBGQnI0?=
 =?utf-8?B?a0szckhYUjloVzB6d1U2cHFYOTJ3R2x1eFdOMHdRT3IzcHl3ME44VmdxcXkw?=
 =?utf-8?B?S2ZVUGs2YWNTTGNJYTBqVzk4Tm5FcnpLK1hjTGQ4NGlDN2VLSkZwL081QjVp?=
 =?utf-8?B?eWZjSnV3L0hxS0hXNlo2SUtFSzJoeGZaWFU3dnY4NFQ2SmRyWHpoQVg5ZGxo?=
 =?utf-8?B?YWV5amczMkN3bVkrdHRGelFoaUNtOGU2MjhaSFBYVVdmL0tDaG8rL2VZVFJQ?=
 =?utf-8?B?ZnE1dFIvMmNtOUVMNEU0OEIyS0pTQW9BOUFZaWJuMnp5NFUyV1ZJV0orZG42?=
 =?utf-8?B?MUdDRTlzdlROMnJ1NnVHNzBOZk5Ma0RxcVgvSGoyVUNicElCc09jY0xCTzFS?=
 =?utf-8?B?RDNyVFRRelg3aEVGaXl1S2M2VnRxai9FUXVxVUg1MGhqaVA5NzQ3M0hEczhL?=
 =?utf-8?B?RE9Md3g1dDcyZGEvbzZsYU0zSVRCUVk0SlZxTjgwck16b2lyWXNrNXBtRW9M?=
 =?utf-8?B?RFdpVkN1aTJ0ZmNtNm5VMlNIV3pYQjNlKzJxMDRtMmhkWEhRdmVUY2N1NDc0?=
 =?utf-8?B?RWhOZEU5V3laTFRJUVhub2pROXNjbXpnQW90Z0tNeS9GOGtVWVRadG9FbnhU?=
 =?utf-8?B?aS8yTW8rT28rZUo0TkFjM0I0NU5IblhJK2lucEs5MWFOUW9hSk1mWUZPb252?=
 =?utf-8?B?SlRFcjZzWWo3a3JjV2xlTzd6R21LdUVlVDc0OSt4bFlaMzhXZE8zeUxzMHBX?=
 =?utf-8?B?MHhyQzdXZTBQNU05cE9BclVvRmNQT2xxd1hITS8zTU0xbFo3eXFzNjNLd3By?=
 =?utf-8?B?Z2RYQkM4OUxXNkNERFozdVZPUHgvdDBnekw1V0xIdmVpYXNqalZUbURaZENW?=
 =?utf-8?B?ak1pUXFoV3pWWUZzdlFCUmRzMjgwN0tUcGlpbldHaHFoalpJVXRIb0RZeTlT?=
 =?utf-8?B?aXhDamVoL0JGMDQyaHBBV2RncUFTc3YrcG5HMDJDZG1FSy9EY1JBZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84E88C74473D644293955029C14D4A42@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22de76ff-9649-4f62-1381-08d99a025d28
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 11:01:59.1761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rNHUEtzSb4/rwiUsik+PYbDqXyyXqJaWWA5MzORKjesugFakxueSlR6qsgmrEEjBfVNFp25bajsKTU5ih9bMgMi8rJVc79E8RNJef2HT6ihcWXZxvhS/ILKMCx93RWrc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2832
X-Proofpoint-GUID: aXNDcDNCBjxtsIlcf7SV4ZdvcyQlSTq7
X-Proofpoint-ORIG-GUID: aXNDcDNCBjxtsIlcf7SV4ZdvcyQlSTq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=640 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110280061

SGksIEp1bGllbiENCg0KW3NuaXBdDQpPbiAyOC4xMC4yMSAxMzo0OCwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPiBIaSBTdGVmYW5vLA0KPg0KPiBMb29raW5nIGF0IGxpbnV4L2FyY2gvYXJtNjQvYm9v
dC9kdHMvLCB0aGVyZSBhcmUgYSBmZXcgRGV2aWNlLVRyZWUgdGhhdCBjb250YWluIHRoZSBwcm9w
ZXJ0eSAibGludXgscGNpLWRvbWFpbiIuIEFsbCBvZiB0aGVtIHNlZW1zIHRvIGFsc28gYWRkIGl0
IGZvciBkaXNhYmxlZCBob3N0YnJpZGdlcy4NCj4NCj4gSG93ZXZlciwgSSBhbSB1bmRlciB0aGUg
aW1wcmVzc2lvbiB0aGF0IGl0IGlzIG1vcmUgY29tbW9uIHRvIGhhdmUgYSBEZXZpZGUtVHJlZSB3
aXRob3V0IGFueSBwcm9wZXJ0eSAibGludXgscGNpLWRvbWFpbiIuIFdoZW4gUENJIHN1cHBvcnQg
aXMgZW5hYmxlZCwgWGVuIHdpbGwgZ2VuZXJhdGUgdGhlIGRvbWFpbiBJRCBmb3IgdGhlIGhvc3Ri
cmlkZ2UgYW5kIHdyaXRlIGl0IHRvIHRoZSBEVC4NCj4NCj4gVGhpcyBkb2Vzbid0IHdvcmsgZm9y
IGRpc2FibGVkIGhvc3RicmlkZ2UgYW5kIEkgdGhpbmsgdGhpcyBpcyBPbGVrc2FuZHIncyBwcm9i
bGVtLiBAT2xla3NhbmRyIGNhbiB5b3UgY29uZmlybSBpdD8NClllcywgd2hhdCBJIGhhdmUgaXMg
YSBkaXNhYmxlZCBub2RlIHdpdGhvdXQgImxpbnV4LHBjaS1kb21haW4i

