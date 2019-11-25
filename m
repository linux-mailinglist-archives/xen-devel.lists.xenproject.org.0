Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964371092CA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 18:28:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZI8q-0002m2-9Q; Mon, 25 Nov 2019 17:27:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cgds=ZR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZI8p-0002lE-AC
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 17:27:15 +0000
X-Inumbo-ID: d215e20a-0fa8-11ea-a393-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d215e20a-0fa8-11ea-a393-12813bfff9fa;
 Mon, 25 Nov 2019 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574702835;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nDUmeaeAFlZmDu80yEAQZowjokvAxUQlsABfTvryev8=;
 b=FHcQDDLGFHNBjXJYqJ4LSzsl81TB1SG5GPJ2W/FBGZ35nv3cMLTmXZt3
 /A11slh7tLyu+pBbB+rJAA+aA1ik06pO1ehPMzXX6G8mNTYlFGU96oa+K
 j9MPxBhTJ6f9OVdIZZje3cjdPQEX41YOPJMcBOBZBm6Wqb/osU1pou3FV k=;
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
IronPort-SDR: xjVs46/dl0eljkgbWp2SfijI2AzbSyKEoXHRyXTWBQrPvh3wx16j8Lt8hXkUYlT3Wz7HSeySPy
 ouoSZiJUKofbl8eIOHWUhqBXc+9s0mqSZ3XXNpr7p7y1WtoDVr3SUOVXWM9kFEdcVA9/seiSLe
 4KOvZZimzfa0FmPDfjPZy++Q8IaLjHfvPq1Ata3y69PzBkjzmiqG4AeRrk/kAGoDZsefG7Wux/
 l3HDon3ry5E6lA5fAOR8CjbiRZLVGkCJkafByNom3ag/V5qHpGcobcJykmQHvi0FoX7DhNiugp
 E/A=
X-SBRS: 2.7
X-MesageID: 8811066
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,242,1571716800"; 
   d="scan'208";a="8811066"
Date: Mon, 25 Nov 2019 18:27:04 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20191125172704.GB980@Air-de-Roger>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <9399a177-91dd-b64a-1b6f-1d29903161fe@cardoe.com>
 <20191125140606.6jmltrc624zugnqv@debian>
 <20191125155931.GA980@Air-de-Roger>
 <20191125170704.etgloq6y2e7j6ewg@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125170704.etgloq6y2e7j6ewg@debian>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDU6MDc6MDRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIE5vdiAyNSwgMjAxOSBhdCAwNDo1OTozMVBNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+IFsuLi5dCj4gPiAKPiA+IFdoaWNoIEkgdGhpbmsgaXQncyBleHBlY3RlZCwg
d2UgYWxyZWFkeSBrbmV3IGNsYW5nIGhhZCBhIGxvdCBvZgo+ID4gZHVwbGljYXRlIHN5bWJvbHMu
IFRoZSBvbmx5IHdheSBJIGtub3cgdG8gd29ya2Fyb3VuZCB0aGlzIEFUTSBpcyB0bwo+ID4gdXNl
IGBnbWFrZSB4ZW4gY2xhbmc9eSBDT05GSUdfRU5GT1JDRV9VTklRVUVfU1lNQk9MUz1uYC4gSXQn
cyBvbiBteQo+ID4gcGlsZSBvZiBzdHVmZiB0byBsb29rIGludG8sIGJ1dCBJJ20gbm90IHN1cmUg
d2hlbiBJIHdpbGwgZ2V0IHRvIGl0Lgo+IAo+IEluIHRoYXQgY2FzZSB3ZSBzaG91bGQgbWFrZSBH
aXRsYWIgQ0kgdXNlIHRoZSBuZXcgY29uZmlndXJhdGlvbiBvcHRpb24uCgpJTU8gdGhlIGJ1aWxk
IHNob3VsZCB3b3JrIG91dCBvZiB0aGUgYm94LCBzbyB3ZSBzaG91bGQgZGlzYWJsZQpDT05GSUdf
RU5GT1JDRV9VTklRVUVfU1lNQk9MUyBhdXRvbWF0aWNhbGx5IGlmIGNsYW5nIGlzIGRldGVjdGVk
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
