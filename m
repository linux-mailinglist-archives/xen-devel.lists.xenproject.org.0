Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C0C29C34A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 18:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13010.33528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXT2i-00086p-1D; Tue, 27 Oct 2020 17:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13010.33528; Tue, 27 Oct 2020 17:45:55 +0000
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
	id 1kXT2h-00086Q-TY; Tue, 27 Oct 2020 17:45:55 +0000
Received: by outflank-mailman (input) for mailman id 13010;
 Tue, 27 Oct 2020 17:45:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y/3m=EC=epam.com=prvs=8569373f95=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kXT2g-00086L-Tl
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 17:45:55 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63d278ad-0552-4652-b109-cd6e2f16e7fd;
 Tue, 27 Oct 2020 17:45:52 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09RHjgIH026592; Tue, 27 Oct 2020 17:45:46 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0b-0039f301.pphosted.com with ESMTP id 34e54t3g8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Oct 2020 17:45:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6769.eurprd03.prod.outlook.com (2603:10a6:20b:284::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 27 Oct
 2020 17:45:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 17:45:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=y/3m=EC=epam.com=prvs=8569373f95=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kXT2g-00086L-Tl
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 17:45:55 +0000
X-Inumbo-ID: 63d278ad-0552-4652-b109-cd6e2f16e7fd
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 63d278ad-0552-4652-b109-cd6e2f16e7fd;
	Tue, 27 Oct 2020 17:45:52 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09RHjgIH026592;
	Tue, 27 Oct 2020 17:45:46 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
	by mx0b-0039f301.pphosted.com with ESMTP id 34e54t3g8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2020 17:45:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpNNHHQG/GlLyivcHn2uUx5U1NBgqlmw36XjSD4XPaGeDizIvcHmb+6n2HHHiTPxVOZXys6hom9+yeyfyl9/3nrtsu++GKHuK/tTuwBwBrKtJ//ZgSt0sltDymluSsREJq1uI2hTKMlfQZvWfKxTRmr8XesyjpMdfTHhGgtMQfcGM0WB5Kugbz6aRvU/GBR35fpcdK3LIiRUqJCpui8A4IaeMU6Tq8vHmzoMbrj6KvF5bSxBEa8VZCUAxxwgGAh8dF2QiabQK2cPUDrWIIa94v6HhFfEPVUo5JwyjNLc/3PZ64u9EnJalMl1MBxdzbILUICCDytHD10pF9eyGgbvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxMtAn0oVQ8AIZRTVRlBeBKcXCog6gx3h8ndcnk02q0=;
 b=d+wgvZZ475zOBXTJ8Mx1XBBQjIrYfvrULco5ntlZr82YCaybkyI46zJ5S81R/aXhnjjqWHq74Q8G2KPutsPb4BGb7RsgloLEVEn1ZN3SIYv4USGMzCSzVgN3O664BcJXKyj2cGEGmqPm2FSyJ8TSSq+HMT4QUlzHovyAfEI01IpRRY881tkmqnxIBUV2QuII/Xm9QIEbaxKhInmNQgrrxf5UbzMj83YVc7Ki0iY9y5IinIFDbwGaeyReo/CxxmlT8Jj2A5RBwiP1p+3rOBDuZa4EuQ4SbaC1DGeQRJjfa9OU2LGRaA9I/SzrdFmAAeRqCVeYLAwaLYyrObjxsL7Wbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxMtAn0oVQ8AIZRTVRlBeBKcXCog6gx3h8ndcnk02q0=;
 b=54NKx9K+xVydgGkNwyQyZE5FpK4+SazerDxtz3zptoDHiuNiKaX4XNNBwg6gbbxE2GJRVgYgiOWbCqJII3r/sSM9tLWwK0p4gC0GDotdi4ex11P/K5trE6RAl5ZK8QGKKvSzhAwwWi6bOc58kOgQfO+ryvrY0eLyoHFHAbwHo2eIz0wrvAbtFuYxftxXPANznfz/MEVIF6dAanPflR+bKlZoJ8knddiRSnrPOZP6vA/lyrC3l4l4SjZxHwjeOMsRf3iSyWW1nyaBgcO6cHlm9QVKMTKilptSm+0YdIboPygeD4Y7ZKxhs51Hh8dvFEYNK4npWT+XIxn5KIyZxWph0A==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6769.eurprd03.prod.outlook.com (2603:10a6:20b:284::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 27 Oct
 2020 17:45:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 17:45:44 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "wl@xen.org"
	<wl@xen.org>, "paul@xen.org" <paul@xen.org>,
        Artem Mygaiev
	<Artem_Mygaiev@epam.com>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        xen-devel <xen-devel@lists.xenproject.org>,
        Rahul Singh <Rahul.Singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: ARM/PCI passthrough: libxl_pci, sysfs and pciback questions
Thread-Topic: ARM/PCI passthrough: libxl_pci, sysfs and pciback questions
Thread-Index: AQHWrEfNmyZZUV4zgEum5lDBP9dPxqmraEMAgAAxlICAABfnAIAAB66A
Date: Tue, 27 Oct 2020 17:45:44 +0000
Message-ID: <1e8b43e5-7d44-a061-f60a-00f75eb19b8b@epam.com>
References: <ad25a5ba-f44c-4e88-f3b0-e0baa5efc5f6@epam.com>
 <20201027125104.axv26kdqljqsvufn@Air-de-Roger>
 <ac342c70-8fbb-023d-00b3-4a1bc1d389a7@epam.com>
 <7f98534d-39fd-cbcb-13dd-bbbd994251f0@suse.com>
In-Reply-To: <7f98534d-39fd-cbcb-13dd-bbbd994251f0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 531fa3a9-6f30-4def-71a6-08d87aa0216d
x-ms-traffictypediagnostic: AM9PR03MB6769:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM9PR03MB6769A8B46F495E981264226FE7160@AM9PR03MB6769.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fiMnY5MVas6HamH5Dd15gokfS/digVvZjXTi17DxN9NU+4ZAz3oHKurTuWxzTEvlQwIwdJYwxpouRAKMCTVlJ6+YbAfkLb0w6UcgTzIYwWZ5LSdpluhIzL42emsvPHE5Cx4lY+3/pYbRvJ8ucvwImkebI9cFViZVwk/fEvg7C2JlDxze++UyvakniyifPoNCEMUE+1GGREzWixXhFr1kNdbr4lJQfOAlRnpWsGEirpWlBXDUE1q176kaNWvl9ULxNjX+Izg/HpQEi2ycdcrSdg4oiUbMgW9YqTteY/iKlvDUIjP6dE03ii9Ecv2oSK0XYgR0rT6RdqSKSxFI4ijVhg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(86362001)(8936002)(4326008)(7416002)(36756003)(6512007)(478600001)(2906002)(83380400001)(31696002)(53546011)(6506007)(71200400001)(66446008)(64756008)(66556008)(91956017)(186003)(5660300002)(2616005)(66476007)(6486002)(8676002)(26005)(66946007)(76116006)(6916009)(316002)(31686004)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 y2Lne5/j+lWGGznvKszfM5BbZLRcTB9JTf4p8iMk2evh2smX/paefTFfT7tA5YoWi0lACqP39LSlWg/N4TqFP2uLbYTQY3jpXD+0xIFUdhJb43nl3DtnatP8HJIs4fAAwIOzTJoB4I/Zuzgldm/pK0Uvy5VTljRJd9E/zQkn6Ggl7NslnL69BzhS9Ro0iKPgMMJsHAEsoTVcP42qfyuTeGturaViRkfeGYxre76yuBIySr2qyPwQSNe3clCl1xOahVtIJtfMmKFAAyia4DKt9f90FLIcbATYhLhxnDPjUL9hxr2/QjkO99Pzf4QlaJlVBRn0zYCSct1+PLC8vxNnpAEiBPqmJrfk0FkiraGn37vVJMCgCQbyKGhs56l5LnuF5M9paX/ksYiZxQCEpgwXGU2jkvR6MUxNhuxr56+O9bcQDovjJOHarTW9flmqNgVWWSdPc8FDAoxPAAt4RObuf2wtzy4AIeKN8eYK8zpNgdAvLHzlZhNtcJCrO9oTlvw85bjkkTtZsTkXCOFXD89FS/ZwM6xZQGrONaj3T2DcofivjcO5kZk3fWbUjGgXZUl+CiAnoQfE+DqJdt1EUdNYRy3UUw4Sf7vdbaH3zUoBW2X2TCg0caHytt4Xv1/gZVRAe/mKLg06fE8E7969wfQFIQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A32E5BEBD11A14FB55F700B1E604478@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 531fa3a9-6f30-4def-71a6-08d87aa0216d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 17:45:44.6404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EgGk9QSfUp8W+ttftuZ7QtNAwyiYloHz0GMggaLbDhmdx7n88Ce1saDWgr1RNY16nFiu0VHS6nY9lSJlePYoSNezabqcpw815oY2YbpqvGVBDXaBH5HlDAzDgfK4LogX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6769
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-27_10:2020-10-26,2020-10-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270106

T24gMTAvMjcvMjAgNzoxOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjEwLjIwMjAg
MTY6NTIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMTAvMjcvMjAgMjo1
NSBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBUdWUsIE9jdCAyNywgMjAyMCBh
dCAwOTo1OTowNUFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4g
ICAgwqA1LiBBbiBhbHRlcm5hdGl2ZSByb3V0ZSBmb3IgMy00IGNvdWxkIGJlIHRvIHN0b3JlIHRo
YXQgZGF0YSBpbiBYZW5TdG9yZSwgZS5nLg0KPj4+PiAgICDCoMKgwqAgTU1JT3MsIElSUSwgYmlu
ZCBzeXNmcyBwYXRoIGV0Yy4gVGhpcyB3b3VsZCByZXF1aXJlIG1vcmUgY29kZSBvbiBYZW4gc2lk
ZSB0bw0KPj4+PiAgICDCoMKgwqAgYWNjZXNzIFhlblN0b3JlIGFuZCB3b27igJl0IHdvcmsgaWYg
TU1JT3MvSVJRcyBhcmUgcGFzc2VkIHZpYSBkZXZpY2UgdHJlZS9BQ1BJDQo+Pj4+ICAgIMKgwqDC
oCB0YWJsZXMgYnkgdGhlIGJvb3Rsb2FkZXJzLg0KPj4+IEFzIGFib3ZlLCBJIHRoaW5rIEkgbmVl
ZCBtb3JlIGNvbnRleHQgdG8gdW5kZXJzdGFuZCB3aGF0IGFuZCB3aHkgeW91DQo+Pj4gbmVlZCB0
byBzYXZlIHN1Y2ggaW5mb3JtYXRpb24uDQo+PiBXZWxsLCB3aXRoIHBjaWJhY2sgYWJzZW5jZSB3
ZSBsb29zZSBhICJkYXRhYmFzZSIgd2hpY2ggaG9sZHMgYWxsIHRoZSBrbm93bGVkZ2UNCj4+DQo+
PiBhYm91dCB3aGljaCBkZXZpY2VzIGFyZSBhc3NpZ25lZCwgYm91bmQgZXRjLg0KPiBXaGF0IGhh
c24ndCBiZWNvbWUgY2xlYXIgdG8gbWUgKHNvcnJ5IGlmIEkndmUgb3Zlcmxvb2tlZCBpdCkgaXMN
Cj4gd2h5IHNvbWUgZm9ybSBvZiBwY2liYWNrIGlzIG5vdCBhbiBvcHRpb24gb24gQXJtLg0KWWVz
LCBpdCBpcyBwcm9iYWJseSBwb3NzaWJsZSB0byBydW4gcGNpYmFjayBldmVuIHdpdGhvdXQgcnVu
bmluZw0KDQpwY2lmcm9udCBpbnN0YW5jZXMgaW4gZ3Vlc3RzIGFuZCBvbmx5IHVzZSB0aGF0IGZ1
bmN0aW9uYWxpdHkNCg0Kd2hpY2ggaXMgbmVlZGVkIGZvciB0aGUgdG9vbHN0YWNrLiBXZSBjYW4g
ZXZlbiBoYXZlIGl0IGFzIGlzIHdpdGhvdXQNCg0KbW9kaWZpY2F0aW9ucyBnaXZlbiB0aGF0IHBj
aWZyb250IHdvbid0IHJ1biBhbmQgdGhhdCBwYXJ0IG9mIHRoZSBwY2liYWNrDQoNCnJlbGF0ZWQg
dG8gUENJIGNvbmZpZyBzcGFjZSwgTVNJIGV0Yy4gd29uJ3Qgc2ltcGx5IGJlIHVzZWQsIGJ1dCBz
dGlsbA0KDQpwcmVzZW50IGluIHRoZSBwY2liYWNrIGRyaXZlci4gV2UgY2FuIHRyeSB0aGF0IChw
Y2liYWNrIGlzIHg4Ng0KDQpvbmx5IGluIHRoZSBrZXJuZWwpLg0KDQo+IFdoZXJlIGl0IHdvdWxk
DQo+IG5lZWQgdG8gcnVuIGluIHlvdXIgc3BsaXQgaGFyZHdhcmUtZG9tYWluIC8gRG9tMCBzZXR1
cCAoaWYgSSBnb3QNCj4gdGhhdCByaWdodCBpbiB0aGUgZmlyc3QgcGxhY2UpIHdvdWxkIGJlIGEg
c2Vjb25kYXJ5IHF1ZXN0aW9uLg0KDQpUaGlzIGFjdHVhbGx5IGJlY29tZXMgYSBwcm9ibGVtIGlm
IHdlIHRoaW5rIGFib3V0IGh3ZG9tICE9IERvbTA6DQoNCkRvbTAvdG9vbHN0YWNrIHdhbnRzIHRv
IHJlYWQgUENJIGJ1cyBzeXNmcyBhbmQgaXQgYWxzbyB3YW50cyB0byBhY2Nlc3MNCg0KcGNpYmFj
aydzIHN5c2ZzIGVudHJpZXMuIFNvLCBmb3IgRG9tMCdzIHRvb2xzdGFjayB0byByZWFkIHN5c2Zz
IGluIHRoaXMgc2NlbmFyaW8NCg0Kd2UgbmVlZCBhIGJyaWRnZSBiZXR3ZWVuIERvbTAgYW5kIHRo
YXQgaHdkb20gdG8gYWNjZXNzIGJvdGggUENJDQoNCnN1YnN5c3RlbSBhbmQgcGNpYmFjaydzIHN5
c2ZzOiB0aGlzIGNvdWxkIGJlIGltcGxlbWVudGVkIGFzIGEgYmFjay1mcm9udCBwYWlyDQoNCndp
dGggYSByaW5nIGFuZCBldmVudCBjaGFubmVsIGFzIFBWIGRyaXZlcnMgZG8uIFRoaXMgYXBwcm9h
Y2ggb2YgY291cnNlIHdpbGwNCg0KcmVxdWlyZSB0aGUgdG9vbHN0YWNrIHRvIHdvcmsgaW4gdHdv
IG1vZGVzOiBsb2NhbCBzeXNmcy9wY2liYWNrIGFuZCByZW1vdGUgb25lcy4NCg0KSW4gdGhlIHJl
bW90ZSBhY2Nlc3MgbW9kZWwgdGhlIHRvb2xzdGFjayB3aWxsIG5lZWQgdG8gY3JlYXRlIGEgY29u
bmVjdGlvbiB0bw0KDQp0aGUgaHdkb20gZWFjaCB0aW1lIGl0IHJ1bnMgYW5kIHJlcXVpcmVzIHN5
c2ZzIGRhdGEgd2hpY2ggc2hvdWxkIGJlIGFjY2VwdGFibGUuDQoNCkl0IGNhbiBhbHNvIGJlIHBv
c3NpYmxlIHRvIGhhdmUgdGhlIHRvb2xzdGFjayBhbHdheXMgdXNlIHRoZSByZW1vdGUgbW9kZWwg
ZXZlbg0KDQppZiBpdCBydW5zIGxvY2FsbHkgd2hpY2ggd2lsbCBtYWtlIHRoZSB0b29sc3RhY2sn
cyBjb2RlIHN1cHBvcnQgYSBzaW5nbGUgbW9kZWwgZm9yIGFsbA0KDQp0aGUgdXNlLWNhc2VzLg0K
DQooTmV2ZXIgdGhvdWdodCBpZiBpdCBpcyBwb3NzaWJsZSB0byBydW4gYm90aCBiYWNrZW5kIGFu
ZCBmcm9udGVuZCBpbiB0aGUgc2FtZSBWTSB0aG91Z2gpLg0KDQo+IEphbg0KDQpUaGFuayB5b3Us
DQoNCk9sZWtzYW5kcg0K

