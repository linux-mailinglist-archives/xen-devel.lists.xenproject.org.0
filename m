Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30734107FB1
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 18:58:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYZdE-0006Tg-8Z; Sat, 23 Nov 2019 17:55:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j6pY=ZP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iYZdD-0006Tb-DF
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 17:55:39 +0000
X-Inumbo-ID: 74e261ec-0e1a-11ea-a37e-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74e261ec-0e1a-11ea-a37e-12813bfff9fa;
 Sat, 23 Nov 2019 17:55:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id j18so12712947wmk.1
 for <xen-devel@lists.xenproject.org>; Sat, 23 Nov 2019 09:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MdNIZmMC/Dk/JS9ERS58uJUqcJz5BWqjkY0V2xLPWDg=;
 b=bq28FlmYU/Sdzo7SxV4wimGrJbEOJz7RGNavDvPDhpR9w/WJSLdmlMl2AZmHGe5czY
 a3YduOiNWW5g5OViSMzY2unnYmvenpAGEx9bGnddTDAqXGBMVLxGHj3MDoLsm8VLm/Kq
 n5itAV5stwlhA5UM5EZG5ZrrNUMyTfb4TwCzYnSX6+DsCFG+Xfq67arJUkAjytbZhfwk
 4dSGcyuBqHrErl9UyYaEz9gpmUPEfu8mDSwrpfvlHopu6SVxuwEdnY/jWraxVoJshVDA
 Rw5pkOuilpgl356Awf5cYoUgBUccTC/QOzZXm21DMP/ayKO4xMPubEXwiIdB4SSx3nb5
 wRSA==
X-Gm-Message-State: APjAAAWy7EVyO3nxwTeEJmImyiBPcPsMHkNjIdTj1qAlJ+9YMID9kWw0
 1xXSQOsiLgZSX9fthSchDXM=
X-Google-Smtp-Source: APXvYqxcxsOC8h6WSDzj2I+V40qJUtk1uuXYJxxxV73mcA6UurEFFI1ropvZiOHHQdktkH8MyxOaaA==
X-Received: by 2002:a1c:3d08:: with SMTP id k8mr21059996wma.119.1574531737763; 
 Sat, 23 Nov 2019 09:55:37 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id 65sm3057147wrs.9.2019.11.23.09.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Nov 2019 09:55:37 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
 <f2232cd2-4786-2b8e-d649-0635309edb92@suse.com>
 <480f4d49-0a5f-c011-a5b8-85a9fc6352af@xen.org>
 <48afa07d-8219-3a2e-45eb-e3dec2bcb89e@suse.com>
 <ae71b47b-3fcf-01c5-5bc8-83948c2f209b@xen.org>
 <cdc1afc7-46b4-63dc-6844-16ab40b97229@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5f526fe9-5fa3-5748-93d3-6b2457b67fa2@xen.org>
