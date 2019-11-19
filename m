Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A53D102922
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 17:17:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX68i-0001QN-NL; Tue, 19 Nov 2019 16:14:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NUhf=ZL=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iX68h-0001QI-90
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 16:14:03 +0000
X-Inumbo-ID: 991ee084-0ae7-11ea-a2ff-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 991ee084-0ae7-11ea-a2ff-12813bfff9fa;
 Tue, 19 Nov 2019 16:14:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a15so24539159wrf.9
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2019 08:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EMCKpvcqw4lVu80Nu9qr9oM27wYKTZyWsgmxtcskxYs=;
 b=Xv5jTXuSA2PDlusffid3x1SgRuUTE2BjF51M20vfV0tqijHm2pahCys0P+hNkfMKuo
 r5cE34m8WZ8c2q4jb+eRO0+AuFXVeMmAmsi8Yj8eTN1c02c5ebjMbCpEy511PKvosDuD
 XHRBtMZVDY40pHQQmKA4zDGvlUsq+zZXzVu9iDM0eOAjwimALDvpkkodHL7SbG7wDXGI
 NIiHvKjR2oE9Z2j2891WuYoZsTzJAJ0tJn+0b9IrIKDdnDuWl/BCdZB6DCSldgzrr1KP
 oomu3UeDCNipEWFkwC5ylEQ3sj35oDSBdH71bsk2M5uqdTcMJBKZ/1vsBlHE3vP29uLl
 JgsQ==
X-Gm-Message-State: APjAAAUXJq/9g9eg2LuWRrt0BKSF0Y9clrYuXyuXvdtdl9eZfyKnNpwR
 IENJ5RuJFvFFmpbQ0fcUM+Y=
X-Google-Smtp-Source: APXvYqxCorg+ali6kxKLa/BJc/TnfmNyVZQWWaOuNlejr9rRGpVcI+wu3wqm19K06qy7prbqkTQEhA==
X-Received: by 2002:a5d:4986:: with SMTP id r6mr37791231wrq.307.1574180040663; 
 Tue, 19 Nov 2019 08:14:00 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id j14sm27367899wrp.16.2019.11.19.08.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 08:13:59 -0800 (PST)
To: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "julien.grall.oss@gmail.com" <julien.grall.oss@gmail.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-3-git-send-email-andrii.anisov@gmail.com>
 <7d3b0692-11e1-ad70-618b-c17318a2f257@suse.com>
 <CAJwc6KsiYYFEjV=My+J1mrFCEYO-gS-SH9oqSwj7nzWjn4C-kA@mail.gmail.com>
 <0c7cefd6-9169-8a91-de32-3d63dfdc1ab0@suse.com>
 <8337bf4b07903b75a6690880e58ca117e9c08a47.camel@epam.com>
 <CAJ=z9a3FrBOF=3wKp53U8rGWSVJCC4JCurTpyOMPvc6FNcadcA@mail.gmail.com>
 <91c78b4f4cc2e2934717e827bf3ce80be775b127.camel@epam.com>
 <fa4bcb45-aae2-ed11-e54a-456054e3cbca@xen.org>
 <2d66227ecda566e5840b14e7b50ab93461ebe37b.camel@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c47c54a4-b5d7-e35e-e388-f58836b5cec7@xen.org>
Date: Tue, 19 Nov 2019 16:13:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2d66227ecda566e5840b14e7b50ab93461ebe37b.camel@epam.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "joculator@gmail.com" <joculator@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQXJ0ZW0sCgpPbiAxOS8xMS8yMDE5IDE1OjE2LCBBcnRlbSBNeWdhaWV2IHdyb3RlOgo+IAo+
IFVuZm9ydHVuYXRlbHkgdGhpcyBpcyBub3QgdGhlIGNhc2UgLSB3ZSBuZWVkIHRvIHNwZWNpZnkg
MiBkaWZmZXJlbnQKPiB0YXJnZXRzOiAxc3QgaXMgZm9yIEdOVSB0b29scyB3aGljaCBhcmUgc3Rp
bGwgdXNlZCB3aGVuIGJ1aWxkaW5nIHdpdGgKPiBhcm1jbGFuZywgZm9yIGRlYnVnIHN5bWJvbHMg
ZHVtcGluZyBldGMuICh0aGVyZSBpcyBubyByZXBsYWNlbWVudCBpbgo+IEFybSB0b29sc3RhY2sg
Zm9yIHRoZW0sIGFuZCB0aGlzIGlzIG5vdCBvbiBzYWZldHkgY3JpdGljYWwgcGF0aCBzbyB3ZQo+
IGFyZSBmaW5lKSBhbmQgMm5kIGlzIGZvciBhcm1jbGFuZyBpdHNlbGYgYmVjYXVzZSBpdCBoYXMg
aXRzIG93bgo+IHRyaXBsZXRzIGRlZmluaXRpb24gd2hpY2ggaXMgbm90IGNvbnNpc3RlbnQgd2l0
aCB0aG9zZSB1c2VkIGJ5IEdOVQo+IHRvb2xzLgoKV2VsbCwgaW4gdGhlb3J5IHRoZXkgbWF5IGJl
IGRpZmZlcmVudCBmb3IgY2xhbmcuIEl0IGp1c3QgaGFwcGVucyB0aGV5IAphcmUgYm90aCBzaW1p
bGFyIGF0IHRoZSBtb21lbnQuCgpUaGVyZSB3ZXJlIGFsc28gc29tZSBjb25jZXJuIHRvIHVzZSBD
Uk9TU19DT01QSUxFIGFzIC0tdGFyZ2V0IChzZWUgWzFdKSwgCnNvIEkgdGhpbmsgd2Ugd2FudCB0
byBpbnRyb2R1Y2UgYSBuZXcgb3B0aW9uIHRoYXQgd291bGQgaGFwcGVuIHRvIGJlIAplcXVhbCB0
byBDUk9TU19DT01QSUxFIGZvciBjbGFuZy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
