Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62972259EF
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 23:28:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTCGX-00088C-60; Tue, 21 May 2019 21:25:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C2a6=TV=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hTCGV-000887-8w
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 21:25:43 +0000
X-Inumbo-ID: fbee9393-7c0e-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::604])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fbee9393-7c0e-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 21:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUKqrKeO/NYbvXazvL905g9MH/cFD96OZyVuAiVEbao=;
 b=P9P0fWV5BU7u0OPxKiI2jFzSxrsGKMM0VIMQ4KsUtnRLiS46DteHRe7CxzeGjZ0CYbBt/OWQqW+l2edNMW17RtCh1cVtLjsjqYK/+1NKUXEiQxWHEabYKeLI1pp6pZerGSjX2D9RbPF21u+KJP5SiRAn7Fh6WO0C/RXunXl4zCMYwUbcRdxvdCmS5f0On9lkfDOn1w9OGl9WlnGFgIs8yZxSvNOL8U5VpAoB8vWAg8hgT2oa6/eDXn/zBePusTTEohuxEWMDpf6nelBXDEV20vxG9nsuMMF83D9bPWiC/TiFqOGyIrYNlJDX4K+HebtalnSX2KbxfoF3ammsb1s0jg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB5698.eurprd03.prod.outlook.com (20.179.254.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 21 May 2019 21:25:38 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 21:25:38 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5 00/10]  TEE mediator (and OP-TEE) support in XEN
