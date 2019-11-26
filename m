Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4201A10A248
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:38:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZdow-0006g5-8D; Tue, 26 Nov 2019 16:36:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up47=ZS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZdot-0006fz-VG
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:36:08 +0000
X-Inumbo-ID: d5a8adcc-106a-11ea-a3a5-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5a8adcc-106a-11ea-a3a5-12813bfff9fa;
 Tue, 26 Nov 2019 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574786163;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UuaDHuVTFJjNAy428wwvUXT07+EJ3fKOC+J9iKr5yzQ=;
 b=Gr/wbGUQSBLK8mVv6Uh2KTJMbQXgBS9TiCRoDAQlhJhIHNtQWTHls8sL
 7eqRKP1tNCClK0J0LWppDBqNejmcqAGh0oP1b/pUx4yipcHLB4AGLEYA5
 8ejWKpYbfGwhhc8yLF7rbHcWANU+RoRrd/wIi/QxKWLYwzRG0WAXYIuWV A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +dmd9pe/R5P4UQImP16d5SNLlPhqKX+j7XccQ3D03fi7VghePvE1Lzcg0X967TucuOGLYUP4NN
 ElYfDtY20rS71WcRkeE1hqCPjw28eRf++fAaLffO7Wy0CdaPa12vhF6XORyXmXjlY9VTklDu2y
 ooXsvH+UtuPhtPACkse93fX/9c5AXjhM09npJj3fJWrlK7d3huOgXgb0Telv+gSyPR7z0UoBJF
 zkAl1qPzDXIHH6DDfGBc/q91bgMbNKMSEZO4fl5nr4uZBX2UlmGC9FHBVzFHVofZSgmpS4PcTk
 ea8=
X-SBRS: 2.7
X-MesageID: 8856121
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="8856121"
Date: Tue, 26 Nov 2019 17:35:51 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20191126163551.GG980@Air-de-Roger>
References: <20191126132648.6917-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126132648.6917-1-roger.pau@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 0/2] x86/vmx: posted interrupt
 fixes
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDI6MjY6NDZQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEhlbGxvLAo+IAo+IFRoZSBmb2xsb3dpbmcgc2VyaWVzIGFpbSB0byBzb2x2ZSB0
aGUgaXNzdWUgcmVwb3J0ZWQgYnkgSm9lIEppbiByZWxhdGVkCj4gdG8gcG9zdGVkIGludGVycnVw
dHMuCgpSZWdhcmRpbmcgdGhlIHJlbGVhc2UgYmxvY2tlcnMgZW1haWwsIGFuZCB0aGUgcXVhbGlm
aWNhdGlvbiBvZiB0aGlzCnNlcmllczoKCiAtIGEgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIHNpbmNl
IDQuMTIKClRoaXMgaXMgbm90IGEgcmVncmVzc2lvbiwgc2luY2UgQUZBSUNUIHRoZSBwb3N0ZWQg
aW50ZXJydXB0IGNvZGUgaGFzCmFsd2F5cyBiZWVuIGxpa2UgdGhpcy4KCiAtIGEgc2V2ZXJlIGJ1
ZyBvZiBhIDQuMTMgZmVhdHVyZQoKVGhlIGJ1ZyBzZWVtcyB0byBpbXBhY3QgcGVvcGxlIHVzaW5n
IFBDSS1wYXNzdGhyb3VnaCBvbiBJbnRlbCBoYXJkd2FyZQp0aGF0IHN1cHBvcnRzIHBvc3RlZCBp
bnRlcnJ1cHRzIChha2EgQVBJQ3YpLiBJbiBteSBvcGluaW9uLCB3ZSBlaXRoZXIKZml4IGl0IG9y
IGRpc2FibGUgQVBJQ3YgYnkgZGVmYXVsdCAobm93IGl0J3MgY3VycmVudGx5IGVuYWJsZWQgYnkK
ZGVmYXVsdCkuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
