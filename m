Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ECDB8FE8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 14:43:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBID3-0007Ex-BU; Fri, 20 Sep 2019 12:40:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUeC=XP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iBID1-0007Ef-2d
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 12:40:23 +0000
X-Inumbo-ID: cf4f7006-dba3-11e9-968c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf4f7006-dba3-11e9-968c-12813bfff9fa;
 Fri, 20 Sep 2019 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568983222;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7SG9acAI9Y7trOPYtOl0MNK19DGkODQElh5Npob5SIE=;
 b=YmqgmZ3iD+ZvYxKZCJzT9V+8F/lLXX3GDI+OxDR0PCoHet5HN16/RYE9
 ZVK8FaYxY6jlUG5OHKJx5Y9z6UpjT/TszAwMGzd1n2FN99bUR1nYFfS2w
 hJ1rmAoNtqBeJD+ni0CXccx2WNE7gzfwjL49yWkDtr+HWoOHjoltCmrCN Q=;
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
IronPort-SDR: H5Rm1pubbKaDdPjQxH/D2IPNkYjvWaneTvCDoi8CylnCa7/eUrSnF7hubSdzsQzpBH9TNZBjz0
 qA0asod3BFD5ebUqIvvCsKEPTCrQ7atsRtUn5ZFI/BnJL/vJ0j+LD116V8OkFlaQhsu0n+za/H
 ZgH175v8pnqOY1HLtBK8uvKtvEO3QsB/PsFDpASRslmMG8+MueRFP3w1VBqXshqyGc+hnjD+J9
 OArUEm0HhomLAflJS2epojw+jmoyzrsM8z7us5MEipE10FcrsOUmQibcz2w8+CQpFsoB+2WPpt
 Vbg=
X-SBRS: 2.7
X-MesageID: 5903980
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,528,1559534400"; 
   d="scan'208";a="5903980"
To: Jan Beulich <jbeulich@suse.com>
References: <b080fa0f-08d2-34d0-3f54-549e1303eeb4@suse.com>
 <77f8b74c-c9a9-efc4-07b1-d20dbd5545c5@citrix.com>
 <89ed0fa4-b126-1939-d728-5ff2d477465a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5723389e-5cad-56e9-044e-2888eeeecea6@citrix.com>
