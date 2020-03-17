Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD611891C2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 00:05:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jELDZ-0000pR-Qs; Tue, 17 Mar 2020 23:01:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i1CB=5C=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1jELDX-0000pM-U9
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 23:01:48 +0000
X-Inumbo-ID: 45c1d800-68a3-11ea-92cf-bc764e2007e4
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (unknown
 [40.107.11.103]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45c1d800-68a3-11ea-92cf-bc764e2007e4;
 Tue, 17 Mar 2020 23:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmSoWcnY00BnvTpQog8r2+o1S5TruneM1wwA/16niz/NVESfPWYsBgTv9WYHNGLtOX3ScuH1M6efSF8PjYozHMoCeZvipeOVhTmBgSVrK4CUQCqQp8lFGS8lG3e+wdFu4An8JZxQIimYnVkLDyrxkcZpSSk+xgL7BjbrfWUfYXFIHFLw+dwDQCP77J+B16A6tVkuoHci+AkCor07U77v5n4Zql825JLZ+BgzXp9bsQoGAHJp4H6mm64wFY60o17uHFZlYwuVxJHqelu3tm78DgilGbD+o4XQXOwKLFl+aNiexVjlQ898rZgV4c36IQCVzMUdyOdfFo5Jw9T+HZGNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdFL3rKVi8b52olVcwND3fEUb4BObevvdlewmOaU+/s=;
 b=iIthIeGa8JZqNkS7kEE9C/WtUL1Tj3/yyE50LdpiSjQlb6cIV3yGyflwQdM8QJfC2z2OsyDjrDzz6bMWWnKyqEptUvRZBWSQVvHXrGQHg++GpBWgo7rOtJBmQNV3un6aNV5SVa5bD2b2Ipx0/wQQkooSR6tHbzq+Ms/4enlRhN2UP4T0X6USrKCVxHN5DTJkchdOk/Ac/nb8THgHw6IOlsQT/IE6I3m9OtoOgOr+Wyx7T4P+1f148/6OtFxvW2BXjQ6nw1mwXjUSyGag8iDlkLRskTaoFm8xdt4+m9nXGcza5GhqLZG4SwDgPoGs2nAf4++vEvExamZaTeJbfYnNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdFL3rKVi8b52olVcwND3fEUb4BObevvdlewmOaU+/s=;
 b=XobC5wVNBctmi0mTaFy1y3J8tTmkfKMV4nOBo3gAv/1nOzDdahoeg4ZYdZSS6zxvm7i1FiUNWWk8FbFHp2Phv2y+QCIK3NwdgSgUcJqizrvw2mbzkG6Vi64jExaIKSQ/Vv2exNUvLaK4DgQvGtuW2yMFHvByx9KaG0eip9TUdHo=
Received: from CWLP265MB1218.GBRP265.PROD.OUTLOOK.COM (20.176.36.147) by
 CWLP265MB0740.GBRP265.PROD.OUTLOOK.COM (10.166.26.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Tue, 17 Mar 2020 23:01:43 +0000
Received: from CWLP265MB1218.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1045:ca69:5894:1e84]) by CWLP265MB1218.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1045:ca69:5894:1e84%5]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 23:01:43 +0000
Received: from austen3.home (2a00:23c4:921a:2100:1097:224c:243b:f186) by
 LO2P265CA0413.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.19 via Frontend Transport; Tue, 17 Mar 2020 23:01:43 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [XEN PATCH] mismatch between pyxc_methods flags and PyObject
 definitions
