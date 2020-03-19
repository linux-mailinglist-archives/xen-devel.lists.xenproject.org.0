Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA518BF1A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 19:10:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEza9-0002E4-7q; Thu, 19 Mar 2020 18:07:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xVQf=5E=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jEza7-0002Dw-Tc
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 18:07:47 +0000
X-Inumbo-ID: 897aa2c4-6a0c-11ea-92cf-bc764e2007e4
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 897aa2c4-6a0c-11ea-92cf-bc764e2007e4;
 Thu, 19 Mar 2020 18:07:47 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b23so3913707edx.4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2020 11:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZXBriT/y5ScDB3f97UZOFuAaQzkdfEhdgL6l5cChM9o=;
 b=iDWQozxRXp3dSgL6qHh1RlJdjN6HkGs3B147LA9GEcZtz2vyrZtGiTF8Fx0xvHxSM3
 bR/yqx1/+FTDPnqa6rEXvwFsMUfzTmCu25vptwQCbkKjylCWfyAKhMURw0xsZrV74/3s
 ljHUI7KYGTK06CatnmZmwBFedSoCUuTG+BfAGXhE+2rOssi7dzVUeeOLzIOjYLRXrTj8
 77OhyfnHxvZl+7vK2+OMYIIWwQj4xraZdacSNie77QihDupMX6nsF1frpN+HFkCh8W5F
 hVLTwMl9Qh2DQPITBvP4gNlprljK3F4pE+Rpuq+ErdwMN1gf/GZFdAjU5nKYLfSU6nuj
 fprw==
X-Gm-Message-State: ANhLgQ2MYHihix4zDqUrCjswhIQDZ3Sqlw+h+zXLK/nbLHoQ4PLpSWfO
 CBokRwLCcECLChLSgq5T4VQ=
X-Google-Smtp-Source: ADFU+vuzT63miRjGGzwSMqHZ7yI97prLd1kGQP5TLbwqxy2dOB0BMIi3T3eBd2gLfsnhuW+LjUcOFQ==
X-Received: by 2002:a50:baef:: with SMTP id x102mr4120335ede.238.1584641266258; 
 Thu, 19 Mar 2020 11:07:46 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id r21sm199753edc.29.2020.03.19.11.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 11:07:45 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
From: Julien Grall <julien@xen.org>
Message-ID: <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
Date: Thu, 19 Mar 2020 18:07:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319173825.GQ24458@Air-de-Roger.citrite.net>
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

CgpPbiAxOS8wMy8yMDIwIDE3OjM4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFRodSwg
TWFyIDE5LCAyMDIwIGF0IDA0OjIxOjIzUE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SGksCj4+Cj4+IE9uIDE5LzAzLzIwMjAgMTU6NDcsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbW0uaCBiL3hlbi9pbmNsdWRlL3hlbi9tbS5o
Cj4+PiBpbmRleCBkMGQwOTVkOWM3Li4wMmFhZDQzMDQyIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL21tLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4+PiBAQCAtNjQ0
LDcgKzY0NCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmaWx0ZXJlZF9mbHVzaF90bGJfbWFzayh1
aW50MzJfdCB0bGJmbHVzaF90aW1lc3RhbXApCj4+PiAgICAgICAgaWYgKCAhY3B1bWFza19lbXB0
eSgmbWFzaykgKQo+Pj4gICAgICAgIHsKPj4+ICAgICAgICAgICAgcGVyZmNfaW5jcihuZWVkX2Zs
dXNoX3RsYl9mbHVzaCk7Cj4+PiAtICAgICAgICBmbHVzaF90bGJfbWFzaygmbWFzayk7Cj4+PiAr
ICAgICAgICBmbHVzaF9tYXNrKCZtYXNrLCBGTFVTSF9UTEIgfCBGTFVTSF9IVk1fQVNJRF9DT1JF
KTsKPj4KPj4gQSBydWxlIG9mIHRodW1iIGlzIGFueSBtb2RpZmljYXRpb24gaW4gY29tbW9uIGNv
ZGUgbWF5IGltcGFjdCBBcm0uIFRoaXMgaXMgYQo+PiBjYXNlIGhlcmUgYmVjYXVzZSB0aGUgZmxh
ZyBhbmQgdGhlICJuZXciIGZ1bmN0aW9uIGFyZSBub3QgZGVmaW5lZCBvbiBBcm0gYW5kCj4+IHRo
ZXJlZm9yZSBnb2luZyB0byBicmVhayB0aGUgYnVpbGQuCj4gCj4gZmx1c2hfbWFzayBpcyBub3Qg
YSBuZXcgZnVuY3Rpb24sIGl0J3MganVzdCBub3QgaW1wbGVtZW50ZWQgb24gQVJNIEkKPiBndWVz
cy4KClRoYXQncyB3aHkgSSBzYWlkIGl0IGluICIiIDspLgoKPiAgPj4gV2h5IGNhbid0IHlvdSBr
ZWVwIGZsdXNoX3RsYl9tYXNrKCkgaGVyZT8KPiAKPiBCZWNhdXNlIGZpbHRlcmVkX2ZsdXNoX3Rs
Yl9tYXNrIGlzIHVzZWQgaW4gcG9wdWxhdGVfcGh5c21hcCwgYW5kCj4gY2hhbmdlcyB0byB0aGUg
cGh5bWFwIHJlcXVpcmUgYW4gQVNJRCBmbHVzaCBvbiBBTUQgaGFyZHdhcmUuCgpJIGFtIGFmcmFp
ZCB0aGlzIGRvZXMgbm90IHlldCBleHBsYWluIG1lIHdoeSBmbHVzaF90bGJfbWFzaygpIGNvdWxk
IG5vdCAKYmUgdXBkYXRlZCBzbyBpdCBmbHVzaCB0aGUgQVNJRCBvbiBBTUQgaGFyZHdhcmUuCgpU
aGlzIHdvdWxkIGFjdHVhbGx5IG1hdGNoIHRoZSBiZWhhdmlvciBvZiBmbHVzaF90bGJfbWFzaygp
IG9uIEFybSB3aGVyZSAKYWxsIHRoZSBndWVzdCBUTEJzIHdvdWxkIGJlIHJlbW92ZWQuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