Date: Fri, 20 Sep 2019 13:40:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <89ed0fa4-b126-1939-d728-5ff2d477465a@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] libxc/x86: avoid overflow in CPUID APIC ID
 adjustments
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDkvMjAxOSAxMToyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjAuMDkuMjAxOSAx
MjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTkvMDkvMjAxOSAxMjo0OCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBSZWNlbnQgQU1EIHByb2Nlc3NvcnMgbWF5IHJlcG9ydCB1cCB0byAx
MjggbG9naWNhbCBwcm9jZXNzb3JzIGluIENQVUlECj4+PiBsZWFmIDEuIERvdWJsaW5nIHRoaXMg
dmFsdWUgcHJvZHVjZXMgMCAod2hpY2ggT1NlcyBzaW5jZXJlbHkgZGlzbGlrZSksCj4+PiBhcyB0
aGUgcmVzcGVjdGl2ZSBmaWVsZCBpcyBvbmx5IDggYml0cyB3aWRlLiBTdXBwcmVzcyBkb3VibGlu
ZyB0aGUgdmFsdWUKPj4+IChhbmQgaXRzIGxlYWYgMHg4MDAwMDAwOCBjb3VudGVycGFydCkgaW4g
c3VjaCBhIGNhc2UuCj4+Pgo+Pj4gQWRkaXRpb25hbGx5IGRvbid0IGV2ZW4gZG8gYW55IGFkanVz
dG1lbnQgd2hlbiB0aGUgaG9zdCB0b3BvbG9neSBhbHJlYWR5Cj4+PiBpbmNsdWRlcyByb29tIGZv
ciBtdWx0aXBsZSB0aHJlYWRzIHBlciBjb3JlLgo+Pj4KPj4+IEZ1cnRoZXJtb3JlIGRvbid0IGRv
dWJsZSB0aGUgTWF4aW11bSBDb3JlcyBQZXIgUGFja2FnZSBhdCBhbGwgLSBieSB1cwo+Pj4gaW50
cm9kdWNpbmcgYSBmYWtlIEhUVCBlZmZlY3QsIHRoZSBjb3JlIGNvdW50IGRvZXNuJ3QgbmVlZCB0
byBjaGFuZ2UuCj4+PiBJbnN0ZWFkIGFkanVzdCB0aGUgTWF4aW11bSBMb2dpY2FsIFByb2Nlc3Nv
cnMgU2hhcmluZyBDYWNoZSBmaWVsZCwgd2hpY2gKPj4+IHNvIGZhciB3YXMgemFwcGVkIGFsdG9n
ZXRoZXIuCj4+Pgo+Pj4gQWxzbyB6YXAgbGVhZiA0IChhbmQgYXQgdGhlIHNhbWUgdGltZSBsZWFm
IDIpIEVEWCBvdXRwdXQgZm9yIEFNRC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiAtLS0KPj4+IFRCRDogVXNpbmcgeGNfcGh5c2luZm8o
KSBvdXRwdXQgaGVyZSBuZWVkcyBhIGJldHRlciBzb2x1dGlvbi4gVGhlCj4+PiAgICAgIHRocmVh
ZHNfcGVyX2NvcmUgdmFsdWUgcmV0dXJuZWQgaXMgdGhlIGNvdW50IG9mIGFjdGl2ZSBzaWJsaW5n
cyBvZgo+Pj4gICAgICBDUFUgMCwgcmF0aGVyIHRoYW4gYSBzeXN0ZW0gd2lkZSBhcHBsaWNhYmxl
IHZhbHVlIChhbmQgY29uc3RhbnQKPj4+ICAgICAgb3ZlciB0aGUgZW50aXJlIHNlc3Npb24pLiBV
c2luZyBDUFVJRCBvdXRwdXQgKGxlYXZlcyA0IGFuZAo+Pj4gICAgICA4MDAwMDAxZSkgZG9lc24n
dCBsb29rIHZpYWJsZSBlaXRoZXIsIGR1ZSB0byB0aGlzIG5vdCByZWFsbHkgYmVpbmcKPj4+ICAg
ICAgdGhlIGhvc3QgdmFsdWVzIG9uIFBWSC4gSnVkZ2luZyBmcm9tIHRoZSBob3N0IGZlYXR1cmUg
c2V0J3MgSFRUCj4+PiAgICAgIGZsYWcgYWxzbyB3b3VsZG4ndCB0ZWxsIHVzIHdoZXRoZXIgdGhl
cmUgYWN0dWFsbHkgYXJlIG11bHRpcGxlCj4+PiAgICAgIHRocmVhZHMgcGVyIGNvcmUuCj4+IFRo
ZSBrZXkgdGhpbmcgaXMgdGhhdCBodHQgIT0gIm1vcmUgdGhhbiBvbmUgdGhyZWFkIHBlciBjb3Jl
Ii7CoCBIVFQgaXMKPj4gc3RyaWN0bHkgYSBiaXQgaW5kaWNhdGluZyB0aGF0IHRvcG9sb2d5IGlu
Zm9ybWF0aW9uIGlzIGF2YWlsYWJsZSBpbiBhCj4+IG5ldyBmb3JtIGluIHRoZSBDUFVJRCBsZWF2
ZXMgKG9yIGluIEFNRHMgY2FzZSwgdGhlIHNhbWUgaW5mb3JtYXRpb24KPj4gc2hvdWxkIGJlIGlu
dGVycHJldGVkIGluIGEgbmV3IHdheSkuwqAgSnVzdCBiZWNhdXNlIEhUVCBpcyBzZXQgKGFuZCBp
dAo+PiBkb2VzIGdldCBzZXQgaW4gbm9uLUhUIGNhcGFibGUgc3lzdGVtcyksIGRvZXNuJ3QgbWVh
biB0aGVyZSBpcyBzcGFjZSBmb3IKPj4gbW9yZSB0aGFuIHRocmVhZCBwZXIgY29yZSBpbiB0b3Bv
bG9neSBpbmZvcm1hdGlvbi4KPj4KPj4gRm9yIFBWIGd1ZXN0cywgbXkgYWRqdXN0bWVudCBpbiB0
aGUgQ1BVSUQgc2VyaWVzIHNob3dzICh3aGF0IEkgYmVsaWV2ZQo+PiB0byBiZSkgdGhlIG9ubHkg
Y29ycmVjdCB3YXkgb2YgcHJvcGFnYXRpbmcgdGhlIGhvc3QgSFRUL0NNUF9MRUdBQ1kKPj4gc2V0
dGluZ3MgdGhyb3VnaC4KPj4KPj4gRm9yIEhWTSBndWVzdHMsIGl0IHJlYWxseSBzaG91bGRuJ3Qg
cmVhbGx5IGhhdmUgYW55dGhpbmcgdG8gZG8gd2l0aCB0aGUKPj4gaG9zdCBzZXR0aW5nLsKgIFdl
IHNob3VsZCBiZSBjaG9vc2luZyBob3cgbWFueSB0aHJlYWRzL2NvcmUgdG8gZ2l2ZSB0bwo+PiB0
aGUgZ3Vlc3QsIHRoZW4gY29uc3RydWN0aW5nIHRoZSB0b3BvbG9neSBpbmZvcm1hdGlvbiBmcm9t
IGZpcnN0IHByaW5jaXBsZXMuCj4+Cj4+IElnbm9yZSB0aGUgUFZIIGNhc2UuwqAgSXQgaXMgdG90
YWxseSBicm9rZW4gZm9yIHNldmVyYWwgb3RoZXIgcmVhc29ucyBhcwo+PiB3ZWxsLCBhbmQgUFZI
IERvbTAgaXNuJ3QgYSBwcm9kdWN0aW9uLXJlYWR5IHRoaW5nIHlldC4KPj4KPj4gVGhpcyBnZXRz
IHVzIGJhY2sgdG8gdGhlIFBWIGNhc2Ugd2hlcmUgdGhlIGhvc3QgaW5mb3JtYXRpb24gaXMgYWN0
dWFsbHkKPj4gaW4gdmlldywgYW5kIChmb3IgYmFja3BvcnQgcHVycG9zZXMpIGNhbiBiZSB0cnVz
dGVkLgo+IE9rYXksIHRoaXMgbWVhbnMgSSdsbCByZXZpdmUgYW5kIGZpbmlzaCB0aGUgaGFsZiBj
cHVpZCgpIGJhc2VkIGF0dGVtcHQKPiBJIGhhZCBtYWRlIGluaXRpYWxseS4gQSBmdW5kYW1lbnRh
bCBxdWVzdGlvbiByZW1haW5zIG9wZW4gdGhvdWdoIGZyb20KPiB5b3VyIHJlcGx5OiBEbyB5b3Ug
YWdyZWUgd2l0aCB0aGUgaWRlYSBvZiBhdm9pZGluZyB0aGUgbXVsdGlwbGljYXRpb24KPiBieSAy
IGlmIHRoZSBob3N0IHRvcG9sb2d5IGFscmVhZHkgcHJvdmlkZXMgYXQgbGVhc3Qgb25lIGJpdCBv
ZiB0aHJlYWQKPiBJRCB3aXRoaW4gdGhlIEFQSUMgSUQ/CgpJbiB0aGVvcnksIHllcy7CoCBJbiBw
cmFjdGljZSwgSSdkIGVyciBvbiB0aGUgc2lkZSBvZiBub3QuCgpBIGZ1cnRoZXIgcHJvYmxlbSB3
aXRoIENQVUlEIGhhbmRsaW5nIGlzIHRoYXQgaXQgaXMgcmVjYWxjdWxhdGVkIGZyb20Kc2NyYXRj
aCBldmVuIGFmdGVyIG1pZ3JhdGUuwqAgVGhlcmVmb3JlLCBhbnkgY2hhbmdlcyB0byB0aGUgYWxn
b3JpdGhtCndpbGwgY2F1c2UgaW5jb25zaXN0ZW5jaWVzIHRvIGJlIHNlZW4gaW4gdGhlIGd1ZXN0
IGFjcm9zcwptaWdyYXRlL3VwZ3JhZGUuwqAgVGhpcyBwcm9ibGVtIGJlY29tZXMgc3Vic3RhbnRp
YWxseSB3b3JzZSBpZiB0aGUgcGF0Y2gKaXMgYmFja3BvcnRlZCB0byBzdGFibGUgdHJlZXMuCgpO
b3cgdGhhdCBnZXRfY3B1X3BvbGljeSBoYXMgZXhpc3RlZCBmb3IgYSBsaXR0bGUgd2hpbGUsIGFu
ZApzZXRfY3B1X3BvbGljeSBpcyBpbW1pbmVudCwgZml4aW5nIHRoZSAiQ1BVSUQgY2hhbmdlcyBh
Y3Jvc3MgbWlncmF0ZSIKcHJvYmxlbSBpcyBhbG1vc3QgZG9hYmxlLCBhbmQgaXMgb24gdGhlIHBs
YW4gZm9yIHRvb2xzdGFjayB3b3JrLgoKVGhhdCBzYWlkLCB1bHRpbWF0ZWx5LCBhbnl0aGluZyAi
cHJlIDQuMTQiID0+ICI0LjE0IiBpcyBnb2luZyB0byBoaXQgYQpkaXNjb250aW51aXR5LCBiZWNh
dXNlIHRoZXJlIGlzIGluZm9ybWF0aW9uIGRpc2NhcmRlZCBvbiB0aGUgc291cmNlIHNpZGUKd2hp
Y2ggY2FuJ3QgYmUgcmVjb25zdHJ1Y3RlZCBvbiB0aGUgZGVzdGluYXRpb24uCgpPdmVyYWxsLCBJ
IHdvdWxkIHN1Z2dlc3QgZG9pbmcgdGhlIGFic29sdXRlIG1pbmltdW0gY2hhbmdlIHJlcXVpcmVk
IHRvCnVuYnJlYWsgUm9tZSBDUFVzLsKgIEV2ZXJ5dGhpbmcgZnVydGhlciBpcyBnb2luZyB0byBj
YXVzZSBkaWZmZXJlbmNlcwphY3Jvc3MgbWlncmF0ZS4KCkluIDQuMTQsIEkgdGhpbmsgd2UgY2Fu
IHJlYXNvbmFibHkgZml4IGFsbCBvZjoKMSkgQ1BVSUQgZGF0YSBkaXNjYXJkZWQgZm9yIG1pZ3Jh
dGUKMikgZG9tYWluIGJ1aWxkZXIgdXNlcyBuYXRpdmUgQ1BVSUQKMykgdG9wb2xvZ3kgaGFuZGxp
bmcgaXNuJ3QgY29uc2lzdGVudCB3aXRoIFNETS9BUE0KCmFsbCBvZiB3aGljaCBpcyBsaWJ4Yy9s
aWJ4bCB3b3JrLCBvbmNlIHNldF9jcHVfcG9saWN5KCkgaXMgaW4gcGxhY2UuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
