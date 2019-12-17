Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4AB122B58
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 13:22:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihBoM-0007in-0T; Tue, 17 Dec 2019 12:18:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcM=2H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ihBoK-0007ih-Mv
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 12:18:44 +0000
X-Inumbo-ID: 59407220-20c7-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59407220-20c7-11ea-b6f1-bc764e2007e4;
 Tue, 17 Dec 2019 12:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576585116;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tFG3ZsahlmhQ1BKZnNQn6vDCg2MibPa+q4B6gqw0Yi4=;
 b=fckL5UOwoy5Fqq38TIDraaiPlGP2ODhjfXb9e1STzpHwrg8vsaG8CVpL
 jxWLdQvzrI0WK8MilDSHtHSxYAcDVFXqlPdX8KEVmY14rH2IcD3RIdIBL
 PPvuX0M0yojM2nURxV/TPTTuAnWqfAJ9agLGYcj7kjVFJQu8RC3KB2BNl w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: agmmC8NxejyL+svwQLk2tXxyvD0JhtdK++JTRty/oVfeQbbh7tonxBYDQmw0DY1jdeE6+igm5w
 Z7r1f2MvqRiO2w8ZB1/W8PhVyId5huuZa6WzNIP3S3zr/Oq0xCB5HZBx8V7YYQZ9ulXAZbZ6Sp
 eSS53EBrrPUSTvpGhuWXao50Bu4zHI5F0iv8nw9WxNWf/x9n5yL5xzfG00WCxm8WsoOBMbTMCT
 gv6phJ0tmr/h8tq+UZ+5ouTSF4lMSwNuxGTnbeZ3IYjVgAJ1A6gU7FenUOA6R6XF2mlfFVkB5B
 O54=
X-SBRS: 2.7
X-MesageID: 10216514
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10216514"
Date: Tue, 17 Dec 2019 13:18:13 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191217121813.GX11756@Air-de-Roger>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <20191213190436.24475-3-andrew.cooper3@citrix.com>
 <20191217115241.GT11756@Air-de-Roger>
 <e9003fba-83e8-1509-224e-5374cd9a99a1@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9003fba-83e8-1509-224e-5374cd9a99a1@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 2/6] x86/suspend: Don't bother saving %cr3,
 %ss or flags
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
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMTI6MDY6MDFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8xMi8yMDE5IDExOjUyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDc6MDQ6MzJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+PiBUaGUgdHJhbXBvbGluZSBoYXMgYWxyZWFkeSBzZXQgdXAgdGhlIGlkbGUgcGFn
ZXRhYmxlcyAod2hpY2ggYXJlIHRoZSBjb3JyZWN0Cj4gPj4gb25lcyB0byB1c2UpLCBhbmQgc2Fu
aXRpc2VkIHRoZSBmbGFncyBzdGF0ZS4KPiA+IEkgd29uZGVyIHdoeSBkbyB3ZSBoYXZlIHdha2V1
cC5TIGFuZCB3YWtldXBfcHJvdC5TLCBpdCB3b3VsZCBiZSBlYXNpZXIKPiA+IHRvIGZvbGxvdyBp
ZiBpdCBhbGwgd2FzIGluIHRoZSBzYW1lIGZpbGUgSU1PLgo+IAo+IHdha2V1cC5TIGlzIHRoZSAx
NmJpdCBlbnRyeSBwb2ludCwgYW5kIGxpdmVzIGluIHRoZSB0cmFtcG9saW5lIGJlbG93IDFNLgo+
IAo+IHdha2V1cF9wcm90LlMgaXMgYSBiaXQgb2YgbG9naWMgd2hpY2ggbGl2ZXMgaW4gdGhlIG1h
aW4gaHlwZXJ2aXNvci4KPiAKPiBUaGUgbmFtaW5nIGNvdWxkIHByb2JhYmx5IGRvIHdpdGggc29t
ZSBpbXByb3ZlbWVudCwgYnV0IHRoZXkgY2FuJ3QKPiBmZWFzaWJseSBiZSBwYXJ0IG9mIHRoZSBz
YW1lIGZpbGUuCgpIbSwgSSdtIG5vdCBzdXJlIEkgZm9sbG93LiBJc24ndCB0aGlzIHRyYW1wb2xp
bmUgY29waWVkIGJ5IFhlbiBpbiBhCnN1aXRhYmxlIHBvc2l0aW9uIGJlbG93IHRoZSAxTSBib3Vu
ZGFyeSwgYW5kIGhlbmNlIGNvdWxkIHVzZSBzeW1ib2xzCmluIG9yZGVyIHRvIGZpZ3VyZSBvdXQg
d2hpY2ggcGFydCB0byBjb3B5PwoKSWU6IGJvdGggdGhlIGxvdyBhbmQgdGhlIGhpZ2ggcGFydCBj
b3VsZCBsaXZlIGluIHRoZSBzYW1lIGZpbGUgYXMgbG9uZwphcyBYZW4ga25vd3MgaG93IHRvIGRp
ZmZlcmVudGlhdGUgdGhvc2UgYW5kIHdoaWNoIGNodW5rIG5lZWRzCnBvc2l0aW9uaW5nIGJlbG93
IDFNPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
