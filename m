Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBB29185C
	for <lists+xen-devel@lfdr.de>; Sun, 18 Aug 2019 19:30:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzOxp-0007j8-Su; Sun, 18 Aug 2019 17:27:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ssR5=WO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hzOxo-0007j3-7o
 for xen-devel@lists.xenproject.org; Sun, 18 Aug 2019 17:27:32 +0000
X-Inumbo-ID: 747564a4-c1dd-11e9-8be3-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 747564a4-c1dd-11e9-8be3-12813bfff9fa;
 Sun, 18 Aug 2019 17:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566149251;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7zYkWJdBoCpI7iJtkw6eSoyhk474fAzLOHf5Nd0Dvu8=;
 b=CA7mtMW7CplUvZ05d3jXWMCN4xVvfsb1WpsvlxDiOEZvnf6H3Xf/SPMP
 99yICy4PqUm60/oAJcAiCca6ff5AD3OHhoOu73ffAFbJP33pdj2UDr3Zk
 WaagUaXl/NC51cZUFkPNIEQdnowtI0sTVEz/2NdbnyAj0KEj6RwTjJJ1E M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=PermError smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: PermError (esa3.hc3370-68.iphmx.com: cannot
 correctly interpret sender authenticity information from
 domain of Andrew.Cooper3@citrix.com) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /3bfEUzpCwsdAwlguDbMFNfTXrkQIRo5BvVkhLp66ensBnrO4KDRhscrF5bBc2pswn+rmwah5n
 iY7nYMGz2yjpd4mya+QNZZZjNCC6rc1eQGZfQduzGqct27QW8/LHxZwLzje+byidIsioNZdFgR
 sFV95qTFPxV7+NYVBWm7b9crH8UTJSyARHgYbEaMw/08xg/CXmWw4h6fsN3fFiI+m3MoUUghzr
 ctkbXaWjlmdDE5IpSnRTyb+mAjinp/XGdi0OS6MVi6l/+jPgwQ8vqnWl9k68nnox9mbEabGqw5
 EoM=
X-SBRS: 2.7
X-MesageID: 4414904
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,401,1559534400"; 
   d="scan'208";a="4414904"
To: Wei Liu <wl@xen.org>, Olaf Hering <olaf@aepfle.de>
References: <20190621093005.29329-1-olaf@aepfle.de>
 <20190818172026.25jeivjl7gpydynh@debian>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0343263e-ae0e-d178-f940-838021d7cae3@citrix.com>
Date: Sun, 18 Aug 2019 18:27:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190818172026.25jeivjl7gpydynh@debian>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v1] docs: substitute XEN_CONFIG_DIR in
 xl.conf.5
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDgvMjAxOSAxODoyMCwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEp1biAyMSwgMjAx
OSBhdCAxMTozMDowNUFNICswMjAwLCBPbGFmIEhlcmluZyB3cm90ZToKPj4geGwoMSkgb3BlbnMg
eGwuY29uZiBpbiBYRU5fQ09ORklHX0RJUi4KPj4gU3Vic3RpdHV0ZSB0aGlzIHZhcmlhYmxlIGFs
c28gaW4gdGhlIG1hbiBwYWdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xh
ZkBhZXBmbGUuZGU+Cj4+IC0tLQo+PiAgZG9jcy9tYW4veGwuMS5wb2QuaW4gICAgICB8IDIgKy0K
Pj4gIGRvY3MvbWFuL3hsLmNvbmYuNS5wb2QuaW4gfCAyICstCj4+ICAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RvY3Mv
bWFuL3hsLjEucG9kLmluIGIvZG9jcy9tYW4veGwuMS5wb2QuaW4KPj4gaW5kZXggM2Q2NGVhYTVi
Mi4uZmIxNzE1MzYzNSAxMDA2NDQKPj4gLS0tIGEvZG9jcy9tYW4veGwuMS5wb2QuaW4KPj4gKysr
IGIvZG9jcy9tYW4veGwuMS5wb2QuaW4KPj4gQEAgLTUwLDcgKzUwLDcgQEAgc2V0dXAgdGhlIGJy
aWRnZS4KPj4gIAo+PiAgSWYgeW91IHNwZWNpZnkgdGhlIGFtb3VudCBvZiBtZW1vcnkgZG9tMCBo
YXMsIHBhc3NpbmcgQjxkb20wX21lbT4gdG8KPj4gIFhlbiwgaXQgaXMgaGlnaGx5IHJlY29tbWVu
ZGVkIHRvIGRpc2FibGUgQjxhdXRvYmFsbG9vbj4uIEVkaXQKPj4gLUI8L2V0Yy94ZW4veGwuY29u
Zj4gYW5kIHNldCBpdCB0byAwLgo+PiArQjxAWEVOX0NPTkZJR19ESVJAL3hsLmNvbmY+IGFuZCBz
ZXQgaXQgdG8gMC4KPj4gIAo+PiAgPWl0ZW0gcnVuIHhsIGFzIEI8cm9vdD4KPj4gIAo+PiBkaWZm
IC0tZ2l0IGEvZG9jcy9tYW4veGwuY29uZi41LnBvZC5pbiBiL2RvY3MvbWFuL3hsLmNvbmYuNS5w
b2QuaW4KPj4gaW5kZXggMmJlYjIxMTlhOC4uYjE2MDM2YWFlYiAxMDA2NDQKPj4gLS0tIGEvZG9j
cy9tYW4veGwuY29uZi41LnBvZC5pbgo+PiArKysgYi9kb2NzL21hbi94bC5jb25mLjUucG9kLmlu
Cj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lgo+Cj4gVGhpcyBkb2Vzbid0IGFwcGx5LiBUaGVy
ZSBpcyBubyBzdWNoIGZpbGUuCgpIbW0uwqAgV2UgaGF2ZSBhIHhsLmNvbmYuNS5wb2Qgd2hpY2gg
aGFzIG5vIHN1YnN0aXR1dGlvbnMgaW4sIGFuZCBJIGRvbid0CnJlY2FsbCB0aGlzIGNoYW5naW5n
LsKgIFBlcmhhcHMgYSBsb2dpY2FsIGRlcGVuZGVuY3kgZWFybGllciBpbiB0aGUgU1VTRQpwYXRj
aCBxdWV1ZT8KCkkgdGhpbmsgdGhpcyBwYXRjaCBuZWVkcyBhIHtwb2Q9PnBvZC5pbn0gcmVuYW1l
IGFzIHdlbGwsIGZvciBpdCB0byBhcHBseQp0byBzdGFnaW5nIGFuZCB3b3JrIGFzIGludGVuZGVk
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
