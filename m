Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B149B704
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 21:24:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1F7M-0005OA-PD; Fri, 23 Aug 2019 19:21:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gZL1=WT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i1F7L-0005O5-07
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 19:20:59 +0000
X-Inumbo-ID: 21f0c21c-c5db-11e9-adef-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21f0c21c-c5db-11e9-adef-12813bfff9fa;
 Fri, 23 Aug 2019 19:20:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltKGFAFAUKLmH3odz1LYouW+Ti+JCw7UcdTAIkWu684/ND9qe7CecTBB15gvUjXL9+fhghLNZTXIsSxa+E90HZwgdtW3UeOQp/tAW3Bm4uqvKSJv7GV2+CbdjWQOG+1U7rTsnl8a/nLxVhfZsj/+yLHfXOB6jXkoRtGl/Vo8FgVpxKmobKJvaemnUV4xBBtraj4KhvMT2HnbeO1lwXyVX4HjXhEcuKzvqKzNbBhyZHf34uNaclyD4Q2oBlVPrJBn7Z0HXWfTovBbKl7GCWQiw68gbeBljize4xrh9FS6t+Kn7y2JcE5YsjuTeo91+ztkabfQYMbd1n1bJon0LRaOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvbExPw7N3I3ANX5SD7QJqDGxgpOH4919mH76kADAUo=;
 b=D2/Ahgc+mQbO/3kFT1Hz2ZVBDLtlY1GYQ5qz98T9uCkb5lWdOod/PHtOv9cMJjDdkWbAHayZL+6aRe7EAl7p1Hhu5vDU1/A8N3+Gq/GxUTOpknQc9iWA0Ik64gXbcNCFEadyrJIb2n3M/3MpYT/oOQmAGbs4NcskrsKzy177nQryMBMvCHjiuPjwzfI8nvw33hN6wrXxFgfppIk6V020HPJVQF6x2N5duGU89Fp7c2arPI2riyoFE3tl9djKOOMeHSFqeh7KAaQIijstCMxd2gGG20BU/Nz9pZStDLdcphuVCggcHukpVhN+0VkLmyJaMWOjkfQXxCM2bWpNRigkUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvbExPw7N3I3ANX5SD7QJqDGxgpOH4919mH76kADAUo=;
 b=bf0FA/P8zPNwP6/n+5s8BOLcP9sV6Vxy5SNgAvYijh861WIeNCXgNDoh/0unk3zw6Ps4sBokf9UC5zdm5R9iorkgzYsjB5YMCPn/ra5sp3bVADBBHbWslYCE+bQ1X9AeTqF357IIJbKLgGYH0pf0pgXn9d8uGOW989y3Vz7r+WIaTPpCTfwCI296J43JG7gNWGDyBEhUYkgj0PJVhRJVGiCycPn6cycvY9LGUhfV3TJRa8CmgpTlHt2MsYy5u6MAs2F4T3DvhJDXY6G/zPqwK3zty9ZG4u8cgfOJSDcKrNUUxpcjo2ljBJcPugmpOzN3ARRNsutbjXdhwHNr/mdo0w==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3905.eurprd03.prod.outlook.com (52.135.145.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 19:20:56 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 23 Aug 2019
 19:20:55 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 5/5] xen/arm: optee: remove experimental status
Thread-Index: AQHVWeNoGYDEXCwUxUmqcOQgXXsTCKcJF84AgAAEMIA=
Date: Fri, 23 Aug 2019 19:20:55 +0000
Message-ID: <87v9ung02w.fsf@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-6-volodymyr_babchuk@epam.com>
 <d54ec451-7aa5-d289-8080-708e91d9e39d@arm.com>
