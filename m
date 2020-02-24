Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568A16AA82
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 16:53:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6G09-00080I-J9; Mon, 24 Feb 2020 15:50:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gzzy=4M=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6G07-000806-K0
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 15:50:31 +0000
X-Inumbo-ID: 6233e92a-571d-11ea-a490-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6233e92a-571d-11ea-a490-bc764e2007e4;
 Mon, 24 Feb 2020 15:50:30 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v28so12389761edw.12
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 07:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/dJJCNWJwDL7IS2++msJ7FnKjUexW+lwIlXg6Kw+gNI=;
 b=BBSvHFpOxBCe8wT2czcMmxXrOslb64Qg9CMQXW2N40QKQZ4NfdNS2oICbynIm2YM+A
 wfacrrEBPFVlj6rYWcBTuRd4FbGrhv1IA22B/+fXdgqANwYZhd95+aURWuYNnXN3TNSD
 8qhnT8mqUTDdSthcA/7qw52bmL0V0N923bodHw6oRj1xPvDwJBXqi1//o5t97r+MBItt
 quF0mOcl4BTV2K5kU80+ncrDtbdZq1g0XAPrQqRj0OacidlQpvTvNsVaAZDTyrHC1z9k
 DLdk64foYINeugpJOHo2+sW0hJk5bg8gSsXp4Ea4NsRM+ILDFFXM8xAcBk48PwLUE859
 hq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/dJJCNWJwDL7IS2++msJ7FnKjUexW+lwIlXg6Kw+gNI=;
 b=a7XTVZx+HaCYy9OaTc6C+7iln25dg291ADlfyIRyEhDIAsLq963QRlt67ymYanXqTm
 E1FXo1yAoJjGqTfddLtOnHTCDr316qEPHkMgxOigrvJtAZINUIccT8bkEjKLlxGjdmlb
 P35pGciNesRiqUjCubhsygIQMVOq+jkcDTKdK3fG5j3uzQJpkB+6mjkvAxSyIuRIXohY
 sCMQpwrJOeYwU/KsWapQA1y1qTcwJxz1Rhs+pOrZXPny399uDP8mbBkFUoMP3yWiBzpG
 OIAZOwirKwt/BzAYDdfra3EYRZKdJUKU9HdawMLaj0EGwvyWFfm2v/kb85TQ7gT03WZz
 OWxw==
X-Gm-Message-State: APjAAAWlUtEr+62T23IxT0yJTF690tLemBRoy8Ah5GLZPMeqtCE6jS4R
 bWwDW76txnmAdzj5LOxT2C+IIHXBwIg=
X-Google-Smtp-Source: APXvYqykpe+INZvd+GWeNG94wU8FHZUBU2JXYWwldt0w81rhN5L1uqZBe4XTkxa73Tx+7b/QgKpfNA==
X-Received: by 2002:a05:6402:1257:: with SMTP id
 l23mr48328515edw.342.1582559429462; 
 Mon, 24 Feb 2020 07:50:29 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id v16sm804526ejx.5.2020.02.24.07.50.28
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 07:50:28 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id g3so10923593wrs.12
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 07:50:28 -0800 (PST)
X-Received: by 2002:adf:8b54:: with SMTP id v20mr70175075wra.390.1582559427973; 
 Mon, 24 Feb 2020 07:50:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <818edf7f9407e377bba6564d58b9c65bce5e6493.1582310142.git.tamas.lengyel@intel.com>
 <20200224151250.GR4679@Air-de-Roger>
 <CABfawhmxwVbNH3o2wpn+SpH=cpVkYS2FsxPccFQt=XqQr=KMwA@mail.gmail.com>
 <20200224154218.GU4679@Air-de-Roger>
