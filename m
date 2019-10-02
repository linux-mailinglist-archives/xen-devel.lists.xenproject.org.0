Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01EC4AB0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 11:34:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFazm-0007rW-A1; Wed, 02 Oct 2019 09:32:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4c3l=X3=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iFazl-0007rR-GP
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 09:32:29 +0000
X-Inumbo-ID: 8ce0ac0a-e4f7-11e9-b588-bc764e2007e4
Received: from mail-pg1-x533.google.com (unknown [2607:f8b0:4864:20::533])
 by localhost (Halon) with ESMTPS
 id 8ce0ac0a-e4f7-11e9-b588-bc764e2007e4;
 Wed, 02 Oct 2019 09:32:28 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id s1so11546521pgv.8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2019 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UgZk8OY8sbgzMeiKRxpfdsrJe825v/jVkOBPlS8wfS8=;
 b=oiTI3OOm9xZiJ/8Mg4iu3Nei9vSXTcKsQvOwVrTLHjLj3TdhCF4xj8pH7FiLEYClZR
 7vRij2aMPjMPxfxXEzB1HZp66YUmDP7O39OfpAMNbvDYQDX2mHtD6dTzoFRz2MLVihkI
 ljeXcG/MUwU7k5UizsMmjAStBzS0Q2IWkBzIWJeenoS9HKef6cw0XYmHV3Z2Hb34Ntsr
 ueCbsxc1GvyBWnVToHZ+yM06SisyILNn6ur1FouaxKEXTjzqVAx60ExBZj1jL6kzmBBj
 ys9x66oIpyr1GNK9qcji/NDWr9PJlAU6KKfpuOtVBzAftN8FU6SZC90/SzeUL8ULoHgT
 ASCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UgZk8OY8sbgzMeiKRxpfdsrJe825v/jVkOBPlS8wfS8=;
 b=F5NUBH42xyh6VtB9ojnZAn+EjrIbzmNM573b8M7HN9I3HcyrldOD+7tSVBY6Ezygse
 hTsR/Y6uUegi/YXJRsFtUTcriQlIXovZyo/weX7tS0DcZdVHISKX85JcHlhzKRBVRqr9
 mgAKs13cF2JvmxLg5zRELH1IYLu9dVS2d5SlqklAurSLt3lnwW0/iWvceuGCvC+yl7HD
 1GEDDcEQh38WMXeeTgAtz4hCkp1FbvVrDJsVhGlY5sRLphr/syvvWhuoyPm9jesJVe4p
 TJk1BJC4LK2qQ2WFLZiIhnY+J3uU/UVGaGmY/Het07430SSyBNIJmjBo1paUGJc1wgLk
 aCBQ==
X-Gm-Message-State: APjAAAWnN3rYs1Y9MijrQPQgLVdW9wRSZANvPZWiymgsgo9m2daIPr2v
 EyAfCBefl9J/EqIMOOCsnbH96YuBPBNKd+jxkck=
X-Google-Smtp-Source: APXvYqxyR81AUXXfJXwynzBWnoXj2jVyw/ezdAa8ik6tKnI3oW1bcejelRYB5aD5zukysJ9nKpyvEhuO9SkTGDVBN6M=
X-Received: by 2002:a63:1e04:: with SMTP id e4mr2685087pge.396.1570008747829; 
 Wed, 02 Oct 2019 02:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191001151159.861-1-paul.durrant@citrix.com>
 <2857a023-87ed-8220-7b22-51f1048f9de6@suse.com>
 <9ee3496a-66c6-f031-ca51-9dbe19bc5ead@citrix.com>
