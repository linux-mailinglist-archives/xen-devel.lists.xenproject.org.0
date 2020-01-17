Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38252140CA1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:36:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isShN-0002FE-GB; Fri, 17 Jan 2020 14:34:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V5CB=3G=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1isShL-0002EQ-H7
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:34:07 +0000
X-Inumbo-ID: 6906eb8a-3936-11ea-b544-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6906eb8a-3936-11ea-b544-12813bfff9fa;
 Fri, 17 Jan 2020 14:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579271644;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dt9iFhlKSiCzfhvhD3CI4zBvQfhK0kOYDSHCBLrtMaM=;
 b=dKdapbT0YkQGjnUTCdFJazt2NI7WpeEo8ov2Uklmif5yyXn5VMRQ9D/W
 cCZfxBRnd3bTnkkyM0gqtVCkJQucJlTwnnZiabg/H/hmRt+D5ozPGiPrg
 ygbUZd3XrgxlIDyI2N7BKTwhiBCdcK1SWy6Z7CnwRWV5RdaLTvTZEcbIi A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vkFrbkdHKA+l6buwKhtDzz6hCy67QOEZkMshQyc6/hdUZUTRzguUnNYqN/nJ+1pubbfilmun9I
 es8Zb9QOsyaA8zZK4loE/Q7nTkBTcR5bmTCp/Zu1T4uB69eduZysnqGGmgSAxGrTDf42W2yEqB
 tirz9lE9dKZW9iIeTdNOPyafXZz2/GVn1BAuCb8+zAMD335rUMvIBiBGfj27BXsqQ0yP1TpEaD
 dqeMvekLupehC5Iunas1tDpohzYvM4r8f73OVrQ0XoC34kW1GqX3Vc6gkEt+O/J0sxFWbFXKN7
 4NE=
X-SBRS: 2.7
X-MesageID: 11068181
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11068181"
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
 <20200113170843.21332-11-ian.jackson@eu.citrix.com>
 <1d3336b4-939f-d2a5-2f0e-91c651d788ff@citrix.com>
 <24097.50107.530788.219066@mariner.uk.xensource.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <ff6cf59a-b673-87fb-5939-da9098f44230@citrix.com>
