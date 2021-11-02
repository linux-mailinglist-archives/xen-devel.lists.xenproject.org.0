Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518A6442A1A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 10:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219812.380821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhpm3-0003ha-Am; Tue, 02 Nov 2021 09:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219812.380821; Tue, 02 Nov 2021 09:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhpm3-0003fK-7Z; Tue, 02 Nov 2021 09:08:07 +0000
Received: by outflank-mailman (input) for mailman id 219812;
 Tue, 02 Nov 2021 09:08:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhpm0-0003fE-Vk
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 09:08:05 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc08d52a-4bdc-4f3d-97c2-e1696fa586db;
 Tue, 02 Nov 2021 09:08:01 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A27OqUg025475;
 Tue, 2 Nov 2021 09:07:59 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c30vtrc0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 09:07:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4580.eurprd03.prod.outlook.com (2603:10a6:208:c8::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 09:07:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 09:07:56 +0000
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
X-Inumbo-ID: cc08d52a-4bdc-4f3d-97c2-e1696fa586db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3uf5cAXygA62+SgIh5nsTvGF3gv6jLBP9ZhW+0M5cMFfTP4XrBiqMjW86UACIThTqPsDSevXg/rDRnWDNs3QvT72UIAqpyPuLdS4yTx+PsVSRl3DPYy96rMoE8Rej90cRthUIyuUzpNPNyAsv4GPeLwyW9mZmWLhjvxkDQQQIWvtiAi3gIY6axptP6+DyQckMyMw49RM9oxengmGAXCF/w70p9/tEXeX4wkr901mzeBM4mIYuyInlTxHnAm4LpZs0dBIQmPFbR0uCNmuDNpvUz8pNagwqqyHzYKt9NfinssuCscAWpa/0yhxL25YJqgGaVGuerZUTgI1T32dYb7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgUSVJXJtk1K7IiCGwQJ9AGadwNykt/4MZkexbjwyQg=;
 b=Wlev8PR/94ZyZxdToMFxFi5CAOwJZWcb2SuQHtY0iwbtxC22XpANpdb6O7F4mwAxifDNR+ON+tKMa2rtMaj0nUc52xJLOQowiaTcB4JXQkpTfklSTd01SJqNdNNKDqcVwFwp3253NEedtfZ2NtlVoNDxwIA8XL0RtTfNqb4WeYPt0wIuDmWEI2BRO5H5XnwnSg9JAdPUaTETAPIvf6nKxL0DaPtXo14sJSl/k/LrIr9KUCR/lrAouDpvQl+WO0A/Xaa9mRQdO6PUu/TY5XzVsxv7vuHMtlTtrPdRwn/QljsMfl81DNj4NvUyBKVeY7TMN4pxNhBt61hgxZ+DFzSDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgUSVJXJtk1K7IiCGwQJ9AGadwNykt/4MZkexbjwyQg=;
 b=ArKYPSqvooXq94TXeSuafl8xiKLJ2ujfrJuMhrrzJGkV9ThCeDOPWddl7NtPvNZZIaZfyeyqRxjfjQbk4iDHSMcCtUgmZqsyCGQClLaEqYgwqYcxjCs67ZvqYMr9yW/nN7g92VqJBgytCFs63QUY0JDgE5zhVJ0XviVakjm7cVRzyhwo3XuRD6rGq0hpfZYX0B2E5DC2rRvTJ+kr+YZoNvlAgfHxRgmkeijN8kjt1+yGkbZVUHXjC8MlYIuzqiBU+pVJPcsaib7qf7BD2EBPmO+YRt0VOgcp/ha1zgvbUNmf8i1jLCnEqMn+wv0OZXOCmYxE3QW34yYV4h2hxMZZ/g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Index: 
 AQHXyww6rKHs3LJru0q52eLUia+oNavnHBIAgAE3H4CAABhAgIAADTsAgAAb4gCAAB9PgIAA5K+AgASg3ICAAb1HAIAABXeA
Date: Tue, 2 Nov 2021 09:07:56 +0000
Message-ID: <adb55c2f-220f-c660-e86b-13868568cbf0@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
 <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
 <YXrJyLMiMxaNmFAs@Air-de-Roger>
 <5de6c2f1-ef5c-9d8c-4287-9b0e3ff08b34@epam.com>
 <YXuj4frtHIRuSgOO@Air-de-Roger>
 <0ba7aa82-40bc-c0d3-38a2-8c4d141d0afd@epam.com>
 <YYD7VmDGKJRkid4a@Air-de-Roger>
In-Reply-To: <YYD7VmDGKJRkid4a@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd38aa99-3a35-4592-3624-08d99de04269
x-ms-traffictypediagnostic: AM0PR03MB4580:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB458008C12DA9032346DD89BBE78B9@AM0PR03MB4580.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hA1gPqSOdeVgsHAIl4UsgaaVym17Q66OIb1BwfUV+ydwBmr7/tQ02xiSLkT0/D9A+0uOMce3ff6YVk7ccjlOvk2OL84b5Ux7JcTZe3dJLK6I48skGdFRNI0pt8u60ZSyO9d4MfbBem24Axn68HK8b/10XYcvtHSq9NNQoQA8/gsxAOqg2GG2v06uSis2Shtee+KRhi925lqJNEjaF8s/q7ZbRAQxqsCRHDKy5F3cF4yy7gsPzGfkcFXL8jCRFxLn4EgRk46q2z0DEuBENH/Vc0htEPxNwog0F6cwXiFspDqXeTKxk6jnjcfsvpCVpbhaMQTjPNTToj0fCx0UaD+FoPUK+GKd5YvIYHsPBvyL73fLKEcr6qqVIHCORJCONDjbl5ammI7W2wfgPENtGcqe0lfJh3q2CppOo0Z2Lt+lNXMLnic4JGgfPGQWrNE/X73E9B/U9WVTY7U8EdH2she4fVO13DkBBct2MGkfXhIlb0lnj3FDihqwmdWef7ViyUNUro9H9jHQMTPfjpeuugZhK3rmMjd6Wil2ziI1Ni4zmZHfTJBd63a+liR3UI+xpzzAOTz5AtSA3+1A1haFNamtwI/6N1CHH8Tj/3ywEsv/2nOG6qf3m15qNs+smAXVf9N3mwDa3tJRkZOWeqj/rVzGbla8iaIyGDRDO3Q3g+QCl0gKylU4bkw/vf1LtmS86BJy8m0CK8GY/PA2XA9Cz2XCnH+KYEE7A9N/ZEuPYEytfihhmouIMht73Qq2qwX3WziV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(5660300002)(4326008)(8676002)(38070700005)(36756003)(122000001)(83380400001)(8936002)(508600001)(31686004)(71200400001)(26005)(6916009)(31696002)(91956017)(6512007)(53546011)(316002)(76116006)(66946007)(54906003)(66556008)(6506007)(38100700002)(2616005)(6486002)(64756008)(66446008)(2906002)(86362001)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZjN5V0d6MEdPUUhEdTdYRWd5MGw2MTltbDVHUFc4Q3FUdy8vcTdDYTdMTVYx?=
 =?utf-8?B?S1QyQlcwR1p4TE44aTRHeFRYTTVlZ2E4MFhwUjM3UEV1eHluR1BUekZwcVZz?=
 =?utf-8?B?cVFNcCtzS3Z0aDM5N1MrZzdwdjVoWUsvR1U0a292a1VjcWliWEg3dnRES2xX?=
 =?utf-8?B?eitYZFl1R0JRN1ZyeUtkbnYwNmE4VmhQMkhoNTlSSWUxUnptbjFxeHB1RmxT?=
 =?utf-8?B?YXB6aktDNURLOVdJQXM3RHNNYWJqMmFvUXNwVGxQUkt2QnlHVWNNUjlJc2o0?=
 =?utf-8?B?elJweEhheEMxQUFtT3FHWEhKR1lPOE9SdTN4cmJYTnNkUlFqMVMrZWJISVda?=
 =?utf-8?B?c0F3MXBmR2czbjFmSGloaGNPRGp6ajVoT0N0T0x5RjhVTjFpRWFPcFZUTC9G?=
 =?utf-8?B?T2lFbnJPOHlSN3Z3ZlpaWFJlNG1iMXkzdlRLdlpEbkJUTG0xd0hDVTRqUXRn?=
 =?utf-8?B?VWN0czJxcC9xM3NlRUtuUThqRUw4U1BWd3E4SFZXRjBwKzVjeTNBeVRlam02?=
 =?utf-8?B?aHNDb0VtOEtORVdBMEQyc24rVmlLVUMySHI4YTN5TTlXY1ZERU9WQmZobTNr?=
 =?utf-8?B?SERERUpLUmN0Z3N0RDQ5aGxQTWVzWmxVdWdrVWZPUHg2OGk0c1lZTVZiVEMz?=
 =?utf-8?B?T3NmaHJYRU5XU0dNTFFHcFl0YmppekZWMmp3eVBNSDhKbWxSKzdPK3h2ejBm?=
 =?utf-8?B?VURLUHQvdU9EQ0M4cFpIelpLbVJ2Y2NaKytWTTBVczhMWndRVzdiek00dGxI?=
 =?utf-8?B?dFpraFczc2YzdzM4UXkyQkQ0cXplMnlkR0ZhT1BmSSt3WjF2OEQvZnhkOEtF?=
 =?utf-8?B?YTdETzRsbmgyL3Z0ZVRXUTNxazVzeHJ6T0p3ckN1ZkNkMXJpLzVpSzZiUjBW?=
 =?utf-8?B?dTdTRXlJMHpSclBZNCs5Y1I1cEFjcnhXdzdldXNMVG94NlpRRDRrKzBxQVd2?=
 =?utf-8?B?aFdJejJjZkZTcUwrbmlsTUR5ZkZoWUQrT3BDZVJ0QWNBVlZmdDhpbjE2YllR?=
 =?utf-8?B?K21qQk80MGF2UWFjaHkxMTN0RXcycDVLVTBhUFVHUzlXSnNaOHY0dE5JUUty?=
 =?utf-8?B?MmVLNVdndDl0ZkNRaitKOU1KQXRnbFo4alIrVDU0cHBDNTEwYXZrYUwwZjVh?=
 =?utf-8?B?SWg4cHBvVldza0dQb0R3TkczZFZyU1RqYjBCVmxVMUR1Vkc2OFJmYk1Ebjc5?=
 =?utf-8?B?Z2ZDaURPOFR5RkVyanVxdGlxRWQ2NUFuSHFmK1JveVZRSHZMY3RnbllxckEz?=
 =?utf-8?B?UlV2Vm1zV0VtNHRXNGVjdVJMbGhveHhmN2NhQ0liUjFXY0JYQTNuZ0ZVWW9T?=
 =?utf-8?B?MDU0b1Z0WndhYU1KQ1c5S1BWYUhnRjA1WktFMEhIMmNCMy9JSk9rQ3l5L2JH?=
 =?utf-8?B?cXUwL2pJeTM1VGlsdlkxUVZSSDdMUVZGYmoyakgxMzFKWXhyLzlhbFJwN2xY?=
 =?utf-8?B?OW91My9vYUlDZkpKaW10OThqakJXWG4ybm42bW5BN0VkTW5mSXZGRmZNS0pQ?=
 =?utf-8?B?NGh2bXA5NHZYbElnUzgzbG82T1Q5S3l3RkNMMWxCbzZ1bnRFLzRmOVpJY1M2?=
 =?utf-8?B?TUR4Y0FJOTBzNURUK2MxeGl1a0lLbmJmUUdqMXUrYnByUmNUVUU1UWxHTHRt?=
 =?utf-8?B?RVdNd1FXK1dWUVZjU3ROUjdkQ3Y0b3pTdE9xc3g4ejQ0WkNzckpIZWpYNERZ?=
 =?utf-8?B?UjIyQjMrTjVrM3JBMGZ2Y2M0Nkw0a3YwUFVOc1Nsa1RWREVOQWFPWWZKZDN4?=
 =?utf-8?B?VEd1WjhyTGhRd2JWeXhnRGlhZHNTVzFOd3dBRGtlMFZFOUtLRWhaZ2VZM0cz?=
 =?utf-8?B?ZUhBb1Y3U0dEb3pDdFMzeXEvaEo5dVdFK0JUL2MxRS8yNFUxVTlNTnkyc3Jy?=
 =?utf-8?B?QTVZdWg5bXJ3TVk3b2FQaHRHaXlValdOWmFGdVExNFc1Uk9kZy9sbjBxeXNa?=
 =?utf-8?B?YjJQWjVnOE8wdzFCNlh4SVcxdEE2QURlTFhaY0lpdXJScGxvRlZSaW04ZGxB?=
 =?utf-8?B?OUVTNmVDMDF3Wnd5eCsyWmwwR2NuTWhDajM3d1haSUJ6cVR2YjJmUlJjalkz?=
 =?utf-8?B?Y3FGVitSWE55WllKazV5ZStxRHZHUThILzMycmhYYy9CNmExR25pK0h0aG9K?=
 =?utf-8?B?aWZTSzlQOS8zVnhzU3FuVHgwdDUxSUc4Wlg3WldIZ1R4dXhvT2pZRjI2L3Ir?=
 =?utf-8?B?UlpyOEFCeUVFYW1zeFhCVTZlRlhxK1pLNmMrNmRmWFp0WlJrVEVCNksyaEtF?=
 =?utf-8?B?c1hQTnhVaFYrTEJGL3l0SUROK2RqNXh2aEJNNVBGejRFQkR4SklqelYzSWEx?=
 =?utf-8?B?eTdWZktHVWgvcE9uUGVYdTcwMDg5SDYvcjcvSWJLb3VDNUNtZjdzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3F897A1304322418699E62738AA2E00@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd38aa99-3a35-4592-3624-08d99de04269
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 09:07:56.0957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uyv+SG0CEyPMOtlF1THPMOMyWL3N8ljeAhjKftAn2dX3dE65vzloeTvGJ0fGndbgCuUHRqxAp4kxXFPCu8qNiZs+PVHqvphtdh9zbFemvdeb2XpceU+jL9ARclKZ8nf0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4580
X-Proofpoint-ORIG-GUID: EvWCqL-BKvQSK7cZJLpSYeZLWHTD79yG
X-Proofpoint-GUID: EvWCqL-BKvQSK7cZJLpSYeZLWHTD79yG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020054

DQoNCk9uIDAyLjExLjIxIDEwOjQ4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IE5vdiAwMSwgMjAyMSBhdCAwNjoxNDo0MEFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAyOS4xMC4yMSAxMDozMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAwNTo1NToyNVBNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMjguMTAuMjEgMTk6MDMsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAwMjoyMzozNFBN
ICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAyOC4xMC4y
MSAxNjozNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4gQW5kIGZvciBkb21VcyB5
b3UgcmVhbGx5IG5lZWQgdG8gZml4IHZwY2lfe3JlYWQsd3JpdGV9IHRvIG5vdA0KPj4+Pj4+PiBw
YXNzdGhyb3VnaCBhY2Nlc3NlcyBub3QgZXhwbGljaXRseSBoYW5kbGVkLg0KPj4+Pj4+IERvIHlv
dSBtZWFuIHRoYXQgd2UgbmVlZCB0byB2YWxpZGF0ZSBTQkRGcyB0aGVyZT8NCj4+Pj4+PiBUaGlz
IGNhbiBiZSB0cmlja3kgaWYgd2UgaGF2ZSBhIHVzZS1jYXNlIHdoZW4gYSBQQ0kgZGV2aWNlIGJl
aW5nDQo+Pj4+Pj4gcGFzc2VkIHRocm91Z2ggaWYgbm90IHB1dCBhdCAwMDAwOjAwOjAuMCwgYnV0
IHJlcXVlc3RlZCB0byBiZSwgZm9yDQo+Pj4+Pj4gZXhhbXBsZSwgMDAwMDowZDowLjAuIFNvLCB3
ZSBuZWVkIHRvIGdvIG92ZXIgdGhlIGxpc3Qgb2YgdmlydHVhbA0KPj4+Pj4+IGRldmljZXMgYW5k
IHNlZSBpZiBTQkRGIHRoZSBndWVzdCBpcyB0cnlpbmcgdG8gYWNjZXNzIGlzIGEgdmFsaWQgU0JE
Ri4NCj4+Pj4+PiBJcyB0aGlzIHdoYXQgeW91IG1lYW4/DQo+Pj4+PiBObywgeW91IG5lZWQgdG8g
cHJldmVudCBhY2Nlc3NlcyB0byByZWdpc3RlcnMgbm90IGV4cGxpY2l0bHkgaGFuZGxlZA0KPj4+
Pj4gYnkgdnBjaS4gSWU6IGRvIG5vdCBmb3J3YXJkIHVuaGFuZGxlZCBhY2Nlc3NlcyB0bw0KPj4+
Pj4gdnBjaV97cmVhZCx3cmllfV9odykuDQo+Pj4+IEkgc2VlLCBzbyB0aG9zZSB3aGljaCBoYXZl
IG5vIGhhbmRsZXJzIGFyZSBub3QgcGFzc2VkIHRvIHRoZSBoYXJkd2FyZS4NCj4+Pj4gSSBuZWVk
IHRvIHNlZSBob3cgdG8gZG8gdGhhdA0KPj4+IEluZGVlZC4gV2l0aG91dCBmaXhpbmcgdGhhdCBw
YXNzdGhyb3VnaCB0byBkb21VcyBpcyBjb21wbGV0ZWx5IHVuc2FmZSwNCj4+PiBhcyB5b3UgYWxs
b3cgZG9tVXMgZnVsbCBhY2Nlc3MgdG8gcmVnaXN0ZXJzIG5vdCBleHBsaWNpdGx5IGhhbmRsZWQg
YnkNCj4+PiBjdXJyZW50IHZQQ0kgY29kZS4NCj4+IFdlbGwsIG15IHVuZGVyc3RhbmRpbmcgaXM6
IHdlIGNhbiBsZXQgdGhlIGd1ZXN0IGFjY2VzcyB3aGF0ZXZlcg0KPj4gcmVnaXN0ZXJzIGl0IHdh
bnRzIHdpdGggdGhlIGZvbGxvd2luZyBleGNlcHRpb25zOg0KPj4gLSAic3BlY2lhbCIgcmVnaXN0
ZXJzIHdlIGFscmVhZHkgdHJhcCBpbiB2UENJLCBlLmcuIGNvbW1hbmQsIEJBUnMNCj4+IC0gd2Ug
bXVzdCBub3QgbGV0IHRoZSBndWVzdCBnbyBvdXQgb2YgdGhlIGNvbmZpZ3VyYXRpb24gc3BhY2Ug
b2YgYQ0KPj4gc3BlY2lmaWMgUENJIGRldmljZSwgZS5nLiBwcmV2ZW50IGl0IGZyb20gYWNjZXNz
aW5nIGNvbmZpZ3VyYXRpb24NCj4+IHNwYWNlcyBvZiBvdGhlciBkZXZpY2VzLg0KPj4gVGhlIHJl
c3QgYWNjZXNzZXMgc2VlbSB0byBiZSBvayB0byBtZSBhcyB3ZSBkbyBub3QgcmVhbGx5IHdhbnQ6
DQo+PiAtIGhhdmUgaGFuZGxlcnMgYW5kIGVtdWxhdGUgYWxsIHBvc3NpYmxlIHJlZ2lzdGVycw0K
Pj4gLSB3ZSBkbyBub3Qgd2FudCB0aGUgZ3Vlc3QgdG8gZmFpbCBpZiBpdCBhY2Nlc3NlcyBhIHZh
bGlkIHJlZ2lzdGVyIHdoaWNoDQo+PiB3ZSBkbyBub3QgZW11bGF0ZS4NCj4gSU1PIHRoYXQncyBu
b3QgZ29vZCBmcm9tIGEgc2VjdXJpdHkgUG9WLiBYZW4gbmVlZHMgdG8gYmUgc3VyZSB0aGF0DQo+
IGV2ZXJ5IHJlZ2lzdGVycyBhIGd1ZXN0IGFjY2Vzc2VzIGlzIG5vdCBnb2luZyB0byBjYXVzZSB0
aGUgc3lzdGVtIHRvDQo+IG1hbGZ1bmN0aW9uLCBzbyBYZW4gbmVlZHMgdG8ga2VlcCBhIGxpc3Qg
b2YgdGhlIHJlZ2lzdGVycyBpdCdzIHNhZmUNCj4gZm9yIGEgZ3Vlc3QgdG8gYWNjZXNzLg0KPg0K
PiBGb3IgZXhhbXBsZSB3ZSBzaG91bGQgb25seSBleHBvc2UgdGhlIFBDSSBjYXBhYmlsaXRpZXMg
dGhhdCB3ZSBrbm93DQo+IGFyZSBzYWZlIGZvciBhIGd1ZXN0IHRvIHVzZSwgaWU6IE1TSSBhbmQg
TVNJLVggaW5pdGlhbGx5LiBUaGUgcmVzdCBvZg0KPiB0aGUgY2FwYWJpbGl0aWVzIHNob3VsZCBi
ZSBibG9ja2VkIGZyb20gZ3Vlc3QgYWNjZXNzLCB1bmxlc3Mgd2UgYXVkaXQNCj4gdGhlbSBhbmQg
ZGVjbGFyZSBzYWZlIGZvciBhIGd1ZXN0IHRvIGFjY2Vzcy4NCj4NCj4gQXMgYSByZWZlcmVuY2Ug
eW91IG1pZ2h0IHdhbnQgdG8gbG9vayBhdCB0aGUgYXBwcm9hY2ggY3VycmVudGx5IHVzZWQNCj4g
YnkgUUVNVSBpbiBvcmRlciB0byBkbyBQQ0kgcGFzc3Rocm91Z2guIEEgdmVyeSBsaW1pdGVkIHNl
dCBvZiBQQ0kNCj4gY2FwYWJpbGl0aWVzIGtub3duIHRvIGJlIHNhZmUgZm9yIHVudHJ1c3RlZCBh
Y2Nlc3MgYXJlIGV4cG9zZWQgdG8gdGhlDQo+IGd1ZXN0LCBhbmQgcmVnaXN0ZXJzIG5lZWQgdG8g
YmUgZXhwbGljaXRseSBoYW5kbGVkIG9yIGVsc2UgYWNjZXNzIGlzDQo+IHJlamVjdGVkLiBXZSBu
ZWVkIGEgZmFpcmx5IHNpbWlsYXIgbW9kZWwgaW4gdlBDSSBvciBlbHNlIG5vbmUgb2YgdGhpcw0K
PiB3aWxsIGJlIHNhZmUgZm9yIHVucHJpdmlsZWdlZCBhY2Nlc3MuDQpJIGRvIGFncmVlIHdpdGgg
dGhpcy4gQnV0IGF0IHRoZSBtb21lbnQgd2Ugb25seSBlbXVsYXRlIHNvbWUgb2YgdGhlbSwNCnNv
IGluIHRoZSBmdXR1cmUgd2Ugd2lsbCBuZWVkIHJldmlzaXRpbmcgdGhlIGVtdWxhdGlvbiBhbmQg
cHV0IG1hbnkNCm1vcmUgcmVnaXN0ZXJzIHVuZGVyIFhlbidzIGNvbnRyb2wNCj4NCj4gUmVnYXJk
cywgUm9nZXIuDQo=

