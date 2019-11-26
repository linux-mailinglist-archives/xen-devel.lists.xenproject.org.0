Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BED10A0F4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:08:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcPg-000559-GC; Tue, 26 Nov 2019 15:06:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xtMf=ZS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iZcPf-000552-57
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:05:59 +0000
X-Inumbo-ID: 40493b4a-105e-11ea-a3a3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40493b4a-105e-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574780758;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=2bWWIeCReWZK+51cWVbKQwVIPjDqG4vq5MOmFQf/Z2M=;
 b=TFKKEyW2w06d1017uBoY6bIagg934/FCdDefxOvSgijrUFsUgw9ZKyXo
 p8wDmNghk1SptK7N05Zz3C0T7kvrs1sRLoVnovJjgqKQ5EL6Ohd7R7p3T
 5M3mesznnRgDCBbatxKpZs7j6uFox6F1NJkvY9iMnDPDujdCSOXXmbEr6 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CL9p5YmMajzO/+21pid27dpX6KTxCfJAjYI3Oino7bWwetrq7IQj0WWwKBcDfU0rljrvrzFuYh
 tQaYU6YZnCw3kow4ldL0D9EVitQgBYtNSY1+fq0ZY8DQp0M6ZkDmGJSEfns2iyIoLe7c4SCvJ+
 ujORNPZlJmSaDnF154kO9a1JqPXcDzEbYTEfN5DWNr4qtN4b+8RorzVV/3iIFK5qAI/McbSpUD
 Zu//n/Zoa5svYtLKT39OZPVZa+9hSp4SyoONdvDYUv9Ekc312kNUxbRIHR4r+PEzAE+CiprlQb
 11Q=
X-SBRS: 2.7
X-MesageID: 9400342
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9400342"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24029.16211.130373.861346@mariner.uk.xensource.com>
Date: Tue, 26 Nov 2019 15:05:55 +0000
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>, Juergen Gross
 <jgross@suse.com>
In-Reply-To: <24029.16141.74013.802354@mariner.uk.xensource.com>
References: <20191126141026.2858622-1-george.dunlap@citrix.com>
 <24029.13124.935192.209484@mariner.uk.xensource.com>
 <afd686bc-27fa-adbf-910d-75ef8cb5ab40@citrix.com>
 <24029.16141.74013.802354@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable
 state
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

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCBmb3ItNC4xM10gZG9jcy94bDogRG9jdW1l
bnQgcGNpLWFzc2lnbmFibGUgc3RhdGUiKToKPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIlJlOiBb
UEFUQ0ggZm9yLTQuMTNdIGRvY3MveGw6IERvY3VtZW50IHBjaS1hc3NpZ25hYmxlIHN0YXRlIik6
Cj4gPiBJIGtpbmQgb2YgZmVlbCBsaWtlIHRoZSBkaXNjdXNzaW9uIG9mIHRoZSBzZWN1cml0eSBy
aXNrcyBpbmhlcmVudCBpbiBwY2kKPiA+IHBhc3N0aHJvdWdoIGJlbG9uZyBpbiBhIHNlcGFyYXRl
IGRvY3VtZW50LCBidXQgcGVyaGFwcyBhIGJyaWVmIG1lbnRpb24KPiA+IGhlcmUgd291bGQgYmUg
aGVscGZ1bC4gIFBlcmhhcHMgdGhlIGZvbGxvd2luZz8KPiA+IAo+ID4gIkFzIGFsd2F5cywgdGhp
cyBzaG91bGQgb25seSBiZSBkb25lIGlmIHlvdSB0cnVzdCB0aGUgZ3Vlc3QsIG9yIGFyZQo+ID4g
Y29uZmlkZW50IHRoYXQgdGhlIHBhcnRpY3VsYXIgZGV2aWNlIHlvdSdyZSByZS1hc3NpZ25pbmcg
dG8gZG9tMCB3aWxsCj4gPiBjYW5jZWwgYWxsIGluLWZsaWdodCBETUEgb24gRkxSLiIKPiAKPiBT
R1RNLgo+IAo+IEkgbGlrZSAiYXMgYWx3YXlzIiB3aGljaCBjbGVhcmx5IHNpZ25hbHMgdGhhdCB0
aGlzIGlzIGEgbW9yZSBnZW5lcmFsCj4gcHJvYmxlbSB3aXRob3V0IHJlcXVpcmluZyB1cyB0byBh
Y3R1YWxseSB3cml0ZSB0aGF0IG90aGVyCj4gY29tcHJlaGVuc2l2ZSBkb2N1bWVudC4uLgoKUmVz
ZW5kaW5nIHdpdGggUGF1bCdzIG5ldyBhZGRyZXNzLgoKSWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
