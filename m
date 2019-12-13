Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89AF11E7D0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:10:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnUS-0007Pl-ML; Fri, 13 Dec 2019 16:08:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mOMl=2D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifnUQ-0007Pg-LC
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:08:26 +0000
X-Inumbo-ID: cad0c4c4-1dc2-11ea-8f6a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cad0c4c4-1dc2-11ea-8f6a-12813bfff9fa;
 Fri, 13 Dec 2019 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576253305;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vKftUtZmHX0GxZBgzUea0eEURf5+WBr4mUpd4VtNXIc=;
 b=DbILFAgwzbShHHk4tuj8u9aPmJzv98KAUWGD3fJYlPSTNdLEvw5/3hUE
 tdWhzhD3tbh3VAMjPN4XWk8ZDQBJ/tlOHNtdrkD1/XKmL7AaZK5HNlzKw
 NpOLX70oTOF8aS3WdxdA2NcSuM/hdKM8WgNXRqtzBLvxwBB4242GMnSlw 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XvHeAMIMPKbB2/pdXuPTg2QPNSFIYFOGOYDlMySlzMP5StQoefDHmoar0zYElxhIc658ZGkyiC
 zi7kP2XdhGSn4WEekHN3usMQ7rN8lTgTscOW9Wg18zFNBuWXaYLqziIbdMNmDbSMifuDRpYIW5
 QqGTEZxH/1AuuCt0LCB7+QLHlxiVYvuK+cUwxceVaB6eVlXuA7fkPjK5JvCm1mkK6rokSHgEeh
 RfP6P9x9zxE9ISRMr9jeXzo2nnzDlyXGBvcCYLOMkBEseWN3kujrhZ2kZoL9l+5g9LJr4Jy9/m
 BmA=
X-SBRS: 2.7
X-MesageID: 10009325
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10009325"
Date: Fri, 13 Dec 2019 16:08:11 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191213160811.GN1155@perard.uk.xensource.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-5-anthony.perard@citrix.com>
 <63c7484e-4af0-8988-9308-10b9ad7871e0@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63c7484e-4af0-8988-9308-10b9ad7871e0@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH 4/8] xen: Have Kconfig check $(CC)'s
 version
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMDY6NTY6MDBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMi8xMi8yMDE5IDE4OjI3LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IGRp
ZmYgLS1naXQgYS94ZW4vTWFrZWZpbGUgYi94ZW4vTWFrZWZpbGUKPiA+IGluZGV4IGVmYmU5NjA1
ZTUyYi4uMGNmNGRlZDlkOWQ0IDEwMDY0NAo+ID4gLS0tIGEveGVuL01ha2VmaWxlCj4gPiArKysg
Yi94ZW4vTWFrZWZpbGUKPiA+IEBAIC0yNjcsNiArMjY3LDcgQEAgJChmb3JlYWNoIGJhc2UsYXJj
aC94ODYvbW0vZ3Vlc3Rfd2Fsa18lIFwKPiA+ICAgICAgICAgICAgICAgICBhcmNoL3g4Ni9tbS9z
aGFkb3cvZ3Vlc3RfJSwgXAo+ID4gICAgICAkKGZvcmVhY2ggZXh0LG8gaSBzLCQoY2FsbCBidWls
ZC1pbnRlcm1lZGlhdGUsJChiYXNlKS4kKGV4dCkpKSkKPiA+ICAKPiA+ICtleHBvcnQgQ0MgTEQK
PiAKPiBUaGlzIHByb2JhYmx5IHdhbnRzIHRvIGJlIGhpZ2hlciB1cCB0aGUgZmlsZSwgd2hlcmUg
d2UgZXhwb3J0IGFsbCB0aGUKPiBvdGhlciB2YXJpYWJsZXMuwqAgUGVyaGFwcyBhbHNvIGluY2x1
ZGUgQ1hYLgoKSSdsbCBtb3ZlIHRoYXQgdG8ganVzdCBhZnRlciAiZXhwb3J0IFBZVEhPTiIuIChP
ciBtYXliZSBpdCBzaG91bGQgYmUKYWZ0ZXIgd2UgaW5jbHVkZSBDb25maWcubWs/IEJ1dCBpdCBw
cm9iYWJseSBkb2Vzbid0IG1hdHRlciB3aGVyZSBpdCBpcy4pCgo+IE90aGVyd2lzZSwgQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MsCgot
LSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
