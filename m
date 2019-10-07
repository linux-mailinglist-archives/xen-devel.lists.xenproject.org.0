Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF54FCE371
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 15:27:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHSzr-0006DH-PX; Mon, 07 Oct 2019 13:24:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rbBj=YA=dingwall.me.uk=james@srs-us1.protection.inumbo.net>)
 id 1iHSzq-0006DC-5F
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 13:24:18 +0000
X-Inumbo-ID: c1efb262-e905-11e9-97b0-12813bfff9fa
Received: from know-smtprelay-omc-4.server.virginmedia.net (unknown
 [80.0.253.68]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1efb262-e905-11e9-97b0-12813bfff9fa;
 Mon, 07 Oct 2019 13:24:15 +0000 (UTC)
Received: from mail0.xen.dingwall.me.uk ([82.47.84.47]) by cmsmtp with ESMTPA
 id HSzli2qKKikXKHSzli2z4j; Mon, 07 Oct 2019 14:24:14 +0100
X-Originating-IP: [82.47.84.47]
X-Authenticated-User: james.dingwall@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.3 cv=JpzfUvwC c=1 sm=1 tr=0 a=0bfgdX8EJi0Cr9X0x0jFDA==:117
 a=0bfgdX8EJi0Cr9X0x0jFDA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=kj9zAlcOel0A:10 a=xqWC_Br6kY4A:10 a=XobE76Q3jBoA:10 a=5IRWAbXhAAAA:8
 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=yPCof4ZbAAAA:8 a=8Yx54hmJfqv9zaizVboA:9
 a=NA0mioxrYjfIsyVE:21 a=yyYMGV6NDAEi3BFP:21 a=CjuIK1q_8ugA:10
 a=xo7gz2vLY8DhO4BdlxfM:22 a=AjGcO6oz07-iQ99wixmX:22 a=WzC6qhA0u3u7Ye7llzcV:22
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id ED85511B8E9;
 Mon,  7 Oct 2019 13:24:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id GHLMn-0h2pRW; Mon,  7 Oct 2019 13:24:12 +0000 (UTC)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk
 [IPv6:2001:470:695c:302::c0a8:105])
 by dingwall.me.uk (Postfix) with ESMTP id A18BE11B8E6;
 Mon,  7 Oct 2019 13:24:12 +0000 (UTC)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id 821AD107673; Mon,  7 Oct 2019 13:24:12 +0000 (UTC)
Date: Mon, 7 Oct 2019 13:24:12 +0000
From: James Dingwall <james@dingwall.me.uk>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <20191007132412.GA27773@dingwall.me.uk>
References: <20191001150355.25365-1-jgross@suse.com>
 <547479f7-bbb3-609c-fcc7-4e2e609823ae@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <547479f7-bbb3-609c-fcc7-4e2e609823ae@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CMAE-Envelope: MS4wfIW4I2E6zkZiCpUZ/S++fnzYeMMvjbPi6fGFkK6rapdFbM9gdoLT5/gBGyVI0nLCPpuIS1EWXnWGEK9ohK85n8r6/YHwXApZFYAhqkCEQCWPhPiuMCAN
 GsaxkL3utAI5Leyjbfkc9u4c8PTx3F0se5gXKJi4WC6J7G1/V2odnrG286MMHIWHDLv3GWTlVjq19j4LIELouDgy49UiZCObAu6etPwa/clnf2ECtyHQiHGl
 MpSeu6ptLegHZP457w/haphrNUeOY2x7ulIuCnLRIA5ojWeUYaKYCVoHO4mcvksI7G4rzIPoGaQ66Mw/hic5UUs4A6ihH+guhJSOTAHJc0Y=
