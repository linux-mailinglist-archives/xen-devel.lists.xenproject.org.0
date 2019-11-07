Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68FF2E80
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 13:51:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iShEe-0001Si-Er; Thu, 07 Nov 2019 12:50:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/lk0=Y7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iShEd-0001SA-TS
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 12:49:59 +0000
X-Inumbo-ID: 1b297560-015d-11ea-984a-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b297560-015d-11ea-984a-bc764e2007e4;
 Thu, 07 Nov 2019 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573130999;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Yz3xcBw4jcdm/Y+C/ieXd7oW+gNictrJT61+hS0IECM=;
 b=FgqlPw0dAAt0en/dMlKo+3fDfsK225i6yKtA+xNkmgH+p1lQPZwZxhfc
 V5JqFhjDAQLIUKk7KoAjBuWioT9iNUDlIh8GySGruI+V35fzjEtfDRBGR
 1H+27IeiiP41yrisU7vqEQH6GJO43Dd4tJdfHqVErYM+ZMwWgBB5ztGaz s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tACHgME7/BdyGI+yOwbOW2869kFOcEFlF2LLvoZRdx2wG1nUSmkgn3eeI3YqRht9geMNMWE258
 DEVPMqcc5Mdhbm4l5mc7GA3n4s4IOtjs1T4woeKFGRUWZ8QCLdW8PaWjTkAqqbzSFWLhDK3rOY
 FvpwbQDgQbzss18nM6u0gqHqPNDBSIk1HSoSbsBNUPXH4Evhp/DCyr5d+jybAWSsiKKu+KUHzd
 6EOvlCl9EWZeMlV2XZFz1rFcsSXW+1As9npIWe44Fd87pQNWkbnjPRKD85MT60IUqqCnp0cwMh
 oGw=
X-SBRS: 2.7
X-MesageID: 8341032
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="8341032"
To: Jan Beulich <jbeulich@suse.com>
References: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
 <65dd1d8b-fc41-78f6-f988-d354c5ada99c@citrix.com>
 <f2aacaf9-0ad9-4920-82e6-b0abfc22bc5d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6b571fcc-4e8d-30ee-9c2d-faed1bd1cfbf@citrix.com>
Date: Thu, 7 Nov 2019 12:49:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f2aacaf9-0ad9-4920-82e6-b0abfc22bc5d@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 0/3] AMD/IOMMU: re-work mode updating
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Sander
 Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMTEvMjAxOSAwNzozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYuMTEuMjAxOSAx
ODozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDYvMTEvMjAxOSAxNToxNiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiB1cGRhdGVfcGFnaW5nX21vZGUoKSBpbiB0aGUgQU1EIElPTU1VIGNv
ZGUgZXhwZWN0cyB0byBiZSBpbnZva2VkIHdpdGgKPj4+IHRoZSBQQ0kgZGV2aWNlcyBsb2NrIGhl
bGQuIFRoZSBjaGVjayBvY2N1cnJpbmcgb25seSB3aGVuIHRoZSBtb2RlCj4+PiBhY3R1YWxseSBu
ZWVkcyB1cGRhdGluZywgdGhlIHZpb2xhdGlvbiBvZiB0aGlzIHJ1bGUgYnkgdGhlIG1ham9yaXR5
Cj4+PiBvZiBjYWxsZXJzIGRpZCBnbyB1bm5vdGljZWQgdW50aWwgcGVyLWRvbWFpbiBJT01NVSBz
ZXR1cCB3YXMgY2hhbmdlZAo+Pj4gdG8gZG8gYXdheSB3aXRoIG9uLWRlbWFuZCBjcmVhdGlvbiBv
ZiBJT01NVSBwYWdlIHRhYmxlcy4KPj4+Cj4+PiBVbmZvcnR1bmF0ZWx5IHRoZSBvbmx5IGhhbGYg
d2F5IHJlYXNvbmFibGUgZml4IHRvIHRoaXMgdGhhdCBJIGNvdWxkCj4+PiBjb21lIHVwIHdpdGgg
cmVxdWlyZXMgbW9yZSByZS13b3JrIHRoYW4gd291bGQgc2VlbSBkZXNpcmFibGUgYXQgdGhpcwo+
Pj4gdGltZSBvZiB0aGUgcmVsZWFzZSBwcm9jZXNzLCBidXQgYWRkcmVzc2luZyB0aGUgaXNzdWUg
c2VlbXMKPj4+IHVuYXZvaWRhYmxlIHRvIG1lIGFzIGl0cyBtYW5pZmVzdGF0aW9uIGlzIGEgcmVn
cmVzc2lvbiBmcm9tIHRoZQo+Pj4gSU9NTVUgcGFnZSB0YWJsZSBzZXR1cCByZS13b3JrLiBUaGUg
Y2hhbmdlIGFsc28gaXNuJ3Qgd2l0aG91dCByaXNrCj4+PiBvZiBmdXJ0aGVyIHJlZ3Jlc3Npb25z
IC0gaWYgaW4gcGF0Y2ggMiBJJ3ZlIG1pc3NlZCBhIGNvZGUgcGF0aCB0aGF0Cj4+PiB3b3VsZCBh
bHNvIG5lZWQgdG8gaW52b2tlIHRoZSBuZXcgaG9vaywgdGhlbiB0aGlzIG1pZ2h0IG1lYW4gbm9u
LQo+Pj4gd29ya2luZyBndWVzdHMgKHdpdGggcGFzc2VkLXRocm91Z2ggZGV2aWNlcyBvbiBBTUQg
aGFyZHdhcmUpLgo+Pj4KPj4+IDE6IEFNRC9JT01NVTogZG9uJ3QgbmVlZGxlc3NseSB0cmlnZ2Vy
IGVycm9ycy9jcmFzaGVzIHdoZW4gdW5tYXBwaW5nIGEgcGFnZQo+Pj4gMjogaW50cm9kdWNlIEdG
TiBub3RpZmljYXRpb24gZm9yIHRyYW5zbGF0ZWQgZG9tYWlucwo+Pj4gMzogQU1EL0lPTU1VOiB1
c2Ugbm90aWZ5X2RmbigpIGhvb2sgdG8gdXBkYXRlIHBhZ2luZyBtb2RlCj4+IEhhdmluZyBub3cg
bG9va2VkIGF0IGFsbCB0aHJlZSwgd2h5IGRvbid0IHdlIGp1c3QgZGVsZXRlIHRoZSBkeW5hbWlj
Cj4+IGhlaWdodCBvZiBBTUQgSU9NTVUgcGFnZXRhYmxlcz8KPj4KPj4gVGhpcyBzZXJpZXMgbG9v
a3Mgc3VzcGljaW91c2x5IGxpa2UgaXQgaXMgYWRkaW5nIG5ldyBjb21tb24KPj4gaW5mcmFzdHJ1
Y3R1cmUgdG8gd29yayBhcm91bmQgdGhlIGZhY3Qgd2UncmUgZG9pbmcgc29tZXRoaW5nIGZhaXJs
eSBkdW1iCj4+IHRvIGJlaW5nIHdpdGguCj4+Cj4+IEhhcmRjb2RpbmcgYXQgNCBsZXZlbHMgaXMs
IGF0IHRoZSB2ZXJ5IHdvcnN0LCAyIGV4dHJhIHBhZ2VzIHBlciBkb21haW4sCj4+IGFuZCBhIHN1
YnN0YW50aWFsIHJlZHVjdGlvbiBpbiB0aGUgY29tcGxleGl0eSBvZiB0aGUgSU9NTVUgY29kZS4K
PiBZZXQgYW4gYWRkaXRpb25hbCBsZXZlbCBvZiBwYWdlIHdhbGtzIGhhcmR3YXJlIGhhcyB0byBw
ZXJmb3JtLiBBbHNvCj4gNCBsZXZlbHMgd29uJ3QgY292ZXIgYWxsIHBvc3NpYmxlIDUyIGFkZHJl
c3MgYml0cy4gQW5kIGZpbmFsbHksIHRoZQo+IG1vcmUgYXBwbGljYWJsZSB5b3VyICJzdWJzdGFu
dGlhbCByZWR1Y3Rpb24iLCB0aGUgbGVzcyBzdWl0YWJsZSBzdWNoCj4gYSBjaGFuZ2UgbWF5IGJl
IGF0IHRoaXMgcG9pbnQgb2YgdGhlIHJlbGVhc2UgKGJ1dCBJIGRpZG4ndCBsb29rIGF0Cj4gdGhp
cyBzaWRlIG9mIHRoaW5ncyBpbiBhbnkgZGV0YWlsLCBzbyBpdCBtYXkgd2VsbCBub3QgYmUgYW4g
aXNzdWUpLgoKVGhlcmUgaXMsIGluIHByYWN0aWNlLCBubyBzdWNoIHRoaW5nIGFzIGFuIEhWTSBn
dWVzdCB1c2luZyAyIGxldmVscy7CoApUaGUgVlJBTSBqdXN0IGJlbG93IHRoZSA0RyBib3VuZGFy
eSB3aWxsIGZvcmNlIGEgcmVzaXplIHRvIDMgbGV2ZWxzCmR1cmluZyBkb21haW4gY29uc3RydWN0
aW9uLCBhbmQgYXMgYSAxLWxpbmUgZml4IGZvciA0LjEzLCB0aGlzIHByb2JhYmx5Cmlzbid0IHRo
ZSB3b3JzdCBpZGVhIGdvaW5nLgoKVGhlcmUgYXJlIG5vIEFNRCBzeXN0ZW1zIHdoaWNoIHN1cHBv
cnQgPjQ4IGJpdCBQQSBzcGFjZSwgc28gNCBsZXZlbHMgaXMKc3VmZmljaWVudCBmb3Igbm93LCBi
dXQgZnVuZGFtZW50YWxseSBkZXRhaWxzIHN1Y2ggYXMgdGhlIHNpemUgb2YgR1BBCnNwYWNlIHNo
b3VsZCBiZSBzcGVjaWZpZWQgaW4gZG9tYWluX2NyZWF0ZSgpIGFuZCByZW1haW4gc3RhdGljIGZv
ciB0aGUKbGlmZXRpbWUgb2YgdGhlIGRvbWFpbi4KCkFzIGZhciBhcyBJIGNhbiB0ZWxsLCBpdCBp
cyBvbmx5IEFNRCBzeXN0ZW1zIHdpdGggSU9NTVVzIHdoaWNoIHBlcm1pdAp0aGUgUEEgc3BhY2Ug
dG8gYmUgdmFyaWFibGUsIGFuZCBJIHN0aWxsIGNhbid0IGhlbHAgYnV0IGZlZWxpbmcgdGhhdAp0
aGlzIHNlcmllcyBpcyBhdHRlbXB0aW5nIHRvIHdvcmsgYXJvdW5kIGEgcHJvYmxlbSB3ZSBzaG91
bGRuJ3QgaGF2ZSBpbgp0aGUgZmlyc3QgcGxhY2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
