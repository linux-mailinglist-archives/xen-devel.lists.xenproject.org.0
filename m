Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8866169DD6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 06:40:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j66RH-0001fA-0N; Mon, 24 Feb 2020 05:37:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bdzc=4M=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1j66RF-0001ed-KF
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 05:37:53 +0000
X-Inumbo-ID: ccc0d9ca-56c7-11ea-bc8e-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccc0d9ca-56c7-11ea-bc8e-bc764e2007e4;
 Mon, 24 Feb 2020 05:37:52 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w1so8620021ljh.5
 for <xen-devel@lists.xenproject.org>; Sun, 23 Feb 2020 21:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9wkYFJh2h/FqfP/gdy3TmFXuB2ZA8ChB46Fqj8RPvk=;
 b=adecDCoU1DOW9L58hZOIgpcDtsz20utzafv8QTUro8E+LC6AjXCGMQ0BI5hDStRdlz
 7jwiawHaEdWYoGTQYoy9KVsbHBhTmJ0gYd+F9TYJX/v5DImsaWDRYCNanIVGacn9WFbd
 1K6uZjdoi+rM8bk07YmvbndbXyloYfCRmTp2XrJf+/WN65BvnvVrdqz2gdenks7/f9OX
 12dUTf46ZuRGNdUZlsdnNyc4CVlW0MfAx5XUjKwmIy8HHHEZv6SfOJVyyetPS2ZuS7Ao
 k/esSwVVzk/gPn8uS3D4HjKpe1kzf+Dbeqkdl41ieMZDIVnFyOwH5bnm4AeI5+FtZs//
 fHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9wkYFJh2h/FqfP/gdy3TmFXuB2ZA8ChB46Fqj8RPvk=;
 b=ILlw6+OAjkZjfqxRPvP6B8fO0wXzvuVrNvlaQACSstHk8FlV7BPGviazvPxqQpkG35
 tkEAHCfnHd4jV3KqMcXf+ECujs3U/QzP5BIzh0K29yo0++6x+Bx4av4WCPSLJOQeRNnK
 4z5xH6BbYEMyUQQJRPVzFLsCjTq1RUz7aGS+bUEHJ297GZGMxIg4bEwdKt8+ZCds9bGt
 iChsTFXwlQ3RzBH2ELmMN18z1SsVDfmCknI+MIgsXM4r8/JUFn5mYeWDRsnjGmAwwZvN
 //VjTaf9yyLd4mx61CTeohtslQbEgChuKTG1lGT/gstFWxEsa4inGG+YmuwDNC9iCm0h
 /Wcw==
X-Gm-Message-State: APjAAAWNw6gFbueIIBCi5fOyVFBWw7Dp6wGdxAs2CGwdM3bo9VZiSVIT
 RTInxXwpAqEYExJ3lRBR9HjMrobmgmujYznxkWE=
X-Google-Smtp-Source: APXvYqxl7Q8RZVqelfUDmy6/xaB2Cuvh43xzFnJILl/oR4J94G/mGCTB4kfrt5i6somUDa2QBgm4Hwcel3M5rJZyDzo=
X-Received: by 2002:a2e:3a12:: with SMTP id h18mr6257935lja.81.1582522671724; 
 Sun, 23 Feb 2020 21:37:51 -0800 (PST)
MIME-Version: 1.0
References: <20200210043516.1996-1-christopher.w.clark@gmail.com>
 <24129.33570.817622.221192@mariner.uk.xensource.com>
In-Reply-To: <24129.33570.817622.221192@mariner.uk.xensource.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 23 Feb 2020 21:37:40 -0800
Message-ID: <CACMJ4GbEnJmt6_25bx4_H3XCf0rrJgN9EQ1iCZ=k3m27id=JBA@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH] tools/configure: generate stubs and
 long-double 32-bit headers if needed
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
 Rich Persaud <persaur@gmail.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgODoyMSBBTSBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBDaHJpc3RvcGhlciBDbGFyayB3cml0ZXMgKCJbUEFUQ0hd
