Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEEB118EA
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 14:21:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMAgw-0004UN-VU; Thu, 02 May 2019 12:19:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAgv-0004U7-Fq
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:19:57 +0000
X-Inumbo-ID: 95f31b66-6cd4-11e9-9cbc-9fb1373d849d
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95f31b66-6cd4-11e9-9cbc-9fb1373d849d;
 Thu, 02 May 2019 12:19:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 06:19:51 -0600
Message-Id: <5CCAE065020000780022B2EB@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 06:19:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 3/9] x86/mm: honor opt_pcid also for 32-bit PV
 domains
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBjYW4ndCBzZWUgYW55IHRlY2huaWNhbCBvciBwZXJmb3JtYW5jZSByZWFzb24gd2h5IHdlIHNo
b3VsZCB0cmVhdAozMi1iaXQgUFYgZGlmZmVyZW50IGZyb20gNjQtYml0IFBWIGluIHRoaXMgcmVn
YXJkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4u
YwpAQCAtMTgwLDcgKzE4MCwyNCBAQCBpbnQgc3dpdGNoX2NvbXBhdChzdHJ1Y3QgZG9tYWluICpk
KQogICAgIGQtPmFyY2gueDg3X2ZpcF93aWR0aCA9IDQ7CiAKICAgICBkLT5hcmNoLnB2LnhwdGkg
PSBmYWxzZTsKLSAgICBkLT5hcmNoLnB2LnBjaWQgPSBmYWxzZTsKKworICAgIGlmICggdXNlX2lu
dnBjaWQgJiYgY3B1X2hhc19wY2lkICkKKyAgICAgICAgc3dpdGNoICggQUNDRVNTX09OQ0Uob3B0
X3BjaWQpICkKKyAgICAgICAgeworICAgICAgICBjYXNlIFBDSURfT0ZGOgorICAgICAgICBjYXNl
IFBDSURfWFBUSToKKyAgICAgICAgICAgIGQtPmFyY2gucHYucGNpZCA9IGZhbHNlOworICAgICAg
ICAgICAgYnJlYWs7CisKKyAgICAgICAgY2FzZSBQQ0lEX0FMTDoKKyAgICAgICAgY2FzZSBQQ0lE
X05PWFBUSToKKyAgICAgICAgICAgIGQtPmFyY2gucHYucGNpZCA9IHRydWU7CisgICAgICAgICAg
ICBicmVhazsKKworICAgICAgICBkZWZhdWx0OgorICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hB
QkxFKCk7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQogCiAgICAgcmV0dXJuIDA7CiAK
QEAgLTMxMiw3ICszMjksNyBAQCBpbnQgcHZfZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFp
biAqCiAKICAgICBkLT5hcmNoLnB2LnhwdGkgPSBpc19oYXJkd2FyZV9kb21haW4oZCkgPyBvcHRf
eHB0aV9od2RvbSA6IG9wdF94cHRpX2RvbXU7CiAKLSAgICBpZiAoICFpc19wdl8zMmJpdF9kb21h
aW4oZCkgJiYgdXNlX2ludnBjaWQgJiYgY3B1X2hhc19wY2lkICkKKyAgICBpZiAoIHVzZV9pbnZw
Y2lkICYmIGNwdV9oYXNfcGNpZCApCiAgICAgICAgIHN3aXRjaCAoIEFDQ0VTU19PTkNFKG9wdF9w
Y2lkKSApCiAgICAgICAgIHsKICAgICAgICAgY2FzZSBQQ0lEX09GRjoKCgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
