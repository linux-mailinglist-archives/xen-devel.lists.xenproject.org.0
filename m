Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0947710CBA5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 16:22:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaLaB-0003Ap-90; Thu, 28 Nov 2019 15:19:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6PRP=ZU=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iaLaA-0003Ak-0J
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 15:19:50 +0000
X-Inumbo-ID: 846512a0-11f2-11ea-9db0-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 846512a0-11f2-11ea-9db0-bc764e2007e4;
 Thu, 28 Nov 2019 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574954389;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=48zf5z6QE8R8CS0+RJmLZGDDvmiNtpQyB4a2myKqg0I=;
 b=a2wxU6r4MHezulRc3+4+qRklBEmdsJLL/gEKTkfieel+pMSzKQ1ZOGhA
 Yy05hZRZVhHYbGpjvEl/t3ffv/YgnWTvEDrcn4cVyGYu+MfKfzkYghK94
 1ttFTSsUP2jchiE/TBI6Ywkb1o9MheBvsMOy6/cW+4g9VasNID6rZxBiD 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LXVOTfYkZBGPEA/p9ciO6jxqIaGENoJtaZkclrcp0NE/TBaKxmiOWaINy8/a9jrI8QJCVSTRk5
 ytKP12N0a3gevmRlxUyL/SYV7wCc9r67siiAPjcBAfUo+GqO6PSNOsvhCbyrPVpSum8mdVIXb+
 NVTtel8Svk7kk2CxJdYr+rJzxO+kfn3X4CeHr71xFrLsBvpucbv02JhhSGzS7NqEdhw1YzPQ8+
 I8iPVmH/3Ls/wVaFk3FCDItvwNlIkf3hSUsbGirvysY95XtZfShZdZxY/oFIdD/DyNhNFyVzZH
 Hbg=
X-SBRS: 2.7
X-MesageID: 8951600
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="8951600"
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
References: <20191128145135.11974-1-ross.lagerwall@citrix.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <f24c83e4-73d9-e544-d7fb-da791adaee15@citrix.com>
Date: Thu, 28 Nov 2019 15:19:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191128145135.11974-1-ross.lagerwall@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH LP-BUILD_TOOLS] Fix building with updated
 ENFORCE_UNIQUE_SYMBOLS behaviour
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMTEvMjAxOSAxNDo1MSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gVGhlIHBhdGNoICJi
dWlsZDogcHJvdmlkZSBvcHRpb24gdG8gZGlzYW1iaWd1YXRlIHN5bWJvbCBuYW1lcyIgY2hhbmdl
cwo+IEVORk9SQ0VfVU5JUVVFX1NZTUJPTFMgc28gdGhhdCBnY2MgZ2VuZXJhdGVzIG91dHB1dCB0
byBhIHRlbXBvcmFyeSBmaWxlCj4gYW5kIHRoZW4gb2JqY29weSBpcyB1c2VkIHRvIGNyZWF0ZSB0
aGUgZmluYWwgb2JqZWN0IGZpbGUuIFRoaXMgYnJlYWtzCj4gbGl2ZXBhdGNoLWJ1aWxkJ3MgaW50
ZXJwb3NpdGlvbiBvZiBHQ0MgdG8gY2FwdHVyZSB0aGUgY2hhbmdlZCBvYmplY3QKPiBmaWxlcyBz
byBpbnRlcmNlcHQgY2FsbHMgdG8gb2JqY29weSBhcyB3ZWxsIHRvIGNhcHR1cmUgdGhlIGZpbmFs
IG9iamVjdAo+IGZpbGVzLgo+IAo+IFdoaWxlIGluIHRoZSBhcmVhLCBhZGQgYSBjb3VwbGUgb2Yg
ZXh0cmEgb2JqZWN0IGZpbGVzIHRvIGJlIGlnbm9yZWQgd2hlbgo+IHBhdGNoaW5nLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+
IC0tLQo+IAo+IFdpdGggdGhpcyBjaGFuZ2UsIEkndmUgYnVpbHQgYW5kIHN1Y2Nlc3NmdWxseSBh
cHBsaWVkIGEgdHJpdmlhbAo+IGxpdmVwYXRjaCB3aXRoIEphbidzIHBhdGNoIGFwcGxpZWQgYW5k
IEVORk9SQ0VfVU5JUVVFX1NZTUJPTFMgdHVybmVkIG9uLgoKQ2FuIGNvbmZpcm0gdGhlIHNhbWUg
d2l0aCBteSB0ZXN0IExQLiBTbwoKICAgIFRlc3RlZC1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5
LmR5YXNsaUBjaXRyaXguY29tPgoKY2FuIGdvIHRvIGJvdGggdGhpcyBhbmQgSmFuJ3MgcGF0Y2gg
SSBndWVzcy4KCi0tClRoYW5rcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
