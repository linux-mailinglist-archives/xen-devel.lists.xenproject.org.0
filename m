Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31960AC2C7
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2019 01:03:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6NDR-0002NS-P8; Fri, 06 Sep 2019 23:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gaz9=XB=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i6NDQ-0002NN-77
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 23:00:28 +0000
X-Inumbo-ID: 1d82eb2c-d0fa-11e9-978d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d82eb2c-d0fa-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 23:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567810827;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dpPsk8LE83368fkJgEcOsXssOy2FoPlssTTZn0BFLZY=;
 b=SXnvjexlkj8NMS9lnMTbvQ103PZTErnieQS36TwRvN4/eO2lqLKGnt1r
 d73+7ipzR4orf+dmQL1FxQRZyHRe9+U6blakTaSghw20VMb1tXejtRPif
 Lq3k6hQrP4VIIJAmgXAb5EsD6becTe8uMprEvh9PQgAi20U/hItHkLjiR A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: T/9zojaCofQTVlg9JytA1HFg6m2EOIp6isp71QNFOWodT3M/pxCZDFS6Tp7lRml6yh9gRo2kio
 k4m0NoQDKq4gwgl/vh+1lZsUVEdxbh0ykvTE3sxXrqKw8IeRa4vj4u+eAuPXXOqnOd03HFyjme
 oMU975HElEZIHLolgJex75ZNWkzp3vEu7c6F6MWHfuf8EvN3yzZL2fw+bqaBQuuOUXRimGOswx
 omBipzSNypUdsO2QvhRuh8Ky9w7+glJ3gnAXM8VxjTLQ0iyvFQraFIUR4PtigIttZLRI4ee31Q
 6qM=
