Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A5E168120
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:05:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59or-0006RK-5U; Fri, 21 Feb 2020 15:02:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j59oq-0006RE-6s
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:02:20 +0000
X-Inumbo-ID: 27d791f0-54bb-11ea-b0fd-bc764e2007e4
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27d791f0-54bb-11ea-b0fd-bc764e2007e4;
 Fri, 21 Feb 2020 15:02:19 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p3so2693325edx.7
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 07:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hw/lbI9+4YAkH2H6yWOEnEq1BONMHAvI7Rxj7pZezeE=;
 b=k1OdbdQgFVY3MuvR73tLzUw3Y/iRT6CsUMgedSzq981KPY/hKa9fy6+8zLRjlRti3J
 J3qHWytm29V5WPb5hVr71DrSBCHwuhBAxrCrhuaVr4ep5AoErONUb2HKbl14Chlkw/J+
 88y8I3aKNYhdyMttUVVW8QP6CDw1dpCTKDwefTicWKuitOzFvGQYXrUY84mZIAb3Xqgy
 q1jjY8ixlUkKDPjHfQFHWBTq2l7N2GYW7jUdDbH9rRRPVLIdbzLgA9HzBu1FW1DI85IU
 zqcpH+gwNRzrihJ6IrRvbhvHo2Ll+V+n+nux9pc0lQnEiKTexF1Qso4PmzDMFXKbgfQ3
 jXGw==
X-Gm-Message-State: APjAAAVjOwWNwyFykW0VteGxNGmMyuHi43rT35w79z19uVbfbP3jpOPW
 JOFDpuX3QYAPQKmtz7cX56M=
X-Google-Smtp-Source: APXvYqzkTTs7ian5JpJGOtdYitu4b9LTFVII/Rtjr5I2LwTPJae85bf3H/NWAgIH3uQPNuc0dNwyyQ==
X-Received: by 2002:a17:906:4c48:: with SMTP id
 d8mr35053059ejw.361.1582297338924; 
 Fri, 21 Feb 2020 07:02:18 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id s14sm339784edx.12.2020.02.21.07.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 07:02:18 -0800 (PST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
 <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
 <20200221144924.GC4679@Air-de-Roger>
 <270e3f03-a1e8-1cf8-af82-e7fed515985a@xen.org>
 <20200221145912.GE4679@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <3ebcabfb-1b4a-7ef5-27dd-66b35ad78123@xen.org>
Date: Fri, 21 Feb 2020 15:02:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221145912.GE4679@Air-de-Roger>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wMi8yMDIwIDE0OjU5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIEZyaSwg
RmViIDIxLCAyMDIwIGF0IDAyOjU2OjIwUE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4K
Pj4KPj4gT24gMjEvMDIvMjAyMCAxNDo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9u
IEZyaSwgRmViIDIxLCAyMDIwIGF0IDAzOjQxOjU5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IEJlY2F1c2UgeW91IG5lZWQgdG8gaW52b2tlIHNtcF9wcm9jZXNzb3JfaWQoKSB0byBj
YWxjdWxhdGUgdGhlIHZhbHVlCj4+Pj4gdG8gdXNlIGluIHRoZSBzdWJ0cmFjdGlvbi4gSSdtIG5v
dCBtZWFuaW5nIHRvIHNheSBJJ20gZW50aXJlbHkKPj4+PiBvcHBvc2VkIChzZWVpbmcgaG93IG11
Y2ggb2YgYSBkaXNjdXNzaW9uIHdlJ3JlIGhhdmluZyksIGJ1dCB0aGUKPj4+PiAic2ltcGxlIHdy
aXRlIG9mIHplcm8iIGFwcHJvYWNoIGlzIGNlcnRhaW5seSBhcHBlYWxpbmcuCj4+Pgo+Pj4gV2Vs
bCwgd2UgY291bGQgYXZvaWQgdGhlIHNtcF9wcm9jZXNzb3JfaWQoKSBjYWxsIGFuZCBpbnN0ZWFk
IHVzZToKPj4+Cj4+PiBhdG9taWNfc3ViKGF0b21pY19yZWFkKCZsb2NrLT5jbnRzKSAmIDB4ZmZm
ZiwgJmxvY2stPmNudHMpOwo+Pgo+PiBBRkFJQ1QsIHRoaXMgd291bGQgbm90IGJlIHNhZmUgYmVj
YXVzZSB0aGUgdG9wIDE2LWJpdCBtYXkgY2hhbmdlIGJlaGluZCB5b3VyCj4+IGJhY2sgKHZpYSBh
IHJlYWRfbG9jaykuCj4gCj4gV2h5IG5vdD8gV2UgZG9uJ3QgdG91Y2ggdGhlIHRvcCAxNmJpdHMg
aW4gYW55IHdheSwgdGhlIHN1YnRyYWN0aW9uCj4gb25seSBhZmZlY3RzIHRoZSBsb3cgMTZiaXRz
IGFuZCBpcyBkb25lIGluIGFuIGF0b21pYyBtYW5uZXIuCgpIbW1tLCBJIGRpZCBtaXNyZWFkIHRo
ZSBjb2RlIDooLiBTb3JyeSBmb3IgdGhlIHRoYXQuCgo+IAo+IFRoYW5rcywgUm9nZXIuCj4gCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
