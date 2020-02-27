Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC31713BE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 10:09:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7F6z-0004Py-5U; Thu, 27 Feb 2020 09:05:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7F6y-0004Pt-3s
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 09:05:40 +0000
X-Inumbo-ID: 52a6e8b6-5940-11ea-9605-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52a6e8b6-5940-11ea-9605-12813bfff9fa;
 Thu, 27 Feb 2020 09:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582794339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gWJfFrxw6QWEp9rgUq/ePfMIe7ipLchWSF8/p0EoTDw=;
 b=GXfs3To4Ins8jPBpo3mu6NIW1UFnwYem7CxkuwEnyjms3yd5Kd1uhYQa
 og5ZTYGEY+3OOf/bRYQDS5iObdb/+ZwDRcNqMFPgQL2OXpjgNEyE/vzLn
 yk5v0t08phOwBZSCkapFEtJv8y5jL6xcWjau6/dFbFCTGU799dD/JJn4N Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6BNzNQcWyd5nf2IML/OxaYFwxZpUPt6To55YCLjk+lXR2Opg3ZNjUZRpltVj3bZx2DrD0jMYTm
 Shn/HPKVBlf/S2H8War8JchLhFRMVoB/t2GjfeRzT8apA4CG0NMmj8bdxwM3fNLkt9b+m4B8KD
 02kKC9bj8SPCFVzY+yptQiBnTIsf85sa5FdXvrcbr9YIsLr7qwlTTDFAAvphhWuzO3XXWN96tM
 0ycpueU1RT61IEKu+nlh5/67N+kil0VkiIfml6tbT+oHjNxuDNCImllQbX4CcpsaSfutTE5qsE
 wVE=
X-SBRS: 2.7
X-MesageID: 13716693
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,491,1574139600"; d="scan'208";a="13716693"
Date: Thu, 27 Feb 2020 10:05:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200227090526.GK24458@Air-de-Roger.citrite.net>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-6-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226113355.2532224-6-anthony.perard@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [XEN PATCH v3 05/23] xen/build: Allow to test clang
 .include without asm symlink
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTE6MzM6MzdBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhlIGNsYW5nIHRlc3QgZm9yICJhc20oKS1zIHN1cHBvcnQgLmluY2x1ZGUuIiBu
ZWVkcyB0byBiZSBtb2RpZmllZAo+IGJlY2F1c2UgdGhlIHN5bWJvbGljIGxpbmsgYXNtIC0+IGFz
bS14ODYgbWF5IG5vdCBleGlzdCB3aGVuIHRoZSB0ZXN0Cj4gaXMgcnVubmVkLiBTaW5jZSBpdCdz
IGFuIHg4NiB0ZXN0LCB3ZSBkb24ndCBuZWVkIHRoZSBsaW5rLgo+IAo+IFRoaXMgd2lsbCBiZSBh
biBpc3N1ZSB3aXRoIHRoZSBmb2xsb3dpbmcgcGF0Y2ggInhlbi9idWlsZDogaGF2ZSB0aGUKPiBy
b290IE1ha2VmaWxlIGdlbmVyYXRlcyB0aGUgQ0ZMQUdTIi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClNvIHRoaXMgaXMganVzdCBh
IHByZXBhcmF0b3J5IGNoYW5nZSBpbiBvcmRlciB0byBiZSBhYmxlIHRvIHJ1biB0aGUKY2hlY2tz
IGJlZm9yZSB0aGUgaGVhZGVycyBhcmUgbGlua2VkLCBidXQgdGhlIGN1cnJlbnQgdXNhZ2UgaXMK
cGVyZmVjdGx5IGZpbmUgQUZBSUNUPyAobWlnaHQgYmUgd29ydGggdG8gdHJ5IHRvIGNsYXJpZnkg
dGhlIGNvbW1pdAptZXNzYWdlIGEgYml0IGluIHRoaXMgcmVnYXJkKS4KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
