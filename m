Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20CB17BFA3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:55:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADP8-00075T-HG; Fri, 06 Mar 2020 13:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/xUX=4X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jADP6-00075I-QM
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:52:40 +0000
X-Inumbo-ID: be703030-5fb1-11ea-a7d9-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be703030-5fb1-11ea-a7d9-12813bfff9fa;
 Fri, 06 Mar 2020 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583502759;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=wLymFjc28Qjm1hKE/HIPEGLWgMZoBVUIP2D1yreQn2A=;
 b=VEqO+9irXJ4WRAy9Ksk1Jchi5gRqFtfuUBgoicasBaTRZxceu35s59tY
 CzsLqWmQA9cdjRWq3Ryb8yX0i1TMlBEdqMoEAXqcdDnUfA5eGFec5eQG7
 leRcq3qnuIBmZEW7Ij6GQETHYTTmArLuC95ohXuyZwI5DMMEkJfZiBKch A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: d2QdlTcvOMxphBzoXSd/EAauRCr3ya4XpT2BnYNwAZjlqCFiVCE6PrOwCFCSLWHDI1F299rTUV
 Ui1wybCNuvYA+Dfj1aH2Xu2gT8oiH+O1exE/p5jwFxZD8a1wexXy6MwUeKORC95hzWx53eSOHl
 iAYzeRQcxleveK8j/mL6/EzU+hAYFQjhHN3G6G6FpjTfMwKgv67UwOAFoS5lyy+oCUcIVm4PE2
 klZxKRbAtQWPhggA+S3AomAek438FL7EYAhBO1mdm+5UDRrc7S7+3HvbtXB3Aqf+NeTqF/O1IZ
 GVE=
X-SBRS: 2.7
X-MesageID: 13953771
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,522,1574139600"; d="scan'208";a="13953771"
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <352f0b08-d869-1d57-a357-246574cb9b55@citrix.com>
Date: Fri, 6 Mar 2020 13:52:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: [Xen-devel] Backports to 4.13
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpZb3UndmUgcmVjZW50bHkgYmFja3BvcnRlZCAzMjhkZDIzOGRhICJ4ODYvc217ZSwg
YX1wOiBkbyBub3QgZW5hYmxlClNNRVAvU01BUCBpbiBQViBzaGltIGJ5IGRlZmF1bHQgb24gQU1E
IiwgYnV0IGhhdmUgbWlzc2VkIDVkZTk2MWQ5YzA5NwoieDg2OiBkbyBub3QgZW5hYmxlIGdsb2Jh
bCBwYWdlcyB3aGVuIHZpcnR1YWxpemVkIG9uIEFNRCBvciBIeWdvbgpoYXJkd2FyZSIgYW5kIGIw
NDE3MDljMzY5YiAieDg2L3B2OiBGaXggYGdsb2JhbC1wYWdlc2AgdG8gbWF0Y2ggdGhlCmRvY3Vt
ZW50YXRpb24iLgoKVGhlIGZvcm1lciBpcyBwcmV0dHkgdXNlbGVzcyB3aXRob3V0IHRoZSBvdGhl
ciB0d28sIGJlY2F1c2UgeW91J3JlCnRha2luZyBvdXQgdGhlIHNlY3VyaXR5IGZlYXR1cmUgd2l0
aG91dCBnYWluaW5nIHRoZSBtYWpvcml0eSBwZXJmb3JtYW5jZQp3aW4gZnJvbSBhdm9pZGluZyBW
TWV4aXRzIGR1ZSB0byBDUjQgdHJhcHMuCgpEZXBlbmRpbmcgb24gdGhlIHZpZXcgb2Ygb3RoZXIg
UFYgc2hpbSB1c2FiaWxpdHkgaXNzdWVzLCA2ZGQ5NWIwMmVhMjcKYW5kIGY5ZGVlMWY5NDVlYiBy
ZWdhcmRpbmcgdnRzYyBtYWtlIGEgbGFyZ2UgZGlmZmVyZW5jZSBhbmQgc2hvdWxkIGJlCmNvbnNp
ZGVyZWQuCgplMmQxMjU0ZjVhZjIgaXMgYSBidWdmaXggd2hpY2ggbmVlZHMgYmFja3BvcnRpbmcg
dG8gZml4IEFNRCBTMyBhbmQKa2V4ZWMsIGFzIHdlbGwgYXMgcHYgc2hpbS4KCjE4OGY0NzlkZTRi
NyBhbmQgMDA1ZGU0NWM4ODdlIGFyZSBib3RoIGNvcmUgc2NoZWR1bGluZyBidWdmaXhlcyBhbmQK
c2hvdWxkIGJlIGNvbnNpZGVyZWQsIGV2ZW4gaWYgdGhleSBhcmUgYSBsaXR0bGUgdG9vIGZyZXNo
IHJpZ2h0IGF0IHRoZQptb21lbnQuCgoKT24gdGhlIHRvb2xzIHNpZGUgb2YgdGhpbmdzLCBmNTBh
NGY2ZTI0NGMgYWFmYWUwZTgwMGU5IDJhNjJjMjI3MTViZgpkNzljYzZiYzJiYWMgMDcyOTgzMGNj
NDI1IGFyZSBhbGwgYnVncyBpbiBDUFVJRCBhbmQvb3IgbWlncmF0aW9uLsKgICJGaXgKSFZNX1BB
UkFNX1BBRV9FTkFCTEVEIGhhbmRsaW5nIiBpcyBvbmx5IGZvciA0LjEzLCB3aGVyZWFzIGFsbCB0
aGUgb3RoZXJzCmFyZSBiYWNrIHRvIDQuNyAodGVjaG5pY2FsbHkgc3BlYWtpbmcpLgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
