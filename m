Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26737118EC0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 18:18:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iej6E-000539-UB; Tue, 10 Dec 2019 17:15:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mGzE=2A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iej6D-000534-DQ
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 17:15:01 +0000
X-Inumbo-ID: 98804106-1b70-11ea-a1e1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98804106-1b70-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 17:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575998101;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Wp7VT6Nwo0eNBJhJNtobR+okov67OcU3VX1ZZQhVZlE=;
 b=H+BESP+Xmp44ni+6B5NF5HoW39SUWvusi3hwPH4ELohtqeJZeKJNcI7/
 M9TMCjdJGXMFaPNyL3hDccznjcbGUnSntwLRmsQkyLbv6az73jmGYiGtp
 r1g8I8w4gaySadH0AKMVDDrmyvPSBRc+O1mkhPLfEQKfRxwq14P3vkyWq A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tLg7KHBvBz4SzilC0RIMSS54R1wVNfm4UkgxqB+f/rlDlZahZC61uwPV3JQRdws2t2O5yWhnpc
 5eRoVnC6gtrFxGNe9LMmIUmukkt43IML8bxn2xKA2hlDRrgWfGikl4xfqoC4JhD0N0tqxcP31k
 NUvbenJMLtcVkAC0p+lspQMoRWbB+TKI75XSiRs1BLTH3twuhunOVN/fXfKbdsdebNn6hmnBw1
 nY2O27dDE5xZlir37NgeGQLwr7ojht7zF0pBMKHAxjPlDYwlGhM6J8KcxjLvQFhCO1s0niz6N0
 uiY=
X-SBRS: 2.7
X-MesageID: 9604975
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,300,1571716800"; 
   d="scan'208";a="9604975"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24047.53904.744736.527245@mariner.uk.xensource.com>
Date: Tue, 10 Dec 2019 17:14:56 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <4a48cd59-86a3-ef7a-7b45-5e9b982dab2a@suse.com>
References: <osstest-144645-mainreport@xen.org>
 <4a48cd59-86a3-ef7a-7b45-5e9b982dab2a@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] baroque0 (was Re: [xen-4.13-testing test] 144645:
 trouble: broken/fail/pass)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW3hlbi00LjEzLXRlc3Rpbmcg
dGVzdF0gMTQ0NjQ1OiB0cm91YmxlOiBicm9rZW4vZmFpbC9wYXNzIik6Cj4gT24gMTAuMTIuMTkg
MTA6MDYsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiA+IGZsaWdodCAxNDQ2NDUgeGVu
LTQuMTMtdGVzdGluZyByZWFsIFtyZWFsXQo+ID4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NDY0NS8KPiAKPiBTb21ldGhpbmcgd3Jvbmcgd2l0aCBi
YXJvcXVlMD8KPiAKPiBJYW4sIGNhbiB5b3UgcGxlYXNlIGNoZWNrIEFTQVA/CgpJIGhhdmUgdW5i
bGVzc2VkIGl0LiAgSXQgc2VlbXMgZGVhZC4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
