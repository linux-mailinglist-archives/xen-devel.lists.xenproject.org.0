Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8E616A3EF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:32:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Azh-00035N-FR; Mon, 24 Feb 2020 10:29:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6Azf-00035I-Rf
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:29:43 +0000
X-Inumbo-ID: 91dd89e2-56f0-11ea-8ae0-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91dd89e2-56f0-11ea-8ae0-12813bfff9fa;
 Mon, 24 Feb 2020 10:29:43 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p14so11243000edy.13
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 02:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wdVkKqasxcJl/u7HSeQ5upWY+al8YxEs54C96jj060U=;
 b=mW0BLjfRThxDYqUcXiRDZIvRQBWUWUYOjtNlNoV+yOvkuQwwS3Xh84dpxgnwDFqR3A
 ev2CP1OydcOr/3Jj34+pbO4kmVO/wRkNMmF4FjIT8sjXue7b9UEJBX/WgXZJrwhsTZx2
 LjUxT+A6Gplz7WJyFM6VpyB0hiMGvJi6H0iuyy7kN1c5AVx+sY4/hC0GtREdWR8CI9t9
 F4MEp9PZVCJuAoFxT3p0uNqNO9Vq8FQb+ulfxwu27ItQuWAcvFXUmgOS4Lxy28f/fAkQ
 XF4xSZ22u7u25X9hoeBs7cNCOLQDgoCKZaAjAkJRY1akuihtntxtNcZvlkOr2GnP5uuh
 2OtQ==
X-Gm-Message-State: APjAAAWTZVlaDaof1HHJb6AQeFvyOQvtyPzkIT/UGjua39CPC4GfSxMQ
 9vKJhMTRX4sIqoCOsQZoxCE=
