Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFCBA1A79
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 14:52:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3JrT-0000sj-Da; Thu, 29 Aug 2019 12:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mvu2=WZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i3JrS-0000se-3f
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 12:49:10 +0000
X-Inumbo-ID: 64702e6e-ca5b-11e9-ac23-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64702e6e-ca5b-11e9-ac23-bc764e2007e4;
 Thu, 29 Aug 2019 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567082949;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+vgBzyyeaQZh4CEPTmrpN0Sj4egyC6q45L7RjWXV2T0=;
 b=PsYp29GbbUqKuaCRarPdTjndrTl7UQ1NajyfemVqwOAXeJCkeB7MJ92k
 cZUvOvwEMM+HGce5oWKrauKdMvlmPKzqyK/bDhCvY8ZAagUd43pJ8WTSN
 GyEAwyxgShHa9sM4IRdpgnG7+aMvTA/kidq2vzcbELye7ZZSTDdnKFZ2L Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hq2cm1T08oXIOCMCqkPwHFbTHwAJD+fo9D6yd7XgshaudQU0mKQN9dR9Mjw8IDlQhV+rNqXge6
 51HiA4/Ic0m0EbYWdpncask4iWD9LXCyP5Mk2u5AkLxmGBI/WLHkwME10W/WfohIlbbM4hJ+Op
 bIgA+5NxEDGaT4AKifX7KOS7iFG8slplAg+Ssau11l9FEaG62QnMaXGhSWmbtuN2fwJz7aiWl4
 sX2jiuw1uIepZWJ0L15QHeCwuglccQe3jfI76NP5HZVDLMjKqb7NlxURuabqPiyzEmMexiJOCk
 H4A=
X-SBRS: 2.7
X-MesageID: 4927330
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,443,1559534400"; 
   d="scan'208";a="4927330"
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <f2e373ae-a327-bcdc-1c5c-b3351ae1ff4f@suse.com>
 <e163fa38-6a06-c422-4c23-7d5385590025@citrix.com>
 <8191ed37-760d-748a-c7c7-762dd331fa7c@suse.com>
 <8182fd34-c41a-46d5-d0db-51799c2d5052@suse.com>
 <07043e62-01bd-be2a-05a6-db8aacdea7d4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c2f6078a-6fb2-8762-4070-dd9b51649a8f@citrix.com>
