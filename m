Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C8E64C61
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 20:47:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlHaH-0002f1-WA; Wed, 10 Jul 2019 18:44:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RMCl=VH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hlHaG-0002ew-T0
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 18:44:52 +0000
X-Inumbo-ID: cc810bb4-a342-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc810bb4-a342-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 18:44:50 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AE3sk2bEhy5TDt+xdSBOsG+wjy775+IBrQPlT+1BP1yIKlidb3beHMSlxwdu4xaTt+yR1cZ+lf
 XqvSKH0Gc8R3hO/nM0DGJ5tRRcni93L6VWI2U+e85xlbZ+OFYYD62cRVjneEgI88tpAFnpMQzB
 AtVy2mMQiSXZZ3yyha8vAllpZAlgBR/t1YQhxgzYVPjrDeU4ZAnotYUAjdSquVP9wPsNXRXdyj
 Up21aLjMkUb1nrGVWvYLJ4ZRvWJ9t6Wl6fZc1vLCU29jbPDDxhRR4MCgDtO5XiIpSgL4zsZDeq
 kGg=
X-SBRS: 2.7
X-MesageID: 2841634
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,475,1557201600"; 
   d="scan'208";a="2841634"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23846.12792.575466.223687@mariner.uk.xensource.com>
Date: Wed, 10 Jul 2019 19:44:08 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20190627082834.ge2gr3lljjnomug5@MacBook-Air-de-Roger.local>
References: <20190626133726.29896-1-jgross@suse.com>
 <20190627082834.ge2gr3lljjnomug5@MacBook-Air-de-Roger.local>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxl: fix pci device re-assigning after
 domain reboot
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIGxpYnhsOiBm
aXggcGNpIGRldmljZSByZS1hc3NpZ25pbmcgYWZ0ZXIgZG9tYWluIHJlYm9vdCIpOgo+IE9uIFdl
ZCwgSnVuIDI2LCAyMDE5IGF0IDAzOjM3OjI2UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gPiBU
ZXN0ZWQtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKQ29tbWl0dGVkLCB0aGFu
a3MuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
