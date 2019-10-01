Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DB7C349C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 14:44:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFHSp-0008LU-Vs; Tue, 01 Oct 2019 12:41:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XqjC=X2=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iFHSp-0008LO-2Q
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 12:41:11 +0000
X-Inumbo-ID: be76e252-e448-11e9-96f9-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id be76e252-e448-11e9-96f9-12813bfff9fa;
 Tue, 01 Oct 2019 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569933670;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=T8aOJBSYOXIpz27IPm5FizVBJ6hlNVcuFaHlisr8ipk=;
 b=F2KhT0WtPTwDNH1Cyzj+cvlH3EtG+avKqVpa0p3/cQ9/+F86Oojz06e5
 X+4FfXGEFkFEppxjnSnfihS/gYpri+jP6eGNkCh3zdok8G0IFSl0TLu6R
 ALg29tLCEMmxXB6phqP9v6h9L5DHNiu2E2YVFyeUpG8KCv2RMEAtca2pz M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P2bhtZso+vqqUfn5IhbFhDIEktdpUJrUKmEErLl8Lvh/tDiAQCuLzEZm+rVd2zLbBZ1mK+ZL+P
 p9/vJFIPcT7Mzysg5JpJdr8pGBFF0TIa2OoRBTEAt8SUAhZwV9oAIbzS7rSxhAy+O/fNarzucj
 bIowYYq2JA+bFJieNE+YGcL/RzFb0qVj+gnQx5o7hOr9WJOhv1mhMFQoC3V1mwDeV4Rw//xzRy
 UhYmD03FlccwHvBbGXMWnwFJBPQAxkbvz+hNx1n/+4AxL4acxCWmRtYBdJPJWJY4s/S23w/2RG
 1Ug=
X-SBRS: 2.7
X-MesageID: 6374970
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6374970"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23955.18786.606189.277746@mariner.uk.xensource.com>
Date: Tue, 1 Oct 2019 13:41:06 +0100
To: Paul Durrant <pdurrant@gmail.com>
In-Reply-To: <CACCGGhC78VVFo3XGOH0Xn32TRWjbqz7_npHjtLgWtP1A=YJdgg@mail.gmail.com>
References: <20191001091214.3287-1-paul.durrant@citrix.com>
 <23955.11471.728957.434428@mariner.uk.xensource.com>
 <045e191e8d1b4e9b9e131921dc865483@AMSPEX02CL03.citrite.net>
 <CACCGGhC78VVFo3XGOH0Xn32TRWjbqz7_npHjtLgWtP1A=YJdgg@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH-for-4.13] libxl: choose an appropriate
 default for passthrough...
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
 Paul Durrant <Paul.Durrant@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0gtZm9yLTQuMTNdIGxp
YnhsOiBjaG9vc2UgYW4gYXBwcm9wcmlhdGUgZGVmYXVsdCBmb3IgcGFzc3Rocm91Z2guLi4iKToK
PiBQaW5nPyBDYW4gSSBnZXQgYSByZXNwb25zZSBvbiB0aGlzICh3LnIudC4gJ2VuYWJsZWQnIHZz
LiAndW5rbm93bicpCj4gYmVmb3JlIGRvaW5nIGEgdjI/IFRoaXMgaXNzdWUgaXMgY3VycmVudGx5
IGJsb2NraW5nIGEgcHVzaCwgSSBiZWxpZXZlLgoKSSBkZWZpbml0ZWx5IHRoaW5rIHdlIHNob3Vs
ZCBpbnRyb2R1Y2UgInVua25vd24iLgoKPiA+IFNvLCB3b3VsZCB5b3UgYWR2b2NhdGUgYW4gJ3Vu
a25vd24nIHZhbHVlIHRoZW4/IFRoYXQncyBlc3NlbnRpYWxseSBqdXN0IGEgcmVuYW1lIG9wZXJh
dGlvbiBvbiAnZW5hYmxlZCcuCgpJIHRoaW5rIHdlIHByb2JhYmx5IHdhbnQgImVuYWJsZWQiIGFz
IHdlbGwgYnV0IHRoYXQgY2FuIHdhaXQuICBJZiBmb3IKbm93IHlvdSByZW5hbWUgInVua25vd24i
IHRoYXQgd2lsbCBkby4KCj4gPiBUaGUgY29kZSBpbiB4bF9wYXJzZS5jIGlzIHRoZXJlIGZvciBh
IHJlYXNvbiB0aG91Z2g7IHRoZSBhcHByb3ByaWF0ZSBhbW91bnQgb2YgZXh0cmEgbWVtb3J5IGZv
ciB0aGUgSU9NTVUgcGFnZSB0YWJsZXMgaGFzIHRvIGJlIGRldGVybWluZWQgdGhlcmUgYmVjYXVz
ZSB0aGUgJ2J1aWxkJyBwYXJ0cyBvZiBsaWJ4bCBzZWVtIHRvIGJlIGxhcmdlbHkgZmlyZXdhbGxl
ZCBmcm9tIHRoZSAnY3JlYXRlJyBwYXJ0cyBhbmQgdGh1cyB0aGUgcmVsZXZhbnQgaW5mb3JtYXRp
b24gaXMgbm90IGF2YWlsYWJsZSB0byBkZWNpZGUgdGhlIGFwcHJvcHJpYXRlIG92ZXJoZWFkLgoK
SSB3YW50IHRvIGxvb2sgaW50byB0aGlzIG1vcmUgZGVlcGx5LgoKVGhhbmtzLApJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
