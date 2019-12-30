Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36AB12D384
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 19:46:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1im017-0008Gt-5W; Mon, 30 Dec 2019 18:43:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ggqA=2U=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1im016-0008Go-4i
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 18:43:48 +0000
X-Inumbo-ID: 4f297148-2b34-11ea-a05b-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f297148-2b34-11ea-a05b-12813bfff9fa;
 Mon, 30 Dec 2019 18:43:45 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b8so33515400edx.7
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 10:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0BdhV9uLCOdE48MQYaB2YnUJS+C0JU4GOWrpzwEzrMc=;
 b=mpJ5PYpxumpvCDqOl6utAg4nnk0VVdnu3D3Ij2CXeVDBu7h5/4zOcD523hBOulrZ3p
 KXJF4doWZsNPsBaVWuV4iao/Z+gN3by21jJ0X2lN9e2lX70+ZeCQeoCYRhX/qsFkk2R8
 i2cs8DahPn6u0/MiEnL+3rY9UH72oEFgq/NCUkd59uucue/tidYXEq9uNdDyk+5LcI6n
 v9TxDq8MIBDrE4/ZtR+ZM2ik5ks5cTtOUMwhIEBD0sHOjQ5jUHuhG6CkWPJp6Xaod7cH
 wAD4ZaVZpi/rjXMLfdxLojdNctzCMcQk4ODs3vKX+1K2EzrXp+BSR99GCa6JkH8qLG/h
 bXmA==
X-Gm-Message-State: APjAAAW3xjKL73Nb1e87KFuW1j1eoC67WWphER8Gz9z5Vhowo6Ie4Knj
 UmPJ/xNu2dWH2CMTJM6PHFM=
X-Google-Smtp-Source: APXvYqxpxQrvg+05M64GxzDsEMsEwwiEuqr/ZFvE5E6/vLcvy44PsWJaddUUzNMEzUSUdBYZ8zJA+A==
X-Received: by 2002:a05:6402:30a8:: with SMTP id
 df8mr17964301edb.22.1577731424923; 
 Mon, 30 Dec 2019 10:43:44 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id h61sm5406422edd.49.2019.12.30.10.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 10:43:44 -0800 (PST)