Date: Fri, 17 Jan 2020 14:34:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <24097.50107.530788.219066@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 10/10] libxl: event: Move poller pipe
 emptying to the end of afterpoll
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xNy8yMCAyOjI0IFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiBHZW9yZ2UgRHVubGFwIHdy
aXRlcyAoIlJlOiBbUEFUQ0ggdjIgMTAvMTBdIGxpYnhsOiBldmVudDogTW92ZSBwb2xsZXIgcGlw
ZSBlbXB0eWluZyB0byB0aGUgZW5kIG9mIGFmdGVycG9sbCIpOgo+PiBPbiAxLzEzLzIwIDU6MDgg
UE0sIElhbiBKYWNrc29uIHdyb3RlOgo+Pj4gSWYgYSB0aW1lciBldmVudCBjYWxsYmFjayBjYXVz
ZXMgdGhpcyBwb2xsZXIgdG8gYmUgd29rZW4gKG5vdCB2ZXJ5Cj4+PiB1bmxpa2VseSkgd2Ugd291
bGQgZ28gcm91bmQgdGhlIHBvbGwgbG9vcCB0d2ljZSByYXRoZXIgdGhhbiBvbmNlLgo+Pj4KPj4+
IERvIHRoZSBwb2xsZXIgcGlwZSBlbXB0eWluZyBhdCB0aGUgZW5kOyB0aGlzIGlzIHNsaWdodGx5
IG1vcmUKPj4+IGVmZmljaWVudCBiZWNhdXNlIGl0IGNhbid0IGNhdXNlIGFueSBjYWxsYmFja3Ms
IHNvIGl0IGhhcHBlbnMgYWZ0ZXIKPj4+IGFsbCB0aGUgY2FsbGJhY2tzIGhhdmUgYmVlbiBydW4u
Cj4+Pgo+Pj4gKFRoaXMgcGlwZS1lbXB0eWluZyBoYXMgdG8gaGFwcGVuIGluIGFmdGVycG9sbCBy
YXRoZXIgdGhhbiB0aGUKPj4+IGFwcGFyZW50bHkgbW9yZSBsb2dpY2FsIGJlZm9yZXBvbGwsIGJl
Y2F1c2UgdGhlIGFwcGxpY2F0aW9uIGNhbGxpbmcKPj4+IGJlZm9yZXBvbGwgZG9lc24ndCBjb25z
dGl0dXRlIGEgcHJvbWlzZSB0byBhY3R1YWxseSBkbyBhbnl0aGluZy4pCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4+Cj4+IEkg
Y2FuJ3QgcXVpdGUgZmlndXJlIG91dDogd2h5IHdvdWxkIHlvdSBlbmQgdXAgZ29pbmcgYXJvdW5k
IHRoZSBsb29wCj4+IHR3aWNlLCBhbmQgaG93IGRvZXMgdGhpcyBmaXggaXQ/Cj4gCj4gSSBub3cg
dGhpbmsgdGhpcyBpcyBub3QgdHJ1ZSBhbmQgdGhlIHNpdHVhdGlvbiBJIGRlc2NyaWJlIGNhbm5v
dAo+IGhhcHBlbi4KPiAKPiBXaGF0IEkgd2FzIHRoaW5raW5nIHdhcyB0aGF0IHBvbGxlcnNfbm90
ZV9vc2V2ZW50X2FkZGVkIG1pZ2h0IGJlCj4gY2FsbGVkIGJ5IHNvbWV0aGluZyBmcm9tIHRpbWVf
b2NjdXJzLCBhbmQgdGhhdCB3b3VsZCB3cml0ZSBhIGJ5dGUgaW50bwo+IHRoZSBwb2xsZXIgcGlw
ZS4gIEJ1dCBwb2xsZXJzX25vdGVfb3NldmVudF9hZGRlZCBkb2Vzbid0IHdha2UgdXAKPiBwb2xs
ZXJzOyBpdCBqdXN0IHRhZ3MgdGhlbSBvc2V2ZW50c19hZGRlZC4KPiAKPiBJIG5vdyB0aGluayB0
aGUgc3B1cmlvdXMgd2FrZXVwIGNhbm5vdCBoYXBwZW4gYmVjYXVzZToKPiAKPiBGb3IgdGhpcyBw
YXRjaCB0byBtYWtlIGFueSBkaWZmZXJlbmNlLCB0aGUgcG9sbGVyIHBpcGUgd291bGQgaGF2ZSB0
bwo+IGJlIHdva2VuIHVwIGJ5IHNvbWV0aGluZyBpbiB0aGUgdGltZSBzY2FuIGxvb3AgaW4gYWZ0
ZXJwb2xsX2ludGVybmFsLgo+IAo+IEJ1dCBwb2xsZXIgcGlwZXMgYXJlIG9ubHkgd29rZW4gdXAg
YnkgYW8gY29tcGxldGlvbiBvciBieQo+IGNsZWFudXBfMV9iYXRvbi4KPiAKPiBjbGVhbnVwXzFf
YmF0b24gaXMgbm90IGNhbGxlZCBhbnl3aGVyZSB0aGVyZSAoYXMgYW4gYXJndW1lbnQgYWdhaW5z
dDoKPiBhbnkgc3VjaCBjYWxsIHdvdWxkIHZpb2xhdGUgdGhlIHJ1bGUgdGhhdCBjbGVhbnVwXzFf
YmF0b24gbWF5IG5vdCBiZQo+IGNhbGxlZCB3aXRoIGEgcG9sbGVyIGluIGhhbmQpLgo+IAo+IEFu
ZCBhcyBmb3IgYW8gY29tcGxldGlvbiwgd2Ugd291bGQgaW5kZWVkIHdha2UgdXAgdGhlIHBvbGxl
ci4gIEJ1dCB3ZQo+IGFsc28gbWFyayB0aGUgYW8gYXMgY29tcGxldGUsIHNvIGFvX2lucHJvZ3Jl
c3Mgd291bGQgc3BvdAo+ICFhb193b3JrX291dHN0YW5kaW5nLCBhbmQgbm90IHJlZW50ZXIgZXZl
bnRsb29wX2l0ZXJhdGlvbiBhdCBhbGwuCj4gVGhlIHdva2VuLXVwIHBvbGxlciB3b3VsZCBiZSBw
dXQgYnkgYW9faW5wcm9ncmVzcy4KPiAKPiBUaGlzIGxlYWRzIG1lIHRvIHRoaXMgb2JzZXJ2YXRp
b246IHBvbGxlcl9nZXQgbWlnaHQgZ2l2ZSB5b3UgYQo+IHdva2VuLXVwIHBvbGxlci4gIFRoaXMg
aXMgbm90IGluY29ycmVjdCwgYnV0IGl0IGlzIHBvaW50bGVzcy4gIFNvCj4gbWF5YmUgSSBzaG91
bGQgd3JpdGUgYSBwYXRjaCB0aGF0IHB1dHMgYSBjYWxsIHRvCj4gbGlieGxfX3NlbGZfcGlwZV9l
YXRhbGwgaW4gbGlieGxfX3BvbGxlcl9nZXQuCj4gCj4gVEJIIEkgc3RpbGwgdGhpbmsgdGhpcyBw
YXRjaCB0aWRpZXMgdGhlIGNvZGUgdXAgYSBiaXQuCgpObyBvYmplY3Rpb24gdG8gaXQgb24gdGhv
c2UgZ3JvdW5kcy4gOi0pCgpUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiwKIC1HZW9yZ2UKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
