Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677A2AEAF9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:59:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7fhM-0004t1-85; Tue, 10 Sep 2019 12:56:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ze1U=XF=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1i7fhK-0004sw-7J
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:56:42 +0000
X-Inumbo-ID: 6ee4d7f0-d3ca-11e9-b76c-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ee4d7f0-d3ca-11e9-b76c-bc764e2007e4;
 Tue, 10 Sep 2019 12:56:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y23so16297754lje.9
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2019 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ThZUjst48nBsQQrwmyp4kkeqgEJqPKlkWHGIw30bhN4=;
 b=b3q/Lpqg9Sp34lOtUgzjULZ9aV3rmUKNkbT0CrVcbQzJ9ET1bQxl9z9U9BxJs7qMny
 n94QaUzz81Lo0A4ZGMfzKns8Agjx4Bf2PoMlceqJGMeNwuOD6bdZLREa7H/LenwpuCo+
 Y+oIzhIA9H8HYwHjTTtV9f4IG3o5KfXSnGFFr7IkSzv9m2X9+F5+M82mQ5Go8kzhU+tg
 qekG0xSEC51m0qJTX5VfXsIxSYWuJojb6yItYiPBCiqbui+363+EO94btvTPeNABHwV3
 CZ2ul6a0X5Gv20H/I114/+V5GgEUBeNlseTDrMc2me8SZZpFZtQZwa83USnlRJ0cxUw/
 /Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ThZUjst48nBsQQrwmyp4kkeqgEJqPKlkWHGIw30bhN4=;
 b=Pe6VAYlYyrXgHQO/Bb4Xm2IC4jcFLYfV+Xg8q/nJ5xj46ZtYRNwILNFCDYjrJQpMiv
 IU9XKej5YkqG46k0hnqNJ8kMKNmkskrfbuPbmhzD9AmfEZ+qmSIxdGkCLTFegF1lFD7W
 7Imr5HnHH0XtR62qU3I0m+so2VqSWMLHuqheYyko8cYpG/QHuPwy4xitOWUtZ7WyY3j6
 DWKF6ZN4ToKOE5OBYxzhUaLR/+3OLyDqcUrggoKlKuFPBCClYtLfU7gpR0ckmHcf/4r3
 cnbUDQgOOYKvqcuHQo7VpWole/QHT+1rN5wOjFcNMA0Z4J0uZwqKV0DpNCpWbKT0n0+s
 BYuQ==
X-Gm-Message-State: APjAAAV2YYCCrTLf+V2rfJP7NvYs9dP5izGoPgxFCMa/ZHlUkjzY/mjj
 /dGAE5w0yURD/dAKXwKAnQjDyxOfA1ezuzsP78E=
X-Google-Smtp-Source: APXvYqxq4KmKDj3pDHYdpmtLYyyUHmVZr8CQS2gK4J2CDzE4ivbWi++aFawMEADWVn/+QqgnnwuW1PQNzQrcK1Tku6s=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr19759114ljh.104.1568120200429; 
 Tue, 10 Sep 2019 05:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567889743.git.jrdr.linux@gmail.com>
 <20190909154253.q55olcm4cqwh7izd@box>
In-Reply-To: <20190909154253.q55olcm4cqwh7izd@box>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 10 Sep 2019 18:26:28 +0530
Message-ID: <CAFqt6zZNHGdgaiiRvz-1AFe5g1652oyZpNQidK1V0B6weQHz0w@mail.gmail.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [Xen-devel] [PATCH 0/3] Remove __online_page_set_limits()
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
Cc: sashal@kernel.org, Juergen Gross <jgross@suse.com>,
 linux-hyperv@vger.kernel.org, sstabellini@kernel.org, sthemmin@microsoft.com,
 pasha.tatashin@soleen.com, david@redhat.com, haiyangz@microsoft.com,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 richard.weiyang@gmail.com, Linux-MM <linux-mm@kvack.org>,
 Michal Hocko <mhocko@suse.com>, Qian Cai <cai@lca.pw>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kys@microsoft.com, Andrew Morton <akpm@linux-foundation.org>,
 osalvador@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgOSwgMjAxOSBhdCA5OjEyIFBNIEtpcmlsbCBBLiBTaHV0ZW1vdiA8a2lyaWxs
QHNodXRlbW92Lm5hbWU+IHdyb3RlOgo+Cj4gT24gU3VuLCBTZXAgMDgsIDIwMTkgYXQgMDM6MTc6
MDFBTSArMDUzMCwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPiA+IF9fb25saW5lX3BhZ2Vfc2V0
X2xpbWl0cygpIGlzIGEgZHVtbXkgZnVuY3Rpb24gYW5kIGFuIGV4dHJhIGNhbGwKPiA+IHRvIHRo
aXMgY2FuIGJlIGF2b2lkZWQuCj4gPgo+ID4gQXMgYm90aCBvZiB0aGUgY2FsbGVycyBhcmUgbm93
IHJlbW92ZWQsIF9fb25saW5lX3BhZ2Vfc2V0X2xpbWl0cygpCj4gPiBjYW4gYmUgcmVtb3ZlZCBw
ZXJtYW5lbnRseS4KPiA+Cj4gPiBTb3VwdGljayBKb2FyZGVyICgzKToKPiA+ICAgaHZfYmFsbG9u
OiBBdm9pZCBjYWxsaW5nIGR1bW15IGZ1bmN0aW9uIF9fb25saW5lX3BhZ2Vfc2V0X2xpbWl0cygp
Cj4gPiAgIHhlbi9iYWxsb246IEF2b2lkIGNhbGxpbmcgZHVtbXkgZnVuY3Rpb24gX19vbmxpbmVf
cGFnZV9zZXRfbGltaXRzKCkKPiA+ICAgbW0vbWVtb3J5X2hvdHBsdWcuYzogUmVtb3ZlIF9fb25s
aW5lX3BhZ2Vfc2V0X2xpbWl0cygpCj4gPgo+ID4gIGRyaXZlcnMvaHYvaHZfYmFsbG9vbi5jICAg
ICAgICB8IDEgLQo+ID4gIGRyaXZlcnMveGVuL2JhbGxvb24uYyAgICAgICAgICB8IDEgLQo+ID4g
IGluY2x1ZGUvbGludXgvbWVtb3J5X2hvdHBsdWcuaCB8IDEgLQo+ID4gIG1tL21lbW9yeV9ob3Rw
bHVnLmMgICAgICAgICAgICB8IDUgLS0tLS0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDggZGVsZXRp
b25zKC0pCj4KPiBEbyB3ZSByZWFsbHkgbmVlZCAzIHNlcGFyYXRlIHBhdGNoZXMgdG8gcmVtb3Zl
IDggbGluZXMgb2YgY29kZT8KCkkgcHJlZmVyIHRvIHNwbGl0IGludG8gc2VyaWVzIG9mIDMgd2hp
Y2ggbG9va3MgbW9yZSBjbGVhbi4gQnV0IEkgYW0gb2sKd2l0aCBvdGhlciBvcHRpb24uCldvdWxk
IHlvdSBsaWtlIHRvIG1lcmdlIGludG8gc2luZ2xlIG9uZSA/CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