To: Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
Date: Mon, 30 Dec 2019 18:43:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiAzMC8xMi8yMDE5IDE4OjE1LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
T24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMTA6NTkgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Pgo+PiBPbiBUaHUsIERlYyAxOSwgMjAxOSBhdCAwODo1
ODowMUFNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+PiBPbiBUaHUsIERlYyAxOSwg
MjAxOSBhdCAyOjQ4IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3
cm90ZToKPj4+Pgo+Pj4+IE9uIFdlZCwgRGVjIDE4LCAyMDE5IGF0IDExOjQwOjM3QU0gLTA4MDAs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+Pj4gVGhlIGZvbGxvd2luZyBzZXJpZXMgaW1wbGVt
ZW50cyBWTSBmb3JraW5nIGZvciBJbnRlbCBIVk0gZ3Vlc3RzIHRvIGFsbG93IGZvcgo+Pj4+PiB0
aGUgZmFzdCBjcmVhdGlvbiBvZiBpZGVudGljYWwgVk1zIHdpdGhvdXQgdGhlIGFzc29zY2lhdGVk
IGhpZ2ggc3RhcnR1cCBjb3N0cwo+Pj4+PiBvZiBib290aW5nIG9yIHJlc3RvcmluZyB0aGUgVk0g
ZnJvbSBhIHNhdmVmaWxlLgo+Pj4+Pgo+Pj4+PiBKSVJBIGlzc3VlOiBodHRwczovL3hlbnByb2pl
Y3QuYXRsYXNzaWFuLm5ldC9icm93c2UvWEVOLTg5Cj4+Pj4+Cj4+Pj4+IFRoZSBtYWluIGRlc2ln
biBnb2FsIHdpdGggdGhpcyBzZXJpZXMgaGFzIGJlZW4gdG8gcmVkdWNlIHRoZSB0aW1lIG9mIGNy
ZWF0aW5nCj4+Pj4+IHRoZSBWTSBmb3JrIGFzIG11Y2ggYXMgcG9zc2libGUuIFRvIGFjaGlldmUg
dGhpcyB0aGUgVk0gZm9ya2luZyBwcm9jZXNzIGlzCj4+Pj4+IHNwbGl0IGludG8gdHdvIHN0ZXBz
Ogo+Pj4+PiAgICAgIDEpIGZvcmtpbmcgdGhlIFZNIG9uIHRoZSBoeXBlcnZpc29yIHNpZGU7Cj4+
Pj4+ICAgICAgMikgc3RhcnRpbmcgUUVNVSB0byBoYW5kbGUgdGhlIGJhY2tlZCBmb3IgZW11bGF0
ZWQgZGV2aWNlcy4KPj4+Pj4KPj4+Pj4gU3RlcCAxKSBpbnZvbHZlcyBjcmVhdGluZyBhIFZNIHVz
aW5nIHRoZSBuZXcgInhsIGZvcmstdm0iIGNvbW1hbmQuIFRoZQo+Pj4+PiBwYXJlbnQgVk0gaXMg
ZXhwZWN0ZWQgdG8gcmVtYWluIHBhdXNlZCBhZnRlciBmb3JrcyBhcmUgY3JlYXRlZCBmcm9tIGl0
ICh3aGljaAo+Pj4+PiBpcyBkaWZmZXJlbnQgdGhlbiB3aGF0IHByb2Nlc3MgZm9ya2luZyBub3Jt
YWxseSBlbnRhaWxzKS4gRHVyaW5nIHRoaXMgZm9ya2luZwo+Pj4+ICAgICAgICAgICAgICAgICBe
IHRoYW4KPj4+Pj4gb3BlcmF0aW9uIHRoZSBIVk0gY29udGV4dCBhbmQgVk0gc2V0dGluZ3MgYXJl
IGNvcGllZCBvdmVyIHRvIHRoZSBuZXcgZm9ya2VkIFZNLgo+Pj4+PiBUaGlzIG9wZXJhdGlvbiBp
cyBmYXN0IGFuZCBpdCBhbGxvd3MgdGhlIGZvcmtlZCBWTSB0byBiZSB1bnBhdXNlZCBhbmQgdG8g
YmUKPj4+Pj4gbW9uaXRvcmVkIGFuZCBhY2Nlc3NlZCB2aWEgVk1JLiBOb3RlIGhvd2V2ZXIgdGhh
dCB3aXRob3V0IGl0cyBkZXZpY2UgbW9kZWwKPj4+Pj4gcnVubmluZyAoZGVwZW5kaW5nIG9uIHdo
YXQgaXMgZXhlY3V0aW5nIGluIHRoZSBWTSkgaXQgaXMgYm91bmQgdG8KPj4+Pj4gbWlzYmVoYXZl
L2NyYXNoIHdoZW4gaXRzIHRyeWluZyB0byBhY2Nlc3MgZGV2aWNlcyB0aGF0IHdvdWxkIGJlIGVt
dWxhdGVkIGJ5Cj4+Pj4+IFFFTVUuIFdlIGFudGljaXBhdGUgdGhhdCBmb3IgY2VydGFpbiB1c2Ut
Y2FzZXMgdGhpcyB3b3VsZCBiZSBhbiBhY2NlcHRhYmxlCj4+Pj4+IHNpdHVhdGlvbiwgaW4gY2Fz
ZSBmb3IgZXhhbXBsZSB3aGVuIGZ1enppbmcgaXMgcGVyZm9ybWVkIG9mIGNvZGUgc2VnbWVudHMg
dGhhdAo+Pj4+PiBkb24ndCBhY2Nlc3Mgc3VjaCBkZXZpY2VzLgo+Pj4+Pgo+Pj4+PiBTdGVwIDIp
IGludm9sdmVzIGxhdW5jaGluZyBRRU1VIHRvIHN1cHBvcnQgdGhlIGZvcmtlZCBWTSwgd2hpY2gg
cmVxdWlyZXMgdGhlCj4+Pj4+IFFFTVUgWGVuIHNhdmVmaWxlIHRvIGJlIGdlbmVyYXRlZCBtYW51
YWxseSBmcm9tIHRoZSBwYXJlbnQgVk0uIFRoaXMgY2FuIGJlCj4+Pj4+IGFjY29tcGxpc2hlZCBz
aW1wbHkgYnkgY29ubmVjdGluZyB0byBpdHMgUU1QIHNvY2tldCBhbmQgaXNzdWluZyB0aGUKPj4+
Pj4gInhlbi1zYXZlLWRldmljZXMtc3RhdGUiIGNvbW1hbmQgYXMgZG9jdW1lbnRlZCBieSBRRU1V
Ogo+Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11L2Jsb2IvbWFzdGVyL2RvY3MveGVu
LXNhdmUtZGV2aWNlcy1zdGF0ZS50eHQKPj4+Pj4gT25jZSB0aGUgUUVNVSBYZW4gc2F2ZWZpbGUg
aXMgZ2VuZXJhdGVkIHRoZSBuZXcgInhsIGZvcmstbGF1bmNoLWRtIiBjb21tYW5kIGlzCj4+Pj4+
IHVzZWQgdG8gbGF1bmNoIFFFTVUgYW5kIGxvYWQgdGhlIHNwZWNpZmllZCBzYXZlZmlsZSBmb3Ig
aXQuCj4+Pj4KPj4+PiBJTU8gaGF2aW5nIHR3byBkaWZmZXJlbnQgY29tbWFuZHMgaXMgY29uZnVz
aW5nIGZvciB0aGUgZW5kIHVzZXIsIEkKPj4+PiB3b3VsZCByYXRoZXIgaGF2ZSBzb21ldGhpbmcg
bGlrZToKPj4+Pgo+Pj4+IHhsIGZvcmstdm0gWy1kXSAuLi4KPj4+Pgo+Pj4+IFdoZXJlICctZCcg
d291bGQgcHJldmVudCBmb3JraW5nIGFueSB1c2VyLXNwYWNlIGVtdWxhdG9ycy4gSSBkb24ndAo+
Pj4+IHRoaW5rcyB0aGVyZSdzIGEgbmVlZCBmb3IgYSBzZXBhcmF0ZSBjb21tYW5kIHRvIGZvcmsg
dGhlIHVuZGVybHlpbmcKPj4+PiB1c2VyLXNwYWNlIGVtdWxhdG9ycy4KPj4+Cj4+PiBLZWVwaW5n
IGl0IGFzIHR3byBjb21tYW5kcyBhbGxvd3MgeW91IHRvIHN0YXJ0IHVwIHRoZSBmb3JrIGFuZCBs
ZXQgaXQKPj4+IHJ1biBpbW1lZGlhdGVseSBhbmQgb25seSBzdGFydCB1cCBRRU1VIHdoZW4geW91
IG5vdGljZSBpdCBpcyBuZWVkZWQuCj4+PiBUaGUgaWRlYSBiZWluZyB0aGF0IHlvdSBjYW4gbW9u
aXRvciB0aGUga2VybmVsIGFuZCBzZWUgd2hlbiBpdCB0cmllcwo+Pj4gdG8gZG8gc29tZSBJL08g
dGhhdCB3b3VsZCByZXF1aXJlIHRoZSBRRU1VIGJhY2tlbmQuIElmIHlvdSBjb21iaW5lIHRoZQo+
Pj4gY29tbWFuZHMgdGhhdCBvcHRpb24gZ29lcyBhd2F5Lgo+Pgo+PiBJJ20gbm90IHN1cmUgSSBz
ZWUgd2h5LCB5b3UgY291bGQgc3RpbGwgcHJvdmlkZSBhIGB4bCBmb3JrLXZtIFstY10KPj4gLi4u
YCB0aGF0IHdvdWxkIGp1c3QgbHVuY2ggYSBRRU1VIGluc3RhbmNlLiBFbmQgdXNlcnMgdXNpbmcg
eGwgaGF2ZQo+PiBBRkFJQ1Qgbm8gd2F5IHRvIHRlbGwgd2hldGhlciBvciB3aGVuIGEgUUVNVSBp
cyBuZWVkZWQgb3Igbm90LCBhbmQKPj4gaGVuY2UgdGhlIGRlZmF1bHQgYmVoYXZpb3Igc2hvdWxk
IGJlIGEgZnVsbHkgZnVuY3Rpb25hbCBvbmUuCj4+Cj4+IElNTyBJIHRoaW5rIGZvcmstdm0gd2l0
aG91dCBhbnkgb3B0aW9ucyBzaG91bGQgZG8gYSBjb21wbGV0ZSBmb3JrIG9mIGEKPj4gVk0sIHJh
dGhlciB0aGFuIGEgcGFydGlhbCBvbmUgd2l0aG91dCBhIGRldmljZSBtb2RlbCBjbG9uZS4KPiAK
PiBJIHVuZGVyc3RhbmQgeW91ciBwb2ludCBidXQgaW1wbGVtZW50aW5nIHRoYXQgaXMgb3V0c2lk
ZSB0aGUgc2NvcGUgb2YKPiB3aGF0IHdlIGFyZSBkb2luZyByaWdodCBub3cuIFRoZXJlIGFyZSBh
IGxvdCBtb3JlIHN0ZXBzIGludm9sdmVkIGlmCj4geW91IHdhbnQgdG8gY3JlYXRlIGEgZnVsbHkg
ZnVuY3Rpb25hbCBWTSBmb3JrIHdpdGggUUVNVSwgZm9yIGV4YW1wbGUKPiB5b3UgYWxzbyBoYXZl
IHRvIGNyZWF0ZSBhIHNlcGFyYXRlIGRpc2sgc28geW91IGRvbid0IGNsb2JiZXIgdGhlCj4gcGFy
ZW50IFZNJ3MgZGlzay4gQWxzbywgc2F2aW5nIHRoZSBRRU1VIGRldmljZSBzdGF0ZSBpcyBjdXJy
ZW50bHkKPiBoYXJkLXdpcmVkIGludG8gdGhlIHNhdmUvbWlncmF0aW9uIG9wZXJhdGlvbiwgc28g
Y2hhbmdpbmcgdGhhdAo+IHBsdW1iaW5nIGluIGxpYnhsIGlzIHF1aXRlIGludm9sdmVkLiBJIGFj
dHVhbGx5IGZvdW5kIGl0IHdheSBlYXNpZXIgdG8KPiBqdXN0IHdyaXRlIGEgc2NyaXB0IHRoYXQg
Y29ubmVjdHMgdG8gdGhlIHNvY2tldCBhbmQgc2F2ZXMgaXQgdG8gYQo+IHRhcmdldCBmaWxlIHRo
ZW4gZ29pbmcgdGhyb3VnaCB0aGUgcGFpbiBvZiBhZGp1c3RpbmcgbGlieGwuIFNvIHdoaWxlCj4g
dGhpcyBjb3VsZCBiZSBpbXBsZW1lbnRlZCBhdCB0aGlzIHRpbWUgaXQgd29uJ3QgYmUuClRoYXQn
cyBmaW5lIHRvIG5vdCBpbXBsZW1lbnQgaXQgcmlnaHQgbm93LCBob3dldmVyIHRoZSB1c2VyIGlu
dGVyZmFjZSAKc2hvdWxkIGJlIGFibGUgdG8gY2F0ZXIgaXQuCgpJbiB0aGlzIGNhc2UsIEkgYWdy
ZWUgd2l0aCBSb2dlciB0aGF0IGl0IGlzIG1vcmUgaW50dWl0aXZlIHRvIHRoaW5rIHRoYXQgCmZv
cmsgbWVhbnMgYSBjb21wbGV0ZSBmb3JrLCBub3QgYSBwYXJ0aWFsIG9uZS4KCllvdSBjb3VsZCBp
bXBvc2UgdGhlIHVzZXIgdG8gYWx3YXlzIHBhc3MgdGhhdCBvcHRpb24gdG8gbm90IGNsb25lIHRo
ZSAKZGV2aWNlIG1vZGVsIGFuZCByZXR1cm4gYW4gZXJyb3IgaWYgaXQgaXMgbm90IHRoZXJlLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
