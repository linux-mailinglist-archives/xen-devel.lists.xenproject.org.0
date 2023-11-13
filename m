Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17AE7EA0BE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631757.985425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZKa-0003K5-Oq; Mon, 13 Nov 2023 15:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631757.985425; Mon, 13 Nov 2023 15:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZKa-0003HJ-LU; Mon, 13 Nov 2023 15:58:32 +0000
Received: by outflank-mailman (input) for mailman id 631757;
 Mon, 13 Nov 2023 15:58:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTB6=G2=amazon.co.uk=prvs=67486284d=dwmw@srs-se1.protection.inumbo.net>)
 id 1r2ZKZ-0003H9-BA
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:58:31 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7be8819c-823d-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 16:58:28 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-3554bfcf.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-2101.iad2.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 15:58:26 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1e-m6i4x-3554bfcf.us-east-1.amazon.com (Postfix)
 with ESMTPS id D538F80954; Mon, 13 Nov 2023 15:58:21 +0000 (UTC)
Received: from EX19MTAUEA001.ant.amazon.com [10.0.44.209:37577]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.61.2:2525] with
 esmtp (Farcaster)
 id 00ebf3ba-813f-4e36-bae8-4b0565a9b1d2; Mon, 13 Nov 2023 15:58:21 +0000 (UTC)
