Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AC41349E6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:57:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipFWh-0006nv-6p; Wed, 08 Jan 2020 17:53:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/AM3=25=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipFWg-0006nq-1M
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:53:50 +0000
X-Inumbo-ID: cda534d2-323f-11ea-a38f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cda534d2-323f-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578506020;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=huAIT5kMVKQGZb+BEZxgqY02C9niJSfgDqSFup0d/08=;
 b=RbkslBIKvOEPhQlUHq+4qBVyhA48OwsOhM2o8KIPjsZxKa3MlLACs2Zt
 DfaYJwNZhhHCpiaaFvWVYKdG5F8tcgfMYaB3g4pbkmDe6mhTIk7q/0QJK
 nSpmWBa9wYrRuIahO5o8z+LhuxXxpoiE8McXk6FGwi7C+weTizQCsNWks Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sBwd+UWL5HOxxR2UZnlUO6PgOWSj8wHy68/eJGhDT1mxqLbWDOGTlC3FCjzYvD7HXNGBW40rui
 khCVqrM0afWfLDEdm6fUlJHqjXPshGXGDd6vpHFr33fFm3sBlydZzdcFdlYaVtb2PMal3N1ff5
 tudoHygC9gdYxnphwdEOs8MVJ2n+o5iyf9oxsBzuZE4o1aFHPcKjeVn+/UoyKiqninRdfipu/M
 TvoHTnGTG1sN43YGLs6Qr9bb737bHxbpvIf7rJK0cWE3Ek8WvvcqKsn6K8ktx6+l1OlyOssGRX
 33U=
X-SBRS: 2.7
X-MesageID: 11071455
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="11071455"
To: Wei Liu <wl@xen.org>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-2-liuwe@microsoft.com>
 <eae9980b-90dd-e747-9400-7bc044b06360@citrix.com>
 <20200105214541.5z5ibv2nlyebbypj@debian>
 <c289d1bb-246a-6295-b8ff-e318789987e3@citrix.com>
 <20200107154214.oz2qyunmeyzfsgfv@debian>
 <20200108174312.iujqqxmv7xnohndd@debian>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <92ff2425-31f6-f1de-bbe9-38f83f776c4a@citrix.com>
