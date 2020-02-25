Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AD116C2B8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:49:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6aXi-000214-WB; Tue, 25 Feb 2020 13:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xmvt=4N=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6aXh-00020z-Hh
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:46:33 +0000
X-Inumbo-ID: 3b4d1e22-57d5-11ea-8fc3-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b4d1e22-57d5-11ea-8fc3-bc764e2007e4;
 Tue, 25 Feb 2020 13:46:32 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id dc19so16267787edb.10
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 05:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OW66tQdWR5Ts5K5w1sFwl7FvQhhud7enUVI4ip3mBqk=;
 b=Z170AOJrNxZlyLqYL0JbbCV210ct8YGyPsjKa/VSzuSAz31NRAigBHo+AIYXF/SK8A
 1jgFy48iHAvdKaexsaXfCVEOJ6fqH+OBZwgbm5RB+Lk2u7mAAfkXy7zzCPzhc0/hS/8J
 j7nvG9KXNjBu6iVpBUVt1Mikpy9JD9Vtszhc9wj+yB7SVXghpPrIUGmO78w6ZzG3Towb
 r7AU64tQzMuo7ZRWDsQx7mVkO743UyJ3a8aNqs5niIQYydFtBy13L6zfIoS4tOO68YPs
 2Zxg30T3RfBMcvPtN9VbIBsFpLAiMW1+ECpwkARYX0LeLLagGPErLAJ/IhF3LtmOSIQP
 Vm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OW66tQdWR5Ts5K5w1sFwl7FvQhhud7enUVI4ip3mBqk=;
 b=jDMezXuloxAiWo9d4wKxjiOwjM7y7+ILgehXCANfrgcq57aastltxu5JM0CiZW7DMW
 phYM/4gZQQpnM9AzEK31yQEKthjHiRtU1YNdGYJPkATldyMlMnCRAjEILeqegFf5FuHX
 x2u0g2YRyOAneP/FuG1Ruf+6NP/+prqQ/aPISvx5HhcBinBsfluDmwPXdmR7SaXyi7L1
 EBSN56xE/ecyf8PgX+tYq4F+UVN2QAOSqP2nHrtsNTmEiwBq3FgStGgWmFVquCPF9E17
 ot6zsI6lMMfrj9K6iCy7fh4ixOyS5IiaAfxWBvmln6u2nmMr0fyJrJvhwXmcM8CCw8c5
 ARLg==
X-Gm-Message-State: APjAAAX9bwj7RpNy/he6K8Yt1UgE9O/WTFPRQn+17OkI2XuXhgi78Own
 TuituFoaojAoB0O29NrE2ssGeaO60FI=
X-Google-Smtp-Source: APXvYqxUhebUT0yUw45el/mSaAagEg1PXFrVkQCywKQ9VzzKj2Ar8MrrcT5t7H6IhId6kiW7T/YV5g==
X-Received: by 2002:aa7:db44:: with SMTP id n4mr50837282edt.357.1582638391672; 
 Tue, 25 Feb 2020 05:46:31 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id f19sm971486ejb.7.2020.02.25.05.46.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 05:46:31 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id w12so14820299wrt.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 05:46:30 -0800 (PST)
X-Received: by 2002:adf:f986:: with SMTP id f6mr75952027wrr.182.1582638390282; 
 Tue, 25 Feb 2020 05:46:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <818edf7f9407e377bba6564d58b9c65bce5e6493.1582310142.git.tamas.lengyel@intel.com>
 <20200224151250.GR4679@Air-de-Roger>
 <CABfawhmxwVbNH3o2wpn+SpH=cpVkYS2FsxPccFQt=XqQr=KMwA@mail.gmail.com>
 <c2c48b3c-4bbb-698f-2783-4bc2359cd985@suse.com>
