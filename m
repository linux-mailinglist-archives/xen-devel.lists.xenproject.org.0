Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A80A16636C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:49:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4oxQ-0002Gw-CQ; Thu, 20 Feb 2020 16:45:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FovI=4I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j4oxO-0002Gr-L8
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:45:46 +0000
X-Inumbo-ID: 700ac778-5400-11ea-8562-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 700ac778-5400-11ea-8562-12813bfff9fa;
 Thu, 20 Feb 2020 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582217146;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=1Q8pD2Zj9U9GoL2aH4DLPn8eOQ6lTo2aBhMybgcTB00=;
 b=byHACQo4bU/67jKwWQx3UYPEqqBSQXNGKYovjJ5BIw8mzQLMdcTWo75m
 GZWlm+JUX7v0DzeHB1mSUbhU7KV+vTwxLTS1unN5wfjAVxkZmlTUR9M0a
 WnLchwwXe8nAt9UQ/ePQjck6sB24w5OKGAOMaH9IpTHQy/i0utQo+ANE/ M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UEG1ulofBLHIDddpR3SHojWXCGWY4Vqnp+6KFd5uQdbaZKYg8CQsKGT++ynK9qOxXZWBCzA3Pv
 4xQCIKBCZCVt7J2dmMaw20H1TgyAevSXuuW07MURFAMEYZ6e31lVJoQsR/0SNHYz7TPUsbojsM
 tMbCDghu3gVrkAq/s+Dym2iSwyVMCQRlgdra1BbhFEk4uhEWFQxQcNZYBewRou2qcFlA2Sko9s
 rE0M26CSZFzy9iFtDPwEcxf/KAzVdZ5mHEgD5KNRYv/eA9QbKqZlzfUumGSP0FIbj04kAE/is6
 crs=
