Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF729D44D6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 18:00:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIxIi-00080o-KA; Fri, 11 Oct 2019 15:57:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vFH0=YE=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iIxIh-00080Y-8p
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 15:57:55 +0000
X-Inumbo-ID: e2c7485a-ec3f-11e9-beca-bc764e2007e4
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2c7485a-ec3f-11e9-beca-bc764e2007e4;
 Fri, 11 Oct 2019 15:57:54 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q1so22626225ion.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2019 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mGswfPjwyjBvKwlKEYhCAAC12yE7hwiNIg+o5bysEwk=;
 b=H97xSQKR/po1Fmjb6pGcFTyRyZ6aU59KVU6q0K+m3HBNeoVSZRvyW4WvBleZ/6/dOZ
 hzNBrnI6pxyzn3U0TbK82rEbSmtzJ6+5W3ok7b/YlnTTOkDd9V4Jo8LkzeNdmwYPOPjF
 2YJhBWkLHnITIi/Zl1i4ITvoGHVq0zNU2IkpFy25CkEHZcZ/72b2ulkVKKxj6WR1DTMX
 JVS/wUC0lAhr0pC0oLk1JoXotV44aP2cQ30S2TbrMHwv4owjvl7d7Q1oyHE+4eVITDzR
 FlSV85D4M9RCsjxE5EjSBYVFAGs0HRQc+i6z2n4Nb/UTypvnrcMHbGWNZM+hKIYq6gqA
 gusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mGswfPjwyjBvKwlKEYhCAAC12yE7hwiNIg+o5bysEwk=;
 b=k3GmE5hTE+Fh8xeEYpX0grNur2vklWBgX0JfPM10NJbMt7LLfkzjF30w0f4T+1ESYB
 s0HiBLnhgwguUVD+ns9YedClZndu8koZ9ydDF7HDvb/b0xVjY5KXMSCLC5Q8nk+CSdmE
 yhy4R6jJlBM/Lf8w4dBEwA/aAps82iS5mtPPQZDz19/q0r4rO1I+UZYlUiiAupjKZbPg
 pcRmdEYoYy9jJ5McO2vz6iwkLoXb9Nf9ji+qRhM3aTxufzLVddbgMK8Y7J+ql8EvYg5Z
 u+m1lH7cY3gLNwObfrpKjvbY+Ehgg/Kf+urEvF/CMPY4TY9i1Iqdts2c6porhX3QDP/p
 er0g==
X-Gm-Message-State: APjAAAWJL3Vjyn7D2FzwjH/XzisDfVscm4udcYYGHD9CuTrwCZ/LpEDk
 FolZjX3SqjhSu6RpesnV0e8R1PtCcrJRqvg0AU8=
X-Google-Smtp-Source: APXvYqzIkjYGrBskWghRzce7m7UMWZ6rh06TmBFpTdF7W9o3fhm2ysqJlbcoB6MI/hurh15h24vKRTtOPQfUgFlesuE=
X-Received: by 2002:a05:6602:1cc:: with SMTP id
 w12mr3631772iot.260.1570809473907; 
 Fri, 11 Oct 2019 08:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
 <23968.39034.34800.276030@mariner.uk.xensource.com>
