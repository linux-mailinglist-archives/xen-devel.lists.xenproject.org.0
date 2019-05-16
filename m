Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3692720DBC
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 19:11:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRJsp-0004Qf-02; Thu, 16 May 2019 17:09:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Nh3=TQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRJsm-0004QV-Uo
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 17:09:28 +0000
X-Inumbo-ID: 5c6389fb-77fd-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5c6389fb-77fd-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 17:09:27 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 1jxSBR3M7E7iI+a7fJrmVjLZ/Y5Aty0vUUZi1Nidr4qlz6QtVGOoEZVRRMcD4eMhQBQE0rstCI
 nS57QtIZfQ+BtLiRKKiSYI34BQXJCYctecWjzmBxwwuFqwzRVh5bydpT/iGht5DQlN/ANcvg7S
 RYiBMJNXNtnwober5AurtKz6x4jceh1VyT4IvYrUNxRHEZDLOfrufZiuZXQC9iGaQu8BdUDXNW
 ab0rTc7X+iJDumdqKb6ZCiKuxOaNDd4cqKoWp8q2Hv1thp/63WNyEYRUj8SLzOS/kTIQ7ijp7x
 TrM=
X-SBRS: 2.7
X-MesageID: 539016
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,477,1549947600"; 
   d="scan'208";a="539016"
To: Ian Jackson <ian.jackson@citrix.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
 <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
 <23773.36109.688404.996152@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0ebf5b95-9175-b45c-3c41-a703115d55f6@citrix.com>