X-SBRS: 2.7
X-MesageID: 12771462
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,465,1574139600"; d="scan'208";a="12771462"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24142.47029.435605.456811@mariner.uk.xensource.com>
Date: Thu, 20 Feb 2020 16:45:41 +0000
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
In-Reply-To: <46a3c93352de4e07b33263c9fb7f37bf@EX13D32EUC003.ant.amazon.com>
References: <20200219093754.2924-1-pdurrant@amazon.com>
 <20200219093754.2924-2-pdurrant@amazon.com>
 <24142.45469.349140.521462@mariner.uk.xensource.com>
 <46a3c93352de4e07b33263c9fb7f37bf@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v6 1/6] libxl: add infrastructure to track
 and query 'recent' domids
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENIIHY2IDEvNl0gbGlieGw6IGFkZCBpbmZy
YXN0cnVjdHVyZSB0byB0cmFjayBhbmQgcXVlcnkgJ3JlY2VudCcgZG9taWRzIik6Cj4gW0lhbjpd
Cj4gPiBJTU8gdGhlIHJldXNlIHRpbWVvdXQgY2FsbCBhbmQgdGhlIGNsb2NrX2dldHRpbWUgY2Fs
bCBzaG91bGQgYmUgcHV0IGluCj4gPiBsaWJ4bF9fb3Blbl9kb21pZF9oaXN0b3J5OyBhbmQgdGhl
IHRpbWUgZmlsdGVyaW5nIGNoZWNrIHNob3VsZCBiZQo+ID4gZm9sZGVkIGludG8gbGlieGxfX3Jl
YWRfcmVjZW50Lgo+IAo+IE9rLiBJIHdhcyBoYXZpbmcgYSBoYXJkIHRpbWUgZ3Vlc3NpbmcganVz
dCBleGFjdGx5IHdoYXQgeW91J3JlIGxvb2tpbmcgZm9yLiBJIHRoaW5rIHRoYXQgbWFrZXMgaXQg
YSBsaXR0bGUgY2xlYXJlci4KLi4uCj4gPiBJbiBteSByZXZpZXcgb2YgdjQgSSB3cm90ZToKPiA+
IAo+ID4gICBEbyB5b3UgdGhpbmsgdGhpcyBjYW4gYmUgY29tYmluZWQgc29tZWhvdyA/ICBQb3Nz
aWJpbGl0aWVzIHNlZW0gdG8KPiA+ICAgaW5jbHVkZTogZXhwbGljaXQgcmVhZF9yZWNlbnRfe2lu
aXQsZW50cnksZmluaXNofSBmdW5jdGlvbnM7IGEgc2luZ2xlCj4gPiAgIGZ1bmN0aW9uIHdpdGgg
YSAicGVyLWVudHJ5IiBjYWxsYmFjazsgc2FtZSBidXQgd2l0aCBhIG1hY3JvLiAgSWYgeW91Cj4g
PiAgIGRvIHRoYXQgeW91IGNhbiBhbHNvIGhhdmUgaXQgaGF2ZSBoYW5kbGUgdGhlICJmaWxlIGRv
ZXMgbm90IGV4aXN0Igo+ID4gICBzcGVjaWFsIGNhc2UuCj4gPiAKPiA+IFlvdSd2ZSBwcm92aWRl
ZCB0aGUgcmVhZF9yZWNlbnRfZW50cnkgZnVuY3Rpb24gYnV0IHRoZSAiaW5pdCIgZnVuY3Rpb24K
PiA+IGxpYnhsX19vcGVuX2RvbWlkX2hpc3RvcnkgZG9lcyB0b28gbGl0dGxlLiAgVGhpcyBzZXJp
ZXMgc2VlbXMgdG8gYmUKPiA+IG1vdmluZyB0b3dhcmRzIHdoYXQgSSBjYWxsZWQgcmVhZF9yZWNl
bnRfe2luaXQsZW50cnksZmluaXNofSAod2hpY2gKPiA+IHNob3VsZCBwcm9iYWJseSBoYXZlIHRo
ZSB0aW1lc3RhbXAgYW5kIEZJTEUqIGluIGEgc3RydWN0IHRvZ2V0aGVyKSBidXQKPiA+IGl0IHNl
ZW1zIHRvIGJlIGRvaW5nIHNvIHF1aXRlIHNsb3dseS4KPiAKPiBOb3cgYWdhaW4gSSdtIG5vdCBz
dXJlICpleGFjdGx5KiB3aGF0IHlvdSB3YW50IG1lIHRvIGRvLCBidXQgSSdsbCBoYXZlIGFub3Ro
ZXIgZ3Vlc3MuCgpNYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgZm9yIHVzIHRvIHRyeSB0byBjb21l
IHRvIGEgc2hhcmVkCnVuZGVyc3RhbmRpbmcgYmVmb3JlIHlvdSBkbyBhbm90aGVyIHJlc3Bpbi4u
LgoKPiA+ICAtIEl0IGVuY291cmFnZXMgdmFjdW91cyBsb2cgbWVzc2FnZXMgd2hvc2UgY29udGVu
dCBpcyBtYWlubHkgaW4gdGhlCj4gPiAgICBmdW5jdGlvbiBhbmQgbGluZSBudW1iZXIgZnJhbWlu
ZzoKPiA+ICAgICAgICArICAgIExPR0UoRVJST1IsICJmYWlsZWQiKTsKPiA+ICAgICAgICArICAg
IHJldHVybiBFUlJPUl9GQUlMOwo+ID4gICAgICAgICt9Cj4gPiAgICByYXRoZXIgdGhhbgo+ID4g
ICAgICAgIGlmICghKmYpIHsKPiA+ICAgICAgICAgICAgTE9HRShFUlJPUiwgImZhaWxlZCB0byBv
cGVuIHJlY2VudCBkb21pZCBmaWxlIGAlcyciLCBwYXRoKTsKPiA+ICAgICAgICAgICAgcmMgPSBF
UlJPUl9GQUlMOwo+ID4gICAgICAgICAgICBnb3RvIG91dDsKPiA+ICAgICAgICB9Cj4gPiAgICAo
YW5kIHRoZSBsYXR0ZXIgaXMgdG8gYmUgcHJlZmVycmVkKS4KPiAKPiBCdXQgYnkgYXNraW5nIG1l
IHRvIHB1dCB0aGUgZXJyb3IgaGFuZGxpbmcgaW5zaWRlIHRoZSBzdWItZnVuY3Rpb25zIEkgbG9z
dCBjb250ZXh0IHN1Y2ggYXMgJ3BhdGgnIHdoaWNoIHdhcyBwcmVzZW50IGluIHRoZSBwcmV2aW91
cyBzdHJ1Y3R1cmUuIEkgY291bGQgcGFzcyBpbiBhbiBhcmd1bWVudCBwdXJlbHkgZm9yIHRoZSBi
ZW5lZml0IG9mIGEgbG9nIGZ1bmN0aW9uIGJ1dCB0aGF0IHNlZW1zIGV4Y2Vzc2l2ZS4gSSBndWVz
cyBJIHdpbGwgcHVsbCB0aGUgZXJyb3IgbG9nZ2luZyBvdXQgYWdhaW4sIGJ1dCB0aGF0IHNlZW1l
ZCB0byBiZSBhZ2FpbnN0IHlvdXIgcmVxdWlyZW1lbnQgdG8gZGUtZHVwbGljYXRlIGNvZGUuCgpJ
IHRoaW5rIHRoZSBwYXRoIG5lZWRzIHRvIGJlIHBhc3NlZCBpbnRvIHRoZXNlIGZ1bmN0aW9ucy4g
IFRoaXMgaXMgd2h5CkkgdGhpbmsgdGhlIGZ1bmN0aW9ucyBuZWVkIHRvIHRha2UgYSBzdHJ1Y3Qq
IGFzIGFuIGFyZ3VtZW50LCBmb3IgdGhlaXIKc2hhcmVkIHN0YXRlIChpbmNsdWRpbmcgdGhlIHBh
dGggYW5kIHRoZSBvdGhlciBzdHVmZikuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
