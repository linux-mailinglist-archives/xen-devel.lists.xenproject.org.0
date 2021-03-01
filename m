Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFC6327761
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 07:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91244.172363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGbj9-0001E1-Fy; Mon, 01 Mar 2021 06:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91244.172363; Mon, 01 Mar 2021 06:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGbj9-0001Dc-CG; Mon, 01 Mar 2021 06:08:19 +0000
Received: by outflank-mailman (input) for mailman id 91244;
 Mon, 01 Mar 2021 06:08:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JEL4=H7=epam.com=prvs=3694fbac1d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lGbj8-0001DX-GE
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 06:08:18 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 235ddf9c-572c-41ca-b4c3-60119b80160c;
 Mon, 01 Mar 2021 06:08:17 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12167Bb9009863; Mon, 1 Mar 2021 06:08:15 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58])
 by mx0b-0039f301.pphosted.com with ESMTP id 36ymwuuep7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 06:08:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4147.eurprd03.prod.outlook.com (2603:10a6:208:cf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 06:08:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::6156:8f40:92f3:de55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::6156:8f40:92f3:de55%8]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 06:08:12 +0000
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
X-Inumbo-ID: 235ddf9c-572c-41ca-b4c3-60119b80160c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbItb5ix7MwQv5oAs5/YF3nvJgCIs6lbqvWnv1B2+kj+D8NuQaafqKO50fNfQilfTNEo1GPGgT7/X8MMSKrMqx0r5B9yIccuxb68xlVQ00KMYcC63skGkUyaKKH6zDj7+HU3WVj9ZvkWW2nGeBnlN04tejl7SdbWSLmxKr8S3Vt+BCznVltkoZhefb0L8VEVQCTPAmJ2g+6jQXk8niSti2eXKVlKJP2rrBSSLu4TNwAxlK82dVA6AKC9SIWQwjtiMUz+PXFZd7WxYdi3etkR5K2ruzOf0nHAGxhKIoW4GI9Q0zTTq7JuaYqDNVafQaVvBu0nbEADfgzuGtmEJ/In8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiSnG0ZCZwzJDbpZtCiJDkQf60zQman8rTk5+V8RSw0=;
 b=hhs0OmO6m7b+FksGUjWiP8hRJ90P+RVBb+04Da3Fp5nOuf72jiYmbqRAjsiUXue2+Wo55yYsf0ODW5DZQ7TxHhZkqNUZL6+DgOpG2T5SYMgeaRL3g1c9rQfVYgHFQTAFpSewFW1d1TMaBMt9SP5RfshBTCQfgPH6Gvxg6NxefqrM5xv9O/GkNmp4BIps69lfW2xgmazkW1nQzziiDJsV+stV6nCtsgZk/ByeztqrRnJF1d0T/9EjiH6bTozQS/vkSQloFVh8sDkJnRA47Mk/owHGLmdxnJiCEUM7B8nlkF/Ec6dLd9zwesOS00j+Xeal6iJbx26/uOFJRnTFRof7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiSnG0ZCZwzJDbpZtCiJDkQf60zQman8rTk5+V8RSw0=;
 b=yjUdPxV87FpS6+R3n6/figK1m33dER7SYW9dSkKYpkuHbzi91sGGzEWnzcCXzLdwF+jXC+lo7coFbLn9EhiHRQLz2eR2YNRIu5SYfQY/qb9E++yxNEvdXApvzjD11mq2TX/aqOBq77KvF5iU91ufgJQbgcBA55mh6pSIP78KfOnh1pzPi1CGOYAlM+jHcQbcTH3wLi27y3TwpEM5yvputCUuUyUTnZgOgrPmIIwXQ0Hk/ZZraihL3ls9q6XVlIX+UVjYpCZtzVPTFQLReAlqy1qm+/3ebMljX3RDWLh8HceqdFMwHPlqyO2xmvYdSWuIHv59/oYwRmQBhBmYL8TMew==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xen: adjust Kconfig
Thread-Topic: [PATCH] drm/xen: adjust Kconfig
Thread-Index: AQHXCgKuZuE2hAvl4Eu58Fslz5uDM6pm3hiAgACe54CABzF/gA==
Date: Mon, 1 Mar 2021 06:08:12 +0000
Message-ID: <be090aaa-639b-97fc-cd31-d6a01cca7b35@epam.com>
References: <54ae54f9-1ba9-900b-a56f-f48e2c9a82b0@suse.com>
 <a9597f1a-39a6-3664-8617-90338e7943d0@epam.com>
 <CAKMK7uGV25ERN0wy1pJvZqvC0QXBh=oQ_RfpRy7+ViQbEdBNPQ@mail.gmail.com>
