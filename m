Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30816BE46
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 11:08:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6X5K-0007AU-Ru; Tue, 25 Feb 2020 10:05:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UvFY=4N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6X5J-0007AP-AP
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 10:05:01 +0000
X-Inumbo-ID: 48a0a626-57b6-11ea-8cb6-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48a0a626-57b6-11ea-8cb6-bc764e2007e4;
 Tue, 25 Feb 2020 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582625100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gKryRObg5FssELQMuZ4RNoCNRqGN+o3fKs1LkJ1U1i8=;
 b=ChtGysjiwCFVZuXMyCLFWt7K26PEfrF7EudrJ2g8G1N+ZN1AL256qQ7K
 I6ML6xPOnk9ZkDOd9AMjW1B8cHmzkCOZds5KtLZcViJ1bBp/Vnro1AXHc
 O292dPLwF8LCnooWDSPVMvjdXFryYcrsuKIbdULREpIde1GYxsFe42enM 0=;
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
IronPort-SDR: DdVpi6p0zY18v03gg7WRMscsIsmaXV51k4kASKcypqsHr2xw9638UnGTASydDIBVMq1qkrHCEh
 LVvJdnx0J/w7kw83lIYbr0QVc7MqBipPpPuELLPJw5OwUXxE3SSMJtK3PPbawJMQ6Q5vWOCjdS
 iMEqTUQXRXyeLyUUEybZpurELhsdILoHR/DSYLFuIuo3E+ODNcwLCe6O9ZZjU6FeoVtd7jRkgt
 EVb6EnAxIjcpEubVmyOy3bPv3eIAh3/t1fpM1TnObchYRhGoQO2beZkmD1+xHJ5xdQ1MFgnV2R
 tVU=
X-SBRS: 2.7
X-MesageID: 13391715
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,483,1574139600"; d="scan'208";a="13391715"
Date: Tue, 25 Feb 2020 11:04:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Message-ID: <20200225100452.GA4679@Air-de-Roger>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTA6NDk6MjFBTSAtMDgwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IFZNIGZvcmtpbmcgaXMgdGhlIHByb2Nlc3Mgb2YgY3JlYXRpbmcgYSBkb21haW4g
d2l0aCBhbiBlbXB0eSBtZW1vcnkgc3BhY2UgYW5kIGEKPiBwYXJlbnQgZG9tYWluIHNwZWNpZmll
ZCBmcm9tIHdoaWNoIHRvIHBvcHVsYXRlIHRoZSBtZW1vcnkgd2hlbiBuZWNlc3NhcnkuIEZvcgo+
IHRoZSBuZXcgZG9tYWluIHRvIGJlIGZ1bmN0aW9uYWwgdGhlIFZNIHN0YXRlIGlzIGNvcGllZCBv
dmVyIGFzIHBhcnQgb2YgdGhlIGZvcmsKPiBvcGVyYXRpb24gKEhWTSBwYXJhbXMsIGhhcCBhbGxv
Y2F0aW9uLCBldGMpLgoKSSd2ZSBqdXN0IHJlYWxpemVkIHRoYXQgSSdtIG5vdCBzdXJlIGhvdyBh
cmUgc3BlY2lhbCBwYWdlcyBoYW5kbGVkLAp3aGF0IGhhcHBlbnMgdG8gdGhlIHhlbnN0b3JlLCBj
b25zb2xlLCBzaGFyZWQgaW5mbyBwYWdlcywgb3IgdGhlCnZjcHUgaW5mbyBwYWdlcyBpZiB0aGUg
cGFyZW50IGhhcyB0aG9zZSByZWdpc3RlcmVkPwoKQWxzbywgd2hhdCBoYXBwZW5zIHRvIHBhZ2Vz
IHRoYXQgYXJlIGJlaW5nIHVzZWQgZm9yIERNQSB3aXRoIGVtdWxhdGVkCmRldmljZXM/IFdpbGwg
UUVNVSBmb3JlaWduIG1hcHBpbmdzIGFsc28gdHJpZ2dlciB0aGUgcG9wdWxhdGUgb24KZGVtYW5k
IHJvdXRpbmUsIHNvIHRoYXQgZXh0ZXJuYWwgZW11bGF0b3JzIGNhbiBhY2Nlc3MgdGhvc2U/CgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
