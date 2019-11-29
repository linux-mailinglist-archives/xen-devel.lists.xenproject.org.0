Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF59710D559
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:02:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaew6-0001mg-BE; Fri, 29 Nov 2019 11:59:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iaew5-0001mb-5K
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 11:59:45 +0000
X-Inumbo-ID: b5252968-129f-11ea-a3e3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5252968-129f-11ea-a3e3-12813bfff9fa;
 Fri, 29 Nov 2019 11:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575028774;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=D0M2hqZtZorm3i9g9aha3unWkYJgAr4nCHSVTIRVfao=;
 b=BPgdqXHBwKxmRZocrKVx40HZLox28do51KjLTYoJnEFfCqk+7LLob9hV
 6UeagUwITjZ6ZDyynG0ydtx7T+MUkT/o1RSr0iYqEnzcy0t1HEIQo8Ca3
 EeUHWVurXUIEhN18lHrqzD1Nbaj/YNMNHxf5hYbbekC+jBt3Xr9e+KUeV M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qHZkR+QXbqtg6NHD/wbGlKDJGl/QBHjF33yXBBo8pz8wwO8AaW3Q+14XwKdQkkHowKpDB5CBVn
 yX560u+3iEsLECurkzvfenyEI48+8RIkJjsTgoFaPBCkpMGJ7SlvwkQ+hr8XbO50G0ZV4PgL3r
 FnWfMemhkZsQFlJQ/VFM90izS+oW6fXzF0semUHhQarEu+ROCgUc97KdJxdXf3H2Ev2imnY6wt
 9x8IMDf9rP3pjzElbR/R/1R1kZLmXKSm3SoUnGgx8j/HjiXHPA9bYiTzP/cMSoMaoYjLqmc5a2
 ZmE=
X-SBRS: 2.7
X-MesageID: 8988047
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8988047"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24033.2082.127306.518557@mariner.uk.xensource.com>
Date: Fri, 29 Nov 2019 11:59:30 +0000
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiW1BBVENIXSBjb25zb2xlOiBhdm9pZCBidWZmZXIgb3ZlcmZs
b3cgaW4gZ3Vlc3RfY29uc29sZV93cml0ZSgpIik6Cj4gVGhlIHN3aXRjaCBvZiBndWVzdF9jb25z
b2xlX3dyaXRlKCkncyBzZWNvbmQgcGFyYW1ldGVyIGZyb20gcGxhaW4gdG8KPiB1bnNpZ25lZCBp
bnQgaGFzIGNhdXNlZCB0aGUgZnVuY3Rpb24ncyBtYWluIGxvb3AgaGVhZGVyIHRvIG5vIGxvbmdl
cgo+IGd1YXJkIHRoZSBtaW5fdCgpIHVzZSB3aXRoaW4gdGhlIGZ1bmN0aW9uIGFnYWluc3QgZWZm
ZWN0aXZlbHkgbmVnYXRpdmUKPiB2YWx1ZXMsIGR1ZSB0byB0aGUgY2FzdHMgaGlkZGVuIGluc2lk
ZSB0aGUgbWFjcm8uIFJlcGxhY2UgYnkgYSBwbGFpbgo+IG1pbigpLCBjb252ZXJ0aW5nIG9uZSBv
ZiB0aGUgYXJndW1lbnRzIHN1aXRhYmx5IHdpdGhvdXQgaW52b2x2aW5nIGFueQo+IGNhc3QuCj4g
Cj4gRml4ZXM6IGVhNjAxZWM5OTk1YiAoInhlbi9jb25zb2xlOiBSZXdvcmsgSFlQRVJDQUxMX2Nv
bnNvbGVfaW8gaW50ZXJmYWNlIikKPiBSZXBvcnRlZC1ieTogSWxqYSBWYW4gU3BydW5kZWwgPGl2
YW5zcHJ1bmRlbEBpb2FjdGl2ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKZWE2MDFlYzk5OTViIGluY2x1ZGVkIHRoaXMgaHVuazoKCiAgICAg
ICBjYXNlIENPTlNPTEVJT19yZWFkOgogICsgICAgICAgIC8qCiAgKyAgICAgICAgICogVGhlIHJl
dHVybiB2YWx1ZSBpcyBlaXRoZXIgdGhlIG51bWJlciBvZiBjaGFyYWN0ZXJzIHJlYWQgb3IKICAr
ICAgICAgICAgKiBhIG5lZ2F0aXZlIHZhbHVlIGluIGNhc2Ugb2YgZXJyb3IuIFNvIHdlIG5lZWQg
dG8gcHJldmVudAogICsgICAgICAgICAqIG92ZXJsYXAgYmV0d2VlbiB0aGUgdHdvIHNldHMuCiAg
KyAgICAgICAgICovCiAgKyAgICAgICAgcmMgPSAtRTJCSUc7CiAgKyAgICAgICAgaWYgKCBjb3Vu
dCA+IElOVF9NQVggKQogICsgICAgICAgICAgICBicmVhazsKCk1heWJlIGl0IHdvdWxkIGJlIGdv
b2QgdG8gbW92ZSB0aGF0IG91dHNpZGUgdGhlIHN3aXRjaCBzbyB0aGF0IGl0CmFmZmVjdHMgQ09O
U09MRUlPX3dyaXRlIHRvbyA/CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
