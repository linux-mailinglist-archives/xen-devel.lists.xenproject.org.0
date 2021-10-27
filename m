Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D843C610
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216760.376485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfera-0001tg-Pj; Wed, 27 Oct 2021 09:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216760.376485; Wed, 27 Oct 2021 09:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfera-0001rn-LU; Wed, 27 Oct 2021 09:04:50 +0000
Received: by outflank-mailman (input) for mailman id 216760;
 Wed, 27 Oct 2021 09:04:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lYk=PP=epam.com=prvs=0934bd4bd6=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mferY-0001rh-9v
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:04:48 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c93286fb-4ed4-44d5-b8ff-0c485591516b;
 Wed, 27 Oct 2021 09:04:46 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R7UDwc012695; 
 Wed, 27 Oct 2021 09:04:43 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0b-0039f301.pphosted.com with ESMTP id 3by2eggc27-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 09:04:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2832.eurprd03.prod.outlook.com (2603:10a6:800:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Wed, 27 Oct
 2021 09:04:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 09:04:39 +0000
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
X-Inumbo-ID: c93286fb-4ed4-44d5-b8ff-0c485591516b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0Gv+Q9cBwpSno8syZtRhOvIgsm+AvcUGhpaxfb8Ab/OrPgEnKaMfMn4yEHGG2mm3DPrBIuHr7D5IgRShqzeQ9imyazNs4JsQqNhfhEM8vN89XzqsIH4xwmSwDedSo7E3OV3xk8JilJqpa7NQ9BbLSRYn1x38QtLiRd8iJvcXtTzPzgxl+egeiE3RWJupxBJJpxBpCdiqm2HgUzTT4ljLHs1B40/v28fWL2SIOtzqVMhZVVKOZ1pqmIgcoXF+qMh07bgXtbdRA8it4RhKFIgnSudFIrbrxhDH4BRwnkCqpLg7zJDP1MfL8rD/as9bWhcCsjn3+FOyKZhLyAuY1P7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv9zJQPL3nIqemrx8qq+x7E+SZ8svFnEHALGKBzaTDE=;
 b=aiA6fuIU+6SDyUIQc6fMelFhv9XsZPObGmUKK9Y2okfgVDp3hIS/M6YFSME+mAhUcveMRw8CtC8V9vi4ZbBgfyQE5JX3ZfaslTtCFf2vteoIPL+sXFBNw04m23NoAZANLRqcjOH6I9But7VPQRvxfLl6E390tydsexjxolAWqH4jkh0Uaz9GwE/6pLkv5W3TYC6qVIyDKJ8efTlcrlKv66TPisoY+B4mvlUZo+kl7C0nDIIkosF0j+KcTzy411oTg8XVh0ryiGhc4c7nMAgxTOnGFNwD0f9yJSZJxEJd0ERQWBm8sCnQ5ZNVSZks3b1A1gPKO6TQJYw5cMG0UYZhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv9zJQPL3nIqemrx8qq+x7E+SZ8svFnEHALGKBzaTDE=;
 b=a9w05tj3SpYeDwptDfUaKhXd42GSZwueHjnpDuPbpiMVR5ARzKyJiY/y23GZOnGEnX2I4gXujbnMbkJlHCbRoXB8fmSZMnJK173rNpjCBUOFDlwRiCymI5DAmvGRF3mf+Kld3aMIPFlgoyU7I0wx3J4DApMBy1XkwyV7pSupyDlHqkYzVl0vGmXblbsrnmCLWo3WFmjJBEt1UdPjfg/Fn+2JbsfVzar67ffjiIKm/RChd492/CGIRno2C/Mhd2LCmtFw831uOp77WTEni9Kj2/oweZpvoAX/9ecM/wRazVgOs4JdHQmFjNHGFsjknINSfvfDUpoZWisnMA1pCGAGfQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Index: AQHXyww6rKHs3LJru0q52eLUia+oNavmi9YAgAABaAA=
Date: Wed, 27 Oct 2021 09:04:39 +0000
Message-ID: <0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <YXkU+DKYmvwo+kak@Air-de-Roger>
In-Reply-To: <YXkU+DKYmvwo+kak@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e3ad1fa-ae3f-467e-6b1d-08d99928ce7e
x-ms-traffictypediagnostic: VI1PR0302MB2832:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2832EB9541A2BB67B25E9259E7859@VI1PR0302MB2832.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2Q80hxgKLB7UqqNJ100srOGbP9P/VNbzQ/fENSI5VIG4VNSvJfBaEh13ntmEY4iVzxpndho2a3Ia/zuLMVLLpVYwfm7Cfd03JKEuY1zt7hWz+V6v0abOcso/61DbX3W28Ljaqbxguhb7NkQjnPVDp5LXdTiHauyWX4dtMnGXMfPtgSatSLzFZtJXltAnxyf5uu/HIlhHEVpS14KuJw1lceESOW/odc3oMETMnLP6eDPZ2hZwviAIOM9+JI5rPEvwuAOYT60jnpukK8BR41Yo8lpwFj/ppAfOIQmzPeMUuHalSc0UHqHUigRKTLleWECSXebtXVZA6p3qs/VhxkCfzrAWwrY6uc/r+YVdOc5l64hc//fozoBDiERu1hZ4kd1Sd1LKml2iWIjh92d8fk5LIXSlO9KB/UJJV60euK6BwB0L21HJoppayRb/juLFxt9xYGQTFDLYepD7/Ow7ehv/zSUmXRVJ4U4UZi71aAIxs6+B5LtvcrodR4Q3vfdIt98Xqyck745YrT8uy6VRYzyyeH/MihAVhGm/PZnAiljn8uMQK+v/MrKI6lqohpPoOS7OkwqpFd+Q9jTmGs+KpYxReqh39iSR2qvhX+8XsCFDCEtyD44Yv6oBG417KUdqQgocMy92RJbkOmi9eH3udV+GNatEa5hJo79RWRkqcO7ZxelyGTlQ2iPKMamZ3Dlpid2zBex+4xjZpN94lwXhbOSXELdi5adUtHIGvuBz8YxnHKs/6nlQmSZ5T56bdKxmOfDkinmf7PTfW02ayD/P0N1FM22+Fz1+4CnN8YVCygnALy+qUYPv5FrJbQGDw53wSY3vzXRaDhx+ETt72pYCoDrmgQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(186003)(6916009)(122000001)(66446008)(54906003)(8936002)(83380400001)(508600001)(5660300002)(31696002)(91956017)(53546011)(8676002)(26005)(66946007)(966005)(64756008)(107886003)(2616005)(66556008)(38070700005)(6486002)(71200400001)(31686004)(86362001)(6512007)(2906002)(316002)(6506007)(76116006)(36756003)(66476007)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bE03cThMQW9iRmRLWDRNbytMaFgxYlEwaFJEV0dUVGZiTm1rMW9kQnoxTUts?=
 =?utf-8?B?ZmxzSjZpd1dZRnE5R2U3Qnk3UHVUNzF1UWgyUlBXYXc5UDNDVnNQenkvVGZC?=
 =?utf-8?B?VWlKMUxYOEg1OTdCUmZMQmJBRTU1Q2FlWm1YdVE4N1V4RTlkS1cyRXhqc2ZK?=
 =?utf-8?B?RjJKYVNNTmNTd1ZjS2c3SzFtV0RtWFJLSzV6RWtZTHdVQUxmckZNWmJmK01q?=
 =?utf-8?B?ME83ZFhvemVoUzYzQ0p4d2RSbk5aQXVrajdDOTR6NUhkcjF2RFlpcGZwbHFY?=
 =?utf-8?B?Q2dnUWxWaEdGczZrWFZ4d3dSUXQrSHZNdTdjU3p5bEtYSDE4ZFZRUHJqajBi?=
 =?utf-8?B?ZDNHdTQ2dFBrTXoyNG1oK200TWQwZytpTThQMWppOHllNFpyd0FnWkptaWRs?=
 =?utf-8?B?ZVpWb0NCcjhPaWNoYzdVV2NvWjBjSHI1bnA4cTVGN3FzSlV5TnU1MTQ3c0Zr?=
 =?utf-8?B?QzViVnR3N1Vkc2V3WmY1MlJWQmxZVFZreVNtMjl5VUxxelFNZjRZSU9NYVhO?=
 =?utf-8?B?RGdGL3VGK0t3dVJTYzFBQStOb2RnckcyYzFZQ3FwNW9vb29UYmQrb2YrNGxE?=
 =?utf-8?B?U3Bscy9hNForS0RnSTV3c1R3a1NJZUFoSllqM2ovRy96WU91bGwycVovS1Zo?=
 =?utf-8?B?ekpUNlA2bS81cHMvWFFzOEtUN3JJSmo3WUpRaEw4UGFlMG5RRkFRU2ZBdTR2?=
 =?utf-8?B?M1RzdllsTmN4TW9icmFubzhpYlUwWElrQVpBd3ZNeCsxcTNxYVRuejRNWkJm?=
 =?utf-8?B?V01GNm1uRE9DeTRxbjMvWnlBc0U0QWhybllTUWJHZC9RbUR2ZWQrOXp1aVJH?=
 =?utf-8?B?ZTUzQUlQYVVwWnhORFhZWWFxNUwvanhrQnlWTzRBVEtNZkUwVDZpckJ6WGE1?=
 =?utf-8?B?QkE1OHZZcldodGRHSFVwS3p2SVJpQlArUUZ6OVgzdDU1cTI3cXJvZWEzT0w4?=
 =?utf-8?B?SG80VjNzN1BUWTRXMThzZWdrSE1KTTBLQmR1ZmdVVmVHS1gva1pTNjhlaXRL?=
 =?utf-8?B?YmVmUWxxdTVPYWhSSml4U1h4Y1dhS2Jzam5zd01LT2dEN1A3b2d0SDZldzgw?=
 =?utf-8?B?dFZiazhLb2J0WE90dFVJakFLangzb0NXY3I2Slh6NzZNNzE5L0JpSFNHei85?=
 =?utf-8?B?QW42UTRGdHVzeVc1bGhVM3A5RmtJSG1ZT2RKblFxalliR2pnQ2tIalplKzlh?=
 =?utf-8?B?YmFLZ0s3NllrZThFbnBleUJXZm85Um5KbUNtNjJxemI2SzNDTmJTa2ZKRmFC?=
 =?utf-8?B?MEt5TGJHWjJQQW0wOHR2dDNJQmY2WVFDazA0WXJkODVPdnpzWnlMcEgrNFVG?=
 =?utf-8?B?MDlJeTgvQlNURXJhMHUrUlp4UW9pdFhqQTd6UDVJMnZxcU83UlFFcDlOZ3ZK?=
 =?utf-8?B?OXZzU3VibG9tYlFyTTBtdmcrU2VSQXI3STVKYUJNblhVY3RLZnh1SlUzb25V?=
 =?utf-8?B?Z2FlYVBBdzNDbEJTdkwvOWt4M2RrM29JcG4xT09tdndYT0xlUndIRDlseEFL?=
 =?utf-8?B?TUtHM21ZaUJpVmlETEhmMmtnSEdtdlFLWitudlk3RzFvTWs0QXNTOStxdk5a?=
 =?utf-8?B?MUhwU2FLTndzSEVsSW1uWnpleE1ZMU04akU4L1RlRlJRM3U1VTlWbE1mbjda?=
 =?utf-8?B?Y2lvZzVJUFRNMmZDZ1Fjc2l1bFZDR21SbDJMY3FUUi9adkRadlVVcVRUdnUy?=
 =?utf-8?B?RXl1WGh4YnFYemN5c2FLdktFYnA0VTVnZHh1cEZYN2RsK29BQkZoZkZTemNv?=
 =?utf-8?B?b0ZPTUFhUEh5U2phV013QjU0bGJEZHNFRG9Rb0R5ZGdyOHRVSDZrblpHWWdh?=
 =?utf-8?B?enVmUnhBS04xOVlxeXV3UWJMSXdWMlhmTE4xeFVnMThIMnBnTTdld29FaDNu?=
 =?utf-8?B?SHpPdHlkaVlHbEtmclZaUVNnNEVINlNEZWNsNDFSWmw0c0ZuTTM4alpJRjVi?=
 =?utf-8?B?eStoT29BcFRuUGRxN2xMbUU5eTIvbDNhckUxNC9xNXpMcTVOTTlEZDE4WEdP?=
 =?utf-8?B?cWxza2llUHJ2V29YUDVIN2pLMjFzNnlwcHB2eG5MMDV4dVpzanZTSnRBWjhy?=
 =?utf-8?B?bG5QTlJsR3dlWkhER0xjcVVncnY4QmpqVHE3VXIwTGE5aDdUVjdaK0lBV3Nm?=
 =?utf-8?B?MW4wbmRyZVovYzkzZ3ZSSEVvcWw5RnBSeElnQXpqSHY5VGR1UWt3N1JQNGFu?=
 =?utf-8?B?R0p3cE1zUXYyUmZ4SnVVME5ndWtXWGNPOFdzUVh6TmJTdlhqNEV3ZWJaSHR4?=
 =?utf-8?B?SmJGRkRRRDIyaUNkSlN0UDkzdVZRMG5nSWg3TitvYjF1bDlNK0s2NEQ1RjU5?=
 =?utf-8?B?d2lNODZLUDRCNVd6d1lYK1pubHo5cWpqeGpCVW9UTUgweUp1SStvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2182E10A122A7A4791DE378501291340@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3ad1fa-ae3f-467e-6b1d-08d99928ce7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 09:04:39.0514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ob+adZhv/6FzA58xNd/++HFVY8YJINlswDf+nvseq5XWt07R9PRGiWK7mZ1FPk1Y5+SZzNQuAWF3kMQ3t0SfJqoHK6MwB2Qdr62btleSSr7OGswRaLty7/D+qeKRonnY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2832
X-Proofpoint-ORIG-GUID: j1aptlqXwf9GYLYYeySK3FMLlWIanKDY
X-Proofpoint-GUID: j1aptlqXwf9GYLYYeySK3FMLlWIanKDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_02,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270056

SGksIFJvZ2VyIQ0KDQpPbiAyNy4xMC4yMSAxMTo1OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gV2VkLCBPY3QgMjcsIDIwMjEgYXQgMTE6MjU6MzNBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gV2hpbGUgaW4gdlBDSSBNTUlP
IHRyYXAgaGFuZGxlcnMgZm9yIHRoZSBndWVzdCBQQ0kgaG9zdCBicmlkZ2UgaXQgaXMgbm90DQo+
PiBlbm91Z2ggZm9yIFNCREYgdHJhbnNsYXRpb24gdG8gc2ltcGx5IGNhbGwgVlBDSV9FQ0FNX0JE
RihpbmZvLT5ncGEpIGFzDQo+PiB0aGUgYmFzZSBhZGRyZXNzIG1heSBub3QgYmUgYWxpZ25lZCBp
biB0aGUgd2F5IHRoYXQgdGhlIHRyYW5zbGF0aW9uDQo+PiBhbHdheXMgd29yay4NCj4gSSB0aGlu
ayBJJ3ZlIGFscmVhZHkgcmFpc2VkIHRoaXMgZHVyaW5nIHJldmlldyBbMF0uIEJ1dCB0aGlzIGlz
IG9ubHkgYQ0KPiBwcm9ibGVtIGlmIHlvdSBjaGFuZ2UgdGhlIGN1cnJlbnQgdmFsdWUgb2YgR1VF
U1RfVlBDSV9FQ0FNX0JBU0UNCj4gQUZBSUNULCBhcyB0aGUgY3VycmVudCB2YWx1ZSBoYXMgYml0
cyBbMCwyN10gY2xlYXIuDQpFeGFjdGx5LCBzbyB3ZSB3ZXJlIGp1c3QgbHVja3kgbm90IHRvIGhp
dCB0aGlzIGJlZm9yZQ0KPg0KPiBJIGFzc3VtZSB0aGlzIGlzIGEgcHJvYmxlbSBmb3IgdGhlIGhh
cmR3YXJlIGRvbWFpbiB0aGF0IG5lZWRzIHRvIHRyYXANCj4gcmFuZG9tIGJhc2UgYWRkcmVzc2Vz
IGFzIHByZXNlbnQgb24gaGFyZHdhcmUsIGJ1dCB0aGF0IGNvZGUgaGFzbid0DQo+IGJlZW4gY29t
bWl0dGVkIHlldC4NClllcywgSSBhbSBmYWNpbmcgdGhpcyBvbiB0aGUgcmVhbCBIVyB3aGVuIERv
bTAncyBhY2Nlc3MgaXMgdHJhcHBlZA0KYW5kIHRoZSBiYXNlIGlzIG5vdCB0YWtlbiBpbnRvIGFj
Y291bnQuIFNvLCBJIGhhdmUgYSBwYXRjaCBmb3IgdGhlDQpmdXR1cmUgdXBzdHJlYW0gd2hpY2gg
c3VidHJhY3RzIHRoZSByZWxldmFudCBiYXNlIGZyb20gdGhlIGdwYSwNCmUuZy4gZWl0aGVyIEdV
RVNUX1ZQQ0lfRUNBTV9CQVNFIG9yIGJyaWRnZS0+Y2ZnLT5waHlzX2FkZHINCj4NCj4gSWYgdGhh
dCdzIGluZGVlZCB0aGUgY2FzZSwgcGxlYXNlIGV4cGFuZCB0aGUgY29tbWl0IG1lc3NhZ2UgdG8g
Y29udGFpbg0KPiB0aGlzIGluZm9ybWF0aW9uLg0KSSBjYW4gb25seSBtZW50aW9uIGFib3V0ICJ0
aGUgY3VycmVudCB2YWx1ZSBvZiBHVUVTVF9WUENJX0VDQU1fQkFTRQ0KQUZBSUNULCBhcyB0aGUg
Y3VycmVudCB2YWx1ZSBoYXMgYml0cyBbMCwyN10gY2xlYXIiIGFzIG9mIG5vdyBiZWNhdXNlDQpE
b20wIHRyYXBzIGFyZSBub3QgeWV0IHRoZXJlLg0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KPg0KPiBb
MF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsL1lXbG5jM2Iwc2o0YWtVV2FATWFj
Qm9vay1BaXItZGUtUm9nZXIubG9jYWwvDQpUaGFuayB5b3UsDQpPbGVrc2FuZHINCg0KUC5TLiBT
b3JyeSBJIGZhaWxlZCB0byBtYXJrIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIDQuMTYgYW5kIGV4
cGxhaW4gd2h5IGl0IGlzDQphIGdvb2QgY2FuZGlkYXRlIGZvciA0LjE2IGluY2x1c2lvbg==

