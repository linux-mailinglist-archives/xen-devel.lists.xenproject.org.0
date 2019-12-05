Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC59114535
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 17:56:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icuOJ-0007Q6-SW; Thu, 05 Dec 2019 16:54:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4RYm=Z3=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1icuOI-0007Pz-Ql
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 16:54:10 +0000
X-Inumbo-ID: da9088d5-177f-11ea-8232-12813bfff9fa
Received: from mail-lj1-f193.google.com (unknown [209.85.208.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da9088d5-177f-11ea-8232-12813bfff9fa;
 Thu, 05 Dec 2019 16:54:09 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id a13so4356493ljm.10
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 08:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6HMXevhpkpSBg+vvJFSnmndF/GSt0HffiosUXWb9ziA=;
 b=Xaq5LCL6lhsa4Q6RmroTssikE6fg8JMH9YbBGVi+V8KnDCZ4OvrxOIJVLYbzEfPItJ
 MfagC3B77rzDwKUIaNbJym0l8pMvwGIzzuVQiUo/7HoHBpRbixLMkDBPuu9pehPtAsQZ
 fmYY5Mb2vlW6Xfj7p2k/HCmPXooseuWDIttH9xnIE9X8hCoHB8nxJX0IFvxumKIbKwkD
 cgxALM/db1iamht4KTkqG7hn9h2rdkvgoD8fx9sBuY/yPwZy752scYiPu7nciI+Jbmgz
 j50fMhuPowf+gIv8wMHR8GmPEEs7dZ19Ol+j4BExg/j+x+gLJcgXMhYh0oVIBCy0fFJX
 F0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6HMXevhpkpSBg+vvJFSnmndF/GSt0HffiosUXWb9ziA=;
 b=paQD/Hdl+HE5UDP/s6dkwBnD4SzsgG4SPU9MBt12CAFP69Iah/Xry4+53hSZS7dNNk
 Q9GHOf7nU0nMHKp4YZyy6OKxH68yt0SsD58ir0las2vpon16DQrBebIiUaxEBWdFDTpB
 za1Ar7w5MM35+8Wt9+cNZtv37RN+bNceJig97OF8jygZbKjx9/gZrIRXIeGYOpNPtzY5
 nzrfpxwCyu2ZWZgFwbTJvihwKcGkGilP2z4cuoRx0CmJqnUamZRYk5NdDZ7bj+nWRbj3
 1HRn6MApUR5+lhDJdISAtNwwwiiqV3UQEkpKi09WKq/Vs5kEYVerIXZEO+ysB0CxrTpY
 QJug==
X-Gm-Message-State: APjAAAUVmiiF6FaPf5WferiM3N/1jt506txz1onIZLJ5SHVbVp2Tn6J3
 B48r4GomBVLfu6L/XJlLF25vMd6a0qtrQtoPwsQ=
X-Google-Smtp-Source: APXvYqzrag18uEeJmuT09zUHdAVqJMQCE7adETgtaLW9IKV+1ajgcMsVhv4sZlnQH9QyLiCK/mCyVD3B/np+FA5fH94=
X-Received: by 2002:a2e:9610:: with SMTP id v16mr6342633ljh.88.1575564848540; 
 Thu, 05 Dec 2019 08:54:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <938dbf7c3a083ec050c16729805f4ce5f3f2891f.1573840474.git.rosbrookn@ainfosec.com>
 <cabd32fd-7c1e-ad7a-c4ce-1ae716894746@citrix.com>
 <d4061074-0825-d4ad-4ece-4da0d3c9049c@citrix.com>
In-Reply-To: <d4061074-0825-d4ad-4ece-4da0d3c9049c@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 5 Dec 2019 11:53:57 -0500
Message-ID: <CAEBZRScC3J6-6F79Cw3_SN=z-VguCkt3dM5YWer2pm8gfTrTww@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 16/22] golang/xenlight: implement keyed
 union C to Go marshaling
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IEl0IGxvb2tzIGxpa2UgdGhpcyBpcyBkdXBsaWNhdGluZyAoZGlmZmVyZW50bHkhKSB0aGUg
ZmllbGQtY29weWluZyBjb2RlCj4gPiBmcm9tIGdvbGFuZ19kZWZpbmVfZnJvbV9DLiAgSXMgdGhl
cmUgYW55IHJlYXNvbiB5b3UgY291bGRuJ3QgaGF2ZSBhCj4gPiBzaW5nbGUgZnVuY3Rpb24sIGB4
ZW5saWdodF9nb2xhbmdfZmllbGRzX2Zyb21fQ2AsIHdoaWNoIHdvdWxkIGJlIHVzZWQKPiA+IGZv
ciBib3RoPwoKTm8sIEkgc2hvdWxkIGJlIGFibGUgdG8gcmUtZmFjdG9yIHRoYXQuIFRoYW5rcy4K
Cj4gQWN0dWFsbHksIGl0IHR1cm5zIG91dCB3ZSBkb24ndCBzdHJpY3RseSBuZWVkIHRvIGR1cGxp
Y2F0ZSB0aGlzIGF0IGFsbCwKPiBpZiB3ZSB1c2UgdGhlIGB0eXBlb2ZgIG9wZXJhdG9yLCBsaWtl
IHRoaXM6Cj4KPiAtLS0KPiB0eXBlZGVmIHR5cGVvZigoKHN0cnVjdCBsaWJ4bF9jaGFubmVsaW5m
byAqKU5VTEwpLT51LnB0eSkKPiBsaWJ4bF9jaGFubmVsaW5mb19jb25uZWN0aW9uX3VuaW9uX3B0
eTsKPgo+IHR5cGVkZWYgdHlwZW9mKCgoc3RydWN0IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICop
TlVMTCktPnUuaHZtKQo+IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX3R5cGVfdW5pb25faHZtOwo+
Cj4gdHlwZWRlZiB0eXBlb2YoKChzdHJ1Y3QgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKilOVUxM
KS0+dS5wdikKPiBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb190eXBlX3VuaW9uX3B2Owo+Cj4gdHlw
ZWRlZiB0eXBlb2YoKChzdHJ1Y3QgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKilOVUxMKS0+dS5w
dmgpCj4gbGlieGxfZG9tYWluX2J1aWxkX2luZm9fdHlwZV91bmlvbl9wdmg7Cj4KPiB0eXBlZGVm
IHR5cGVvZigoKHN0cnVjdCBsaWJ4bF9kZXZpY2VfdXNiZGV2ICopTlVMTCktPnUuaG9zdGRldikK
PiBsaWJ4bF9kZXZpY2VfdXNiZGV2X3R5cGVfdW5pb25faG9zdGRldjsKPgo+IHR5cGVkZWYgdHlw
ZW9mKCgoc3RydWN0IGxpYnhsX2RldmljZV9jaGFubmVsICopTlVMTCktPnUuc29ja2V0KQo+IGxp
YnhsX2RldmljZV9jaGFubmVsX2Nvbm5lY3Rpb25fdW5pb25fc29ja2V0Owo+IC0tLQo+Cj4gVGhp
cyBndWFyYW50ZWVzIHdlJ2xsIGhhdmUgdGhlIGNvcnJlY3QgbGF5b3V0IGZvciB0aGUgcmVzdWx0
aW5nIHR5cGUuCgpXZWxsIHRoYXQncyBwcmV0dHkgY29vbC4KCj4gSSB0YWxrZWQgdG8gSWFuIEph
Y2tzb24sIGFuZCBoZSBhZ3JlZWQgdGhhdCBsb25nLXRlcm0gaXQgd291bGQgYmUgZ29vZAo+IGZv
ciB0aGUgQyBnZW5lcmF0b3IgdG8gZ2VuZXJhdGUgbmFtZWQgdHlwZXMgZm9yIHRoZXNlIHVuaW9u
IGVsZW1lbnRzCj4gKGxpa2tlIHlvdSBoYXZlIGhlcmUpLiAgSWYgeW91IGZlbHQgcmVhbGx5IG1v
dGl2YXRlZCB5b3UgY291bGQgZG8gdGhhdAo+IG5vdzsgYnV0IEkgdGhpbmsgdXNpbmcgdGhlIGB0
eXBlb2ZgIHRyaWNrIHdvdWxkIGJlIHN1aXRhYmxlIHRvIGdldCB0aGlzCj4gcGF0Y2ggaW4uCgpJ
J2xsIHRha2UgYSBsb29rIGF0IGxlYXN0IGFuZCBzZWUgaWYgSSBjYW4gZ2V0IGl0IGRvbmUgZmFp
cmx5IGVhc2lseS4KT3RoZXJ3aXNlLCBJJ2xsIHVzZSB0aGlzIHRyaWNrLgoKVGhhbmtzLAotTlIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
