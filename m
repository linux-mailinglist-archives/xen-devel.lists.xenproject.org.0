Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D00B657E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 16:08:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAaa1-00061B-Ll; Wed, 18 Sep 2019 14:05:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtMR=XN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAaa0-000613-LM
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 14:05:12 +0000
X-Inumbo-ID: 54452df6-da1d-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54452df6-da1d-11e9-978d-bc764e2007e4;
 Wed, 18 Sep 2019 14:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568815512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PlXUg9CwNN1uNKacUFObDtvy8SO3/xJAnmoF2bF6Jng=;
 b=JXLvTrJpYlxJxhov0mjZHKd88PZKZ8XrqLXkRRobEtVXUPKRz6CccK5o
 RiNYXlGeY0WX6TVZCoEJJ3EoVZu0q63wmnQmaqSMNQaWEWuX8F2f1h6Kf
 I/L8umUunXMOH0R63tNkSN+HTY8bpBvY1RpukmB5x/zRe6cqBA2K20jps c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hTh7YR8Cc+ejx0cYHd5ObanPm8a9kwWakEYi2yBN7rCoB1du5DoPGeUzPeqJf5EnECtMS4BcqQ
 OUqBb2WOMoZkUTqQZO+kqu6uB1vlI23s5dAJ+2FMDpFswyYZ4J5q86WV2P/gxa9cusUFU8fztL
 lZDzRpy8QLLIZJMDjonUWZjaf6G3LXQVioUMdf6ZwzXxk+xDdg5Y2FfvzlgGRQdQKdGeQCPjH2
 WupRDHwJFhFxn5qVVwsXqTrG8bWEhir3CxbD9jK8RtyezNWsA+uYD/tRvUzKuymVrzcVBPVWYg
 r7E=
