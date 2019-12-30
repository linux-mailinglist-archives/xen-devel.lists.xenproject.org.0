Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D312D06D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 14:48:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilvMF-00070p-N7; Mon, 30 Dec 2019 13:45:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ggqA=2U=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ilvME-00070k-7b
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 13:45:18 +0000
X-Inumbo-ID: 982fb692-2b0a-11ea-b6f1-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 982fb692-2b0a-11ea-b6f1-bc764e2007e4;
 Mon, 30 Dec 2019 13:45:09 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b8so32629982edx.7
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 05:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QFjUOudYztBNS7SkHKdDopceUsCqrsMd9arQJKNC91s=;
 b=eeTd61vLVQW/f/BgPb2dW/yWsiupCXpx1mzMH9owGRwm+BPHrs3+Ef9Rm9YRx7vTcC
 SM7xSD7yeRUjh/507WueKpvjMtMbulBf5U/pgGM1IbGo2RcMND2Y5W32IkTvrae00DmH
 iYV+mVNqXXkRqszfLE5X36DShvryShaQu46Bg+z07J3o3j4aVIHqCNUJPnEekWG3yWSB
 46kpHWsFta92RXprbdozGKHmWOktz8fOvQ5dj9QSNzkem+rfsEg5QCauBzELMFz4bUfy
 JV/jK8kHb2GNLNtRBdUrXQH130CypMpxiXjk+i9Typ8qpoD/j9ebFMaKF4fimcMXSod5
 AU5A==
X-Gm-Message-State: APjAAAUuB17VarPXhNnw9oarQz8YSio+z4YHC7+cEimzspy2aYRzYL6X
 fBsU/fj4ewge5sp4/LE0XcM=
X-Google-Smtp-Source: APXvYqysyFweEJHCp8OlKj2Wabqx2d/PisbGtVp3/ScpYPbpMiVlDxi2g1n6XnQwd7U9eEmTQ34dkw==
X-Received: by 2002:aa7:cd7c:: with SMTP id
 ca28mr71651872edb.101.1577713508740; 
 Mon, 30 Dec 2019 05:45:08 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id u26sm5580035ejj.7.2019.12.30.05.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 05:45:08 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191227134516.15530-1-andrew.cooper3@citrix.com>
 <b190ca53-3541-438f-7a61-723a51e0d57d@xen.org>
 <967aad91-812f-3178-e8f5-1b787127ee8d@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7b5aa597-1cc9-a601-4eec-a6400a312cfc@xen.org>
Date: Mon, 30 Dec 2019 13:45:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <967aad91-812f-3178-e8f5-1b787127ee8d@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Reposition build_pre() logic
 between architectures
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
 Jan Beulich <JBeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAzMC8xMi8yMDE5IDEzOjM4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDMwLzEy
LzIwMTkgMTM6MTUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgQW5kcmV3LAo+Pgo+PiBPbiAy
Ny8xMi8yMDE5IDEzOjQ1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gVGhlIGNhbGwgdG8geGNf
ZG9tYWluX2Rpc2FibGVfbWlncmF0ZSgpIGlzIG1hZGUgb25seSBmcm9tIHg4Niwgd2hpbGUgaXRz
Cj4+PiBoYW5kbGluZyBpbiBYZW4gaXMgY29tbW9uLsKgIE1vdmUgaXQgdG8gdGhlIGxpYnhsX19i
dWlsZF9wcmUoKS4KPj4+Cj4+PiBodm1fc2V0X2NvbmZfcGFyYW1zKCksIGh2bV9zZXRfdmlyaWRp
YW5fZmVhdHVyZXMoKSwKPj4+IGh2bV9zZXRfbWNhX2NhcGFiaWxpdGllcygpLCBhbmQgdGhlIGFs
dHAybSBsb2dpYyBpcyBhbGwgaW4gY29tbW9uCj4+PiBjb2RlIChwYXJ0cyBpZmRlZidkKSBidXQg
ZGVzcGl0ZSB0aGlzLCBpcyBhbGwgYWN0dWFsbHkgeDg2IHNwZWNpZmljLgo+Pgo+PiBXaGlsZSBh
bHRwMm0gaXMgb25seSBzdXBwb3J0ZWQgb24geDg2LCB0aGUgY29uY2VwdCBpcyBub3QKPj4geDg2
LXNwZWNpZmljLiBJIGFtIGFjdHVhbGx5IGF3YXJlIG9mIHBlb3BsZSB1c2luZyBhbHRwMm0gb24g
QXJtLAo+PiBhbHRob3VnaHQgdGhlIHN1cHBvcnQgaXMgbm90IHVwc3RyZWFtIHlldC4KPj4KPj4+
Cj4+PiBNb3ZlIGl0IGludG8geDg2IHNwZWNpZmljIGNvZGUsIGFuZCBmb2xkIGFsbCBvZiB0aGUK
Pj4+IHhjX2h2bV9wYXJhbV9zZXQoKSBjYWxscwo+Pj4gdG9nZXRoZXIgaW50byBodm1fc2V0X2Nv
bmZfcGFyYW1zKCkgaW4gYSBmYXIgbW9yZSBjb2hlcmVudCB3YXkuCj4+Pgo+Pj4gRmluYWxseSAt
IGVuc3VyZSB0aGF0IGFsbCBoeXBlcmNhbGxzIGhhdmUgdGhlaXIgcmV0dXJuIHZhbHVlcyBjaGVj
a2VkLgo+Pj4KPj4+IE5vIHByYWN0aWNhbCBjaGFuZ2UgaW4gY29uc3RydWN0ZWQgZG9tYWlucy7C
oCBGZXdlciB1c2VsZXNzIGh5cGVyY2FsbHMKPj4+IG5vdyB0bwo+Pj4gY29uc3RydWN0IGFuIEFS
TSBndWVzdC4KPj4KPj4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIGtlZXAgYW55dGhpbmcg
dGhhdCB3ZSBrbm93IGNhbiBiZSB1c2VkIG9uCj4+IGFybSAob3IgbmV3IGFyY2hpdGVjdHVyZSkg
aW4gY29tbW9uIGNvZGUuIEkgYW0gdGhpbmtpbmcgYWJvdXQKPj4gIm5lc3RlZGh2bSIgYW5kICJh
bHRwMm0iLgo+IAo+IE5laXRoZXIgb2YgdGhvc2Ugb3B0aW9ucyBhcmUgZ29pbmcgdG8gc3Vydml2
ZSBpbiB0aGlzIGZvcm0uCgpPaCwgaXQgd2Fzbid0IGNsZWFyIGZyb20gdGhlIGNvbW1pdCBtZXNz
YWdlLiBXb3VsZCB5b3UgbWluZCB0byBhZGQgYSAKc2VudGVuY2UgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIGFib3V0IGl0PwoKPiAKPiBBbHNvLCB0aGUgY2hlY2tzIGNhbid0IHN0YXkgaW4gY29tbW9u
IGNvZGUuwqAgQ3VycmVudGx5LCBYZW4gZG9lc24ndAo+IHJlamVjdCBiYWQgcGFyYW1ldGVycywg
YW5kIHRoZSB0b29sc3RhY2sgZG9lc24ndCBjaGVjayByZXR1cm4gdmFsdWVzLgo+IEZyYW5rbHks
IG5laXRoZXIgb2YgdGhlc2UgYnVncyBzaG91bGQgZXZlciBoYXZlIGdvdCB0aHJvdWdoIGNvZGUg
cmV2aWV3LAo+IHNlZWluZyBhcyB3ZSB3ZXJlIGRvaW5nIHJhdGhlciBiZXR0ZXIgY29kZSByZXZp
ZXcgYnkgdGhlIHRpbWUgdGhlIEFSTQo+IHBvcnQgY2FtZSBhYm91dC4KClRoZSBIVk1fUEFSQU0g
aXMgbm90IGdyZWF0IG9uIEFybSA6KC4gSXQgd291bGQgYmUgbmljZSB0byBnZXQgdGhpcyBmaXhl
ZCAKcHJvcGVybHkuCgo+IAo+IEkndmUgZml4ZWQgdGhlIGxpYnhsIGNvZGUgdG8gY2hlY2sgcmV0
dXJuIHZhbHVlcywgYnV0IHdoZW4gdGhlCj4gaHlwZXJ2aXNvciBoYXMgaXRzCj4gIm5vdC1xdWl0
ZS1hbi1YU0EtYmVjYXVzZS10aGUtZ3Vlc3QtaW5kdWNlZC1kYW1hZ2UtaXMtaW4tdW5zdXBwb3J0
ZWQtc3Vic3lzdGVtcyIKPiBidWdzIGZpeGVkLCB0aGVzZSBoeXBlcmNhbGxzIHdpbGwgc3RhcnQg
ZmFpbGluZy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
