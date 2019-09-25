Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A04BDBBC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 12:02:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD44p-00078N-EQ; Wed, 25 Sep 2019 09:59:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ACI=XU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iD44o-00078H-7X
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:59:14 +0000
X-Inumbo-ID: 203fb11d-df7b-11e9-962f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 203fb11d-df7b-11e9-962f-12813bfff9fa;
 Wed, 25 Sep 2019 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569405553;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qA+ELXx75mnxxgk61tI+2dkF2uh2NQL/3cgU3kwpOwM=;
 b=If3qW6arfefQKV58i6welkl3NY3QSDd6VTI1O+lgazAtlhKb/Kq9l8bJ
 S1yy4dDEngxpMbLOgAAOFl3OTdAyA8EigdeucXjhdQxbvo957pTFWpFeA
 ULH05TLfQwbIQ+w2v6bJehYjSU7HzkiBMAoiLoZZVeGtOK+ouHVlFpZvJ g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k/rGszQxTh+Su5i19MUF9s4YNgNxgtquaryUTg0WbpzdIE9PGwQim/9j1TAzpxDHOHryh6rqOC
 mZrsh5MhrYb50XnMemyE8YUVpcyTTskbJXM9Dm6nwo4w2H1aHA/NDgpD7Rw58FBgZB7v/ghffG
 SC50+7zbvp8VBBRR3b6tvI3qWGwP7k8rsq2JjrY0HuwRvK5Q/rPwkBoXq0zTDOjcZA4UQJvt1i
 QeUIWvwEvCLu7PjHnKW8/qkNS/1m9wEXM4hMR4IN8+Tjeu94vZlMc0wwGKwYLAVNi0oWFjC6UK
 4Gc=
X-SBRS: 2.7
X-MesageID: 6037491
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6037491"
Date: Wed, 25 Sep 2019 11:59:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190925095905.vcmpdxdnxbdkg6eu@Air-de-Roger>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-2-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923100931.29670-2-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next RFC 1/8] x86: introduce
 CONFIG_GUEST and move code
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDk6MjRBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBYZW4gaXMgYWJsZSB0byBydW4gYXMgYSBndWVzdCBvbiBYZW4uIFdlIHBsYW4gdG8gbWFrZSBp
dCBhYmxlIHRvIHJ1bgo+IG9uIEh5cGVyLVYgYXMgd2VsbC4KPiAKPiBJbnRyb2R1Y2UgQ09ORklH
X0dVRVNUIHdoaWNoIGlzIHNldCB0byB0cnVlIGlmIGVpdGhlciBydW5uaW5nIG9uIFhlbgo+IG9y
IEh5cGVyLVYgaXMgZGVzaXJlZC4gUmVzdHJ1Y3R1cmUgY29kZSBoaWVyYXJjaHkgZm9yIG5ldyBj
b2RlIHRvCj4gY29tZS4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgoKUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
