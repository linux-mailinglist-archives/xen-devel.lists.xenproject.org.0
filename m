Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCA8146BFC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 15:56:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iudqs-0004wt-KU; Thu, 23 Jan 2020 14:52:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=prnW=3M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iudqr-0004wo-Fl
 for xen-devel@lists.xen.org; Thu, 23 Jan 2020 14:52:57 +0000
X-Inumbo-ID: 097734f5-3df0-11ea-be4e-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 097734f5-3df0-11ea-be4e-12813bfff9fa;
 Thu, 23 Jan 2020 14:52:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so2859635wmb.0
 for <xen-devel@lists.xen.org>; Thu, 23 Jan 2020 06:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mplPBKlDmeZ1pAJjrnZaXQ1QsQmQ9U6/Pb7ARseSDRA=;
 b=Uisk8bTpXsvkuSXzYv0it43YC44ElS36maF8JucYHD/+z2VaVuwxngUoOQrXIG0hfO
 4VvfbvQtB/K/S4HNppinpD3nl0iUKJCCEELRReC+2vU84PEaglIkpFyvtMYH9yEy7MU6
 ydcX4j7xbUqphfP9jOyCcHpaAvHUvJVyuR+2ecdzc9W0CPQueCr+y2JPe/f4yFWrQlk/
 m9nTQW45K+9wnPI5WMValIk31x5o7XO5sjyH13hpCzKznyGJBepY6WCMZGUDfMAj7+Nh
 ENdoAeGj6jqEptE1DpC3RlG9BVHKe/obhDfZZ4e6ayAQM2812Jnhz2z4C0sT7t2njAJm
 8iBQ==
X-Gm-Message-State: APjAAAWOJIY3h6No9s3bI4V4LmiABvGFPw5f/oOy2oA5G4hg+MUlRMx+
 EZu3v2e10rWZhAv3gpVQcl8=
X-Google-Smtp-Source: APXvYqzxXzvFmTDXA7bl94eL1MrLpDiOwQpRV7vjo2lyZ5GxfqfqlKf83P6fJLdYDlS0Z3ICBNwg8g==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr4717985wmb.80.1579791175196;
 Thu, 23 Jan 2020 06:52:55 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id y7sm9085052wmd.1.2020.01.23.06.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 06:52:54 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <67b7b3ab-6714-4acc-ff2b-34c355c41488@citrix.com>
 <2fc63e2d-13da-d468-2c97-a0ee9029d09c@xen.org>
 <afcaab48-0939-8cf7-6735-019bf2109b19@citrix.com>
 <01b8360a-803b-e409-0ced-9f6cf75ba609@xen.org>
 <4afebff2-2239-44f8-ae82-7264595eda70@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <33b7d973-d9ee-d13d-c82d-8edf242d03eb@xen.org>
