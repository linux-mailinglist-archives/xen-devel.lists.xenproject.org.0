Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A0230CF
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 11:57:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSezl-0005ki-GK; Mon, 20 May 2019 09:54:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z/e/=TU=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hSezk-0005kd-Bm
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:54:12 +0000
X-Inumbo-ID: 3788b881-7ae5-11e9-8980-bc764e045a96
Received: from mail-io1-xd2d.google.com (unknown [2607:f8b0:4864:20::d2d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3788b881-7ae5-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 09:54:11 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id s20so10522390ioj.7
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ywgRHDvSJJ/4ptEhs8Va4mEPYpeTH0kNIfwRt9tJbk=;
 b=FR/ZsP3BRpri4m8UiSIzG+bZYNZNYM5hIBQ56LnAG2QflxY30vrq3ze92OOhIm3j7Y
 M4JL+8mFFHyasmZ04XhYCuyH6PnnlUT5G/3i4zBou8KphvJyg84jVeMF9naFYCypGNgF
 KutNZT34Tq537BufuoGVZaC+vLmtgSJMi5s7k0Uol6xey1XM+j86ICzwxjS8YckH71X6
 twCv8jZAt3nWXvhvqZ42Sqcj8Z0B/wdwBXkzWGWMBlTdf9PHKw9OYAlF9KXNZQ+NwwjA
 jc5t1ELeUMwfSpPSA+UwuF57r/jfOJoF/+m3iYknZvmKqGWi5FEsxdv+gLryvvla7954
 78XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ywgRHDvSJJ/4ptEhs8Va4mEPYpeTH0kNIfwRt9tJbk=;
 b=Spdz9kQaMYS5WWCJm/Y39T1k4eC7nDS6dPDDqIR5ujqa+FUmGZtkZxzFnHqsEzQsyf
 Lb0x6RV7XNPyOc/+SZdsxbzeF/UxNEJTJQ4EJdZBLJKaJkjSZ3GcNfZDSkfkCvYO+Jy5
 yPdCAj0Ni5AXWk75CzJYdfmTQ0RcOfklr6cYNzSwF6cpXfT4G+cIz1YX98mr1RWSHQ3N
 1iLHQt2gve80G2w0mMSEMe2sxMATtT8AODVDkFXGBe26cPfuynSvO7fF2rJDaxeTkYUS
 Lv30PID1aqbpsFc1F79O60gy71D7ladPWi/qaWTxE3deY6OteUJs1z0FrkHWCUQD3nmu
 Mb7g==
X-Gm-Message-State: APjAAAURgc/28Gvr9DQdIgXsGk6J3apsM6dXYemWZ06qaGNoBjA9YpXC
 PWv52u3n7guAZCkuOf05JcMlnGU+eRxM8KFsmiQ=
X-Google-Smtp-Source: APXvYqxwlctlSmZiv8AdXsHL81DpJp/cO4cP6LS8U0JfCDmjcfLwu+isl06c/jXKbKpVavZg8fLpPv7jxNsMhB7x03o=
X-Received: by 2002:a6b:6c07:: with SMTP id a7mr3149703ioh.256.1558346050591; 
 Mon, 20 May 2019 02:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
 <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
 <e42cffb5-4cbd-ddb5-ffdb-e76399aa09e4@citrix.com>
 <CAOcoXZb6V2TzQuKsZV7s3DoviYij7KCUE8TpNtvVEOoJx=gJDw@mail.gmail.com>
 <4a0bb401-4c22-61ff-2ccd-69c5881e73a6@citrix.com>
In-Reply-To: <4a0bb401-4c22-61ff-2ccd-69c5881e73a6@citrix.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Mon, 20 May 2019 12:53:59 +0300
Message-ID: <CAOcoXZZbmCic3aPu3f+OgXWx8mktKqUJBK-76nwzgvmrg=W6SA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+Pj4+PiBGb3IgdGhpcyByZWFzb24gaXQgaXMgYmV0dGVyIHRvIGF2b2lkIGltcGxlbWVudGF0
aW9uLWRlZmluZWQgY29kZS4KPiA+Pj4+IFdlbGwsIGlkZWFsbHkgd2UnZCBsaWtlIHRvIGdldCBh
d2F5IHdpdGhvdXQgdXNpbmcgaW1wbGVtZW50YXRpb24KPiA+Pj4+IGRlZmluZWQgYmVoYXZpb3Iu
IEJ1dCBJJ20gYWZyYWlkIHdlJ3JlIHF1aXRlIGZhciBmcm9tIHRoYXQsIGFuZAo+ID4+Pj4gd2Un
ZCBub3QgYWx3YXlzIGJlIHdpbGxpbmcgdG8gYWNjZXB0IHRoZSB3b3JzZSBzb3VyY2UgYW5kL29y
Cj4gPj4+PiBiaW5hcnkgY29kZSB0aGF0IHdvdWxkIGJlIG5lZWRlZCB0byBhdm9pZCBpdC4KPiA+
Pj4gSG93IGFib3V0IHVzaW5nIHRoZSBuZXh0IG9uZS1saW5lciB0byBhdm9pZCBpbXBsZW1lbnRh
dGlvbi1kZWZpbmVkIGNvZGUgOgo+ID4+Pgo+ID4+PiAvL1JldHVybnMgdHJ1ZSBpbiBjYXNlIHdo
ZW4gdGhlIHRvcCBsZWZ0IDE3IGJpdHMgYXJlIGFsbCB6ZXJvIG9yIGFyZSBhbGwgb25lCj4gPj4+
IHJldHVybiAoKCEodmFkZHIgPj4gNDcpKSB8fCAoKCh2YWRkciA+PiA0NykmMHgxRkZGRikgPT0g
MHgxRkZGRikpCj4gPj4gSGF2ZSB5b3UgdHJpZWQgY29tcGlsaW5nIHRoZXNlIHR3byBleGFtcGxl
cyBhbmQgc2VlaW5nIGhvdyB0aGV5IGRpZmZlcj8KPiA+Pgo+ID4gWWVzLCBJJ3ZlIHRyaWVkIGl0
IHdpdGggdGhlIG5leHQgZHJhZnQgdGVzdCBjb2RlLgo+ID4gVGhlIHJlc3VsdCBsb29rcyBvaywg
aG93ZXZlciBpdCB0YWtlcyB0aW1lIHRvIGNoZWNrIGFsbCA2NGJpdHMgdmFsdWVzCj4gPiBvbmUg
Ynkgb25lLi4uCj4gPiBEbyB5b3Ugc2VlIGFueSBpc3N1ZXMgd2l0aCBuZXcgb25lLWxpbmVyPwo+
Cj4gSmFuIGFscmVhZHkgaWRlbnRpZmllZCB0aGUgaXNzdWUgaW4gdGhlIG90aGVyIHRocmVhZCwg
YW5kIG15IHN1Z2dlc3Rpb24KPiBoZXJlIHdhcyB0byBpbnNwZWN0IHRoZSBnZW5lcmF0ZWQgYXNz
ZW1ibHksIHdoaWNoIHlvdSdsbCBvYnNlcnZlIGlzCj4gc3Vic3RhbnRpYWxseSBtb3JlIGNvbXBs
aWNhdGVkLgo+Cj4gSG93ZXZlciwgdGhpcyB0aHJlYWQgaXNuJ3QgYmVpbmcgcHJvZHVjdGl2ZS4g
IFlvdSdyZSBjbGVhcmx5IHdhbnRpbmcgdG8KPiBjaGFuZ2UgdGhpcyBleHByZXNzaW9uLCBhbmQg
dGhlIG1haW50YWluZXJzIHNlZSBubyByZWFzb24gdG8uCgpXaGF0IGl0IHRoZSByZWFzb24gdG8g
b3B0aW1pemUgcGVyZm9ybWFuY2UgKGlmIGFueSkKaW4gYSBjb3N0IG9mICdpbXBsZW1lbnRhdGlv
bi1kZWZpbmVkIGNvZGUnIHVzYWdlPwpJdCBzZWVtcyAnY29ycmVjdG5lc3MnIChpbmNsdWRpbmcg
bm90IHVzaW5nIGltcGxlbWVudGF0aW9uLWRlZmluZWQgY29kZSkKb2YgdGhlIGNvZGUgaXMgaGln
aGVyIHByaW9yaXR5IHRoYW4gY29kZSBwZXJmb3JtYW5jZS4gTm8/CklzIHRoaXMgZnVuY3Rpb24g
aGFkIGJlZW4gbm90aWNlZCB0byBiZSBwZXJmb3JtYW5jZSBib3R0bGVuZWNrPwoKPiBTbywgd2hh
dCBwcm9ibGVtIGFyZSB5b3UgYWN0dWFsbHkgdHJ5aW5nIHRvIHNvbHZlPwoKV2VsbCwgaXQgbG9v
a3MgbGlrZSB0aGlzIGNvZGUgbWF5IG5vdCB3b3JrIGluIGNhc2Ugb2YgYW5vdGhlciBjb21waWxl
ciB1c2FnZS4KSG93ZXZlciwgaWYgbWFpbnRhaW5lcnMgc2VlIG5vIHJlYXNvbiB0byBjaGFuZ2Ug
aXQsIGl0IGlzIG9rLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