In-Reply-To: <20200224154218.GU4679@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 24 Feb 2020 08:49:51 -0700
X-Gmail-Original-Message-ID: <CABfawh=zNFS=aB45jeTkeqsG3dZjQsX8b2RMdeFOYG_UJ3=+bQ@mail.gmail.com>
Message-ID: <CABfawh=zNFS=aB45jeTkeqsG3dZjQsX8b2RMdeFOYG_UJ3=+bQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v9 4/5] x86/mem_sharing: reset a fork
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgODo0MiBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAwODozNTow
OUFNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBNb24sIEZlYiAyNCwgMjAy
MCBhdCA4OjEzIEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTA6NDk6MjJBTSAtMDgwMCwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiA+IEltcGxlbWVudCBoeXBlcmNhbGwgdGhhdCBh
bGxvd3MgYSBmb3JrIHRvIHNoZWQgYWxsIG1lbW9yeSB0aGF0IGdvdCBhbGxvY2F0ZWQKPiA+ID4g
PiBmb3IgaXQgZHVyaW5nIGl0cyBleGVjdXRpb24gYW5kIHJlLWxvYWQgaXRzIHZDUFUgY29udGV4
dCBmcm9tIHRoZSBwYXJlbnQgVk0uCj4gPiA+ID4gVGhpcyBhbGxvd3MgdGhlIGZvcmtlZCBWTSB0
byByZXNldCBpbnRvIHRoZSBzYW1lIHN0YXRlIHRoZSBwYXJlbnQgVk0gaXMgaW4gYQo+ID4gPiA+
IGZhc3RlciB3YXkgdGhlbiBjcmVhdGluZyBhIG5ldyBmb3JrIHdvdWxkIGJlLiBNZWFzdXJlbWVu
dHMgc2hvdyBhYm91dCBhIDJ4Cj4gPiA+ID4gc3BlZWR1cCBkdXJpbmcgbm9ybWFsIGZ1enppbmcg
b3BlcmF0aW9ucy4gUGVyZm9ybWFuY2UgbWF5IHZhcnkgZGVwZW5kaW5nIGhvdwo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4gb24KPiA+ID4gPiBtdWNoIG1lbW9yeSBnb3QgYWxsb2NhdGVkIGZvciB0
aGUgZm9ya2VkIFZNLiBJZiBpdCBoYXMgYmVlbiBjb21wbGV0ZWx5Cj4gPiA+ID4gZGVkdXBsaWNh
dGVkIGZyb20gdGhlIHBhcmVudCBWTSB0aGVuIGNyZWF0aW5nIGEgbmV3IGZvcmsgd291bGQgbGlr
ZWx5IGJlIG1vcmUKPiA+ID4gPiBwZXJmb3JtYW50Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KPiA+ID4gPiAt
LS0KPiA+ID4gPiAgeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCA3NiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvbWVt
b3J5LmggICB8ICAxICsKPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCsp
Cj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5n
LmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4gPiA+IGluZGV4IGFkNWRiOWQ4
ZDUuLmZiNjg5MmFhYTYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9z
aGFyaW5nLmMKPiA+ID4gPiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4g
PiA+IEBAIC0xNjM2LDYgKzE2MzYsNTkgQEAgc3RhdGljIGludCBtZW1fc2hhcmluZ19mb3JrKHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkb21haW4gKmNkKQo+ID4gPiA+ICAgICAgcmV0dXJuIHJj
Owo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiArLyoKPiA+ID4gPiArICogVGhlIGZvcmsgcmVz
ZXQgb3BlcmF0aW9uIGlzIGludGVuZGVkIHRvIGJlIHVzZWQgb24gc2hvcnQtbGl2ZWQgZm9ya3Mg
b25seS4KPiA+ID4gPiArICogVGhlcmUgaXMgbm8gaHlwZXJjYWxsIGNvbnRpbnVhdGlvbiBvcGVy
YXRpb24gaW1wbGVtZW50ZWQgZm9yIHRoaXMgcmVhc29uLgo+ID4gPiA+ICsgKiBGb3IgZm9ya3Mg
dGhhdCBvYnRhaW4gYSBsYXJnZXIgbWVtb3J5IGZvb3RwcmludCBpdCBpcyBsaWtlbHkgZ29pbmcg
dG8gYmUKPiA+ID4gPiArICogbW9yZSBwZXJmb3JtYW50IHRvIGNyZWF0ZSBhIG5ldyBmb3JrIGlu
c3RlYWQgb2YgcmVzZXR0aW5nIGFuIGV4aXN0aW5nIG9uZS4KPiA+ID4gPiArICoKPiA+ID4gPiAr
ICogVE9ETzogSW4gY2FzZSB0aGlzIGh5cGVyY2FsbCB3b3VsZCBiZWNvbWUgdXNlZnVsIG9uIGZv
cmtzIHdpdGggbGFyZ2VyIG1lbW9yeQo+ID4gPiA+ICsgKiBmb290cHJpbnRzIHRoZSBoeXBlcmNh
bGwgY29udGludWF0aW9uIHNob3VsZCBiZSBpbXBsZW1lbnRlZC4KPiA+ID4KPiA+ID4gSSdtIGFm
cmFpZCB0aGlzIGlzIG5vdCBzYWZlLCBhcyB1c2VycyBkb24ndCBoYXZlIGFuIGVhc3kgd2F5IHRv
IGtub3cKPiA+ID4gd2hldGhlciBhIGZvcmsgd2lsbCBoYXZlIGEgbGFyZ2UgbWVtb3J5IGZvb3Rw
cmludCBvciBub3QuCj4gPgo+ID4gVGhleSBkbywgZ2V0ZG9tYWluaW5mbyB0ZWxscyBhIHVzZXIg
ZXhhY3RseSBob3cgbXVjaCBtZW1vcnkgaGFzIGJlZW4KPiA+IGFsbG9jYXRlZCBmb3IgYSBkb21h
aW4uCj4gPgo+ID4gPgo+ID4gPiBJTU8geW91IGVpdGhlciBuZWVkIHNvbWUga2luZCBvZiBjaGVj
ayB0aGF0IHByZXZlbnRzIHRoaXMgZnVuY3Rpb24KPiA+ID4gZnJvbSBiZWluZyBleGVjdXRlZCB3
aGVuIHRoZSBkb21haW4gYXMgdG9vIG11Y2ggbWVtb3J5IGFzc2lnbmVkLCBvcgo+ID4gPiB5b3Ug
bmVlZCB0byBpbXBsZW1lbnQgY29udGludWF0aW9ucy4KPiA+Cj4gPiBJIHJlYWxseSBkb24ndCB0
aGluayB3ZSBuZWVkIGNvbnRpbnVhdGlvbiBoZXJlIHdpdGggdGhlIHVzZWNhc2Ugd2UKPiA+IGhh
dmUgZm9yIHRoaXMgZnVuY3Rpb24gYnV0IEknbSBhbHNvIHRpcmVkIG9mIGFyZ3VpbmcgYWJvdXQg
aXQsIHNvIEknbGwKPiA+IGp1c3QgYWRkIGl0IGV2ZW4gaWYgaXRzIGdvaW5nIHRvIGJlIGRlYWQg
Y29kZS4KPiA+Cj4gPiA+Cj4gPiA+IE9yIGVsc2UgdGhpcyBpcyB2ZXJ5IGxpa2VseSB0byB0cmlw
IG92ZXIgdGhlIHdhdGNoZG9nLgo+ID4KPiA+IFRoZSB3YXRjaGRvZz8KPgo+IFllcywgWGVuIGhh
cyBhIHdhdGNoZG9nIGFuZCB0aGlzIGxvb3AgaXMgbGlrZWx5IHRvIHRyaWdnZXIgaXQgaWYgaXQK
PiB0YWtlcyA+IDVzIHRvIGNvbXBsZXRlLiBUaGUgd2F0Y2hkb2cgdHJpZ2dlcmluZyBpcyBhIGZh
dGFsIGV2ZW50IGFuZAo+IGxlYWRzIHRvIGhvc3QgY3Jhc2guCgpPSywganVzdCB0byBnaXZlIHlv
dSBudW1iZXJzLCBpbiB0aGUgdXNlY2FzZSB0aGlzIGZ1bmN0aW9uIGlzIHRhcmdldGVkCmF0IHdl
IGNhbGwgaXQgYWJvdXQgfjEwMC9zLiBFdmVuIGluIG91ciB3b3JzdCBjYXNlIHNjZW5hcmlvIHdl
J3ZlIHNlZW4Kc28gZmFyIHdlIGhhdmVuJ3QgaGFkIGEgZG9tYWluIHdpdGggZW5vdWdoIG1lbW9y
eSBkZWR1cGxpY2F0aW9uIHdoZXJlCnRoaXMgZnVuY3Rpb24gdG9vayBsb25nZXIgdGhlbiAxcyB0
byBmaW5pc2guIEJ1dCBhZ2FpbiwgYXQgdGhpcyBwb2ludAp3ZSBzcGVudCBtb3JlIHRpbWUgYXJn
dWluZyBhYm91dCBjb250aW51YXRpb24gdGhlbiBpdCB0YWtlcyB0byBhZGQgaXQKc28gbGV0cyBq
dXN0IG1vdmUgb24uCgo+Cj4gTm90ZSB0aGF0IHdhdGNoZG9nIGlzIG5vdCBlbmFibGVkIGJ5IGRl
ZmF1bHQsIHlvdSBuZWVkIHRvIGVuYWJsZSBpdCBvbgo+IHRoZSBYZW4gY29tbWFuZCBsaW5lLgoK
SW4gdGhhdCBjYXNlIEkgZG9uJ3QgdGhpbmsgdGhlIGN1cnJlbnQgc2V0dXAgd291bGQgcmVhbGx5
IGJvdGhlciBhbnlvbmUuCgo+Cj4gPiA+ID4gKyAgICB7Cj4gPiA+ID4gKyAgICAgICAgcDJtX3R5
cGVfdCBwMm10Owo+ID4gPiA+ICsgICAgICAgIHAybV9hY2Nlc3NfdCBwMm1hOwo+ID4gPiA+ICsg
ICAgICAgIGdmbl90IGdmbjsKPiA+ID4gPiArICAgICAgICBtZm5fdCBtZm4gPSBwYWdlX3RvX21m
bihwYWdlKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikg
KQo+ID4gPiA+ICsgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAg
ICAgZ2ZuID0gbWZuX3RvX2dmbihjZCwgbWZuKTsKPiA+ID4gPiArICAgICAgICBtZm4gPSBfX2dl
dF9nZm5fdHlwZV9hY2Nlc3MocDJtLCBnZm5feChnZm4pLCAmcDJtdCwgJnAybWEsCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIE5VTEwsIGZhbHNlKTsKPiA+
ID4gPiArCj4gPiA+ID4gKyAgICAgICAgaWYgKCAhcDJtX2lzX3JhbShwMm10KSB8fCBwMm1faXNf
c2hhcmVkKHAybXQpICkKPiA+ID4gPiArICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ID4gKwo+
ID4gPiA+ICsgICAgICAgIC8qIHRha2UgYW4gZXh0cmEgcmVmZXJlbmNlICovCj4gPiA+ID4gKyAg
ICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgY2QpICkKPiA+ID4gPiArICAgICAgICAgICAgY29u
dGludWU7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgIHJjID0gcDJtLT5zZXRfZW50cnkocDJt
LCBnZm4sIElOVkFMSURfTUZOLCBQQUdFX09SREVSXzRLLAo+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcDJtX2ludmFsaWQsIHAybV9hY2Nlc3Nfcnd4LCAtMSk7Cj4gPiA+ID4g
KyAgICAgICAgQVNTRVJUKCFyYyk7Cj4gPiA+Cj4gPiA+IENhbiB5b3UgaGFuZGxlIHRoaXMgZ3Jh
Y2VmdWxseT8KPiA+Cj4gPiBOb3BlLiBUaGlzIHNob3VsZCBuZXZlciBoYXBwZW4sIHNvIGlmIGl0
IGRvZXMsIHNvbWV0aGluZyBpcyB2ZXJ5IHdyb25nCj4gPiBpbiBzb21lIG90aGVyIHBhcnQgb2Yg
WGVuLgo+Cj4gT0ssIHBsZWFzZSBzd2l0Y2ggaXQgdG8gQlVHX09OIHRoZW4gaW5zdGVhZCBvZiBB
U1NFUlQuIEl0J3MgYmV0dGVyIHRvCj4gY3Jhc2ggaGVyZSB0aGFuIHRvIG1pc2JlaGF2ZSBsYXRl
ci4KClN1cmUKClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