In-Reply-To: <c2c48b3c-4bbb-698f-2783-4bc2359cd985@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Feb 2020 06:45:54 -0700
X-Gmail-Original-Message-ID: <CABfawhk1yZ66_xU0uOjpF1CyEh1V8HGCE4=-msCyqb_nxwrg9g@mail.gmail.com>
Message-ID: <CABfawhk1yZ66_xU0uOjpF1CyEh1V8HGCE4=-msCyqb_nxwrg9g@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
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
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgNjozOSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjQuMDIuMjAyMCAxNjozNSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgODoxMyBBTSBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gT24gRnJpLCBGZWIgMjEsIDIwMjAg
YXQgMTA6NDk6MjJBTSAtMDgwMCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiAtLS0gYS94
ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0v
bWVtX3NoYXJpbmcuYwo+ID4+PiBAQCAtMTYzNiw2ICsxNjM2LDU5IEBAIHN0YXRpYyBpbnQgbWVt
X3NoYXJpbmdfZm9yayhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCkKPiA+Pj4g
ICAgICByZXR1cm4gcmM7Cj4gPj4+ICB9Cj4gPj4+Cj4gPj4+ICsvKgo+ID4+PiArICogVGhlIGZv
cmsgcmVzZXQgb3BlcmF0aW9uIGlzIGludGVuZGVkIHRvIGJlIHVzZWQgb24gc2hvcnQtbGl2ZWQg
Zm9ya3Mgb25seS4KPiA+Pj4gKyAqIFRoZXJlIGlzIG5vIGh5cGVyY2FsbCBjb250aW51YXRpb24g
b3BlcmF0aW9uIGltcGxlbWVudGVkIGZvciB0aGlzIHJlYXNvbi4KPiA+Pj4gKyAqIEZvciBmb3Jr
cyB0aGF0IG9idGFpbiBhIGxhcmdlciBtZW1vcnkgZm9vdHByaW50IGl0IGlzIGxpa2VseSBnb2lu
ZyB0byBiZQo+ID4+PiArICogbW9yZSBwZXJmb3JtYW50IHRvIGNyZWF0ZSBhIG5ldyBmb3JrIGlu
c3RlYWQgb2YgcmVzZXR0aW5nIGFuIGV4aXN0aW5nIG9uZS4KPiA+Pj4gKyAqCj4gPj4+ICsgKiBU
T0RPOiBJbiBjYXNlIHRoaXMgaHlwZXJjYWxsIHdvdWxkIGJlY29tZSB1c2VmdWwgb24gZm9ya3Mg
d2l0aCBsYXJnZXIgbWVtb3J5Cj4gPj4+ICsgKiBmb290cHJpbnRzIHRoZSBoeXBlcmNhbGwgY29u
dGludWF0aW9uIHNob3VsZCBiZSBpbXBsZW1lbnRlZC4KPiA+Pgo+ID4+IEknbSBhZnJhaWQgdGhp
cyBpcyBub3Qgc2FmZSwgYXMgdXNlcnMgZG9uJ3QgaGF2ZSBhbiBlYXN5IHdheSB0byBrbm93Cj4g
Pj4gd2hldGhlciBhIGZvcmsgd2lsbCBoYXZlIGEgbGFyZ2UgbWVtb3J5IGZvb3RwcmludCBvciBu
b3QuCj4gPgo+ID4gVGhleSBkbywgZ2V0ZG9tYWluaW5mbyB0ZWxscyBhIHVzZXIgZXhhY3RseSBo
b3cgbXVjaCBtZW1vcnkgaGFzIGJlZW4KPiA+IGFsbG9jYXRlZCBmb3IgYSBkb21haW4uCj4KPiBU
aGlzIHRlbGxzIHRoZSB0b29sIHN0YWNrIGhvdyBtdWNoIG1lbW9yeSBhIGd1ZXN0IGhhcyBpbiBh
YnNvbHV0ZQo+IG51bWJlcnMsIGJ1dCBpdCBkb2Vzbid0IHRlbGwgaXQgd2hldGhlciBYZW4gd291
bGQgY29uc2lkZXIgdGhpcwo+ICJsYXJnZSIuCj4KPiA+Pj4gKyAgICB7Cj4gPj4+ICsgICAgICAg
IHAybV90eXBlX3QgcDJtdDsKPiA+Pj4gKyAgICAgICAgcDJtX2FjY2Vzc190IHAybWE7Cj4gPj4+
ICsgICAgICAgIGdmbl90IGdmbjsKPiA+Pj4gKyAgICAgICAgbWZuX3QgbWZuID0gcGFnZV90b19t
Zm4ocGFnZSk7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikgKQo+
ID4+PiArICAgICAgICAgICAgY29udGludWU7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgICAgZ2ZuID0g
bWZuX3RvX2dmbihjZCwgbWZuKTsKPiA+Pj4gKyAgICAgICAgbWZuID0gX19nZXRfZ2ZuX3R5cGVf
YWNjZXNzKHAybSwgZ2ZuX3goZ2ZuKSwgJnAybXQsICZwMm1hLAo+ID4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMCwgTlVMTCwgZmFsc2UpOwo+ID4+PiArCj4gPj4+ICsg
ICAgICAgIGlmICggIXAybV9pc19yYW0ocDJtdCkgfHwgcDJtX2lzX3NoYXJlZChwMm10KSApCj4g
Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsKPiA+Pj4gKwo+ID4+PiArICAgICAgICAvKiB0YWtl
IGFuIGV4dHJhIHJlZmVyZW5jZSAqLwo+ID4+PiArICAgICAgICBpZiAoICFnZXRfcGFnZShwYWdl
LCBjZCkgKQo+ID4+PiArICAgICAgICAgICAgY29udGludWU7Cj4gPj4+ICsKPiA+Pj4gKyAgICAg
ICAgcmMgPSBwMm0tPnNldF9lbnRyeShwMm0sIGdmbiwgSU5WQUxJRF9NRk4sIFBBR0VfT1JERVJf
NEssCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX2ludmFsaWQsIHAybV9h
Y2Nlc3Nfcnd4LCAtMSk7Cj4gPj4+ICsgICAgICAgIEFTU0VSVCghcmMpOwo+ID4+Cj4gPj4gQ2Fu
IHlvdSBoYW5kbGUgdGhpcyBncmFjZWZ1bGx5Pwo+ID4KPiA+IE5vcGUuIFRoaXMgc2hvdWxkIG5l
dmVyIGhhcHBlbiwgc28gaWYgaXQgZG9lcywgc29tZXRoaW5nIGlzIHZlcnkgd3JvbmcKPiA+IGlu
IHNvbWUgb3RoZXIgcGFydCBvZiBYZW4uCj4KPgo+IEluIHN1Y2ggYSBjYXNlLCBwbGVhc2UgcHV0
IGluIGEgY29tbWVudCBleHBsYWluaW5nIHdoeSBmYWlsdXJlIGlzCj4gaW1wb3NzaWJsZS4gSW4g
dGhlIGdlbmVyYWwgY2FzZSBlLmcuIGEgMk1iIHBhZ2UgbWF5IG5lZWQgc3BsaXR0aW5nLAo+IHdo
aWNoIG1heSB5aWVsZCAtRU5PTUVNLiBTdWNoIGEgY29tbWVudCB3aWxsIHRoZW4gYWxzbyBiZSB1
c2VmdWwgaW4KPiBjYXNlIGEgbmV3IGZhaWx1cmUgbW9kZSBnZXRzIGFkZGVkIHRvIC0+c2V0X2Vu
dHJ5KCksIHdoZXJlIGl0IHRoZW4KPiB3aWxsIG5lZWQganVkZ2luZyB3aGV0aGVyIHRoZSBhc3N1
bXB0aW9uIGhlcmUgc3RpbGwgaG9sZHMuIChUaGlzIGlzCj4gYWxzbyB3aHkgaW4gZ2VuZXJhbCBp
dCdkIGJlIGJldHRlciB0byBoYW5kbGUgdGhlIGVycm9yLiBJdCdsbCBzdGlsbAo+IGJlIGJldHRl
ciB0byBjcmFzaCB0aGUgZ3Vlc3QgdGhhbiB0aGUgaG9zdCBpbiBjYXNlIHlvdSBjYW4ndC4gU2Vl
Cj4gdGhlIGJvdHRvbSBvZiAuL0NPRElOR19TVFlMRS4pCgpUaGUgbWVtX3NoYXJpbmcgY29kZWJh
c2UgdXNlcyBBU1NFUlQoIXJjKSBvbiBwMm0tPnNldF9lbnRyeSBhbHJlYWR5CndoZW4gcmVtb3Zp
bmcgcGFnZXMgbGlrZSB3ZSBkbyBoZXJlIChzZWUgcmVsaW5xdWlzaF9zaGFyZWRfcGFnZXMpLgpU
aGlzIG9ubHkgZ2V0cyBjYWxsZWQgb24gc2hhcmVkIHBhZ2VzIHRoYXQgd2Uga25vdyBmb3Igc3Vy
ZSBhcmUKcHJlc2VudC4gU2luY2UgdGhlc2UgYXJlIHNoYXJlZCBwYWdlcyB3ZSBrbm93IHRoYXQg
dGhlaXIgc2l6ZSBpcyA0awp0aHVzIHRoZXJlIGlzIG5vIHNwbGl0dGluZy4gSSBjYW4gY2VydGFp
bmx5IGFkZCBhIGNvbW1lbnQgdG8gdGhpcwplZmZlY3QgdG8gc3BlbGwgaXQgb3V0IHdoeSB0aGUg
QVNTRVJUIGlzIGFwcHJvcHJpYXRlLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
