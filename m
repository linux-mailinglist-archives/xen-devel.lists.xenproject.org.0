Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8B183428
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 16:11:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPSI-0003D8-Pq; Thu, 12 Mar 2020 15:09:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCPSH-0003D3-8W
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 15:09:01 +0000
X-Inumbo-ID: 6718c81c-6473-11ea-a6c1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6718c81c-6473-11ea-a6c1-bc764e2007e4;
 Thu, 12 Mar 2020 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584025740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2ICx6WeHa9K0aLSt2biKkr+LXt5PKy+JOO/iwqH/U7s=;
 b=YYYyBMH5/h+VJOQvcmEo8r5/opctzJcCARD8gQ8o/QDidYycm1OJLClN
 4lW5ylIHMKm17dj19LvTAVOxXSvfWiNut737bKl5/dpKt5n5E5noEvEID
 45Cf5SaO7fuFiKdgmdI7zCL2F2Kv0O0Fzoi6tKNT/g++vKCp07l1VAmRy M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: y5Q8aQePjcnL/fJYknY/dNi0OVzYKXY74v9up2hvv2J9D01ETy7MLkYphO4xi8Usposcmtua+6
 ChSwNnHQKmj1irIi0yapW6XV/tZV9KTGqNh0doCB0USREYq0FsGqacxZO2xaUJtVK2Z9zNhbv/
 90ltXHJYzR//pEU3fd03kNPAfID0c9+LyJLipaXYCGU/TvJSzDCJZ5ijXnZ5TdggPySBaXhYbS
 n/gidnsUh96QV0syWpwMTVSn74gY29FDRKBIe4fCKvmE1V3Qrq+BDbzAo9TAw+upW5kiYjNWKU
 6hg=
X-SBRS: 2.7
X-MesageID: 14479205
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14479205"
Date: Thu, 12 Mar 2020 16:08:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Message-ID: <20200312150852.GK24458@Air-de-Roger.citrite.net>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158402056376.753.7091379488590272336.stgit@Palanthas>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 0/2] xen: credit2: fix vcpu starvation due
 to too few credits
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Glen <glenbarney@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Sarah Newman <srn@prgmr.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcywgc2VlbXMgbGlrZSBhIHNwZWNpYWxseSB0cmlj
a3kgaXNzdWUgdG8KdGFja2xlIQoKT24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDI6NDQ6MDdQTSAr
MDEwMCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6ClsuLi5dCj4gRm9yIGV4YW1wbGUsIEkgaGF2ZSBh
IHRyYWNlIHNob3dpbmcgdGhhdCBjc2NoZWQyX3NjaGVkdWxlKCkgaXMgaW52b2tlZCBhdAo+IHQ9
NTc5NzA3NDYxNTVucy4gQXQgdD01Nzk3MDc0NzY1OG5zICgrMTUwM25zKSB0aGUgc190aW1lciBp
cyBzZXQgdG8KPiBmaXJlIGF0IHQ9NTc5Nzk0ODUwODNucywgaS5lLiwgODczODkyOG5zIGluIGZ1
dHVyZS4gVGhhdCdzIGJlY2F1c2UgY3JlZGl0Cj4gb2Ygc25leHQgaXMgZXhhY3RseSB0aGF0IDg3
Mzg5Mjhucy4gVGhlbiwgd2hhdCBJIHNlZSBpcyB0aGF0IHRoZSBuZXh0Cj4gY2FsbCB0byBidXJu
X2NyZWRpdHMoKSwgY29taW5nIGZyb20gY3NjaGVkMl9zY2hlZHVsZSgpIGZvciB0aGUgc2FtZSB2
Q1BVCj4gaGFwcGVucyBhdCB0PTYwMDgzMjgzNjE3bnMuIFRoYXQgaXMgKmEgbG90KiAoMjEwMzc5
ODUzNG5zKSBsYXRlciB0aGFuCj4gd2hlbiB3ZSBleHBlY3RlZCBhbmQgYXNrZWQuIE9mIGNvdXJz
ZSwgdGhhdCBhbHNvIG1lYW5zIHRoYXQgZGVsdGEgaXMKPiAyMTEyNTM3NDYybnMsIGFuZCB0aGVy
ZWZvcmUgY3JlZGl0cyB3aWxsIHNpbmsgdG8gLTIxMDM3OTg1MzQhCgpXaGljaCB0aW1lciBkb2Vz
IHRoaXMgaGFyZHdhcmUgdXNlPyBEWUsgaWYgdGhlcmUncyBzb21lIHJlbGF0aW9uCmJldHdlZW4g
dGhlIHRpbWVyIGhhcmR3YXJlIHVzZWQgYW5kIHRoZSBpc3N1ZT8KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
