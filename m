Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF612F738
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:27:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inL5G-0003Yy-T5; Fri, 03 Jan 2020 11:25:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pquE=2Y=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1inL5F-0003Yt-M3
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:25:37 +0000
X-Inumbo-ID: c357f0a0-2e1b-11ea-a452-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c357f0a0-2e1b-11ea-a452-12813bfff9fa;
 Fri, 03 Jan 2020 11:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578050736;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=TfqhNE0iO3eIq7ttAIfv8BQB9TgDGECsrGqcyVSDOLc=;
 b=PpxPPZzXyrqfUQ0RlBDtN/6tWiJVi4uSba9m8J9qtAtcY0P1NlVzCOWy
 uPsNfram/jHlfiP9f0JLq2WEIyjEETMUPqFV6thba07Ke6iNPfp5Q9Rk3
 m5NfDbiw9U5qsIHu/50ejjD6DmgYlSuLUKVh5bkn98qKUgyvL+puNuhAf U=;
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
IronPort-SDR: F4K54w+bzcvm3V/wQ1XZCt3Xug92QNNv+JPtNPwDC3tnmNo798ZvQIRjFkuiYHbiQp0bDAc0Ie
 hfXbS/1oDZ3jee++j3/6zyQX8Qjntnuw8siO37pjH05s0fkIrCCSbykLQzkqxwyMxlwkYaUkkJ
 xtF5i1qlF0L4RtgHNE3lSnA3szkxyU8N/IYfN619K6xXjzdm1ppRum6MSOnqRpcGhu1vu0bGio
 7vNSNJ6Jmtb2HkVYJl9wvzSwmyGWzFQSl+VtcnEmsU9I+SR/D/4Vc8Ot3YA7POzdnfF6K48kw1
 kGM=
X-SBRS: 2.7
X-MesageID: 11005387
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,390,1571716800"; d="scan'208";a="11005387"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24079.9389.431417.649848@mariner.uk.xensource.com>
Date: Fri, 3 Jan 2020 11:25:33 +0000
To: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
In-Reply-To: <20200103101031.GB21578@reaktio.net>
References: <20200102180433.25688-1-ian.jackson@eu.citrix.com>
 <20200103101031.GB21578@reaktio.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH] Switch to linux-4.19 by default
 (from 4.14)
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@FreeBSD.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGFzaSBLw6Rya2vDpGluZW4gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtPU1NURVNUIFBBVENI
XSBTd2l0Y2ggdG8gbGludXgtNC4xOSBieSBkZWZhdWx0IChmcm9tIDQuMTQpIik6Cj4gT24gVGh1
LCBKYW4gMDIsIDIwMjAgYXQgMDY6MDQ6MzNQTSArMDAwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4g
PiBJIHRoaW5rIGdpdmVuIHRoYXQgaXQncyBhbHJlYWR5IG5vdCBwZXJmZWN0IHRoaXMgaXMgbm90
IGEgYmxvY2tlciBhbmQKPiA+IHdlIHNob3VsZCB1cGRhdGUgb3NzdGVzdCB0byA0LjE0Lgo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl4KPiAKPiBKdXN0IGEgc21hbGwgbm90ZTog
dHlwbz8gU2hvdWxkbid0IHRoYXQgYmUgNC4xOSA/CgpZZXMsIHdlbGwgc3BvdHRlZC4gIFRoZSBh
Y3R1YWwgY29kZSBpcyByaWdodCwgbHVja2lseS4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
