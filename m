Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D3943DE65
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 12:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217789.377963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2Gr-0002j0-EI; Thu, 28 Oct 2021 10:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217789.377963; Thu, 28 Oct 2021 10:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2Gr-0002hC-B7; Thu, 28 Oct 2021 10:04:29 +0000
Received: by outflank-mailman (input) for mailman id 217789;
 Thu, 28 Oct 2021 10:04:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikAZ=PQ=epam.com=prvs=19352d112c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mg2Go-0002h6-Ut
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 10:04:27 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5945aba-dce4-42a1-a7fb-c1b6c5201251;
 Thu, 28 Oct 2021 10:04:25 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S9SbIl001597; 
 Thu, 28 Oct 2021 10:04:24 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 3byduj1y3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 10:04:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Thu, 28 Oct
 2021 10:04:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 10:04:21 +0000
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
X-Inumbo-ID: a5945aba-dce4-42a1-a7fb-c1b6c5201251
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKkVgvmREF6JbpN1hgnC3mCnicD4j6E2SIM0v80WSkXV7jGkAWBpfnORcWYNAMUjJ18CgZHlROhJV4zd7raPsR1s6NldBlOT93eZYquCj308vlFhI1DKIEe+8bQEF/lJyPgxEMfvKNCqKQO8Kpb24hXpB1UIxu7bihJ/lRx2vhgdfCzBi4t9TrcZSvAkXmW6tVuj/0dKY+pKFRJfDYEzi0Z8aNbBzCSquLS5qs8o8e8pXabe9M5Sb4xJ4WHxvDuJZWoM8w+8of5uUAnMdQihy/2N9u1XuH7wWNBawYZ/op73IB0tOnzu6IEZmiQ+5uNBJluqPprTCsJudnmFr7Zq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjYkhuSv5aGZ6QJd7Al7PtnntmiqCTKVkPcOMq5b7QU=;
 b=ZGPn7cKp9q5Z+t7Mi80jKPWUiaw4FaCOTIfmBjnozQf30wnvfTg8XSat0hrFBweFkiUg5dhc6+rYT3Tv7s7CZ5mBPxg/ZoLkgwOcob+0nABox8/1BCbGcJ2Zd4ZOGOySOt4d4zVL1fevLW+2IcLMww5ZYs12Orf9qpwhPEORNJfWGqUQ5G9jlR3hkquOpZWjzN4bi/C40809MYgab6PmN3GxzrENZ0pzZNnFiLRql0sRVuM9BuriPKvo9d0pGGezhTUrHzAhFrs381mNbCDZ+0dshKwybQ/FIyrUBAijw98JO8qJ0PIJiR1bkFLSz6t4PzCz/xRCq0km1FR4FuEbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjYkhuSv5aGZ6QJd7Al7PtnntmiqCTKVkPcOMq5b7QU=;
 b=KTvduSaMbkckdt54Ry2TBn+iC737bEyXV5ylXNr3t9pSxF0DGj/1Fg7x0mDU42gcv6msN1qUFokaWk8cbIQKv31X5MyRQE1kIPaZjWIkoOaLasoLfmbppprC4UbSs4O+3hdy/sNnpIzEqkuEZSbqb1dmI7Ft9IZr75ieFOo61Oi7N19ZXhsijCH/Xq/Ap+hqowLdUxmeVc9g6Js/+6TeqzMUm7vRpXjXul4IdSKgn1Di+Nggc/XHAZSAxdUnxg0M0VVZXQlTUlGyxjdUexHP7eIdIS4K5wuEt63uHqJPjYhsHGWmEBHhI1GkAyHCTDgTwpkao6T815gmLnqgEYT+Cg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Roger
 Pau Monne <roger.pau@citrix.com>
