Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F5C49FF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 10:53:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFaLs-0003sQ-2S; Wed, 02 Oct 2019 08:51:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G8yu=X3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFaLq-0003sJ-77
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 08:51:14 +0000
X-Inumbo-ID: c96c742a-e4f1-11e9-9711-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id c96c742a-e4f1-11e9-9711-12813bfff9fa;
 Wed, 02 Oct 2019 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570006273;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OEHgG1gapD7TTgxSyR7PqMxEKixdVLsezfrS1dQJyOU=;
 b=NtYUWhMgabh9P4s+dzyUj50umcXTXmYiJcwFymmLxpHChKv1PfI67GS7
 jx7X84dpi80h3TmJP+eBS5wPISRsn3o1gQ7qcStxRIdMzKcb21sFfpxSA
 LauBspNLhQrlCaySWfpD+48BzmgB/Q9T6unzm2po/Zrag651SFBpgtNlZ M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I4jxX4+gIYBCvMcjlR+XaUkY0/+dp/f+X5u5R1F/TXWJcdj9Ya+jH8QR0ihXddRhLvcjH8WzNP
 HGDySrnfO5SLI4uDjndT5A+sk/Kw2LeN3itLhKkX/1/b9wUUMmCIcbfL8kUl8h+uwmVtIJDixr
 MqCir7jGicMZXeWwj5MHv5w294hPEsoJJ9GsfAB8mjlM7S8+YdEw9CuwEzGyN90NJzX0cCTZZx
 bkuQIHKze5Z9ySAaVeRJP5+Us0gzFReasX8GhC9EVCi3XaRV1E96w0wcw3FVax1I9WlTfasdiZ
 tLs=
X-SBRS: 2.7
X-MesageID: 6351158
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,573,1559534400"; 
   d="scan'208";a="6351158"
To: Jan Beulich <jbeulich@suse.com>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
 <f075274c-46ed-bedd-9a0f-3ab157544cb1@suse.com>
 <16d3de95-bcb3-87c3-dec2-f436a17e4b29@citrix.com>
 <902700ef-3405-ecfd-45ba-fd0d6f63ac4d@suse.com>
 <3f304d31-5047-b4ec-83f1-aa1a65e341fc@citrix.com>
 <39e9ad3d-e3b0-e5c3-f115-33af4e2ee688@suse.com>
 <dfcfd2dc-65cb-e11b-0db2-535322c8275c@citrix.com>
 <9ee0114c-41ba-5d8e-1aef-5bccf1fb15dc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ce240495-a64f-db54-4162-890d0c524df7@citrix.com>
