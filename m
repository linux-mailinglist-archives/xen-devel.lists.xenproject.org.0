Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD3189F77
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 16:18:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEaOz-0002aw-C2; Wed, 18 Mar 2020 15:14:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xmNs=5D=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jEaOy-0002ar-0P
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 15:14:36 +0000
X-Inumbo-ID: 2cedbb22-692b-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cedbb22-692b-11ea-a6c1-bc764e2007e4;
 Wed, 18 Mar 2020 15:14:35 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id v6so16225380edw.8
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2TQY/Jjq619rdM20Fze0INsD4tuUFZJhlDW/LDcxa8=;
 b=U6lsH/DfvCMhRbpw/WIwwE5+b8qOf8An2rWSaRsO7gDVWF+eynrQshPbADorYZnNPP
 13mXQsB9rj+WrdHbitKAYsBTNBfjWOWtI46vv+iW8Aef+rVy7Nlw/ka2F0K3yQp/2TO2
 H9Jjy1dvF2ZBJFhfoL4PZWfmYPYQci9t7S3CfUGhOUd7zhUZ3CH5aHRp+hU6Ds1eRnNg
 r6psJZmp5+CIxMrOplZnTJl0+l3srYMcJjdLyGuEk5htarW7eAQ3+NRWViOLB2l7tPip
 QYqLTEUpc8YU6LlMgpfDZb1+2BWylhgplDeRNGfqp9mPTwF0IzM7XrG2wZjPJRoGj1e0
 MPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2TQY/Jjq619rdM20Fze0INsD4tuUFZJhlDW/LDcxa8=;
 b=ICf6YjGE5hprNqq2mFL6yxc0NRL+rZBDuoZzPhzNrvayiBaFxCuZpbRH9ojPrkgop0
 i+fgcNGx1OsjMxA8NmQXA8HFoP//P6SjQ6bT5oksuJ2AmOnLsiqVz0nl1rZyinKxZ+zn
 4buBTvcg2H2yEXeobH4/2O8T07xjd/RM6ZI8VDArvsDuhMpKoUOdOhl6F1QxL96GUNqu
 +kwRtZHnBSV69wCKGpvRzuIaJMO4+0tDMuhPKzdp+Yiy+waVK5QulvN7siU/IyaHnkxD
 0ykWlVreKwTACGZbLuBuxImI6umeCgZ0ssGTSxRphD+Tvnv4ajq3EYATDGerkIdQByUX
 qHwQ==
X-Gm-Message-State: ANhLgQ23zlLbHKUrWgUu93478PAlnO3nsMk1arD8EcH8uLCmy3QMcYNq
 3VXuuthG6SbBYxEUWR8DbzJh7Ltq7GQ=
X-Google-Smtp-Source: ADFU+vszRMX01cke2qmeAY0fH4Tdmp7Tn/YlmiC1xLmWjXgzd3d7ezH2tIGC4jyqzS6jf95eI1hV7w==
X-Received: by 2002:a17:906:b80f:: with SMTP id
 dv15mr4731073ejb.28.1584544473938; 
 Wed, 18 Mar 2020 08:14:33 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43])
 by smtp.gmail.com with ESMTPSA id 91sm437013edq.78.2020.03.18.08.14.32
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 08:14:32 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id z13so3860479wml.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 08:14:32 -0700 (PDT)
X-Received: by 2002:a05:600c:410c:: with SMTP id
 j12mr5773000wmi.77.1584544471984; 
 Wed, 18 Mar 2020 08:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1582914997.git.tamas.lengyel@intel.com>
 <b76a2a71bdbb26e57088dab8f7c3966432aed729.1582914998.git.tamas.lengyel@intel.com>
 <6b7ffead-d2b9-13de-2b24-e3707f045118@suse.com>
 <CABfawhmf6KbHkrZHxt879R8Vw9RyGMAi9OO77PLknfNwQyK2MQ@mail.gmail.com>
 <9b2924a5-4193-f8fd-4f64-2a9eeafcbb99@suse.com>
In-Reply-To: <9b2924a5-4193-f8fd-4f64-2a9eeafcbb99@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 18 Mar 2020 09:13:55 -0600
X-Gmail-Original-Message-ID: <CABfawh=AOsQOX=3if9+q32_yhLJ8K=FBgT+t0Sas3AOKOF9e5g@mail.gmail.com>
Message-ID: <CABfawh=AOsQOX=3if9+q32_yhLJ8K=FBgT+t0Sas3AOKOF9e5g@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v11 2/3] x86/mem_sharing: reset a fork
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