Thread-Index: AQHV/LAGbNHF25I8tkGIuIUvn+oPgw==
Date: Tue, 17 Mar 2020 23:01:43 +0000
Message-ID: <27a883ea723d5d123cb3a10d2a6092ad54a6171e.1584485918.git.m.a.young@durham.ac.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a00:23c4:921a:2100:1097:224c:243b:f186]
x-mailer: git-send-email 2.21.1
x-clientproxiedby: LO2P265CA0413.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::17) To CWLP265MB1218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:2e::19)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f056395c-d865-4143-dc48-08d7cac72935
x-ms-traffictypediagnostic: CWLP265MB0740:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CWLP265MB0740893D719EDEA55280D85187F60@CWLP265MB0740.GBRP265.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(6029001)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(199004)(2616005)(6916009)(81156014)(81166006)(6512007)(54906003)(8676002)(4326008)(2906002)(316002)(6506007)(71200400001)(786003)(52116002)(16526019)(86362001)(186003)(64756008)(66446008)(66556008)(66476007)(478600001)(66946007)(5660300002)(36756003)(6486002)(8886007)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CWLP265MB0740;
 H:CWLP265MB1218.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1cH6Nrw3CSHYSo9ShYb+mxRf3QBwD8Mcf4b4qEfe2twAGcynqeTWFV04QmiRuPkutGFBdl3U/Xt6NKu3F3WdGDaiIdFAs4hN9oO3adh3Lvt8YDlRnCAPh9GJRC4JePJgCQ2QceUJQi1/TMzcdflcEazpf5aUs1LVdo0Hs1bOdGYfbuy6klxf03KbiLx46mI07Z2S28JdUUS9jf8sF2/bUDqc8Bwyb1gleCCIW74530SiafS2wiytKIwTBteQW7WNMxrxMUvpKv7Hgh7ix32B3s9LGJXRQ05fuLf5bbbgYFi3+pN89hmBSZ9W8Ra9OOUOm6oHX9DLpbezfQOzO4uYkAx/wKtYGZY9Of+kxXrNE05IDJQ2LWx0oR050k7nSKA8EYAJfIPJEmTk5x0cU9y1MC6UdL7LjArPSM+Kbm6zJWoakE5DcY3g4TAtXoua7rOd
x-ms-exchange-antispam-messagedata: WEHrhQKth+BPxuQG63nteACrN4o3civ+2k69MTqz10p1UElkaOIhFGS5P4oXfPCyXbQjQhe0kj0PsETATegQwqPt5tJGhqAIwun4gHnkqfHVfxdsHtJFsYS1eN08hFGv9OASjZhKn0dX/gX7aQH1cw3eKl/4/Ri3m0J0skDzeZ59E+bC05hED78soAc1pjja32edGlLK/RtC5vPgZjnW/A==
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: f056395c-d865-4143-dc48-08d7cac72935
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 23:01:43.6981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwR+i/TsXEqxpAkKwurNO1eOiHcodNR4lcBv1kOwmpZ5Jgvj3dU8VnS3P7v45mgW1z4B5b95VPMJEvbPSh1lZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB0740
Subject: [Xen-devel] [XEN PATCH] mismatch between pyxc_methods flags and
 PyObject definitions
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>, "YOUNG,
 MICHAEL A." <m.a.young@durham.ac.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cHlncnViIGluIHhlbi00LjEzLjAgd2l0aCBweXRob24gMy44LjIgZmFpbHMgd2l0aCB0aGUgZXJy
