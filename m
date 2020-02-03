Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912621509E1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 16:36:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydju-0003Lx-0I; Mon, 03 Feb 2020 15:34:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UUio=3X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iydjt-0003Lp-09
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:34:17 +0000
X-Inumbo-ID: a2815276-469a-11ea-8e6f-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2815276-469a-11ea-8e6f-12813bfff9fa;
 Mon, 03 Feb 2020 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580744055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=blGdylUb6gNYA1zim7m75o7mBX8DZMRW1sgPM2KjldQ=;
 b=HaprvVsJwkq5gpALhgT3tRcEkvK21QBR0kckNs80bnricQ0mG8OwT75t
 ioHfDCuI1EAXC7jlGXSFG+cb+HuM4S4uva2cfvN0AEMzyq9lVchLT5bKL
 P2sYOOzeQBJ5B/qJq13ndNA37icYJ9rzU+7C3YJI5qp+psOQ9YPp032xZ k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5KIbqJzYQazA99XwCH+6FArQml8qiSGariUVecq0JM3VF3n1QatCP/jbH0W5CuNIVQ+yeepoJf
 s5ZzcKrqEEMcD0gcFYejkVfZNJ2uWJBozmBEg3rH+SQF+K1a6c/bldbttHFDAMk5E0stGbm3M6
 CevbUy+fnukbx7MudO+ffb48CnGlmqBoXnoSUHVVI5vcHvDzpxziXIPaBF9KeXyxRdSNPDL/CL
 1C+LbryJv6xZJBM17AhZ0d2+pEVV4PNtrYn1AjeBbhJaHINN4p/9eTzaOn9HmJAiJ6cqC8eeFM
 myY=
X-SBRS: 2.7
X-MesageID: 12470525
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12470525"
Date: Mon, 3 Feb 2020 15:34:07 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: "Gao, Liming" <liming.gao@intel.com>
Message-ID: <20200203153407.GH2306@perard.uk.xensource.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-3-anthony.perard@citrix.com>
 <b7590b41-e7f6-f4df-959c-2ee188db1e66@redhat.com>
 <c283b839b42e4262bfde10474bf6a794@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c283b839b42e4262bfde10474bf6a794@intel.com>
Subject: Re: [Xen-devel] [PATCH 2/5] MdePkg: Allow PcdFSBClock to by Dynamic
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
Cc: "Feng, Bob C" <bob.c.feng@intel.com>, Julien Grall <julien@xen.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Justen, 
 Jordan L" <jordan.l.justen@intel.com>,
 "devel@edk2.groups.io" <devel@edk2.groups.io>, "Kinney,
 Michael D" <michael.d.kinney@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDE6MzQ6NTVBTSArMDAwMCwgR2FvLCBMaW1pbmcgd3Jv
dGU6Cj4gQW50aG9ueToKPiAgIFRoaXMgY2hhbmdlIGlzIE9LIHRvIG1lLiBCdXQgaWYgdGhpcyBQ
Q0QgaXMgY29uZmlndXJlZCBhcyBEeW5hbWljLCBpdHMgdmFsdWUgd2lsbCBiZSBnb3QgZnJvbSBQ
Q0Qgc2VydmljZS4gVGhpcyBvcGVyYXRpb24gd2lsbCB0YWtlIHNvbWUgdGltZSBhbmQgY2F1c2Ug
dGhlIGluYWNjdXJhdGUgdGltZSBkZWxheS4gSGF2ZSB5b3UgbWVhc3VyZWQgaXRzIGltcGFjdD8K
Ck5vLCBJIGhhdmVuJ3QuIEJ1dCBJIGRvbid0IHRoaW5rIGl0IG1hdHRlciBpbiBhIFhlbiBndWVz
dCwgdGhlIEFQSUMgdGltZXIgaXMKZW11bGF0ZWQgYW55d2F5LCBzbyByZWFkaW5nIGZyb20gYSBy
ZWdpc3RlciBvZiB0aGUgQVBJQyBpcyBnb2luZyB0byBiZQpzbG93ZXIgdGhhbiBnZXR0aW5nIHRo
ZSB2YWx1ZSBmcm9tIHRoZSBQQ0Qgc2VydmljZXMsIEkgdGhpbmsuCihIb3BlZnVsbHksIEknbSBu
b3QgdG9vIHdyb25nLikKCkJ1dCBJJ2xsIGdpdmUgaXQgYXQgbWVhc3VyaW5nIHRoZSBkaWZmZXJl
bmNlLCBpdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0bwprbm93LgoKVGhhbmtzLAoKLS0gCkFudGhv
bnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
