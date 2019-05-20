Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9216231B9
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 12:50:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSfoi-0002fo-TS; Mon, 20 May 2019 10:46:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSfoh-0002fj-Da
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:46:51 +0000
X-Inumbo-ID: 91ec5ac8-7aec-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 91ec5ac8-7aec-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 10:46:49 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: KUgmLN9Ow5UXTsH8Fd0n6TLdEwP/rLo8EqNsjyHn3baS0TNcxzuUeMoA8eAJioS70WtjF0lL6Z
 07girzZS3iHr8QJrb/5pav7jhsnKUHwV+aFMglU7NL6ODzJ2dGUOL02rmbgMaUW43jsDiHUaf8
 bN6tA6EiF/KVyULxBe8KE9W8SXfY3BNkQLMtyszWgeiNRmwo1Z/1QMVswP0ex9cR/SEoo/xjuq
 Z+ROVdDz5fsWoEmesjvnnPjyPpeb59m0raqEYuZpYSOTwvL+ec1et6HWl84XzVzu86P1wcSuzF
 Qcs=
X-SBRS: 2.7
X-MesageID: 643031
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="643031"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23778.34168.78221.110803@mariner.uk.xensource.com>
Date: Mon, 20 May 2019 11:46:16 +0100
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Paul Durrant
 <paul.durrant@citrix.com>
In-Reply-To: <E1hSRQF-0006xk-BS@osstest.test-lab.xenproject.org>
References: <E1hSRQF-0006xk-BS@osstest.test-lab.xenproject.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] Linux 3.18 no longer boots under Xen, please fix
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Lars
 Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBoYXMgYmVlbiB0cnVlIGZvciBzb21lIHRpbWUuICBvc3N0ZXN0IGhhcyBiZWVuIHNlbmRp