Subject: vpci: Need for vpci_cancel_pending
Thread-Topic: vpci: Need for vpci_cancel_pending
Thread-Index: AQHXy+MtilSp1e2bsUu2TEgvHf6jsQ==
Date: Thu, 28 Oct 2021 10:04:20 +0000
Message-ID: <fd1328da-5ad3-62cc-28d6-0ec60e9ea582@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68bdbf69-7b21-481c-1a85-08d999fa4fd8
x-ms-traffictypediagnostic: AM0PR03MB6324:
x-microsoft-antispam-prvs: 
 <AM0PR03MB6324155E0D6C44ECE483655EE7869@AM0PR03MB6324.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ///6P9RP77EJTDN3wTema0fOoSTm5SO+KkWOORz2phH7XiuEbSglMY4zivMo8AHMWCVYq4jJTtEQ6W45/PgxrkiIavcPa0QU4FQwwSlwqPuTcVmJmxP8ZXZPqDzkMlgB73wc8AAnUlRYooftR3vd5ggsY9YzvcXEI9nAUXDTMFYbTFRZ3bJ7C8AQC1l3V3ZZA4JxxeUFKLu3Kv2HMhfLUx+FcaOU8U3g9B1sQvl0MccgIvOl6HjqQ0gg2djw6wPIWawLOePPykA+lUxz/WtOWRbN0o7Se8LUuGpAj7YLljpIiTncybZt3tIq0yGkHXaadGnlxaSvh3IOgAIFwnUD+YRuQQwB/gdpSDsZsVInIcE0IjZhXdO6HWa3YYY6QRxdJUNs2PdLpqzCCTgMLY0LS+I9H/pllxvvKjYgd1lRduK+cbjEnAiSFQLtogcXXjUPuKI7q00i9uAraH9WsJMIZoeBDCIVfgWxBs7oKHx8sK1jo7b5Uchnnhho1JZWdLVpPWi+UmZTmfN6eEVkHFFwkpARhbXptq+TX4Sn7JgV6myMVt7Jj+JUVP4g1HJWY+aK/eHpjpJ3Ugul02HJBlRmvP3dVYJK9btjfRPXB+oEDezKspd5yN7oCOXW+yHgAMqaaVf1Q66pNIP7ax6OUIT+UxnySjcCd5QcfF0QMgrTW7JRxMPyzX2/2MEkOwc3kBKXTa8f26RuCZxcUKrz7MSyIrc6bx6MzpUgrn9ez1B8AJAQV7ThZQx0b0d1U4+RyaNG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(8936002)(31686004)(316002)(31696002)(71200400001)(38070700005)(2906002)(508600001)(66556008)(6506007)(86362001)(55236004)(76116006)(66946007)(36756003)(66476007)(91956017)(66446008)(26005)(64756008)(6512007)(38100700002)(8676002)(5660300002)(6486002)(186003)(2616005)(83380400001)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?djRkcllyNythVldhSndqdzd5SVRhV1hocXBzT1QzaEZGUi9Nckx6a0ZOUDFG?=
 =?utf-8?B?NDFsaHNmWjJHYThoa0I5RnliUVlCc1JjZ2Fzc0srZW5BcWQ0RUIvUlVZWUtZ?=
 =?utf-8?B?NzVldnVaUEVqMHVtM3JRMHNoaW1BVWJZemZha2RlSVdzaEZ5dStKU1I5VXJ0?=
 =?utf-8?B?OFVpMWZOODRXbEVUdW43UzdOdTRQOG1wLzg3eFhjL3FKRUJFUjRxNUdjYm9l?=
 =?utf-8?B?SVREdHRvVGNndnhFdExSc3NxSWxkQ1hydWpxK0NTcGlpbSs3UW5JcEp4bHpl?=
 =?utf-8?B?TjlvQ0s3ZWFuZ2JtbnRSZ3ZJZnppL1pqenM5NURtRW1xeXhSYVJlYTdjblNv?=
 =?utf-8?B?aXdSRVRnWUZ6ZXk4SkJGNzk2dDVnei9YMzRETzZDb3B0b1ZUbGowZVR3MlQv?=
 =?utf-8?B?N2xWUGlaQmU5aXRwVHlVY3NpZjBTTFZjeDdJVkoraDNKT2ZlVzBMaEp2dGVS?=
 =?utf-8?B?c0t2NE9hQ21mNFlCS1hPL0w5MXhoUElsb2xYeU9WTVgvRnRQYzY0aTVGREZQ?=
 =?utf-8?B?M09QdnBFOW43OGpPblF6eE4zblJuSDJYOXJVN2ZUemw5VEJRZnJrYlNjTVl4?=
 =?utf-8?B?TVFsRDgrL01iY0M4d1NsMzFxL2pFREFqMXc4QlNDVENXdm9kNUNONStDcTR0?=
 =?utf-8?B?NDZDbGUrTWpOUjVQbVpXSGFCU282akNNRjE3N0Q5QmJZb1d2UFRjZ0UxTm5L?=
 =?utf-8?B?TFJtZDl1bjhnVlM5UDdwZUFjSWwyanNJTnM1b29KRkwyZFgrb1lDemR5UThB?=
 =?utf-8?B?TVc5Qll3R3dxQ0plV215MnA3SGFUWWdleXpCcmpFYVpUcEM1WWxRblZzUkFm?=
 =?utf-8?B?Wi9QbXpncytCa1h0YzE0VllHWXVyY3QxMmhiQS9mTnNtTnl6UmY5a0lwcURs?=
 =?utf-8?B?RVkzNDlFcmhzdGpvNStueWpLbEdUUEJDcGlVL1RzbDlyUjZSTlgzTnF5Slhm?=
 =?utf-8?B?TGwyWVlMK0doVUtBVmNsQlZCZFNGTjA5UjViR2JBb3l3NEhyT21EUGp3SEIz?=
 =?utf-8?B?UUN6QlpweUtTZ0czZFh1QzkwRFp2TXNIS1hXSlBsN2krSmhlakNwTnJ3SEI0?=
 =?utf-8?B?ZmRocjRJbkZSV01oU1lqVVJtR1BYcjNSSTFJaXZZS1Y3bVdFN2pMWk8xL0No?=
 =?utf-8?B?MG1LZUp2UDdPWUFNQzFrdWV5cVlKVVRXai9leDllS2VZU2VLcFNLSW1tREkr?=
 =?utf-8?B?U000MDVyU2pFUHhiU2FRLzNuY0U5QkcxdTc0VkpHdkpVZkdZK3ZnZ2lCVFJC?=
 =?utf-8?B?eW5kN0xKc0o1WUlndXRCajhzMjM1UHdDeEhnWitjL2x4cDVBOHd5MFh3NWFK?=
 =?utf-8?B?eDB1ck5JSDl3QngzV1kzcHRJTTJjaTBON2o3Y1pCMXE0YmNFQU1yWnFVR0lt?=
 =?utf-8?B?OEpQZGo4MWNURGIxRmpOSmNRTTcySSt4SzhqTXhiRUJpZU40NCszNStTZjA2?=
 =?utf-8?B?NWsxdkxMUFp4L1FlWElYeTBGR3FIY3JIY0ZsS01uTTF1d2dtRUxaQzlOb28r?=
 =?utf-8?B?cW41NUM1QkFtZUhmd0g2bC9pTGN4ZWNwUURSaGl4eU9HY3hMVC9RN01Za0dQ?=
 =?utf-8?B?M0NkdVVuRzc3YzFqQjllSzQ2aXU5WmlYc2dJSGJwK2dxUDQ4MVBWTHRQSmo0?=
 =?utf-8?B?ZGQ2Q2NUckQ3UjRMQ1FzOHpZVStabFByZGk3OU9ITkpwT083UXl2R3BYcytF?=
 =?utf-8?B?ZVNmdmtxanFXeU80SlFJU2x6S1VVQU8zWCtRTWx4ZUYyK1ZiK1lhbGFJdVBz?=
 =?utf-8?B?eXdRWjR0cGdvM0hqN0xuZjM0M0RJZnV4QnJxbkRIZHFkYk5pYU1La09xOUFa?=
 =?utf-8?B?TmNrZkhFdS9vanRXbm9zOWdDN1NoYkh0TFE1Qnh0QlZqcUE1dGZEYnpsTTQz?=
 =?utf-8?B?eW1UMVN4YXV5OVF4SUdiN0wzSGdqOTJwZUhCQ3F3bmR4L1RpSWVFRnpQU04r?=
 =?utf-8?B?YUllbnBLUVZUOG1Hc0tUd1RCRjNkczByRnRVSTU0RE1nVitXZXhERllkMXcy?=
 =?utf-8?B?cmxYL1p1YnlncTR6K3ZPb2xaWDNMZlV5TDZTYVJzbVZjRkVYTm43ekQ4TU02?=
 =?utf-8?B?RGxSUDJ4Q2RscUFYNERHamJCL0c0NGZEaGsrQkJDdk9qdTlsZ2xjWllnU1d2?=
 =?utf-8?B?bkRRczhhR04vdndXYmlGZEoyZGVzbFhIM1l2bTVyTGYweUlIRWw5cnc0OE04?=
 =?utf-8?B?V1hGcHZDWG1PcXlzRlVFNEhIMUZaZU4wdUJ5RVQ2NU84MkQ3azl1elMvcWpW?=
 =?utf-8?B?Rk1qSGRDMmhrTFphUTlMRTRCL2tuNHl0VFd2WXBSM2hkTkhQYW9EZStyKys0?=
 =?utf-8?B?dW1KQkNubjVEWmY4Q1lEK0s3OXhRcmRvVGxpUlc3eFJQQkdtQnNVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52D3E33F9313A34A87CB98520DAF7CC8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bdbf69-7b21-481c-1a85-08d999fa4fd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 10:04:20.9295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kR6s0d1VUf9vhBh6/Aeic74RNF2Ah4abHe5u78tybb1cNbNn3skC2HqcPVxr7xJgxSSViUlHRxTru/PcnJC2d4Foe05hOjzOrw6O/+TcXLk0nRoeFW2o0nN/wo/7HPUX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6324