Thread-Index: AQHVEBu8S7ow419qRUuV+TK06x1pYQ==
Date: Tue, 21 May 2019 21:25:38 +0000
Message-ID: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbc88c4f-42fa-4234-1985-08d6de32de8e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR03MB5698; 
x-ms-traffictypediagnostic: AM0PR03MB5698:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <AM0PR03MB569825D354D65BFDDF66A739E6070@AM0PR03MB5698.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(366004)(346002)(396003)(39860400002)(189003)(199004)(6512007)(6306002)(6486002)(5640700003)(6436002)(68736007)(3846002)(2616005)(476003)(6916009)(486006)(6116002)(76116006)(14444005)(256004)(64756008)(66476007)(966005)(478600001)(7416002)(305945005)(66946007)(54906003)(316002)(7736002)(73956011)(71190400001)(72206003)(2501003)(66556008)(80792005)(71200400001)(66446008)(26005)(4326008)(14454004)(25786009)(102836004)(2906002)(55236004)(8936002)(81166006)(5660300002)(99286004)(66066001)(1076003)(36756003)(86362001)(53936002)(6506007)(81156014)(2351001)(186003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5698;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W1ujZKJzNOIAfy22iJDB+j8qpnXq6qI/kbjv+Y0LKjE2p+9L0NSkmw56tAKD9ka3TzAqPCjoWAsRJwh+E/fmgvyLK/tp+E4I08xtUVOphmaLxfDldesvZlC2JamDgweXyy6jcx/Mkny3hhzrh2A68qvf0J6ffVewDw+vj6S/t+fy7B4GgmAHEg6iJ82LTloQDsy/zMfYbO7rFpZV785TaqvreFAFHtx7fYk5A/J80ulxkroDpC+wJtarqfrX41v387h9yDyRQkq0gBM8a5J44vMlECRaWYu32k1nq7Fs1Z4QWenPYcgiDZhdaGByVkCxdv89zCxu0J33A8xBu/wA4tyYTX0npwG8B8JNbYEO1R3FxmxGyC7cJX1Ny1AHzfOo5USf39MA2sIMCvRsXNVIkXYZYlCEQPRI+Nn6/Q7c6Ak=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc88c4f-42fa-4234-1985-08d6de32de8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 21:25:38.2399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5698
Subject: [Xen-devel] [PATCH v5 00/10] TEE mediator (and OP-TEE) support in
 XEN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gY29tbXVuaXR5LAoKVGhpcyBpcyB0aGUgZmlmdGggdmVyc2lvbiBvZiBPUC1URUUgbWVk
aWF0b3IgaW4gWEVOLgoKT1AtVEVFIDMuNS4wIHdhcyByZWxlYXNlZCB3aGVuIEkgd29ya2VkIG9u
IHRoaXMgdmVyc2lvbiBvZiB0aGUKcGF0aGVzLiBUaGlzIGlzIHRoZSBmaXJzdCByZWxlYXNlIHdo
ZXJlIHZpcnR1YWxpemF0aW9uIHN1cHBvcnQgaXMKYXZhaWxhYmxlLiBUaGlzIHJlbGVhc2UgaW5j
bHVkZXMgYm90aCBvcmlnaW5hbCB2aXJ0dWFsaXphdGlvbiBwYXRjaGVzCmFuZCBuZXcgU01DIHRo
YXQgcmV0cmV2aWVzIG51bWJlciBvZiB0aHJlYWRzIGZyb20gT1AtVEVFLgoKTWFueSB0aGFua3Mg
dG8gYm90aCBPUC1URUUgYW5kIFhlbiBjb21tdW5pdGllcyBmb3IgcmV2aWV3aW5nIGFuZCBoZWxw
aW5nCndpdGggbXkgY2hhbmdlcyB0byB0aGUgYm90aCBwcm9qZWN0cy4KCkdsb2JhbCBjaGFuZ2Vz
IGZyb20gdjQ6CiAtIFN1YnN0YW50aWFsIHJld29yayBvZiBPUC1URUUgbWVkaWF0b3IuIE5vdyBp
dCB0cmllcyB0byByZXR1cm4gbWVhbmluZ2Z1bAogICBlcnJvciBjb2RlcyBiYWNrIHRvIHRoZSBn
dWVzdC4KIC0gT1AtVEVFIG1lZGlhdG9yIGRvZXMgbm90IHVzZSBzdHJ1Y3QgY3B1X3VzZXJfcmVn
cyBhcyBhIHN0b3JhZ2UgZm9yCiAgIHBhcmFtZXRlcnMgYW5kIHJldHVybiB2YWx1ZXMgd2hlbiBj
YWxsaW5nIE9QLVRFRS4gVGhpcyBtYWtlcyBpdAogICBjb21wYXRiaWxlIHdpdGggcmVxdWlyZW1l
bnQgZnJvbSBTTUNDQy4KIC0gdGVlPW5hdGl2ZSBvcHRpb24gcmVwbGFjZWQgd2l0aCB0ZWU9b3B0
ZWUKIC0gQXV0aG9yc2hpcCBhbmQgcy1vLWIgdGFnIHJlc2V0IHRvIG15IEVQQU0gbWFpbCBhZGRy
ZXNzCgpPdmVyYWxsIGNoYW5nZXMgZnJvbSB2MzoKCiAtIFBhdGNoICJhcm06IGFkZCB0ZWVfZW5h
YmxlZCBmbGFnIHRvIHhlbl9hcmNoX2RvbWFpbmNvbmZpZyIgd2FzCiAgIHNxdWFzaGVkIGludG8g
Inhlbi9hcm06IGFkZCBnZW5lcmljIFRFRSBtZWRpYXRvciBmcmFtZXdvcmsiCiAtIEkgaW1wbGVt
ZW50ZWQgbW9yZSBlbGFib3JhdGUgZXJyb3IgcmVwb3RpbmcgdG8gYSBndWVzdC4gTm93IGd1ZXN0
CiAgIHdpbGwgZ2V0IG1lYW5pbmdmdWwgZXJyb3IgY29kZXMgaW5zdGVhZCBvZiBnZW5lcmljCiAg
IEFSTV9TTUNDQ19FUlJfVU5LTk9XTl9GVU5DVElPTi4KClBlci1wYXRjaCBjaGFuZ2VzIGFyZSBk
ZXNjcmliZWQgaW4gY29ycmVzcG9uZGluZyBlbWFpbHMuCgpDaGFuZ2VzIGZyb20gdjI6CgogLSBV
c2UgZG9tYWluIGZsYWdzIGluc3RlZCBvZiBkb21jdGwgaW50ZXJmYWNlIHRvIGVuYWJsZSBvcHRl
ZSBmb3IgZ3Vlc3RzCiAtIFJlbW92ZSBwYXRjaCAibGlieGM6IGFkZCB4Y19kb21fdGVlX2VuYWJs
ZSguLi4pIGZ1bmN0aW9uIiBiZWNhdXNlCiAgIG9mIHByZXZpb3VzIGNoYW5nZQogLSBNZWRpYXRv
ciBub3cgc3RvcmVzIG93biBjb250ZXh0IGluIGFyY2ggcGFydCBvZiBzdHJ1Y3QgZG9tYWluLCBz
bwogICBJIHJlbW92ZWQgcGF0Y2ggIm9wdGVlOiBhZGQgZG9tYWluIGNvbnRleHRzIgoKUGVyLXBh
dGNoIGNoYW5nZXMgYXJlIGRlc2NyaWJlZCBpbiBjb3JyZXNwb25kaW5nIGVtYWlscy4KCj09PT0K
djI6CgpUaGlzIGlzIHYyIG9mIHBhdGNoIHNlcmllcyBmb3IgT1AtVEVFIG1lZGlhdG9yIHN1cHBv
cnQgaW4gWEVOLiBDaGFuZ2VzIGZyb20gdjE6CgogLSBBZGRlZCBkb21jdGwgaW50ZXJmYWNlLCBz
byBub3cgeGwgZGVjaWRlcyB3aGF0IGRvbWFpbiBzaG91bGQgd29yayB3aXRoIFRFRQogLSBSZW1v
dmVkIFhTTSBzdXBwb3J0IGR1ZSB0byBjaGFuZ2UgZGVzY3JpYmVkIGFib3ZlCiAtIFBhdGNoIHdp
dGggT1AtVEVFIG1lZGlhdG9yIHdhcyBzcGxpdGVkIHRvIDcgc2VwYXJhdGUgcGF0Y2hlcwogLSBS
ZW1vdmVkIHBhdGNoIHdpdGggY2FsbF9zbWNjYygpIGZ1bmN0aW9uLiBOb3cgdGhpcyBzZXJpZXMg
ZGVwZW5kIG9uCiAgIEp1bGllbiBHcmFsbCdzIHNlcmllcyAieGVuL2FybTogU01DQ0MgZml4dXAg
YW5kIGltcHJvdmVtZW50IiBbM10KCj09PT09CnYxOgoKVGhpcyBpcyBmb2xsb3cgZm9yIHBhdGNo
IHNlcmllcyBbMV0uIFRoZXJlIHdhcyBsb3RzIG9mIGRpc2N1c3Npb25zCmZvciB0aGF0IHNlcmll
cyBhbmQgSSB0cmllZCB0byBhZGRyZXNzIGFsbCBvZiB0aGVtIGluIHRoaXMgbmV3IHBhdGNoc2V0
LgoKQ3VycmVudGx5LCBJIGhhZCBhIHdvcmtpbmcgc29sdXRpb24gZm9yIE9QLVRFRSB2aXJ0dWFs
aXphdGlvbiBhbmQgaXQgaXMgYmVpbmcKdXBzdHJlYW1lZCByaWdodCBub3cgKFsyXSkuIFNvLCBJ
IHRoaW5rIGl0IGlzIGEgZ29vZCB0aW1lIHRvIGludHJvZHVjZSBzdXBwb3J0CmluIFhFTiBhcyB3
ZWxsLgoKVGhpcyBzZXJpZXMgaW5jbHVkZSBnZW5lcmljIFRFRSBtZWRpYXRvciBmcmFtZXdvcmsg
YW5kIGZ1bGwtc2NhbGUgT1AtVEVFIG1lZGlhdG9yCndoaWNoIGlzIHdvcmtpbmcgd2l0aCBtZW50
aW9uZWQgY2hhZ2VzIGluIE9QLVRFRS4gU28sIG11bHRpcGxlIGRvbWFpbnMgY2FuCndvcmsgc2lt
dWx0YW5lb3VzbHkgd2l0aCBPUC1URUUuCgpJIGFkZGVkIFhTTSBzdXBwb3J0LCBzbyBub3cgaXQg
aXMgcG9zc2libGUgdG8gY29udHJvbCB3aGljaCBkb21haW5zIGNhbiB3b3JrCndpdGggVEVFcy4g
QWxzbyBJIGNoYW5nZWQgd2F5IGhvdyBURUUgZGlzY292ZXJ5IGlzIGRvbmUuIE5vdyAgaXQgaXMg
dmVyeQpnZW5lcmljIGFuZCBzaG91bGQgc3VwcG9ydCBhbnkgcGxhdGZvcm0uCgpbMV0gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTEwL21z
ZzAxNDUxLmh0bWwKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvcHVsbC8y
MzcwClszXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMTgtMDgvbXNnMDIxMzguaHRtbAoKClZvbG9keW15ciBCYWJjaHVrICgxMCk6CiAgeGVu
L2FybTogYWRkIGdlbmVyaWMgVEVFIG1lZGlhdG9yIGZyYW1ld29yawogIHhlbi9hcm06IG9wdGVl
OiBhZGQgT1AtVEVFIGhlYWRlciBmaWxlcwogIHhlbi9hcm06IG9wdGVlOiBhZGQgT1AtVEVFIG1l
ZGlhdG9yIHNrZWxldG9uCiAgeGVuL2FybTogb3B0ZWU6IGFkZCBmYXN0IGNhbGxzIGhhbmRsaW5n
CiAgeGVuL2FybTogb3B0ZWU6IGFkZCBzdGQgY2FsbCBoYW5kbGluZwogIHhlbi9hcm06IG9wdGVl
OiBhZGQgc3VwcG9ydCBmb3IgUlBDIFNITSBidWZmZXJzCiAgeGVuL2FybTogb3B0ZWU6IGFkZCBz
dXBwb3J0IGZvciBhcmJpdHJhcnkgc2hhcmVkIG1lbW9yeQogIHhlbi9hcm06IG9wdGVlOiBhZGQg
c3VwcG9ydCBmb3IgUlBDIGNvbW1hbmRzCiAgdG9vbHMvYXJtOiB0ZWU6IGFkZCAidGVlIiBvcHRp
b24gZm9yIHhsLmNmZwogIHRvb2xzL2FybTogb3B0ZWU6IGNyZWF0ZSBvcHRlZSBmaXJtd2FyZSBu
b2RlIGluIERUIGlmIHRlZT1vcHRlZQoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgNiArCiBkb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gICAgICAgICAgICB8ICAgMTkg
KwogdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgICAgICAgICAgfCAgICA1ICsKIHRvb2xzL2xp
YnhsL2xpYnhsX2FybS5jICAgICAgICAgICAgIHwgICA0MiArCiB0b29scy9saWJ4bC9saWJ4bF90
eXBlcy5pZGwgICAgICAgICB8ICAgIDYgKwogdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAgICAg
ICAgICAgfCAgICA5ICsKIHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICAgIHwgICAg
OSArCiB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAgIDEgKwogeGVuL2Fy
Y2gvYXJtL2RvbWFpbi5jICAgICAgICAgICAgICAgfCAgIDE5ICsKIHhlbi9hcmNoL2FybS9zZXR1
cC5jICAgICAgICAgICAgICAgIHwgICAgMiArCiB4ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcgICAg
ICAgICAgICB8ICAgIDQgKwogeGVuL2FyY2gvYXJtL3RlZS9NYWtlZmlsZSAgICAgICAgICAgfCAg
ICAyICsKIHhlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYyAgICAgICAgICAgIHwgMTUzNiArKysrKysr
KysrKysrKysrKysrKysrKysrKysKIHhlbi9hcmNoL2FybS90ZWUvdGVlLmMgICAgICAgICAgICAg
IHwgICA5MyArKwogeGVuL2FyY2gvYXJtL3ZzbWMuYyAgICAgICAgICAgICAgICAgfCAgICA1ICsK
IHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgICAgICAgICAgICAgIHwgICAgNyArCiB4ZW4vaW5jbHVk
ZS9hc20tYXJtL2RvbWFpbi5oICAgICAgICB8ICAgIDQgKwogeGVuL2luY2x1ZGUvYXNtLWFybS90
ZWUvb3B0ZWVfbXNnLmggfCAgNDQ0ICsrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS9v
cHRlZV9zbWMuaCB8ICA1NTYgKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvdGVl
LmggICAgICAgfCAgMTA5ICsrCiB4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCAgICAgICB8
ICAgIDQgKwogMjEgZmlsZXMgY2hhbmdlZCwgMjg4MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVu
L2FyY2gvYXJtL3RlZS9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS90
ZWUvb3B0ZWUuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS90ZWUvdGVlLmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20tYXJtL3RlZS9vcHRlZV9tc2cuaAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS1hcm0vdGVlL29wdGVlX3NtYy5oCiBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvdGVlLmgKCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
