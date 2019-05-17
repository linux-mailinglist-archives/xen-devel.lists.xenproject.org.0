Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A3219A5
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 16:13:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRdYu-00080x-D5; Fri, 17 May 2019 14:10:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FnXM=TR=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRdYs-00080s-Ba
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 14:10:14 +0000
X-Inumbo-ID: 7ccb6780-78ad-11e9-8980-bc764e045a96
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7ccb6780-78ad-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 14:10:13 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id x24so5591606ion.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGDaqDjlBz7XIzclx424u+KNmv6OD6Uo18HS4i3FMf4=;
 b=AYV2h4K9tTUzV9M1U1FeyFxP2lqXu0vCj2xhYlFSkxKvRvOWKATS1fPtR+Gt0KmwC0
 VUlFJ3BKHBWNoCSw/9C62oKPtFa7SiWVnapqIJgnl4bXJHcT+ith0fMFEdSz1Go3ylg1
 zB5sezZjE92LVIO9PJCF+WETlD/I1sizd7qjrvvvB5j4O+ebTQHrWAXsegGdJMno1ORO
 VaiRW93gPoqxSxeWohWCkAeqXMz0+Fjmzw5YB8d+h5URgDjZHYdagWsIVyYkj59oEmLx
 jDwc4l0s6hcI45SbxN2aKXytOpd2zCm9gMKRpvb7Oy/88HFOjWJCTEuGSbZxupaA4gJq
 CjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGDaqDjlBz7XIzclx424u+KNmv6OD6Uo18HS4i3FMf4=;
 b=IqLiIxNxzzZdJbeT3M/0VaCF/kZ8VSeJYJPtd790y2tQcab8ftPDcNgcHu8KusdI3M
 G85ImijQ/L6c9s8Uz2as5Nnr2zEATv5xfX3DjYa9enyOcEIm4W91In9zRTc1d0qxRWSI
 E3WpTJ6nI6BfRTIwoUeh7poueJoZXQFrjpOue7CTh4xH9nwY9a/1Z9+oygyrnjfSU37Z
 +VHoKlxtubvnbvg0pZMlxJlzYo0/ShrMSSRsxnZ6znVkXv+IOKZh6jFdt5ndhSlEbGbR
 HxLO/aKsccwZ1DDIN/sKp31xg+em/+nV5wfGwB46t5x0x8sNcMamj503v+H2mmRYse8B
 GUAw==
X-Gm-Message-State: APjAAAUI//a4ydct00NYUNy1UXT0sfGo1QCpduq17emqjFK36YQ9oe9u
 rXhMspTP8K365Z2D72dQeC/tNQlaFfkgiJ7tWi8=
X-Google-Smtp-Source: APXvYqz9zyzBMHgYCaY8slti6jn9UAZECuKi2stH/ePcJjqUStDp+Th835lFPMbFuDHZgEd0+LfSOCdU8JmS70nGmbs=
X-Received: by 2002:a6b:a0d:: with SMTP id z13mr16493109ioi.67.1558102212680; 
 Fri, 17 May 2019 07:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
