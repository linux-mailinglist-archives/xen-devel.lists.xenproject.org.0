Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC412F6E9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 11:55:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKZN-00005M-8q; Fri, 03 Jan 2020 10:52:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpWN=2Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1inKZL-00005B-CP
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 10:52:39 +0000
X-Inumbo-ID: 236b74da-2e17-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 236b74da-2e17-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 10:52:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so42023502wrw.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 02:52:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0KlLGlyrModO+JbGsZkNUaoL/i7JnqzJNuYyW6EEXWY=;
 b=OhnQjfhcNATkhPLeVnHn4td3F91h80MkRpXJMmE5XAUDp9mZ9B1foVMEISXF3yrPjx
 uW0IGZA8BTBo27LJ7G7damS7SkSTwnOq49DcsOdccUA9JOdkGi2JzXAGd3Svrd7IO/5v
 Ir76uqrr5wosNGx6JMs51fSxvW1vrCCwvxcbHH0pdIYkY+AcNb0nhFmQk59B9xJUTJLD
 YaZ/aT3Y/nhVHG67zOa1IF3G3w+gIlzdctJox9clNq1cEODmB7oug/059dwCryfata90
 km//p9wWmX5ts/YWfEDsnt1y6nq2ILDJlqbMjGXQdD3KUgQIUq5z/qSr+smJ5u3QPgg5
 hspw==
X-Gm-Message-State: APjAAAWSZf8GC2T5vdZrYzX26KaV40/JCLGWmPQDZfJfekhY9w9kxuNi
 NSyW+sjJXSjdPPcDIR+M72o=
X-Google-Smtp-Source: APXvYqwogHbacnu2KpAIeg1CjX29TYkLTdVbN5FPMFZ/+scIvOUIQeTlq9H4IO/AEQZlMDRHnZGGbA==
X-Received: by 2002:adf:f491:: with SMTP id l17mr85965499wro.149.1578048749831; 
 Fri, 03 Jan 2020 02:52:29 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id k11sm11390230wmc.20.2020.01.03.02.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 02:52:29 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191227134516.15530-1-andrew.cooper3@citrix.com>
 <b190ca53-3541-438f-7a61-723a51e0d57d@xen.org>
 <967aad91-812f-3178-e8f5-1b787127ee8d@citrix.com>
 <7b5aa597-1cc9-a601-4eec-a6400a312cfc@xen.org>
 <3139d26f-62e1-6afe-822a-75fb2144ca5c@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ad9bab74-307b-37db-45ba-4db09237a7e0@xen.org>
Date: Fri, 3 Jan 2020 10:52:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <3139d26f-62e1-6afe-822a-75fb2144ca5c@citrix.com>
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

