Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD59C03A8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 12:44:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDnht-0001oa-FD; Fri, 27 Sep 2019 10:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fvvD=XW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iDnhs-0001oV-OB
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 10:42:36 +0000
X-Inumbo-ID: 84717a8c-e113-11e9-97fb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 84717a8c-e113-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 10:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569580956;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=2kZUXs2MBXRbFlt3Nh8rsvpojQVx3UO0q3HMB0nWt+M=;
 b=TAg/uGtN7L0ZofgBp8OxGHK2SBYcurYBnkJE5dNFuDJhDZ3U2keGiuC0
 5+4MOGq7bzu1V6nqlCX+KrFn4hFd3p8EeGP5xjImwhyByfhaN6WMtmgKF
 LRVjN5sHeP7xFofBvsoLSW324Y+5dg9P4qSv+uiQ887h2qcP90dHgISRr s=;
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
IronPort-SDR: XfX6Rld3j38cMwUYfj4Gqa5o9JrUqz7QQ5MTybbdD4pMI9uYB0EUJ/wtw5WUY6gwgw+A23lArL
 z0vQH+Z2eaPbq5+IN77i82W8euEIFjYVemrLMoL4ZYKupTJBCtDJAJD9whaDAqqmZfMenf3xSj
 i2jCsbT5dlxkcmnk9xwdUmIxqdO41W1iCit+0e8HLoPJnOMnsrPTiRhpEIRgTPPArzoQZzVOR5
 I8hN9eUVRDLtHcOBWACnE6o4qanMLvrYbJG4zITtwOWjjUmnIVhY9yh60ymol5Z09HGFlHcwpA
 o6I=
X-SBRS: 2.7
X-MesageID: 6231541
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6231541"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23949.59282.886951.844540@mariner.uk.xensource.com>
Date: Fri, 27 Sep 2019 11:42:26 +0100
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <20190927090048.28872-5-jgross@suse.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-5-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 4/6] tools: add xenfs tool
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJbUEFUQ0ggdjEgNC82XSB0b29sczogYWRkIHhlbmZzIHRv
b2wiKToKPiBBZGQgdGhlIHhlbmZzIHRvb2wgZm9yIGFjY2Vzc2luZyB0aGUgaHlwZXJ2aXNvciBm
aWxlc3lzdGVtLgoKVGhhbmtzIGZvciB0YWtpbmcgY2FyZSBhYm91dCBleGl0IHN0YXR1cy4gIENh
biB5b3UgZG9jdW1lbnQgdGhlIGV4aXQKc3RhdHVzZXMgc29tZXdoZXJlID8KCklhbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
