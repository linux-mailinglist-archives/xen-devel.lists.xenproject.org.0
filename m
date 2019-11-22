Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838171074BC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 16:22:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYAhy-00072S-EG; Fri, 22 Nov 2019 15:18:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t41z=ZO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iYAhw-00072N-Rj
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 15:18:52 +0000
X-Inumbo-ID: 629f2ed2-0d3b-11ea-9631-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 629f2ed2-0d3b-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574435931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7xWbtLLgivHhRExHvzINFdnprPhHBsfNyhqF38sDuVE=;
 b=eGnPNPguNrrAMIHhr/H4eguUrJBowk7MFqB9h8oR13K60JacVLxTzmjB
 eGBtiGVzui+yW1GuyXcwJIRHlo+RGvezt4+qsS1VDjCPatKGtGaVQRMD+
 adqHV7lUg3msFZNS56kio12wB9YDrnRaYw1gmTm1gRQ+B71VKj3M4hutt Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SGEuXCS9wqDY5/FRa46O2g7OxJNpiYHdms1L3aVB3CTdwUs14C1xH17kPiGPd6koOcIaPSkIQ8
 NtKhrQX9hR3JnHFVhFPm7Ul9EY/2tWY01dS1brNYyJaiHbrX60QGTD/UNnjtkf+zHm2bxzrwxK
 84bMwGCtDwc8hUFqXZnDHH9SlvFRHuVASooYhlM1yQQAHZAQtNbZ5t3wFsNo8efHeV14U7irWC
 FV/Cy5uGSv8tvAURLt1xPZ2KTMHHaN6ANyEt0RHLTrxBBsjQeD6/ptwMlQybF/XcXMsuZeCkYB
 qtA=
X-SBRS: 2.7
X-MesageID: 8833251
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,230,1571716800"; 
   d="scan'208";a="8833251"
Date: Fri, 22 Nov 2019 15:18:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Grytsov <al1img@gmail.com>
Message-ID: <20191122151846.GG1425@perard.uk.xensource.com>
References: <20191121181300.6497-1-al1img@gmail.com>
 <20191121181300.6497-2-al1img@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121181300.6497-2-al1img@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH v2 1/3] libxl: introduce new backend type
 VINPUT
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
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, wl@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDg6MTI6NThQTSArMDIwMCwgT2xla3NhbmRyIEdyeXRz
b3Ygd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVw
YW0uY29tPgo+IAo+IFRoZXJlIGFyZSB0d28ga2luZCBvZiBWS0JEIGRldmljZXM6IHdpdGggUUVN
VSBiYWNrZW5kIGFuZCB1c2VyIHNwYWNlIFBWCj4gYmFja2VuZC4gSW4gY3VycmVudCBpbXBsZW1l
bnRhdGlvbiB0aGV5IGNhbid0IGJlIGRpc3Rpbmd1aXNoZWQgYXMgYm90aCB1c2UKPiBWS0JEIGJh
Y2tlbmQgdHlwZS4gQXMgcmVzdWx0LCB1c2VyIHNwYWNlIFBWIEtCRCBiYWNrZW5kIGlzIHN0YXJ0
ZWQgYW5kCj4gc3RvcHBlZCBhcyBRRU1VIGJhY2tlbmQuIFRoaXMgY29tbWl0IGFkZHMgbmV3IGRl
dmljZSBraW5kIFZJTlBVVCB0byBiZQo+IHVzZWQgYXMgYmFja2VuZCB0eXBlIGZvciB1c2VyIHNw
YWNlIFBWIEtCRCBiYWNrZW5kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBHcnl0c292
IDxvbGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KPiBBY2tlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpUaGF0IHBhdGNoIHJlbW92ZXMgdGhlICJiYWNrZW5k
LXR5cGUiIG5vZGUgZnJvbSB4ZW5zdG9yZSBidXQgaXQgd2Fzbid0CnBhcnQgb2YgdGhlIGFwaSAo
a2JkaWYuaCkgYW5kIHFlbXUgZG9lc24ndCByZWFkLCBpdCBzbyBJIGd1ZXNzIHRoYXQncwpmaW5l
OgoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoK
VGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
