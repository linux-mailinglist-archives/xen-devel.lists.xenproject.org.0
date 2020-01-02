Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB79312E96C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 18:30:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4Fh-00077L-KN; Thu, 02 Jan 2020 17:27:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/dY=2X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1in4Ff-00077E-W7
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 17:27:16 +0000
X-Inumbo-ID: 1e4abb60-2d85-11ea-a3a1-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e4abb60-2d85-11ea-a3a1-12813bfff9fa;
 Thu, 02 Jan 2020 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577986035;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=lvG5mc04lVw3QsuvqgaQAKnSY3A0fmuKBrc1sH+SSKE=;
 b=IqkZ86QzsOjLZYJ3Eg4w6l8cJtMQH0/65uoihWDenj4sSCjEEzEmzb8K
 D6S5Ga9PcUTTGl0q0im+dMZPe2yptjWcUsiooUI4q9tnCW3gi2CqrDRIO
 oOD6VfK1aU0ti6JzUvZW45lJ9YyzHJCAUgSryaymfRFTX1Q6sQarQH5J7 s=;
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
IronPort-SDR: XmvjzV4U64ba8csLnfOYIRlYbUUAwcPuTRejkV39Ht2iNU3xXXxyJxlIik527LmcB2GIpAEqE/
 6bhRW3OcSPXl55JKkp7W1Tl3xJmG+oAIYqCcaf+0zdt6LFWirVFnvahB6UeQQSzYa6RTu8lGvu
 sLF7jvMg17eAaqntOL7AkzG5cjMMWBzDWEmtI8RdwWExcOK0j0HesKPwql8j+OujUPRRlpk+VP
 rGAlFZURKhJRz1/Q1sveTu1dkA7iIKKJc+JAltPBd/FieaMW8gOV4PquMMWPOBeZGt43OTpCuA
 VI4=
X-SBRS: 2.7
X-MesageID: 10976932
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10976932"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24078.10224.157354.511825@mariner.uk.xensource.com>
Date: Thu, 2 Jan 2020 17:27:12 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20191224130416.3570-6-pdurrant@amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
 <20191224130416.3570-6-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 5/6] libxl: allow creation of domains with
 specified or random domid
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCA1LzZdIGxpYnhsOiBhbGxvdyBjcmVhdGlvbiBv
ZiBkb21haW5zIHdpdGggc3BlY2lmaWVkIG9yIHJhbmRvbSBkb21pZCIpOgo+IFRoaXMgcGF0Y2gg
bW9kaWZpZXMgZG9fZG9tYWluX2NyZWF0ZSgpIHRvIHVzZSB0aGUgdmFsdWUgb2YgZG9taWQgdGhh
dCBpcwo+IHBhc3NlZCBpbi4gQSBuZXcgJ3NwZWNpYWwgdmFsdWUnIC0gUkFORE9NX0RPTUlEIC0g
aXMgYWRkZWQgaW50byB0aGUgQVBJCj4gYW5kIHRoaXMsIElOVkFMSURfRE9NSUQgb3IgYW55IHZh
bGlkIGRvbWlkIGlzIHBhc3NlZCB1bm1vZGlmaWVkIHRvCj4gbGlieGxfX2RvbWFpbl9tYWtlKCku
IEFueSBvdGhlciBpbnZhbGlkIGRvbWlkIHZhbHVlIHdpbGwgY2F1c2UgYW4gZXJyb3IuCj4gCj4g
SWYgUkFORE9NX0RPTUlEIGlzIHBhc3NlZCBpbiB0aGVuIGxpYnhsX19kb21haW5fbWFrZSgpIHdp
bGwgdXNlCj4gbGlieGxfX3JhbmRvbV9ieXRlcygpIHRvIGNob29zZSBhIGRvbWlkLiBJZiB0aGUg
Y2hvc2VuIHZhbHVlIGlzIG5vdCBhCj4gdmFsaWQgZG9taWQgdGhlbiB0aGlzIHN0ZXAgd2lsbCBi
ZSByZXBlYXRlZC4gT25jZSBhIHZhbGlkIHZhbHVlIGlzIGNob3Nlbgo+IGl0IHdpbGwgYmUgcGFz
c2VkIHRvIHhjX2RvbWFpbl9jcmVhdGUoKSBidXQgaWYgdGhpcyBmYWlscyB3aXRoIGFuIGVycm5v
Cj4gdmFsdWUgb2YgRUVYSVNULCBhIG5ldyByYW5kb20gdmFsdWUgd2lsbCBiZSBjaG9zZW4gYW5k
IHRoZSBvcGVyYXRpb24gd2lsbAo+IGJlIHJldHJpZWQuCgpXaGF0IGlzIHRoZSB1c2UgY2FzZSBm
b3IgdGhpcyA/CgpJIHRoaW5rIHVzaW5nIHRoaXMgaXMgaGF6YXJkb3VzIGlmIHlvdSBldmVyIGRl
c3Ryb3kgZG9tYWlucywgYmVjYXVzZQppdCB3aWxsIGxlYWQgdG8gcmV1c2Ugb2YgZG9taWRzIGlu
IGNpcmN1bXN0YW5jZXNbMV0gd2hlcmUgcmlnaHQgbm93CnRoYXQgY2FuJ3QgaGFwcGVuLgoKWzFd
IEZld2VyIHRoYW4gfjJeMTYgY3JlYXRpb25zIHBlciBYZW4gYm9vdC4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
