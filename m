Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90609C4236
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 23:01:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFPFL-0003oa-IY; Tue, 01 Oct 2019 20:59:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFPFJ-0003oT-4L
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 20:59:45 +0000
X-Inumbo-ID: 64dee604-e48e-11e9-97fb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 64dee604-e48e-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569963584;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LYxrEtVZh7E0oBT16cYThPwkkmE70PAfCr8YgNZkbbw=;
 b=THn21zmola+OqhL7T6P0PdeUX7LuV3+DQkj770xDt9Efs2lawpmcnzUZ
 rHUrgsPi00dvsVaicSt+rgzGq1a99x9Jxp3T3NSNcmWcyy5a6I/Vi5KKW
 mC01e/8/DJ3wybsXkxt5QxLEvzKvRNJaAy51h6hMGohGCuKXFb5zFSPxe 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R5vHZgB6pgBNZgOAf1rOUPO8UrZgYInsAmytplTDsl4EhdjUynaFZ78K8oAPngvMWhG5N27bND
 0DzvCKUgXWR5w6TgEnIUD9fEpXUT6zbuC2ALtqe39Ic2LTVqr6TJ6cKATmF9WO9dVDdRl6GbEW
 tQ7daiOVImQY+3gwZrvsCwVM3FBArAXlCQY1+2mpuEO80tEWiO5+hbBN2pmyFS/TdXDGdUy6XY
 ZftKtqsf3XK01ZB45t9OWuhcgZ+EbYkZuMjt7C9j6KvJ4LNwlGdpQcAcOsAfuxS3+VbTlUWr7q
 UL8=
X-SBRS: 2.7
X-MesageID: 6335155
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,572,1559534400"; 
   d="scan'208";a="6335155"
To: Jan Beulich <jbeulich@suse.com>
References: <20190930191610.27545-1-andrew.cooper3@citrix.com>
 <f8eb4fdc-bec8-a6cd-2657-f163169eeee5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <41d5ccea-b58c-ed3b-5cc8-8966d2850125@citrix.com>
Date: Tue, 1 Oct 2019 21:59:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f8eb4fdc-bec8-a6cd-2657-f163169eeee5@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/typesafe: Force helpers to be
 always_inline
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTAvMjAxOSAwOTozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMDkuMjAxOSAy
MToxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQ2xhbmcgaW4gcGFydGljdWxhciBoYXMgYSBo
YWJpdCBvZiBvdXQtb2YtbGluaW5nIHRoZXNlIGFuZCBjcmVhdGluZyBtdWx0aXBsZQo+PiBsb2Nh
bCBjb3BpZXMgb2YgX21mbigpIGFuZCBtZm5feCgpLCBldGMuICBPdmVycmlkZSB0aGlzIGJlaGF2
aW91ci4KPiBJcyBzcGVjaWFsIGNhc2luZyB0aGUgdHlwZXNhZmUgaGVscGVycyB0aGVuIHRoZSBy
aWdodCBhcHByb2FjaD8gVGhlCj4gZnVuZGFtZW50YWwgaWRlYSBhZnRlciBhbGwgaXMgdG8gbGV0
IHRoZSBjb21waWxlciBkZWNpZGUuIEkgY2VydGFpbmx5Cj4gYWdyZWUgdGhhdCBub3QgaW5saW5p
bmcgc3VjaCB0cml2aWFsIGZ1bmN0aW9ucyBkZXNwaXRlIHRoZSBpbmxpbmUKPiBrZXl3b3JkIGxv
b2tzIGZhciBmcm9tIG9wdGltYWwsIGJ1dCBpZiB0aGVyZSdzIHN1Y2ggYSBnZW5lcmFsIGlzc3Vl
Cj4gd2l0aCBjbGFuZywgc2hvdWxkbid0IHdlIG1ha2UgImlubGluZSIgZXhwYW5kIHRvICJhbHdh
eXNfaW5saW5lIgo+IHVuaWZvcm1seT8KCklubGluZSBoYW5kaW5nIGlzIGEgbWVzcy4KCldlIGN1
cnJlbnRseSBkZWZpbmUgaW5saW5lIHRvIF9faW5saW5lX18uwqAgVW5kb2luZyB0aGlzIHJlc3Vs
dHMgaW4gYnVpbGQKZmFpbHVyZXMuCgpMaW51eCBjdXJyZW50bHkgZGVmaW5lcyBpbmxpbmUgdG8g
YWx3YXlzX2lubGluZSBhbmQgdGhleSBhcmUgZGVzcGVyYXRlbHkKdHJ5aW5nIHRvIHVuZG8gdGhp
cyAobWlzKWJlaGF2aW91ci4KClRoZXJlIGFyZSBhIGZldyB1c2VzIG9mIGFsd2F5c19pbmxpbmUg
Zm9yIHNhZmV0eSBwdXJwb3NlcyAodGhlCnNwZWN1bGF0aXZlIGhlbHBlcnMpLsKgIE1vc3QgdXNl
cyBvZiBhbHdheXNfaW5saW5lIGxvb2sgdG8gYmUgd29ya2Fyb3VuZHMKZm9yIHRoZSBzaXplLW9m
LWFzbSBidWcvKG1pcylmZWF0dXJlLgoKSW4gYW4gaWRlYWwgd29ybGQsIHdlIHdvdWxkbid0IG5l
ZWQgaXQgYXQgYWxsLCBidXQgSSBkZWZpbml0ZWx5IGRvbid0CnRoaW5rIHRoYXQgdGFraW5nIHRo
ZSBMaW51eCBhcHByb2FjaCBpcyBhIGNsZXZlciBtb3ZlLsKgIFdlIGRlZmluaXRlbHkKaGF2ZSBz
b21lIHN0YXRpYyBpbmxpbmVzIHdoaWNoIHdvdWxkIGJldHRlciBub3QgYmVpbmcgaW5saW5lLgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
