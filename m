Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86634129996
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 18:53:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijRqP-0003vU-KF; Mon, 23 Dec 2019 17:50:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I8bJ=2N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ijRqO-0003vP-4o
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 17:50:12 +0000
X-Inumbo-ID: aa868d6a-25ac-11ea-9710-12813bfff9fa
Received: from mail-qv1-f67.google.com (unknown [209.85.219.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa868d6a-25ac-11ea-9710-12813bfff9fa;
 Mon, 23 Dec 2019 17:50:11 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id p2so6609707qvo.10
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 09:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iAyepYx5N1sX2Vx+gScHnU3/i+kex4ugT8HJ+jNCUQc=;
 b=UJpwh3MEyG6rUylxbpbfZOQSnQHDjfo8dmQQUChqOhIbNdlgr3gR0ieefcqKeWNCrf
 OonD25jh0bAKA3w8WM6QHAIRQ6he1Hz7h1YSsZTWkJz27V/bWSXjRiYxUu5q+ZTy/Xj/
 PoyDXCcj+pdb8+KK+rfy7Yv7fekxDoZcgJ1xPCz5qqU2BYjuN/tQdlde35W5Kd0ijxep
 8pTDCYSderFLV4pF/Mr5jg+aWj+VkCC/x4e9H9vplBJeg93WMCjZ//1jHomfHxy7nAEZ
 4E4qNJjUpt+h1y6dWJvSuTSgGFLEHe63WCFxVwZpZaKffNpvo/bFeHJIizK9nyPSQXPm
 0D6A==
X-Gm-Message-State: APjAAAXmhfE831z5B+LEESN/HnmMyPEI1j0OiMaumCaIulWnuipjxq3Y
 Gs80gWU7X9lx4eQgSVm01Og=
X-Google-Smtp-Source: APXvYqydH/sA37xXexAv3kmmeCMVHvbwbIu/NDMpUa05cET6O5SsUsiy0clOPEnXsHDeZ8/JwHqqCg==
X-Received: by 2002:a0c:b920:: with SMTP id u32mr24368835qvf.173.1577123411094; 
 Mon, 23 Dec 2019 09:50:11 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id v67sm3376664qkh.46.2019.12.23.09.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2019 09:50:09 -0800 (PST)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20191218144133.16089-1-pdurrant@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e3c1c2bc-5eb8-4ccf-c4d4-8af25facc680@xen.org>
Date: Mon, 23 Dec 2019 18:50:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191218144133.16089-1-pdurrant@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] x86/hvm/rtc: preserved guest RTC offset
 during suspend/resume/migrate
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDE4LzEyLzIwMTkgMTU6NDEsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGUg
ZW11bGF0ZWQgUlRDIGlzIHN5bmNocm9uaXplZCB3aXRoIHRoZSBQViB3YWxsY2xvY2s7IGFueSB3
cml0ZSB0byB0aGUKPiBSVEMgd2lsbCB1cGRhdGUgc3RydWN0IGRvbWFpbidzICd0aW1lX29mZnNl
dF9zZWNvbmRzJyBmaWVsZCBhbmQgY2FsbAo+IHVwZGF0ZV9kb21haW5fd2FsbGNsb2NrKCkuCj4g
Cj4gSG93ZXZlciwgdGhlIHZhbHVlIG9mICd0aW1lX29mZnNldF9zZWNvbmRzJyBpcyBub3QgcHJl
c2VydmVkIGluIGFueSBzYXZlCj4gcmVjb3JkIGFuZCBpbmRlZWQsIHdoZW4gdGhlIFJUQyBzYXZl
IHJlY29yZCBpcyBsb2FkZWQsIHRoZSBDTU9TIHZhbHVlcwo+IHdpbGwgYmUgdXBkYXRlZCBiYXNl
ZCBvbiBhbiBvZmZzZXQgdmFsdWUgd2hpY2ggbWF5IG9yIG1heSBub3QgaGF2ZSBiZWVuCj4gc2V0
IGJ5IHRoZSB0b29sc3RhY2sgWzFdLiBUaGlzIG1heSByZXN1bHQgaW4gbWFraW5nIGJvZ3VzIHZh
bHVlcyBhdmFpbGFibGUKPiB0byB0aGUgZ3Vlc3QgYW5kIG1lc3NpbmcgdXAgYW55IGNhbGN1bGF0
aW9ucyBkb25lIGluIHRoZSBjYWxsIHRvCj4gYWxhcm1fdGltZXJfdXBkYXRlKCkgYXQgdGhlIGVu
ZCBvZiBydGNfbG9hZCgpLgo+IAo+IFRoaXMgcGF0Y2ggZXh0ZW5kcyB0aGUgUlRDIHNhdmUgcmVj
b3JkIHRvIGNvbnRhaW4gYW4gb2Zmc2V0IHZhbHVlLCB3aGljaAo+IHdpbGwgYmUgemVybyBmaWxs
ZWQgb24gbG9hZCBvZiBhbiBvbGRlciByZWNvcmQuIFRoZSAndGltZV9vZmZzZXRfc2Vjb29uZHMn
Cj4gZmllbGQgaW4gc3RydWN0IGRvbWFpbiBpcyBhbHNvIG1vZGlmaWVkIGludG8gYSAndGltZV9v
ZmZzZXQnIHN0cnVjdCwKPiBjb250YWluaW5nIGEgJ3NlY29uZHMnIGZpZWxkIGFuZCBhIGJvb2xl
YW4gJ3NldCcgZmllbGQuCj4gCj4gVGhlIGNvZGUgaW4gcnRjX2xvYWQoKSB0aGVuIHVzZXMgdGhl
IG5ldyB2YWx1ZSBpbiB0aGUgc2F2ZSByZWNvcmQgdG8KPiB1cGRhdGUgdGhlIHZhbHVlIG9mIHN0
cnVjdCBkb21haW4ncyAndGltZV9vZmZzZXQuc2Vjb25kcycgdW5sZXNzCj4gJ3RpbWVfb2Zmc2V0
LnNldCcgaXMgdHJ1ZSwgd2hpY2ggd2lsbCBvbmx5IGJlIHRoZSBjYXNlIGlmIHRoZSB0b29sc3Rh
Y2sgaGFzCj4gYWxyZWFkeSBwZXJmb3JtZWQgYSBYRU5fRE9NQ1RMX3NldHRpbWVvZmZzZXQuCj4g
Cj4gWzFdIFRoZXJlIGlzIGN1cnJlbnRseSBubyB3YXkgZm9yIGEgdG9vbHN0YWNrIHRvIHJlYWQg
dGhlIHZhbHVlIG9mCj4gICAgICAndGltZV9vZmZzZXRfc2Vjb25kcycgZnJvbSBzdHJ1Y3QgZG9t
YWluLiBJbiB0aGUgcGFzdCwgYW55IGhvcGUgb2YKPiAgICAgIHByZXNlcnZhdGlvbiBvZiB0aGUg
dmFsdWUgYWNyb3NzIGEgZ3Vlc3QgbGlmZS1jeWNsZSBvcGVyYXRpb24gd2FzIGJhc2VkCj4gICAg
ICBvbiByZWx5aW5nIG9uIHFlbXUtZG0gdG8gd3JpdGUgYSB2YWx1ZSBpbnRvIHhlbnN0b3JlIHdo
ZW5ldmVyIHRoZSBSVEMKPiAgICAgIHdhcyB1cGRhdGVkLCBpbiByZXNwb25zZSB0byBhbiBJT1JF
USB3aXRoIHR5cGUgSU9SRVFfVFlQRV9USU1FT0ZGU0VUCj4gICAgICBiZWluZyBzZW50IGJ5IFhl
bjsgc2VlOgo+IAo+ICAgICAgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXFlbXUt
eGVuLXRyYWRpdGlvbmFsLmdpdDthPWJsb2I7Zj1pMzg2LWRtL2hlbHBlcjIuYyNsNDU3Cj4gCj4g
ICAgICBidXQgdGhpcyBiZWhhdmlvdXIgd2FzIG5ldmVyIGZvcndhcmQtcG9ydGVkIGludG8gdXBz
dHJlYW0gUUVNVSwgd2hpY2gKPiAgICAgIGNvbXBsZXRlbHkgaWdub3JlcyB0aGF0IElPUkVRIHR5
cGUuCj4gICAgICBJbiBlaXRoZXIgY2FzZSwgbm90aGluZyBpbiB4bCBvciBsaWJ4bCBldmVyIHNh
bXBsZXMgdGhlIHZhbHVlIG9mCj4gICAgICBSVEMgb2Zmc2V0IGZyb20geGVuc3RvcmUgc28gYW55
IG9mZnNldCBhZGp1c3RtZW50IHRvIGEgbm9uLXplcm8gdmFsdWUKPiAgICAgIHBlcmZvcm1lZCBi
eSB0aGUgZ3Vlc3QgKHdoaWNoIGluIHRoZSBjYXNlIG9mIFdpbmRvd3MgaXMgaGlnaGx5IGxpa2Vs
eQo+ICAgICAgYXMgaXQgbm9ybWFsbHkgd3JpdGVzIFJUQyBpbiBsb2NhbCB0aW1lLCB3aGVyZWFz
IFhlbiBtYWludGFpbnMgdGltZSBpbgo+ICAgICAgVVRDKSBpcyBjb21wbGV0ZWx5IGxvc3Qgd2l0
aCB0aGUgZGUtZmFjdG8gdG9vbHN0YWNrLCBhbmQgYWx3YXlzIGhhcwo+ICAgICAgYmVlbi4gSW5z
dGVhZCwgUFYgZHJpdmVycyBhcmUgcmVsaWVkIHVwb24gdG8gcGFwZXIgb3ZlciB0aGlzIGdhcGlu
Zwo+ICAgICAgaG9sZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50
QGFtYXpvbi5jb20+Cj4gLS0tCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPiBDYzogVm9s
b2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgo+IENjOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Q2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9wbGF0Zm9ybV9oeXBlcmNhbGwuYyAg
ICAgIHwgIDIgKy0KPiAgIHhlbi9hcmNoL2FybS90aW1lLmMgICAgICAgICAgICAgICAgICAgIHwg
IDMgKystCj4gICB4ZW4vYXJjaC9hcm0vdnRpbWVyLmMgICAgICAgICAgICAgICAgICB8ICA0ICsr
LS0KClRoZSBBcm0gY2hhbmdlcyBsb29rcyBtb3N0bHkgbWVjaGFuaWNhbDoKCkFja2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