T24gV2VkLCBNYXIgMTgsIDIwMjAgYXQgODoxMyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMDMuMjAyMCAxNTowMCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gV2VkLCBNYXIgMTgsIDIwMjAgYXQgNTozNiBBTSBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+IE9uIDI4LjAyLjIwMjAgMTk6NDAsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+Pj4gKyAgICAgICAgbWZuID0gcGFnZV90b19tZm4ocGFnZSk7Cj4g
Pj4+ICsgICAgICAgIGlmICggbWZuX3ZhbGlkKG1mbikgKQo+ID4+Cj4gPj4gQWxsIHBhZ2VzIG9u
IGEgZG9tYWluJ3MgbGlzdCBzaG91bGQgaGF2ZSBhIHZhbGlkIE1GTiAtIHdoYXQgYXJlIHlvdQo+
ID4+IHRyeWluZyB0byBwcm90ZWN0IGFnYWluc3QgaGVyZT8KPiA+Cj4gPiBJIHNhdyBubyBkb2N1
bWVudGF0aW9uIHN0YXRpbmcgd2hhdCB5b3Ugc3RhdGVkIGFib3ZlLiBJZiB0aGF0J3MgdGhlCj4g
PiBjYXNlIGl0IGNhbiBiZSBkcm9wcGVkLgo+Cj4gT25seSBwYWdlcyBjb21pbmcgZnJvbSB0aGUg
YWxsb2NhdG9yIChvciwgaW4gc29tZSBzcGVjaWFsIGNhc2VzLAo+IG90aGVyd2lzZSB2YWxpZCkg
Z2V0IHB1dCBvbiBhIGRvbWFpbidzIHBhZ2UgbGlzdC4gQnkgY29taW5nIGZyb20KPiB0aGUgYWxs
b2NhdG9yIHRoZWlyIE1GTnMgYXJlIGltcGljaXRseSB2YWxpZC4KPgo+ID4+PiArICAgICAgICAg
ICAgbWZuID0gX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuX3goZ2ZuKSwgJnAybXQsICZw
Mm1hLAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIE5V
TEwsIGZhbHNlKTsKPiA+Pj4gKwo+ID4+PiArICAgICAgICAgICAgaWYgKCBwMm1faXNfcmFtKHAy
bXQpICYmICFwMm1faXNfc2hhcmVkKHAybXQpICkKPiA+Pj4gKyAgICAgICAgICAgIHsKPiA+Pj4g
KyAgICAgICAgICAgICAgICAvKiB0YWtlIGFuIGV4dHJhIHJlZmVyZW5jZSwgbXVzdCB3b3JrIGZv
ciBhIHNoYXJlZCBwYWdlICovCj4gPj4KPiA+PiBUaGUgY29tbWVudCAoYW5kIGFsc28gdGhlIG5l
eHQgb25lIGZ1cnRoZXIgZG93bikgbG9va3MgY29udHJhZGljdG9yeQo+ID4+IHRvIHRoZSBpZigp
IGltbWVkaWF0ZWx5IGFoZWFkLCBhdCBsZWFzdCB0byBtZS4gQ291bGQgeW91IGNsYXJpZnkgdGhl
Cj4gPj4gc2l0dWF0aW9uLCBwbGVhc2U/Cj4gPgo+ID4gSSBkb24ndCB1bmRlcnN0YW5kIHlvdXIg
cXVlc3Rpb24uICBUaGUgY29tbWVudCBleHBsYWlucyBleGFjdGx5IHdoYXQKPiA+IGhhcHBlbnMu
IFRha2luZyBhbiBleHRyYSByZWZlcmVuY2UgbXVzdCB3b3JrLiBJZiBpdCBkaWRuJ3QsIHRyaWdn
ZXIgYW4KPiA+IEFTU0VSVF9VTlJFQUNIQUJMRS4gV2hpY2ggcGFydCBpcyBjb25mdXNpbmc/Cj4K
PiBUaGUgY29tbWVudCBzYXlzICJhIHNoYXJlZCBwYWdlIiB3aGVyZWFzIHRoZSBjb25kaXRpb24g
aW5jbHVkZXMKPiAiIXAybV9pc19zaGFyZWQocDJtdCkiLCB3aGljaCBJIHVuZGVyc3RhbmQgdG8g
bWVhbiBhIHBhZ2Ugd2hpY2ggaXMKPiBub3Qgc2hhcmVkLgo+Cj4gQXMgdG8geW91IGRyb3BwaW5n
IGNvbnRpbnVhdGlvbnMgYWdhaW4gLSBwbGVhc2UgaGF2ZSBhdCBsZWFzdCBhCj4gYm9sZCBjb21t
ZW50IGNsYXJpZnlpbmcgdGhhdCB0aGVpciBhZGRpdGlvbiBpcyBhIHJlcXVpcmVtZW50IGZvcgo+
IHRoZSBjb2RlIHRvIGV2ZXIgcmVhY2ggInN1cHBvcnRlZCIgc3RhdHVzLiAoQW55IG90aGVyIG9i
dmlvdXMgYnV0Cj4gaW50ZW50aW9uYWwgb21pc3Npb25zIGNvdWxkIGFsc28gYmUgbmFtZWQgdGhl
cmUuKQo+CgpTdXJlLCBJIGhhZCB0aGF0IGNvbW1lbnQgaW4gcGxhY2UgYmVmb3JlLiBUaGVyZSBh
cmUgbm8gcGxhbnMgdG8gaGF2ZQp0aGlzIGNvZGUgYmUgInN1cHBvcnRlZCIsIHdlIGFyZSBmaW5l
IHdpdGggaXQgYmVpbmcgZXhwZXJpbWVudGFsLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