Date: Thu, 29 Aug 2019 13:49:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <07043e62-01bd-be2a-05a6-db8aacdea7d4@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDgvMjAxOSAxMzozOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyOS4wOC4xOSAx
NDoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjA4LjIwMTkgMTQ6MDEsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAyOS4wOC4xOSAxMzo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+PiBPbiAyOS8wOC8yMDE5IDEwOjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gSW5zcGly
ZWQgYnkgTGludXggY29tbWl0IGM0OWEwYTgwMTM3YzdjYTdkNmNlZDRjODEyYzllMDdhOTQ5ZjZm
MjQ6Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqAgVGhlcmUgaGF2ZSBiZWVuIHJlcG9ydHMgb2YgUkRS
QU5EIGlzc3VlcyBhZnRlciByZXN1bWluZyBmcm9tCj4+Pj4+IHN1c3BlbmQgb24KPj4+Pj4gwqDC
oMKgwqDCoCBzb21lIEFNRCBmYW1pbHkgMTVoIGFuZCBmYW1pbHkgMTZoIHN5c3RlbXMuIFRoaXMg
aXNzdWUgc3RlbXMKPj4+Pj4gZnJvbSBhIEJJT1MKPj4+Pj4gwqDCoMKgwqDCoCBub3QgcGVyZm9y
bWluZyB0aGUgcHJvcGVyIHN0ZXBzIGR1cmluZyByZXN1bWUgdG8gZW5zdXJlCj4+Pj4+IFJEUkFO
RCBjb250aW51ZXMKPj4+Pj4gwqDCoMKgwqDCoCB0byBmdW5jdGlvbiBwcm9wZXJseS4KPj4+Pj4K
Pj4+Pj4gwqDCoMKgwqDCoCBVcGRhdGUgdGhlIENQVSBpbml0aWFsaXphdGlvbiB0byBjbGVhciB0
aGUgUkRSQU5EIENQVUlEIGJpdAo+Pj4+PiBmb3IgYW55IGZhbWlseQo+Pj4+PiDCoMKgwqDCoMKg
IDE1aCBhbmQgMTZoIHByb2Nlc3NvciB0aGF0IHN1cHBvcnRzIFJEUkFORC4gSWYgaXQgaXMga25v
d24KPj4+Pj4gdGhhdCB0aGUgZmFtaWx5Cj4+Pj4+IMKgwqDCoMKgwqAgMTVoIG9yIGZhbWlseSAx
Nmggc3lzdGVtIGRvZXMgbm90IGhhdmUgYW4gUkRSQU5EIHJlc3VtZQo+Pj4+PiBpc3N1ZSBvciB0
aGF0IHRoZQo+Pj4+PiDCoMKgwqDCoMKgIHN5c3RlbSB3aWxsIG5vdCBiZSBwbGFjZWQgaW4gc3Vz
cGVuZCwgdGhlICJjcHVpZD1yZHJhbmQiCj4+Pj4+IGtlcm5lbCBwYXJhbWV0ZXIKPj4+Pj4gwqDC
oMKgwqDCoCBjYW4gYmUgdXNlZCB0byBzdG9wIHRoZSBjbGVhcmluZyBvZiB0aGUgUkRSQU5EIENQ
VUlEIGJpdC4KPj4+Pj4KPj4+Pj4gwqDCoMKgwqDCoCBOb3RlLCB0aGF0IGNsZWFyaW5nIHRoZSBS
RFJBTkQgQ1BVSUQgYml0IGRvZXMgbm90IHByZXZlbnQgYQo+Pj4+PiBwcm9jZXNzb3IKPj4+Pj4g
wqDCoMKgwqDCoCB0aGF0IG5vcm1hbGx5IHN1cHBvcnRzIHRoZSBSRFJBTkQgaW5zdHJ1Y3Rpb24g
ZnJvbSBleGVjdXRpbmcKPj4+Pj4gaXQuIFNvIGFueQo+Pj4+PiDCoMKgwqDCoMKgIGNvZGUgdGhh
dCBkZXRlcm1pbmVkIHRoZSBzdXBwb3J0IGJhc2VkIG9uIGZhbWlseSBhbmQgbW9kZWwKPj4+Pj4g
d29uJ3QgI1VELgo+Pj4KPj4+IFllYWgsIGJ1dCBpdCB3aWxsIG5vIGxvbmdlciBzZWUgcmFuZG9t
IG51bWJlcnMgYWZ0ZXIgcmVzdW1lLgo+Pgo+PiBUaGF0J3MgdGhlIGltcGxpY2F0aW9uOyBub3Rl
IHRoYXQgSSd2ZSB0YWtlbiB0aGUgdGV4dCBmcm9tIHRoZQo+PiBMaW51eCBjb21taXQuCj4+Cj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+Pj4g
LS0tCj4+Pj4+IFNsaWdodGx5IFJGQywgaW4gcGFydGljdWxhciBiZWNhdXNlIG9mIHRoZSBjaGFu
Z2UgdG8KPj4+Pj4gcGFyc2VfeGVuX2NwdWlkKCk6Cj4+Pj4+IEFsdGVybmF0aXZlIGFwcHJvYWNo
IHN1Z2dlc3Rpb25zIGFyZSB3ZWxjb21lLgo+Pj4+Cj4+Pj4gVGhpcyBpc3N1ZSB3YXMgb24gbXkg
cmFkYXIsIGJ1dCBJIGhhZG4ndCBnb3QgYXJvdW5kIHRvIHN0YXJ0aW5nIGEKPj4+PiBwYXRjaCB5
ZXQuCj4+Pj4KPj4+PiBJIHdhcyB3b25kZXJpbmcgaWYgd2UgY291bGQgcGVyaGFwcyBkZWZhdWx0
IGl0IHRvIHdoZXRoZXIgUzMgd2FzCj4+Pj4gYXZhaWxhYmxlLCBidXQgbG9va2luZyBhdCB0aGUg
Y29kZSB3aGljaCBwcmludHMgIkFDUEkgc2xlZXAgbW9kZXM6Cj4+Pj4gUzMiLAo+Pj4+IGl0IGRv
ZXNuJ3QgYXBwZWFyIHRvIGJlIHJlbGF0ZWQgdG8gYW55IHJlYWwgQUNQSSBpbmZvcm1hdGlvbi4K
Pj4+Cj4+PiBXb3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8gaW5oaWJpdCBzdXNwZW5kL3Jl
c3VtZSBpbnN0ZWFkPwo+Pgo+PiBUaGF0J3MgYW4gYWx0ZXJuYXRpdmUgb3B0aW9uLiBCdXQgaWYg
YW55dGhpbmcgSSdkIHNlZSB1cyBwcm92aWRpbmcKPj4gYm90aCwgbm90IHRoZSBvbmUgeW91IHN1
Z2dlc3QgaW5zdGVhZCBvZiB3aGF0IHRoZSBwYXRjaCBoZXJlIGRvZXMuCj4+Cj4+PiBJJ20gcXVp
dGUgc3VyZSBhIG1hY2hpbmUgcnVubmluZyBYZW4gaXMgdmVyeSByYXJlbHkgcHV0IHRvIFMzLgo+
Pgo+PiBJJ20gbm90IGF0IGFsbCBzdXJlIGFib3V0IHRoaXMuCj4KPiBTdXNwZW5kL3Jlc3VtZSBp
biBYZW4gd2FzIGJyb2tlbiBmb3IgbW9yZSB0aGFuIDMgbW9udGhzIGluIHRoZSBsYXRlIDQuMTIK
PiBkZXZlbG9wbWVudCBwaGFzZSBhbmQgbm9ib2R5IG5vdGljZWQgaXQuIE9ubHkgd2hlbiBJIHN0
YXJ0ZWQgbXkgY29yZQo+IHNjaGVkdWxpbmcgc2VyaWVzIEkgY2FtZSBhY3Jvc3MgdGhlIGlzc3Vl
LgoKT3BlblhUIGFuZCBRdWJlcyB3aWxsIGNvbWUgYWZ0ZXIgeW91IHdpdGggc3RpY2tzLi4uCgpG
b3IgdHJhZGl0aW9uYWwgc2VydmVyIHNjZW5hcmlvcywgUzMgaXMgcmFyZSB0byBub24tZXhpc3Rl
bnQsIGJ1dCBYZW4KYWxzbyBydW5zIGluIGEgbnVtYmVyIG9mIHdlbGwga25vd24gY2FzZXMgd2hl
cmUgUzMgaXMgdmVyeSBpbXBvcnRhbnQuwqAKVGhlIHJlYXNvbiBTMyBicmVha3MgZnJlcXVlbnRs
eSAoc2VlIGFsc28gSmFuJ3MgSVJRIGFkanVzdG1lbnRzIGJyb2tlIGl0CmZvciBhIHdoaWxlIGlu
IHN0YWdpbmcpLCBpcyBiZWNhdXNlIG5vbmUgb2YgdGhlIGRldmVsb3BlcnMgd2hvIHdvcmsgaW4K
dGhlc2UgYXJlYXMgdXNlIGl0LgoKSSBub3cgaGF2ZSBhIHRlc3Qgc2NlbmFyaW8gdXNpbmcgYSBD
b2ZmZWVMYWtlIHN5c3RlbSBzYXQgb24gbXkgZGVzaywgYnV0Cml0IG9ubHkgZ2V0cyB0ZXN0aW5n
IHdoZW4gSSdtIHBva2luZyB0aGUgbG93IGxldmVsIGNvZGUsIG9yIHdoZW4gSQpzdXNwZWN0IGEg
Y2hhbmdlIG1pZ2h0IGhhdmUgYW4gaW1wYWN0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
