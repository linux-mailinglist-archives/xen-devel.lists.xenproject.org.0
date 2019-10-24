Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643ABE3CA7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 21:59:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNjC4-0003IY-9e; Thu, 24 Oct 2019 19:54:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sPx=YR=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iNjC3-0003IT-Co
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 19:54:47 +0000
X-Inumbo-ID: 20e49a54-f698-11e9-beca-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20e49a54-f698-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 19:54:46 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x4so13834725lfn.8
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 12:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWId0MnOeZVGbfvT/Y+5rYtgApIjcLicbujBgTSaKkA=;
 b=mWMuyk3m+eXHxwbNe+4Xv8VF2IR3qpKRZjBZZZflDv8pIy1y9LtlemMr3+h0iFaxgI
 VkoMBcEi2oO4Laze/3rKhNood1Cq2eBp6/AFowJD6cvACKvllzU9ICuxEPkI68VVlnul
 +hFQjFzBSiES/vP81uf+Km5OshhjWv41CwwJGCMQM4yOOk8x09a8D/r50izW1IsQsk2o
 aU+YvMIKv+IZ4lv0OX+lGHW6u0WkkEZhRkiJCPUtwrmivWvDIwnM8nmX/FjNsk8tVJBH
 zfpsjEIWqDEwIUPzGa4yF9zcgvNpAmGRSSwMALl8+TOcQ14BuaEjkh0KVYFcx+2XZ0Ff
 DjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWId0MnOeZVGbfvT/Y+5rYtgApIjcLicbujBgTSaKkA=;
 b=ZVWp5eM7NAIJ5y19toY2vVyQkuQRCuoFpdJhHrr+tcYgwXx8+gp5zVG33Wx7EzMl2Y
 hRus8sSXmCoo5WqX5osL0Mz/x1Jos8WtrWAxiHZcqBrQcWxaCOQY+bxoLQnE81F4aARt
 /d4qMxCNtccjs6qYWF/uHa3iWdY0ql/CoAxviX1yfuvroTUonWH7jOdW4A76QlLH1bQV
 YM8s2l0SSxxK0swzzA5zcRjdRVmPKtugIqp23pJPy77OL4vGD4hrjhbdSFZCYF0b7Sic
 iu4c1MqhqBHVICzE+GpB+5xBu9rqAXInjfk0nQ1dPpeB5VoaJEuNMWl8lPObp+/rJKiz
 h4Mw==
X-Gm-Message-State: APjAAAVAActyxVnTParYrn9R7E/cDNh3zCaf830zCmTJVOpT1rhAYD5l
 LLP/tWU5gT/QhrXNrI4oO/iPB0fUcuw4kUOO63I=
X-Google-Smtp-Source: APXvYqynCSn2dwc8qrSRY3UcbUHYWpV5WcgIX+HxX8jAvXAQqyLiSqH8buE6hRtjEKC3HUq1xfVRTQmydcNheHYH2ws=
X-Received: by 2002:a19:651b:: with SMTP id z27mr26022126lfb.117.1571946885346; 
 Thu, 24 Oct 2019 12:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <1a60b855c0886c8e7147d48923f16b4d0815db81.1570456846.git.rosbrookn@ainfosec.com>
 <a27892b1-6d7f-c18b-3a6c-859cdd869e85@citrix.com>
In-Reply-To: <a27892b1-6d7f-c18b-3a6c-859cdd869e85@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 24 Oct 2019 15:54:33 -0400
Message-ID: <CAEBZRSd82pXdL8+k9ASEkypdtF=yqfpaVO3e+4eAcf8iQi8_QA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 05/24] golang/xenlight: define KeyValueList
 builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, xen-devel@lists.xenproject.org,
 kerriganb@ainfosec.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBTbyB3ZSAqY291bGQqIGFjdHVhbGx5IGp1c3QgYHR5cGUgS2V5VmFsdWVMaXN0IHN0cnVjdCB7