X-Google-Smtp-Source: APXvYqw3KVpxQmtMrBHiZDpc4qI9+Fw73umlRpIgWCMU3HWFw4kXqp0ZfaCS/EFPlgoOuRVGSB5gwA==
X-Received: by 2002:a17:906:bb08:: with SMTP id
 jz8mr46479499ejb.96.1582540182345; 
 Mon, 24 Feb 2020 02:29:42 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id lu4sm762311ejb.76.2020.02.24.02.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 02:29:41 -0800 (PST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-2-roger.pau@citrix.com>
 <6a22dad2-946a-ae9f-2304-61f60e0d7f8c@xen.org>
 <20200224100919.GH4679@Air-de-Roger>
 <63c23677-1dbd-3dce-d67a-ea86c5683cc7@xen.org>
 <20200224102355.GJ4679@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <01f7434f-295c-06de-5576-a4c5af1d3048@xen.org>
Date: Mon, 24 Feb 2020 10:29:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224102355.GJ4679@Air-de-Roger>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNC8wMi8yMDIwIDEwOjIzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIE1v
biwgRmViIDI0LCAyMDIwIGF0IDEwOjE5OjQ0QU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gSGksCj4+Cj4+IE9uIDI0LzAyLzIwMjAgMTA6MDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4+PiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAxMDowMjo1M0FNICswMDAwLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4+Pj4gSGkgUm9nZXIsCj4+Pj4KPj4+PiBUaGUgbG9naWMgZm9yIEFybTY0IGFu
ZCBBcm0zMiBsb29rcyBnb29kIHRvIG1lLiBJIGp1c3QgaGF2ZSBvbmUgcXVlc3Rpb24KPj4+PiBi
ZWxvdy4KPj4+Pgo+Pj4+IE9uIDI0LzAyLzIwMjAgMDg6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90
ZToKPj4+Pj4gVG8geDg2IGFuZCBBcm0uIFRoaXMgcGVyZm9ybXMgYW4gYXRvbWljIEFORCBvcGVy
YXRpb24gYWdhaW5zdCBhbgo+Pj4+PiBhdG9taWNfdCB2YXJpYWJsZSB3aXRoIHRoZSBwcm92aWRl
ZCBtYXNrLgo+Pj4+Pgo+Pj4+PiBSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgICAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm0z
Mi9hdG9taWMuaCB8IDE3ICsrKysrKysrKysrKysrKysrCj4+Pj4+ICAgICB4ZW4vaW5jbHVkZS9h
c20tYXJtL2FybTY0L2F0b21pYy5oIHwgMTQgKysrKysrKysrKysrKysKPj4+Pj4gICAgIHhlbi9p
bmNsdWRlL2FzbS14ODYvYXRvbWljLmggICAgICAgfCAgOCArKysrKysrKwo+Pj4+PiAgICAgMyBm
aWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL2F0b21pYy5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9h
cm0zMi9hdG9taWMuaAo+Pj4+PiBpbmRleCBjMDNlYjY4NGNkLi40NjM3MzgxYmNjIDEwMDY0NAo+
Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL2F0b21pYy5oCj4+Pj4+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvYXRvbWljLmgKPj4+Pj4gQEAgLTk2LDYgKzk2LDIz
IEBAIHN0YXRpYyBpbmxpbmUgaW50IGF0b21pY19zdWJfcmV0dXJuKGludCBpLCBhdG9taWNfdCAq
dikKPj4+Pj4gICAgIAlyZXR1cm4gcmVzdWx0Owo+Pj4+PiAgICAgfQo+Pj4+PiArc3RhdGljIGlu
bGluZSB2b2lkIGF0b21pY19hbmQodW5zaWduZWQgaW50IG0sIGF0b21pY190ICp2KQo+Pj4+Cj4+
Pj4gQWxsIHRoZSBhdG9taWMgaGVscGVycyBoYXZlIHRha2VuIGEgc2lnbmVkIGludCBzbyBmYXIg
YmVjYXVzZSB0aGUgY291bnRlciBpcwo+Pj4+IGFuIGludC4gQW55IHJlYXNvbiB0byBkaXZlcmdl
IGZyb20gdGhhdD8KPj4+Cj4+PiBTaW5jZSB0aGlzIGlzIG5vdCBhbiBhcml0aG1ldGljIG9wZXJh
dGlvbiBJIGZlbHQgdW5zaWduZWQgaW50IHdhcyBhCj4+PiBtb3JlIHN1aXRhYmxlIHR5cGUgdG8g
ZGVzY3JpYmUgYSBiaXRtYXNrOiBpdCBmZWx0IHdlaXJkIHRvIHBhc3MgYQo+Pj4gYml0bWFzayB3
aXRoIHR5cGUgaW50LCBiZWNhdXNlIHNpZ25lZG5lc3MgZG9lc24ndCBtYWtlIHNlbnNlIHdoZW4K
Pj4+IHJlZmVycmluZyB0byBhIG1hc2suCj4+Cj4+IEF0IHNvbWUgcG9pbnQgSSB3b3VsZCBsaWtl
IHRvIGhhdmUgbWFjcm8gZ2VuZXJhdGluZyBhbGwgdGhlIGF0b21pY3MgaW4gb24KPj4gQXJtIGlu
IHRoZSBzYW1lIHdheSBhIExpbnV4IChzZWUgYXNtLWdlbmVyaWMvYXRvbWljLmgpLiBUaGlzIGlz
IHRvIGF2b2lkCj4+IGR1cGxpY2F0aW9uIGFuZCBtYWtlIGVhc3kgdG8gaW50cm9kdWNlIEFybXY4
LjEgTFNFIGF0b21pY3MuIFNvIEkgd291bGQgbGlrZQo+PiB0byBhdm9pZCBpbnRyb2R1Y2luZyBk
aWZmZXJlbmNlIGluIHRoZSBwcm90b3R5cGUgdW5sZXNzIGl0IGlzIHN0cmljbHkKPj4gbmVjZXNz
YXJ5Lgo+IAo+IFdoeSBub3QgaGF2ZSB0aGUgbWFjcm8gZ2VuZXJhdG9yIGZ1bmN0aW9uIGdldCBw
YXNzZWQgdGhlIHR5cGUgb2YgdGhlCj4gcGFyYW1ldGVyPwoKSXQgaXMgbm90IHdvcnRoIGl0IGZv
ciBhIHNpbXBsZSBvcGVyYXRpb24gYW5kIEkgZG9uJ3Qgd2FudCB0byBkaXZlcmdlIAp0b28gbXVj
aCBvZiBhdG9taWNzIGZyb20gTGludXguCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