Subject: Re: [Xen-devel] [PATCH] xen/xenbus: fix self-deadlock after killing
 user process
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
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDE6Mzc6MjRQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDEwLzEvMTkgMTE6MDMgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPiBJ
biBjYXNlIGEgdXNlciBwcm9jZXNzIHVzaW5nIHhlbmJ1cyBoYXMgb3BlbiB0cmFuc2FjdGlvbnMg
YW5kIGlzIGtpbGxlZAo+ID4gZS5nLiB2aWEgY3RybC1DIHRoZSBmb2xsb3dpbmcgY2xlYW51cCBv
ZiB0aGUgYWxsb2NhdGVkIHJlc291cmNlcyBtaWdodAo+ID4gcmVzdWx0IGluIGEgZGVhZGxvY2sg
ZHVlIHRvIHRyeWluZyB0byBlbmQgYSB0cmFuc2FjdGlvbiBpbiB0aGUgeGVuYnVzCj4gPiB3b3Jr
ZXIgdGhyZWFkOgo+ID4KPiA+IFsgMjU1MS40NzQ3MDZdIElORk86IHRhc2sgeGVuYnVzOjM3IGJs
b2NrZWQgZm9yIG1vcmUgdGhhbiAxMjAgc2Vjb25kcy4KPiA+IFsgMjU1MS40OTIyMTVdICAgICAg
IFRhaW50ZWQ6IFAgICAgICAgICAgIE9FICAgICA1LjAuMC0yOS1nZW5lcmljICM1Cj4gPiBbIDI1
NTEuNTEwMjYzXSAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9odW5nX3Rhc2tfdGltZW91dF9z
ZWNzIiBkaXNhYmxlcyB0aGlzIG1lc3NhZ2UuCj4gPiBbIDI1NTEuNTI4NTg1XSB4ZW5idXMgICAg
ICAgICAgRCAgICAwICAgIDM3ICAgICAgMiAweDgwMDAwMDgwCj4gPiBbIDI1NTEuNTI4NTkwXSBD
YWxsIFRyYWNlOgo+ID4gWyAyNTUxLjUyODYwM10gIF9fc2NoZWR1bGUrMHgyYzAvMHg4NzAKPiA+
IFsgMjU1MS41Mjg2MDZdICA/IF9jb25kX3Jlc2NoZWQrMHgxOS8weDQwCj4gPiBbIDI1NTEuNTI4
NjMyXSAgc2NoZWR1bGUrMHgyYy8weDcwCj4gPiBbIDI1NTEuNTI4NjM3XSAgeHNfdGFsa3YrMHgx
ZWMvMHgyYjAKPiA+IFsgMjU1MS41Mjg2NDJdICA/IHdhaXRfd29rZW4rMHg4MC8weDgwCj4gPiBb
IDI1NTEuNTI4NjQ1XSAgeHNfc2luZ2xlKzB4NTMvMHg4MAo+ID4gWyAyNTUxLjUyODY0OF0gIHhl
bmJ1c190cmFuc2FjdGlvbl9lbmQrMHgzYi8weDcwCj4gPiBbIDI1NTEuNTI4NjUxXSAgeGVuYnVz
X2ZpbGVfZnJlZSsweDVhLzB4MTYwCj4gPiBbIDI1NTEuNTI4NjU0XSAgeGVuYnVzX2Rldl9xdWV1
ZV9yZXBseSsweGM0LzB4MjIwCj4gPiBbIDI1NTEuNTI4NjU3XSAgeGVuYnVzX3RocmVhZCsweDdk
ZS8weDg4MAo+ID4gWyAyNTUxLjUyODY2MF0gID8gd2FpdF93b2tlbisweDgwLzB4ODAKPiA+IFsg
MjU1MS41Mjg2NjVdICBrdGhyZWFkKzB4MTIxLzB4MTQwCj4gPiBbIDI1NTEuNTI4NjY3XSAgPyB4
Yl9yZWFkKzB4MWQwLzB4MWQwCj4gPiBbIDI1NTEuNTI4NjcwXSAgPyBrdGhyZWFkX3BhcmsrMHg5
MC8weDkwCj4gPiBbIDI1NTEuNTI4NjczXSAgcmV0X2Zyb21fZm9yaysweDM1LzB4NDAKPiA+Cj4g
PiBGaXggdGhpcyBieSBkb2luZyB0aGUgY2xlYW51cCB2aWEgYSB3b3JrcXVldWUgaW5zdGVhZC4K
PiA+Cj4gPiBSZXBvcnRlZC1ieTogSmFtZXMgRGluZ3dhbGwgPGphbWVzQGRpbmd3YWxsLm1lLnVr
Pgo+ID4gRml4ZXM6IGZkOGFhOTA5NWE5NWMgKCJ4ZW46IG9wdGltaXplIHhlbmJ1cyBkcml2ZXIg
Zm9yIG11bHRpcGxlIGNvbmN1cnJlbnQgeGVuc3RvcmUgYWNjZXNzZXMiKQo+ID4gQ2M6IDxzdGFi
bGVAdmdlci5rZXJuZWwub3JnPiAjIDQuMTEKPiA+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxi
b3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiAKClRlc3RlZC1ieTogSmFtZXMgRGluZ3dhbGwg
PGphbWVzQGRpbmd3YWxsLm1lLnVrPgoKVGhpcyBwYXRjaCBkb2VzIHJlc29sdmUgdGhlIG9ic2Vy
dmVkIGlzc3VlIGFsdGhvdWdoIGZvciBteSAoZXh0cmVtZSBhbmQgCm5vdCByZXByZXNlbnRhdGl2
ZSBvZiBvdXIgbm9ybWFsIHdvcmtsb2FkKSB0ZXN0IGNhc2UgdGhlIHdvcmtlciBzdGlsbCAKZ2V0
cyBibG9ja2VkIGZvciBzb21lIHRpbWUgaWYgdGhlIHhlbnN0b3JlLXJtIGlzIGludGVycnVwdGVk
IGFuZCBubyAKY29uY3VycmVudCB4ZW5zdG9yZSBjb21tYW5kcyBjYW4gcnVuLiAgSSBhc3N1bWUg
dGhhdCB0aGUgd29ya2VyIApjb21wbGV0ZXMgdGhlIHJtIGFuZCB0aGVuIGRvZXMgYSByb2xsYmFj
ayBpbiB0aGUgYmFja2dyb3VuZCByYXRoZXIgdGhhbiAKYmVpbmcgaW50ZXJydXB0ZWQgZWFybHkg
YXMgYSByZXN1bHQgb2YgdGhlIHVzZXJzcGFjZSBwcm9ncmFtIGJlaW5nIAp0ZXJtaW5hdGVkLgoK
VGhhbmtzLApKYW1lcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
