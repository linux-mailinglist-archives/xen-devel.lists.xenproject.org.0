Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A16D146D54
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:50:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iueir-00028s-OU; Thu, 23 Jan 2020 15:48:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ucZ6=3M=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iueip-00028V-R5
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:48:43 +0000
X-Inumbo-ID: d4e72750-3df7-11ea-9fd7-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4e72750-3df7-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 15:48:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so3060945wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 07:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/NHdbYlfHgkgimDfc5nnVSyOXrz5Vj1VUEscQV3lbb8=;
 b=sXIOEvuw1bH7oLgapeBmZ5Cy912J4hU6EiNqvXIMbruFP42Mh5PytkCKrKyKV4hTie
 qaeQOBbBZNNF1eLb4yeRghnqBMi82iVMx3CXIhK82G3CXdp2pirnys3viydFCHnqWnY6
 3ip1E5pFaxFyuBpekgq9te5HjAEmSLbzBD6may7xrLUYjtPfIrYdnGotgvcoJgvv7wO/
 MC/qzjyD3iZ8E+QLWEYxfqXDVv7W0d1NNGrAvH+1dV/Kdc4fB6GWlRY/cqFl8Vtzs32v
 rbizBwHA8xyGxoyc8XTwrrr5jYl/hv+IhPK93MBodGLrW+NYDBLDk8gcQeZR1XhgpZaL
 l+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/NHdbYlfHgkgimDfc5nnVSyOXrz5Vj1VUEscQV3lbb8=;
 b=nSC2CyrrZjTt1Z3IltI787O4pysXfJ5Z5gqifbVfgcTtJuRW3wnqVrNWaGHSNe6vwu
 /qlQhrsKDE2ETTS6JyW/9sEMCTDRssUOxt1kxBcEZ15CKSC0qoa8U7s6R4VoWeQAD8dx
 Nw9cfv11c53rf96DmWWVDJpxdfKT1f4A54HlxNbpuBXSFYzQNTBI+grDkpxAfBb8Qo2Z
 9mcBZp9GJs3M/kEtshfWSi18zQ81GmPj+V3k1bnbBvMkxquHof8J2QMzvrhjGS6F7BRT
 zV4Rm7FWWVQQzDAHdogXbBxFv/hd4r5CiPRKmUPjeneQabFIE0ulRCQaBnjOAK8dPsAl
 rf3Q==
X-Gm-Message-State: APjAAAU4RI0NFHanTUSLn9mxM43D1i/BDLH+BpqQplL3Ycx0vHtfuVwL
 Gz6OyDxlfdX/qiaFzvug8e7T4TOeXUGch0LfG8E=
X-Google-Smtp-Source: APXvYqwObEQCa1ZB08u+KIwe6UxOxRV+3Ftp7HvmQcRIYWeZ2NvFlAhlY8Y8p5hLyFdaqR1UmyHCzQiAlv16me0PGK8=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr4898566wmm.77.1579794522212; 
 Thu, 23 Jan 2020 07:48:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <17ea032201adfecdb5dedc3a0b9667eccdf7f118.1579628566.git.tamas.lengyel@intel.com>
 <6cb72a36-d9af-5b96-76df-2c6746dfa245@suse.com>
 <CABfawhkzPyFas7kasNjBoCyCMi+kkfC6DrvYv4PCuPtK7A5MNA@mail.gmail.com>
 <ea1ec47f-e321-7235-56f1-0d4b2fb01b46@suse.com>
 <1fdc1a00-70a9-3742-ae4e-2417eaa63fd1@citrix.com>