Received: from EX19D008UEC003.ant.amazon.com (10.252.135.194) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 13 Nov 2023 15:58:21 +0000
Received: from EX19D008UEC001.ant.amazon.com (10.252.135.232) by
 EX19D008UEC003.ant.amazon.com (10.252.135.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.39;
 Mon, 13 Nov 2023 15:58:20 +0000
Received: from EX19D008UEC001.ant.amazon.com ([fe80::4702:5d1a:c556:797]) by
 EX19D008UEC001.ant.amazon.com ([fe80::4702:5d1a:c556:797%3]) with mapi id
 15.02.1118.039; Mon, 13 Nov 2023 15:58:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7be8819c-823d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1699891109; x=1731427109;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=x3clqKCBSnizyqNOnRjBB+YlmxcdcJJ/uLlwMHbY9+0=;
  b=FGtilEV0ycs0AMbFugiO3C695ceSGCh5ElLzB01c+3R7Nqq7IMX+DGpb
   gkaGYkvp2CBdLR5qjnYyoVi0IP7RBr7Dqq6y/5mSvbl96sOv62pQ97tWB
   MbTUmIIt/A3FdlX658lnLO6kO+ftaZR7ctKvlMJc1mh617QEmiEqtrTrt
   k=;
X-IronPort-AV: E=Sophos;i="6.03,299,1694736000"; 
   d="scan'208,217";a="362515564"
X-Farcaster-Flow-ID: 00ebf3ba-813f-4e36-bae8-4b0565a9b1d2
From: "Woodhouse, David" <dwmw@amazon.co.uk>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Paul Durrant <paul@xen.org>,
	Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
	<richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data()
 out of handle_ioreq()
Thread-Topic: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data()
 out of handle_ioreq()
Thread-Index: AQHaFko5eJJo3hTaU0ew57KmhlQp2Q==
Date: Mon, 13 Nov 2023 15:58:20 +0000
Message-ID: <f791a822-f6f5-44fa-904b-f67d3f193763@email.android.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: multipart/alternative;
	boundary="_000_f791a822f6f544fa904bf67d3f193763emailandroidcom_"
MIME-Version: 1.0
Precedence: Bulk

--_000_f791a822f6f544fa904bf67d3f193763emailandroidcom_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

DQoNCk9uIDEzIE5vdiAyMDIzIDEwOjIyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QGxpbmFyby5vcmc+IHdyb3RlOg0KUGVyIGNvbW1pdCBmMTcwNjhjMWM3ICgieGVuLWh2bTogcmVv
cmdhbml6ZSB4ZW4taHZtIGFuZCBtb3ZlIGNvbW1vbg0KZnVuY3Rpb24gdG8geGVuLWh2bS1jb21t
b24iKSwgaGFuZGxlX2lvcmVxKCkgaXMgZXhwZWN0ZWQgdG8gYmUNCnRhcmdldC1hZ25vc3RpYy4g
SG93ZXZlciBpdCB1c2VzICd0YXJnZXRfdWxvbmcnLCB3aGljaCBpcyBhIHRhcmdldA0Kc3BlY2lm
aWMgZGVmaW5pdGlvbi4NCg0KSW4gb3JkZXIgdG8gY29tcGlsZSB0aGlzIGZpbGUgb25jZSBmb3Ig
YWxsIHRhcmdldHMsIGZhY3RvciB0aGUNCnRhcmdldC1zcGVjaWZpYyBjb2RlIG91dCBvZiBoYW5k
bGVfaW9yZXEoKSBhcyBhIHBlci10YXJnZXQgaGFuZGxlcg0KY2FsbGVkIHhlbl9hcmNoX2FsaWdu
X2lvcmVxX2RhdGEoKS4NCg0KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEBsaW5hcm8ub3JnPg0KLS0tDQpTaG91bGQgd2UgaGF2ZSBhICd1bnNpZ25lZCBxZW11
X3RhcmdldF9sb25nX2JpdHMoKTsnIGhlbHBlcg0Kc3VjaCBxZW11X3RhcmdldF9wYWdlX2Zvbygp
IEFQSSBhbmQgdGFyZ2V0X3dvcmRzX2JpZ2VuZGlhbigpPw0KDQpJdCBjYW4gYmUgbW9yZSBmdW4g
dGhhbiB0aGF0IHRob3VnaC4gV2hhdCBhYm91dCBxZW11X3RhcmdldF9hbGlnbm9mX3VpbnQ2NCgp
IGZvciBleGFtcGxlLCB3aGljaCBkaWZmZXJzIGJldHdlZW4gaTM4NiBhbmQgeDg2XzY0IGFuZCBj
YXVzZXMgZXZlbiBzdHJ1Y3RzIHdpdGggKmV4cGxpY2l0bHkqIHNpemVkIGZpZWxkcyB0byBkaWZm
ZXIgYmVjYXVzZSBvZiBwYWRkaW5nLg0KDQpJJ2QgKmxvdmUqIHRvIHNlZSB0aGlzIHNlcmllcyBh
cyBhIHN0ZXAgdG93YXJkcyBteSBmYW50YXN5IG9mIGJlaW5nIGFibGUgdG8gc3VwcG9ydCBYZW4g
dW5kZXIgVENHLiBBZnRlciBhbGwsIHdpdGhvdXQgdGhhdCB3aGF0J3MgdGhlIHBvaW50IGluIGJl
aW5nIHRhcmdldC1hZ25vc3RpYz8NCg0KSG93ZXZlciwgSSBhbSBtaWxkbHkgY29uY2VybmVkIHRo
YXQgc29tZSBvZiB0aGVzZSBmaWxlcyBhcmUgYWNjaWRlbnRhbGx5IHVzaW5nIHRoZSBob3N0IEVM
RiBBQkksIHBlcmhhcHMgd2l0aCBleHBsaWNpdCBtYW5hZ2VtZW50IG9mIDMyLWJpdCBjb21wYXRp
YmlsaXR5LCBhbmQgdGhlIHRhcmdldC1hZ25vc3RpY2l0eSBpcyBwdXJlbHkgYW4gaWxsdXNpb24/
DQoNClNlZSB0aGUgInByb3RvY29sIiBoYW5kbGluZyBhbmQgdGhlIHRocmVlIEFCSXMgZm9yIHRo
ZSByaW5nIGluIHhlbi1ibG9jaywgZm9yIGV4YW1wbGUuDQoNCkNhbiB3ZSBiZSBleHBsaWNpdCBh
Ym91dCB3aGF0J3MgZXhwZWN0ZWQgdG8gd29yayBoZXJlIGFuZCB3aGF0J3Mgbm90IGluIHNjb3Bl
Pw0KDQoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudHJlIChMb25kb24pIEx0ZC4gUmVnaXN0ZXJl
ZCBpbiBFbmdsYW5kIGFuZCBXYWxlcyB3aXRoIHJlZ2lzdHJhdGlvbiBudW1iZXIgMDQ1NDMyMzIg
d2l0aCBpdHMgcmVnaXN0ZXJlZCBvZmZpY2UgYXQgMSBQcmluY2lwYWwgUGxhY2UsIFdvcnNoaXAg
U3RyZWV0LCBMb25kb24gRUMyQSAyRkEsIFVuaXRlZCBLaW5nZG9tLgoKCg==

--_000_f791a822f6f544fa904bf67d3f193763emailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <752A45E12BFA344E8D16E4CD03730367@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPg0KPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIDEzIE5vdiAyMDIzIDEwOjIyLCBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSAmbHQ7cGhpbG1kQGxpbmFyby5vcmcmZ3Q7IHdyb3RlOjxiciB0eXBlPSJhdHRyaWJ1dGlv
biI+DQo8YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDti
b3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+PGZvbnQg
c2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMHB0Ij4NCjxkaXY+UGVyIGNvbW1pdCBm
MTcwNjhjMWM3ICgmcXVvdDt4ZW4taHZtOiByZW9yZ2FuaXplIHhlbi1odm0gYW5kIG1vdmUgY29t
bW9uPGJyPg0KZnVuY3Rpb24gdG8geGVuLWh2bS1jb21tb24mcXVvdDspLCBoYW5kbGVfaW9yZXEo
KSBpcyBleHBlY3RlZCB0byBiZTxicj4NCnRhcmdldC1hZ25vc3RpYy4gSG93ZXZlciBpdCB1c2Vz
ICd0YXJnZXRfdWxvbmcnLCB3aGljaCBpcyBhIHRhcmdldDxicj4NCnNwZWNpZmljIGRlZmluaXRp
b24uPGJyPg0KPGJyPg0KSW4gb3JkZXIgdG8gY29tcGlsZSB0aGlzIGZpbGUgb25jZSBmb3IgYWxs
IHRhcmdldHMsIGZhY3RvciB0aGU8YnI+DQp0YXJnZXQtc3BlY2lmaWMgY29kZSBvdXQgb2YgaGFu
ZGxlX2lvcmVxKCkgYXMgYSBwZXItdGFyZ2V0IGhhbmRsZXI8YnI+DQpjYWxsZWQgeGVuX2FyY2hf
YWxpZ25faW9yZXFfZGF0YSgpLjxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpICZsdDtwaGlsbWRAbGluYXJvLm9yZyZndDs8YnI+DQotLS08YnI+DQpTaG91
bGQgd2UgaGF2ZSBhICd1bnNpZ25lZCBxZW11X3RhcmdldF9sb25nX2JpdHMoKTsnIGhlbHBlcjxi
cj4NCnN1Y2ggcWVtdV90YXJnZXRfcGFnZV9mb28oKSBBUEkgYW5kIHRhcmdldF93b3Jkc19iaWdl
bmRpYW4oKT88YnI+DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+
DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+PGJyPg0KPC9kaXY+DQo8
ZGl2IGRpcj0iYXV0byI+SXQgY2FuIGJlIG1vcmUgZnVuIHRoYW4gdGhhdCB0aG91Z2guIFdoYXQg
YWJvdXQgcWVtdV90YXJnZXRfYWxpZ25vZl91aW50NjQoKSBmb3IgZXhhbXBsZSwgd2hpY2ggZGlm
ZmVycyBiZXR3ZWVuIGkzODYgYW5kIHg4Nl82NCBhbmQgY2F1c2VzIGV2ZW4gc3RydWN0cyB3aXRo
ICpleHBsaWNpdGx5KiBzaXplZCBmaWVsZHMgdG8gZGlmZmVyIGJlY2F1c2Ugb2YgcGFkZGluZy48
L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj5JJ2Qg
KmxvdmUqIHRvIHNlZSB0aGlzIHNlcmllcyBhcyBhIHN0ZXAgdG93YXJkcyBteSBmYW50YXN5IG9m
IGJlaW5nIGFibGUgdG8gc3VwcG9ydCBYZW4gdW5kZXIgVENHLiBBZnRlciBhbGwsIHdpdGhvdXQg
dGhhdCB3aGF0J3MgdGhlIHBvaW50IGluIGJlaW5nIHRhcmdldC1hZ25vc3RpYz88L2Rpdj4NCjxk
aXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj5Ib3dldmVyLCBJIGFt
IG1pbGRseSBjb25jZXJuZWQgdGhhdCBzb21lIG9mIHRoZXNlIGZpbGVzIGFyZSBhY2NpZGVudGFs
bHkgdXNpbmcgdGhlIGhvc3QgRUxGIEFCSSwgcGVyaGFwcyB3aXRoIGV4cGxpY2l0IG1hbmFnZW1l
bnQgb2YgMzItYml0IGNvbXBhdGliaWxpdHksIGFuZCB0aGUgdGFyZ2V0LWFnbm9zdGljaXR5IGlz
IHB1cmVseSBhbiBpbGx1c2lvbj88L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4N
CjxkaXYgZGlyPSJhdXRvIj5TZWUgdGhlICZxdW90O3Byb3RvY29sJnF1b3Q7IGhhbmRsaW5nIGFu
ZCB0aGUgdGhyZWUgQUJJcyBmb3IgdGhlIHJpbmcgaW4geGVuLWJsb2NrLCBmb3IgZXhhbXBsZS48
L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj5DYW4g
d2UgYmUgZXhwbGljaXQgYWJvdXQgd2hhdCdzIGV4cGVjdGVkIHRvIHdvcmsgaGVyZSBhbmQgd2hh
dCdzIG5vdCBpbiBzY29wZT8mbmJzcDs8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rp
dj4NCjwvZGl2Pg0KPGJyPjxicj48YnI+QW1hem9uIERldmVsb3BtZW50IENlbnRyZSAoTG9uZG9u
KSBMdGQuUmVnaXN0ZXJlZCBpbiBFbmdsYW5kIGFuZCBXYWxlcyB3aXRoIHJlZ2lzdHJhdGlvbiBu
dW1iZXIgMDQ1NDMyMzIgd2l0aCBpdHMgcmVnaXN0ZXJlZCBvZmZpY2UgYXQgMSBQcmluY2lwYWwg
UGxhY2UsIFdvcnNoaXAgU3RyZWV0LCBMb25kb24gRUMyQSAyRkEsIFVuaXRlZCBLaW5nZG9tLjxi
cj48YnI+PGJyPgo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_f791a822f6f544fa904bf67d3f193763emailandroidcom_--