Date: Thu, 16 May 2019 18:09:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23773.36109.688404.996152@mariner.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] preparations for 4.11.2
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDUvMjAxOSAxNzoxNywgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW5kcmV3IENvb3BlciB3
cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gcHJlcGFyYXRpb25zIGZvciA0LjExLjIiKToKPj4gSW4g
YWRkaXRpb24sCj4gVGhhbmtzLgo+Cj4gPT09PSB3YW50aW5nIGRpc2N1c3Npb246ID09PT0KPgo+
PiAzNjVhYWJiNmU1MDIgInRvb2xzL2xpYnhlbmRldmljZW1vZGVsOiBhZGQKPj4geGVuZGV2aWNl
bW9kZWxfbW9kaWZpZWRfbWVtb3J5X2J1bGsgdG8gbWFwIiBpcyBwb3NzaWJseSBhIGNhbmRpZGF0
ZSwgYnV0Cj4+IGlzIGFsc28gY29tcGxpY2F0ZWQgYnkgdGhlIHN0YWJsZSBTT05BTUUuwqAgSXQg
aXMgcGVyaGFwcyBlYXNpZXN0IHRvCj4+IGlnbm9yZSwgc2VlaW5nIGFzIHRoZSBpc3N1ZSBoYXMg
YWxyZWFkeSBnb25lIHVubm90aWNlZCBmb3IgMiB5ZWFycy4KPiBXZSB3b3VsZCBiZSBidW1waW5n
IHRoZSBtaW5vciB2ZXJzaW9uLiAgSSB0aGluayBpdCBpcyBBQkkgY29tcGF0aWJsZS4KPiBTbyBJ
IGFtIGluY2xpbmVkIHRvIGJhY2twb3J0IHRoaXMgb25lIGJ1dCBJIGhhdmVuJ3QgZG9uZSBzbyB5
ZXQuCj4KPj4gMTI5MDI1ZmUzMDkzICJveGVuc3RvcmVkOiBEb24ndCByZS1vcGVuIGEgeGVuY3Ry
bCBoYW5kbGUgZm9yIGV2ZXJ5Cj4+IGRvbWFpbiBpbnRyb2R1Y3Rpb24iCj4gQ2FuIHlvdSBqdXN0
aWZ5IGhvdyB0aGlzIGlzIGEgYnVnZml4ID8gIEl0IGRvZXNuJ3Qgc2VlbSBsaWtlIGJhY2twb3J0
Cj4gbWF0ZXJpYWwgdG8gbWUuCgpJdCB3YXMgZm91bmQgZnJvbSBzdHJhY2UgKHdoaWxlIGludmVz
dGlnYXRpbmcgYW4gdW5yZWxhdGVkIGlzc3VlKSwgYnV0CmdpdmVuIGhvdyBtYW55IGlzc3VlcyB3
ZSd2ZSBoYWQgaW4gdGhlIHBhc3Qgd2l0aCB7byx9eGVuc3RvcmVkIGV4Y2VlZGluZwppdHMgRkQg
bGltaXQsIEknZCBzdGlsbCBwdXQgaXQgaW4gdGhlIGNhdGVnb3J5IG9mIGJ1Z2ZpeC4KCkl0IGJh
bGxvb25zIHRoZSB3b3JzdC1jYXNlIEZEIHJlcXVpcmVtZW50cyBieSBhcyBtYW55IGNvbmN1cnJl
bnQgZG9tYWluCnN0YXJ0cyBhcyB0aGUgcmVzdCBvZiBkb20wIGNhbiBtYW5hZ2UuCgo+Cj4+IDdi
MjBhODY1YmMxMCAidG9vbHMvb2NhbWw6IFJlbGVhc2UgdGhlIGdsb2JhbCBsb2NrIGJlZm9yZSBp
bnZva2luZyBibG9jawo+PiBzeXNjYWxscyIKPiBUaGlzICpyZWFsbHkqIGRvZXNuJ3QgbG9vayBs
aWtlIGEgYnVnZml4LCBsZXQgYWxvbmUgYSBiYWNrcG9ydAo+IGNhbmRpZGF0ZSAhICBSZW1vdmlu
ZyBhIGxvY2sgZm9yIHBlcmZvcm1hbmNlIHJlYXNvbnMgIQoKT2YgY291cnNlIGl0cyBhIGJhY2tw
b3J0IGNhbmRpZGF0ZSwgYW5kIGl0IGlzIGEgYnVnZml4IGV2ZW4gaWYgbW9zdCBvZgp0aGUgdGlt
ZSBpdCBpcyBvbmx5IG9ic2VydmVkIGFzIGEgcGVyZiBpbXByb3ZlbWVudC4KClRoZSBPY2FtbCBG
Rkkgc2F5cyAidGhvdSBzaGFsdCBub3QgbWFrZSBhIHN5c2NhbGwgaG9sZGluZyB0aGlzIGxvY2si
LApiZWNhdXNlIHdoaWxlIHRoYXQgbG9jayBpcyBoZWxkLCBldmVyeXRoaW5nIGlzIHNpbmdsZSB0
aHJlYWRlZC4KCklJUkMsIHRoaXMgcGFydGljdWxhciBpc3N1ZSBsZWFkIHRvIGEgcGFydGlhbCBv
dXRhZ2Ugb2Ygb25lIG9mIG91ciBIVFRQCkFQSSBlbmRwb2ludHMuCgo+Cj4+IGMzOTNiNjRkY2Vl
NiAidG9vbHMvbGlieGM6IEZpeCBpc3N1ZXMgd2l0aCBsaWJ4YyBhbmQgWGVuIGhhdmluZwo+PiBk
aWZmZXJlbnQgZmVhdHVyZXNldCBsZW5ndGhzIgo+IFRoZSBjb21wYXRpYmlsaXR5IGltcGxpY2F0
aW9ucyBoZXJlIGFyZSBub3QgY2xlYXJseSBzcGVsbGVkIG91dCBpbiB0aGUKPiBjb21taXQgbWVz
c2FnZS4gIEFGQUlDVCwgYWZ0ZXIgdGhpcyBjb21taXQsIHRoZSBlZmZlY3QgaXM6Cj4gICAtIG5l
dyB0b29scyB3aWxsIHdvcmsgd2l0aCBvbGQgaHlwZXJ2aXNvcgo+ICAgLSBvbGQgdG9vbHMgd2ls
bCBub3QgbmVjZXNzYXJpbG95IHdvcmsgd2l0aCBvbGQgaHlwZXJ2aXNvcgo+IEkgYXNzdW1lIHRo
YXQgd2UgYXJlIHRhbGtpbmcgaGVyZSBhYm91dCBvbGQgYW5kIG5ldyBjb2RlIHdpdGggdGhlIHNh
bWUKPiBYZW4gdmVyc2lvbiwgZWcgYXMgYSByZXN1bHQgb2YgYSBzZWN1cml0eSBmaXguCj4KPiBU
aGUgcHJldmlvdXMgYmVoYXZpb3VyLCBpZSwgd2hhdCBoYXBwZW5zIHdpdGhvdXQgdGhpcyBwYXRj
aCwgaXMgbm90Cj4gZW50aXJlbHkgY2xlYXIgdG8gbWUuCgpUaGlzIHdhcyBhbiB1bmludGVuZGVk
IGNvbnNlcXVlbmNlIG9mIFhTQS0yNTMgKFNwZWN0cmUvTWVsdGRvd24pIHdoZXJlCnRoZSBsZW5n
dGggb2YgdGhlIGZlYXR1cmVzZXQgZGlkIGluY3JlYXNlIGluIGEgc2VjdXJpdHkgZml4LgoKSW4g
dGhlIHBlcmlvZCBvZiB0aW1lIGJldHdlZW4gaW5zdGFsbGluZyB1cGRhdGVkIGRvbTAgdXNlcnNw
YWNlCnBhY2thZ2VzLCBhbmQgcmVib290aW5nIGludG8gdGhlIG5ldyBoeXBlcnZpc29yLCBhdHRl
bXB0aW5nIHRvIHN0YXJ0IGEKZ3Vlc3QgcmVzdWx0cyBpbiBsaWJjIGhlYXAgY29ycnVwdGlvbiBh
bmQgYW4gYWJvcnQoKS4KCkJlY2F1c2UgbGlieGwgZG9lc24ndCB1c2VkIHRoZSBwYXJ0aWFsbHkt
aW1wcm92ZWQgQ1BVSUQgZnVuY3Rpb25hbGl0eQp5ZXQsIGl0IGRvZXNuJ3QgaGl0IHRoZSBzZWNv
bmQgYnVnIG9mIGluY29taW5nIG1pZ3JhdGVzIGdldHRpbmcKaW50ZXJtaXR0ZW50bHkgcmVqZWN0
ZWQgZHVlIHRvIDQvOCBieXRlcyBvZiBoZWFwIG1ldGFkYXRhIGJlaW5nIGluY2x1ZGVkCmluIHRo
ZSBDUFVJRCBzYWZldHkgY2hlY2suCgo+PiA4Mjg1NWFiYTViZjkgInRvb2xzL2xpYnhjOiBGaXgg
ZXJyb3IgaGFuZGxpbmcgaW4gZ2V0X2NwdWlkX2RvbWFpbl9pbmZvKCkiCj4gVGhpcyBtaWdodCBi
cmVhayBzb21lIGNhbGxlcnMsIG1pZ2h0bid0IGl0ID8gIFdoYXQgY2FsbGVycyA/ICBPciBpcwo+
IHRoZXJlIGFuIGFyZ3VtZW50IHRoYXQgdGhlcmUgYXJlbid0IGNhbGxlcnMgd2hpY2ggd2lsbCBi
ZSBicm9rZW4gPwoKVGhpcyB3YXMgZnJvbSB0aGUgc2FtZSBiaXQgb2YgZGVidWdnaW5nIGFzIGFi
b3ZlLCBhbmQgSVNUUiBjYXVzZWQgc29tZQplcnJvciBtZXNzYWdlcyBpbiBoaWdoZXIgY2FsbGVy
cyB0byBwcmludCBqdW5rIGluc3RlYWQgb2YgdGhlIHJlYWwgZXJyb3IuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
