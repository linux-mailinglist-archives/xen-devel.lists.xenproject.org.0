Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E3913AEF6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:15:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOno-0002Zv-Bj; Tue, 14 Jan 2020 16:12:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irOnm-0002Zq-JY
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:12:22 +0000
X-Inumbo-ID: a1c176f4-36e8-11ea-83ee-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1c176f4-36e8-11ea-83ee-12813bfff9fa;
 Tue, 14 Jan 2020 16:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579018338;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=UYoBWPwhK9gBeh/PnqGOBLp3eE96hdytezUUT8QQL6Y=;
 b=UALLXeOh/ob994qHF5PCV8uQyfW9GqY8Yf2wrFAMNtGK+k9d0dklJTcV
 gWk7nsId75NVSDa6ojzjVnCK7D7pIUGA00rSboQU+aRr/HVWcPX//b2/f
 1PJ+/jBiLPzR16yPcszx3Y3ZiZM7CbSwwbgdwqhlr6o9UTMirPOgxOOEb w=;
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
IronPort-SDR: 3xjfKBxr0S2XkDKU49XRStrChitxOXHemvg3Ycmiu6/HEPHgI4D+r+ifGlOjP8E6OUgThg1hUb
 X0LK7ez0RhmW2wNmv5XTKqEB6ZcOU8tF8sgfDyM1yurrZFWAmQ29zlcpdpuNbeKyV68Njz5VAS
 Aym0Bm18hhjp4MGMMNgoDv4RUjYh7dP2iOij5AtqtQSjqJpCbn6TI7FZAxVfOywF6Wn2sqm2nn
 E61slxSf2dU38xgTAkGG1TwJeEIwMWbqPY8alk5ltHR9XUub4dNNpYoRS0HzKdNLzMfutdbAQq
 c0Y=
X-SBRS: 2.7
X-MesageID: 11062257
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,433,1571716800"; d="scan'208";a="11062257"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.59486.138192.313998@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 16:12:14 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <94245c21-3e0b-4099-fe22-f2639651f1db@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-11-andrew.cooper3@citrix.com>
 <4503eb28-fb43-a3bf-29d0-6e9a3e419dfb@suse.com>
 <7229f757-5764-aa9b-013b-c7772cff7b9a@citrix.com>
 <ee3c5bf5-03f5-f1f8-ef20-7fb5e8b34fcf@suse.com>
 <94245c21-3e0b-4099-fe22-f2639651f1db@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 10/12] docs/migration: Specify X86_{CPUID,
 MSR}_POLICY records
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIIDEwLzEyXSBkb2NzL21pZ3JhdGlvbjog
U3BlY2lmeSBYODZfe0NQVUlELE1TUn1fUE9MSUNZIHJlY29yZHMiKToKPiBUaGUgbWlncmF0aW9u
IHN0cmVhbSBpcyBzcGxpdCBpbnRvIHJlY29yZHMgd2l0aCBubyBwbGF5bG9hZCAobWFya2Vycwo+
IHdpdGggZXh0ZXJuYWwgY29udHJvbCBmbG93IG1lYW5pbmcpLCBhbmQgZGF0YSByZWNvcmRzLCB3
aGljaCBoYXZlIGEgcGF5bG9hZC4KCkkgcmVtZW1iZXIgdGhpbmtpbmcgYXQgdGhlIHRpbWUgeW91
IHNwZWNpZmllZCB0aGlzIChzb21lIHRpbWUgYWdvLCBpbgptaWdyYXRpb24gdjIpIHRoYXQgdGhp
cyB3YXMgYW5vbWFsb3VzLgoKQXQgdGhlIHRpbWUgaXQgbWFkZSBubyBkaWZmZXJlbmNlIGluIHBy
YWN0aWNlLCBiZWNhdXNlIGFsbCBleGlzdGluZwpwYXlsb2FkIHR5cGVzIHJlcXVpcmVkIG5vbmVt
cHR5IHBheWxvYWRzIGFueXdheSwgc28gSSBkaWRuJ3QgYXJndWUuCgo+IEl0IGlzIGFuIGVycm9y
IGZvciBhIGRhdGEgcmVjb3JkIHRvIGhhdmUgbm8gcGF5bG9hZCwgYmVjYXVzZSBpdCBtZWFucwo+
IHRoZXJlIGlzIGEgc291cmNlIHNpZGUgZ2VuZXJhdGlvbiBidWcuwqAgSW4gdGhlIGNhc2Ugb2Yg
WGVuIHJldHVybmluZyAwCj4gTVNScywgdGhlIHJlY29yZCB3b3VsZCBiZSBvbWl0dGVkIGVudGly
ZWx5LCByYXRoZXIgdGhhbiBiZSBzZW50IHdpdGggMAo+IE1TUnMgd29ydGggb2YgZGF0YS4KCkkg
dGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHNheSBpbnN0ZWFkIHRoYXQgZGF0YSByZWNvcmRz
IG1heSBoYXZlIGEKMC1sZW5ndGggcGF5bG9hZC4gIFRoaXMgYWxsb3dzIGEgcmVjb3JkIHdpdGgg
YSAwLWxlbmd0aCBwYXlsb2FkIHRvCmhhdmUgYSBkaWZmZXJlbnQgc2VtYW50aWMgbWVhbmluZyAo
ImhlcmUgaXMgdGhpcyBpbmZvcm1hdGlvbiBhbmQgdGhlCmluZm9ybWF0aW9uIGlzIHRoZSBlbXB0
eSBzZXQiKSBmcm9tIGFuIG9taXR0ZWQgcmVjb3JkICgidGhpcwppbmZvcm1hdGlvbiBpcyBub3Qg
YXZhaWxhYmxlL3Byb3ZpZGVkIikuCgpXaGV0aGVyIGEgcmVjb3JkIGlzIGEgbWFya2VyIG91Z2h0
IHRvIGJlIGluZmVycmVkIGZyb20gaXRzIHR5cGUuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