Date: Wed, 2 Oct 2019 09:51:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9ee0114c-41ba-5d8e-1aef-5bccf1fb15dc@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86emul: adjust MOVSXD source operand
 handling
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMTAvMjAxOSAwODowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDEuMTAuMjAxOSAy
MTo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSW4gdGhpcyBleGFtcGxlLCBoYXJkd2FyZSBj
YW4gdGhlIGVtdWxhdG9yIGNhbiBkaXNhZ3JlZSBieSB1c2luZyBhCj4+IGRpZmZlcmVudCBhY2Nl
c3Mgd2lkdGguCj4+Cj4+IEkndmUgYmVlbiBleHBlcmltZW50aW5nIHdpdGggbXkgUm9tZSBzeXN0
ZW0sIGFuZCBhbiBlbXVsYXRvciBoYXJkY29kZWQKPj4gdG8gdXNlIDItYnl0ZSBhY2Nlc3Nlcy7C
oCBBZnRlciBzb21lIGludmVzdGlnYXRpb24sIHRoZSBsaXZlbG9jayBvbmx5Cj4+IG9jY3VycyBm
b3IgYWNjZXNzLXJpZ2h0cyBmYXVsdHMuwqAgVHJhbnNsYXRpb24gZmF1bHRzIGdldCBpZGVudGlm
aWVkIGFzCj4+IG5vdCBhIHNoYWRvdyBmYXVsdCwgYW5kIGJvdW5jZWQgYmFjayB0byB0aGUgZ3Vl
c3QuCj4+Cj4+IFNoYWRvdyBndWVzdHMgY2FuIHVzZSBQS1JVLCBzbyBjYW4gZ2VuZXJhdGUgYW4g
YWNjZXNzIGZhdWx0IGJ5IG1hcmtpbmcKPj4gdGhlIHBhZ2UgYXQgMHgyMDAwIGFzIG5vLWFjY2Vz
cywgc28gSSB0aGluayB0aGF0IGluIHByaW5jaXBsZSwgdGhpcwo+PiBjaGFuZ2Ugd2lsbCByZXN1
bHQgaW4gYSBuZXcgbGF0ZW50IGxpdmVsb2NrIGNhc2UsIGJ1dCBJIGNhbid0IGFjdHVhbGx5Cj4+
IGNvbmZpcm0gaXQuCj4gSSB0aGluayBJIHNlZSB3aGF0IHlvdSBtZWFuLCBidXQgdGhlbiBJIGRv
bid0IHNlZSBob3cgdGhpcyBpcyBhbgo+IGFyZ3VtZW50IGFnYWluc3QgdGhlIHBhdGNoIGluIGl0
cyBjdXJyZW50IHNoYXBlOiBJdCBhY3R1YWxseQo+IHJlZHVjZXMgdGhlIGNhc2VzIG9mIGRpc2Fn
cmVlbWVudCBiZXR3ZWVuIGhhcmR3YXJlIGFuZCBlbXVsYXRvci4KCkF0IHRoZSBtb21lbnQsIHRo
ZSBlbXVsYXRvciBpcyBzdHJpY3RseSA0IGJ5dGVzLCBhbmQgaGFyZHdhcmUgbWF5IGJlIDQKb3Ig
Mi7CoCBUaGVyZWZvcmUsIHRoZXJlIGlzIG5vIGNoYW5jZSBvZiB0aGUgcGlwZWxpbmUgeWllbGRp
bmcgI1BGIHdoaWxlCnRoZSBlbXVsYXRvciB5aWVsZGluZyBPSy4KCldpdGggdGhlIGNoYW5nZSBp
biBwbGFjZSwgb2xkZXIgSW50ZWwgcGFydHMgd2hpY2ggZG8gdXNlIGEgNCBieXRlIGFjY2Vzcwpu
b3cgY29tZSB3aXRoIGEgcmlzayBvZiBsaXZlbG9jay7CoCBXaGljaGV2ZXIgcGFydHMgdGhlc2Ug
YXJlLCB0aGV5CnByZWRhdGUgUEtSVSBzbyBpbiB0aGlzIHNwZWNpZmljIGNhc2UsIHRoZSBwcm9i
bGVtIGlzIG9ubHkgdGhlb3JldGljYWwKQUZBSUNULgoKQWxzbywgaW4gdGhpcyBzcGVjaWZpYyBj
YXNlLCBJbnRlbCdzIHdhcm5pbmcgb2YgIkRvbid0IHVzZSB0aGlzCmluc3RydWN0aW9uIHdpdGhv
dXQgYSBSRVggcHJlZml4IiBtZWFucyB0aGF0IHdlIHNob3VsZG4ndCBzZWUgaXQgaW4KYW55dGhp
bmcgYnV0IHRlc3Qgc2NlbmFyaW9zLgoKPiBPbmUgcG9zc2liaWxpdHkgdG8gbWFrZSBhIGZ1cnRo
ZXIgc3RlcCBpbiB0aGF0IGRpcmVjdGlvbiB3b3VsZAo+IGJlIHRvIG1ha2UgYmVoYXZpb3IgZGVw
ZW5kZW50IHVwb24gdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUncwo+IHZlbmRvciwgcmF0aGVyIHRo
YW4gdGhlIG9uZSB0aGUgZ3Vlc3Qgc2Vlcy4KCkkgY29uc2lkZXJlZCB0aGlzLsKgIEl0IHdvdWxk
IHdvcmsgb24gbmF0aXZlIChhdCB0aGUgZXhwZW5zZSBvZgpjb21wbGljYXRpbmcgdGhlIGVtdWxh
dG9yKSwgYnV0IHdvbid0IHdvcmsgcHJvcGVybHkgaWYgWGVuIGlzCnZpcnR1YWxpc2llZCBhbmQg
bWlncmF0ZWQuwqAgSSBjYW4ndCBzZWUgYSB3YXkgYXJvdW5kIHRoaXMuCgpGdXJ0aGVybW9yZSwg
d2UgY2FuJ3QgZXhlY3V0ZSB0aGUgaW5zdHJ1Y3Rpb24gYWdhaW5zdCBhIG1hcHBpbmcgb2YgdGhl
Cmd1ZXN0LCBiZWNhdXNlIHRoZSBwcm9ibGVtIGhlcmUgaXMgZGV0ZXJtaW5pbmcgdGhlIHdpZHRo
IG9mIHRoZSBhY2Nlc3MsCndoaWNoIGlzIGluZm9ybWF0aW9uIG5lZWRlZCB0byBjb25zdHJ1Y3Qg
dGhlIG1hcHBpbmcgaW4gdGhlIGZpcnN0IHBsYWNlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
