Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474DD13B11D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:38:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irQ6u-0002bX-ND; Tue, 14 Jan 2020 17:36:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irQ6t-0002bS-K5
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:36:11 +0000
X-Inumbo-ID: 536228f6-36f4-11ea-b89f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 536228f6-36f4-11ea-b89f-bc764e2007e4;
 Tue, 14 Jan 2020 17:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579023360;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=JGFwBXJa9S9xgdIQ81R/yxopcPB3vu+5hiJDQ46kinw=;
 b=A1vj7u1G1TnjsMHqWeNAieE6QnXPH8gz6td+seZIIHN5PCRsMXwOASha
 FEk1P2+hfJ1XGgg+115wAmbpV1lVm2XJdGKdxx+srmR+HftR9AAuScZaJ
 AaY0izMO4C9Es6Fb5GiGPtPUhjZ+K1ZBeYSHbxuo6fUHHeMZ3SI7CGx2l g=;
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
IronPort-SDR: J7kTarnoNWf5vY5o0WeeP2hIwS8S9omKfL46ZYtOMcoWlPCw1qn7THYZ7awbOPi0HAfRygsuQn
 fBgoMnadNaCatr/cRf6h4zfZ2SC3xvZBCQ8fCrnTeifY3dPb+cDlQonORV/8Ahl4LaijzPt/h/
 ZQPgclsLt2rULrxESRSb4oe2BaROLmvncXk6SW8BuPaFb/qgpSWBy8ex5wwycRSmhQPaKdfvt2
 25pf5aqb60qPkk8lt61PTsOvcJICam18/DKds6P/OAU7l0lmrEcv2lY1UkoZ5YZ1NXSLuaf8QT
 0So=
X-SBRS: 2.7
X-MesageID: 11067608
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,319,1574139600"; d="scan'208";a="11067608"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.64394.805189.462454@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 17:34:02 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200103130616.13724-7-andrew.cooper3@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
 <20200103130616.13724-7-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 20/20] tools/libxc: Restore CPUID/MSR data
 found in the migration stream
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMjAvMjBdIHRvb2xzL2xpYnhjOiBSZXN0b3Jl
IENQVUlEL01TUiBkYXRhIGZvdW5kIGluIHRoZSBtaWdyYXRpb24gc3RyZWFtIik6Cj4gV2l0aCBs
aWJ4bCBzdWl0YWJseSBhZGp1c3RlZCwgaXQgaXMgbm93IHNhZmUgdG8gcmVzdG9yZSB0aGUgQ1BV
SUQvTVNSIGRhdGEKPiBkaXJlY3RseSBmcm9tIHRoZSBtaWdyYXRpb24gc3RyZWFtLiAgQWRqdXN0
IHRoZSBYR1JfU0REX01JU1NJTkdfKiBmbGFncyBmb3IKPiB0aGUgc3RhdGljX2RhdGFfZG9uZSgp
IGNhbGxiYWNrIGFwcHJvcHJpYXRlbHkuCgpTdWJqZWN0IHRvIG15IGNvbW1lbnRzIGVhcmxpZXIg
YWJvdXQgKGkpIHRoZSB1bmV2ZW5uZXNzIG9mIHRoZQpyZXN1bHRpbmcgbGlieGMgQVBJIGFuZCAo
aWkpIHRleHQgYWJvdXQgdGhlIGNvbXBhdGliaWxpdHkgcGxhbiwKCkFja2VkLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KClRoYW5rcywKSWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
