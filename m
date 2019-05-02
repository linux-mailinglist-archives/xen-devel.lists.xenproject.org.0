Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E6115A4
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 10:43:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM7Hh-0002A9-IA; Thu, 02 May 2019 08:41:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L2Tp=TC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hM7Hf-0002A4-OB
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 08:41:39 +0000
X-Inumbo-ID: 14dde40c-6cb6-11e9-9054-c7d57f3341dc
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14dde40c-6cb6-11e9-9054-c7d57f3341dc;
 Thu, 02 May 2019 08:41:30 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 D16BA301AB38; Thu,  2 May 2019 11:41:29 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id C8389306E4AC;
 Thu,  2 May 2019 11:41:29 +0300 (EEST)
To: Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20190501235203.1179-1-tamas@tklengyel.com>
 <01d02c64-a044-5c6f-d411-ec50abb83408@bitdefender.com>
 <5CCAAC14020000780022B0DC@prv1-mh.provo.novell.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <2123b118-7309-eed7-9fcb-89d85955a68e@bitdefender.com>
Date: Thu, 2 May 2019 11:41:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CCAAC14020000780022B0DC@prv1-mh.provo.novell.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yLzE5IDExOjM2IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwMi4wNS4xOSBh
dCAwODoyMCwgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBPbiA1LzIvMTkg
Mjo1MiBBTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS92bXgvdm14LmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4+PiBAQCAt
Nzc5LDEyICs3NzksMTcgQEAgc3RhdGljIHZvaWQgdm14X2xvYWRfY3B1X3N0YXRlKHN0cnVjdCB2
Y3B1ICp2LCBzdHJ1Y3QgaHZtX2h3X2NwdSAqZGF0YSkKPj4+ICAgCj4+PiAgIHN0YXRpYyB2b2lk
IHZteF9zYXZlX3ZtY3NfY3R4dChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGh2bV9od19jcHUgKmN0
eHQpCj4+PiAgIHsKPj4+ICsgICAgaWYgKCB2ID09IGN1cnJlbnQgKQo+Pj4gKyAgICAgICAgdm14
X3NhdmVfZ3Vlc3RfbXNycyh2KTsKPj4KPj4gdm14X3NhdmVfZ3Vlc3RfbXNycygpIGlzIHNpbXBs
ZSBlbm91Z2ggdGhhdCB0aGUgaWYgaXMgcHJvYmFibHkgbm90Cj4+IG5lY2Vzc2FyeSBoZXJlICh3
ZSBjYW4ganVzdCBjYWxsIHRoZSBmdW5jdGlvbiBkaXJlY3RseSwgcmVnYXJkbGVzcyBvZgo+PiB3
aGF0IHYgaG9sZHMpLgo+IAo+IEF2b2lkaW5nIGFuIE1TUiBhY2Nlc3MgaXMgcGVyaGFwcyB3b3J0
aCB0aGUgY29uZGl0aW9uYWwuCgpGYWlyIGVub3VnaC4KCgpUaGFua3MsClJhenZhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
