Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167818BBB1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:56:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jExUE-00076m-JN; Thu, 19 Mar 2020 15:53:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QdtJ=5E=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jExUC-00076g-Ip
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:53:32 +0000
X-Inumbo-ID: c83dd656-69f9-11ea-b34e-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c83dd656-69f9-11ea-b34e-bc764e2007e4;
 Thu, 19 Mar 2020 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584633211;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=4/XIo9GuTkHfK8aPspXbN/ZtkoEnTyMLdDW34voZ+EA=;
 b=KC8PGcfuZXb+lsCDb6YXqF3h4QzzvT7prK8/3HMnhEwvZI//Aam8t2C3
 oT6f+48xc8em4WA8w9B67hcrYU1MmGcc7h/TbCOKTafTaWmBp2E6egO1+
 8aAq/keyv4oOcfY3sWlb0SKtd9oiVzbE31NHHMedF7vHQ2KO0+9v1XR+0 0=;
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
IronPort-SDR: oeoKkTN1QyUO71nDPWa5aAxlZXsCSIOO4sS6xzeYDdLA5YTDa6h8nlcivXvDpCjGIAJgqqr6/J
 GKmKpeypF/8g+yPSvlqU7VhW2VY/naICJ80PVbG9fuVr2mdnRim+/ZzHBRJIbjo89Ix3cGLe58
 nE0YflPbCBNu+v1FCprJtG5/kkEpE0Gp57ksUOc8r2RgPaB+E9F8YaSqTmsWFuZnjzkzMIPILQ
 hV7wWV2VQ25jGC7NhrYlF9IVlqPX9aSgtbTLFRXrBk5jaRSJtvnhJgHiqo88KdIJ7DtJ9fN537
 HAs=
X-SBRS: 2.7
X-MesageID: 14625179
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14625179"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24179.38262.748905.318939@mariner.uk.xensource.com>
Date: Thu, 19 Mar 2020 15:53:26 +0000
To: Paul Durrant <paul@xen.org>
In-Reply-To: <20200319114748.5168-3-paul@xen.org>
References: <20200319114748.5168-1-paul@xen.org>
 <20200319114748.5168-3-paul@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v4 2/2] libxl: make creation of xenstore
 'suspend event channel' node optional...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul
 Durrant <pdurrant@amazon.com>, George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NCAyLzJdIGxpYnhsOiBtYWtlIGNyZWF0aW9u
IG9mIHhlbnN0b3JlICdzdXNwZW5kIGV2ZW50IGNoYW5uZWwnIG5vZGUgb3B0aW9uYWwuLi4iKToK
PiAuLi4gYW5kLCBpZiBpdCBpcyBub3QgY3JlYXRlZCwgbWFrZSB0aGUgdG9wIGxldmVsICdkZXZp
Y2UnIG5vZGUgaW4KPiB4ZW5zdG9yZSB3cml0YWJsZSBieSB0aGUgZ3Vlc3QgaW5zdGVhZC4KClJl
dmlld2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KClRoYW5r
cywgd2lsbCBjb21taXQgdGhlc2UgdHdvLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
