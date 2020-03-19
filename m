Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D885318C01C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 20:10:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jF0VZ-0007FF-50; Thu, 19 Mar 2020 19:07:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xVQf=5E=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jF0VX-0007FA-H3
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 19:07:07 +0000
X-Inumbo-ID: d33651da-6a14-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d33651da-6a14-11ea-a6c1-bc764e2007e4;
 Thu, 19 Mar 2020 19:07:06 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b18so4133160edu.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2020 12:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6QhXXtWHKO2HrMJoxw7nkuA0E4UjXitZCG1Er7qZ3Ps=;
 b=bsg/xljBUv1eAUJuTVKe3xTDlAcPYpvDePLfkpkL0mB07C110iH1tnCL/clVeDR6dq
 QV0rVnO1Ki4sIy1q4Yv2wD2snnSA5xBm1PLXxFucJH6/0zBZ0JVDzP0lRD6y4L9ABN8m
 U/ENlYkbfS0U2AfbJWQDF9EYVe6noPLSe4vS7l1fsIN1laPiYCLGbGu+v85Q1tSl4Xaf
 WcW1cySaQnLXzLu3m+zxCD6/RT9KfZcXXASbl4H0Pw+N/IdwS/C0zK9yxBxsHrHGYvyD
 sNebYNHG7rVM3enlqP/TiE0PPyL6VFutKQVHgLgy58mUZzEztBrjdIiFwqhIMyBc8YeT
 2rwQ==
X-Gm-Message-State: ANhLgQ3CbdxBnIk+bPaSnlJX8vxP+wOGXw/R4+f+lhUMkrFN9EoASYLE
 iuV8G0pEHPG5Z01QfZaXWXk=
X-Google-Smtp-Source: ADFU+vtgmM5TpSJD6pGWDpfVBJbm+xVuwutqAA+DWNd7svOH7dy33+91RzrrKzzBTtNVjZa5R1QoSQ==
X-Received: by 2002:a17:906:6b10:: with SMTP id
 q16mr4784561ejr.170.1584644825749; 
 Thu, 19 Mar 2020 12:07:05 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id ov22sm199884ejb.70.2020.03.19.12.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 12:07:05 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
