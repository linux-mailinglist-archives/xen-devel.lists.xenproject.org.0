Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3313E153
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:49:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is8IJ-0004WN-Dj; Thu, 16 Jan 2020 16:46:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rZVc=3F=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1is8II-0004WI-6C
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:46:54 +0000
X-Inumbo-ID: c9e0d3c5-387f-11ea-877b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9e0d3c5-387f-11ea-877b-12813bfff9fa;
 Thu, 16 Jan 2020 16:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579193210;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+JrQlc99nXD97eI5fvU+8BWNxQxGgL6TiVJoG8Yuc5c=;
 b=G/qANTIN1LMyq1ypa0tTVT0eiOLPEt1WQkCNHd+mUdzm94c9csklkR+0
 aU5EAKavh5uoJ7xHjrRlPJrQLyO2Rl+L/KMT1xft+BMphSPY/fWG5Av0f
 3oXzYpqCEVwMpx/QbSmin/CKHTgZTUZv+kLAnE6H7LWYdB3NCoxOjPF4I 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tHjAmsDIj4rzGIFloMr/2bFByriLWKBrPVXDbQ3BoFEoknweTlRL6172sBOuC0EPHjFJNzjSxK
 rPX5PIZLuE5FSAFzhUn6lufT7b0fw46Ti8yhUq87aPn8Gd6f6ocZyCWPVKQi/8FlVoenKIaB+b
 uNObOCujGbYHE0e4Aff1O2mvBISaLp81jr30cMA1GsQiyx9DtIu74O0lk86pvkID/adyOa3hco
 G2bdENaYb0VQ9nAKFvs988yv0pHGveLFLCqXZF7yoOgyOpLcvR/Y2IfnQi59TTjj1Ty30/BbJj
 FMM=
X-SBRS: 2.7
X-MesageID: 11039394
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,326,1574139600"; d="scan'208";a="11039394"
To: Nick Rosbrook <rosbrookn@gmail.com>
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
 <20191227163224.4113837-5-george.dunlap@citrix.com>
 <CAEBZRSeM=shiVm4V+kCO4gyhVcg1-TNJi=i1S5=RBFB0ZoLUwA@mail.gmail.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <b1fd2c4f-0817-e4c3-0823-23d07f55d87f@citrix.com>
Date: Thu, 16 Jan 2020 16:46:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAEBZRSeM=shiVm4V+kCO4gyhVcg1-TNJi=i1S5=RBFB0ZoLUwA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/9] go/xenlight: More informative error
 messages
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS80LzIwIDc6MDYgUE0sIE5pY2sgUm9zYnJvb2sgd3JvdGU6Cj4gT24gRnJpLCBEZWMgMjcs
IDIwMTkgYXQgMTE6MzMgQU0gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
PiB3cm90ZToKPj4KPj4gSWYgYW4gZXJyb3IgaXMgZW5jb3VudGVyZWQgZGVlcCBpbiBhIGNvbXBs
aWNhdGVkIGRhdGEgc3RydWN0dXJlLCBpdCdzCj4+IG9mdGVuIGRpZmZpY3VsdCB0byB0ZWxsIHdo
ZXJlIHRoZSBlcnJvciBhY3R1YWxseSBpcy4gIE1ha2UgdGhlIGVycm9yCj4+IG1lc3NhZ2UgZnJv
bSB0aGUgZ2VuZXJhdGVkIHRvQygpIGFuZCBmcm9tQygpIHN0cnVjdHVyZXMgbW9yZQo+PiBpbmZv
cm1hdGl2ZSBieSB0YWdnaW5nIHdoaWNoIGZpZWxkIGJlaW5nIGNvbnZlcnRlZCBlbmNvdW50ZXJl
ZCB0aGUKPj4gZXJyb3IuICBUaGlzIHdpbGwgaGF2ZSB0aGUgZWZmZWN0IG9mIGdpdmluZyBhICJz
dGFjayB0cmFjZSIgb2YgdGhlCj4+IGZhaWx1cmUgaW5zaWRlIGEgbmVzdGVkIGRhdGEgc3RydWN0
dXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+Cj4gCj4gTG9va3MgZ29vZCwganVzdCBvbmUgbml0LXBpY2t5IGNvbW1lbnQ6Cj4g
Cj4+IGRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQvZ2VuZ290eXBlcy5weSBiL3Rv
b2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5Cj4+IGluZGV4IGU0ZWQ0ZDUwZjUuLjQ4
ZTNkODZmNzAgMTAwNjQ0Cj4+IC0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVz
LnB5Cj4+ICsrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5Cj4+IEBAIC0z
MTQsNyArMzE0LDcgQEAgZGVmIHhlbmxpZ2h0X2dvbGFuZ19jb252ZXJ0X2Zyb21fQyh0eSA9IE5v
bmUsIG91dGVyX25hbWUgPSBOb25lLCBjdmFybmFtZSA9IE5vbmUKPj4gICAgICAgICAgIyBJZiB0
aGUgdHlwZSBpcyBub3QgY2FzdGFibGUsIHdlIG5lZWQgdG8gY2FsbCBpdHMgZnJvbUMKPj4gICAg
ICAgICAgIyBmdW5jdGlvbi4KPj4gICAgICAgICAgcyArPSAnaWYgZXJyIDo9IHgue30uZnJvbUMo
Jnt9Lnt9KTsnLmZvcm1hdChnb25hbWUsY3Zhcm5hbWUsY25hbWUpCj4+IC0gICAgICAgIHMgKz0g
J2VyciAhPSBuaWwge1xuIHJldHVybiBlcnIgXG59XG4nCj4+ICsgICAgICAgIHMgKz0gJ2VyciAh
PSBuaWwge3tcbnJldHVybiBmbXQuRXJyb3JmKCJDb252ZXJ0aW5nIGZpZWxkIHt9OiAldiIsIGVy
cikgXG59fVxuJy5mb3JtYXQoZ29uYW1lKQo+IAo+IEl0J3MgcHJlZmVycmVkIHN0eWxlIHRvIGtl
ZXAgZXJyb3IgbWVzc2FnZXMgbG93ZXJjYXNlLCB1bmxlc3MgYSBwcm9wZXIKPiBub3VuIG9yIGFj
cm9ueW0gaXMgdXNlZCAodGhlIGZpZWxkIG5hbWVzIHdvdWxkIGJlIGNvbnNpZGVyZWQgcHJvcGVy
Cj4gbm91bnMpLgoKQWNrLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
