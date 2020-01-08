Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F09134A73
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 19:27:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipG0D-0001SM-Ak; Wed, 08 Jan 2020 18:24:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cnPU=25=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipG0B-0001SG-Se
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 18:24:19 +0000
X-Inumbo-ID: 1040b54c-3244-11ea-a38f-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1040b54c-3244-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 18:24:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578507850; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=yU+6aCdApP+SwkttvsUBClLLJQ3hILGr6E1iV5zXgAQ=;
 b=NuZC+FwXElDEf+wU6yJNMLdz/hxf8wywnQsEUpfrgD47SRNWqhEkkUGjWMLnWqDTVn5t5Jk5
 DzOz+Yi5L+FLdbHngtzJ07gCHLnkNx+C88eqPWe/2iQE3GOjwku+LiG8GJ6XUCFXglQRJ25m
 +19UQKX0UvOI/SobrrMAESSTr1M=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mxa.mailgun.org with ESMTP id 5e161e47.7f3158cf0e70-smtp-out-n03;
 Wed, 08 Jan 2020 18:24:07 -0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id d139so250533wmd.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 10:24:06 -0800 (PST)
X-Gm-Message-State: APjAAAViu6JxOK6gYWgjHP4jUBz6nIeSyUaiKHiGYFl7PE7Hz4cC+ATw
 m8YCqSGrw2vwy+8EDG+boh0qH6Be72neFJSJS8k=
X-Google-Smtp-Source: APXvYqy/X8v8SSRajCFsz21hyxcd7NpfoL/IGjEByhzCZqj5j1gTgsWsI1GxXADRD37IK54KVinNr63hbZUFNYOUTSE=
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr5294533wmc.168.1578507846005; 
 Wed, 08 Jan 2020 10:24:06 -0800 (PST)
MIME-Version: 1.0
References: <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
 <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
 <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
 <20200108150841.GR11756@Air-de-Roger>
 <CABfawhnWYn_MwaQzdAQ4QezA0vgQ7ByK44eUEerGRP7AU9si+A@mail.gmail.com>
 <20200108180042.GT11756@Air-de-Roger>
 <CABfawhm==Gpca8+E=PihvW3x7Y79kAKD48rk5PHHbbhdATh4-w@mail.gmail.com>
In-Reply-To: <CABfawhm==Gpca8+E=PihvW3x7Y79kAKD48rk5PHHbbhdATh4-w@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 8 Jan 2020 11:23:29 -0700
X-Gmail-Original-Message-ID: <CABfawh=StW-4_VF+OUywP+t2SVE_o=gX8H9UGZcFH+e8FFbEQw@mail.gmail.com>
Message-ID: <CABfawh=StW-4_VF+OUywP+t2SVE_o=gX8H9UGZcFH+e8FFbEQw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+ID4gPiBXaHkgZG8geW91IG5lZWQgYSBjb25maWcgZmlsZSBmb3IgbGF1bmNoaW5nIHRoZSBR
ZW11IGRldmljZSBtb2RlbD8KPiA+ID4gPiBEb2Vzbid0IHRoZSBzYXZlLWZpbGUgY29udGFpbiBh
bGwgdGhlIGluZm9ybWF0aW9uPwo+ID4gPgo+ID4gPiBUaGUgY29uZmlnIGlzIHVzZWQgdG8gcG9w
dWxhdGUgeGVuc3RvcmUsIG5vdCBqdXN0IGZvciBRRU1VLiBUaGUgUUVNVQo+ID4gPiBzYXZlIGZp
bGUgZG9lc24ndCBjb250YWluIHRoZSB4bCBjb25maWcuIFRoaXMgaXMgbm90IGEgZnVsbCBWTSBz
YXZlCj4gPiA+IGZpbGUsIGl0IGlzIG9ubHkgdGhlIFFFTVUgc3RhdGUgdGhhdCBnZXRzIGR1bXBl
ZCB3aXRoCj4gPiA+IHhlbi1zYXZlLWRldmljZXMtc3RhdGUuCj4gPgo+ID4gVEJIIEkgdGhpbmsg
aXQgd291bGQgYmUgZWFzaWVyIHRvIGhhdmUgc29tZXRoaW5nIGxpa2UgbXkgcHJvcG9zYWwKPiA+
IGJlbG93LCB3aGVyZSB5b3UgdGVsbCB4bCB0aGUgcGFyZW50IGFuZCB0aGUgZm9ya2VkIFZNIG5h
bWVzIGFuZCB4bAo+ID4gZG9lcyB0aGUgcmVzdC4gRXZlbiBiZXR0ZXIgd291bGQgYmUgdG8gbm90
IGhhdmUgdG8gdGVsbCB4bCB0aGUgcGFyZW50Cj4gPiBWTSBuYW1lIChzaW5jZSBJIGd1ZXNzIHRo
aXMgaXMgYWxyZWFkeSB0cmFja2VkIGludGVybmFsbHkgc29tZXdoZXJlPykuCj4KPiBUaGUgZm9y
a2VkIFZNIGhhcyBubyAibmFtZSIgd2hlbiBpdCdzIGNyZWF0ZWQuIEZvciBwZXJmb3JtYW5jZSBy
ZWFzb25zCj4gd2hlbiB0aGUgVk0gZm9yayBpcyBjcmVhdGVkIHdpdGggIi0tbGF1bmNoLWRtIG5v
IiB3ZSBleHBsaWNpdGx5IHdhbnQKPiB0byBhdm9pZCB0b3VjaGluZyBYZW5zdG9yZS4gRXZlbiBw
YXJzaW5nIHRoZSBjb25maWcgZmlsZSB3b3VsZCBiZQo+IHVubmVlZGVkIG92ZXJoZWFkIGF0IHRo
YXQgc3RhZ2UuCgpBbmQgdG8gYW5zd2VyIHlvdXIgcXVlc3Rpb24sIG5vLCB0aGUgcGFyZW50IFZN
J3MgbmFtZSBpcyBub3QgcmVjb3JkZWQKYW55d2hlcmUgZm9yIHRoZSBmb3JrLiBUZWNobmljYWxs
eSBub3QgZXZlbiB0aGUgcGFyZW50J3MgZG9tYWluIGlkIGlzCmtlcHQgYnkgWGVuLiBUaGUgZm9y
ayBvbmx5IGtlZXBzIGEgcG9pbnRlciB0byB0aGUgcGFyZW50J3MgInN0cnVjdApkb21haW4iLiBT
byByaWdodCBub3cgdGhlcmUgaXMgbm8gaHlwZXJjYWxsIGludGVyZmFjZSB0byByZXRyaWV2ZSBh
CmZvcmsncyBwYXJlbnQncyBJRCAtIGl0IGlzIGFzc3VtZWQgdGhlIHRvb2xzIHVzaW5nIHRoZSBp
bnRlcmZhY2UgYXJlCmtlZXBpbmcgdHJhY2sgb2YgdGhhdC4gQ291bGQgdGhpcyBpbmZvcm1hdGlv
biBiZSBkdW1wZWQgaW50byBYZW5zdG9yZQphcyB3ZWxsPyBZZXMuIEJ1dCB3ZSBzcGVjaWZpY2Fs
bHkgd2FudCBiZSBhYmxlIHRvIGNyZWF0ZSB0aGUgZm9yayBhcwpmYXN0IHBvc3NpYmxlIHdpdGhv
dXQgYW55IHVubmVjZXNzYXJ5IG92ZXJoZWFkLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
