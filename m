Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E52104F17
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 10:19:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXias-0006v1-GW; Thu, 21 Nov 2019 09:17:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uFN=ZN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXiar-0006uw-97
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 09:17:41 +0000
X-Inumbo-ID: c38a80eb-0c3f-11ea-a326-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c38a80eb-0c3f-11ea-a326-12813bfff9fa;
 Thu, 21 Nov 2019 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574327860;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9nwOHtLeeUDnj6596k4yNsMv5ejQOdI8tvSYlFBH0kk=;
 b=Ug8sHhYVufNSpPavhAesNSo3mhmlGW5NOB0PIxuvu7XynLZNwOoAcMvA
 gZ35Fu3oC7x7HdjER5M8ChWYZQZtrL/9mj/yh/E0wTs5U3gtXgfjJ5uY1
 MaaOy1OyyqSsACD59D7lk4aZK99mmyysaAN6CCkynhaEVSPkBNq3iHC74 8=;
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
IronPort-SDR: dMy+0mu9x6hxYYzYjTHwY2Ug4dO4GXJGuGeBC+fmrqKWshDK6aevJeIBa4dKduJYT1rsvxbi/Z
 cZEQd8GfEtU4tg9veetIoGKzcI2VUDbGBa/SO/6xicwHLrUsydnQ2HPeqQ57XG+I56UJxqbKrO
 BtOCES2DAs3giIFHPc1aJN7IcoZw0pgD0Mh5avTiJWGn3fB898jLyf6SBB3kX46mHcKExDhCpk
 1GJjWSWFtYRl5ESUQrv1L4Pqg2qIFHGBWbk2ub8D7W6vSLanWUZS0/863Kp7F+KmmEeSKLX6At
 0GY=
X-SBRS: 2.7
X-MesageID: 8639550
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,224,1571716800"; 
   d="scan'208";a="8639550"
Date: Thu, 21 Nov 2019 10:17:08 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20191121091708.GQ72134@Air-de-Roger>
References: <20191120173920.8705-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120173920.8705-1-roger.pau@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vlapic: allow setting
 APIC_SPIV_FOCUS_DISABLED in x2APIC mode
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDY6Mzk6MjBQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+ICAgICAgY2FzZSBBUElDX1NQSVY6Cj4gICAgICAgICAgaWYgKCBtc3JfY29udGVu
dCAmIH4oQVBJQ19WRUNUT1JfTUFTSyB8IEFQSUNfU1BJVl9BUElDX0VOQUJMRUQgfAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICogQVBJQ19TUElWX0ZPQ1VTX0RJU0FCTEVEIGlzIG5vdCBzdXBwb3J0ZWQgb24KCnMvbm90
IHN1cHBvcnRlZC9yZXNlcnZlZC8gd291bGQgYmUgYmV0dGVyIEkgdGhpbmsuCgpSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