In-Reply-To: 
 <CAKMK7uGV25ERN0wy1pJvZqvC0QXBh=oQ_RfpRy7+ViQbEdBNPQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 852417ba-da1c-4774-8a2a-08d8dc786546
x-ms-traffictypediagnostic: AM0PR03MB4147:
x-ms-exchange-minimumurldomainage: lists.freedesktop.org#0
x-microsoft-antispam-prvs: 
 <AM0PR03MB4147BA1BD879088E1D16D873E79A9@AM0PR03MB4147.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AL3OnfzBFAzPKifTyLHPVhKHXx6AcK/VQ0/T9V6cjBwfNsC9q6O1Qr0gGDudN9jmQCYNirWj5DFOowhFZSIn8EmQsUrXdKts2IPfOQL1f0Zu9YqWu1LG0u7DBCwqYFW6tye9I3Re4juow0WJQt3zdXgdvUijfA1zPMIqC7BkF6nOk2GGKEwUEllPSY4S+lSEAz9xVmhzTn5EBJixlbuXwehsg8kV/o89jw6cZO1ZU3PBdfvxcTP+6T7eq9Ivt7zqwP55vMMEjgCPLEGtmWaVVsSdd+yAB/iFRyXpElNkakLgMcKqrO3xh77ApnROb0fYNiyp84/m27kBf0RcqXn+HvFmZv4JKjcoKt7/q42BxXM7Ycvm7o5hSoBdC880veekRiadAOZpaM9Xgq3lRSLZd/BYZOWQMh8CtNmc9X47fgvyQLr40PhLCDIj4Uz2laklDaE4hHXqHD4t8dJTiVizfvHfqihNfXdgNxuplMeiC8uZaNY4FBs0DJd/f/ERhZfTCm3rTTjObKms3DC3UpKFbwowx4bdPEd1GzWULcsj6mymo/8t5Gfjm1kcse9yJHFB+puzPRawbhAMi7kKMUdvhcWfZ8PjqKdw1AV6TcefT+fFSwyogX5QqSGSV0WZKuSy
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(76116006)(8676002)(71200400001)(4326008)(26005)(31696002)(66946007)(478600001)(966005)(5660300002)(66476007)(6486002)(2616005)(6512007)(186003)(2906002)(6506007)(36756003)(64756008)(83380400001)(66556008)(316002)(6916009)(8936002)(54906003)(66446008)(86362001)(31686004)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?dnNZQTE1ZWI3bUV4WVlESnBidkpEL2hia3lGdDFQR2p6K2RPdWtDL3kxY3hW?=
 =?utf-8?B?TEFZVFhwUm9sa0tXM0hzM1VjOUxqYWtNQ2ZEYUYzMDZJQnh1eHZBRE9DTzI4?=
 =?utf-8?B?UkNPeWJ4dDZkNVMxb2szS3o4K2xvQlkyRmo4WmJiUFRMdVU2T0ZRSDlHVVFz?=
 =?utf-8?B?UlB5OElwZ25PdjBzL2ZIYmtDbTNLRU1taVo0TktIbGFncGppeTM5b0lNOHJr?=
 =?utf-8?B?azlvWWNLeW9OOWpJSHNPY0pEdTNEeG4vVm5HOStSZ0NIMnVlNWZnYU9FNUI0?=
 =?utf-8?B?L0RPZUMzLzg1VG5keUJTd081b1BMSTRCUmlkYnAwOTUrcWMwVWsvaGsxNE1T?=
 =?utf-8?B?alMvMFVUZnc2L0U2UTFDcUNaeHRkeHpxcWI1WS83WHYxMDdKWmFkekVKOGV0?=
 =?utf-8?B?a1NkRWp1NW5hODJxQVNkTFVUQjAxRmdoL0lhcXAwek5HR3BVbzBjOGdYSDZ6?=
 =?utf-8?B?UDkxQXFSNU5MVjB3TjlJL2g0cXUzTml5b05YS3JyQWs3MkVvWFBWYWlIZXBM?=
 =?utf-8?B?QkRBbnBYMUt0WjdlYTRqZjhTdDU1ODlvd1NJcHI4MHIra2FhdTM0WFVlbFBj?=
 =?utf-8?B?NURQNEtqdXJqVW5FaWJtaXpoVktncG1IQ0FqblIvb2lXcVdQVlNhem0yNzVE?=
 =?utf-8?B?SGZwUVk5WmZMMzhMalVSRFBOaW1TdjFXTFlLeGE5aUlSRHM2b0hMSy9TZjJZ?=
 =?utf-8?B?YWlnd2M2N3dHekpNbTdCTk9wY0dFTDlCZFlmb2ZUaHl5dXEvR3VwUG1EL2s2?=
 =?utf-8?B?KzhGRTE1dG1QR3pnZHAzMjE1Q05IV3cwdEZnK2dIaHM1em42aHduNkdhUk55?=
 =?utf-8?B?amlpelQ5YVcrY00xaXJkY0dCTlBMRkJDZWdndkdxbzdVUEYxSFJzZU9odG55?=
 =?utf-8?B?RFhvL3pUVHVSTGVyTk1OaUw5d3lVNFVuTTdnczIxZUVDQWJPcXN1ajdjZGpI?=
 =?utf-8?B?YkJ3UlVlbmJTdTNFTzFEM1g2NFRjb3FrRTZwR0R6UllxclIvL3lKNGtQWFJW?=
 =?utf-8?B?VjdESDdIdFFWRzZNL3FhM0YvUVBKNG5aSzI5aDk0YUdGVC9yUjRhS3hha3hu?=
 =?utf-8?B?WDNJTGgyTTdRNUdlaXdXc0FsZ0FkUDRmaEpwNm96a2RmZ1l2R2l4eHY3OExC?=
 =?utf-8?B?WTBZaXhhQWxXTWJqQzNWUnZ3dksydjczcFBOa0IvUm1IVUtqQlpWY09LTm1X?=
 =?utf-8?B?UjZod2liUVMwemx5MTZpSGk1dkRyNTV3Tmc0T1QzV1BuZ3NTOEpmRUw3eW5x?=
 =?utf-8?B?M2MxRGdxZ1FsTW5IazVDZURDbk1YZlZ6UFZLOU5xSllVVlYrN2piV2lqQXhl?=
 =?utf-8?B?R0IvT0xWbDZkUlZqNEJMb1dWTnJ3aGRONktTU05OcndDVVNqZUQvUkZ3QkVy?=
 =?utf-8?B?bGF2TGRxMFlUUGJ1Snl5dVdPbHFsVEpSQ1B1ejVyaW9uZUVMcTQ0N1hPbUhJ?=
 =?utf-8?B?b2p4TlZySVFaVzZpRWExSy9HWEdlQm13RjBYaFhQYnhKdzdhd21KYWVVc052?=
 =?utf-8?B?RTRIUUtIOFhmbVQydjlIVzJVZmRWVThNU0tPSDNoOEdGeDVzUHhybDhWaHFj?=
 =?utf-8?B?L0pUSlB4QnBYZjB0c055UHdPL1cwb3NYaGo5TGgwRy9yakVZd1NKNXJlbGY1?=
 =?utf-8?B?eEM4VWNVNUxRRXgvUHBZTnpHY01POHVETjBoV0ZCSkNCdVM5ZThRS1gwT3lx?=
 =?utf-8?B?Mmg2UFlVUGFLZjkrd2VtbHM0ZHZZcmdBKzk1aWFlK0FLQTY4bnRIZ2ZMTlpZ?=
 =?utf-8?Q?l2pRcp75Mlmek5OExQ3AmxDhuOIBu54SjuCbNiC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE846F9BF33848418DD78AEF28672C47@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852417ba-da1c-4774-8a2a-08d8dc786546
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 06:08:12.5954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kgj6Q3dlN70/iETMojAfONpIJ39qX9i7GlKoUw/VDwH3PJwT+4r+5LoHPcHx5YoGtG9jezSVll1b/2JIXeh9dyg/HRqjsxjj8nhz2J9Lip+FaTEb/cLAEbjnz8a/9JA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4147
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010050

