Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4023240A0
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 20:47:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSnFm-0007fw-3k; Mon, 20 May 2019 18:43:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Q6f=TU=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hSnFk-0007fr-Lm
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 18:43:16 +0000
X-Inumbo-ID: 1fdc3bac-7b2f-11e9-8980-bc764e045a96
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe42::61c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1fdc3bac-7b2f-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 18:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcLnK78WlmuE9tpxYhG767dIXfaltnloKi8D6x10QrM=;
 b=OaQE4G0nW+uQ4wK0bu7gyoPGikqJmt3BzjRkcMKBL+P9I5xOeUTQs7lseSM5ZHg/uU6q3LKNQckul8zwJ4eH0PjEDWnQPH6NOFvfW3+86Ehz2gfCfS4firtUHdvbwPdG9OKwqIRVxQFjgQvdBS1ruSuGUZ2T3ZSAP55XAnz5h+o=
Received: from MWHPR12MB1597.namprd12.prod.outlook.com (10.172.55.8) by
 MWHPR12MB1407.namprd12.prod.outlook.com (10.169.207.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Mon, 20 May 2019 18:43:10 +0000
Received: from MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::3817:55a0:bcc0:eb2e]) by MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::3817:55a0:bcc0:eb2e%5]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 18:43:10 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/svm: Drop support for AMD's Lightweight Profiling
Thread-Index: AQHVDvS0i5MhS65X7EuSqAff36wR1aZ0WdAA
Date: Mon, 20 May 2019 18:43:10 +0000
Message-ID: <20190520184306.GC23047@amd.com>
References: <1558347216-19179-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1558347216-19179-1-git-send-email-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0501CA0084.namprd05.prod.outlook.com
 (2603:10b6:803:22::22) To MWHPR12MB1597.namprd12.prod.outlook.com
 (2603:10b6:301:e::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 540a802e-cebc-4275-0c61-08d6dd53019b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1407; 
x-ms-traffictypediagnostic: MWHPR12MB1407:
x-microsoft-antispam-prvs: <MWHPR12MB1407723C6E0531BA46DCC343E5060@MWHPR12MB1407.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(136003)(39860400002)(376002)(366004)(199004)(189003)(66556008)(66446008)(66946007)(64756008)(26005)(186003)(33656002)(66476007)(316002)(99286004)(5660300002)(76176011)(73956011)(71200400001)(71190400001)(6506007)(386003)(25786009)(6246003)(4326008)(6916009)(102836004)(478600001)(54906003)(14454004)(52116002)(72206003)(86362001)(53936002)(36756003)(3846002)(6486002)(256004)(229853002)(6116002)(2906002)(1076003)(7736002)(305945005)(11346002)(6512007)(6436002)(4744005)(476003)(2616005)(446003)(81166006)(81156014)(8676002)(8936002)(66066001)(68736007)(486006)(16393002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1407;
 H:MWHPR12MB1597.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CQJvVIkA0e6Gw7Hp7wIqpJFzfifcUPPEC4eRI1eHB1pX+QVMwp+8YXtfro08ItTH1UoIRn98E6eO1mIlE/v5UO9fAuU+XlS8gQxV4j2AercAWYdFHTNe8KoAu+pKgFIX9dTSdIpe1x2QuvUjlpfR1snf6Jm+GUO+6QoAtmPenyGRdjoqwzQUjiLB+OQ0Xr2NMNfufYWCLN3TcDXbonjave6wCFwJTJ1WKhk67tOcA8DrWRJuOkQyky4yhvUZk/M4imGlhIIY3ml5ZfRl+Z0C0qF+tbopT/kcdXjuSX/NQgVXmfKrBrZhH1/gLJYKpzej3BUjZoLb4aTewSwoXaT22crup/SCKjqocmH6r46eZX4LXG3MeM+J7G0kp95knDgMq1zrUdeC2HslzF/cdn7/yaeMmM85CCdLBgGbj7ryTKs=
Content-ID: <E8ED69DEAAFB0C4ABFA410918182B81F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540a802e-cebc-4275-0c61-08d6dd53019b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 18:43:10.1819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1407
Subject: Re: [Xen-devel] [PATCH] x86/svm: Drop support for AMD's Lightweight
 Profiling
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
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Woods,
 Brian" <Brian.Woods@amd.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6MTM6MzZBTSArMDEwMCwgQW5keSBDb29wZXIgd3Jv
dGU6Cj4gTGlnaHR3ZWlnaHQgUHJvZmlsaW5nIHdhcyBpbnRyb2R1Y2VkIGluIEJ1bGxkb3plciAo
RmFtMTVoKSwgYnV0IHdhcyBkcm9wcGVkCj4gZnJvbSBaZW4gKEZhbTE3aCkgcHJvY2Vzc29ycy4g
IEZ1cnRoZXJtb3JlLCBMV1Agd2FzIGRyb3BwZWQgZnJvbSBGYW0xNS8xNiBDUFVzCj4gd2hlbiBJ
QlBCIGZvciBTcGVjdHJlIHYyIHdhcyBpbnRyb2R1Y2VkIGluIG1pY3JvY29kZSwgb3dpbmcgdG8g
TFdQIG5vdCBiZWluZwo+IHVzZWQgaW4gcHJhY3RpY2UuCj4gCj4gQXMgYSByZXN1bHQsIENQVXMg
d2hpY2ggYXJlIG9wZXJhdGluZyB3aXRoaW4gc3BlY2lmaWNhdGlvbiAoaS5lLiB3aXRoIHVwIHRv
Cj4gZGF0ZSBtaWNyb2NvZGUpIG5vIGxvbmdlciBoYXZlIHRoaXMgZmVhdHVyZSwgYW5kIHRoZXJl
Zm9yZSBhcmUgbm90IHVzaW5nIGl0Lgo+IAo+IERyb3Agc3VwcG9ydCBmcm9tIFhlbi4gIFRoZSBt
YWluIG1vdGl2YXRpb24gaGVyZSBpcyB0byByZW1vdmUgdW5uZWNlc3NhcnkKPiBjb21wbGV4aXR5
IGZyb20gQ1BVSUQgaGFuZGxpbmcsIGJ1dCBpdCBhbHNvIHRpZGllcyB1cCB0aGUgU1ZNIGNvZGUg
bmljZWx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4K
CkkndmUgY29uZmlybWVkIHdpdGggSFcgZW5naW5lZXJzIHRoYXQgaXQncyBnb2luZyBhd2F5LgoK
LS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
