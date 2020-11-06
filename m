Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE3F2A9697
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 14:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20758.46769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb1MW-0004PP-MO; Fri, 06 Nov 2020 13:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20758.46769; Fri, 06 Nov 2020 13:01:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb1MW-0004P0-J4; Fri, 06 Nov 2020 13:01:04 +0000
Received: by outflank-mailman (input) for mailman id 20758;
 Fri, 06 Nov 2020 13:01:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BqUO=EM=epam.com=prvs=9579144100=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kb1MV-0004Ov-6q
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 13:01:03 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b40c188e-1e27-4de5-9eab-c9aca128b04a;
 Fri, 06 Nov 2020 13:01:02 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6CsqAZ011420; Fri, 6 Nov 2020 13:00:56 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 34kf84h66w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 13:00:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3218.eurprd03.prod.outlook.com (2603:10a6:208:9::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Fri, 6 Nov
 2020 13:00:50 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.021; Fri, 6 Nov 2020
 13:00:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BqUO=EM=epam.com=prvs=9579144100=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kb1MV-0004Ov-6q
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 13:01:03 +0000
X-Inumbo-ID: b40c188e-1e27-4de5-9eab-c9aca128b04a
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b40c188e-1e27-4de5-9eab-c9aca128b04a;
	Fri, 06 Nov 2020 13:01:02 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A6CsqAZ011420;
	Fri, 6 Nov 2020 13:00:56 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
	by mx0a-0039f301.pphosted.com with ESMTP id 34kf84h66w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2020 13:00:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWm18a8+X5jtHm/NUIMsbCFlyyLVd+C++pID0u+9lgtGGZIa4+BgFsUsOGWFZfR9knIvIqWWyH0zu5De3HVY20s9Y9J6DYJ9uiTvJYbG6xqH1c+hCLEusVKWiy/VW8DOWf5lVg0tjGZ1a2L4areQI01cb2O2E9CKl1t+gU7LQ5D2hUpCy4AaxcWrtYSUL4vIBj0baG0cVuNBVHqlIyjfglK2Npo+VH/zkW1ypXApjQL7qP/tzuWoVcPX4ytDdIPIT11cNwlL5OWH25OFXyJyZAHN00nwze4sIkPWx9WiMeAez9aa+ZMSlCo7GXIlybmTZfvFiITD4kr/T44AYN4utQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwDCZ+OlAF0THOMm7ZqhAlW/d1ywIZxkUK/1c1HgFtM=;
 b=gqMRpnEJeAmcJMaO4zM7sQyt/yr9OZsNdqRwnEHrTBLTJ0lyC3rcGHX/YPWyN8wDo1q5AzD2WWFwBCHd0lU2lM08egI+JOiVop7Jxdr+UgqxG+57KHyvKVJH8RbAPCCmyAwVub/uOXQWyroUkqUqBcIpKFwiwfSK8KJg+mqz3onVxOHxPBIdp+dF1mqkOZlSi6zoXCH8l5DYeIbY9mE0NGFuaN1eAdknqCFdllKDvRHSfSYhmWKZRSdJmNmg/svbFOMfa6rDg52eGlcMVQ4X/kLCg2UmzVqTf8SxBMOtUkEBC9mcQqbEH1BNh7eHQuUV8HXiv3+clTfAX69wOwCAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwDCZ+OlAF0THOMm7ZqhAlW/d1ywIZxkUK/1c1HgFtM=;
 b=K1AnOBKQu/0DZeha3rodeS7DgOVII/Q+cz1JbiAz9pt6w+dGQTR9LAK8pQiqGUOHZ67/U3p4VfNqi9MhjWZqmhhk5HBfi2Z1u6s2JjEpPVNz3quUlXp6B/VdvssaEyMxBI9/JrZgFtXp2gOb8Hu5kOGr7303tFj4Vli2mXYECjKjjN8u1bLKGMPVfyTgOxezrOWY7Rfb6PGt3w9xKDx/wpLj3uX/3+p9N5+DnPi7ss26Nqju5XStqnSgVY7eLiGK/1DmqojFTsldqT0K6FAGHosAlbF9ifjZAd3rkZZjGyZt1GG5fu1igGAqKywurFQ+3k1lFUPIM3Nih7DDZgPu0g==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3218.eurprd03.prod.outlook.com (2603:10a6:208:9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Fri, 6 Nov
 2020 13:00:50 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.021; Fri, 6 Nov 2020
 13:00:50 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: 
 AQHWrqmeCV4SGlhADU2GY14D47cn76mwZCkAgAP4JoCAAELzAIAABK0AgAZ074CAAAOBgA==
Date: Fri, 6 Nov 2020 13:00:50 +0000
Message-ID: <2f62f34b-f47d-3472-511f-a89ec1cd36c3@epam.com>
References: 
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
 <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
 <B8E54A16-8FD4-48E4-82D5-2205EEEB5D2C@arm.com>
 <1001ace5-c6a2-4a81-ba3d-edabeeea9336@epam.com>
 <5F09F481-DC27-4FC3-8CE5-F4F97FDF6DF9@arm.com>
In-Reply-To: <5F09F481-DC27-4FC3-8CE5-F4F97FDF6DF9@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 858acb6b-f880-497d-d05a-08d88253fcc4
x-ms-traffictypediagnostic: AM0PR0302MB3218:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3218D868E94242D8DE4E812EE7ED0@AM0PR0302MB3218.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6s5czRuPtB9tqGwNSdSdM6PlMklc9q8aG+/o/hW5BlmGIIOdguyjDkyKGnrpKyHqjtt5b2Q4Qibwh5My42oFTvEBTUPgry9UbrfDv++K90fPhzLAlj3lTXg43lJw9Vxnj5x9eZKhQAdM3fO4R91S21J4O5shhuk+1E4iKWFTdumGLkMTtV5hW6v4wyYXlSUsd6CvUTGVEiy6Dt5ABMxXUW85U9wuSgT4zYj0lLR1Z45BLlSpVuTucE5tyKYUKdkfsykaXmGf7J24FAB7aqiHD6H1MIQ55ban3qBHxurCrNcV/91n5ujks4pYYxdarVZwEfk2++mAM28pfpRVf3x5zg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(53546011)(6506007)(2906002)(107886003)(26005)(31696002)(54906003)(186003)(71200400001)(86362001)(2616005)(316002)(31686004)(6916009)(6512007)(8936002)(6486002)(66476007)(91956017)(8676002)(5660300002)(76116006)(64756008)(66556008)(478600001)(66946007)(4326008)(66446008)(83380400001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 0qtY1brwH3YTDYsOXw7ogq5cEptvSi6iVcMShB0b3MwjE2JOv0+bPijSdIKSxub8BVLrZpzv/CkmBzXgQAdQl0WbCKmfyRjOypoNGrXy8FbswkWtt9xH2fwDh54fAyAudj7MpdC+fSBzlOsEB/W+oMYBtcaBUKFKLqdDWZuCn/aZQJWg3Vx4eYf8DX8BFD2KT1MIwIS9gpumDfqeuhu3ozWlEXgoX9U9+eny5nkHb/ERlOZ3rTAJLbqfbDOog00LFSlnb5d/efbvmwtfQWysKDIIwOJ6j3TfDues7nenckyEgg0wNnybLOKvvMmfXmg/Z7+djtYgorf52pP0hCi2sNSUqIXPKQjUtmiwXi4cBTWaIf8GomRx8bror5C3QBj6RC6jtgeiibJzgYd0QohDPd/Z2OgfcMjmQ7voAYsAKMNzBkicwkT6pZLwtKZleGgdmwJ1UJifzh1uEWE/H/I7JBrW9zBgRbTo2Llwo4dJND7gnnAfBVQ5GTOzJxtSM2PvKblhp3sArlOwywjHdqbImN7TSMPn9oFzrrRS7UqhwsMyo9fqJhZxwNcD2axNcXYr4VAiUCH7rDYtNiK4bNNUFwB77EEDh/BvOFbrvsiQ1PbaizX4BVyIFFEeC2zgXIBf5QMG1EV98lAiee+UT42kPQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <16B9E70D59E6B944A7DDA3ECB74022D8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858acb6b-f880-497d-d05a-08d88253fcc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 13:00:50.7269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x59XSMMTlwtJYdoFgY/g9GH+vpZLLefpjXTId+VICgllf0YqskvTCMGvLHDy17Hwp3EFhOuG9E01yFSaAr4OXHg56XfcQz8fLgQlDtRFkFSgNdiiIH8j/I3QQrx5k6DU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3218
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-06_04:2020-11-05,2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011060091

SGVsbG8sIFJhaHVsIQ0KDQpPbiAxMS82LzIwIDI6NDggUE0sIFJhaHVsIFNpbmdoIHdyb3RlOg0K
PiBIZWxsbyBPbGVrc2FuZHIsDQo+DQo+PiBPbiAyIE5vdiAyMDIwLCBhdCAxMDoxMiBhbSwgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gPE9sZWtzYW5kcl9BbmRydXNoY2hlbmtvQGVwYW0uY29tPiB3
cm90ZToNCj4+DQo+PiBIaSwNCj4+DQo+PiBPbiAxMS8yLzIwIDExOjU1IEFNLCBCZXJ0cmFuZCBN
YXJxdWlzIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+Pj4+IE9uIDIgTm92IDIwMjAsIGF0IDA1OjU1
LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8YW5kcjIwMDBAZ21haWwuY29tPiB3cm90ZToNCj4+
Pj4NCj4+Pj4gSGksIEp1bGllbiENCj4+Pj4NCj4+Pj4gT24gMTAvMzAvMjAgNzoxOCBQTSwgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gSGkgT2xla3NhbmRyLA0KPj4+Pj4NCj4+Pj4+IE9uIDMw
LzEwLzIwMjAgMTA6NDQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+IE9u
IDEwLzIwLzIwIDY6MjUgUE0sIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+PiBBZGQgc3VwcG9y
dCBmb3IgQVJNIGFyY2hpdGVjdGVkIFNNTVV2MyBpbXBsZW1lbnRhdGlvbnMuIEl0IGlzIGJhc2Vk
IG9uDQo+Pj4+Pj4+IHRoZSBMaW51eCBTTU1VdjMgZHJpdmVyLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBN
YWpvciBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSBMaW51eCBkcml2ZXIgYXJlIGFzIGZvbGxvd3M6
DQo+Pj4+Pj4+IDEuIE9ubHkgU3RhZ2UtMiB0cmFuc2xhdGlvbiBpcyBzdXBwb3J0ZWQgYXMgY29t
cGFyZWQgdG8gdGhlIExpbnV4IGRyaXZlcg0KPj4+Pj4+PiAgICAgICB0aGF0IHN1cHBvcnRzIGJv
dGggU3RhZ2UtMSBhbmQgU3RhZ2UtMiB0cmFuc2xhdGlvbnMuDQo+Pj4+Pj4gRmlyc3Qgb2YgYWxs
IHRoYW5rIHlvdSBmb3IgdGhlIGVmZm9ydHMhDQo+Pj4+Pj4NCj4+Pj4+PiBJIHRyaWVkIHRoZSBw
YXRjaCB3aXRoIFFFTVUgYW5kIHdvdWxkIGxpa2UgdG8ga25vdyBpZiBteSB1bmRlcnN0YW5kaW5n
IGNvcnJlY3QNCj4+Pj4+Pg0KPj4+Pj4+IHRoYXQgdGhpcyBjb21iaW5hdGlvbiB3aWxsIG5vdCB3
b3JrIGFzIG9mIG5vdzoNCj4+Pj4+Pg0KPj4+Pj4+IChYRU4pIFNNTVV2MzogL3NtbXV2M0A5MDUw
MDAwOiBTTU1VdjM6IERUIHZhbHVlID0gZXZlbnRxDQo+Pj4+Pj4gKFhFTikgRGF0YSBBYm9ydCBU
cmFwLiBTeW5kcm9tZT0weDE5NDAwMTANCj4+Pj4+PiAoWEVOKSBXYWxraW5nIEh5cGVydmlzb3Ig
VkEgMHg0MDAzMTAwMCBvbiBDUFUwIHZpYSBUVEJSIDB4MDAwMDAwMDBiODQ2OTAwMA0KPj4+Pj4+
IChYRU4pIDBUSFsweDBdID0gMHgwMDAwMDAwMGI4NDY4ZjdmDQo+Pj4+Pj4NCj4+Pj4+PiBbc25p
cF0NCj4+Pj4+Pg0KPj4+Pj4+IElmIHRoaXMgaXMgZXhwZWN0ZWQgdGhlbiBpcyB0aGVyZSBhbnkg
cGxhbiB0byBtYWtlIFFFTVUgd29yayBhcyB3ZWxsPw0KPj4+Pj4+DQo+Pj4+Pj4gSSBzZWUgWzFd
IHNheXMgdGhhdCAiT25seSBzdGFnZSAxIGFuZCBBQXJjaDY0IFBUVyBhcmUgc3VwcG9ydGVkLiIg
b24gUUVNVSBzaWRlLg0KPj4+Pj4gSnVzdCBmb3IgY2xhcmljYXRpb24sIHlvdSBhcmUgdHJ5aW5n
IHRvIGJvb3QgWGVuIG9uIFFFTVUsIHJpZ2h0Pw0KPj4+PiBFeGFjdGx5DQo+Pj4+PiBZb3UgbWln
aHQgYmUgYWJsZSB0byB1c2UgdGhlIHN0YWdlLTEgcGFnZS10YWJsZXMgdG8gaXNvbGF0ZSBlYWNo
IGRldmljZSBpbiBYZW4uIEhvd2V2ZXIsIEkgZG9uJ3QgdGhpbmsgeW91IHdpbGwgYmUgYWJsZSB0
byBzaGFyZSB0aGUgUDJNIGJlY2F1c2UgdGhlIHBhZ2UtdGFibGVzIGxheW91dCBiZXR3ZWVuIHN0
YWdlLTEgYW5kIHN0YWdlLTIgaXMgZGlmZmVyZW50Lg0KPj4+PiBTbywgaXQgaXMgZXZlbiBtb3Jl
IHdvcmsgdGhlbg0KPj4+IE92ZXJhbGwgaXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvIHNwZW5k
IHNvbWUgdGltZSBhZGRpbmcgcHJvcGVyIHN1cHBvcnQgaW4gUWVtdSB0aGVuIHRyeWluZyB0byBt
b2RpZnkgdGhlIGRyaXZlciB0byBzdXBwb3J0IFFlbXUgcmlnaHQgbm93Lg0KPj4+DQo+Pj4+Pj4g
V2UgYXJlIGludGVyZXN0ZWQgaW4gUUVNVS9TTU1VdjMgYXMgYSBmbGV4aWJsZSBwbGF0Zm9ybSBm
b3IgUENJIHBhc3N0aHJvdWdoDQo+Pj4+Pj4NCj4+Pj4+PiBpbXBsZW1lbnRhdGlvbiwgc28gaXQg
Y291bGQgYWxsb3cgdGVzdGluZyBkaWZmZXJlbnQgc2V0dXBzIGFuZCBjb25maWd1cmF0aW9ucyB3
aXRoIFFFTVUuDQo+Pj4+PiBJIHdvdWxkIHJlY29tbWVuZCB0byBnZXQgdGhlIFNNTVUgc3VwcG9y
dGluZyBzdXBwb3J0aW5nIHN0YWdlLTIgcGFnZS10YWJsZXMuDQo+Pj4+IFlvdSBtZWFuIGluIFFF
TVU/DQo+Pj4gU2VlIGJlZm9yZS4NCj4+Pg0KPj4+Pj4gUmVnYXJkbGVzcyB0aGF0LCBJIHRoaW5r
IFhlbiBzaG91bGQgYmUgYWJsZSB0byBzYXkgdGhlIFNNTVUgaXMgbm90IHN1cHBvcnRlZCByYXRo
ZXIgdGhhbiBjcmFzaGluZy4NCj4+Pj4gWWVzLCB0aGF0IHdvdWxkIGJlIG5pY2UNCj4+PiBGdWxs
eSBhZ3JlZSBhbmQgd2Ugd2lsbCBsb29rIGludG8gdGhhdC4NCj4+Pg0KPj4+IEFueXRoaW5nIHlv
dSBjb3VsZCBzaGFyZSBzbyB0aGF0IHdlIGNvdWxkIHF1aWNrbHkgcmVwcm9kdWNlIHlvdXIgc2V0
dXAgd291bGQgYmUgbW9yZSB0aGVuIGdyZWF0Lg0KPj4gTm90aGluZyBzcGVjaWFsLA0KPj4NCj4+
IHFlbXUvYWFyY2g2NC1zb2Z0bW11L3FlbXUtc3lzdGVtLWFhcmNoNjQgLW1hY2hpbmUgdHlwZT12
aXJ0IC1tYWNoaW5lIHZpcnQsZ2ljLXZlcnNpb249MiBcDQo+Pg0KPj4gLW1hY2hpbmUgdmlydHVh
bGl6YXRpb249dHJ1ZSAtY3B1IGNvcnRleC1hNTcgLXNtcCA0IC1tIDIwNDggLW5pYyB1c2VyLGhv
c3Rmd2Q9dGNwOjEyNy4wLjAuMToyMjIyLToyMiBcDQo+Pg0KPj4gLW5vZ3JhcGhpYyAtc2VyaWFs
IG1vbjpzdGRpbyBbLi5zbmlwLi5dDQo+Pg0KPj4gSSBhbHNvIHNldCBpb21tdSB0byBzbW11djMg
aW4gbXkgdGVzdHMsIFFFTVUgZW11bGF0b3IgdmVyc2lvbiA0LjIuMQ0KPiBJIGp1c3QgY2hlY2tl
ZCBhbmQgY29uZmlybWVkIHRoYXQgUUVNVSBpcyBib290aW5nIHdpdGggWEVOIFNNTVV2MyBwYXRj
aCBhbmQgWEVOIGlzIGFibGUgdG8gc2F5IFNNTVUgdHJhbnNsYXRpb24gaXMgbm90IHN1cHBvcnRl
ZC4gQXMgWEVOIHN1cHBvcnRzIFN0YWdlLTIgdHJhbnNsYXRpb24gYW5kIFFFTVUgc3VwcG9ydHMg
U3RhZ2UtMSBvbmx5Lg0KPg0KPg0KPiAoWEVOKSBTTU1VdjM6IC9zbW11djNAOTA1MDAwMDogU01N
VXYzOiBEVCB2YWx1ZSA9IGV2ZW50cQ0KPiAoWEVOKSBTTU1VdjM6IC9zbW11djNAOTA1MDAwMDog
SURSMC5DT0hBQ0Mgb3ZlcnJpZGRlbiBieSBGVyBjb25maWd1cmF0aW9uIChmYWxzZSkNCj4gKFhF
TikgU01NVXYzOiAvc21tdXYzQDkwNTAwMDA6IG5vIHRyYW5zbGF0aW9uIHN1cHBvcnQhDQo+IChY
RU4pIEkvTyB2aXJ0dWFsaXNhdGlvbiBkaXNhYmxlZA0KPg0KPiBPbmx5IGRpZmZlcmVuY2UgSSBv
YnNlcnZlZCBpcyB0aGF0IHlvdSBoYXZlIHRvIGFkZCBvcHRpb24gIi1tYWNoaW5lIHZpcnQsaW9t
bXU9c21tdXYzIOKAnCB3aGVuIGxhdW5jaGluZyB0aGUgUUVNVS4NCkkgZG8gdXNlIHRoZSBvcHRp
b24NCj4NCj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIGl0IGFsc28gd29ya3MgZm9yIHlvdS4NCg0K
V2VsbCwgSSBzaG91bGQgaGF2ZSByZXBvcnRlZCB0aGF0IGVhcmxpZXIgdGhhdCBJIGRvIG5vdCB1
c2UgdGhlIHN0YWdpbmcgWGVuIGF0IHRoZSBtb21lbnQsDQoNCml0IGlzIDQuMTQuMC4gU28sIGNh
biB0aGlzIGJlIGEgcHJvYmxlbSB3aXRoIHRoYXQgWGVuIHZlcnNpb24/DQoNCkFueXdheXMsIGlm
IGl0IHdvcmtzIHdpdGggdGhlIHN0YWdpbmcgdGhlbiBldmVyeXRoaW5nIGxvb2tzIG9rDQoNClRo
YW5rIHlvdSwNCg0KT2xla3NhbmRyDQoNCj4gICANCj4+PiBSZWdhcmRzDQo+Pj4gQmVydHJhbmQN
Cj4+Pg0KPj4+Pj4gQ2hlZXJzLA0KPj4+Pj4NCj4+Pj4gVGhhbmsgeW91LA0KPj4+Pg0KPj4+PiBP
bGVrc2FuZHI=