IH1gLCBhbmQgcHVudCBvbgo+IGFsbCB0aGVzZSBpbml0aWFsaXphdGlvbiBxdWVzdGlvbnMgdW50
aWwgc3VjaCB0aW1lIGFzIGl0IHR1cm5zIG91dCB0aGF0Cj4gdGhleSdyZSBuZWVkZWQuCgpJZiB0
aGVyZSBpcyBubyBjbGVhciBuZWVkIGZvciB0aGlzIHR5cGUgdG8gYmUgaW1wbGVtZW50ZWQgaW4g
dGhlIEdvCnBhY2thZ2UsIHRoZW4gSSB3b3VsZCBiZSBpbiBmYXZvciBvZiBub3QgZG9pbmcgc28u
IElNTywgYSBzbWFsbGVyLAptb3JlIGZvY3VzZWQgcGFja2FnZSBpcyBpZGVhbC4KCj4gT24gdGhl
IG90aGVyIGhhbmQsIEkgdGhpbmsgd2UgbWF5IG5lZWQgdG8gYWN0dWFsbHkgdGhpbmsgYWJvdXQK
PiBpbml0aWFsaXppbmcgc3RydWN0dXJlcy4gIFlvdSd2ZSBjYXJlZnVsbHkgY29kZWQgRGVmQm9v
bCBzdWNoIHRoYXQgdGhlCj4gInplcm8iIHZhbHVlIGlzIHVuZGVmaW5lZDsgYnV0IGZvciBEZXZJ
ZCwgZm9yIGluc3RhbmNlLCB0aGUgImluaXRpYWwiCj4gdmFsdWUgaXMgc3VwcG9zZWQgdG8gYmUg
LTE7IGJ1dCB0aGUgd2F5IGl0J3MgY29kZWQsIGFuIHVuaW5pdGlhbGl6ZWQgR28KPiBzdHJ1Y3R1
cmUgd2lsbCBlbmQgdXAgYXMgMCwgd2hpY2ggbWF5IGJlIGEgdmFsaWQgZGV2aWQuCj4KPiBbLi4u
XQo+Cj4gQW55d2F5LCBwZXJoYXBzIHdlIGNhbiB0aGluayBhYm91dCBzdHJ1Y3R1cmUgaW5pdGlh
bGl6YXRpb24sIGFuZAo+IGltcGxlbWVudCBpdCBhZnRlciB3ZSBkbyB0aGUgYmFzaWMgc3RydWN0
dXJlIC8gIG1hcnNoYWxsaW5nIGltcGxlbWVudGFpdG9uLgoKVGhhdCdzIHByb2JhYmx5IGJlc3Qu
IEhvd2V2ZXIsIGF0IGEgcXVpY2sgZ2xhbmNlIGl0IHNlZW1zIGxpa2UgaXQKd291bGQgYmUgcHJl
dHR5IHN0cmFpZ2h0LWZvcndhcmQgdG8gZ2VuZXJhdGUgTmV3U3RydWN0VHlwZSBmdW5jdGlvbnMK
YW5hbG9nb3VzIHRvIGxpYnhsX3N0cnVjdF90eXBlX2luaXQsIGlmIHRoYXQncyB0aGUgZGVzaXJl
ZCBiZWhhdmlvci4KCj4gSW4gdGhlIG1lYW4gdGltZSwgd2UgY291bGQgZWl0aGVyIGtlZXAgdGhl
IEtleVZhbHVlTGlzdCB5b3UndmUKPiBpbXBsZW1lbnRlZCBoZXJlIChwZXJoYXBzIGFkZGluZyBh
IG1ha2UoKSB0byB0aGUgZnJvbUMgbWV0aG9kLCBhbmQKPiBoYXZpbmcgdG9DIHJldHVybiBOVUxM
IGlmIGt2bCBpcyBOVUxMKSwgb3IganVzdCByZXBsYWNlIGl0IHdpdGggYQo+IHBsYWNlaG9sZGVy
IHVudGlsIGl0J3MgbmVlZGVkLgo+Cj4gV2hhdCBkbyB5b3UgdGhpbms/CgpCYXNlZCBvbiB3aGF0
IHlvdSBzYWlkIGFib3ZlLCBJIHRoaW5rIEkgd291bGQgbGlrZSB0byBkcm9wIHRoZQppbXBsZW1l
bnRhdGlvbiBmb3Igbm93LiBCdXQsIGlmIHdlIGtlZXAgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24sIEkKd2lsbCBtYWtlIHRob3NlIGNvcnJlY3Rpb25zLgoKLU5SCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
