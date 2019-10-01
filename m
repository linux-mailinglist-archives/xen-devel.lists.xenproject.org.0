Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9921DC414C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 21:47:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFO4m-0005w2-Az; Tue, 01 Oct 2019 19:44:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFO4l-0005vx-F2
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 19:44:47 +0000
X-Inumbo-ID: eb91a728-e483-11e9-bf31-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id eb91a728-e483-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 19:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569959086;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=QdXqdx+zypegABifJQGZjVV5vzwHiH9LFXSLr/YXWLg=;
 b=IYyAusZvJKvb49MS5PqBrU93CXSUy5008kT1U/qglpWDxjil+7W7FXZW
 FPf3ztJRSSfAr+5qBIqRUgXDyFBiDLh45YCHsZj5OSqExSuwCFO4JCoA0
 gNdTvj88Jt3fEyPL4lEvTMr2GomL9dZSqazHMzKgKT85hDk8y2cyQ5fFT U=;
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
IronPort-SDR: mKgse1TRlFCYq0Pe0o75eGTVHiQ6KmHHKQ5rKPYung30MEtlAe4JL3MOxiIc+8kI/E/k6B4J2/
 i37sKRrFD+M7MbUr0mbDkZeTiMydA8MQAH3nrl1jEickuZNO8a5vFPe3XhNz/zOasAF5Q88VoW
 zBIyhfIgBi1viMGlo+J1pJNVcttjXzHM6jYd5MDbJlY5yxGmwbMPOb50udrAwG4thEffi+n0If
 d7yumkPBEbbKuGqDmQUsCdzBJJl1H0rrRxFs1U5rMka5rkFUrIqMYoQ1Bx75hnf77Wy9eNiimi
 td8=
X-SBRS: 2.7
X-MesageID: 6689212
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6689212"
To: Jan Beulich <jbeulich@suse.com>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
 <f075274c-46ed-bedd-9a0f-3ab157544cb1@suse.com>
 <16d3de95-bcb3-87c3-dec2-f436a17e4b29@citrix.com>
 <902700ef-3405-ecfd-45ba-fd0d6f63ac4d@suse.com>
 <3f304d31-5047-b4ec-83f1-aa1a65e341fc@citrix.com>
 <39e9ad3d-e3b0-e5c3-f115-33af4e2ee688@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <dfcfd2dc-65cb-e11b-0db2-535322c8275c@citrix.com>
Date: Tue, 1 Oct 2019 20:44:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <39e9ad3d-e3b0-e5c3-f115-33af4e2ee688@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

