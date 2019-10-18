Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9FDC8D7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 17:37:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLUGl-0000HW-K8; Fri, 18 Oct 2019 15:34:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QEq0=YL=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iLUGk-0000Gz-CK
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 15:34:22 +0000
X-Inumbo-ID: c16c3dfa-f1bc-11e9-beca-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c16c3dfa-f1bc-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571412861;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JLVHbMPbVrPhYgdFcNrk+5BN+l6Aamlsr8rY64BoTQY=;
 b=DyrKUP5/O8lAnU87GJ0fdhvaugDYEI0n2F6XaYUkxfzceNmDXizTbW2Q
 iSlfmrt2a7w4iVn4OOcjgZ6L3iQDopBJHxyJcOYqgF9VvvFq9pFp0dXiX
 JYOSOJMUq0e2tuTxPXC0FJKlOOk8lsD07XxzYvZexfOZCoNMfIil/DWvc 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bKvppahUs3kB4i48dXQIXiwamFv2XjZgqhxWV96Lk9kH1Jin31jK/1V+jmseVB95XbUhNM32xl
 brIVZTMifBLxaQPBRRDrvr5OTMwmha2R9SDACbccbpsC7uVTeLkuTFhgFE6Joi4YOQsVbHtZoS
 KyUTxRy1QH55jVoQsEkfWZq7WJVBF2R4LYocDCBPLuS6bRUm4FHuK9xnm5COI4SgrwruLMqFsm
 LHnLDJKaZk4Om/2vcNjx0jZz3bffTMoTkwTqRAj2rXLl1Rjr1NIzCQpik3FbcdNyWqZ3P9dHlI
 iA8=
X-SBRS: 2.7
X-MesageID: 7194113
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,312,1566878400"; 
   d="scan'208";a="7194113"
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Pawel Wieczorkiewicz
 <wipawel@amazon.de>, <jgross@suse.com>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20191018142518.GA6040@char.us.oracle.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <61ece13d-4808-ff92-45a8-4974f8684e0a@citrix.com>
Date: Fri, 18 Oct 2019 16:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191018142518.GA6040@char.us.oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 00/12] livepatch: new features and fixes
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
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, wipawel@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTgvMTkgMzoyNSBQTSwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+IE9uIFNh
dCwgU2VwIDI4LCAyMDE5IGF0IDAzOjEyOjUzUE0gKzAwMDAsIFBhd2VsIFdpZWN6b3JraWV3aWN6
IHdyb3RlOgo+PiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIG5ldyBmZWF0dXJlcyB0byB0aGUgbGl2
ZXBhdGNoIGZ1bmN0aW9uYWxpdHkgYXMKPj4gYnJpZWZseSBkaXNjdXNzZWQgZHVyaW5nIFhlbiBE
ZXZlbG9wZXIgU3VtbWl0IDIwMTk6IFthXSBhbmQgW2JdLgo+PiBJdCBhbHNvIHByb3ZpZGVzIGEg
ZmV3IGZpeGVzIGFuZCBzb21lIHNtYWxsIGltcHJvdmVtZW50cy4KPiAKPiBIZXlhLAo+IAo+IElz
IHRoZXJlIGFuIHY1IG9mIHRoZSBwYXRjaGVzIHNvbWV3aGVyZSBicmV3aW5nIHNvIHRoYXQgSSBj
YW4gZ2l2ZSB0aGVtCj4gb25lIGxhc3QgdGVzdD8KPiAKPiBKdWVyZ2VuLAo+IAo+IEFyZSB5b3Ug
T0sgd2l0aCBnaXZpbmcgdGhlbSBhbiBSZWxlYXNlLUFjaz8gSSB0aGluayB0aGVyZSBhcmUgb25s
eSB0d28gbWlub3IKPiBjaGFuZ2VzIHRoYXQgSmFuIHJlcXVlc3RlZC4KPiAKCkkgaGF2ZSBub3Qg
eWV0IGhhZCB0aW1lIHRvIHJldmlldyBzb21lIG9mIHRoZSBwYXRjaGVzIGluIHY0LiBJIGV4cGVj
dCBJIAp3aWxsIGhhdmUgdGltZSBvbiBNb25kYXkgdG8gbG9vayBhdCB0aGUgcmVzdC4KClRoYW5r
cywKLS0gClJvc3MgTGFnZXJ3YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
