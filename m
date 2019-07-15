Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72903699C5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 19:30:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn4ly-0002kr-C1; Mon, 15 Jul 2019 17:28:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=W2eT=VM=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1hn4lx-0002kd-93
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 17:28:21 +0000
X-Inumbo-ID: f0281eed-a725-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f0281eed-a725-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 17:28:19 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13B9720838
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2019 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563211699;
 bh=9E0ZytSBTx4ARSQXikFxFqt26WTjZZg9YEuzJOE71XY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CvQyWlBHJkYMir6qOJgjnjkTNYuDngouMYZ2nM0oVQkb9xzSIvJe/qiRYXQDXjMPB
 7lVAOCBykBf4qxlzEEPF2ZuEcjSLtiH9TBJOFmQnrCvchgMrQ5KDFopNebDD+yulBB
 qN0sJe/fvbW15UKisT/n89ScJ8kZ0+b1BwOd14yg=
Received: by mail-wr1-f48.google.com with SMTP id n9so18048489wru.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2019 10:28:19 -0700 (PDT)
X-Gm-Message-State: APjAAAXcjNsj2uSaba907YUJQU9dhsXLicY3IwTZCOTIS5yD701UPrsL
 6qbsSHBl7gWliFDYtx+sGxqQv2xhYCHwZPqgvgvl2A==
X-Google-Smtp-Source: APXvYqz1bcfnUp0J1AeVS+zB00SN2CvvFrutc7PmnWTPZk+ekXhDQO1E9JPmdpKMMm6yj0t8VwFOW7L195SLye6jbF0=
X-Received: by 2002:adf:cf02:: with SMTP id o2mr11075557wrj.352.1563211697557; 
 Mon, 15 Jul 2019 10:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190715113739.17694-1-jgross@suse.com>
 <87y30zfe9z.fsf@linux.intel.com>
In-Reply-To: <87y30zfe9z.fsf@linux.intel.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 15 Jul 2019 10:28:06 -0700
X-Gmail-Original-Message-ID: <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
Message-ID: <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
To: Andi Kleen <ak@linux.intel.com>
Subject: Re: [Xen-devel] [PATCH 0/2] Remove 32-bit Xen PV guest support
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
 Stefano Stabellini <sstabellini@kernel.org>, X86 ML <x86@kernel.org>,
 Alok Kataria <akataria@vmware.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgOTozNCBBTSBBbmRpIEtsZWVuIDxha0BsaW51eC5pbnRl
bC5jb20+IHdyb3RlOgo+Cj4gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cml0ZXM6
Cj4KPiA+IFRoZSBsb25nIHRlcm0gcGxhbiBoYXMgYmVlbiB0byByZXBsYWNlIFhlbiBQViBndWVz
dHMgYnkgUFZILiBUaGUgZmlyc3QKPiA+IHZpY3RpbSBvZiB0aGF0IHBsYW4gYXJlIG5vdyAzMi1i
aXQgUFYgZ3Vlc3RzLCBhcyB0aG9zZSBhcmUgdXNlZCBvbmx5Cj4gPiByYXRoZXIgc2VsZG9tIHRo
ZXNlIGRheXMuIFhlbiBvbiB4ODYgcmVxdWlyZXMgNjQtYml0IHN1cHBvcnQgYW5kIHdpdGgKPiA+
IEdydWIyIG5vdyBzdXBwb3J0aW5nIFBWSCBvZmZpY2lhbGx5IHNpbmNlIHZlcnNpb24gMi4wNCB0
aGVyZSBpcyBubwo+ID4gbmVlZCB0byBrZWVwIDMyLWJpdCBQViBndWVzdCBzdXBwb3J0IGFsaXZl
IGluIHRoZSBMaW51eCBrZXJuZWwuCj4gPiBBZGRpdGlvbmFsbHkgTWVsdGRvd24gbWl0aWdhdGlv
biBpcyBub3QgYXZhaWxhYmxlIGluIHRoZSBrZXJuZWwgcnVubmluZwo+ID4gYXMgMzItYml0IFBW
IGd1ZXN0LCBzbyBkcm9wcGluZyB0aGlzIG1vZGUgbWFrZXMgc2Vuc2UgZnJvbSBzZWN1cml0eQo+
ID4gcG9pbnQgb2YgdmlldywgdG9vLgo+Cj4gTm9ybWFsbHkgd2UgaGF2ZSBhIGRlcHJlY2F0aW9u
IHBlcmlvZCBmb3IgZmVhdHVyZSByZW1vdmFscyBsaWtlIHRoaXMuCj4gWW91IHdvdWxkIG1ha2Ug
dGhlIGtlcm5lbCBwcmludCBhIHdhcm5pbmcgZm9yIHNvbWUgcmVsZWFzZXMsIGFuZCB3aGVuCj4g
bm8gdXNlciBjb21wbGFpbnMgeW91IGNhbiB0aGVuIHJlbW92ZS4gSWYgYSB1c2VyIGNvbXBsYWlu
cyB5b3UgY2FuJ3QuCj4KCkFzIEkgdW5kZXJzdGFuZCBpdCwgdGhlIGtlcm5lbCBydWxlcyBkbyBh
bGxvdyBjaGFuZ2VzIGxpa2UgdGhpcyBldmVuCmlmIHRoZXJlJ3MgYSBjb21wbGFpbnQ6IHRoaXMg
aXMgYSBwYXRjaCB0aGF0IHJlbW92ZXMgd2hhdCBpcwplZmZlY3RpdmVseSBoYXJkd2FyZSBzdXBw
b3J0LiAgSWYgdGhlIG1haW50ZW5hbmNlIGNvc3QgZXhjZWVkcyB0aGUKdmFsdWUsIHRoZW4gcmVt
b3ZhbCBpcyBmYWlyIGdhbWUuICAoT2J2aW91c2x5IHdlIHdlaWdodCB0aGUgdmFsdWUgdG8KcHJl
c2VydmluZyBjb21wYXRpYmlsaXR5IHF1aXRlIGhpZ2hseSwgYnV0IGluIHRoaXMgY2FzZSwgWGVu
IGRyb3BwZWQKMzItYml0IGhhcmR3YXJlIHN1cHBvcnQgYSBsb25nIHRpbWUgYWdvLiAgSWYgdGhl
IFhlbiBoeXBlcnZpc29yIHNheXMKdGhhdCAzMi1iaXQgUFYgZ3Vlc3Qgc3VwcG9ydCBpcyBkZXBy
ZWNhdGVkLCBpdCdzIGRlcHJlY2F0ZWQuKQoKVGhhdCBiZWluZyBzYWlkLCBhIHdhcm5pbmcgbWln
aHQgbm90IGJlIGEgYmFkIGlkZWEuICBXaGF0J3MgdGhlCmN1cnJlbnQgc3RhdHVzIG9mIHRoaXMg
aW4gdXBzdHJlYW0gWGVuPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