SGkgQW5kcmV3LAoKT24gMDIvMDEvMjAyMCAxNzo0MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAzMC8xMi8yMDE5IDEzOjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAz
MC8xMi8yMDE5IDEzOjM4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMzAvMTIvMjAxOSAx
MzoxNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEhpIEFuZHJldywKPj4+Pgo+Pj4+IE9uIDI3
LzEyLzIwMTkgMTM6NDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IFRoZSBjYWxsIHRvIHhj
X2RvbWFpbl9kaXNhYmxlX21pZ3JhdGUoKSBpcyBtYWRlIG9ubHkgZnJvbSB4ODYsCj4+Pj4+IHdo
aWxlIGl0cwo+Pj4+PiBoYW5kbGluZyBpbiBYZW4gaXMgY29tbW9uLsKgIE1vdmUgaXQgdG8gdGhl
IGxpYnhsX19idWlsZF9wcmUoKS4KPj4+Pj4KPj4+Pj4gaHZtX3NldF9jb25mX3BhcmFtcygpLCBo
dm1fc2V0X3ZpcmlkaWFuX2ZlYXR1cmVzKCksCj4+Pj4+IGh2bV9zZXRfbWNhX2NhcGFiaWxpdGll
cygpLCBhbmQgdGhlIGFsdHAybSBsb2dpYyBpcyBhbGwgaW4gY29tbW9uCj4+Pj4+IGNvZGUgKHBh
cnRzIGlmZGVmJ2QpIGJ1dCBkZXNwaXRlIHRoaXMsIGlzIGFsbCBhY3R1YWxseSB4ODYgc3BlY2lm
aWMuCj4+Pj4KPj4+PiBXaGlsZSBhbHRwMm0gaXMgb25seSBzdXBwb3J0ZWQgb24geDg2LCB0aGUg
Y29uY2VwdCBpcyBub3QKPj4+PiB4ODYtc3BlY2lmaWMuIEkgYW0gYWN0dWFsbHkgYXdhcmUgb2Yg
cGVvcGxlIHVzaW5nIGFsdHAybSBvbiBBcm0sCj4+Pj4gYWx0aG91Z2h0IHRoZSBzdXBwb3J0IGlz
IG5vdCB1cHN0cmVhbSB5ZXQuCj4+Pj4KPj4+Pj4KPj4+Pj4gTW92ZSBpdCBpbnRvIHg4NiBzcGVj
aWZpYyBjb2RlLCBhbmQgZm9sZCBhbGwgb2YgdGhlCj4+Pj4+IHhjX2h2bV9wYXJhbV9zZXQoKSBj
YWxscwo+Pj4+PiB0b2dldGhlciBpbnRvIGh2bV9zZXRfY29uZl9wYXJhbXMoKSBpbiBhIGZhciBt
b3JlIGNvaGVyZW50IHdheS4KPj4+Pj4KPj4+Pj4gRmluYWxseSAtIGVuc3VyZSB0aGF0IGFsbCBo
eXBlcmNhbGxzIGhhdmUgdGhlaXIgcmV0dXJuIHZhbHVlcyBjaGVja2VkLgo+Pj4+Pgo+Pj4+PiBO
byBwcmFjdGljYWwgY2hhbmdlIGluIGNvbnN0cnVjdGVkIGRvbWFpbnMuwqAgRmV3ZXIgdXNlbGVz
cyBoeXBlcmNhbGxzCj4+Pj4+IG5vdyB0bwo+Pj4+PiBjb25zdHJ1Y3QgYW4gQVJNIGd1ZXN0Lgo+
Pj4+Cj4+Pj4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIGtlZXAgYW55dGhpbmcgdGhhdCB3
ZSBrbm93IGNhbiBiZSB1c2VkIG9uCj4+Pj4gYXJtIChvciBuZXcgYXJjaGl0ZWN0dXJlKSBpbiBj
b21tb24gY29kZS4gSSBhbSB0aGlua2luZyBhYm91dAo+Pj4+ICJuZXN0ZWRodm0iIGFuZCAiYWx0
cDJtIi4KPj4+Cj4+PiBOZWl0aGVyIG9mIHRob3NlIG9wdGlvbnMgYXJlIGdvaW5nIHRvIHN1cnZp
dmUgaW4gdGhpcyBmb3JtLgo+Pgo+PiBPaCwgaXQgd2Fzbid0IGNsZWFyIGZyb20gdGhlIGNvbW1p
dCBtZXNzYWdlLiBXb3VsZCB5b3UgbWluZCB0byBhZGQgYQo+PiBzZW50ZW5jZSBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UgYWJvdXQgaXQ/Cj4gCj4gV2VsbCAtIHRoZXkgYXJlbid0IGdvaW5nIHRvIHN1
cnZpdmUgbG9uZy10ZXJtIGluIHRoaXMgZm9ybS7CoCBCb3RoIG5lZWQKPiB0byBiZWNvbWUgZG9t
YWluX2NyZWF0ZSBwYXJhbWV0ZXJzLgo+IAo+IFdoZXRoZXIgb3Igbm90IHRoZXkgYWN0dWFsbHkg
Z2V0IGNoYW5nZWQgYmVmb3JlIHNvbWVvbmUgdHJpZXMKPiB1cHN0cmVhbWluZyB0aGUgQVJNIEFs
dHAybSB3b3JrIGlzIGEgZGlmZmVyZW50IG1hdHRlciwgaWYgdGhhdCBhZmZlY3RzCj4geW91ciBh
bnN3ZXIuCgpJIGFtIGhhcHB5IHdpdGggIlRoZXkgc2hvdWxkIG5vdCBzdXJ2aXZlIi4gSWYgdGhl
IGFsdHAybSB3b3JrIGlzIAp1cHN0cmVhbWVkIGZpcnN0IHRoZW4gd2UgY2FuIGhhdmUgdGhlIGRp
c2N1c3Npb24gd2hldGhlciB3ZSBzaG91bGQgY2FycnkgCiJsZWdhY3kiIGludGVyZmFjZSBpZiB0
aGlzIHdhc24ndCByZXdvcmtlZCBiZWZvcmVoYW5kLgoKPiAKPj4KPj4+Cj4+PiBBbHNvLCB0aGUg
Y2hlY2tzIGNhbid0IHN0YXkgaW4gY29tbW9uIGNvZGUuwqAgQ3VycmVudGx5LCBYZW4gZG9lc24n
dAo+Pj4gcmVqZWN0IGJhZCBwYXJhbWV0ZXJzLCBhbmQgdGhlIHRvb2xzdGFjayBkb2Vzbid0IGNo
ZWNrIHJldHVybiB2YWx1ZXMuCj4+PiBGcmFua2x5LCBuZWl0aGVyIG9mIHRoZXNlIGJ1Z3Mgc2hv
dWxkIGV2ZXIgaGF2ZSBnb3QgdGhyb3VnaCBjb2RlIHJldmlldywKPj4+IHNlZWluZyBhcyB3ZSB3
ZXJlIGRvaW5nIHJhdGhlciBiZXR0ZXIgY29kZSByZXZpZXcgYnkgdGhlIHRpbWUgdGhlIEFSTQo+
Pj4gcG9ydCBjYW1lIGFib3V0Lgo+Pgo+PiBUaGUgSFZNX1BBUkFNIGlzIG5vdCBncmVhdCBvbiBB
cm0gOiguIEl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IHRoaXMKPj4gZml4ZWQgcHJvcGVybHkuCj4g
Cj4gSSBsb29rZWQgYmFjayBhdCBteSBwYXRjaCBzZXJpZXMgZG9pbmcganVzdCB0aGlzLCBhbmQg
ZGVzcGl0ZSBiZWluZyBhCj4geWVhciBvbGQsIEknbSBzdGlsbCBzdWZmaWNpZW50bHkgaXJyaXRh
dGVkIGF0IHRoZSBuaXRwaWNraW5nIGFuZAo+IGluYWJpbGl0eSB0byByZWFkL2ludGVycHJldCBD
T0RJTkdfU1RZTEUgdGhhdCBJIGRvbid0IGZlZWwgbGlrZSB3YXN0aW5nCj4gYW55IG1vcmUgb2Yg
bXkgdGltZSByaWdodCBub3cuCgpTb3JyeSB0byBoZWFyIHRoYXQuIEkgaGF2ZSBwdXQgdGhlIHdv
cmsgaW4gbXkgdHJhY2tpbmcgbGlzdCBmb3IgQXJtLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
