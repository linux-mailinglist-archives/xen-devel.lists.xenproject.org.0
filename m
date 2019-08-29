Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33284A192F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 13:47:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3IpJ-0003sj-LB; Thu, 29 Aug 2019 11:42:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mvu2=WZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i3IpI-0003se-F5
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 11:42:52 +0000
X-Inumbo-ID: 21459b32-ca52-11e9-ae64-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21459b32-ca52-11e9-ae64-12813bfff9fa;
 Thu, 29 Aug 2019 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567078971;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=29OUJS12gsGds1aFnnTYqij1GwSFcrFV0DezcMyMAnk=;
 b=ckvPxgj6pfyL7+/EPCpwzCN6WB5HnwIT2FsJGYFbxHb9lkdHrw2Cqyit
 fkySd85xPOb/OEnZzICjNi3O+FZFx1hqOmNadrOPsFEmOWaOZCgAb5Jso
 zctIVNXArUWHubGsY2GZzrwm2CZKfsLJw3LE+AT2r3m9lvuzhZiYnYKOD I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GjTN5795xBWNoa+lepa4XvBbaojV95PwqIfzogHxoOpREnFOTP2dejZvCNC451c101YgQl/DRv
 pBgdlMdimvGxpo3suW9pkb1exdyd3igNb7dvv1R8Z0WQLi1W+y2RL5ID9JQ+NUl+2lMCDRZKpc
 pXUBDmPSyY7zDqU4Zzkq3obGqhYpE7EYq/pvkndpuvehFhqDghNpkvGTflyJIoY185wDZgldgZ
 3maL7A1okiZ27r2vQS5oCGFi45/bYoWx0+mp9lHkW0bBhDp/yWYucL2uMktEHDSl+kUvgtVpLQ
 DN0=
X-SBRS: 2.7
X-MesageID: 5140884
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="5140884"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <f2e373ae-a327-bcdc-1c5c-b3351ae1ff4f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e163fa38-6a06-c422-4c23-7d5385590025@citrix.com>
Date: Thu, 29 Aug 2019 12:42:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f2e373ae-a327-bcdc-1c5c-b3351ae1ff4f@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86: clear RDRAND CPUID bit on AMD family
 15h/16h
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDgvMjAxOSAxMDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW5zcGlyZWQgYnkgTGlu
dXggY29tbWl0IGM0OWEwYTgwMTM3YzdjYTdkNmNlZDRjODEyYzllMDdhOTQ5ZjZmMjQ6Cj4KPiAg
ICAgVGhlcmUgaGF2ZSBiZWVuIHJlcG9ydHMgb2YgUkRSQU5EIGlzc3VlcyBhZnRlciByZXN1bWlu
ZyBmcm9tIHN1c3BlbmQgb24KPiAgICAgc29tZSBBTUQgZmFtaWx5IDE1aCBhbmQgZmFtaWx5IDE2
aCBzeXN0ZW1zLiBUaGlzIGlzc3VlIHN0ZW1zIGZyb20gYSBCSU9TCj4gICAgIG5vdCBwZXJmb3Jt
aW5nIHRoZSBwcm9wZXIgc3RlcHMgZHVyaW5nIHJlc3VtZSB0byBlbnN1cmUgUkRSQU5EIGNvbnRp
bnVlcwo+ICAgICB0byBmdW5jdGlvbiBwcm9wZXJseS4KPgo+ICAgICBVcGRhdGUgdGhlIENQVSBp
bml0aWFsaXphdGlvbiB0byBjbGVhciB0aGUgUkRSQU5EIENQVUlEIGJpdCBmb3IgYW55IGZhbWls
eQo+ICAgICAxNWggYW5kIDE2aCBwcm9jZXNzb3IgdGhhdCBzdXBwb3J0cyBSRFJBTkQuIElmIGl0
IGlzIGtub3duIHRoYXQgdGhlIGZhbWlseQo+ICAgICAxNWggb3IgZmFtaWx5IDE2aCBzeXN0ZW0g
ZG9lcyBub3QgaGF2ZSBhbiBSRFJBTkQgcmVzdW1lIGlzc3VlIG9yIHRoYXQgdGhlCj4gICAgIHN5
c3RlbSB3aWxsIG5vdCBiZSBwbGFjZWQgaW4gc3VzcGVuZCwgdGhlICJjcHVpZD1yZHJhbmQiIGtl
cm5lbCBwYXJhbWV0ZXIKPiAgICAgY2FuIGJlIHVzZWQgdG8gc3RvcCB0aGUgY2xlYXJpbmcgb2Yg
dGhlIFJEUkFORCBDUFVJRCBiaXQuCj4KPiAgICAgTm90ZSwgdGhhdCBjbGVhcmluZyB0aGUgUkRS
QU5EIENQVUlEIGJpdCBkb2VzIG5vdCBwcmV2ZW50IGEgcHJvY2Vzc29yCj4gICAgIHRoYXQgbm9y
bWFsbHkgc3VwcG9ydHMgdGhlIFJEUkFORCBpbnN0cnVjdGlvbiBmcm9tIGV4ZWN1dGluZyBpdC4g
U28gYW55Cj4gICAgIGNvZGUgdGhhdCBkZXRlcm1pbmVkIHRoZSBzdXBwb3J0IGJhc2VkIG9uIGZh
bWlseSBhbmQgbW9kZWwgd29uJ3QgI1VELgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IFNsaWdodGx5IFJGQywgaW4gcGFydGljdWxhciBi
ZWNhdXNlIG9mIHRoZSBjaGFuZ2UgdG8gcGFyc2VfeGVuX2NwdWlkKCk6Cj4gQWx0ZXJuYXRpdmUg
YXBwcm9hY2ggc3VnZ2VzdGlvbnMgYXJlIHdlbGNvbWUuCgpUaGlzIGlzc3VlIHdhcyBvbiBteSBy
YWRhciwgYnV0IEkgaGFkbid0IGdvdCBhcm91bmQgdG8gc3RhcnRpbmcgYSBwYXRjaCB5ZXQuCgpJ
IHdhcyB3b25kZXJpbmcgaWYgd2UgY291bGQgcGVyaGFwcyBkZWZhdWx0IGl0IHRvIHdoZXRoZXIg
UzMgd2FzCmF2YWlsYWJsZSwgYnV0IGxvb2tpbmcgYXQgdGhlIGNvZGUgd2hpY2ggcHJpbnRzICJB
Q1BJIHNsZWVwIG1vZGVzOiBTMyIsCml0IGRvZXNuJ3QgYXBwZWFyIHRvIGJlIHJlbGF0ZWQgdG8g
YW55IHJlYWwgQUNQSSBpbmZvcm1hdGlvbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