DQpPbiAyLzI0LzIxIDY6MTcgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+IE9uIFdlZCwgRmVi
IDI0LCAyMDIxIGF0IDg6NTUgQU0gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28NCj4gPE9sZWtzYW5k
cl9BbmRydXNoY2hlbmtvQGVwYW0uY29tPiB3cm90ZToNCj4+IEhlbGxvLCBKYW4hDQo+Pg0KPj4g
T24gMi8yMy8yMSA2OjQxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBCeSBoYXZpbmcgc2Vs
ZWN0ZWQgRFJNX1hFTiwgSSB3YXMgYXNzdW1pbmcgSSB3b3VsZCBidWlsZCB0aGUgZnJvbnRlbmQN
Cj4+PiBkcml2ZXIuIEFzIGl0IHR1cm5zIG91dCB0aGlzIGlzIGEgZHVtbXkgb3B0aW9uLCBhbmQg
SSBoYXZlIHJlYWxseSBub3QNCj4+PiBiZWVuIGJ1aWxkaW5nIHRoaXMgKGJlY2F1c2UgSSBoYWQg
RFJNIGRpc2FibGVkKS4gTWFrZSBpdCBhIHByb21wdGxlc3MNCj4+PiBvbmUsIG1vdmluZyB0aGUg
ImRlcGVuZHMgb24iIHRvIHRoZSBvdGhlciwgcmVhbCBvcHRpb24sIGFuZCAic2VsZWN0ImluZw0K
Pj4+IHRoZSBkdW1teSBvbmUuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+PiBSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPiBTaW5jZSB5b3UncmUgbWFp
bnRhaW5lci9jb21taXR0ZXIsIEknbSBhc3N1bWluZyB5b3UnbGwgYWxzbyBtZXJnZQ0KPiB0aGlz
PyBBbHdheXMgY29uZnVzaW5nIHdoZW4gdGhlcmUncyBhbiByLWIgYnV0IG5vdGhpbmcgYWJvdXQg
d2hldGhlcg0KPiB0aGUgcGF0Y2ggd2lsbCBnZXQgbWVyZ2VkIG9yIG5vdC4NCg0KQXBwbGllZCB0
byBkcm0tbWlzYy1uZXh0LA0KDQp0aGFuayB5b3UNCg0KPiAtRGFuaWVsDQo+DQo+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlbi9LY29uZmlnDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
bi9LY29uZmlnDQo+Pj4gQEAgLTEsMTUgKzEsMTEgQEANCj4+PiAgICAjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4+PiAgICBjb25maWcgRFJNX1hFTg0KPj4+IC0gICAg
IGJvb2wgIkRSTSBTdXBwb3J0IGZvciBYZW4gZ3Vlc3QgT1MiDQo+Pj4gLSAgICAgZGVwZW5kcyBv
biBYRU4NCj4+PiAtICAgICBoZWxwDQo+Pj4gLSAgICAgICBDaG9vc2UgdGhpcyBvcHRpb24gaWYg
eW91IHdhbnQgdG8gZW5hYmxlIERSTSBzdXBwb3J0DQo+Pj4gLSAgICAgICBmb3IgWGVuLg0KPj4+
ICsgICAgIGJvb2wNCj4+Pg0KPj4+ICAgIGNvbmZpZyBEUk1fWEVOX0ZST05URU5EDQo+Pj4gICAg
ICAgIHRyaXN0YXRlICJQYXJhLXZpcnR1YWxpemVkIGZyb250ZW5kIGRyaXZlciBmb3IgWGVuIGd1
ZXN0IE9TIg0KPj4+IC0gICAgIGRlcGVuZHMgb24gRFJNX1hFTg0KPj4+IC0gICAgIGRlcGVuZHMg
b24gRFJNDQo+Pj4gKyAgICAgZGVwZW5kcyBvbiBYRU4gJiYgRFJNDQo+Pj4gKyAgICAgc2VsZWN0
IERSTV9YRU4NCj4+PiAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSDQo+Pj4gICAgICAgIHNl
bGVjdCBWSURFT01PREVfSEVMUEVSUw0KPj4+ICAgICAgICBzZWxlY3QgWEVOX1hFTkJVU19GUk9O
VEVORA0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbF9fOyEhR0ZfMjlkYmNRSVVCUEEh
bDhJVG55bHZqbjNUdUFOTGFodHJ5ZUxKaGpIMjBpLTlPaV8xdFlrZEE1OXZYVXBCSHRLbmxRLUtn
LXpVUldfcnVVa0tLYVVBWlEkIFtsaXN0c1suXWZyZWVkZXNrdG9wWy5db3JnXQ0KPg0KPg==