Date: Thu, 23 Jan 2020 14:52:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4afebff2-2239-44f8-ae82-7264595eda70@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMy8wMS8yMDIwIDE0OjQ1LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDEvMjMv
MjAgMjo0MiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMjMvMDEvMjAy
MCAxMTozMiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4+IE9uIDIyLzAxLzIwMjAgMTE6MjUsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMjIvMDEvMjAyMCAxMToxOSwgU2Vy
Z2V5IER5YXNsaSB3cm90ZToKPj4+Pj4gT24gMjIvMDEvMjAyMCAxMDoxNCwgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiAyMi8wMS8yMDIwIDEwOjAxLCBTZXJnZXkg
RHlhc2xpIHdyb3RlOgo+Pj4+Pj4+IE9uIDIwLzAxLzIwMjAgMTA6MDEsIEphbiBCZXVsaWNoIHdy
b3RlOgo+Pj4+Pj4+PiBPbiAxNy4wMS4yMDIwIDE3OjQ0LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+
Pj4+Pj4+Pj4gdjIgLS0+IHYzOgo+Pj4+Pj4+Pj4gLSBSZW1vdmUgaHZtbG9hZGVyIGZpbHRlcmlu
Zwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBXaHk/IFNlZWluZyB0aGUgcHJpb3IgZGlzY3Vzc2lvbiwgaG93
IGFib3V0IGFkZGluZyBYRU5WRVJfZGVuaWVkIHRvCj4+Pj4+Pj4+IHJldHVybiB0aGUgImRlbmll
ZCIgc3RyaW5nLCBhbGxvd2luZyBjb21wb25lbnRzIHdoaWNoIHdhbnQgdG8gZmlsdGVyCj4+Pj4+
Pj4+IHRvIGtub3cgZXhhY3RseSB3aGF0IHRvIGxvb2sgZm9yPyBBbmQgdGhlbiByZS1hZGQgdGhl
IGZpbHRlcmluZyB5b3UKPj4+Pj4+Pj4gaGFkPyAoVGhlIGhlbHAgdGV4dCBvZiB0aGUgY29uZmln
IG9wdGlvbiBzaG91bGQgdGhlbiBwZXJoYXBzIGJlCj4+Pj4+Pj4+IGV4dGVuZGVkIHRvIG1ha2Ug
dmVyeSBjbGVhciB0aGF0IHRoZSBjaG9zZW4gc3RyaW5nIHNob3VsZCBub3QgbWF0Y2gKPj4+Pj4+
Pj4gYW55dGhpbmcgdGhhdCBjb3VsZCBwb3RlbnRpYWxseSBiZSByZXR1cm5lZCBieSBhbnkgb2Yg
dGhlIFhFTlZFUl8KPj4+Pj4+Pj4gc3ViLW9wcy4pCj4+Pj4+Pj4KPj4+Pj4+PiBJIGhhZCB0aGUg
Zm9sbG93aW5nIHJlYXNvbmluZzoKPj4+Pj4+Pgo+Pj4+Pj4+IDEuIE1vc3QgcmVhbC13b3JsZCB1
c2VycyB3b3VsZCBzZXQgQ09ORklHX1hTTV9ERU5JRURfU1RSSU5HPSIiCj4+Pj4+Pj4gYW55d2F5
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gMi4gRmlsdGVyaW5nIGluIERNSSB0YWJsZXMgaXMgbm90IGEgY29t
cGxldGUgc29sdXRpb24sIHNpbmNlIGRlbmllZAo+Pj4+Pj4+IHN0cmluZyBsZWFrcyBlbHNld2hl
cmUgdGhyb3VnaCB0aGUgaHlwZXJjYWxsIChQViBndWVzdHMsIHN5c2ZzLAo+Pj4+Pj4+IGRyaXZl
cgo+Pj4+Pj4+IGxvZ3MpIGFzIEFuZHJldyBoYXMgcG9pbnRlZCBvdXQgaW4gdGhlIHByZXZpb3Vz
IGRpc2N1c3Npb24uCj4+Pj4+Pj4KPj4+Pj4+PiBPbiB0aGUgb3RoZXIgaGFuZCwgU01CaW9zIGZp
bHRlcmluZyBzbGlnaHRseSBpbXByb3ZlcyB0aGUKPj4+Pj4+PiBzaXR1YXRpb24gZm9yCj4+Pj4+
Pj4gSFZNIGRvbWFpbnMsIHNvIEkgY2FuIHJldHVybiBpdCBpZiBtYWludGFpbmVycyBmaW5kIGl0
IHdvcnRoeS4KPj4+Pj4+Cj4+Pj4+PiBXaGlsZSBJIGFtIG5vdCBhIG1haW50YWluZXIgb2YgdGhp
cyBjb2RlLCBteSBjb25jZXJuIGlzIHlvdSBpbXBvc2UKPj4+Pj4+IHRoZSBjb252ZXJzaW9uIGZy
b20gImRlbmllZCIgdG8gIiIgdG8gYWxsIHRoZSB1c2VycyAoaW5jbHVkZSB0aG9zZQo+Pj4+Pj4g
d2hvIHdhbnRzIHRvIGtlZXAgImRlbmllZCIpLgo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIG5vdCB3aGF0
J3MgaGFwcGVuaW5nIGhlcmU6IHRoZSBkZWZhdWx0IGlzIHN0aWxsICI8ZGVuaWVkPiIgKGFzCj4+
Pj4+IHBlciBwYXRjaCAxKTsgYnV0IHBhdGNoIDIgbWFrZXMgWEVOVkVSX2V4dHJhdmVyc2lvbiwK
Pj4+Pj4gWEVOVkVSX2NvbXBpbGVfaW5mbwo+Pj4+PiBhbmQgWEVOVkVSX2NoYW5nZXNldCB0byBy
ZXR1cm4gIjxkZW5pZWQ+IiBpbnN0ZWFkIG9mIHRoZSByZWFsIHZhbHVlcwo+Pj4+PiB3aGljaCBj
YXVzZXMgdGhlIFVJIC8gbG9ncyBpc3N1ZXMuCj4+Pj4KPj4+PiBJIHdhcyByZWZlcnJpbmcgdGhl
IFNNQmlvcyBmaWx0ZXJpbmcuLi4gSSBkb24ndCB0aGluayBkb2luZyBhIGJsYW5rCj4+Pj4gZmls
dGVyaW5nIGlzIHRoZSByaWdodCB0aGluZyB0byBkbyBpbiB0aGUgaHZtbG9hZGVyIGZvciB0aGUg
cmVhc29uCj4+Pj4gZXhwbGFpbmVkIGFib3ZlLgo+Pj4KPj4+IEFwb2xvZ2llcyBmb3IgbWlzdW5k
ZXJzdGFuZGluZyB0aGUgY29udGV4dC4gQnV0IEkgZGlzYWdyZWUgYWJvdXQKPj4+IGh2bWxvYWRl
ci4gUmV0dXJuaW5nICJkZW5pZWQiIGZyb20geGVuX3ZlcnNpb24gaHlwZXJjYWxsIHRvIGd1ZXN0
cyBpcwo+Pj4gb25lIHRoaW5nLCBidXQgaHZtbG9hZGVyIGFuZCBTTUJpb3MgdGFibGVzIGFyZSBw
YXJ0cyBvZiB0aGUgaHlwZXJ2aXNvcgo+Pj4gYW5kIHB1dHRpbmcgImRlbmllZCIgdGhlcmUgaXMg
c2ltcGx5IGEgdGVycmlibGUgdXNlciBleHBlcmllbmNlLgo+Pgo+PiBJIGFtIG5vdCBnb2luZyB0
byBjb21tZW50IG9uIHRoZSB1c2VyIGV4cGVyaWVuY2UgYmVjYXVzZSB0aGlzIGlzIHVwIHRvCj4+
IGFub3RoZXIgYmlrZXNoZWRkaW5nLiBUaGUgcXVlc3Rpb24gaXMgd2hpY2ggc3RyaW5nIHdpbGwg
eW91IHVzZT8gV2h5IGFuCj4+IGVtcHR5IHN0cmluZyBvdmVyIHNvbWV0aGluZyBkaWZmZXJlbnQ/
Cj4+Cj4+IEhvd2V2ZXIsIGlmIGFuIGFkbWluIGhhcyBjb250cm9sIG92ZXIgdGhlICJkZW55IiBz
dHJpbmcsIHdoeSB3b3VsZCBoZQo+PiBldmVyIHdhbnQgdG8gZmlsdGVyIGl0IGluIGh2bWxvYWRl
cj8gV2h5IGNhbid0IGhlIGp1c3QgcmVwbGFjZSB0aGUgb25lCj4+IGluIEtjb25maWc/Cj4gCj4g
TW9zdCBhZG1pbnMgZG9uJ3QgY29tcGlsZSB0aGVpciBvd24gdmVyc2lvbiBvZiBYZW4uLi4KClRo
b3NlIGFkbWlucyBhcmUgYWxzbyB1bmxpa2VseSBnb2luZyB0byBidWlsZCB0aGVyZSBvd24gaHZt
bG9hZGVyLCByaWdodD8KClRoZXJlZm9yZSwgdGhleSB3aWxsIGhhdmUgdG8gYWNjZXB0IHdoYXRl
dmVyIHN0cmluZyBpcyByZXBvcnRlZCBieSAKSFZNTG9hZGVyIChvciBYZW4pLiBBcyB5b3UgYWxy
ZWFkeSBhbGxvdyBYZW4gdG8gY29uZmlndXJlIGl0LCB3aHkgd291bGQgCnRoYXQgYmUgYSBwcm9i
bGVtIHRvIGNoYW5nZSB0aGUgb25lIGluIEtjb25maWc/IFdoeSBkbyB5b3UgbmVlZCB0byBmaXgg
Cml0IHVwIGluIGh2bWxvYWRlciBhcyB3ZWxsPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
