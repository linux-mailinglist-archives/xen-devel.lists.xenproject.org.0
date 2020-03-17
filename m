Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2D5188B3B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 17:54:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEFQx-00035U-Gy; Tue, 17 Mar 2020 16:51:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+aMz=5C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jEFQv-00035P-At
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 16:51:13 +0000
X-Inumbo-ID: 81cb5f6d-686f-11ea-b989-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81cb5f6d-686f-11ea-b989-12813bfff9fa;
 Tue, 17 Mar 2020 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584463871;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=/xVJHYSOery16GcM2qZMCI/3zIFAJfSD7XUe+wYFTH4=;
 b=BILV3qXtAfRK9e+njCBFnw0XQZuTKDoIEo+IY6mkbCNtAVvBD3FKroPq
 Chvs2H1z7Uxsnf9HdX4LXJINUYukFh4qyBpWxdt0N3x6pZa5GcfM/1zrR
 PHuPf1ZcyxeeQTolduv9wb+Go6h8bIEyy8voYD0/EmriMWozTvBLoxkrc w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YhaRboTnhgWOyeemvORfRobjQdDgBSc8HDA+zQV9KfDGMI4EiH9KvfhKKzgVqsfeIGa0A8yvI6
 zqH26FHfNnUcHUdw68+f/LAQZ1q7J208sq8NwAMejex1JvrT213/xhds17+YPfgxktdGm58sju
 9Yu3zMtDqFmHn/ULBe+EAkxImdNe5dgW5DVZgPVgUk8zfSFS6zQcPmU9U18PNuHeC9uXCIkdZh
 JO5x6R8BUF+iee8c1Ytl47eZC9YzLVq2ZWbcsQItgMayTcxbWC+fORTV0hK9/B5T32TGO55lcn
 YLo=