bmcgYXV0b21hdGljCm1haWxzIGluY2x1ZGluZyBiaXNlY3Rpb24gcmVwb3J0cyBsaWtlIHRoZSBv
bmUgYmVsb3csIGZvciBhYm91dCBhCm1vbnRoLgoKb3NzdGVzdCdzICJ0ZXN0ZWQgYW5kIGdvb2Qi
IGJyYW5jaCBvZiBsaW51eC0zLjE4IGlzIDE5MCBkYXlzIGJlaGluZAp0aGUgdXBzdHJlYW0gdGlw
LgoKRG8gd2UgY2FyZSBhYm91dCB0aGlzIGF0IGFsbCA/CgpOb3RlIHRoYXQgdGhlIFhlbiBQcm9q
ZWN0IGRvZXMgbm90IGhhdmUgYSBkZWRpY2F0ZWQgdGVhbSBvZiBRQQplbmdpbmVlcnMgd2hvIGRv
IHRyaWFnZSBvZiB0ZXN0IHJlcG9ydHMuICBJdCBpcyB1cCB0byBldmVyeSBtYWludGFpbmVyCm9m
IGV2ZXJ5IFhlbi1yZWxhdGVkIGNvbXBvbmVudCB0byBrZWVwIGFuIGV5ZSBvbiB0aGVzZSB0ZXN0
IHJlcG9ydHMKYW5kIGludmVzdGlnYXRlIGZhaWx1cmVzLgoKRm9yIHRoZSBhdm9pZGFuY2Ugb2Yg
YW55IGRvdWJ0LCBvc3N0ZXN0J3MgImJpc2VjdGlvbiBjb21wbGV0ZSIgcmVwb3J0cwpjYW4gYWx3
YXlzIGJlIHJlbGllZCBvbiB0byBhY2N1cmF0ZWx5IGlkZW50aWZ5IGEgcmVhbCwgcmVwZWF0YWJs
ZSwKcmVncmVzc2lvbi4gIG9zc3Rlc3Qgd2lsbCBvbmx5IG1ha2Ugc3VjaCBhIHJlcG9ydCBpZiBp
dCBoYXMgcmVwcm9kdWNlZApzZXZlcmFsIHRpbWVzIGJvdGggdGhlIGZhaWx1cmUgYXQgdGhlIGNv
bW1pdCBpdCBibGFtZXMsIGFuZCB0aGUKc3VjY2VzcyBhdCB0aGUgY29tbWl0IGl0IHNheXMgaXMg
T0suICAoSW4gdHJlZXMgd2l0aCBhIGxvdCBvZiBtZXJnaW5nLAp0aGUgY29tbWl0IHRoYXQgaXMg
YmxhbWVkIGlzIHNhZGx5IG9mdGVuIGEgbWVyZ2UsIGJ1dCBvbmUgb2YgaXRzCnBhcmVudHMgd2ls
bCBiZSBpZGVudGlmaWVkIGFzIGdvb2QuKQoKSW4gdGhpcyBjYXNlIG9zc3Rlc3QgaGFzIHNlbnQg
YSBzaWduaWZpY2FudCBudW1iZXIgb2YgZnVuY3Rpb25hbGx5CmlkZW50aWNhbCByZXBvcnRzIHNh
eWluZyBpdCBoYXMgaWRlbnRpZmllZCBhIHJlZ3Jlc3Npb24gaW4gbG90cyBvZgpkaWZmZXJlbnQg
dGVzdHMuICBCdXQgdGhpcyBoYXMgbm90IHJlc3VsdGVkIGluIGFueSBhY3Rpb24gQUZBSUFBLgoK
UGxlYXNlIHdvdWxkIHNvbWVvbmUgaW52b2x2ZWQgd2l0aCB0aGUgTGludXgga2VybmVsIGVuZCBv
ZiB0aGluZ3MgcGljawp0aGlzIHVwLgoKVGhhbmtzLApJYW4uCgpvc3N0ZXN0IHNlcnZpY2Ugb3du
ZXIgd3JpdGVzICgiW2xpbnV4LTMuMTggYmlzZWN0aW9uXSBjb21wbGV0ZSB0ZXN0LWFtZDY0LWFt
ZDY0LXhsIik6Cj4gYnJhbmNoIHhlbi11bnN0YWJsZQo+IHhlbmJyYW5jaCB4ZW4tdW5zdGFibGUK
PiBqb2IgdGVzdC1hbWQ2NC1hbWQ2NC14bAo+IHRlc3RpZCB4ZW4tYm9vdAo+IAo+IFRyZWU6IGxp
bnV4IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUv
bGludXgtc3RhYmxlLmdpdAo+IFRyZWU6IGxpbnV4ZmlybXdhcmUgZ2l0Oi8veGVuYml0cy54ZW4u
b3JnL29zc3Rlc3QvbGludXgtZmlybXdhcmUuZ2l0Cj4gVHJlZTogb3ZtZiBnaXQ6Ly94ZW5iaXRz
Lnhlbi5vcmcvb3NzdGVzdC9vdm1mLmdpdAo+IFRyZWU6IHFlbXUgZ2l0Oi8veGVuYml0cy54ZW4u
b3JnL3FlbXUteGVuLXRyYWRpdGlvbmFsLmdpdAo+IFRyZWU6IHFlbXV1IGdpdDovL3hlbmJpdHMu
eGVuLm9yZy9xZW11LXhlbi5naXQKPiBUcmVlOiB4ZW4gZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3hl
bi5naXQKPiAKPiAqKiogRm91bmQgYW5kIHJlcHJvZHVjZWQgcHJvYmxlbSBjaGFuZ2VzZXQgKioq
Cj4gCj4gICBCdWcgaXMgaW4gdHJlZTogIGxpbnV4IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLmdpdAo+ICAgQnVnIGludHJv
ZHVjZWQ6ICA2YjFhZTUyN2IxZmRlZTg2ZTgxZGEwY2IyNmNlZDc1NzMxYzZjMGZhCj4gICBCdWcg
bm90IHByZXNlbnQ6IGJhNjk4NGZjMDE2MmYyNGE1MTBlYmMzNGU4ODFiNTQ2YjY5YzU1M2IKPiAg
IExhc3QgZmFpbCByZXBybzogaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3Nz
dGVzdC9sb2dzLzEzNjU3NC8KPiAKPiAKPiAgIChSZXZpc2lvbiBsb2cgdG9vIGxvbmcsIG9taXR0
ZWQuKQo+IAo+IAo+IEZvciBiaXNlY3Rpb24gcmV2aXNpb24tdHVwbGUgZ3JhcGggc2VlOgo+ICAg
IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvcmVzdWx0cy9iaXNl
Y3QvbGludXgtMy4xOC90ZXN0LWFtZDY0LWFtZDY0LXhsLnhlbi1ib290Lmh0bWwKPiBSZXZpc2lv
biBJRHMgaW4gZWFjaCBncmFwaCBub2RlIHJlZmVyLCByZXNwZWN0aXZlbHksIHRvIHRoZSBUcmVl
cyBhYm92ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
