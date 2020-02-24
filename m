Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D67F16AD8B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 18:32:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6HXu-0001xc-Lt; Mon, 24 Feb 2020 17:29:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gH7p=4M=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6HXs-0001xV-QU
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 17:29:28 +0000
X-Inumbo-ID: 3559641c-572b-11ea-9225-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3559641c-572b-11ea-9225-12813bfff9fa;
 Mon, 24 Feb 2020 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582565368;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=X0Qh2NythonV1I6za2r813AezjcrRfZor7ewsnkr8kE=;
 b=eY4xqPkHGSCMsQC0+nOX+ROVv/B9rVKTSyVrXj5C0T80le8eEez45MRJ
 vJEhr43Q28P7ldbqw5LZuDZ61UAmqqwVf9DGUb90oIEhjyOkhio9e76D2
 X1mP6UMK0qmQFanabqq9tLFIR85UV5dkXF+TG3u+pz5hLCo1I/V6Gv1fe E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4xQ3GgCIIHyFNhlk0MDmPFnULrk+MZwxfK94G5z7Oaq/gojfj1S7T2C2tPlPTyek28JAdWD3JG
 LBq+rm48PiYtFjvR0Y19BsdsoXv3gIm9AOsCSSPFMUgEvsjsOHp4XlbIVZIldTFgWeO6+JJ2FR
 DkR3f2tznEFv7QiTut4HfHbK2UlPmFnYXXXrAJBDdfrksgAUwq/zoJVDjPoOJnnkmT7UhWY9az
 BYLQ2QRPTeNfkx+SPRXnLIH/30Bn31PY8YUigvDgtXePfFmNS4JvXzn/pJJbK3WIFCTH/vtYqP
 QUQ=
X-SBRS: 2.7
X-MesageID: 12903223
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12903223"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24148.2037.86864.640489@mariner.uk.xensource.com>
Date: Mon, 24 Feb 2020 17:29:25 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200127143444.25538-7-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-7-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH v2 06/17] libxc/restore: Support v3 streams and
 handle STATIC_DATA_END
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

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggdjIgMDYvMTddIGxpYnhjL3Jlc3RvcmU6IFN1
cHBvcnQgdjMgc3RyZWFtcyBhbmQgaGFuZGxlIFNUQVRJQ19EQVRBX0VORCIpOgo+IEhpZ2hlciBs
ZXZlbCB0b29sc3RhY2tzIG1heSB3aXNoIHRvIGtub3cgd2hlbiB0aGUgc3RhdGljIGRhdGEgaXMg
Y29tcGxldGUsIHNvCj4gaW50cm9kdWNlIGEgcmVzdG9yZV9jYWxsYmFjayBmb3IgdGhlIHB1cnBv
c2UuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
