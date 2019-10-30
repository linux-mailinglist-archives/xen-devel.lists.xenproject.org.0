Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B29E9822
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 09:27:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPjHW-0004ZM-Vz; Wed, 30 Oct 2019 08:24:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PZpR=YX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iPjHV-0004ZH-B2
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 08:24:41 +0000
X-Inumbo-ID: b74e0354-faee-11e9-a531-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b74e0354-faee-11e9-a531-bc764e2007e4;
 Wed, 30 Oct 2019 08:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572423880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Aw8X/l0L8rPs9c+eRGfknS1fYJ5DwH8EOVO7plL5Jqc=;
 b=O5xxs6evvMmeKv6fuKxl0+6lyVsEjrF1S/dnYJUKLyzJSUqcn2GINGvC
 4yoLhdZpcYF4MOIdpyBAfKMc4PgB5+7pTsMSqhBwgfLDjZUez/dE7ZPvw
 yJDx8aT6cGKZcVW05XEItAVZmhWt2l4QzCmmYyKllI61qitSZmGeppnsB Q=;
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
IronPort-SDR: 1CjZ5ASs8bK+uVMwCTozpgEe3sPM4mtiWqgd9EUn6N60W4chTcWtf0NFQVqWSEm3qrcHTLdAny
 yFDp1nGAQuv4wZCJ1B2sXTy/lBnPvIInrbr7Cwx7fAX3Vimg/KVSYfdol1mZm5JsZ0TtQUklAZ
 tWZ7tl1/25k6oDQ4ai5IT+0+uf7yESaUqcOM4WjF7fWZR8ARrAbVpir5UlAct3W6fZ0YLT76rn
 DSByoCaPo44I0Fy2TqjMLWGYRzAfCL+IVFTs0Wc/SJMNdezQepvHgLJo56Pa4qeoTQ17UksGhX
 xOg=
X-SBRS: 2.7
X-MesageID: 8075066
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,246,1569297600"; 
   d="scan'208";a="8075066"
Date: Wed, 30 Oct 2019 09:24:28 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Joe Jin <joe.jin@oracle.com>
Message-ID: <20191030082428.GW17494@Air-de-Roger>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDU6MjA6MThQTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiBIaSBSb2dlciAmIEphbiwKPiAKPiBJIGdvdCBteSB0ZXN0IGVudiBiYWNrLCBhbmQgYmFjayB0
aGUgcGF0Y2ggdG8gc3RhYmxlLTQuMTIsIHJ1biBzYW1lCj4gdGVzdCwgSSBzdGlsbCBzZWVuIG9y
aWdpbmFsIGlzc3VlLCBndWVzdCBrZXJuZWwgcHJpbnRlZCBlcnJvcjoKPiAKPiAga2VybmVsOmRv
X0lSUTogMjAuMTE0IE5vIGlycSBoYW5kbGVyIGZvciB2ZWN0b3IgKGlycSAtMSkKPiAKPiBBZnRl
ciB0aGF0LCBwYXNzIHRocm91Z2ggaW5maW5pYmFuZCBWRiBzdG9wcGVkIHRvIHdvcmsuCgpUaGFu
a3MgZm9yIHRoZSB0ZXN0aW5nLCBUQkggSSdtIG5vdCBzdXJlIHdoYXQncyB3cm9uZyBoZXJlLCBz
aW5jZSBJCmludGVuZGVkIG15IHByb3Bvc2VkIHBhdGNoIHRvIGJlIGZ1bmN0aW9uYWxseSBlcXVp
dmFsZW50IHRvIHlvdXIgZmlyc3QKcHJvcG9zZWQgZml4LgoKPiBNeSBwYXRjaCBhcyBiZWxvdywg
cGxlYXNlIGNoZWNrOgoKVGhlIHBhdGNoIExHVE0uCgpDYW4geW91IHRyeSB0byBhZGQgdGhlIGZv
bGxvd2luZyBkZWJ1ZyBwYXRjaCBvbiB0b3Agb2YgdGhlIGV4aXN0aW5nCm9uZSBhbmQgcmVwb3J0
IHRoZSBvdXRwdXQgdGhhdCB5b3UgZ2V0IG9uIHRoZSBYZW4gY29uc29sZT8KCi0tLTg8LS0tCmRp
ZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW50cmVtYXAuYyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pbnRyZW1hcC5jCmluZGV4IDA3YzFjMTYyN2EuLjkxYTFk
ZGUxMzEgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pbnRyZW1hcC5j
CisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pbnRyZW1hcC5jCkBAIC05NzcsNyAr
OTc3LDEzIEBAIGludCBwaV91cGRhdGVfaXJ0ZShjb25zdCBzdHJ1Y3QgcGlfZGVzYyAqcGlfZGVz
YywgY29uc3Qgc3RydWN0IHBpcnEgKnBpcnEsCiAKICAgICByYyA9IG1zaV9tc2dfd3JpdGVfcmVt
YXBfcnRlKG1zaV9kZXNjLCAmbXNpX2Rlc2MtPm1zZyk7CiAgICAgaWYgKCAhcmMgJiYgcHJldiAp
Cit7CisgICAgICAgICBwcmludGsoInN5bmMgUElSUiBvbiB2Y3B1IyV1XG4iLCBwcmV2LT52Y3B1
X2lkKTsKICAgICAgICAgIHZsYXBpY19zeW5jX3Bpcl90b19pcnIocHJldik7Cit9CitlbHNlCisg
ICAgICAgICBwcmludGsoIm5vdCBzeW5jaW5nIFBJUlIgcmM6ICVkIHZjcHUjJXVcbiIsCisgICAg
ICAgICAgICAgICAgcmMsIHByZXYgPyBwcmV2LT52Y3B1X2lkIDogLTEpOwogCiAgICAgcmV0dXJu
IHJjOwogfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