In-Reply-To: <d54ec451-7aa5-d289-8080-708e91d9e39d@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a51baf7-108b-4b46-ed92-08d727ff0594
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3905; 
x-ms-traffictypediagnostic: AM0PR03MB3905:|AM0PR03MB3905:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB3905A314382883CC2DF9EC0BE6A40@AM0PR03MB3905.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(199004)(189003)(14444005)(256004)(476003)(81166006)(2616005)(8676002)(53546011)(81156014)(446003)(14454004)(55236004)(102836004)(11346002)(99286004)(7736002)(305945005)(71200400001)(478600001)(71190400001)(76176011)(26005)(6506007)(2906002)(66946007)(6246003)(66446008)(66556008)(64756008)(3846002)(186003)(66476007)(6116002)(76116006)(4326008)(80792005)(316002)(91956017)(36756003)(6436002)(8936002)(86362001)(53936002)(6486002)(4744005)(6916009)(25786009)(66066001)(6512007)(5660300002)(54906003)(486006)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3905;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Cj7nW9qTPhBnsEUROCiTy7lBD/FvYYJyfidM0lCBdUMzK2kGIUUOnzBbqvi3Kmk1ebWZwJoPEWI/AJ6LNvNCHu1OXobd+On1niUfqfIx1BUCeBnAZYaV96hMfWUWPSwBQSfso9zodQo/a2IcyxEh26qpVLSzRHVoDSG7R8V4s1r9kBzd+r40RjULrT3ts3iGuPpNJpy1JYFdA2qfjn8euD0nIT8l6S7ObS4EWbcCROMsyzgVfK9dfwwdUoUnjT0E3vMZmo1qE6tXnEcHyCG//rLlx9gZVUJwEVScCA6Vgwh0onmlMqK4PkAd1qh6kHNDr6PepBHFpCAt/53h/vK1r6QLf+Q9veub3Dh8cNJy+KhNqLXhL2+Kf9AUZT7M/tE25fcOx+FwG5oP5eX/e2NA8MVkSuBtImUuTaKPl+3nvdg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a51baf7-108b-4b46-ed92-08d727ff0594
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 19:20:55.8585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jhBz9i8ZGmOtxgyvz44OzZOW1eLpPW8Sg+QPC32XjZBhXql+m4DS0FLf9kqHwO46y30f9FXZreSnMGw5W6MHbK4N1O294j/SZMepZZnAu4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3905
Subject: Re: [Xen-devel] [PATCH 5/5] xen/arm: optee: remove experimental
 status
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gOC8yMy8xOSA3
OjQ4IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gQXMgYWxsIFRPRE9zIGFuZCBwb3Rl
bnRpYWwgc2VjdXJpdHkgaXNzdWVzIGFyZSByZXNvbHZlZCBub3csCj4+IHJlbW92ZSBleHBlcmlt
ZW50YWwgc3RhdHVzIGZyb20gT1AtVEVFIG1lZGlhdG9yLgo+Cj4gTG9va2luZyBhdCBTVVBQT1JU
Lk1ELCBJIHRoaW5rIE9QLVRFRSB3aXRob3V0IHRoaXMgc2VyaWVzIHdvdWxkIGJlCj4gY29uc2lk
ZXJlZCBhcyAiRXhwZXJpbWVudGFsIi4KUmlnaHQuCgo+Cj4gV2l0aCB0aGlzIHNlcmllcyBhcHBs
aWVkLCBJIHN0aWxsIHRoaW5rIHdlIHNob3VsZCBrZWVwIHRoZSBLY29uZmlnCj4gYmVoaW5kIEVY
UEVSVCBidXQgbWFyayBpdCBhcyAiVGVjaG5pY2FsIFByZXZpZXciIGZvciBhdCBsZWFzdCBhCj4g
cmVsZWFzZS4gVGhpcyB3b3VsZCBlbmNvdXJhZ2UgcGVvcGxlIHRvIHRlc3QgYW5kIHJlcG9ydCBh
bnkgcG90ZW50aWFsCj4gaXNzdWVzIHdpdGggT1AtVEVFLgo+Cj4gV2UgY2FuIHJlLWRpc2N1c3Mg
YWJvdXQgdGhlIHN0YXRlIGluIGEgZmV3IG1vbnRocyBmb3IgZnV0dXJlIHJlbGVhc2UuCj4KPiBC
VFcsIFNVUFBPUlQuTUQgc2hvdWxkIGJlIHVwZGF0ZWQgdG8gcmVmbGVjdCB0aGUgc3RhdGUgb2Yg
T1AtVEVFIGluIFhlbi4KRmFpciBlbm91Z2guIEluIHRoZSBuZXh0IHZlcnNpb24gSSdsbCByZXBs
YWNlIHRoaXMgcGF0Y2ggd2l0aCBwYXRjaCB0bwpTVVBQT1JULm1kLiBPciBpdCBpcyBiZXR0ZXIg
dG8gcHVzaCBzZXBhcmF0ZSBwYXRjaCBmb3IgdGhlIGRvY3VtZW50YXRpb24/CgotLSAKVm9sb2R5
bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
