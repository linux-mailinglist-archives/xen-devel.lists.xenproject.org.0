Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2CA2BAD2A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 16:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32315.63364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg85U-0007MJ-0H; Fri, 20 Nov 2020 15:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32315.63364; Fri, 20 Nov 2020 15:12:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg85T-0007Lw-T0; Fri, 20 Nov 2020 15:12:35 +0000
Received: by outflank-mailman (input) for mailman id 32315;
 Fri, 20 Nov 2020 15:12:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WHVp=E2=amazon.co.uk=prvs=5864bad74=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kg85S-0007Lo-Al
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:12:34 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2fe4309-0a17-4d83-96c0-2113bf821642;
 Fri, 20 Nov 2020 15:12:33 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 20 Nov 2020 15:12:27 +0000
Received: from EX13D32EUC003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 33532A20E0; Fri, 20 Nov 2020 15:12:26 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Nov 2020 15:12:25 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 20 Nov 2020 15:12:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WHVp=E2=amazon.co.uk=prvs=5864bad74=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kg85S-0007Lo-Al
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:12:34 +0000
X-Inumbo-ID: d2fe4309-0a17-4d83-96c0-2113bf821642
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d2fe4309-0a17-4d83-96c0-2113bf821642;
	Fri, 20 Nov 2020 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1605885153; x=1637421153;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=NGvsQnBYaANVCJh02E68OqZwYy2JRHKJhBQQw90P4l8=;
  b=pknAlqtwYuSSsQlMPk3jtKShJzARMXzE/VIJGsNSwUAF02gtciC66NeK
   5290r6L9IvZ/KhrDrCoQyLfTGCwYfdE7wEbtLnxCpDfVDuAUmuuiPnLMN
   3qcM1QXZxaS8TQyqyJpijlOKppS0FKxELBBEi2NKxVxJfwB9zp2xuMuBc
   Q=;
X-IronPort-AV: E=Sophos;i="5.78,356,1599523200"; 
   d="scan'208";a="66254629"
Subject: RE: [PATCH v2 05/12] viridian: use hypercall_vpmask in hvcall_ipi()
Thread-Topic: [PATCH v2 05/12] viridian: use hypercall_vpmask in hvcall_ipi()
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 20 Nov 2020 15:12:27 +0000
Received: from EX13D32EUC003.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS id 33532A20E0;
	Fri, 20 Nov 2020 15:12:26 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Nov 2020 15:12:25 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 20 Nov 2020 15:12:25 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQHWv08fwALhu38GGk2wLQdBAEFKPKnRIGSQ
Date: Fri, 20 Nov 2020 15:12:25 +0000
Message-ID: <90afbf7ee1214d79ad506a9e66f05c92@EX13D32EUC003.ant.amazon.com>
References: <20201120094900.1489-1-paul@xen.org>
 <20201120094900.1489-6-paul@xen.org>
 <a7e118c7-2b72-98f8-19a1-82667c47f44f@suse.com>
In-Reply-To: <a7e118c7-2b72-98f8-19a1-82667c47f44f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.242]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIwIE5vdmVtYmVyIDIwMjAgMTU6MDkNCj4gVG86IFBhdWwg
RHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1h
em9uLmNvLnVrPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSRTogW0VY
VEVSTkFMXSBbUEFUQ0ggdjIgMDUvMTJdIHZpcmlkaWFuOiB1c2UgaHlwZXJjYWxsX3ZwbWFzayBp
biBodmNhbGxfaXBpKCkNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9t
IG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4N
Cj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIDIwLjExLjIwMjAgMTA6NDgs
IFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFu
L3ZpcmlkaWFuLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFu
LmMNCj4gPiBAQCAtNTUxLDYgKzU1MSwyNSBAQCBzdGF0aWMgYm9vbCB2cG1hc2tfdGVzdChjb25z
dCBzdHJ1Y3QgaHlwZXJjYWxsX3ZwbWFzayAqdnBtYXNrLA0KPiA+ICAgICAgcmV0dXJuIHRlc3Rf
Yml0KHZwLCB2cG1hc2stPm1hc2spOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIHVuc2lnbmVk
IGludCB2cG1hc2tfZmlyc3Qoc3RydWN0IGh5cGVyY2FsbF92cG1hc2sgKnZwbWFzaykNCj4gDQo+
IE5vdyB0aGlzIGFuZCAuLi4NCj4gDQo+ID4gK3sNCj4gPiArICAgIHJldHVybiBmaW5kX2ZpcnN0
X2JpdCh2cG1hc2stPm1hc2ssIEhWTV9NQVhfVkNQVVMpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtz
dGF0aWMgdW5zaWduZWQgaW50IHZwbWFza19uZXh0KHN0cnVjdCBoeXBlcmNhbGxfdnBtYXNrICp2
cG1hc2ssIHVuc2lnbmVkIGludCB2cCkNCj4gDQo+IC4uLiB0aGlzIHNob3VsZCByZWFsbHkgaGF2
ZSBwb2ludGVycyB0byBjb25zdCBhcyBwYXJhbWV0ZXJzLg0KPiANCj4gPiBAQCAtNjMxLDEzICs2
NTAsMjEgQEAgc3RhdGljIGludCBodmNhbGxfZmx1c2godW5pb24gaHlwZXJjYWxsX2lucHV0ICpp
bnB1dCwNCj4gPiAgICAgIHJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIHZvaWQg
c2VuZF9pcGkoc3RydWN0IGh5cGVyY2FsbF92cG1hc2sgKnZwbWFzaywgdWludDhfdCB2ZWN0b3Ip
DQo+IA0KPiBBbmQgSSBndWVzcyB0aGlzIG9uZSBzaG91bGQsIHRvby4NCj4gDQoNClRydWUsIHRo
ZXkgY2FuIGJlIGNvbnN0Lg0KDQogIFBhdWwNCg0KPiBKYW4NCg==

