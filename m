Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9913ACF6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 16:03:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irNgL-0003p4-6O; Tue, 14 Jan 2020 15:00:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irNgJ-0003oz-Is
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 15:00:35 +0000
X-Inumbo-ID: 9d4340ec-36de-11ea-83d0-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d4340ec-36de-11ea-83d0-12813bfff9fa;
 Tue, 14 Jan 2020 15:00:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t2so12510807wrr.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 07:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DwwIyAcrLVKjjYVaAv7XDlp/jlZLb77GT+xAQQ2po5A=;
 b=S8MAglHhFupb/kqBH58f52F1qUJodSmtftCDqx67sWRaeSg8z0l/R8RN2DAOm1XKpV
 GX/hiloRf4zVdlGgu6jK6h8Fk5i5xZl11aBYCmAijoUbp93B9Vew6oyWxkufdrBAvwRC
 UkJuF5surIc8KFbLc4RG3whBmLENQNtep1ZdUMIzFn5KLGxbTls/5+Y+8+oImktoxd/6
 PextO7GP9TmpQksGVHxh4xr4u/m3JUpYnBeOqiS+OfArHYRC8VXejxFpEP6FLN//P2gE
 JzCXOnIfkH6ibr9Qdjy0Mh0YuU7iRYnGhPVLYF/mjnWXtkHfM1WRs6CFS5f6IglTEvWJ
 cnoA==
X-Gm-Message-State: APjAAAVpkeEKgASONwcWGGOMQHJWIHE8+yEeUfcpPIy7DoDFz2PvtIJ7
 RNUHIqcxzk7GfDsCFudYEOw=
X-Google-Smtp-Source: APXvYqyV5L280zso6A5Dm/KV+riMPGqvqCGOnIc0saDpQ4DfhTyMbqBO0u02xJt0xML8TAiMKk+Rkg==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr22734631wrt.15.1579014033235; 
 Tue, 14 Jan 2020 07:00:33 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id v22sm18747489wml.11.2020.01.14.07.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 07:00:32 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Xia, Hongyan"
 <hongyax@amazon.com>
References: <dbdedd077330af79c13ba5ed38b0aec0b7128886.camel@infradead.org>
 <4e3b0050ff7a8d1e40015181026562211e75c401.camel@infradead.org>
 <1743ee7c-e238-8b77-d40f-bd0e3d6bb0ed@xen.org>
 <b24cf0a1b56f56167f51d5dd86fd81afb48a377c.camel@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <e49ed1b9-23cc-5c24-0b83-565a1d833de2@xen.org>
Date: Tue, 14 Jan 2020 15:00:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <b24cf0a1b56f56167f51d5dd86fd81afb48a377c.camel@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC PATCH 0/3] Live update boot memory management
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
 paul@xen.org, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC8wMS8yMDIwIDE0OjQ4LCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4gT24gVHVlLCAy
