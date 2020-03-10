Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A5C18045B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 18:07:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBiJG-00047d-PC; Tue, 10 Mar 2020 17:04:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GePR=43=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jBiJF-00047T-PX
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 17:04:49 +0000
X-Inumbo-ID: 3ed54c6e-62f1-11ea-a6c1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ed54c6e-62f1-11ea-a6c1-bc764e2007e4;
 Tue, 10 Mar 2020 17:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583859888;
 h=to:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=ftkyZ9BIXuXK5LiUFKg7jHugZJNAlZpQW4qf3rllPTA=;
 b=argKDBJJck7lNQ6vS/ucPdlPv6S3iLetvTnG1ScKe5PXIjRwL5UW952E
 s/fDfAMm93IkaJgJUx2e2feKSJ8/KaoHuf3KjXcj1rS+X0AalNIbv41PV
 qKXZaOGilJ1Ax9CTlpKoX3gr3y5RjB148M47UM2lw+hECTXhl7Llgtl+E Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Jkij7hekP5j92wQlHaT1LWpkJoMsgxNuGAiF69DujpDbxqRKYOtfH+hY1kX9ZOuCip9zpUED+V
 H8zuWNd8J/QdCD7BST6QI0vyIPI9hIYKOPKMGrof4ckKs2+I8qxX8eQk37Uo7mdc/YR9IAXVT0
 sv0pM9pc+N8QZ55FB6CRzhqqaWRQKdDHKZSNOn5yeCoEbtbK+7wBfJS8RXoDv1mlynQq75f5+S
 gS9T4fEOK6FL2mVwztA6dPtFiUTS11iEWrSPLElxzSmCuOvYFfIl481DJOwsQgxiXWQ+7O8PWe
 QKA=
X-SBRS: 2.7
X-MesageID: 13721417
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,537,1574139600"; d="scan'208";a="13721417"
To: xen-devel <xen-devel@lists.xenproject.org>, <xen-announce@lists.xen.org>, 
 <xen-users@lists.xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e3651b9f-9519-efaa-8535-16ad4c1c8946@citrix.com>
Date: Tue, 10 Mar 2020 17:04:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: [Xen-devel] Note concerning CVE-2020-0550 Snoop-assisted L1D
 sampling
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U25vb3AtYXNzaXN0ZWQgTDFEIFNhbXBsaW5nIGlzIGEgc3BlY3VsYXRpdmUgc2lkZSBjaGFubmVs
IHdoZXJlIGFuCmF0dGFja2VyIGNhbiByZWFkIHRoZSBjb250ZW50cyBvZiBhIGRpcnR5IGNhY2hl
IGxpbmUgd2hlbiB0aGUgY2FjaGUgbGluZQppcyByZWFkIGJ5IGFub3RoZXIgQ1BVLgoKRm9yIHRo
ZSBleGFjdCBjeWNsZSB3aGVyZSBhIFNub29wIFJlc3BvbnNlIGlzIGJlaW5nIGNvbnN0cnVjdGVk
IGZvciBhCmRpcnR5IGNhY2hlIGxpbmUsIGEgZmF1bHRpbmcvYXNzaXN0aW5nIGxvYWQgbWF5IGJl
IGZvcndhcmRlZCBkYXRhIGZyb20KdGhlIGNhY2hlIGxpbmUuCgpTZWUKaHR0cHM6Ly9zb2Z0d2Fy
ZS5pbnRlbC5jb20vc2VjdXJpdHktc29mdHdhcmUtZ3VpZGFuY2UvaW5zaWdodHMvZGVlcC1kaXZl
LXNub29wLWFzc2lzdGVkLWwxLWRhdGEtc2FtcGxpbmcKZm9yIGZ1cnRoZXIgZGV0YWlscy4KClRo
ZXJlIGFyZSBubyBwbGFubmVkIG1pdGlnYXRpb25zLCBvd2luZyB0byB0aGUgY29tcGxleGl0eSBv
ZiBvYnRhaW5pbmcKZGF0YSBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCB0aGUgaW1wbGF1c2libGUg
c2NlbmFyaW8gYW4gYXR0YWNrZXIgd291bGQKaGF2ZSB0byBiZSBpbiB0byBleHBsb2l0IHRoaXMu
CgpOb3RlOiBUaGlzIGlzc3VlIHNob3VsZCBub3QgYmUgY29uZnVzZWQgd2l0aCBwcmV2aW91c2x5
IGRpc2Nsb3NlZApDVkUtMjAyMC0wNDQ5IEwxRCBFdmljdGlvbiBTYW1wbGluZy4KCn5BbmRyZXcs
Ck9uIGJlaGFsZiBvZiB0aGUgWGVuIFNlY3VyaXR5IFRlYW0KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
