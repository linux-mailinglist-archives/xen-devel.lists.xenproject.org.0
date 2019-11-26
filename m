Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241610A016
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:16:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbbu-0007tq-C7; Tue, 26 Nov 2019 14:14:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xtMf=ZS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iZbbs-0007te-Rn
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:14:32 +0000
X-Inumbo-ID: 10ccc6a4-1057-11ea-83b8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10ccc6a4-1057-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 14:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574777672;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=IgOrxEqVZ9tro2rwoiNgdGkbWspBUEm+8QdW8tCGEf8=;
 b=HzvrCR9ZC0ERBRHGzaiQBlggukwOQCzj7fk5wrZKax7TdgctPbKIB90q
 MOYwsX1bcQ4nZ/XccJo3BwtJDLDoHarjuuaFcJrYCq/+7uGQhfZR8/BLo
 ZXBzGoTc9bpGLGHH/7eClzH7utNoYRD/4kd9SOvfsIcGN/UGXo9V2lDM5 M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nxSDeYhg1MNZgGy0wt1YenOErh6PeVNBr4fG5gd+oDxp0EqpLbomuG4Mz9FgQRrZni9I07B0mG
 OTOjqLNXSGnOffjJwps7toFjHHjqoDnApwZkQmRje8moaEB4RCF1Qh1cA36idYV3qnMfEBAVFG
 ihjYC9PHUP49aNcSZP/eea0u/wbPlcf6S12eFwjCq5YKnogBklDL9t06JlQHToblsmXNXhns/H
 EJDmKMw+T8gTLlYF8A0+vJaMVJom/5Qzh2x6KQ9Jd36DTmatFY6mzsOxwHmMzCvqJL/k3z8zyZ
 akY=
X-SBRS: 2.7
X-MesageID: 9260441
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9260441"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24029.13124.935192.209484@mariner.uk.xensource.com>
Date: Tue, 26 Nov 2019 14:14:28 +0000
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <20191126141026.2858622-1-george.dunlap@citrix.com>
References: <20191126141026.2858622-1-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable
 state
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggZm9yLTQuMTNdIGRvY3MveGw6IERvY3VtZW50
IHBjaS1hc3NpZ25hYmxlIHN0YXRlIik6Cj4gID1pdGVtIEI8cGNpLWFzc2lnbmFibGUtcmVtb3Zl
PiBbSTwtcj5dIEk8QkRGPgouLi4KPiArTWFrZSB0aGUgZGV2aWNlIGF0IFBDSSBCdXMvRGV2aWNl
L0Z1bmN0aW9uIEJERiBub3QgYXNzaWduYWJsZSB0bwo+ICtndWVzdHMuICBUaGlzIHdpbGwgYXQg
bGVhc3QgdW5iaW5kIHRoZSBkZXZpY2UgZnJvbSBwY2liYWNrLCBhbmQKPiArcmUtYXNzaWduIGl0
IGZyb20gdGhlICJxdWFyYW50aW5lIGRvbWFpbiIgYmFjayB0byBkb21haW4gMC4gIElmIHRoZSAt
cgo+ICtvcHRpb24gaXMgc3BlY2lmaWVkLCBpdCB3aWxsIGFsc28gYXR0ZW1wdCB0byByZS1iaW5k
IHRoZSBkZXZpY2UgdG8gaXRzCj4gK29yaWdpbmFsIGRyaXZlciwgbWFraW5nIGl0IHVzYWJsZSBi
eSBEb21haW4gMCBhZ2Fpbi4gIElmIHRoZSBkZXZpY2UgaXMKPiArbm90IGJvdW5kIHRvIHBjaWJh
Y2ssIGl0IHdpbGwgcmV0dXJuIHN1Y2Nlc3MuCj4gKwo+ICtOb3RlIHRoYXQgdGhpcyBmdW5jdGlv
bmFsaXR5IHdpbGwgd29yayBldmVuIGZvciBkZXZpY2VzIHdoaWNoIHdlcmUgbm90Cj4gK21hZGUg
YXNzaWduYWJsZSBieSBCPHBjaS1hc3NpZ25hYmxlLWFkZD4uICBUaGlzIGNhbiBiZSB1c2VkIHRv
IGFsbG93Cj4gK2RvbTAgdG8gYWNjZXNzIGRldmljZXMgd2hpY2ggd2VyZSBhdXRvbWF0aWNhbGx5
IHF1YXJhbnRpbmVkIGJ5IFhlbgo+ICthZnRlciBkb21haW4gZGVzdHJ1Y3Rpb24gYXMgYSByZXN1
bHQgb2YgWGVuJ3MgQjxpb21tdT1xdWFyYW50aW5lPgo+ICtjb21tYW5kLWxpbmUgZGVmYXVsdC4K
CldoYXQgYXJlIHRoZSBzZWN1cml0eSBpbXBsaWNhdGlvbnMgb2YgZG9pbmcgdGhpcyBpZiB0aGUg
ZGV2aWNlIG1pZ2h0CnN0aWxsIGJlIGRvaW5nIERNQSBvciBzb21ldGhpbmcgPwoKKEZvciB0aGF0
IG1hdHRlciwgcHJlc3VtYWJseSB0aGVyZSBhcmUgc2VjdXJpdHkgaW1wbGljYXRpb25zIG9mCmFz
c2lnbmluZyB0aGUgc2FtZSBkZXZpY2UgaW4gc2VxdWVuY2UgdG8gZGlmZmVyZW50IGd1ZXN0cz8p
CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