Date: Wed, 8 Jan 2020 17:53:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200108174312.iujqqxmv7xnohndd@debian>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 1/5] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDEvMjAyMCAxNzo0MywgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEphbiAwNywgMjAy
MCBhdCAwMzo0MjoxNFBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+PiBPbiBTdW4sIEphbiAwNSwg
MjAyMCBhdCAwOTo1Nzo1NlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBbLi4uXQo+
Pj4+PiBUaGUgbG9ja2VkIGJpdCBpcyBwcm9iYWJseSBhIGdvb2QgaWRlYSwgYnV0IG9uZSBhc3Bl
Y3QgbWlzc2luZyBoZXJlIGlzCj4+Pj4+IHRoZSBjaGVjayB0byBzZWUgd2hldGhlciB0aGUgaHlw
ZXJjYWxsIHBhZ2UgaXMgYWxyZWFkeSBlbmFibGVkLCB3aGljaCBJCj4+Pj4+IGV4cGVjdCBpcyBm
b3IgYSBrZXhlYyBjcmFzaCBzY2VuYXJpby4KPj4+Pj4KPj4+Pj4gSG93ZXZlciwgdGhlIG1vc3Qg
aW1wb3J0YW50IHBvaW50IGlzIHRoZSBvbmUgd2hpY2ggZGVzY3JpYmVzIHRoZSAjR1AKPj4+Pj4g
cHJvcGVydGllcyBvZiB0aGUgZ3Vlc3QgdHJ5aW5nIHRvIG1vZGlmeSB0aGUgcGFnZS7CoCBUaGlz
IGNhbiBvbmx5IGJlCj4+Pj4+IGFjaGlldmVkIHdpdGggYW4gRVBUL05QVCBtYXBwaW5nIGxhY2tp
bmcgdGhlIFcgcGVybWlzc2lvbiwgd2hpY2ggd2lsbAo+Pj4+PiBzaGF0dGVyIGhvc3Qgc3VwZXJw
YWdlcy7CoMKgIFRoZXJlZm9yZSwgcHV0dGluZyBpdCBpbiAudGV4dCBpcyBnb2luZyB0byBiZQo+
Pj4+PiByYXRoZXIgcG9vciwgcGVyZiB3aXNlLgo+Pj4+Pgo+Pj4+PiBJIGFsc28gbm90ZSB0aGF0
IFhlbidzIGltcGxlbWVudGF0aW9uIG9mIHRoZSBWaXJpZGlhbiBoeXBlcmNhbGwgcGFnZQo+Pj4+
PiBkb2Vzbid0IGNvbmZvcm0gdG8gdGhlc2UgcHJvcGVydGllcywgYW5kIHdhbnRzIGZpeGluZy7C
oCBJdCBpcyBnb2luZyB0bwo+Pj4+PiBuZWVkIGEgbmV3IGtpbmQgaWRlbnRpZmljYXRpb24gb2Yg
dGhlIHBhZ2UgKHByb2JhYmx5IGEgbmV3IHAybSB0eXBlKQo+Pj4+PiB3aGljaCBpbmplY3RzICNH
UCBpZiB3ZSBldmVyIHNlZSBhbiBFUFRfVklPTEFUSU9OL05QVF9GQVVMVCBhZ2FpbnN0IGl0Lgo+
Pj4+Pgo+Pj4+PiBBcyBmb3Igc3VnZ2VzdGlvbnMgaGVyZSwgSSdtIHN0cnVnZ2xpbmcgdG8gZmlu
ZCBhbnkgbWVtb3J5IG1hcCBkZXRhaWxzCj4+Pj4+IGV4cG9zZWQgaW4gdGhlIFZpcmlkaWFuIGlu
dGVyZmFjZSwgYW5kIHRoZXJlZm9yZSB3aGljaCBnZm4gaXMgYmVzdCB0bwo+Pj4+PiBjaG9vc2Uu
wqAgSSBoYXZlIGEgc2lua2luZyBmZWVsaW5nIHRoYXQgdGhlIGFuc3dlciBpcyBBQ1BJLi4uCj4+
Pj4gVExGUyBvbmx5IHNheXMgImdvIGZpbmQgb25lIHN1aXRhYmxlIHBhZ2UgeW91cnNlbGYiIHdp
dGhvdXQgZnVydGhlcgo+Pj4+IGhpbnRzLgo+Pj4+Cj4+Pj4gU2luY2Ugd2UncmUgc3RpbGwgcXVp
dGUgZmFyIGF3YXkgZnJvbSBhIGZ1bmN0aW9uaW5nIHN5c3RlbSwgZmluZGluZyBhCj4+Pj4gbW9z
dCBzdWl0YWJsZSBwYWdlIGlzbid0IG15IHRvcCBwcmlvcml0eSBhdCB0aGlzIHBvaW50LiBJZiB0
aGVyZSBpcyBhCj4+Pj4gc2ltcGxlIHdheSB0byBleHRyYXBvbGF0ZSBzdWl0YWJsZSBpbmZvcm1h
dGlvbiBmcm9tIEFDUEksIHRoYXQgd291bGQgYmUKPj4+PiBncmVhdC4gSWYgaXQgcmVxdWlyZXMg
d3JpdGluZyBhIHNldCBvZiBmdW5jdGlvbmFsaXRpZXMsIHRoYW4gdGhhdCB3aWxsCj4+Pj4gbmVl
ZCB0byB3YWl0IHRpbGwgbGF0ZXIuCj4+PiBUbyBjb3BlIHdpdGggdGhlICJvbmUgaXMgYWxyZWFk
eSBlc3RhYmxpc2hlZCBhbmQgaXQgaXMgYWxyZWFkeSBsb2NrZWQiCj4+PiBjYXNlLCB0aGUgb25s
eSBvcHRpb24gaXMgdG8gaGF2ZSBhIGZpeG1hcCBlbnRyeSB3aGljaCBjYW4gYmUgc2V0Cj4+PiBk
eW5hbWljYWxseS7CoCBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBmaXhtYXAgcmVnaW9uIGlzIG1h
cmtlZCBOWCBhbmQgNjRHCj4+PiBhd2F5IGZyb20gLnRleHQuCj4+Pgo+Pj4gUG9zc2libHkgdGhl
IGxlYXN0IGJhZCBvcHRpb24gaXMgdG8gaGF2ZSBzb21lIGJ1aWxkLXRpbWUgc3BhY2UgKHNvIDAg
b3IKPj4+IDRrIGRlcGVuZGluZyBvbiBDT05GSUdfSFlQRVJWKSBiZXR3ZWVuIHRoZSBwZXItY3B1
IHN0dWJzIGFuZAo+Pj4gWEVOX1ZJUlRfRU5ELCB3aGljaCBvcGVyYXRlcyBsaWtlIHRoZSBmaXht
YXAsIGJ1dCBlbmRzIHVwIGFzIFgvUk8gbWFwcGluZ3MuCj4+Pgo+PiBPSy4gVGhpcyBpcyBwcm9i
YWJseSBub3QgdG9vIGRpZmZpY3VsdC4gCj4+Cj4gSSBoYXZlIGEgY2xvc2VyIGxvb2sgYXQgdGhp
cyB0b2RheSBhbmQgd2FudCB0byBtYWtlIHN1cmUgSSB1bmRlcnN0YW5kCj4gd2hhdCB5b3UgaGFk
IGluIG1pbmQuCj4KPiBTdXBwb3NlIHdlIHNldCBhc2lkZSBzb21lIHNwYWNlIGluIGxpbmtlciBz
Y3JpcHQuIFVzaW5nIHRoZSBmb2xsb3dpbmcKPiB3aWxsIGdpdmUgeW91IGEgV0FYIHNlY3Rpb24u
IEkgc3RpbGwgbmVlZCB0byBhZGQgQ09ORklHX0dVRVNUIGFyb3VuZCBpdCwKPiBidXQgeW91IGdl
dCB0aGUgaWRlYS4KPgo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgYi94
ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gaW5kZXggMTExZWRiNTM2MC4uYTdhZjMyMTEzOSAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gKysrIGIveGVuL2FyY2gveDg2L3hl
bi5sZHMuUwo+IEBAIC0zMDUsNiArMzA1LDE1IEBAIFNFQ1RJT05TCj4gICAgICAgICAuID0gQUxJ
R04oUE9JTlRFUl9BTElHTik7Cj4gICAgICAgICBfX2Jzc19lbmQgPSAuOwo+ICAgIH0gOnRleHQK
PiArCj4gKyAgLiA9IEFMSUdOKFNFQ1RJT05fQUxJR04pOwo+ICsgIERFQ0xfU0VDVElPTigudGV4
dC5oeXBlcmNhbGxfcGFnZSkgewo+ICsgICAgICAgLiA9IEFMSUdOKFBBR0VfU0laRSk7Cj4gKyAg
ICAgICBfX2h5cGVyY2FsbF9wYWdlX3N0YXJ0ID0gLjsKPiArICAgICAgIC4gPSAuICsgUEFHRV9T
SVpFOwo+ICsgICAgICAgX19oeXBlcmNhbGxfcGFnZV9lbmQgPSAuOwo+ICsgIH0gOnRleHQ9MHg5
MDkwCj4gKwo+ICAgIF9lbmQgPSAuIDsKPiAgCj4gICAgLiA9IEFMSUdOKFNFQ1RJT05fQUxJR04p
Owo+Cj4KPiBBbmQgdGhlbj8gVXNlIG1hcF9wYWdlc190b194ZW4oLi4uLCBQQUdFX0hZUEVSVklT
T1JfUlgpIHRvIHBvaW50IHRoYXQKPiBhZGRyZXNzIHRvIChNQVhQSFlTQUREUi1QQUdFX1NJWkUp
PwoKQWggbm8uwqAgVGhpcyBzdGlsbCBwdXRzIHRoZSBoeXBlcmNhbGwgcGFnZSAob3IgYXQgbGVh
c3QsIHNwYWNlIGZvciBpdCkKaW4gdGhlIFhlbiBpbWFnZSBpdHNlbGYsIHdoaWNoIGlzIHNvbWV0
aGluZyB3ZSBhcmUgdHJ5aW5nIHRvIGF2b2lkLgoKV2hhdCBJIG1lYW50IHdhcyB0byBiYXNpY2Fs
bHkgY29weSgvZXh0ZW5kKSB0aGUgZXhpc3RpbmcgZml4bWFwCmltcGxlbWVudGF0aW9uLCBjYWxs
aW5nIGl0IGZpeG1hcF94KCkgKG9yIHNvbWV0aGluZyBiZXR0ZXIpLCBhbmQgcHV0CkZJWE1BUF9Y
X1NJWkUgYXMgYW4gYWRkaXRpb25hbCBnYXAgaW4gdGhlIGNhbGN1bGF0aW9uCmFsbG9jX3N0dWJf
cGFnZSgpLsKgIEV2ZW4gdGhlIGN1cnJlbnQgZml4bWFwIGNvZGUgaGFzIGFuIGlmZGVmIGV4YW1w
bGUKZm9yIENPTkZJR19YRU5fR1VFU1QuCgpZb3UnZCB0aGVuIGVuZCB1cCB3aXRoIHNvbWV0aGlu
ZyBsaWtlCl9fc2V0X2ZpeG1hcF94KEZJWE1BUF9YX0hZUEVSVl9IWVBFUkNBTExfUEFHRSwgbWZu
KSB3aGljaCB1c2VzIF9SWCBpbgp0aGUgdW5kZXJseWluZyBjYWxsIHRvIG1hcF9wYWdlc190b194
ZW4oKQoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
