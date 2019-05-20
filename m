Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E4D238CE
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 15:53:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSih4-0003fS-9p; Mon, 20 May 2019 13:51:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSih3-0003fN-67
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 13:51:09 +0000
X-Inumbo-ID: 4f98e50c-7b06-11e9-94df-6b512a16e8d0
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f98e50c-7b06-11e9-94df-6b512a16e8d0;
 Mon, 20 May 2019 13:51:05 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: TJ47RiZoo4+cFgtgkgZUoisDTBFC2dx12EUXXmH5/hUWMshh2FrLc4/DQyKA4HI63Ek940z8Bq
 YigCTCMNgynm9jVLI3f11I6h3BWd6bKR5QfxSZxN8SZqg2IJzXYoTrus8ipGY1kZ98/qLftzh9
 nHtkJ4+LZpGdsmjYW40k4bpkDpvOmwv7Ccugn3MvRx2/4qDvjX79Xb8/tCTm+AmAUIvtjEuzoZ
 9vw7yDLGkmubCl6GsAKp3pEmMhruXJ7K/4Z1W7WXoDWWgnlQvmhYJrpOYG3paSbmqUPkZahxso
 veE=
X-SBRS: 2.7
X-MesageID: 638978
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="638978"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23778.45224.28897.55507@mariner.uk.xensource.com>
Date: Mon, 20 May 2019 14:50:32 +0100
To: Wei Liu <wei.liu2@citrix.com>
In-Reply-To: <20190517170555.17423-1-wei.liu2@citrix.com>
References: <20190517170555.17423-1-wei.liu2@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxl: fix libxl_domain_need_memory after
 899433f149d
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Olaf Hering <olaf@aepfle.de>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhsOiBmaXggbGlieGxfZG9tYWluX25lZWRfbWVt
b3J5IGFmdGVyIDg5OTQzM2YxNDlkIik6Cj4gQWZ0ZXIgODk5NDMzZjE0OWQgbGlieGwgbmVlZHMg
dG8ga25vdyB0aGUgY29udGVudCBvZiBkX2NvbmZpZyB0bwo+IGRldGVybWluZSB3aGljaCBRRU1V
IGlzIHVzZWQuIFRoZSBjb2RlIGlzIGNoYW5nZWQgc3VjaCB0aGF0Cj4gbGlieGxfX2RvbWFpbl9z
ZXRfZGV2aWNlX21vZGVsIG5lZWRzIHRvIGJlIGNhbGxlZCBiZWZvcmUKPiBsaWJ4bF9fZG9tYWlu
X2J1aWxkX2luZm9fc2V0ZGVmYXVsdC4KPiAKPiBUaGlzIGlzIGZpbmUgZm9yIGxpYnhsIGNvZGUs
IGJ1dCBpdCBpcyBwcm9ibGVtYXRpYyBmb3IKPiBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnksIHdo
aWNoIGlzIHRoZSBvbmx5IHB1YmxpYyBBUEkgdGhhdCB0YWtlcyBhCj4gYnVpbGRfaW5mby4gVG8g
YXZvaWQgYnJlYWsgaXRzIHVzZXJzLCBwcm92aWRlIGEgY29tcGF0aWJpbGl0eSBzZXR0aW5nCj4g
aW5zaWRlIHRoYXQgZnVuY3Rpb24uCgpUaGlzIGxvb2tzIHBsYXVzaWJsZSB0byBtZS4gIEkgc2Vl
IHRoYXQgdGhpcyBmdW5jdGlvbiBhbHJlYWR5IG1ha2VzIGEKY29weSBvZiB0aGUgYl9pbmZvLCBz
byB3ZSBkbyBub3QgZW5kIHVwIGFjY2lkZW50YWxseSBsZWFraW5nIHRoaXMgbmV3CmRlZmF1bHQg
c2V0dGluZyB0byB0aGUgY2FsbGVyLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