T24gMTkvMDkvMjAxOSAxMDozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTguMDkuMjAxOSAy
MToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTgvMDkvMjAxOSAwNzozNCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxNy4wOS4yMDE5IDE5OjE3LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDE2LzA5LzIwMTkgMTA6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBYRUQg
Y29tbWl0IDFiMmZkOTQ0MjUgKCJVcGRhdGUgTU9WU1hEIHRvIG1vZGVybiBiZWhhdmlvciIpIHBv
aW50cyBvdXQKPj4+Pj4gdGhhdCBhcyBvZiBTRE0gcmV2IDA2NCBNT1ZTWEQgaXMgc3BlY2lmaWVk
IHRvIHJlYWQgb25seSAxNiBiaXRzIGZyb20KPj4+Pj4gbWVtb3J5IChvciByZWdpc3Rlcikgd2hl
biB1c2VkIHdpdGhvdXQgUkVYLlcgYW5kIHdpdGggb3BlcmFuZCBzaXplCj4+Pj4+IG92ZXJyaWRl
LiBTaW5jZSB0aGUgdXBwZXIgMTYgYml0cyBvZiB0aGUgdmFsdWUgcmVhZCB3b24ndCBiZSB1c2Vk
Cj4+Pj4+IGFueXdheSBpbiB0aGlzIGNhc2UsIG1ha2UgdGhlIGVtdWxhdGlvbiB1bmlmb3JtbHkg
Zm9sbG93IHRoaXMgbW9yZQo+Pj4+PiBjb21wYXRpYmxlIGJlaGF2aW9yIHdoZW4gbm90IGVtdWxh
dGluZyBhbiBBTUQtbGlrZSBDUFUsIGF0IHRoZSByaXNrCj4+Pj4+IG9mIG1pc3NpbmcgYW4gZXhj
ZXB0aW9uIHdoZW4gZW11bGF0aW5nIG9uL2ZvciBvbGRlciBoYXJkd2FyZSAodGhlCj4+Pj4+IGJv
dW5kYXJ5IGF0IFNhbmR5QnJpZGdlIG5vdGVkIGluIHNhaWQgY29tbWl0IGxvb2tzIHF1ZXN0aW9u
YWJsZSAtIEkndmUKPj4+Pj4gb2JzZXJ2ZWQgdGhlICJuZXciIGJlaGF2aW9yIGFsc28gb24gV2Vz
dG1lcmUpLgo+Pj4+IEFNRCBkb2N1bWVudHMgdGhpcyBpbnN0cnVjdGlvbiBoYXMgYWx3YXlzIHVz
aW5nIGFuIDggb3IgMTZiaXQgc291cmNlCj4+Pj4gb3BlcmFuZC4KPj4+IEhhdmUgeW91IG1peGVk
IHVwIE1PVlNYIHdpdGggTU9WU1hEPyBCb3RoIGhhdmUgc2VwYXJhdGUgcGFnZXMgaW4KPj4+IEFN
RCdzIGRvYywgYnV0IGEgY29tbW9uIHBhZ2UgaW4gSW50ZWwncy4KPj4gSSBoYWQgY29uZnVzZWQg
dGhlIHR3bywgeWVzLgo+Pgo+PiBJIGNvbnN0cnVjdGVkIGFuIGV4cGVyaW1lbnQgdXNpbmcgNjYg
NmUgMDgsIGkuZS4KPj4KPj4gbW92c2xxICglcmF4KSwlY3gKPj4KPj4gYWNjb3JkaW5nIHRvIG9i
amR1bXAsIGFuZCBpdGVyYXRpbmcgYmFja3dhcmRzIG92ZXIgdGhlIGJvdW5kYXJ5IHRvIHRoZQo+
PiB1bm1hcHBlZCBwYWdlIGF0IDAuCj4+Cj4+IE9uIGEgUm9tZSBzeXN0ZW06Cj4+Cj4+IChkMjQp
IFB0cjogMDAwMDAwMDAwMDAwMTAwMAo+PiAoZDI0KcKgID0+IGMyYzIKPj4gKGQyNCkgUHRyOiAw
MDAwMDAwMDAwMDAwZmZmCj4+IChkMjQpICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+
PiAoZDI0KSBQQU5JQzogVW5oYW5kbGVkIGV4Y2VwdGlvbiBhdCAwMDA4OjAwMDAwMDAwMDAxMDQ3
YTUKPj4gKGQyNCkgVmVjIDE0ICNQRlstZC1zci1dICVjcjIgMDAwMDAwMDAwMDAwMGZmZgo+PiAo
ZDI0KSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPj4KPj4gV2hpY2ggYWxzbyBjb25m
aXJtcyB0aGUgZGVzY3JpcHRpb24gd2hpY2ggc3RhdGVzIHRoYXQgaW4gdGhlIGNhc2Ugb2YgYQo+
PiAxNiBiaXQgb3BlcmFuZCwgbm8gc2lnbiBleHRlbnNpb24gb2NjdXJzLgo+Pgo+PiBJIHRoZW4g
dHJpZWQgdGhlIHNhbWUgdGVzdCBvbiBhbiBJbnRlbCBIYXN3ZWxsIHN5c3RlbToKPj4KPj4gKGQ5
MSkgUHRyOiAwMDAwMDAwMDAwMDAxMDAwCj4+IChkOTEpwqAgPT4gYzJjMgo+PiAoZDkxKSBQdHI6
IDAwMDAwMDAwMDAwMDBmZmYKPj4gKGQ5MSkgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Cj4+IChkOTEpIFBBTklDOiBVbmhhbmRsZWQgZXhjZXB0aW9uIGF0IDAwMDg6MDAwMDAwMDAwMDEw
NDdhNQo+PiAoZDkxKSBWZWMgMTQgI1BGWy1kLXNyLV0gJWNyMiAwMDAwMDAwMDAwMDAwZmZmCj4+
IChkOTEpICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+IEJ1dCBqdWRnaW5nIGZyb20g
dGhlICJQdHI6IDAwMDAwMDAwMDAwMDBmZmYiIGluIHRoZSBsb2cgSSB0YWtlCj4gaXQgeW91IHRy
aWVkIHRvIGFjY2VzcyBhIGJ5dGUgcmF0aGVyIHRoYW4gYSB3b3JkICh3aGljaCB3b3VsZAo+IG5l
ZWQgYW4gYWRkcmVzcyBvZiAwMDAwMDAwMDAwMDAwZmZlIHRvIGRpc3Rpbmd1aXNoIHdoZXRoZXIg
aXQncwo+IGEgMi0gb3IgNC1ieXRlIHJlYWQgdGhhdCB0aGUgQ1BVIGlzc3VlcykuCgpObyAtIGl0
IHdhcyBhIHdvcmQgYWNjZXNzIGluIGFsbCBjYXNlcy7CoCBUaGUgYnVnIHdhcyB3YWxraW5nIGJh
Y2t3YXJkcwppbnRvIGFuIHVubWFwcGVkIHBhZ2UsIHJhdGhlciB0aGFuIGZvcndhcmQuCgpXaGVu
IHdhbGtpbmcgZm9yd2FyZCBmcm9tIDB4MWZmYyB0byAweDIwMDAsIEkgZG8gb2JzZXJ2ZSB0aGF0
IEFNRCBkb2VzCjQtYnl0ZSBhY2Nlc3NlcyB3aGlsZSBJbnRlbCBkb2VzIDIuCgo+IFRydXN0IG1l
LCBJIGRpZCB0cnkKPiB0aGlzIG91dCwgd2hpY2ggaXMgYWxzbyB3aHkgSSBub3RpY2VkIHRoYXQg
TWFyaydzIGNsYWltIG9mCj4gdGhlIGJlaGF2aW9yIGhhdmluZyBjaGFuZ2VkIHdpdGggU2FuZHlC
cmlkZ2UgaXMgbGlrZWx5IHdyb25nLgo+IEhlIGhhcyBtZWFud2hpbGUgY29uZmlybWVkIHRoYXQg
TWVyb20gYWxzbyBhbHJlYWR5IGJlaGF2ZWQgdGhpcwo+IHdheS4KClNhZGx5LCB3ZSBhbHNvIGhh
dmUgYSBzZWNvbmQgYnVnIGhlcmUsIGFuZCBpdCBpcyByYXRoZXIgbW9yZSBjb21wbGljYXRlZAp0
byByZWFzb24gYWJvdXQuCgpUaGUgc2hhZG93IGxpdmVsb2NrIGJ1ZyB3aXRoIGltcGxpY2l0IHN1
cGVydmlzb3IgYWNjZXNzZXMgdG8gdXNlcgptYXBwaW5ncyBoYXBwZW5zIHdoZW4gdGhlIHBpcGVs
aW5lIGdlbmVyYXRlcyAjUEYsIGFuZCB0aGUgZW11bGF0b3IKYmVsaWV2ZXMgdGhhdCB0aGUgaW5z
dHJ1Y3Rpb24gY29tcGxldGVzIGNvcnJlY3RseS7CoCBUaGUgU01BUCBjYXNlCnNwZWNpZmljYWxs
eSBvY2N1cnMgYmVjYXVzZSBpbmZvcm1hdGlvbiBpcyBkaXNjYXJkZWQgb24gVk1FeGl0IHdoaWNo
CnByZXZlbnRzIFhlbidzIHBhZ2V3YWxrIGZyb20gYmVoYXZpbmcgaWRlbnRpY2FsbHkgdG8gdGhl
IHBpcGVsaW5lLsKgCkhvd2V2ZXIsIGFueSBjYXNlIHdoZXJlIGhhcmR3YXJlIGFuZCB0aGUgZW11
bGF0b3IgZGlzYWdyZWUgaXMgYSByZWNpcGUKZm9yIGxpdmVsb2NrLgoKSW4gdGhpcyBleGFtcGxl
LCBoYXJkd2FyZSBjYW4gdGhlIGVtdWxhdG9yIGNhbiBkaXNhZ3JlZSBieSB1c2luZyBhCmRpZmZl
cmVudCBhY2Nlc3Mgd2lkdGguCgpJJ3ZlIGJlZW4gZXhwZXJpbWVudGluZyB3aXRoIG15IFJvbWUg
c3lzdGVtLCBhbmQgYW4gZW11bGF0b3IgaGFyZGNvZGVkCnRvIHVzZSAyLWJ5dGUgYWNjZXNzZXMu
wqAgQWZ0ZXIgc29tZSBpbnZlc3RpZ2F0aW9uLCB0aGUgbGl2ZWxvY2sgb25seQpvY2N1cnMgZm9y
IGFjY2Vzcy1yaWdodHMgZmF1bHRzLsKgIFRyYW5zbGF0aW9uIGZhdWx0cyBnZXQgaWRlbnRpZmll
ZCBhcwpub3QgYSBzaGFkb3cgZmF1bHQsIGFuZCBib3VuY2VkIGJhY2sgdG8gdGhlIGd1ZXN0LgoK
U2hhZG93IGd1ZXN0cyBjYW4gdXNlIFBLUlUsIHNvIGNhbiBnZW5lcmF0ZSBhbiBhY2Nlc3MgZmF1
bHQgYnkgbWFya2luZwp0aGUgcGFnZSBhdCAweDIwMDAgYXMgbm8tYWNjZXNzLCBzbyBJIHRoaW5r
IHRoYXQgaW4gcHJpbmNpcGxlLCB0aGlzCmNoYW5nZSB3aWxsIHJlc3VsdCBpbiBhIG5ldyBsYXRl
bnQgbGl2ZWxvY2sgY2FzZSwgYnV0IEkgY2FuJ3QgYWN0dWFsbHkKY29uZmlybSBpdC4KCkZvciBu
b3csIEkgZG9uJ3QgdGhpbmsgdGhpcyB3aWxsIGludGVyYWN0IHByb2JsZW1hdGljYWxseSB3aXRo
Cm1lbS1hY2Nlc3MgcmVkdWNlZCBwMm0gdHlwZXMsIGJlY2F1c2UgdGhleSBhcmUgaWdub3JlZCBi
eSB0aGUgZW11bGF0b3IuCgpIb3dldmVyLCBJIHRoaW5rIHdlIG5lZWQgdG8gdHJlYWQgdmVyeSBj
YXJlZnVsbHkgaGVyZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