In-Reply-To: <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 17 May 2019 17:10:01 +0300
Message-ID: <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrii_Anisov@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuIGFuZCBBbmRyZXcsIEFsbAoKRnJvbSBzdGFuZGFyZDoKVGhlIHJlc3VsdCBvZiBFMSA+
PiBFMiBpcyBFMSByaWdodC1zaGlmdGVkIEUyIGJpdCBwb3NpdGlvbnMuCklmIEUxIGhhcyBhbiB1
bnNpZ25lZCB0eXBlIG9yIGlmIEUxIGhhcyBhIHNpZ25lZCB0eXBlIGFuZCBhIG5vbm5lZ2F0aXZl
IHZhbHVlLAp0aGUgdmFsdWUgb2YgdGhlIHJlc3VsdCBpcyB0aGUgaW50ZWdyYWwgcGFydCBvZiB0
aGUgcXVvdGllbnQgb2YgRTEgLyAyRTIuCklmIEUxIGhhcyBhIHNpZ25lZCB0eXBlIGFuZCBhIG5l
Z2F0aXZlIHZhbHVlLAp0aGUgcmVzdWx0aW5nIHZhbHVlIGlzIGltcGxlbWVudGF0aW9uLWRlZmlu
ZWQuCgpUbyByZXBocmFzZTogaW4gY2FzZSBvZiByaWdodCBzaGlmdGluZyBhbmQgd2hlbiB0aGUg
b3JpZ2luYWwgbnVtYmVyIGlzIG5lZ2F0aXZlLAp0aGUgc3RhbmRhcmQgZG9lcyBub3QgZGVmaW5l
IHdoZXRoZXIgdGhlIHNoaWZ0IGlzIGFyaXRobWV0aWMgb3IgbG9naWNhbAooaS5lLiB3aWxsIGl0
IHByZXNlcnZlIHRoZSBzaWduIG9yIG5vdCkuCgpJbiBvdXIgZXhhbXBsZSwgaW4gdGhlIGNhc2Ug
d2hlbgooaW50NjRfdCl2YWRkciA8IDAKdGhlIHJlc3VsdCBvZiBuZXh0IHNoaWZ0IGlzICdpbXBs
ZW1lbnRhdGlvbi1kZWZpbmVkJyAoYW5kIG5vdAondW5kZWZpbmVkIGJlaGF2aW9yJyk6CihpbnQ2
NF90KXZhZGRyID4+IDYzCgpNZWFuIHRoYXQgcmVzdWx0IG9mICIoaW50NjRfdCl2YWRkciA+PiA2
MyIgY2FuIGJlIDAgb3IgMS4KU28gdGhlIG5leHQgY29kZSBtYXkgbm90IHdvcmsgcHJvcGVybHkg
aW4gY2FzZSBvZiBhbm90aGVyICdpbXBsZW1lbnRhdGlvbnMnLgpXaXRoIGFub3RoZXIgY29tcGls
ZXIgKGkuZS4gY2xhbmcsIGV0YykgdGhpcyBjb2RlIG1heSBpbnRyb2R1Y2UgYnVncwp3aGljaCBh
cmUgaGFyZCB0byBmaW5kLgoKKChpbnQ2NF90KXZhZGRyID4+IDQ3KSA9PSAoKGludDY0X3QpdmFk
ZHIgPj4gNjMpCgpGb3IgdGhpcyByZWFzb24gaXQgaXMgYmV0dGVyIHRvIGF2b2lkIGltcGxlbWVu
dGF0aW9uLWRlZmluZWQgY29kZS4KCkRvIHlvdSBhZ3JlZT8KClRoYW5rcwoKT24gRnJpLCBNYXkg
MTcsIDIwMTkgYXQgMzozMiBQTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+Cj4gPj4+IE9uIDE3LjA1LjE5IGF0IDEzOjI1LCA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPiBIaSBBbGwsCj4gPgo+ID4gV2hpbGUgbG9va2luZyBhdCBjb2RlIGluIHRv
b2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2X3B2LmMsCj4gPiB3ZSBzZWUgdGhhdCB0aGVyZSBpcyBj
YXN0aW5nIG9mIHhlbiB2aXJ0dWFsIGFkZHJlc3MgdHlwZSB4ZW5fdmFkZHJfdAo+ID4gdG8gc2ln
bmVkIGludDY0IHR5cGUuCj4gPiBJbiBjb21taXQ6IDdiZjc0NTgyYjM0MzYwM2NiMDgyNmQ4MDhj
ZDdkYTQzMzI2NDUyYTUKPiA+Cj4gPiArLyogQ2hlY2sgYSA2NCBiaXQgdmlydHVhbCBhZGRyZXNz
IGZvciBiZWluZyBjYW5vbmljYWwuICovCj4gPiArc3RhdGljIGlubGluZSBib29sIGlzX2Nhbm9u
aWNhbF9hZGRyZXNzKHhlbl92YWRkcl90IHZhZGRyKQo+ID4gK3sKPiA+ICsgICAgcmV0dXJuICgo
aW50NjRfdCl2YWRkciA+PiA0NykgPT0gKChpbnQ2NF90KXZhZGRyID4+IDYzKTsKPiA+ICt9Cj4g
Pgo+ID4gSXQgc2VlbXMgdGhlcmUgaXMgbm8gbmVlZCB0byBjYXN0IHZhZGRyIHZhcmlhYmxlLiBJ
dCBsb29rcyBsaWtlCj4gPiBzaGlmdGluZyB2YWRkciBzaWduZWQgNjQtYml0IHZhbHVlIGJ5IDYz
IGJpdHMgaW50cm9kdWNlcyB1bmRlZmluZWQKPiA+IGJlaGF2aW9yLgo+Cj4gSSBkb24ndCB0aGlu
ayBzbyAtIGFzIHBlciBteSByZWFkaW5nIG9mIHRoZSBzdGFuZGFyZCB0ZXh0LCBVQgo+IHJlc3Vs
dHMgb25seSB3aGVuIHRoZSBzaGlmdCBjb3VudCBpcyBncmVhdGVyIG9yIGVxdWFsIHRoYW4gdGhl
Cj4gd2lkdGggb2YgdGhlIChwcm9tb3RlZCkgc2hpZnRlZCB2YWx1ZSdzIHR5cGUuIFRoZSByZXN1
bHRzIG9mCj4gYm90aCBzaGlmdHMgYWJvdmUgYXJlIGltcGxlbWVudGF0aW9uIGRlZmluZWQgYWZh
aWN0Lgo+Cj4gPiBDb3VsZCB5b3UgcGxlYXNlIGRlc2NyaWJlIHdoYXQgaXMgdGhlIHJlYXNvbiBm
b3IgdGhpcyBjYXN0aW5nPwo+Cj4gV2VsbCwgd2Ugd2FudCB0byBjaGVjayB0aGF0IHRoZSB0b3Ag
MTcgYml0cyBhcmUgZWl0aGVyIGFsbCAxcwo+IG9yIGFsbCAwcywgcHJlZmVyYWJseSB3aXRoIGp1
c3QgYSBzaW5nbGUgY29tcGFyaXNvbi4KPgo+IEphbgo+Cj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