From: Julien Grall <julien@xen.org>
Message-ID: <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
Date: Thu, 19 Mar 2020 19:07:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319184305.GR24458@Air-de-Roger.citrite.net>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOS8wMy8yMDIwIDE4OjQzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFRo
dSwgTWFyIDE5LCAyMDIwIGF0IDA2OjA3OjQ0UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4KPj4KPj4gT24gMTkvMDMvMjAyMCAxNzozOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+
IE9uIFRodSwgTWFyIDE5LCAyMDIwIGF0IDA0OjIxOjIzUE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4+ICAgPj4gV2h5IGNhbid0IHlvdSBrZWVwIGZsdXNoX3RsYl9tYXNrKCkgaGVyZT8K
Pj4+Cj4+PiBCZWNhdXNlIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYXNrIGlzIHVzZWQgaW4gcG9wdWxh
dGVfcGh5c21hcCwgYW5kCj4+PiBjaGFuZ2VzIHRvIHRoZSBwaHltYXAgcmVxdWlyZSBhbiBBU0lE
IGZsdXNoIG9uIEFNRCBoYXJkd2FyZS4KPj4KPj4gSSBhbSBhZnJhaWQgdGhpcyBkb2VzIG5vdCB5
ZXQgZXhwbGFpbiBtZSB3aHkgZmx1c2hfdGxiX21hc2soKSBjb3VsZCBub3QgYmUKPj4gdXBkYXRl
ZCBzbyBpdCBmbHVzaCB0aGUgQVNJRCBvbiBBTUQgaGFyZHdhcmUuCj4gCj4gQ3VycmVudCBiZWhh
dmlvciBwcmV2aW91cyB0byB0aGlzIHBhdGNoIGlzIHRvIGZsdXNoIHRoZSBBU0lEcyBvbgo+IGV2
ZXJ5IFRMQiBmbHVzaC4KPiAKPiBmbHVzaF90bGJfbWFzayBpcyB0b28gd2lkZWx5IHVzZWQgb24g
eDg2IGluIHBsYWNlcyB3aGVyZSB0aGVyZSdzIG5vCj4gbmVlZCB0byBmbHVzaCB0aGUgQVNJRHMu
IFRoaXMgcHJldmVudHMgdXNpbmcgYXNzaXN0ZWQgZmx1c2hlcyAoYnkgTDApCj4gd2hlbiBydW5u
aW5nIG5lc3RlZCwgc2luY2UgdGhvc2UgYXNzaXN0ZWQgZmx1c2hlcyBwZXJmb3JtZWQgYnkgTDAK
PiBkb24ndCBmbHVzaCB0aGUgTDIgZ3Vlc3RzIFRMQnMuCj4gCj4gSSBjb3VsZCBrZWVwIGN1cnJl
bnQgYmVoYXZpb3IgYW5kIGxlYXZlIGZsdXNoX3RsYl9tYXNrIGFsc28gZmx1c2hpbmcgdGhlCj4g
QVNJRHMsIGJ1dCB0aGF0IHNlZW1zIHdyb25nIGFzIHRoZSBmdW5jdGlvbiBkb2Vzbid0IGhhdmUg
YW55dGhpbmcgaW4KPiBpdCdzIG5hbWUgdGhhdCBzdWdnZXN0cyBpdCBhbHNvIGZsdXNoZXMgdGhl
IGluLWd1ZXN0IFRMQnMgZm9yIEhWTS4KCkkgYWdyZWUgdGhlIG5hbWUgaXMgY29uZnVzaW5nLCBJ
IGhhZCB0byBsb29rIGF0IHRoZSBpbXBsZW1lbnRhdGlvbiB0byAKdW5kZXJzdGFuZCB3aGF0IGl0
IGRvZXMuCgpIb3cgYWJvdXQgcmVuYW1pbmcgKG9yIGludHJvZHVjaW5nKSB0aGUgZnVuY3Rpb24g
dG8gCmZsdXNoX3RsYl9hbGxfZ3Vlc3RzX21hc2soKSBvciBmbHVzaF90bGJfYWxsX2d1ZXN0c19j
cHVtYXNrKCkpID8KCj4gCj4gSSB3b3VsZCByYXRoZXIgcHJlZmVyIHRoZSBkZWZhdWx0IHRvIGJl
IHRvIG5vdCBmbHVzaCB0aGUKPiBBU0lEcywgc28gdGhhdCB1c2VycyBuZWVkIHRvIHNwZWNpZnkg
c28gYnkgcGFzc2luZyB0aGUgZmxhZyB0bwo+IGZsdXNrX21hc2suClRoYXQncyB4ODYgY2hvaWNl
LiBGb3IgY29tbW9uLCBJIHdvdWxkIHJhdGhlciBubyBpbnRyb2R1Y2UgdGhvc2UgZmxhZ3MgCnVu
dGlsIHdlIGhhdmUgYW5vdGhlciBhcmNoIHRoYXQgbWFrZSB1c2Ugb2YgaXQuCgo+IAo+PiBUaGlz
IHdvdWxkIGFjdHVhbGx5IG1hdGNoIHRoZSBiZWhhdmlvciBvZiBmbHVzaF90bGJfbWFzaygpIG9u
IEFybSB3aGVyZSBhbGwKPj4gdGhlIGd1ZXN0IFRMQnMgd291bGQgYmUgcmVtb3ZlZC4KPiAKPiBU
aGF0J3MgaG93IGl0IHVzZWQgdG8gYmUgcHJldmlvdXMgdG8gdGhpcyBwYXRjaCwgYW5kIHRoZSB3
aG9sZSBwb2ludAo+IGlzIHRvIHNwbGl0IHRoZSBBU0lEIGZsdXNoZXMgaW50byBhIHNlcGFyYXRl
IGZsYWcsIHNvIGl0J3Mgbm90IGRvbmUKPiBmb3IgZXZlcnkgVExCIGZsdXNoLgoKV2VsbCwgdGxi
X2ZsdXNoX21hc2soKSBpcyBvbmx5IGltcGxlbWVudGVkIGZvciB0aGUgYmVuZWZpdCBvZiBjb21t
b24gCmNvZGUuIEl0IGhhcyBubyBvdGhlciB1c2VycyBvbiBBcm0uCgpJdCBmZWVscyB0byBtZSB0
aGF0IHdlIHdhbnQgYW4gaGVscGVyIHRoYXQgd2lsbCBudWtlIGFsbCB0aGUgZ3Vlc3QgVExCcyAK
b24gYSBnaXZlbiBzZXQgb2YgQ1BVcyAoc2VlIGFib3ZlIGZvciBzb21lIG5hbWUgc3VnZ2VzdGlv
bikuCgpPbiB4ODYsIHlvdSBjb3VsZCBpbXBsZW1lbnQgaXQgdXNpbmcgZmx1c2hfbWFzaygpLiBP
biBBcm0sIHRoaXMgY291bGQgYmUgCmEgcmVuYW1lIG9mIHRoZSBleGlzdGluZyBmdW5jdGlvbiBm
bHVzaF90bGJfbWFzaygpLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