In-Reply-To: <23968.39034.34800.276030@mariner.uk.xensource.com>
From: Oleksandr Grytsov <al1img@gmail.com>
Date: Fri, 11 Oct 2019 18:57:42 +0300
Message-ID: <CACvf2oV6iFM6x1bs8JPT28Eqny0gARh8MtSTedbgAP-m9CTP=w@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH v1 1/2] libxl: introduce new backend type
 VINPUT
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgNTo1OCBQTSBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbGVrc2FuZHIgR3J5dHNvdiB3cml0ZXMgKCJbUEFUQ0gg
djEgMS8yXSBsaWJ4bDogaW50cm9kdWNlIG5ldyBiYWNrZW5kIHR5cGUgVklOUFVUIik6Cj4gPiBG
cm9tOiBPbGVrc2FuZHIgR3J5dHNvdiA8b2xla3NhbmRyX2dyeXRzb3ZAZXBhbS5jb20+Cj4gPgo+
ID4gVGhlcmUgYXJlIHR3byBraW5kIG9mIFZLQkQgZGV2aWNlczogd2l0aCBRRU1VIGJhY2tlbmQg
YW5kIHVzZXIgc3BhY2UKPiA+IGJhY2tlbmQuIEluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gdGhl
eSBjYW4ndCBiZSBkaXN0aW5ndWlzaGVkIGFzIGJvdGggdXNlCj4gPiBWS0JEIGJhY2tlbmQgdHlw
ZS4gQXMgcmVzdWx0LCB1c2VyIHNwYWNlIEtCRCBiYWNrZW5kIGlzIHN0YXJ0ZWQgYW5kCj4gPiBz
dG9wcGVkIGFzIFFFTVUgYmFja2VuZC4gVGhpcyBjb21taXQgYWRkcyBuZXcgZGV2aWNlIGtpbmQg
VklOUFVUIHRvIGJlCj4gPiB1c2VkIGFzIGJhY2tlbmQgdHlwZSBmb3IgdXNlciBzcGFjZSBLQkQg
YmFja2VuZC4KPgo+IEkgZmluZCB0aGlzIGNvbmZ1c2luZy4gIEknbSBub3Qgc3VyZSB0aGlzIGNo
YW5nZSBpcyByaWdodC4gIEJ1dCBJJ20KPiBhZnJhaWQgdGhlIG9yaWdpbmFsIHBhdGNoZXMgaW4g
dGhpcyBhcmVhIHBhc3NlZCBtZSBieSBzbyBJIGRvbid0IGtub3cKPiBtdWNoIGFib3V0IGl0Lgo+
Cj4gSSB0aGluayBpdCB3YXMgYTQ4ZTAwZjE0YTJkICJsaWJ4bDogYWRkIGJhY2tlbmQgdHlwZSBh
bmQgaWQgdG8gdmtiIgo+IHdoaWNoIGludHJvZHVjZWQgd2hhdCB5b3UgYXJlIGNhbGxpbmcgInVz
ZXIgc3BhY2UiIGJhY2tlbmRzLiAgSXQKPiBhcHBlYXJzIHRoYXQgdGhlIHZrYiBiYWNrZW5kIHR5
cGUgZW51bSB3YXMgaW50cm9kdWNlZCB0aGVyZQo+IHNwZWNpZmljYWxseSB0byBkaXN0aW5ndWlz
aCBiZXR3ZWVuIHRoZXNlIHR3byBzaXR1YXRpb25zLiAgRm9yIHJlYXNvbnMKPgo+IEFtIEkgd3Jv
bmcgPyAgSWYgbm90LCB3aHkgaXMgdGhpcyBub3Qgd29ya2luZyBvciBub3Qgc3VpdGFibGUgPwoK
WW91IGFyZSByaWdodC4gSXQgaXMgbm90IHdvcmtpbmcgaW4gc29tZSBjYXNlcyBkdWUgdG8gUUVN
VV9CQUNLRU5EIG1hY3JvLgpRRU1VX0JBQ0tFTkQgdHJlYXRzIGJvdGggYmFja2VuZHMgYXMgUUVN
VS4gQXMgcmVzdWx0IHhsIHBlcmZvcm1zIGRldmljZQpob3RwbHVnIG9uIGFkZC9yZW1vdmUgZGV2
aWNlLiBXaGljaCBpcyBub3QgZXhwZWN0ZWQgaW4gY2FzZSAidXNlcgpzcGFjZSIgYmFja2VuZC4K
CkluIHRoaXMgcGF0Y2ggSSBwcm9wb3NlIHNvbHV0aW9uIHNpbWlsYXIgdG8gVlVTQiBkZXZpY2Uu
IFdoZXJlIFZVU0IKdXNlZCBmb3IgZnJvbnRlbmQKYW5kIGRlcGVuZHMgb24gYmFja2VuZCAoa2Vy
bmVsIG9yIFFFTVUpIGVpdGhlciBWVVNCIG9yIFFVU0IgdXNlZCBmb3IgYmFja2VuZApkZXZpY2Ug
dHlwZSBlLmcuIHVzZSBkaWZmZXJlbnQgYmFja2VuZCBkZXZpY2UgdHlwZSBmb3IgZGlmZmVyZW50
CmJhY2tlbmRzLiBJdCB3b3VsZCBiZQptb3JlIGNsZWFyIGlmLCBmb3IgZXhhbXBsZSwgUUVNVSBi
YWNrZW5kIGhhcyBRS0JEIG5hbWUgYW5kIGFsbCBvdGhlcgpWS0JELiBCdXQgaXQKd291bGQgcmVx
dWlyZSBjaGFuZ2VzIG9uIFFFTVUgc2lkZSB0b28uIFRoYXQncyB3aHkgSSd2ZSBjaG9zZW4gVklO
UFVUIG5hbWUuCgpJbnRyb2R1Y2luZyBuZXcgYmFja2VuZCBkZXZpY2UgdHlwZSBmb3IgVktCRCBh
bHNvIGFsbG93cyB0byBoYXZlIGJvdGggYmFja2VuZHMKKFFFTVUgYW5kIG5vbiBRRU1VKSBydW4g
aW4gc2FtZSBkb21haW4uIE5vdCBzdXJlIGlmIGl0IGlzIHVzZWZ1bApzY2VuYXJpbyBidXQgd2l0
aAp0aGlzIHByb3Bvc2FsIGl0IGlzIHBvc3NpYmxlIGZyb20gdGVjaG5pY2FsIHBvaW50IG9mIHZp
ZXcuCgo+Cj4gSSBhbHNvIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoZSAidXNlciBzcGFjZSIga2Jk
IGJhY2tlbmQgc2VlbXMgdG8gYmUKPiAibGludXgiIGluIHRoZSBlbnVtLgoKSSBhZ3JlZSB0aGlz
IGlzIG5vdCBzbyBnb29kIG5hbWUuIEJ1dCBJIGRvbid0IGtub3cgaG93IHRvIGNhbGwKYmFja2Vu
ZHMgd2hpY2ggYXJlIG5vdCBydW5uaW5nCmluc2lkZSBRRU1VIGluIGdlbmVyYWwuCgo+IFdoZXJl
IGlzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIHVzZXIgc3BhY2UKPiBiYWNrZW5kID8KCldl
IGhhdmUgZXh0ZW5kZWQga2JkIGludGVyZmFjZSAoa2JkaWYuaCkgdG8gc3VwcG9ydCBtdWx0aS10
b3VjaCBldmVudHMKYXMgd2VsbC4gQW5kIHdlIGhhdmUKaW1wbGVtZW50ZWQgb3duIGtiZCBiYWNr
ZW5kIGh0dHBzOi8vZ2l0aHViLmNvbS94ZW4tdHJvb3BzL2Rpc3BsX2JlLwpJdCBpcyBpbnRlZ3Jh
dGVkIHdpdGggZGlzcGxheSBiYWNrZW5kIGFzIGJvdGggdXNlIHdheWxhbmQgQVBJLgoKPiBJcyBp
dCBiZSBjb250cm9sbGVkIGVudGlyZWx5IHRocm91Z2ggeGVuc3RvcmUgPwoKWWVzIGl0IGlzIGNv
bnRyb2xsZWQgZW50aXJlbHkgdGhyb3VnaCB4ZW5zdG9yZTogbGliIHhsIGNyZWF0ZXMKZnJvbnRl
bmQvYmFja2VuZCBlbnRyaWVzIHdpdGgKaW5pdGlhbCBzdGF0ZXMgYW5kIGNvbmZpZ3VyYXRpb24u
Cgo+IElhbi4KCi0tIApCZXN0IFJlZ2FyZHMsCk9sZWtzYW5kciBHcnl0c292LgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
