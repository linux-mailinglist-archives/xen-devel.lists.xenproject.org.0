Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09B998C91
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 09:46:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0hl4-0007Vl-0T; Thu, 22 Aug 2019 07:43:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng0H=WS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0hl2-0007Vg-Os
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 07:43:44 +0000
X-Inumbo-ID: 9079923a-c4b0-11e9-add1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9079923a-c4b0-11e9-add1-12813bfff9fa;
 Thu, 22 Aug 2019 07:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566459824;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PzFWKq2k9/1ZZoplExs/1rMFerWip09cdlZqZ0dtnwQ=;
 b=FcfrMxMnHUOyWDdG6czUsCKiiJTljfsLFXyV51k67iW+2lixJnV5JGt6
 AJFc0P1bPwbsVlQoIOE3Ijs/gFip3qUqLCMm2fMnn6r3BSzrWA/50v1l1
 CCvs8wTa1NNtlzBsxBwN8irY3uvuHqTXXQmPD5pAp9Osq9OJknj7zVJDf k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Yf4fThsiaL/z1CksFrYIe/Igk4NUeBwIQwcw4HyflRZBQeptg5PUYvbvAAMFch5YJboNy3Vek9
 s0HlDElG9QJ/2zH5XkiChfb7rHgSDTyDL6X8tvxG073RMIG1CXJI4TZxPj1BKXmOpDZn9joNhm
 8kiGZchcLfKRsCQgFgnLO3Fa0VuYKbxyInnBoSZdUfk/Hk28ftEgwNClYNlVXux6vJs4NQOsVp
 8pMJi9BYyX1byvmqPqgx4DzHOMQjfCyctCeP6hX77tc5xVcUU01fijUv8zjU8v0FjDkOOWoAzU
 XJA=
X-SBRS: 2.7
X-MesageID: 4584077
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,415,1559534400"; 
   d="scan'208";a="4584077"
Date: Thu, 22 Aug 2019 09:43:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190822074332.7bl42x3gthqji76k@Air-de-Roger>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-5-roger.pau@citrix.com>
 <88e62ee14cad4235a377376638a1892f@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88e62ee14cad4235a377376638a1892f@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/7] ioreq: allow registering internal ioreq
 server handler
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDY6MzU6MTVQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAyMSBBdWd1c3QgMjAxOSAxNTo1
OQo+ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gQ2M6IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFu
dEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2gKPiA+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pgo+ID4gU3ViamVjdDogW1BBVENIIDQvN10gaW9yZXE6IGFsbG93IHJlZ2lzdGVyaW5nIGludGVy
bmFsIGlvcmVxIHNlcnZlciBoYW5kbGVyCj4gPiAKPiA+IFByb3ZpZGUgYSByb3V0aW5lIHRvIHJl
Z2lzdGVyIHRoZSBoYW5kbGVyIGZvciBhbiBpbnRlcm5hbCBpb3JlcQo+ID4gc2VydmVyLiBOb3Rl
IHRoZSBoYW5kbGVyIGNhbiBvbmx5IGJlIHNldCBvbmNlLgo+IAo+IEknZCBwcmVmZXIgaHZtX3Nl
dF9pb3JlcV9oYW5kbGVyKCkgYW5kIHNvbWUgc29ydCBvZiBndWFyZCB0byBwcmV2ZW50IGVuYWJs
aW5nIG9mIGFuIGludGVybmFsIHNlcnZlciB3aXRoIG5vIGhhbmRsZXIgKHByb2JhYmx5IGluIHRo
ZSBwcmV2aW91cyBwYXRjaCkgd291bGQgYmUgcHJ1ZGVudCwgSSB0aGluay4KClJpZ2h0LCBJIHdp
bGwgYWRkIGl0LgoKPiBBbHNvLCB3aHkgdGhlIHNldC1vbmNlIHNlbWFudGljPwoKV2VsbCwgSSBk
aWRuJ3QgaGF2ZSB0aGUgbmVlZCB0byBjaGFuZ2UgdGhlIGhhbmRsZXIgb2YgaW50ZXJuYWwgaW9y
ZXEKc2VydmVycyAodlBDSSkgc28gSSd2ZSBjb2RlZCBpdCB0aGF0IHdheS4gSWYgeW91IHRoaW5r
IGl0J3MgYmV0dGVyIHRvCmFsbG93IHJ1biB0aW1lIGNoYW5nZXMgb2YgdGhlIGhhbmRsZXIgdGhh
dCdzIGZpbmUsIEkganVzdCBkaWRuJ3QgaGF2ZQp0aGUgbmVlZCBmb3IgaXQgZ2l2ZW4gdGhlIGN1
cnJlbnQgdXNlLWNhc2UgYW5kIEkgdGhvdWdodCBpdCB3b3VsZCBiZQpzYWZlci4KClRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