X-SBRS: 2.7
X-MesageID: 14553940
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,565,1574139600"; d="scan'208";a="14553940"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24176.65527.664041.750403@mariner.uk.xensource.com>
Date: Tue, 17 Mar 2020 16:51:03 +0000
To: Paul Durrant <paul@xenproject.org>
In-Reply-To: <20200305121417.16583-3-pdurrant@amzn.com>
References: <20200305121417.16583-1-pdurrant@amzn.com>
 <20200305121417.16583-3-pdurrant@amzn.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 2/2] libxl: make creation of xenstore
 'suspend event channel' node optional...
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
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cGR1cnJhbnRAYW16bi5jb20gd3JpdGVzICgiW1BBVENIIHYyIDIvMl0gbGlieGw6IG1ha2UgY3Jl
YXRpb24gb2YgeGVuc3RvcmUgJ3N1c3BlbmQgZXZlbnQgY2hhbm5lbCcgbm9kZSBvcHRpb25hbC4u
LiIpOgo+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiAuLi4g
YW5kIG1ha2UgdGhlIHRvcCBsZXZlbCAnZGV2aWNlJyBub2RlIGluIHhlbnN0b3JlIHdyaXRhYmxl
IGJ5IHRoZQo+IGd1ZXN0CgpTb3JyeSBmb3IgdGFraW5nIGEgbG9uZyB0aW1lIHRvIHJldmlldyB0
aGlzLiAgVGhhbmtzIGZvciB5b3VyCnByb3Bvc2FsLgoKPiBUaGUgcHVycG9zZSBhbmQgc2VtYW50
aWNzIG9mIHRoZSBzdXNwZW5kIGV2ZW50IGNoYW5uZWwgbm9kZSBhcmUgZXhwbGFpbmVkCj4gaW4g
eGVuc3RvcmUtcGF0aHMucGFuZG9jIFsxXS4gSXQgd2FzIG9yaWdpbmFsbHkgaW50cm9kdWNlZCBp
biB4ZW5kIGJ5Cj4gY29tbWl0IDE3NjM2ZjQ3YTQ3NCAiVGVhY2ggeGNfc2F2ZSB0byB1c2UgZXZl
bnQtY2hhbm5lbC1iYXNlZCBkb21haW4KPiBzdXNwZW5kIGlmIGF2YWlsYWJsZS4iLiBOb3RlIHRo
YXQsIGJlY2F1c2UsIHRoZSB0b3AtbGV2ZWwgZnJvbnRlbmQKPiAnZGV2aWNlJyBub2RlIHdhcyBj
cmVhdGVkIHdyaXRhYmxlIGJ5IHRoZSBndWVzdCBpbiB4ZW5kLCB0aGVyZSB3YXMgbm8KPiBuZWVk
IHRvIGV4cGxpY2l0bHkgY3JlYXRlIHRoZSAnc3VzcGVuZC1ldmVudC1jaGFubmVsJyBub2RlIGFz
IHdyaXRhYmxlCj4gbm9kZS4KPiAKPiBIb3dldmVyLCBsaWJ4bCBjcmVhdGVzIHRoZSAnZGV2aWNl
JyBub2RlIGFzIHJlYWQtb25seSBieSB0aGUgZ3Vlc3QgYW5kIHNvCj4gZXhwbGljaXQgY3JlYXRp
b24gb2YgdGhlICdzdXNwZW5kLWV2ZW50LWNoYW5uZWwnIG5vZGUgaXMgbmVjZXNzYXJ5IHRvIG1h
a2UKPiBpdCB1c2FibGUuIFRoaXMgdW5mb3J0dW5hdGVseSBoYXMgdGhlIHNpZGUtZWZmZWN0IG9m
IG1ha2luZyBzb21lIG9sZAo+IFdpbmRvd3MgUFYgZHJpdmVycyBbMl0gY2Vhc2UgdG8gZnVuY3Rp
b24uIFRoaXMgaXMgYmVjYXVzZSB0aGV5IHNjYW4gdGhlIHRvcAo+IGxldmVsICdkZXZpY2UnIG5v
ZGUsIGZpbmQgdGhlICdzdXNwZW5kJyBub2RlIGFuZCBleHBlY3QgaXQgdG8gY29udGFpbiB0aGUK
PiB1c3VhbCBzdWItbm9kZXMgZGVzY3JpYmluZyBhIFBWIGZyb250ZW5kLiBXaGVuIHRoaXMgaXMg
Zm91bmQgbm90IHRvIGJlIHRoZQo+IGNhc2UsIGVudW1lcmF0aW9uIGNlYXNlcyBhbmQgKGJlY2F1
c2UgdGhlICdzdXNwZW5kJyBub2RlIGlzIG9ic2VydmVkIGJlZm9yZQo+IHRoZSAndmJkJyBub2Rl
KSBubyBzeXN0ZW0gZGlzayBpcyBlbnVtZXJhdGVkLiBXaW5kb3dzIHdpbGwgdGhlbiBjcmFzaCB3
aXRoCj4gYnVnY2hlY2sgY29kZSAweDdCLgoKVGhpcyBpcyBxdWl0ZSBhIHRob3JueSBwcm9ibGVt
LgoKSSBhbSB1bmNvbWZvcnRhYmxlIHdpdGggbWFraW5nIH4vZGV2aWNlIHdyaXRlYWJsZSBieSB0
aGUgZ3Vlc3QuICBGcm9tCndoYXQgeW91IHNheSBpdCBpcyBuZWNlc3NhcnkgZm9yIGF0IGxlYXN0
IHRoZXNlIGd1ZXN0cyBidXQgSSB3b3JyeQp0aGF0IHRoZXJlIG1pZ2h0IGJlIHNvbWV0aGluZyBv
dXQgdGhlcmUgc29tZXdoZXJlIChtYXliZSBub3QgZXZlbiBpbgpvdXIgdHJlZSkgd2hpY2ggdHJ1
c3RzIGl0IHRvbyBtdWNoLiAgKGxpYnhsIHVzZWQgdG8gYmUgaW4gdGhpcwpjYXRlZ29yeSwgYmVm
b3JlIFhTQS0xNzUvMTc4LCBzbyB0aGlzIGlzIHNhZGx5IG5vdCBhIHRoZW9yZXRpY2FsCmNvbmNl
cm4uKSAgSXQncyB0cnVlIHRoYXQgeGVuZCBhcHBhcmVudGx5IG1ha2UgdGhpcyB3cml0ZWFibGUg
YnV0CndlIGhhdmUgYmVlbiBtYWtpbmcgaXQgcmVhZG9ubHkgZm9yIGEgd2hpbGUgbm93IGFuZCBt
YXliZSBwZW9wbGUKcmVhZCB4ZW5zdG9yZS1scyB0byBzZWUsIG9yIGp1c3QgZGlkbid0IGNhcmUu
Li4KCkknbSBub3Qgc3VyZSBob3cgd2UgY291bGQgY29uZHVjdCBhbiBhdWRpdCB0byBmaW5kIHBy
b2JsZW1zLiAgSXQgc2VlbXMKbGlrZSB0aGF0IHdvdWxkIGJlIGhhcmQgdG8gZG8gdGhvcm91Z2hs
eSAoYW5kIGEgZGlzcHJvcG9ydGlvbmF0ZQplZmZvcnQpLiAgQnV0IHdlIGNvdWxkIGF0IGxlYXN0
CiAgLSBtYWtlIHRoaXMgcGF0aCB3cml0ZWFibGUgb25seSBhcyBhIGJ1ZyBjb21wYXRpYmlsaXR5
IGZlYXR1cmUsCiAgICAgaWUgd2hlbiBuZWVkZWQgdG8gc3VwcG9ydCB0aGlzIG9sZCBndWVzdAog
IC0gbWFrZSBzdXJlIHdlIGRvY3VtZW50IGl0IGNsZWFybHkgaW4geGVuc3RvcmUtcGF0aHMgYXMg
dGhhdAogICAgIGlzIHRoZSBhcmNoIHJlZmVyZW5jZSB0aGF0IHBlb3BsZSB3aWxsIHVzZSB3aGVu
IGNvZGluZwogIC0gZG9jdW1lbnQgdGhlIGZhY3QgdGhhdCB0aGVyZSBtYXkgYmUgc2VjdXJpdHkg
aW1wbGljYXRpb25zCiAgICAgb2Ygc2V0dGluZyB0aHNpIGNvbXBhdCBvcHRpb24KCj4gVGhpcyBw
YXRjaCBhZGRzIGEgYm9vbGVhbiAnc3VzcGVuZF9ldmVudF9jaGFubmVsJyBmaWVsZCBpbnRvCj4g
bGlieGxfY3JlYXRlX2luZm8gdG8gY29udHJvbCB3aGV0aGVyIHRoZSB4ZW5zdG9yZSBub2RlIGlz
IGNyZWF0ZWQgYW5kIGEKPiBzaW1pbGFybHkgbmFtZWQgb3B0aW9uIGluIHhsLmNmZyB3aGljaCwg
Zm9yIGNvbXBhdGliaWxpdHkgd2l0aCBwcmV2aW91cwo+IGxpYnhsIGJlaGF2aW91ciwgZGVmYXVs
dHMgdG8gdHJ1ZS4gSXQgYWxzbyBtYWtlcyB0aGUgdG9wIGxldmVsIGRldmljZSBub2RlCj4gd3Jp
dGFibGUsIGFzIHhlbmQgZGlkLCBhbmQgdXBkYXRlcyB4ZW5zdG9yZS1wYXRocy5wYW5kb2MgdG8g
c2F5IHRoYXQgdGhlCj4gc3VzcGVuZCBldmVudCBjaGFubmVsIG5vZGUgbWF5IG5vdCBleGlzdCBh
bmQgdGhhdCB0aGUgZ3Vlc3QgbWF5IGNyZWF0ZSBpdAo+IGlmIGl0IGRvZXMgbm90IGV4aXN0LgoK
U28gbXkgaW5jbGluYXRpb24gaXMgdG8gYXNrIHlvdSB0byByZXdvcmsgdGhpcyBwYXRjaCBzbyB0
aGF0OgoKICAtIHRoZSBuYW1lIG9mIHRoZSBjb25maWcgb3B0aW9uIG1vcmUgY2xlYXJseSBpbmRp
Y2F0ZXMgaXRzIHN0YXR1cwogICAgIGFzIGEgYnVnIGNvbXBhdCB3b3JrYXJvdW5kCiAgLSB0aGUg
fi9kZXZpY2Ugd3JpdGVhYmlsaXR5IGlzIGNvbnRyb2xsZWQgYnkgdGhlIHNhbWUgY29tcGF0IGZs
YWcsCiAgICAgd2l0aCBjb3JyZXNwb25kaW5nIHVwZGF0ZSB0byB0aGUgZG9jcyBmb3IgdGhlIGNv
bXBhdCBmbGFnCiAgLSBhZGRpbmcgYW4gZW50cnkgZm9yIHRoZSB0b3AtbGV2ZWwgfi9kZXZpY2Ug
dG8KICAgICB4ZW5zdG9yZS1wYXRocy5wYW5kb2MKCkJ1dCBJIGFtIG9wZW4gdG8gb3RoZXIgYXBw
cm9hY2hlcy4KCj4gTk9URTogV2hpbGUgYWRkaW5nIHRoZSBuZXcgTElCWExfSEFWRV9DUkVBVEVJ
TkZPX1NVU1BFTkRfRVZFTlRfQ0hBTk5FTAo+ICAgICAgIGRlZmluaXRpb24gaW50byBsaWJ4bC5o
LCB0aGlzIHBhdGNoIGNvcnJlY3RzIHRoZSBwcmV2aW91cyBzdGFuemEKPiAgICAgICB3aGljaCBl
cnJvbmVvdXNseSBpbXBsaWVzIGxpYnhsX2RvbWFpbl9jcmVhdGVfaW5mbyBpcyBhIGZ1bmN0aW9u
LgoKTm9ybWFsbHkgd2UgbGlrZSB0aGluZ3MgYnJva2VuIG91dCBpbnRvIHRoZWlyIG93biBwYXRj
aGVzIGJ1dCB0aGlzIG9uZQppcyB0cml2aWFsIEkgd29uJ3QgaW5zaXN0IG9uIHRoYXQuCgpJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