X-SBRS: 2.7
X-MesageID: 5266131
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,474,1559534400"; 
   d="scan'208";a="5266131"
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
Date: Sat, 7 Sep 2019 00:00:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: jgross@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNi8wOS8yMDE5IDIzOjMwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gOS8zLzE5
IDg6MjAgUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+PiBJZiBNQ0ZHIGFyZWEgaXMgbm90IHJl
c2VydmVkIGluIEU4MjAsIFhlbiBieSBkZWZhdWx0IHdpbGwgZGVmZXIgaXRzIHVzYWdlCj4+IHVu
dGlsIERvbTAgcmVnaXN0ZXJzIGl0IGV4cGxpY2l0bHkgYWZ0ZXIgQUNQSSBwYXJzZXIgcmVjb2du
aXplcyBpdCBhcwo+PiBhIHJlc2VydmVkIHJlc291cmNlIGluIERTRFQuIEhhdmluZyBpdCByZXNl
cnZlZCBpbiBFODIwIGlzIG5vdAo+PiBtYW5kYXRvcnkgYWNjb3JkaW5nIHRvICJQQ0kgRmlybXdh
cmUgU3BlY2lmaWNhdGlvbiwgcmV2IDMuMiIgKHBhci4gNC4xLjIpCj4+IGFuZCBmaXJtd2FyZSBp
cyBmcmVlIHRvIGtlZXAgYSBob2xlIEU4MjAgaW4gdGhhdCBwbGFjZS4gWGVuIGRvZXNuJ3Qga25v
dwo+PiB3aGF0IGV4YWN0bHkgaXMgaW5zaWRlIHRoaXMgaG9sZSBzaW5jZSBpdCBsYWNrcyBmdWxs
IEFDUEkgdmlldyBvZiB0aGUKPj4gcGxhdGZvcm0gdGhlcmVmb3JlIGl0J3MgcG90ZW50aWFsbHkg
aGFybWZ1bCB0byBhY2Nlc3MgTUNGRyByZWdpb24KPj4gd2l0aG91dCBhZGRpdGlvbmFsIGNoZWNr
cyBhcyBzb21lIG1hY2hpbmVzIGFyZSBrbm93biB0byBwcm92aWRlCj4+IGluY29uc2lzdGVudCBp
bmZvcm1hdGlvbiBvbiB0aGUgc2l6ZSBvZiB0aGUgcmVnaW9uLgo+Pgo+PiBOb3cgeGVuX21jZmdf
bGF0ZSgpIHJ1bnMgYWZ0ZXIgYWNwaV9pbml0KCkgd2hpY2ggaXMgdG9vIGxhdGUgYXMgc29tZSBi
YXNpYwo+PiBQQ0kgZW51bWVyYXRpb24gc3RhcnRzIGV4YWN0bHkgdGhlcmUuIFRyeWluZyB0byBy
ZWdpc3RlciBhIGRldmljZSBwcmlvcgo+PiB0byBNQ0ZHIHJlc2VydmF0aW9uIGNhdXNlcyBtdWx0
aXBsZSBwcm9ibGVtcyB3aXRoIFBDSWUgZXh0ZW5kZWQKPj4gY2FwYWJpbGl0eSBpbml0aWFsaXph
dGlvbnMgaW4gWGVuIChlLmcuIFNSLUlPViBWRiBCQVIgc2l6aW5nKS4gVGhlcmUgYXJlCj4+IG5v
IGNvbnZlbmllbnQgaG9va3MgZm9yIHVzIHRvIHN1YnNjcmliZSB0byBzbyB0cnkgdG8gcmVnaXN0
ZXIgTUNGRwo+PiBhcmVhcyBlYXJsaWVyIHVwb24gdGhlIGZpcnN0IGludm9jYXRpb24gb2YgeGVu
X2FkZF9kZXZpY2UoKS4gCj4gCj4gCj4gV2hlcmUgaXMgTUNGRyBwYXJzZWQ/IHBjaV9hcmNoX2lu
aXQoKT8KCkl0IGhhcHBlbnMgdHdpY2U6CjEpIGZpcnN0IHRpbWUgZWFybHkgb25lIGluIHBjaV9h
cmNoX2luaXQoKSB0aGF0IGlzIGFyY2hfaW5pdGNhbGwgLSB0aGF0CnRpbWUgcGNpX21tY2ZnX2xp
c3Qgd2lsbCBiZSBmcmVlZCBpbW1lZGlhdGVseSB0aGVyZSBiZWNhdXNlIE1DRkcgYXJlYSBpcwpu
b3QgcmVzZXJ2ZWQgaW4gRTgyMDsKMikgc2Vjb25kIHRpbWUgbGF0ZSBvbmUgaW4gYWNwaV9pbml0
KCkgd2hpY2ggaXMgc3Vic3lzdGVtX2luaXRjYWxsIHJpZ2h0CmJlZm9yZSB3aGVyZSBQQ0kgZW51
bWVyYXRpb24gc3RhcnRzIC0gdGhpcyB0aW1lIEFDUEkgdGFibGVzIHdpbGwgYmUKY2hlY2tlZCBm
b3IgYSByZXNlcnZlZCByZXNvdXJjZSBhbmQgcGNpX21tY2ZnX2xpc3Qgd2lsbCBiZSBmaW5hbGx5
CnBvcHVsYXRlZC4KClRoZSBwcm9ibGVtIGlzIHRoYXQgb24gYSBzeXN0ZW0gdGhhdCBkb2Vzbid0
IGhhdmUgTUNGRyBhcmVhIHJlc2VydmVkIGluCkU4MjAgcGNpX21tY2ZnX2xpc3QgaXMgZW1wdHkg
YmVmb3JlIGFjcGlfaW5pdCgpIGFuZCBvdXIgUENJIGhvb2tzIGFyZQpjYWxsZWQgaW4gdGhlIHNh
bWUgcGxhY2UuIFNvIE1DRkcgaXMgc3RpbGwgbm90IGluIHVzZSBieSBYZW4gYXQgdGhpcwpwb2lu
dCBzaW5jZSB3ZSBoYXZlbid0IHJlYWNoZWQgb3VyIHhlbl9tY2ZnX2xhdGUoKS4KCklnb3IKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
