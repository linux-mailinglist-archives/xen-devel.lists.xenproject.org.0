Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC11559E3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 15:44:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j04pV-00047M-4q; Fri, 07 Feb 2020 14:42:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gniO=33=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j04pT-00047H-1e
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 14:41:59 +0000
X-Inumbo-ID: fdec7ada-49b7-11ea-b2cb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdec7ada-49b7-11ea-b2cb-bc764e2007e4;
 Fri, 07 Feb 2020 14:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581086519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eahvoM2JMTHC/rJv12Dv8PVt9iPKUldN0Y/oALfbnt8=;
 b=dwyWCjrc8Twc3L9yR+9JHPkD6gEe20JPHUk8W8VAlkqRWwYpAvMXmvW4
 IHd41dFcqViRsF1IDuQnpdgKHzrV79Q6zPmoLx3eXFVbvxAMJTszowYrb
 KT8leTn5Fp9mgSBblpBuSrEANlL0/Xz4y6uMcd8I4gy4t3sD0DMdixOxr U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Rub+65hHndDidVeDjWX98Nq/YvmezO6QlBuv5wChJV4iWJjVWdFXRXKUuHoxx4i9ExWSdVse0O
 gb5s6DUYUyKtuVkHdOgJN3an/q0pd24qTCOfkc2M4v4hFT+dB0T8H+HUpN37l7KLJOfqOxTHFA
 IwNA6b6wt2NXi7hnU6MHQjQLTL0eUVLLOms/OIiIp85Mbo75ydPWFU9z7Hf0oVJ0UJmlhD1GjL
 p/1LQw1bXN4J6b6vwK4iU8TEarYMT4PyuYH+Fvwq1wz1ivwktPLcptZ76Dz6iFBeWLI8SR/Amm
 jAM=
X-SBRS: 2.7
X-MesageID: 12120509
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,413,1574139600"; d="scan'208";a="12120509"
Date: Fri, 7 Feb 2020 15:41:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200207144150.GE4679@Air-de-Roger>
References: <3deb0df2-5389-9567-3534-23e2ba57c68e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3deb0df2-5389-9567-3534-23e2ba57c68e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/MCFG: fix off-by-one in E820 check
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMDcsIDIwMjAgYXQgMDI6MjU6MTdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQWxzbyBhZGp1c3QgdGhlIGNvbW1lbnQgYWhlYWQgb2YgZTgyMF9hbGxfbWFwcGVkKCkg
dG8gY2xhcmlmeSB0aGF0IHRoZQo+IHJhbmdlIGlzIG5vdCBpbmNsdXNpdmUgYXQgaXRzIGVuZC4K
PiAKPiBSZXBvcnRlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9lODIwLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZTgyMC5jCj4gQEAg
LTM4LDcgKzM4LDcgQEAgc3RydWN0IGU4MjBtYXAgZTgyMDsKPiAgc3RydWN0IGU4MjBtYXAgX19p
bml0ZGF0YSBlODIwX3JhdzsKPiAgCj4gIC8qCj4gLSAqIFRoaXMgZnVuY3Rpb24gY2hlY2tzIGlm
IHRoZSBlbnRpcmUgcmFuZ2UgPHN0YXJ0LGVuZD4gaXMgbWFwcGVkIHdpdGggdHlwZS4KPiArICog
VGhpcyBmdW5jdGlvbiBjaGVja3MgaWYgdGhlIGVudGlyZSByYW5nZSBbc3RhcnQsZW5kKSBpcyBt
YXBwZWQgd2l0aCB0eXBlLgo+ICAgKgo+ICAgKiBOb3RlOiB0aGlzIGZ1bmN0aW9uIG9ubHkgd29y
a3MgY29ycmVjdCBpZiB0aGUgZTgyMCB0YWJsZSBpcyBzb3J0ZWQgYW5kCgpXb3VsZG4ndCBtaW5k
IGlmIHlvdSB0b29rIHRoZSBvcHBvcnR1bml0eSB0byBhbHNvIHMvY29ycmVjdC9jb3JyZWN0bHkv
CmluIHRoZSBzZW50ZW5jZSBhYm92ZS4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