In-Reply-To: <1fdc1a00-70a9-3742-ae4e-2417eaa63fd1@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 23 Jan 2020 08:48:05 -0700
Message-ID: <CABfawhmK9xP5x5Jy0i727UC_WmoE+EdEJYUMTNPZZCUCVEhyeQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v5 03/18] x86/p2m: Allow
 p2m_get_page_from_gfn to return shared entries
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgODozMiBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMS8yMi8yMCA0OjU1IFBNLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiA+IE9uIDIyLjAxLjIwMjAgMTc6NTEsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToK
PiA+PiBPbiBXZWQsIEphbiAyMiwgMjAyMCBhdCA4OjIzIEFNIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IE9uIDIxLjAxLjIwMjAgMTg6NDksIFRhbWFz
IEsgTGVuZ3llbCB3cm90ZToKPiA+Pj4+IFRoZSBvd25lciBkb21haW4gb2Ygc2hhcmVkIHBhZ2Vz
IGlzIGRvbV9jb3csIHVzZSB0aGF0IGZvciBnZXRfcGFnZQo+ID4+Pj4gb3RoZXJ3aXNlIHRoZSBm
dW5jdGlvbiBmYWlscyB0byByZXR1cm4gdGhlIGNvcnJlY3QgcGFnZS4KPiA+Pj4KPiA+Pj4gSSB0
aGluayB0aGlzIGRlc2NyaXB0aW9uIG5lZWRzIGltcHJvdmVtZW50OiBUaGUgZnVuY3Rpb24gZG9l
cyB0aGUKPiA+Pj4gc3BlY2lhbCBzaGFyZWQgcGFnZSBkYW5jZSBpbiBvbmUgcGxhY2UgKG9uIHRo
ZSAiZmFzdCBwYXRoIikKPiA+Pj4gYWxyZWFkeS4gVGhpcyB3YW50cyBtZW50aW9uaW5nLCBlaXRo
ZXIgYmVjYXVzZSBpdCB3YXMgYSBtaXN0YWtlCj4gPj4+IHRvIGhhdmUgaXQganVzdCB0aGVyZSwg
b3IgYmVjYXVzZSBhIG5ldyBuZWVkIGhhcyBhcHBlYXJlZCB0byBhbHNvCj4gPj4+IGhhdmUgaXQg
b24gdGhlICJzbG93IHBhdGgiLgo+ID4+Cj4gPj4gSXQgd2FzIGEgcHJlLWV4aXN0aW5nIGVycm9y
IG5vdCB0byBnZXQgdGhlIHBhZ2UgZnJvbSBkb21fY293IGZvciBhCj4gPj4gc2hhcmVkIGVudHJ5
IGluIHRoZSBzbG93IHBhdGguIEkgb25seSByYW4gaW50byBpdCBub3cgYmVjYXVzZSB0aGUKPiA+
PiBlcnJvbmVvdXMgdHlwZV9jb3VudCBjaGVjayBtb3ZlIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9u
IG9mIHRoZSBzZXJpZXMKPiA+PiB3YXMgcmVzdWx0aW5nIGluIGFsbCBwYWdlcyBiZWluZyBmdWxs
eSBkZWR1cGxpY2F0ZWQgaW5zdGVhZCBvZiBtb3N0bHkKPiA+PiBiZWluZyBzaGFyZWQuIE5vdyB0
aGF0IHRoZSBwYWdlcyBhcmUgcHJvcGVybHkgc2hhcmVkIHJ1bm5pbmcgTGliVk1JIG9uCj4gPj4g
dGhlIGZvcmsgcmVzdWx0ZWQgaW4gZmFpbHVyZXMgZG8gdG8gdGhpcyBidWcuCj4gPj4KPiA+Pj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ID4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21t
L3AybS5jCj4gPj4+PiBAQCAtNTk0LDcgKzU5NCwxMCBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpwMm1f
Z2V0X3BhZ2VfZnJvbV9nZm4oCj4gPj4+PiAgICAgIGlmICggcDJtX2lzX3JhbSgqdCkgJiYgbWZu
X3ZhbGlkKG1mbikgKQo+ID4+Pj4gICAgICB7Cj4gPj4+PiAgICAgICAgICBwYWdlID0gbWZuX3Rv
X3BhZ2UobWZuKTsKPiA+Pj4+IC0gICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIHAybS0+ZG9t
YWluKSApCj4gPj4+PiArICAgICAgICBpZiAoICFnZXRfcGFnZShwYWdlLCBwMm0tPmRvbWFpbikg
JiYKPiA+Pj4+ICsgICAgICAgICAgICAgLyogUGFnZSBjb3VsZCBiZSBzaGFyZWQgKi8KPiA+Pj4+
ICsgICAgICAgICAgICAgKCFkb21fY293IHx8ICFwMm1faXNfc2hhcmVkKCp0KSB8fAo+ID4+Pj4g
KyAgICAgICAgICAgICAgIWdldF9wYWdlKHBhZ2UsIGRvbV9jb3cpKSApCj4gPj4+Cj4gPj4+IFdo
aWxlIHRoZXJlIG1heSBiZSBhIHJlYXNvbiB3aHkgb24gdGhlIGZhc3QgcGF0aCB0d28gZ2V0X3Bh
Z2UoKQo+ID4+PiBpbnZvY2F0aW9ucyBhcmUgYmUgbmVjZXNzYXJ5LCBjb3VsZG4ndCB5b3UgZ2V0
IGF3YXkgd2l0aCBqdXN0Cj4gPj4+IG9uZQo+ID4+Pgo+ID4+PiAgICAgICAgIGlmICggIWdldF9w
YWdlKHBhZ2UsICFkb21fY293IHx8ICFwMm1faXNfc2hhcmVkKCp0KSA/IHAybS0+ZG9tYWluCj4g
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDogZG9tX2NvdykgKQo+ID4+Pgo+ID4+PiBhdCBsZWFzdCBoZXJlPyBJdCdzIGFsc28g
bm90IHJlYWxseSBjbGVhciB0byBtZSB3aHkgaGVyZSBhbmQKPiA+Pj4gdGhlcmUgd2UgbmVlZCAi
IWRvbV9jb3cgfHwgIXAybV9pc19zaGFyZWQoKnQpIiAtIHdvdWxkbid0Cj4gPj4+IHAybV9pc19z
aGFyZWQoKSByZXR1cm4gY29uc2lzdGVudGx5ICJmYWxzZSIgd2hlbiAhZG9tX2NvdyA/Cj4gPj4K
PiA+PiBJIHNpbXBseSBjb3BpZWQgdGhlIGV4aXN0aW5nIGNvZGUgZnJvbSB0aGUgc2xvd19wYXRo
IGFzLWlzLiBJTUhPIGl0Cj4gPj4gd291bGQgc3VmZmljZSB0byBkbyBhIHNpbmdsZSBnZXRfcGFn
ZShwYWdlLCAhcDJtX2lzX3NoYXJlZCgqdCkgPwo+ID4+IHAybS0+ZG9tYWluIDogZG9tX2Nvdyk7
ICBzaW5jZSB3ZSBjYW4ndCBoYXZlIGFueSBlbnRyaWVzIHRoYXQgYXJlCj4gPj4gc2hhcmVkIHdo
ZW4gZG9tX2NvdyBpcyBOVUxMIHNvIHRoaXMgaXMgc2FmZSwgbm8gbmVlZCBmb3IgdGhlIGV4dHJh
Cj4gPj4gIWRvbV9jb3cgY2hlY2suIElmIHlvdSBwcmVmZXIgSSBjYW4gbWFrZSB0aGUgY2hhbmdl
IGZvciBib3RoCj4gPj4gbG9jYXRpb25zLgo+ID4KPiA+IElmIHRoZSBjaGFuZ2UgaXMgY29ycmVj
dCB0byBtYWtlIGFsc28gaW4gdGhlIG90aGVyIHBsYWNlLCBJJ2QKPiA+IGRlZmluaXRlbHkgcHJl
ZmVyIHlvdSBkb2luZyBzby4KPgo+IEkgYWdyZWUgd2l0aCBldmVyeXRoaW5nIEphbiBzYWlkLiA6
LSkKPgo+IEFsc28sIHNpbmNlIHRoaXMgaXMgYSBnZW5lcmFsIGJ1Z2ZpeCwgeW91IG1pZ2h0IGNv
bnNpZGVyIG1vdmluZyBpdCB0bwo+IHRoZSB0b3Agb2YgeW91ciBzZXJpZXMsIHNvIGl0IGNhbiBi
ZSBjaGVja2VkIGluIGFzIHNvb24gYXMgaXQncyByZWFkeS4KClN1cmUgLSBhbHRob3VnaCBpdCBj
YW4gYmUgY2hlY2tlZCBpbiBiZWZvcmUgcGF0Y2ggMSAmIDIsIGl0J3Mgbm90CmRlcGVuZGVudCBv
biB0aGVtLiBJbiBmYWN0LCBhbGwgdGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgdXAgdG8gYW5k
CmluY2x1ZGluZyBQYXRjaCAxNCBjb3VsZCBiZSBjaGVja2VkIGluIG91dC1vZi1vcmRlci4KClRh
bWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