IHRvb2xzL2NvbmZpZ3VyZTogZ2VuZXJhdGUgc3R1YnMgYW5kIGxvbmctZG91YmxlIDMyLWJpdCBo
ZWFkZXJzIGlmIG5lZWRlZCIpOgo+ID4gVGhlIGdudS9zdHVicy0zMi5oIGFuZCBiaXRzL2xvbmct
ZG91YmxlLTMyLmggaGVhZGVycyBhcmUgcmVxdWlyZWQgdG8KPiA+IGJ1aWxkIGh2bWxvYWRlciBi
dXQgYXJlIG5vdCBhbHdheXMgYXZhaWxhYmxlIGluIDY0LWJpdCBidWlsZAo+ID4gZW52aXJvbm1l
bnRzLiBUbyBhdm9pZCBpbnRyb2R1Y2luZyBhIGJ1aWxkIHJlcXVpcmVtZW50IG9uIDMyLWJpdAo+
ID4gbXVsdGlsaWIgZ2VuZXJhdGUgdmVyc2lvbnMgb2YgdGhlbSBmcm9tIHRoZSA2NC1iaXQgZXF1
aXZhbGVudCBoZWFkZXIuCj4gPgo+ID4gVGhpcyBwYXRjaCBlbmFibGVzIHRoZSByZW1vdmFsIG9m
IGRvd25zdHJlYW0gcGF0Y2hpbmcgdGhhdCBoYXMgYmVlbgo+ID4gY2FycmllZCBpbiB0aGUgWW9j
dG8vT3BlbkVtYmVkZGVkIG1ldGEtdmlydHVhbGl6YXRpb24gbGF5ZXIgc2luY2UgMjAxMi4KPgo+
IFRoYW5rcyBmb3IgdGhpcyBwYXRjaC4gIEhvd2V2ZXIsIEknbSBxdWl0ZSBkb3VidGZ1bCBhYm91
dCB0aGUKPiBhcHByb2FjaC4KClRoYW5rcyBmb3IgdGhlIHJldmlldyBhbmQgcmVjb21tZW5kYXRp
b24gZm9yIGFuIGFsdGVybmF0aXZlIGRpcmVjdGlvbi4KCj4gPiArICAgICAgICBlY2hvICcjaW5j
bHVkZSA8Z251L3N0dWJzLTY0Lmg+JyA+Y29uZi1zdHVicy5jCj4gPiArICAgICAgICBTSVhUWV9G
T1VSX0hEUj1gJENDIC1NIGNvbmYtc3R1YnMuYyB8IGdyZXAgJy9zdHVicy02NC5oJCdgCj4gPiAr
ICAgICAgICBybSBjb25mLXN0dWJzLmMKPiA+ICsgICAgICAgIG1rZGlyIC1wIGluY2x1ZGUvZ251
Cj4gPiArICAgICAgICBjYXQgIiR7U0lYVFlfRk9VUl9IRFJ9IiB8IFwKPiA+ICsgICAgICAgICAg
ICBncmVwIC12ICdzdHViX2JkZmx1c2hcfHN0dWJfZ2V0bXNnXHxzdHViX3B1dG1zZycgPmluY2x1
ZGUvZ251L3N0dWJzLTMyLmgKPiA+ICsgICAgICAgIGVjaG8gXCNkZWZpbmUgX19zdHViX19fa2Vy
bmVsX2Nvc2wgPj4gaW5jbHVkZS9nbnUvc3R1YnMtMzIuaAo+ID4gKyAgICAgICAgZWNobyBcI2Rl
ZmluZSBfX3N0dWJfX19rZXJuZWxfc2lubCA+PiBpbmNsdWRlL2dudS9zdHVicy0zMi5oCj4gPiAr
ICAgICAgICBlY2hvIFwjZGVmaW5lIF9fc3R1Yl9fX2tlcm5lbF90YW5sID4+IGluY2x1ZGUvZ251
L3N0dWJzLTMyLmgKPgo+IFRoaXMgY29kZSBzZWVtcyB0byBiZSBhZC1ob2Mgc2VkZGVyeSB3aGlj
aCBkZXBlbmRzIG9uIHRoZSBkZXRhaWxzIG9mCj4gdGhlIGV4aXN0aW5nIGhlYWRlciBmaWxlLiAg
VGhhdCBzZWVtcyBsaWtlIGl0IGlzIHVucHJpbmNpcGxlZCBhbmQKPiBmcmFnaWxlLCB0byBtZS4K
Pgo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IHdvdWxkbid0IGp1c3QgbWFrZSBhIHNtYWxs
IHBhY2thZ2Ugb3IKPiB0YXJiYWxsIG9yIHNvbWV0aGluZyBjb250YWluaW5nIHRoZSByZWxldmFu
dCBoZWFkZXJzIGFuZCBpbnN0YWxsCj4gdGhhdCA/Cj4KPiBBbHNvLCBkb24ndCB5b3UgbmVlZCBh
IDMyLWJpdCBsaWJnY2MgdG9vID8KCk9LLCBJJ3ZlIHByb2R1Y2VkIGEgcmV2aXNlZCBwcm9wb3Nh
bCBkb3duc3RyZWFtIHRoYXQgcmV0aXJlcyB0aGlzCmhlYWRlciBmaWxlIGdlbmVyYXRpb24gYWx0
b2dldGhlciBhbmQgYXBwbGllcyBPcGVuRW1iZWRkZWQncyBtdWx0aWxpYgpzdXBwb3J0ICB0byBt
YWtlIGEgcG9wdWxhdGVkIDMyLWJpdCBzeXNyb290IHdpdGggaGVhZGVycyBhbmQgbGlicmFyaWVz
CmF2YWlsYWJsZSB0byBidWlsZCB3aXRoLgoKVGhlIHJlbWFpbmluZyBjaGFsbGVuZ2UgaXMgdGhh
dCB0aGUgT0UgYnVpbGQgcG9wdWxhdGVzIGFuZCBtYWtlcyB0aGlzCjMyLWJpdCBzeXNyb290IGF2
YWlsYWJsZSBpbiBhIGRpZmZlcmVudCBkaXJlY3RvcnkgdG8gdGhlIHByaW1hcnkKdGFyZ2V0IGFy
Y2hpdGVjdHVyZSBzeXNyb290LCBzbzogZG8geW91IGhhdmUgYSByZWNvbW1lbmRhdGlvbiBmb3Ig
aG93CnRvIHBsdW1iIGFuIGFkZGl0aW9uYWwgQ0ZMQUcgaW50byBYZW4ncyB0b29scy9maXJtd2Fy
ZSBidWlsZD8KCkF0IHRoZSBtb21lbnQsIEknbSBhcHBlbmRpbmcgdGhpcyBzaW5nbGUgbGluZToK
Q0ZMQUdTICs9ICItLXN5c3Jvb3Q9L3RoaXMvaXMvbXkvc3lzcm9vdDMyIgoKdG8gdG9vbHMvZmly
bXdhcmUvUnVsZXMubWsgYnV0IEkgdGhpbmsgYSBkZWRpY2F0ZWQgdG9wLWxldmVsIHZhcmlhYmxl
CmZvciB0aGUgcHVycG9zZSwgcGx1bWJlZCB0aHJvdWdoLCBjb3VsZCBiZSBtb3JlIGFwcHJvcHJp
YXRlPwoKQ2hyaXN0b3BoZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
