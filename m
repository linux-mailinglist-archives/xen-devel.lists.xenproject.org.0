Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4621092AD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 18:16:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZHw9-0001YD-Ss; Mon, 25 Nov 2019 17:14:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nqy9=ZR=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iZHw8-0001Xr-IO
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 17:14:08 +0000
X-Inumbo-ID: fcf7a7b2-0fa6-11ea-a393-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcf7a7b2-0fa6-11ea-a393-12813bfff9fa;
 Mon, 25 Nov 2019 17:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574702048;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=We+zsalR6CaS0l2kb86QVbtaOvp5inrzRB1eRjKlrxw=;
 b=HjL5ehMRf3nIblqhrXJRCMhieGpO270JQGssiDwosyDyjJdPeZ+cryUx
 B3tR+d97bN+mxW7lCjAwajLvQf3dXZW+WYzGTSC6rUZeImzdLLgPtN5jX
 i2PD/FaqJz1t98tvwS3n5W+WMxNmeiYapelSM6BJeScpjx+LmTdfCaBUa o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fWNYM2Md/laZF215hcyWtRBNnAl5jIMRkpnoYj/zsf7oqxBevM0X7/D39w8vELL4fWQDpR/oO8
 0aQeaj6S7dOJIg+VwUaBWBoHYP+bj4H9vEUnEeE6fNJSL/6/pjvVcEbXsxVFNCBBjEHxwiQM0q
 Rjtzk5NAReYR/E5v4NVRqUHswZpa3pB0924BpcOCPh6OuDP4BRyM3sNS/L7RYsnNiM2eCgtXOM
 5CZU8bD74Sr1va+uo47Ai8S6McjdjkwtDk7OS14W2QUy/kKMdIvK8RWxLxGr2UCjQNhi9PlZRj
 BH8=
X-SBRS: 2.7
X-MesageID: 8810332
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,242,1571716800"; 
   d="scan'208";a="8810332"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20191105153745.74257-1-wipawel@amazon.de>
 <20191105153745.74257-2-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <eac280a8-0e8b-2fcb-b25a-508b352a81a4@citrix.com>
Date: Mon, 25 Nov 2019 17:14:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105153745.74257-2-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
Cc: wipawel@amazon.com, mpohlack@amazon.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvNS8xOSAzOjM3IFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGlzIGlz
IG5lZWRlZCBmb3IgbW9yZSBwcmVjaXNlIHBhdGNoYWJpbGl0eSB2ZXJpZmljYXRpb24uCj4gT25s
eSBub24tc3BlY2lhbCAucm9kYXRhIHNlY3Rpb25zIHNob3VsZCBiZSBzdWJqZWN0Cj4gZm9yIHN1
Y2ggYSBub24tcmVmZXJlbmNlZCBjaGVjayBpbiBrcGF0Y2hfdmVyaWZ5X3BhdGNoYWJpbGl0eSgp
Lgo+IEN1cnJlbnQgY2hlY2sgKG5vbi1zdGFuZGFyZCwgbm9uLXJlbGEsIG5vbi1kZWJ1ZykgaXMg
dG9vIHdlYWsgYW5kCj4gYWxsb3dzIGFsc28gbm9uLXJvZGF0YSBzZWN0aW9ucyB3aXRob3V0IHJl
ZmVyZW5jZWQgc3ltYm9scyB0byBzbGlwCj4gdGhyb3VnaC4KPiAKPiBEZXRlY3QgLnJvZGF0YSBz
ZWN0aW9uIGJ5IGNoZWNraW5nIHNlY3Rpb24ncyB0eXBlIChTSFRfUFJPR0JJVFMpLAo+IGZsYWdz
IChubyBleGVjLCBubyB3cml0ZSkgYW5kIGZpbmFsbHkgbmFtZSBwcmVmaXguCj4gCj4gU2lnbmVk
LW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmll
d2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gUmV2
aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6
IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IC0tLQpSZXZpZXdlZC1ieTog
Um9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
