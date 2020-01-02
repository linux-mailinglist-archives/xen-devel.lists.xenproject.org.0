Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5EB12E95E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 18:27:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4Db-0006yg-5y; Thu, 02 Jan 2020 17:25:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/dY=2X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1in4Da-0006yZ-6O
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 17:25:06 +0000
X-Inumbo-ID: d09fd9fe-2d84-11ea-a3a1-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d09fd9fe-2d84-11ea-a3a1-12813bfff9fa;
 Thu, 02 Jan 2020 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577985906;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=+l2L3E5c64bZVQCU3GWfPg9Ft+R4d1d15gNAfIqpZ9o=;
 b=iA9QcmggTwtU5r2CyL0YpFrfqKl8rFIx5UsnuLZ/uO94LR+mENjvJBhb
 4tmtAPk0JFibTaFcKJZD28gwKtL7MH1v59am/VaMbYfGO1Mt0PL6mgGDG
 zTfWWVlcE+0s4HqksGAv1H5X6WMudEBaoywmiFEdBNneLS8tYDOoefDvi I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uAFVtAzZQHLTKg/Gscf4K+o2yU+QG89JbOzfPIh2GMjs0rbHEypYpur3A3iCdfGBvagGSqXtw4
 MM4FE1wvhZr6DxSAVOBeOQerpM/IXoMUCciYHEf4Z2DgRC3P7n1EksL7H95FUPb3WiBErANje4
 LJ4pHfLMIhnq3CnVywzYzBCyyr0MBrzk8WoZacW2cDwcQ4PFaJp1UXSI9nDuEHkvQV7ahVpOJb
 mU7xTmEr/4+P5f+PDREQdkM2pqDThFxQ5iqqJhmM7IErptgM4Z1GMy1JD6SftstIRCW2Yptw66
 KTQ=
X-SBRS: 2.7
X-MesageID: 10541184
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10541184"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24078.10093.571397.417202@mariner.uk.xensource.com>
Date: Thu, 2 Jan 2020 17:25:01 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20191224130416.3570-5-pdurrant@amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
 <20191224130416.3570-5-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 4/6] domctl: set XEN_DOMCTL_createdomain
 'rover' if valid domid is specified
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCA0LzZdIGRvbWN0bDogc2V0IFhFTl9ET01DVExf
Y3JlYXRlZG9tYWluICdyb3ZlcicgaWYgdmFsaWQgZG9taWQgaXMgc3BlY2lmaWVkIik6Cj4gVGhl
IHZhbHVlIG9mICdyb3ZlcicgaXMgdGhlIHZhbHVlIGF0IHdoaWNoIFhlbiB3aWxsIHN0YXJ0IHNl
YXJjaGluZyBmb3IgYW4KPiB1bnVzZWQgZG9taWQgaWYgbm9uZSBpcyBzcGVjaWZpZWQuIEN1cnJl
bnRseSBpdCBpcyBvbmx5IHVwZGF0ZWQgd2hlbiBhCj4gZG9taWQgaXMgYXV0b21hdGljYWxseSBj
aG9zZW4sIHJhdGhlciB0aGFuIHNwZWNpZmllZCBieSB0aGUgY2FsbGVyLCB3aGljaAo+IG1ha2Vz
IGl0IHZlcnkgaGFyZCB0byBkZXNjcmliZSBYZW4ncyByYXRpb25hbGUgaW4gY2hvb3NpbmcgZG9t
aWRzIGluIGFuCj4gZW52aXJvbm1lbnQgd2hlcmUgc29tZSBkb21haW4gY3JlYXRpb25zIGhhdmUg
c3BlY2lmaWVkIGRvbWlkcyBhbmQgc29tZQo+IGRvbid0Lgo+IFRoaXMgcGF0Y2ggYWx3YXlzIHVw
ZGF0ZXMgJ3JvdmVyJyBhZnRlciBhIHN1Y2Nlc3NmdWwgY3JlYXRpb24sIGV2ZW4gaW4gdGhlCj4g
Y2FzZSB0aGF0IGRvbWlkIGlzIHNwZWNpZmllZCBieSB0aGUgY2FsbGVyLiBUaGlzIGVuc3VyZXMg
dGhhdCwgaWYgWGVuCj4gYXV0b21hdGljYWxseSBjaG9vc2VzIGEgZG9taWQgZm9yIGEgc3Vic2Vx
dWVudCBkb21haW4gY3JlYXRpb24gaXQgd2lsbAo+IGFsd2F5cyBiZSB0aGUgbmV4dCBhdmFpbGFi
bGUgdmFsdWUgYWZ0ZXIgdGhlIGRvbWlkIG9mIHRoZSBtb3N0IHJlY2VudGx5Cj4gY3JlYXRlZCBk
b21haW4uCgpJJ20gbm90IHlldCBjb252aW5jZWQgdGhpcyBiZWhhdmlvdXIgaXMgYmV0dGVyLCBi
dXQgSSdtIG9wZW4gdG8KcGVyc3Vhc2lvbi4KClRoZSBleGlzdGluZyBhbGxvY2F0aW9uIHN5c3Rl
bSBmYWxscyBkb3duIGluIGFueSBjYXNlIGlmIHRoZSBkb21pZApnZXRzIG5lYXIgdG8gd3JhcHBp
bmcgcm91bmQuICBJZiBpdCBkb2Vzbid0LCB0aGVuIHdpdGhvdXQgdGhpcyBwYXRjaAppdCBpcyBw
b3NzaWJsZSB0byBoYXZlIHR3byByYW5nZXMgb2YgZG9taWRzOiBhdXRvbWF0aWNhbGx5IGFsbG9j
YXRlZApvbmVzLCBhbmQgc3RhdGljYWxseSBhbGxvY2F0ZWQgaGlnaCBvbmVzLgoKV2l0aCB0aGlz
IHBhdGNoLCBzdGF0aWNhbGx5IGFsbG9jYXRpbmcgYSBkb21pZCByZXNldHMgcm92ZXIgYW5kIGNh
dXNlcwp0aGUgcmVtYWluaW5nIGJpdHMgb2Ygc3RhdGljIHNwYWNlIHRvIGJlIHBvbGx1dGVkLgoK
V2hhdCBhbSBJIG1pc3NpbmcgPyAgV2hhdCBhcmUgdGhlIHVzZSBjYXNlcyBoZXJlID8KClRoYW5r
cywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
