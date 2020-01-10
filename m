Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C66137552
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 18:54:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipyRG-0002KG-0c; Fri, 10 Jan 2020 17:51:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0O1r=27=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ipyRF-0002KB-1L
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 17:51:13 +0000
X-Inumbo-ID: c85a6651-33d1-11ea-bf8a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c85a6651-33d1-11ea-bf8a-12813bfff9fa;
 Fri, 10 Jan 2020 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578678671;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=G0VarV8P88WQpwRTcryytYmVVvt8CLazzdk9+nKxNWU=;
 b=GekVXkgFWWtlms+BzoFqGMg18CYkX96jojP0m40nimckvPGhSDDjuDLW
 43X0zvG9Tq4U6Ot9NxLPGkJRxJ5b1rSyZaHgtc7rwx4gZq9zcpzCpxoui
 qOOiUJhQa/GvMFb8dsiCjaGQagDzSVeX0aw8XKVLmpzzqXhD3Y+dYO8Ca 8=;
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
IronPort-SDR: Pk7GjNkcbJZi7DyQRoAArF+SZMg4ojc9lbSxSkehZLc/BDGezsJc+Fe1rq57yyKYVksVI6zdr9
 sG75J26cjtQYSQhZF1YG/mGZRXtRUfSFhlYvyjZ2hJ2U963HhL2x1CPBQz6T/Fx+GwhGGTnQ2G
 LBs32N0xasxgAAstgglTyr3bP8xHKf0dRjmuxvOIN+Xj8JY2FUwGstrHgkLlcHlRvKLklIoL/l
 UsgwYESY5havt/Nor+aO0Pr5eiqfPvT6MJZ9ipw6ohV5hx80sxIQGNZHLO5BPlGJTdHhU2BSGI
 oyA=
X-SBRS: 2.7
X-MesageID: 11128754
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="11128754"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24088.47498.144066.352751@mariner.uk.xensource.com>
Date: Fri, 10 Jan 2020 17:51:06 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200109111505.12328-1-pdurrant@amazon.com>
References: <20200109111505.12328-1-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools/Rules.mk: fix distclean
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

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSF0gdG9vbHMvUnVsZXMubWs6IGZpeCBkaXN0Y2xl
YW4iKToKPiBSdW5uaW5nICdtYWtlIGRpc3RjbGVhbicgdW5kZXIgdG9vbHMgd2lsbCBjdXJyZW50
bHkgcmVzdWx0IGluOgo+IAo+IHRvb2xzL1J1bGVzLm1rOjI0NTogKioqIFlvdSBoYXZlIHRvIHJ1
biAuL2NvbmZpZ3VyZSBiZWZvcmUgYnVpbGRpbmcgb3IgaW5zdGFsbGluZyB0aGUgdG9vbHMuICBT
dG9wLgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyAnZGlzdGNsZWFuJywgJ3N1YmRpci1kaXN0Y2xlYW4l
JyBhbmQgJ3N1YmRpci1jbGVhbiUnIHRvCj4gbm8tY29uZmlndXJlLXRhcmdldHMsIHdoaWNoIGFs
bG93cyAnbWFrZSBkaXN0Y2xlYW4nIHRvIHJ1biB0byBjb21wbGV0aW9uLgoKVGhpcyBzZWVtcyBz
b3VuZCB0byBtZSwgZXZlbiB0aG91Z2ggSSB0aGluayBpbiB0aGUgY2FzZSB3aGVyZSBpdCBtYWtl
cwphIGRpZmZlcmVuY2UsIGBtYWtlIGRpc3RjbGVhbicgd2lsbCBlbmQgdXAgc2tpcHBpbmcgbW9z
dCBvZiB0aGUgdG9vbHMKc3R1ZmYgc2luY2UgdGhlIG1ha2VmaWxlcyBhcmVuJ3QgcHJlc2VudC4K
CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCldlaSwg
ZG8geW91IGFncmVlIHdpdGggbXkgYW5hbHlzaXMgPwoKSWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
