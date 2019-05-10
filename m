Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AADC19E75
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:48:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5ra-0006MR-QN; Fri, 10 May 2019 13:47:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5rZ-0006ME-Jq
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:47:01 +0000
X-Inumbo-ID: 15b3745a-732a-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 15b3745a-732a-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 13:47:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1C07A78;
 Fri, 10 May 2019 06:46:59 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 139D43F575;
 Fri, 10 May 2019 06:46:57 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
 <253e3a5c-8e84-a671-499c-7009d93658bb@arm.com>
 <5CD57F9F020000780022D936@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9b8e78a4-db71-1b0d-a9c6-89a35e5feb2f@arm.com>
Date: Fri, 10 May 2019 14:46:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD57F9F020000780022D936@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8wNS8yMDE5IDE0OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMC4wNS4x
OSBhdCAxNTozNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTAvMDUvMjAx
OSAxNDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwNy4wNS4xOSBhdCAxNzoxNCwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiBAQCAtMTAzMCwxOSArMTAzMSwxOSBA
QCBsb25nIHAybV9wdF9hdWRpdF9wMm0oc3RydWN0IHAybV9kb21haW4gKnAybSkKPj4+PiBAQCAt
Mjc5NSw1NCArMjc5NSw1NCBAQCB2b2lkIGF1ZGl0X3AybShzdHJ1Y3QgZG9tYWluICpkLAo+Pj4+
ICAgICAgICBzcGluX2xvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7Cj4+Pj4gICAgICAgIHBhZ2Vf
bGlzdF9mb3JfZWFjaCAoIHBhZ2UsICZkLT5wYWdlX2xpc3QgKQo+Pj4+ICAgICAgICB7Cj4+Pj4g
LSAgICAgICAgbWZuID0gbWZuX3gocGFnZV90b19tZm4ocGFnZSkpOwo+Pj4+ICsgICAgICAgIG1m
biA9IHBhZ2VfdG9fbWZuKHBhZ2UpOwo+Pj4+ICAgIAo+Pj4+IC0gICAgICAgIFAyTV9QUklOVEso
ImF1ZGl0aW5nIGd1ZXN0IHBhZ2UsIG1mbj0lI2x4XG4iLCBtZm4pOwo+Pj4+ICsgICAgICAgIFAy
TV9QUklOVEsoImF1ZGl0aW5nIGd1ZXN0IHBhZ2UsIG1mbj0lIlBSSV9tZm4iXG4iLCBtZm5feCht
Zm4pKTsKPj4+PiAgICAKPj4+PiAgICAgICAgICAgIG9kID0gcGFnZV9nZXRfb3duZXIocGFnZSk7
Cj4+Pj4gICAgCj4+Pj4gICAgICAgICAgICBpZiAoIG9kICE9IGQgKQo+Pj4+ICAgICAgICAgICAg
ewo+Pj4+IC0gICAgICAgICAgICBQMk1fUFJJTlRLKCJ3cm9uZyBvd25lciAlI2x4IC0+ICVwKCV1
KSAhPSAlcCgldSlcbiIsCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgbWZuLCBvZCwgKG9k
P29kLT5kb21haW5faWQ6LTEpLCBkLCBkLT5kb21haW5faWQpOwo+Pj4+ICsgICAgICAgICAgICBQ
Mk1fUFJJTlRLKCJ3cm9uZyBvd25lciAlIlBSSV9tZm4iIC0+ICVwKCV1KSAhPSAlcCgldSlcbiIs
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWZuX3gobWZuKSwgb2QsIChvZD9vZC0+ZG9t
YWluX2lkOi0xKSwgZCwgZC0+ZG9tYWluX2lkKTsKPj4+Cj4+PiBQbGVhc2UgYmUgY2FyZWZ1bCBu
b3QgdG8gZHJvcCAweCBwcmVmaXhlcyBmcm9tIHRoZSByZXN1bHRpbmcgb3V0cHV0Cj4+PiAod2hp
Y2ggYXJlIGFuIGVmZmVjdCBvZiB0aGUgIyBmbGFnIHRoYXQgeW91IGRlbGV0ZSksIGF0IGxlYXN0
IHdoZW4KPj4+IGxvZyBtZXNzYWdlcyBjb250YWluIGEgbWl4IG9mIGhleCBhbmQgZGVjIG51bWJl
cnMuIChJIGFtLCBidHcsCj4+PiBub3QgY29udmluY2VkIHRoYXQgc3dpdGNoaW5nIHRvIFBSSV9t
Zm4gaGVyZSBpcyBoZWxwZnVsLikKPj4KPj4gTGFzdCB0aW1lIEkga2VlcGVkICUjIGZvciBNRk4s
IEkgaGF2ZSBiZWVuIGFza2VkIHRvIHJlbW92ZSB0aGUgIy4gSSBwcmVmZXIKPj4gaGF2aW5nIDB4
IGZvciBhbGwgdGhlIGhleCwgYW5kIEkgYW0gaGFwcHkgdG8gYmUga2VlcCBhcyBpcy4gQnV0IEkg
d291bGQgbGlrZSBhCj4+IGJpdCBvZiBjb25zaXN0ZW5jeSBvbiB0aGUgd2F5IHdlIHByaW50IE1G
Ti4uLgo+IAo+IFdlbGwsICIlIyJQUklfbWZuIGlzIGJvZ3VzIChiZWNhdXNlIG9mIHRoZSBjb21i
aW5hdGlvbiB3aXRoIHRoZQo+IG1pbmltdW0gd2lkdGggc3BlY2lmaWNhdGlvbiksIHNvIGl0IG91
Z2h0IHRvIGJlICIlI2x4IiBvciAiMHglIlBSSV9tZm4uCj4gSGF2ZSB5b3UgcmVhbGx5IGJlZW4g
YXNrZWQgZm9yIHNvbWV0aGluZyBlbHNlPyBJZiBzbywgYW5kIGlmIGl0IHdhcyBtZSwKPiB0aGVu
IEkgYXBvbG9naXplLgoKSSBhbSBub3Qgc3VyZSB3aHkgdGhpcyBpcyBib2d1cy4gVGhlIHRoaW5n
IGlzIHVzaW5nIGRpZmZlcmVudCBmb3JtYXQgZm9yIHRoZSBNRk4gCm1ha2VzIGl0IGRpZmZpY3Vs
dCB0byByZWFkIGEgbWVzc2FnZSB3aXRob3V0IGxvb2tpbmcgZm9ybWF0IHN0cmluZy4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
