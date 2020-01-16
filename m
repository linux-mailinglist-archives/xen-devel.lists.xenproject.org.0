Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7613F2EC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 19:39:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isA1R-0006l5-A4; Thu, 16 Jan 2020 18:37:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M+HB=3F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isA1P-0006kw-O0
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 18:37:35 +0000
X-Inumbo-ID: 40f5a9bc-388f-11ea-87ac-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40f5a9bc-388f-11ea-87ac-12813bfff9fa;
 Thu, 16 Jan 2020 18:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579199851;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ctU2ax4oumOrHylTC5SqJScESGE4KEp1rKax8Xe0ThA=;
 b=TDo10pvQocyNtDoqlWvfJgR3LKA9Rw4QUtiFQ/2xqs0dy+LtHoAIewYd
 7LRGs4NBNydX1v8KWcIemqjmn/zf6yB+n9ZSUWvUV5bAgB05s6LkkFWuy
 eOZQ7HxobquvbaGX3uG+L7SJ2yExPjvs+D3uGqZnjGgVmY5l6m8pw7LLh o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Mi59L0ERtt7NquZ6q0jZzZgcm7mQbcIuEDy4lb3OKebg1bvwfuZ6WotGP/K5mwyhgu+N1ukzPI
 hNhc1OoL+xFu/Mj8U2CvHe8ad2xAv6ikNgfS9Dz9bOytiYhz/QpNMOfE+DKpkVeTD/Ic5J5tac
 /C1vWjhRTdzpTGSY00qGzjQm/3+b1Xwf2LfRrQ3+NHMf/xtB/KrHP5i3Wzes8OKqK2pjyBWV0V
 U8Tm8E1CMLyE7Xct9UUPoBh+6S8BDfnNashwmv3EMdu54S2UlLRCF/3DEuC39tKuNQ2fPXaF74
 vnc=
X-SBRS: 2.7
X-MesageID: 11400612
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,327,1574139600"; d="scan'208";a="11400612"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24096.44389.256863.358234@mariner.uk.xensource.com>
Date: Thu, 16 Jan 2020 18:37:25 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200116093602.4203-6-pdurrant@amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-6-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 5/6] xl.conf: introduce 'domid_policy'
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2MyA1LzZdIHhsLmNvbmY6IGludHJvZHVjZSAn
ZG9taWRfcG9saWN5JyIpOgo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBnbG9iYWwgJ2RvbWlkX3Bv
bGljeScgY29uZmlndXJhdGlvbiBvcHRpb24gdG8gZGVjaWRlCj4gaG93IGRvbWFpbiBpZCB2YWx1
ZXMgYXJlIGFsbG9jYXRlZCBmb3IgbmV3IGRvbWFpbnMuIEl0IG1heSBiZSBzZXQgdG8gb25lIG9m
Cj4gdHdvIHZhbHVlczoKPiAKPiAieGVuIiwgdGhlIGRlZmF1bHQgdmFsdWUsIHdpbGwgY2F1c2Ug
YW4gaW52YWxpZCBkb21pZCB2YWx1ZSB0byBiZSBwYXNzZWQKPiB0byBkb19kb21haW5fY3JlYXRl
KCkgcHJlc2VydmluZyB0aGUgZXhpc3RpbmcgYmVoYXZpb3VyIG9mIGhhdmluZyBYZW4KPiBjaG9v
c2UgdGhlIGRvbWlkIHZhbHVlIGR1cmluZyBkb21haW5fY3JlYXRlKCkuCj4gCj4gInJhbmRvbSIg
d2lsbCBjYXVzZSB0aGUgc3BlY2lhbCBSQU5ET01fRE9NSUQgdmFsdWUgdG8gYmUgcGFzc2VkIHRv
Cj4gZG9fZG9tYWluX2NyZWF0ZSgpIHN1Y2ggdGhhdCBsaWJ4bF9fZG9tYWluX21ha2UoKSB3aWxs
IHNlbGVjdCBhIHJhbmRvbQo+IGRvbWlkIHZhbHVlLgoKVGhpcyBpbnRlcmZhY2UgTEdUTS4gIEl0
IHByb3ZpZGVzIHNwYWNlIGZvciBleHRlbnNpb24uCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