b3IKClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKICBGaWxlICIvdXNyL2xpYmV4
ZWMveGVuL2Jpbi9weWdydWIiLCBsaW5lIDIxLCBpbiA8bW9kdWxlPgogICAgaW1wb3J0IHhlbi5s
b3dsZXZlbC54YwpTeXN0ZW1FcnJvcjogYmFkIGNhbGwgZmxhZ3MKClRoaXMgcGF0Y2ggZml4ZXMg
bWlzbWF0Y2hlcyBpbiB0b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMKYmV0d2VlbiB0
aGUgZmxhZyBiaXRzIGRlZmluZWQgaW4gcHl4Y19tZXRob2RzIGFuZCB0aGUgcGFyYW1ldGVycyBw
YXNzZWQKdG8gdGhlIGNvcnJlc3BvbmRpbmcgUHlPYmplY3QgZGVmaW5pdGlvbnMuCgpXaXRoIHRo
aXMgcGF0Y2ggYXBwbGllZCBweWdydWIgd29ya3MgYXMgZXhwZWN0ZWQuCgpTaWduZWQtb2ZmLWJ5
OiBNaWNoYWVsIFlvdW5nIDxtLmEueW91bmdAZHVyaGFtLmFjLnVrPgotLS0KIHRvb2xzL3B5dGhv
bi94ZW4vbG93bGV2ZWwveGMveGMuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMv
cHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94
Yy94Yy5jCmluZGV4IGFjMGUyNmE3NDIuLjhmZGU1ZjMxMWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3B5
dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYworKysgYi90b29scy9weXRob24veGVuL2xvd2xldmVs
L3hjL3hjLmMKQEAgLTIwMjgsNyArMjAyOCw3IEBAIHN0YXRpYyBQeU1ldGhvZERlZiBweXhjX21l
dGhvZHNbXSA9IHsKIAogICAgIHsgImdudHRhYl9odm1fc2VlZCIsCiAgICAgICAoUHlDRnVuY3Rp
b24pcHl4Y19nbnR0YWJfaHZtX3NlZWQsCi0gICAgICBNRVRIX0tFWVdPUkRTLCAiXG4iCisgICAg
ICBNRVRIX1ZBUkFSR1MgfCBNRVRIX0tFWVdPUkRTLCAiXG4iCiAgICAgICAiSW5pdGlhbGlzZSBI
Vk0gZ3Vlc3QgZ3JhbnQgdGFibGUuXG4iCiAgICAgICAiIGRvbSAgICAgW2ludF06ICAgICAgSWRl
bnRpZmllciBvZiBkb21haW4gdG8gYnVpbGQgaW50by5cbiIKICAgICAgICIgY29uc29sZV9nbWZu
IFtpbnRdOiBcbiIKQEAgLTIwOTcsNyArMjA5Nyw3IEBAIHN0YXRpYyBQeU1ldGhvZERlZiBweXhj
X21ldGhvZHNbXSA9IHsKIAogICAgIHsgInNjaGVkX2NyZWRpdF9kb21haW5fc2V0IiwKICAgICAg
IChQeUNGdW5jdGlvbilweXhjX3NjaGVkX2NyZWRpdF9kb21haW5fc2V0LAotICAgICAgTUVUSF9L
RVlXT1JEUywgIlxuIgorICAgICAgTUVUSF9WQVJBUkdTIHwgTUVUSF9LRVlXT1JEUywgIlxuIgog
ICAgICAgIlNldCB0aGUgc2NoZWR1bGluZyBwYXJhbWV0ZXJzIGZvciBhIGRvbWFpbiB3aGVuIHJ1
bm5pbmcgd2l0aCB0aGVcbiIKICAgICAgICJTTVAgY3JlZGl0IHNjaGVkdWxlci5cbiIKICAgICAg
ICIgZG9taWQgICAgIFtpbnRdOiAgIGRvbWFpbiBpZCB0byBzZXRcbiIKQEAgLTIxMTUsNyArMjEx
NSw3IEBAIHN0YXRpYyBQeU1ldGhvZERlZiBweXhjX21ldGhvZHNbXSA9IHsKIAogICAgIHsgInNj
aGVkX2NyZWRpdDJfZG9tYWluX3NldCIsCiAgICAgICAoUHlDRnVuY3Rpb24pcHl4Y19zY2hlZF9j
cmVkaXQyX2RvbWFpbl9zZXQsCi0gICAgICBNRVRIX0tFWVdPUkRTLCAiXG4iCisgICAgICBNRVRI
X1ZBUkFSR1MgfCBNRVRIX0tFWVdPUkRTLCAiXG4iCiAgICAgICAiU2V0IHRoZSBzY2hlZHVsaW5n
IHBhcmFtZXRlcnMgZm9yIGEgZG9tYWluIHdoZW4gcnVubmluZyB3aXRoIHRoZVxuIgogICAgICAg
IlNNUCBjcmVkaXQyIHNjaGVkdWxlci5cbiIKICAgICAgICIgZG9taWQgICAgIFtpbnRdOiAgIGRv
bWFpbiBpZCB0byBzZXRcbiIKQEAgLTIzOTMsMjEgKzIzOTMsMjEgQEAgc3RhdGljIFB5TWV0aG9k
RGVmIHB5eGNfbWV0aG9kc1tdID0gewogCiAgICAgeyAiZmxhc2tfY29udGV4dF90b19zaWQiLAog
ICAgICAgKFB5Q0Z1bmN0aW9uKXB5Zmxhc2tfY29udGV4dF90b19zaWQsCi0gICAgICBNRVRIX0tF
WVdPUkRTLCAiXG4iCisgICAgICBNRVRIX1ZBUkFSR1MgfCBNRVRIX0tFWVdPUkRTLCAiXG4iCiAg
ICAgICAiQ29udmVydCBhIGNvbnRleHQgc3RyaW5nIHRvIGEgZHluYW1pYyBTSUQuXG4iCiAgICAg
ICAiIGNvbnRleHQgW3N0cl06IFN0cmluZyBzcGVjaWZ5aW5nIGNvbnRleHQgdG8gYmUgY29udmVy
dGVkXG4iCiAgICAgICAiUmV0dXJuczogW2ludF06IE51bWVyaWMgU0lEIG9uIHN1Y2Nlc3M7IC0x
IG9uIGVycm9yLlxuIiB9LAogCiAgICAgeyAiZmxhc2tfc2lkX3RvX2NvbnRleHQiLAogICAgICAg
KFB5Q0Z1bmN0aW9uKXB5Zmxhc2tfc2lkX3RvX2NvbnRleHQsCi0gICAgICBNRVRIX0tFWVdPUkRT
LCAiXG4iCisgICAgICBNRVRIX1ZBUkFSR1MgfCBNRVRIX0tFWVdPUkRTLCAiXG4iCiAgICAgICAi
Q29udmVydCBhIGR5bmFtaWMgU0lEIHRvIGNvbnRleHQgc3RyaW5nLlxuIgogICAgICAgIiBjb250
ZXh0IFtpbnRdOiBTSUQgdG8gYmUgY29udmVydGVkXG4iCiAgICAgICAiUmV0dXJuczogW3N0cl06
IE51bWVyaWMgU0lEIG9uIHN1Y2Nlc3M7IC0xIG9uIGVycm9yLlxuIiB9LAogCiAgICAgeyAiZmxh
c2tfbG9hZCIsCiAgICAgICAoUHlDRnVuY3Rpb24pcHlmbGFza19sb2FkLAotICAgICAgTUVUSF9L
RVlXT1JEUywgIlxuIgorICAgICAgTUVUSF9WQVJBUkdTIHwgTUVUSF9LRVlXT1JEUywgIlxuIgog
ICAgICAgIkxvYWRzIGEgcG9saWN5IGludG8gdGhlIGh5cGVydmlzb3IuXG4iCiAgICAgICAiIHBv
bGljeSBbc3RyXTogcG9saWN5IHRvIGJlIGxvYWRcbiIKICAgICAgICJSZXR1cm5zOiBbaW50XTog
MCBvbiBzdWNjZXNzOyAtMSBvbiBmYWlsdXJlLlxuIiB9LCAKQEAgLTI0MjAsMTQgKzI0MjAsMTQg
QEAgc3RhdGljIFB5TWV0aG9kRGVmIHB5eGNfbWV0aG9kc1tdID0gewogCiAgICAgeyAiZmxhc2tf
c2V0ZW5mb3JjZSIsCiAgICAgICAoUHlDRnVuY3Rpb24pcHlmbGFza19zZXRlbmZvcmNlLAotICAg
ICAgTUVUSF9LRVlXT1JEUywgIlxuIgorICAgICAgTUVUSF9WQVJBUkdTIHwgTUVUSF9LRVlXT1JE
UywgIlxuIgogICAgICAgIk1vZGlmaWVzIHRoZSBjdXJyZW50IG1vZGUgZm9yIHRoZSBGbGFzayBY
U00gbW9kdWxlLlxuIgogICAgICAgIiBtb2RlIFtpbnRdOiBtb2RlIHRvIGNoYW5nZSB0b1xuIgog
ICAgICAgIlJldHVybnM6IFtpbnRdOiAwIG9uIHN1Y2Nlc3M7IC0xIG9uIGZhaWx1cmUuXG4iIH0s
IAogCiAgICAgeyAiZmxhc2tfYWNjZXNzIiwKICAgICAgIChQeUNGdW5jdGlvbilweWZsYXNrX2Fj
Y2VzcywKLSAgICAgIE1FVEhfS0VZV09SRFMsICJcbiIKKyAgICAgIE1FVEhfVkFSQVJHUyB8IE1F
VEhfS0VZV09SRFMsICJcbiIKICAgICAgICJSZXR1cm5zIHdoZXRoZXIgYSBzb3VyY2UgY29udGV4
dCBoYXMgYWNjZXNzIHRvIHRhcmdldCBjb250ZXh0IGJhc2VkIG9uIFwKICAgICAgICBjbGFzcyBh
bmQgcGVybWlzc2lvbnMgcmVxdWVzdGVkLlxuIgogICAgICAgIiBzY29uIFtzdHJdOiBzb3VyY2Ug
Y29udGV4dFxuIgotLSAKMi4yMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