In-Reply-To: <9ee3496a-66c6-f031-ca51-9dbe19bc5ead@citrix.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Wed, 2 Oct 2019 10:32:15 +0100
Message-ID: <CACCGGhAQTidiafGLeuJj+HsWXx1quWsYZRWVZcFYjPxuCO9OJw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyIE9jdCAyMDE5IGF0IDEwOjEyLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDAyLzEwLzIwMTkgMDk6NDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+ID4gT24gMDEuMTAuMjAxOSAxNzoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4+
IE5vdyB0aGF0IHhsLmNmZyBoYXMgYW4gb3B0aW9uIHRvIGV4cGxpY2l0bHkgZW5hYmxlIElPTU1V
IG1hcHBpbmdzIGZvciBhCj4gPj4gZG9tYWluLCBtaWdyYXRpb24gbWF5IGJlIG5lZWRsZXNzbHkg
dmV0b2VkIGR1ZSB0byB0aGUgY2hlY2sgb2YKPiA+PiBpc19pb21tdV9lbmFibGVkKCkgaW4gcGFn
aW5nX2xvZ19kaXJ0eV9lbmFibGUoKS4KPiA+PiBUaGVyZSBpcyBhY3R1YWxseSBubyBuZWVkIHRv
IHByZXZlbnQgbG9nZGlydHkgZnJvbSBiZWluZyBlbmFibGVkIHVubGVzcwo+ID4+IGRldmljZXMg
YXJlIGFzc2lnbmVkIHRvIGEgZG9tYWluIGFuZCB0aGF0IGRvbWFpbiBpcyBzaGFyaW5nIEhBUCBt
YXBwaW5ncwo+ID4+IHdpdGggdGhlIElPTU1VIChpbiB3aGljaCBjYXNlIGRpc2FibGluZyB3cml0
ZSBwZXJtaXNzaW9ucyBpbiB0aGUgUDJNIG1heQo+ID4+IGNhdXNlIERNQSBmYXVsdHMpLiBJdCBp
cyBxdWl0ZSBwb3NzaWJsZSB0aGF0IHNvbWUgYXNzaWduZWQgZGV2aWNlcyBtYXkKPiA+PiBwcm92
aWRlIGluZm9ybWF0aW9uIGFib3V0IHdoaWNoIHBhZ2VzIG1heSBoYXZlIGJlZW4gZGlydGllZCBi
eSBETUEgdmlhCj4gPj4gYW4gQVBJIGV4cG9ydGVkIGJ5IHRoZWlyIG1hbmFnaW5nIGVtdWxhdG9y
LiBUaHVzIFhlbidzIGxvZ2RpcnR5IG1hcCBpcyBvbmx5Cj4gPj4gb25lIHNvdXJjZSBvZiBpbmZv
cm1hdGlvbiB0aGF0IG1heSBiZSBhdmFpbGFibGUgdG8gdGhlIHRvb2xzdGFjayB3aGVuCj4gPj4g
cGVyZm9ybWluZyBhIG1pZ3JhdGlvbiBhbmQgaGVuY2UgaXQgaXMgdGhlIHRvb2xzdGFjayB0aGF0
IGlzIGJlc3QgcGxhY2VkCj4gPj4gdG8gZGVjaWRlIHVuZGVyIHdoYXQgY2lyY3Vtc3RhbmNlcyBp
dCBjYW4gYmUgcGVyZm9ybWVkLCBub3QgdGhlIGh5cGVydmlzb3IuCj4gPiBXaGlsZSBJJ20gaGFw
cHkgYWJvdXQgdGhlIGV4dGVuZGVkIGRlc2NyaXB0aW9uLCBpdCdzIHN0aWxsIHdyaXR0ZW4gaW4K
PiA+IGEgd2F5IHN1Z2dlc3RpbmcgdGhhdCB0aGlzIGlzIHRoZSBvbmx5IHBvc3NpYmxlIHdheSBv
ZiB2aWV3aW5nIHRoaW5ncy4KPiA+IEFzIGV4cHJlc3NlZCBieSBHZW9yZ2UgYW5kIG1lLCBwdXR0
aW5nIHRoZSBoeXBlcnZpc29yIGluIGEgcG9zaXRpb24gdG8KPiA+IGJlIGFibGUgdG8ganVkZ2Ug
aXMgYXQgbGVhc3QgYW4gYWx0ZXJuYXRpdmUgd29ydGggY29uc2lkZXJpbmcuCj4KPiBObywgZm9y
IGV4YWN0bHkgdGhlIHNhbWUgcmVhc29uIGFzIEknbSBwdXJnaW5nIHRoZSBkaXNhYmxlX21pZ3Jh
dGUgZmxhZy4KPgo+IFRoaXMgaXMgdG90YWxseSBiYWNrd2FyZHMgdGhpbmtpbmcsIGJlY2F1c2Ug
dGhlIGNoZWNrIGlzIGluIHRoZSB3cm9uZyBwbGFjZS4KPgo+IFRoZXJlIHJlYWxseSBhcmUgY2Fz
ZXMgd2hlcmUgdGhlIHRvb2xzdGFjaywgKmFuZCBvbmx5KiB0aGUgdG9vbHN0YWNrIGlzCj4gaW4g
YSBwb3NpdGlvbiB0byBkZXRlcm1pbmUgbWlncmF0aW9uIHNhZmV0eS4gIFdoZW4gaXQgY29tZXMg
dG8KPiBkaXNhYmxlX21pZ3JhdGUsIHRoZSBhcmVhIHVuZGVyIGFyZ3VtZW50IGlzIHRoZSBJVFND
IGZsYWcsIHdoaWNoICppcyoKPiBzYWZlIHRvIG9mZmVyIG9uIG1pZ3JhdGUgZm9yIHZpcmlkaWFu
IGd1ZXN0cyB3aGljaCBhcmUga25vd24gdG8gdXNlCj4gcmVmZXJlbmNlX3RzYywgb3IgaWYgdGhl
IGRlc3RpbmF0aW9uIGhhcmR3YXJlIHN1cHBvcnRzIHRzYyBzY2FsaW5nLgo+IChIaWxhcmlvdXNs
eSwgbm90aGluZywgbm90IGV2ZW4gdGhlIHRvb2xzdGFjaywgcHJvaGliaXRzIG1pZ3JhdGlvbiBi
YXNlZAo+IG9uIFhlbidzIG5vLW1pZ3JhdGUgZmxhZywgYmVjYXVzZSBpdHMgYSB3cml0ZS1vbmx5
IGZpZWxkIHdoaWNoIGNhbid0IGJlCj4gcmV0cmlldmVkIGJ5IHRoZSB0b29scy4pCj4KPiBUaGUg
dHdvIG9wdGlvbnMgYXJlOgo+Cj4gMSkgTmV3IGh5cGVyY2FsbCwKPiBET01DVExfdGhlX3Rvb2xz
dGFja19rbm93c193dGZfaXRzX2RvaW5nX3NvX2xldF90aGVfZG9pbWFpbl9taWdyYXRlLAo+IHdo
aWNoIGRpc2FibGVzIHRoZSB2ZXRvcywKPgo+IG9yCj4KPiAyKSBEZWxldGUgdGhlIGVycm9uZW91
cyB2ZXRvcywgYW5kIHRydXN0IHRoYXQgdGhlIHRvb2xzdGFjayBrbm93cyB3aGF0Cj4gaXQgaXMg
ZG9pbmcsIGFuZCB3aWxsIG9ubHkgaW5pdGlhdGUgYSBtaWdyYXRlIGluIHNhZmUgc2l0dWF0aW9u
cy4KPgo+IE9wdGlvbiAyIGhhcyB0aGUgc2FmZXR5IGNoZWNrcyBwZXJmb21lZCBhdCB0aGUgbGV2
ZWwgd2hpY2ggaXMgYWN0dWFsbHkKPiBjYXBhYmxlIG9mIGNhbGN1bGF0aW5nIHRoZSByZXN1bHRz
IGNvcnJlY3RseS4KClRoYXQgZG9lcyByZW1pbmQgbWUgdGhhdCBJIG11c3QgY2hlY2sgdGhhdCB4
bCB3aWxsIG5vdCBpbml0aWF0ZSBhCm1pZ3JhdGUgd2l0aCBhcmJpdHJhcnkgaC93IHBhc3NlZCB0
aHJvdWdoLiBJIGtub3cgWEFQSSBkb2VzCmFwcHJvcHJpYXRlIGNoZWNraW5nLgoKICBQYXVsCgoK
Pgo+IE9uZSBvZiB0aGVzZSBvcHRpb25zIGlzIHN1YnN0YW50aWFsbHkgbGVzcyBib25lLWhlYWRl
ZCB0aGFuIHRoZSBvdGhlci4KPgo+IH5BbmRyZXcKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
