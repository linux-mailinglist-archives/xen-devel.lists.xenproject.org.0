Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEA3FE246
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 17:07:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVe6r-0002LQ-O4; Fri, 15 Nov 2019 16:06:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ISM0=ZH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iVe6q-0002LC-2R
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 16:06:08 +0000
X-Inumbo-ID: d48cc2d6-07c1-11ea-a277-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d48cc2d6-07c1-11ea-a277-12813bfff9fa;
 Fri, 15 Nov 2019 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573833966;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=2toherqMef98QaHklA6eTnm2G/kkA45txe320LVrAB8=;
 b=E6H9vqKCj3oWVolAUKE7qypc5sI+ULKdvpf3DBrHK8LKFt59EhH07aZI
 +m3EFoXHJX6lYWg6//YzeRaH7wOfqi3O4ngUSuXqX49D/DZA25toDbX1w
 QyQDCGQHXoO13WI/WO5qKCGxJ9I1POVFfK6HdQQqmlnDwxD0ubdzTXV0s s=;
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
IronPort-SDR: GVMMTWI/EfG7smmx9lj36U8d7xqFoP0Z3uK9wKp1Ve2qbtsA82IGEfEoRSiTsRCNx0w79hnjpb
 0D/fsMieidyjn6ALOypdtOR4vUyNQH2vmRS6sZ/MmO+531Lg29UqCCNwLc7wXzH0E2YzeuhusE
 3xdSeSTn6hvquy8DUNyasyvFJd65QLFCf+S9KSkSz2bs+RmjmRAYNHMupvYL47Uso/HJYUocWZ
 /b8GRqT+jsajbFLucxnR6seRa3WAX0hhUBjHi7pjcWrXeDGK3i5XTWlWZ1xtkDtN85ZI5OAaqF
 wDI=
X-SBRS: 2.7
X-MesageID: 8747379
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8747379"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24014.52459.589889.966286@mariner.uk.xensource.com>
Date: Fri, 15 Nov 2019 16:06:03 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191030180704.261320-3-anthony.perard@citrix.com>
References: <20191030180704.261320-1-anthony.perard@citrix.com>
 <20191030180704.261320-3-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 2/6] libxl: Move
 libxl__ev_devlock declaration
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiAyLzZdIGxpYnhs
OiBNb3ZlIGxpYnhsX19ldl9kZXZsb2NrIGRlY2xhcmF0aW9uIik6Cj4gV2UgYXJlIGdvaW5nIHRv
IHdhbnQgdG8gaW5jbHVkZSBsaWJ4bF9fZXZfZGV2bG9jayBpbnRvIGxpYnhsX19ldl9xbXAuCj4g
Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
