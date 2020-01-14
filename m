Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B92713B025
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:59:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPU5-0006ht-B7; Tue, 14 Jan 2020 16:56:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irPU3-0006ho-UR
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:56:03 +0000
X-Inumbo-ID: bc04056a-36ee-11ea-8407-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc04056a-36ee-11ea-8407-12813bfff9fa;
 Tue, 14 Jan 2020 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579020957;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=1S+HnY1d+KxgbWv0q/DOm0qUKKSkNRIF1+WRYTsNii8=;
 b=Or1PHXIvd6VNEP2c0qmLtOGyLP80MJK1cvDxa5fJBfW8a1ZraGNBVKJj
 NLvo0i8fjackPEMjkn6DlskkzHqFeZJBjCeknUuFNpnnmMcGaVgKtUwP5
 zakD2CFbWoaKnHkm3YsO3hxvPbKPbzNGaSlLJIjGYSz7QD5KEdpmxH2UQ A=;
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
IronPort-SDR: KVvVVwttN0anheSBnXLsDsSwWuXmULUxmDYd3DXGchpKGP0rme3CYUEbO5IIyPFt8o4QVAScd5
 lWkG1WkId9Oo8laK3yrABhn0AOxx1H2Cw6XLUCCnuEF53Xm1xH+sWxbiu6ukkOzundI+TvIsR1
 5xHVB+/mFg82zeDhrYN886/h+m38RZp6Fh4yuKczxYBZHeCzCKZlmn7KqoZibpmsdWeDlRT7Qg
 2VuDl/LW51s3JjdTE0rydRir7ciNLUMeFktfmg73LaO7/Y3+sNUoF9ZnBxLXbkwHc5GUiq6Jk8
 pic=
X-SBRS: 2.7
X-MesageID: 11331006
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="11331006"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.62106.192068.936687@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 16:55:54 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
In-Reply-To: <24093.61657.676890.721999@mariner.uk.xensource.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-2-andrew.cooper3@citrix.com>
 <24093.61657.676890.721999@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 01/12] libxc/save: Shrink code volume where
 possible
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCAwMS8xMl0gbGlieGMvc2F2ZTogU2hyaW5r
IGNvZGUgdm9sdW1lIHdoZXJlIHBvc3NpYmxlIik6Cj4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVy
IHRvIGhhdmUKPiAgICAgI2RlZmluZSBNVVNUKGNhbGwpICh7IHJjID0gKGNhbGwpOyBpZiAocmMp
IGdvdG8gZXJyb3I7IH0pCj4gYW5kIHdyaXRlCj4gICAgIE1VU1QoIHdyaXRlX29uZV92Y3B1X2Jh
c2ljKGN0eCwgaSkgKTsKClRoaXMgaXMgbm90IHVuY29tbW9uLiAgQklORDkgZG9lcyBzb21ldGhp
bmcgbGlrZSBpdDoKICAgIGh0dHBzOi8vZ2l0LnVpcy5jYW0uYWMudWsveC91aXMvaXByZWcvYmlu
ZDkuZ2l0L2Jsb2IvSEVBRDovbGliL2Rucy96b25lLmMjbDUxNQoKQSBmcmllbmQgcG9pbnRzIG91
dCB0aGF0CiAgI2RlZmluZSBNVVNUKHgpICh7IGludCByY18gPSAoeCk7IGlmIChyY18pIHsgcmMg
PSByY187IGdvdG8gZXJyb3I7IH0gfSkKaXMgYmV0dGVyIGJlY2F1c2UgaXQga2VlcHMgcmMgdW5p
bml0aWFsaXNlZCB1bnRpbCB0aGUgbGFzdCBtb21lbnQuClRoYXQgbWVhbnMgdGhlIGNvbXBpbGVy
IGNhbiBzcG90IGV4aXQgcGF0aHMgd2hlcmUgeW91IGZhaWwgdG8gc2V0IHJjLgoKSWFuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
