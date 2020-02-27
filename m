Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26E71714C8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 11:12:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7G6B-0001sT-N3; Thu, 27 Feb 2020 10:08:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7G69-0001sO-Bs
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 10:08:53 +0000
X-Inumbo-ID: 279a0f00-5949-11ea-83b0-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 279a0f00-5949-11ea-83b0-bc764e2007e4;
 Thu, 27 Feb 2020 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582798132;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9ETVfFTZlDhdfevtMBeszCVLOQYDIQ55V/jnW92rxg4=;
 b=h3vsWfnCPoMdF3lMN35K/ngWMEX/8rGXzoGzXokg7STah+a4ZM0VYzbA
 z5aTfYB1gc3jzF3sFOC89sGkuirALxH/5nl76D+1lo6+nzk0x9yuLkDm7
 uAdBeTUZKXp9LHj0hmkuStV24kx4IHLkGRAVDG4oz7vhqCHa7qMP6mrve I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bwza4W+3cfVWnXvnmOhxM3AisFwzp7TCi1xThiOU3/ISX1OZpQ1GB1VSvy912FqtaOr2wOdNyH
 Cbu/J87bMtTFrRIcV73pyT03UH9rxtd0dMmxRn9SQaL03dYqYvrikDmKAqnih7R9axhRX9PjNz
 Zg5BQMWmiiplyJfuZm/7bzv3zIp/o2vQ+NSAqGcjKZR4Zuxg9x1burdzCyGVolzauzSzNYbmmH
 MnDN7U9ncJgC1fQY1mC9zq7evv5ry/LSQwx1JQRx79DbIW/key47yEVkJE8AlbguH+pNBux3Wt
 xD0=
X-SBRS: 2.7
X-MesageID: 13719141
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,491,1574139600"; d="scan'208";a="13719141"
To: Jan Beulich <jbeulich@suse.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-4-andrew.cooper3@citrix.com>
 <e9cfe667-9cbf-4f04-352d-bbf45a416165@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <348b89e9-891b-4bdf-204c-9af354955a0e@citrix.com>
Date: Thu, 27 Feb 2020 10:08:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e9cfe667-9cbf-4f04-352d-bbf45a416165@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 03/10] x86/gen-cpuid: Rework internal logic
 to ease future changes
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDIvMjAyMCAwNzo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDIuMjAyMCAy
MToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQmV0dGVyIHNwbGl0IHRoZSBsb2dpYyBiZXR3
ZWVuIHBhcnNlL2NhbGN1bGF0ZS93cml0ZS4gIENvbGxlY3QgdGhlIGZlYXR1cmUKPj4gY29tbWVu
dCBieSB0aGVpciBjb21tZW50IGNoYXJhY3RlciwgYW5kIHBlcmZvcm0gdGhlIGFjY3VtdWxhdGlv
biBvcGVyYXRpb25zIGluCj4+IGNydW5jaF9udW1iZXJzKCkuCj4gV291bGQgeW91IG1pbmQgc2F5
aW5nICJjaGFyYWN0ZXIocykiIGhlcmUsIGFzIHRoZXJlIGFyZSBpdGVtcyB3aXRoCj4gbXVsdGlw
bGUgb2YgdGhlbT8KCk9rLgoKPgo+PiBBdm9pZCByZW5kZXJpbmcgdGhlIGZlYXR1cmVzZXRzIHRv
IEMgdWludDMyX3QncyBpbiBjcnVuY2hfbnVtYmVycygpLCBhbmQKPj4gaW5zdGVhZCBkbyB0aGlz
IGluIHdyaXRlX3Jlc3VsdHMoKS4gIFVwZGF0ZSBmb3JtYXRfdWludDMycygpIHRvIGNhbGwKPj4g
ZmVhdHVyZXNldF90b191aW50MzJzKCkgaW50ZXJuYWxseS4KPj4KPj4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2UgLSB0aGUgZ2VuZXJhdGVkIGNwdWlkLWF1dG9nZW4uaCBpcyBpZGVudGljYWwuCj4gSSBu
b3RpY2UgdGhlICJzcGVjaWFsIiBmaWVsZCAob3IgaG93ZXZlciBzdWNoIGlzIGNhbGxlZCBpbiBQ
eXRob24pCj4gZ29lcyBhd2F5LCBpbiBmYXZvciBvZiB1c2luZyByYXdbJyEnXSBhdCB0aGUgYXBw
YXJlbnRseSBzb2xlCj4gY29uc3VtaW5nIHNpdGUuIEkgYWxzbyBub3RpY2UgdGhlIHNhbWUgaXNu
J3QgdHJ1ZSBmb3IgInB2Iiwgd2hpY2gKPiBub3cgY291bGQgYWxzbyBiZSByYXdbJ0EnXSBhcyBp
dCBzZWVtcy4gSWYgdGhpcyBpcyB0aGUgY2FzZSAoaS5lLgo+IEknbSBub3Qgb3Zlcmxvb2tpbmcg
YW55dGhpbmcpLCBjb3VsZCB5b3Ugc2F5IGEgd29yZCBvbiB0aGUgY2hhbmdlCj4gZm9yICJzcGVj
aWFsIiBhbmQvb3IgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiAic3BlY2lhbCIgYW5kICJwdiI/CgpU
aGVyZSBpcyBubyBwb2ludCBjb3B5aW5nIGRhdGEganVzdCBmb3IgdGhlIHNha2Ugb2YgY29weWlu
ZyBkYXRhLgoKV2hpbGUgd2UgY291bGQgZHJvcCBzdGF0ZS5wdiAocHZfZGVmIGJ5IHRoZSBlbmQg
b2YgdGhlIHNlcmllcyksIHRoYXQgaXMKdGhlIG9ubHkgc2V0IGl0IHdvdWxkIGJlIHRydWUgZm9y
LCBhbmQgZHJvcHBpbmcgaXQgZG9lcyBpbnRlcmZlcmUgd2l0aAp0aGUgZGVyaXZhdGlvbiBvZiBy
YXdfc2hhZG93IChyYXdfc2hhZG93X2RlZiBieSB0aGUgZW5kIG9mIHRoZSBzZXJpZXMpLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