MDIwLTAxLTE0IGF0IDE0OjE1ICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIERhdmlk
LAo+Pgo+PiBPbiAxMy8wMS8yMDIwIDExOjU0LCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4+PiBP
biBXZWQsIDIwMjAtMDEtMDggYXQgMTc6MjQgKzAwMDAsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToK
Pj4+PiBTbyB3ZSd2ZSBzZXR0bGVkIG9uIGEgc2ltcGxlciBhcHByb2FjaCAC4oCUIHJlc2VydmUg
YSBjb250aWd1b3VzIHJlZ2lvbgo+Pj4+IG9mIHBoeXNpY2FsIG1lbW9yeSB3aGljaCAqd29uJ3Qq
IGJlIHVzZWQgZm9yIGRvbWFpbiBwYWdlcy4gTGV0IHRoZSBib290Cj4+Pj4gYWxsb2NhdG9yIHNl
ZSAqb25seSogdGhhdCByZWdpb24gb2YgbWVtb3J5LCBhbmQgcGx1ZyB0aGUgcmVzdCBvZiB0aGUK
Pj4+PiBtZW1vcnkgaW4gbGF0ZXIgb25seSBhZnRlciBkb2luZyBhIGZ1bGwgcGFzcyBvZiB0aGUg
bGl2ZSB1cGRhdGUgc3RhdGUuCj4+Cj4+IEl0IGlzIGEgYml0IHVuY2xlYXIgd2hhdCB0aGUgcmVn
aW9uIHdpbGwgYmUgdXNlZCBmb3IuIElmIHlvdSBwbGFuIHRvIHB1dAo+PiB0aGUgc3RhdGUgb2Yg
dGhlIFZNcyBpbiBpdCwgdGhlbiB5b3UgY2FuJ3QgcG9zc2libHkgdXNlIGl0IGZvciBib290Cj4+
IGFsbG9jYXRpb24gKGUuZyBmcmFtZXRhYmxlKSBvdGhlcndpc2UgdGhpcyBtYXkgYmUgb3Zlcndy
aXR0ZW4gd2hlbiBkb2luZwo+PiB0aGUgbGl2ZSB1cGRhdGUuCj4gCj4gUmlnaHQuIFRoaXMgaXMg
b25seSBmb3IgYm9vdCB0aW1lIGFsbG9jYXRpb25zIGJ5IFhlbiMyLCBiZWZvcmUgaXQncwo+IHBy
b2Nlc3NlZCB0aGUgTFUgZGF0YSBhbmQga25vd3Mgd2hpY2ggcGFydHMgb2YgdGhlIHJlc3Qgb2Yg
bWVtb3J5IGl0Cj4gY2FuIHVzZS4gSXQgYWxsb2NhdGVzIGl0cyBmcmFtZSB0YWJsZSBmcm9tIHRo
ZXJlLCBhcyB3ZWxsIGFzIGFueXRoaW5nCj4gZWxzZSBpdCBuZWVkcyB0byBhbGxvY2F0ZSBiZWZv
cmUvd2hpbGUgcHJvY2Vzc2luZyB0aGUgTFUgZGF0YS4KCkl0IHdvdWxkIGJlIHdvcnRoIGRvY3Vt
ZW50aW5nIHdoYXQgaXMgdGhlIGV4cGVjdGF0aW9uIG9mIHRoZSBidWZmZXIuIApNYXliZSBpbiB4
ZW4tY29tbWFuZC1saW5lIGFsb25nIHdpdGggdGhlIHJlc3Qgb2YgdGhlIG5ldyBvcHRpb24geW91
IAppbnRyb2R1Y2VkPyBPciBpbiBhIHNlcGFyYXRlIGRvY3VtZW50LgoKPiBBcyBhbiBpbXBsZW1l
bnRhdGlvbiBkZXRhaWwsIEkgYW50aWNpcGF0ZSB0aGF0IHdlJ2xsIGJlIHVzaW5nIHRoZSBib290
Cj4gYWxsb2NhdG9yIGZvciB0aGF0IGVhcmx5IHBhcnQgZnJvbSB0aGUgcmVzZXJ2ZWQgcmVnaW9u
LCBhbmQgdGhhdCB0aGUKPiBzd2l0Y2ggdG8gdXNpbmcgdGhlIGZ1bGwgYXZhaWxhYmxlIG1lbW9y
eSAobGVzcyB0aG9zZSBwYWdlcyBhbHJlYWR5IGluLQo+IHVzZSkgd2lsbCAqY29pbmNpZGUqIHdp
dGggc3dpdGNoaW5nIHRvIHRoZSByZWFsIGhlYXAgYWxsb2NhdG9yLgo+IAo+IFRoZSByZXNlcnZl
ZCByZWdpb24gKmlzbid0KiBmb3IgdGhlIExVIGRhdGEgaXRzZWxmLiBUaGF0IGNhbiBiZQo+IGFs
bG9jYXRlZCBmcm9tIGFyYml0cmFyeSBwYWdlcyAqb3V0c2lkZSogdGhlIHJlc2VydmVkIGFyZWEs
IGluIFhlbiMxLgo+IFhlbiMyIGNhbiB2bWFwIHRob3NlIHBhZ2VzLCBhbmQgbmVlZHMgdG8gYXZv
aWQgc3RvbXBpbmcgb24gdGhlbSBqdXN0Cj4gbGlrZSBpdCBuZWVkcyB0byBhdm9pZCBzdG9tcGlu
ZyBvbiBhY3R1YWwgZG9tYWluLW93bmVkIHBhZ2VzLgo+IAo+IFRoZSBwbGFuIGlzIHRoYXQgWGVu
IzEgYWxsb2NhdGVzIGFyYml0cmFyeSBwYWdlcyB0byBzdG9yZSB0aGUgYWN0dWFsIExVCj4gZGF0
YS4gVGhlbiBhbm90aGVyIHBhZ2UgKG9yIGhpZ2hlciBvcmRlciBhbGxvY2F0aW9uIGlmIHdlIG5l
ZWQgPjJNaUIgb2YKPiBhY3R1YWwgTFUgZGF0YSkgY29udGFpbmluZyB0aGUgTUZOcyBvZiBhbGwg
dGhvc2UgZGF0YSBwYWdlcy4gVGhlbiB3ZQo+IG5lZWQgdG8gc29tZWhvdyBwYXNzIHRoZSBhZGRy
ZXNzIG9mIHRoYXQgTUZOLWxpc3QgdG8gWGVuIzIuCj4gCj4gTXkgY3VycmVudCBwbGFuIGlzIHRv
IHB1dCAqdGhhdCogaW4gdGhlIGZpcnN0IDY0IGJpdHMgb2YgdGhlIHJlc2VydmVkCj4gTFUgYm9v
dG1lbSByZWdpb24sIGFuZCBsb2FkIGl0IGZyb20gdGhlcmUgZWFybHkgaW4gdGhlIFhlbiMyIGJv
b3QKPiBwcm9jZXNzLiBJJ20gbG9va2luZyBhdCBhZGRpbmcgYW4gSU5EX1dSSVRFNjQgcHJpbWl0
aXZlIHRvIHRoZSBraW1hZ2UKPiBwcm9jZXNzaW5nLCB0byBhbGxvdyBpdCB0byBiZSB0cml2aWFs
bHkgYXBwZW5kZWQgZm9yIGtleGVjX3JlbG9jKCkgdG8KPiBvYmV5LgoKV291bGRuJ3QgaXQgYmUg
YmV0dGVyIHRvIHJlc2VydmUgdGhlIGZpcnN0IDRLIHBhZ2Ugb2YgdGhlIExVIGJvb3RtZW0gcmVn
aW9uPwoKT3RoZXJ3aXNlLCB5b3UgbWF5IGVuZCB1cCBpbnRvIHRoZSBzYW1lIHRyb3VibGUgYXMg
ZGVzY3JpYmVkIGFib3ZlICh0byBhIApsZXNzZXIgZXh0ZW50KSBpZiB0aGUgNjQtYml0IHZhbHVl
IG92ZXJ3cml0ZSBhbnl0aGluZyB1c2VmdWwgZm9yIHRoZSAKY3VycmVudCBYZW4uIEJ1dCBJIGd1
ZXNzLCB5b3UgY291bGQgZGVsYXkgdGhlIHdyaXRpbmcganVzdCBiZWZvcmUgeW91IApqdW1wIHRv
IHhlbiMyLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