Date: Sat, 23 Nov 2019 17:55:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cdc1afc7-46b4-63dc-6844-16ab40b97229@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 1/2] introduce GFN notification for
 translated domains
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjEvMTEvMjAxOSAxMDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjEu
MTEuMjAxOSAxMTowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMS8xMS8yMDE5
IDA5OjA0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDIwLjExLjIwMTkgMjE6MjIsIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+PiBPbiAxNC8xMS8yMDE5IDE2OjQzLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4gVEJEOiBEb2VzIEFybSBhY3R1YWxseSBoYXZlIGFueXRoaW5nIHRvIGNoZWNrIGFn
YWluc3QgaW4gaXRzCj4+Pj4+ICAgICAgICAgYXJjaF9ub3RpZnlfZ2ZuKCk/Cj4+Pj4KPj4+PiBJ
IHVuZGVyc3RhbmQgdGhhdCB3ZSB3YW50IHRvIGtlZXAgdGhlIGNvZGUgbW9zdGx5IGdlbmVyaWMs
IGJ1dCBJIGFtIGEKPj4+PiBiaXQgY29uY2VybmVkIG9mIHRoZSBleHRyYSBjb3N0IHRvIHVzZSBu
b3RpZnlfZ2ZuKCkgKGFuZCBpbmRpcmVjdGx5Cj4+Pj4gaW9tbXVfbm90aWZ5X2dmbigpKSBmb3Ig
ZG9pbmcgbm90aGluZy4KPj4+Pgo+Pj4+IEkgY2FuJ3Qgc2VlIGFueSBkaXJlY3QgdXNlIG9mIHRo
aXMgZm9yIHRoZSBmb3Jlc2VhYmxlIGZ1dHVyZSBvbiBBcm0uIFNvCj4+Pj4gY291bGQgd2UgZ2F0
ZSB0aGlzIHVuZGVyIGEgY29uZmlnIG9wdGlvbj8KPj4+Cj4+PiBUaGlzIGlzIGFuIG9wdGlvbiwg
c3VyZS4gQWx0ZXJuYXRpdmVseSBJIGNvdWxkIHNlZSBhYm91dCBtYWtpbmcgdGhpcwo+Pj4gYW4g
aW5saW5lIGZ1bmN0aW9uLCBidXQgaWlyYyB0aGVyZSB3ZXJlIGhlYWRlciBkZXBlbmRlbmN5IGlz
c3Vlcy4KPj4+IFRoZW4gYWdhaW4gLSBpcyBhIGNhbGwgdG8gYSBmdW5jdGlvbiBkb2luZyBhbG1v
c3Qgbm90aGluZyByZWFsbHkgc28KPj4+IG11Y2ggZXh0cmEgb3ZlcmhlYWQgb24gQXJtLgo+Pgo+
PiBBRkFJQ1QsIHRoaXMgaXMgYSB3b3JrYXJvdW5kIGZvciBBTUQgZHJpdmVyLiBTbyBhbnkgaW1w
YWN0IChubyBtYXR0ZXIKPj4gdGhlIHNpemUpIGZlZWxzIG5vdCByaWdodCBmb3IgQXJtLgo+Pgo+
PiBJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIG9ubHkgdGhpbmcgSSByZXF1ZXN0IGlzIHRv
IHByb3RlY3QgdGhlCj4+IG5vdGlmeV9nZm4gJiBjYWxsYmFjayB3aXRoICFDT05GSUdfSU9NTVVf
Rk9SQ0VfU0hBUkUuCj4gCj4gT2gsIHRoZXJlIGFscmVhZHkgaXMgYSBzdWl0YWJsZSBjb25maWcg
b3B0aW9uLiBXaWxsIGRvIChhbmQKPiBjb3ZlciBzaGFyZV9wMm1fdGFibGUoKSBhdCB0aGUgc2Ft
ZSB0aW1lKS4KPiAKPj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+Pj4+ICsr
KyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+Pj4+PiBAQCAtOTQ2LDYgKzk0NiwxNiBAQCBt
YXBfZ3JhbnRfcmVmKAo+Pj4+PiAgICAgICAgICAgICByZXR1cm47Cj4+Pj4+ICAgICAgICAgfQo+
Pj4+PiAgICAgCj4+Pj4+ICsgICAgaWYgKCBwYWdpbmdfbW9kZV90cmFuc2xhdGUobGQpIC8qICYm
IChvcC0+ZmxhZ3MgJiBHTlRNQVBfaG9zdF9tYXApICovICYmCj4+Pj4KPj4+PiBJIHRoaW5rIHRo
aXMgd2FudHMgYW4gZXhwbGFuYXRpb24gaW4gdGhlIGNvZGUgd2h5IHRoZSBjaGVjayBpcyBjb21t
ZW50ZWQuCj4+Pgo+Pj4gSG1tLCBpbiBzdWNoIGEgY2FzZSBJJ2QgcmF0aGVyIG9taXQgdGhlIGNv
bW1lbnRlZCBjb25kaXRpb24uIEl0Cj4+PiBiZWluZyBjb21tZW50ZWQgaGFzIHRoZSBwdXJwb3Nl
IG9mIGRvY3VtZW50aW5nIGl0c2VsZi4KPj4KPj4gSSBmYWlsIHRvIHVuZGVyc3RhbmQgd2h5IEdO
VE1BUF9ob3N0X21hcCB3b3VsZCBhbHdheXMgYmUgdHJ1ZSBpbiB0aGUgY2FzZS4KPj4KPj4gQUZB
SVUgdGhlIGNvZGUsIHRoaXMgaXMgb25seSBjb3JyZWN0IGZvciBwYWdpbmdfbW9kZV9leHRlcm5h
bChsZCkgPT0gMS4KPj4gRG9lcyBpdCBtZWFuIHRoYXQgcGFnaW5nX21vZGVfdHJhbnNsYXRlKGxk
KSBhbmQgcGFnaW5nX21vZGVfZXh0ZXJuYWwobGQpCj4+IGFyZSBhbHdheXMgZXF1YWw/IElmIHNv
LCB3aGF0J3MgdGhlIHBvaW50IG9mIGhhdmluZyB0d28gbWFjcm8gKGFuZCB0d28KPj4gZmxhZ3Mp
Pwo+IAo+IEhpc3RvcmljYWwgcmVhc29ucy4gTm93YWRheXMgdHJhbnNsYXRlID09IGV4dGVybmFs
ID09IHJlZmNvdW50cyBvbgo+IHg4Ni4gQnV0IHNpbmNlIHRoaXMgaXMgY29tbW9uIGNvZGUsIHBl
cmhhcHMgSSBiZXR0ZXIgdW4tY29tbWVudCB0aGF0Cj4gcGFydCBvZiB0aGUgY29uZGl0aW9uYWwu
CgpGb3IgdGhpcyBwYXRjaCwgdGhpcyB3b3VsZCBiZSB0aGUgaWRlYWwgc29sdXRpb24uCgpXZSBt
aWdodCB3YW50IHRvIGNvbnNpZGVyIHRvIHJlZHVjZSB0byBvbmUgbWFjcm8gKG1heWJlIApwYWdp
bmdfbW9kZV90cmFuc2xhdGUoKSkgaWYgd2UgZG9uJ3QgZXhwZWN0IG5ldyBhcmNoaXRlY3R1cmUg
dG8gcmV0dXJuIGEgCmRpZmZlcmVudCB2YWx1ZSBmb3IgdGhvc2UgMyBtYWNyb3MuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
