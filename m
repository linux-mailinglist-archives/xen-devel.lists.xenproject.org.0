Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF5F1625C8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:51:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j41Lx-0003D9-6Q; Tue, 18 Feb 2020 11:47:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=171L=4G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j41Lv-0003Cz-E1
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:47:47 +0000
X-Inumbo-ID: 7af1d4c8-5244-11ea-ade5-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7af1d4c8-5244-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582026467;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=W8l0WpnvpSebVpWsWNBZ//1LQCO5jT9FfG4l6L5SwUA=;
 b=O5VGeaE3FiCurEAqN/gUj84P3d2nzVbbWujbAu+k1kEEuUxpWeXR5Zvr
 xSfvBuwr9h89OxngsT8hVU/U5AGml97g1xVYs1prEDZQreR/FogXqMPjW
 zBFvMnbBtCd49V7H5SGmjUNB8/bH1PB+nVvMTtcVDg74F9jT/+sVBwZAP E=;
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
IronPort-SDR: Z5Jqq6zEULirK1vfRTKxiETi5kLwQ4D4Ulk0v/EyEWdH0oM2RJVOwcI2f/Ect8lq7aTEkA6urN
 7C5xo6ubswp3WQ7CVQt09JU5d+So6S0pSctjFm7VpAqS7E4F5JxoxXNRKK3ltpmUY+6h3lcyIN
 O4t7lIQ61EgaLDTsgqxXnq1CukpzoqWewpDxEIvH8CO/LYNhcvmNtxgOdAA25msoqEoqHvqyb7
 naqKbpMTrNluLtxPB8NqjErGZM9VMBNuj0jIQnhJeyKyPoXzqdtqIDv7fq4NGmZTLkfdizl9jY
 w4c=
X-SBRS: 2.7
X-MesageID: 12786771
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12786771"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24139.52958.979063.189567@mariner.uk.xensource.com>
Date: Tue, 18 Feb 2020 11:47:42 +0000
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
In-Reply-To: <39fbefb0489942e498dfe20695021275@EX13D32EUC003.ant.amazon.com>
References: <20200131150149.2008-1-pdurrant@amazon.com>
 <20200131150149.2008-6-pdurrant@amazon.com>
 <24138.53923.699587.944099@mariner.uk.xensource.com>
 <78ccdd687a344eaf92ed8c978dc04f3c@EX13D32EUC003.ant.amazon.com>
 <24139.51124.66017.255351@mariner.uk.xensource.com>
 <39fbefb0489942e498dfe20695021275@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v5 5/7] libxl: allow creation of domains
 with a specified or random domid
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENIIHY1IDUvN10gbGlieGw6IGFsbG93IGNy
ZWF0aW9uIG9mIGRvbWFpbnMgd2l0aCBhIHNwZWNpZmllZCBvciByYW5kb20gZG9taWQiKToKPiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KPiA+IFNvcnJ5IGlmIEkgd2FzIGNv
bmZ1c2VkOyBJIHdpbGwgcmVhZCB0aGlzIGFnYWluLgo+IAo+IEl0IGlzIGhhcmQgdG8gZm9sbG93
IHRoZSBlcnJvciBwYXRocy4gRWFybHkgb24gaW4gZGV2ZWxvcG1lbnQgSSBlbmRlZCB1cCB3aXRo
IGRvbWFpbnMgZ2V0dGluZyBkZXN0cm95ZWQgd2hlbiBJIGRpZG4ndCB3YW50IHRoZW0gdG8gYmUg
KHdoZW4geGNfZG9tYWluX2NyZWF0ZSgpIGZhaWxlZCBkdWUgdG8gYSBkdXBsaWNhdGUgZG9taWQp
LgoKSGF2aW5nIHJlYWQgdGhlIHBhdGNoIGFnYWluLCBJIHN1Z2dlc3QgdGhlIGZvbGxvd2luZyBk
aXNjaXBsaW5lICh3aGljaAppcyBhbG9uZyB0aGUgbGluZXMgY29udGVtcGxhdGVkIGJ5IENPRFlJ
TkdfU1RZTEUpOgoKVGhlIGxvY2FsIHZhcmlhYmxlIGBkb21pZCcgY29udGFpbnMgb25seSBhIGRv
bWlkIHdlIGFyZSB0cnlpbmcgdG8KY3JlYXRlIGFuZCBkb2VzIG5vdCBjb25zdGl0dXRlIGEgImxv
Y2FsIFt2YXJpYWJsZV0gcmVmZXJyaW5nIHRvCnJlc291cmNlcyB3aGljaCBtaWdodCBuZWVkIGNs
ZWFuaW5nIHVwIiAoaW4gdGhlIHdvcmRzIG9mCkNPRElOR19TVFlMRSkuICBUaGVyZWZvcmUgaXQg
c2hvdWxkIG5ldmVyIGJlIHBhc3NlZCB0byBkZXN0cm95LgpNYXliZSBpdCBzaG91bGQgYmUgY2Fs
bGVkIGBwcm9zcGVjdGl2ZV9kb21pZCcuCgpUaGUgdmFyaWFibGUgKmRvbWlkIF9pc18gYSAibG9j
YWwgW3ZhcmlhYmxlXSByZWZlcnJpbmcgdG8gcmVzb3VyY2VzCndoaWNoIG1pZ2h0IG5lZWQgY2xl
YW5pbmcgdXAiLiAgVGhlcmVmb3JlIGl0IG11c3Qgb25seSBldmVyIGNvbnRhaW4gYQpkb21haW4g
d2hpY2ggYWN0dWFsbHkgZXhpc3RzLiAgSXQgc2hvdWxkIGJlIHNldCBmcm9tIHByb3NwZWN0aXZl
X2RvbWlkCndoZW4geGNfZG9tYWluX2NyZWF0ZSBzdWNjZWVkcywgYW5kIGNsZWFyZWQgKHNldCBi
YWNrIHRvIElOVkFMSUQpIHdoZW4KeGNfZG9tYWluX2Rlc3Ryb3kgc3VjY2VlZHMgaW4gb3VyIHJl
dHJ5IGxvb3AuCgpUaGF0IHdheSBhbnkgYGdvdG8gb3V0JyBhbnl3aGVyZSB3aWxsIGNsZWFyIHVw
IGEgZG9tYWluIGlmZiB0aGVyZSBpcwpvbmUgdG8gY2xlYXIgdXAuCgpUaGVyZSBpcyBhIGh1bmsg
aW4gdGhpcyBwYXRjaCB3aGljaCBJIHRoaW5rIGlzIGluY29tcGF0aWJsZSB3aXRoIHRoaXMKZGlz
Y2lwbGluZToKCiAgLSAgICBhc3NlcnQoc29mdF9yZXNldCB8fCAqZG9taWQgPT0gSU5WQUxJRF9E
T01JRCk7CiAgLQoKSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgdGhpcyBodW5rIGlzIGZvci4gIElm
IHdlIGFkb3B0IHRoZSBkaXNjaXBsaW5lCkkgc3VnZ2VzdCwgY2FuIGl0IGdvIGF3YXkgPwoKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
