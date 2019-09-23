Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA839BB2E4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 13:36:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCMbk-0006zF-NX; Mon, 23 Sep 2019 11:34:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sJPS=XS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iCMbk-0006zA-2R
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 11:34:20 +0000
X-Inumbo-ID: 147ba632-ddf6-11e9-b299-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 147ba632-ddf6-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 11:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569238458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C9V1XNGNGp3lxusvYzURNgPlcqbaOJdj/BFIgjmuZUc=;
 b=UFbslMovEZ7RjehjInSv6N9Va9CfnzuByBXLMYuhUY515A2W1AyTgbKi
 k5Av6Xrl5jR7bE7Xycf2QoE99eP5Uuqi2nNS8BszoiVfmypav7HjPG5ZG
 to54Xk24Di8/zioXT4PnIK5P2/mjJed4V1ebKTkisGmkjKywUeyaX71io 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YNDaxjBmlHXItYbIOHbykDFk3488MaibJbPtF6Tu+ihPIn5yiVf3iFFF4keHUus5fGaMJPbk/g
 /3UAVqG3i0DnZeuiYUUkZtCjp3iDmnlscv6C/XteCsR0OG2t9auA+BGMnhImG2oIWyn2pD8uBY
 L7emd/ojXGANxJEZcRe2KYu6o+7DVxc/+aII2WboEcB06py8at6E8bEWodfvlYvnJH8na+lT8w
 YlotNOew9oYuIKuopqhpmPX+fzlO/pk1yzh5w7h6i8XXJUUri8yRMyUHwfFShUqZU/cnhQq49x
 ORw=
X-SBRS: 2.7
X-MesageID: 6137737
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,539,1559534400"; 
   d="scan'208";a="6137737"
Date: Mon, 23 Sep 2019 12:34:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190923113415.GA1163@perard.uk.xensource.com>
References: <20190918115702.38959-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918115702.38959-1-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH] xen-block: treat XenbusStateUnknown the
 same as XenbusStateClosed
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 xen-devel@lists.xenproject.org, Mark Syms <mark.syms@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMTI6NTc6MDJQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFdoZW4gYSBmcm9udGVuZCBncmFjZWZ1bGx5IGRpc2Nvbm5lY3RzIGZyb20gYW4gb2Zm
bGluZSBiYWNrZW5kLCBpdCB3aWxsCj4gc2V0IGl0cyBvd24gc3RhdGUgdG8gWGVuYnVzU3RhdGVD
bG9zZWQuIFRoZSBjb2RlIGluIHhlbi1ibG9jay5jIGNvcnJlY3RseQo+IGRlYWxzIHdpdGggdGhp
cyBhbmQgc2V0cyB0aGUgYmFja2VuZCBpbnRvIFhlbmJ1c1N0YXRlQ2xvc2VkLiBVbmZvcnR1bmF0
ZWx5Cj4gaXQgaXMgcG9zc2libGUgZm9yIHRvb2xzdGFjayB0byBhY3R1YWxseSBkZWxldGUgdGhl
IGZyb250ZW5kIGFyZWEKPiBiZWZvcmUgdGhlIHN0YXRlIGtleSBoYXMgYmVlbiByZWFkLCBsZWFk
aW5nIHRvIGFuIGFwcGFyZW50IGZyb250ZW5kIHN0YXRlCj4gb2YgWGVuYnVzU3RhdGVVbmtub3du
LiBUaGlzIHByZXZlbnRzIHRoZSBiYWNrZW5kIHN0YXRlIGZyb20gdHJhbnNpdGlvbmluZwo+IHRv
IFhlbmJ1c1N0YXRlQ2xvc2VkIGFuZCBoZW5jZSBsZWF2ZXMgaXQgbGltYm8uCj4gCj4gVGhpcyBw
YXRjaCBzaW1wbHkgdHJlYXRzIGEgZnJvbnRlbmQgc3RhdGUgb2YgWGVuYnVzU3RhdGVVbmtub3du
IHRoZSBzYW1lCj4gYXMgWGVuYnVzU3RhdGVDbG9zZWQsIHdoaWNoIHdpbGwgdW5ibG9jayB0aGUg
YmFja2VuZCBpbiB0aGVzZSBjaXJjdW1zdGFuY2VzLgo+IAo+IFJlcG9ydGVkLWJ5OiBNYXJrIFN5
bXMgPG1hcmsuc3ltc0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