X-SBRS: 2.7
X-MesageID: 5727716
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5727716"
Date: Wed, 18 Sep 2019 15:05:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190918140508.GL1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-2-anthony.perard@citrix.com>
 <23937.3773.593680.268445@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23937.3773.593680.268445@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 01/35] libxl: Make libxl_domain_unpause async
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDU6NTA6MDVQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDAxLzM1XSBsaWJ4bDogTWFrZSBs
aWJ4bF9kb21haW5fdW5wYXVzZSBhc3luYyIpOgo+ID4gbGlieGxfZG9tYWluX3VucGF1c2UgbmVl
ZHMgdG8gbWFrZSBRTVAgY2FsbHMsIHdoaWNoIGFyZSBhc3luY2hyb25vdXMsCj4gPiBjaGFuZ2Ug
dGhlIEFQSSB0byByZWZsZWN0IHRoYXQuCj4gPiAKPiA+IERvIHRoZSBzYW1lIHdpdGggbGlieGxf
ZG9tYWluX3BhdXNlIGFzeW5jLCBldmVuIGlmIGl0IHdpbGwga2VlcAo+ID4gY29tcGxldGluZyBz
eW5jaHJvbm91c2x5Lgo+IAo+IEpvbGx5IGdvb2QuICBJIHRoaW5rLCB0aG91Z2gsIHRoYXQgdGhl
cmUgc2hvdWxkIGJlIGEgSEFWRV8uLi4gIGZvcgo+IHRoaXMgc2V0IG9mIEFQSSBjaGFuZ2VzLiAg
SSBkb24ndCBtaW5kIGlmIGl0IGdvZXMgaW50byB0aGUgbGFzdCBwYXRjaAoKSSB0aG91Z2h0IHRo
YXQgSEFWRV8qIHdhc24ndCBuZWVkZWQgd2hlbiB0aGUgQVBJIHZlcnNpb24gaXMgYnVtcGVkLiBC
dXQKbm93IEkgZ3Vlc3MgdGhhdCB0aGUgSEFWRV8qIG1hY3JvIGFyZSB0aGUgb25seSB3YXkgZm9y
IGFuIGFwcGxpY2F0aW9uCnRvIGJ1aWxkIGFnYWluc3Qgb2xkIHZlcnNpb24gb2YgbGlieGwgc2lu
Y2UgdGhlIHZlcnNpb24gbnVtYmVyIGlzbid0CmV4cG9zZWQuCgpUaGUgcXVlc3Rpb24gaXMsIGhv
dyBtYW55IG1hY3JvIHNob3VsZCB0aGVyZSBiZT8gQXMgbWFueSBtYWNybyBhcyB0aGVyZQphcmUg
ZnVuY3Rpb24gY2hhbmdlZD8gT3IganVzdCBvbmU/CgpGb3IgbWFueSwgSSBjYW4gYWRkIHRoYXQ6
CiAgICAvKgogICAgICogTElCWExfSEFWRV8qX0FTWU5DCiAgICAgKgogICAgICogVGhvc2UgZGVm
aW5lcyBpbmRpY2F0ZXMgdGhhdCB0aGUgZnVuY3Rpb24gbGlieGxfKigpJ3MgQVBJIGhhcyBjaGFu
Z2VkCiAgICAgKiBhbmQgaGF2ZSBhbiBleHRyYSBwYXJhbWV0ZXIgImFvX2hvdyIgd2hpY2ggbWVh
bnMgdGhhdCB0aGUgZnVuY3Rpb24gY2FuIGJlCiAgICAgKiBleGVjdXRlZCBhc3luY2hyb25vdXNs
eS4gVGhvc2UgZnVuY3Rpb25zIGFyZToKICAgICAqICAgbGlieGxfZG9tYWluX3BhdXNlKCkKICAg
ICAqICAgbGlieGxfZG9tYWluX3VucGF1c2UoKQogICAgICogICBsaWJ4bF9zZW5kX3RyaWdnZXIo
KQogICAgICogICBsaWJ4bF9zZXRfdmNwdW9ubGluZSgpCiAgICAgKiAgIGxpYnhsX3JldHJpZXZl
X2RvbWFpbl9jb25maWd1cmF0aW9uKCkKICAgICAqICAgbGlieGxfcWVtdV9tb25pdG9yX2NvbW1h
bmQoKQogICAgICovCiAgICAjZGVmaW5lIExJQlhMX0hBVkVfRE9NQUlOX1BBVVNFX0FTWU5DIDEK
ICAgICNkZWZpbmUgTElCWExfSEFWRV9ET01BSU5fVU5QQVVTRV9BU1lOQyAxCiAgICAjZGVmaW5l
IExJQlhMX0hBVkVfU0VORF9UUklHR0VSX0FTWU5DIDEKICAgICNkZWZpbmUgTElCWExfSEFWRV9T
RVRfVkNQVU9OTElORV9BU1lOQyAxCiAgICAjZGVmaW5lIExJQlhMX0hBVkVfUkVUUklFVkVfRE9N
QUlOX0NPTkZJR1VSQVRJT05fQVNZTkMgMQogICAgI2RlZmluZSBMSUJYTF9IQVZFX1FFTVVfTU9O
SVRPUl9DT01NQU5EX0FTWU5DIDEKCklmIG9ubHkgb25lLCBJIGRvbid0IGtub3cgaG93IHRvIGNh
bGwgaXQsIG1heWJlIG9uIG9mIG9yIHJlbGF0ZWQ6CiAgICBMSUJYTF9IQVZFX1FNUF9GTl9BU1lO
QwogICAgTElCWExfSEFWRV9GTl9VU0lOR19RTVBfQVNZTkMKd2l0aCB0aGUgc2FtZSBjb21tZW50
IGxpc3RpbmcgYWxsIGFmZmVjdGVkIGZ1bmN0aW9ucy4KCj4gb3IgdGhlIGZpcnN0IG9uZS4gIEFz
c3VtaW5nIHlvdSBhZGQgdGhhdCB0byB0aGUgc2VyaWVzIGluIHYyOgo+IAo+IEFja2VkLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRo
b255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