X-Proofpoint-GUID: fzR4vii7jUQx7x1lQpeDL3fD7-caD9yN
X-Proofpoint-ORIG-GUID: fzR4vii7jUQx7x1lQpeDL3fD7-caD9yN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=528
 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110280055

SGksIGFsbCENCg0KV2hpbGUgd29ya2luZyBvbiBQQ0kgcGFzc3Rocm91Z2ggb24gQXJtIEkgc3Rl
cHBlZCBvbnRvIGEgY3Jhc2gNCndpdGggdGhlIGZvbGxvd2luZyBjYWxsIGNoYWluOg0KDQpwY2lf
cGh5c2Rldl9vcA0KIMKgIHBjaV9hZGRfZGV2aWNlDQogwqAgwqDCoCDCoGluaXRfYmFycyAtPiBt
b2RpZnlfYmFycyAtPiBkZWZlcl9tYXAgLT4gcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJR
KQ0KIMKgIGlvbW11X2FkZF9kZXZpY2UgPC0gRkFJTFMNCiDCoCB2cGNpX3JlbW92ZV9kZXZpY2Ug
LT4geGZyZWUocGRldi0+dnBjaSkNCg0KVGhlbjoNCmxlYXZlX2h5cGVydmlzb3JfdG9fZ3Vlc3QN
CiDCoCB2cGNpX3Byb2Nlc3NfcGVuZGluZzogdi0+dnBjaS5tZW0gIT0gTlVMTDsgdi0+dnBjaS5w
ZGV2LT52cGNpID09IE5VTEwNCg0KV2hpY2ggcmVzdWx0cyBpbiB0aGUgY3Jhc2ggYmVsb3c6DQoN
CihYRU4pIERhdGEgQWJvcnQgVHJhcC4gU3luZHJvbWU9MHg2DQooWEVOKSBXYWxraW5nIEh5cGVy
dmlzb3IgVkEgMHgxMCBvbiBDUFUwIHZpYSBUVEJSIDB4MDAwMDAwMDA0ODFkZDAwMA0KKFhFTikg
MFRIWzB4MF0gPSAweDAwMDAwMDAwNDgxZGNmN2YNCihYRU4pIDFTVFsweDBdID0gMHgwMDAwMDAw
MDQ4MWQ5ZjdmDQooWEVOKSAyTkRbMHgwXSA9IDB4MDAwMDAwMDAwMDAwMDAwMA0KKFhFTikgQ1BV
MDogVW5leHBlY3RlZCBUcmFwOiBEYXRhIEFib3J0DQouLi4NCihYRU4pIFhlbiBjYWxsIHRyYWNl
Og0KKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMjI0NmQ4Pl0gX3NwaW5fbG9jaysweDQwLzB4YTQg
KFBDKQ0KKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMjI0NmMwPl0gX3NwaW5fbG9jaysweDI4LzB4
YTQgKExSKQ0KKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMjRmNmQwPl0gdnBjaV9wcm9jZXNzX3Bl
bmRpbmcrMHg3OC8weDEyOA0KKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMjdmN2U4Pl0gbGVhdmVf
aHlwZXJ2aXNvcl90b19ndWVzdCsweDUwLzB4Y2MNCihYRU4pwqDCoMKgIFs8MDAwMDAwMDAwMDI2
OWM1Yz5dIGVudHJ5Lm8jZ3Vlc3Rfc3luY19zbG93cGF0aCsweGE4LzB4ZDQNCg0KU28sIGl0IHNl
ZW1zIHRoYXQgaWYgcGNpX2FkZF9kZXZpY2UgZmFpbHMgYW5kIGNhbGxzIHZwY2lfcmVtb3ZlX2Rl
dmljZQ0KdGhlIGxhdGVyIG5lZWRzIHRvIGNhbmNlbCBhbnkgcGVuZGluZyB3b3JrLg0KDQpJZiB0
aGlzIGlzIGEgbWFwIG9wZXJhdGlvbiBpdCBzZWVtcyB0byBiZSBzdHJhaWdodGZvcndhcmQ6IGRl
c3Ryb3kNCnRoZSByYW5nZSBzZXQgYW5kIGRvIG5vdCBtYXAgYW55dGhpbmcuDQoNCklmIHZwY2lf
cmVtb3ZlX2RldmljZSBpcyBjYWxsZWQgYW5kIHVubWFwIG9wZXJhdGlvbiB3YXMgc2NoZWR1bGVk
DQp0aGVuIGl0IGNhbiBiZSB0aGF0Og0KLSBndWVzdCBpcyBiZWluZyBkZXN0cm95ZWQgZm9yIGFu
eSByZWFzb24gYW5kIHNraXBwaW5nIHVubWFwIGlzIG9rDQogwqAgYXMgYWxsIHRoZSBtYXBwaW5n
cyBmb3IgdGhlIHdob2xlIGRvbWFpbiB3aWxsIGJlIGRlc3Ryb3llZCBhbnl3YXlzDQotIGd1ZXN0
IGlzIHN0aWxsIGdvaW5nIHRvIHN0YXkgYWxpdmUgYW5kIHRoZW4gdW5tYXBwaW5nIG11c3QgYmUg
ZG9uZQ0KDQpJIHdvdWxkIGxpa2UgdG8gaGVhciB5b3VyIHRob3VnaHQgd2hhdCB3b3VsZCBiZSB0
aGUgcmlnaHQgYXBwcm9hY2gNCnRvIHRha2UgaW4gb3JkZXIgdG8gc29sdmUgdGhlIGlzc3VlLg0K
DQpUaGFuayB5b3UgaW4gYWR2YW5jZSwNCk9sZWtzYW5kcg==

