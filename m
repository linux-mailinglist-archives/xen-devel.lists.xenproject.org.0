Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2019AB6163
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:25:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAX5k-0008JE-1o; Wed, 18 Sep 2019 10:21:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zcq4=XN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iAX5i-0008J6-8d
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:21:42 +0000
X-Inumbo-ID: 1ac73b06-d9fe-11e9-a337-bc764e2007e4
Received: from mail-lf1-f65.google.com (unknown [209.85.167.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ac73b06-d9fe-11e9-a337-bc764e2007e4;
 Wed, 18 Sep 2019 10:21:41 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id d17so5272430lfa.7
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2019 03:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pgTN5BxJq5fzyoC2ZypP7Ad5JIBq1v7M8sms/F1P8ug=;
 b=BxyGqRCV5GfzIOWYoYC2R9Hp6y5y42a6Jd5B1t5NcahWzYDdwAJJ8AWxbztxX2CrHA
 mSB5aeQTI7YKVRfySO4FpvDKMalB63zyRssSOgQg0QYNCAZhjxhoqxM6NOaPUL+FHfbY
 HzepOtELBuyPHqae7STcBaVDSV+pPFrLv7HWN0m/Ds7kskUNgugMSHMSHwjn7ZboDR9N
 Ig2+6TiDBzCMHrNavONBYSS/q86s3G/kt3gSrLcZF9SyV2zDf+s+zSQrNj3BJEmhoF7p
 Oc8ttCOGA4Qablm/fM7thkSF97hXSGZL4mpBfY2fvzqJk9jIw0cJLvIc0GPBlnhcTfNh
 //1Q==
X-Gm-Message-State: APjAAAWPC2kbq0+ZX3J5x1b91N/Nuwi7Xkf+XjM+qGZWPC6wLLLQtiIk
 fZQ8LgoOs9sFN7z770o28cKahkr3D/Y=
X-Google-Smtp-Source: APXvYqx3x/6gU7x70xFOaIwVjwMtddQS2UwnKvp5UsgELFg6Ups37qHiZd77Jkbsk5l4bzaT8uBL3A==
X-Received: by 2002:ac2:5925:: with SMTP id v5mr1739080lfi.8.1568802100045;
 Wed, 18 Sep 2019 03:21:40 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id c3sm940852lfi.32.2019.09.18.03.21.39
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2019 03:21:39 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id l21so4916186lje.4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2019 03:21:39 -0700 (PDT)
X-Received: by 2002:a2e:b0d1:: with SMTP id g17mr1695420ljl.238.1568802099485; 
 Wed, 18 Sep 2019 03:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190913160404.495-1-andrew.cooper3@citrix.com>
 <02785fd186584f12bf364a6949ff8a4d@AMSPEX02CL03.citrite.net>
 <302a0acc-618f-5793-5840-36d80881d07f@citrix.com>
 <3a73e41c33f24bbbbae1f6deb5a9e05e@AMSPEX02CL03.citrite.net>
 <387b2c9f-78e2-8c50-b702-b65d3ccb5787@citrix.com>
 <CAK9nU=oMcuiJzMO+GvGnGzHKF=DYCvXpQr5y1x2pwdayf9kxsg@mail.gmail.com>
 <1dc90060013844dab69b6a1347a80d6c@AMSPEX02CL03.citrite.net>
 <f713c15e-a82d-0693-e8e5-fe1795825b7f@citrix.com>
In-Reply-To: <f713c15e-a82d-0693-e8e5-fe1795825b7f@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Wed, 18 Sep 2019 11:21:23 +0100
X-Gmail-Original-Message-ID: <CAK9nU=oHQXtd3wRDVSXGicmx0=9VmrxSTKUa94-OybiDkkYc1Q@mail.gmail.com>
Message-ID: <CAK9nU=oHQXtd3wRDVSXGicmx0=9VmrxSTKUa94-OybiDkkYc1Q@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/viridian: Reword HV_X64_MSR_CRASH_CTL
 print message
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNyBTZXAgMjAxOSBhdCAxNzozMSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxNi8wOS8yMDE5IDE0OjU2LCBQYXVsIER1cnJh
bnQgd3JvdGU6Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+PiBGcm9tOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgo+ID4+IFNlbnQ6IDE2IFNlcHRlbWJlciAyMDE5IDE0OjI5Cj4gPj4g
VG86IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+Cj4gPj4gQ2M6IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBYZW4tZGV2ZWwgPHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEphbiBCZXVsaWNoCj4gPj4gPEpCZXVsaWNoQHN1c2Uu
Y29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0geDg2L3ZpcmlkaWFuOiBSZXdvcmQg
SFZfWDY0X01TUl9DUkFTSF9DVEwgcHJpbnQgbWVzc2FnZQo+ID4+Cj4gPj4gT24gTW9uLCAxNiBT
ZXAgMjAxOSBhdCAxNDoxMywgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPj4gWy4uLl0KPiA+Pj4+Pj4+IFJlcGxhY2UgdGhlIFZJUklESUFOIHByZWZp
eCB3aXRoICdyZXBvcnRlZCcgdG8gcmVkdWNlIHRoZSBjb25mdXNpb24gdG8KPiA+Pj4+Pj4+IG5v
bi14ZW4tZGV2ZWxvcGVycyB0cnlpbmcgdG8gaW50ZXJwcmV0IHRoZSBtZXNzYWdlLgo+ID4+Pj4+
PiBUaGlzIGlzIGEgbWVzc2FnZSB0aGF0IGlzIHBlY3VsaWFyIHRvIFdpbmRvd3MgVk1zLCBzbyBo
b3cgYWJvdXQgIldpbmRvd3MgVk0gQ1JBU0giPwo+ID4+Pj4+IEkgcHJlc3VtZSB5b3UgbWVhbiBw
YXJ0aWN1bGFyLCBidXQgbm8gLSBpdCBpc24ndCB3aW5kb3dzIHdoaWNoIGlzIHRoZQo+ID4+Pj4+
IGV4Y2x1c2l2ZSB1c2VyIG9mIHRoaXMgaW50ZXJmYWNlLiAgTGludXggaGFzIGEgZHJpdmVyIHRv
IHVzZSBpdCB3aGVuCj4gPj4+Pj4gcnVubmluZyB1bmRlciBIeXBlclYuCj4gPj4+PiBIbW0sIHRo
YXQncyBhIGJpdCBvZGQuIEkgdGhvdWdodCB0aGUgY3Jhc2ggY29kZXMgYXJlIFdpbmRvd3Mgc3Bl
Y2lmaWMuIFBlcmhhcHMgdGhleSBjYW4gYmUKPiA+PiBkaXN0aW5ndWlzaGVkIGluIHNvbWUgd2F5
Lgo+ID4+PiBMaW51eCBzZXRzIGl0cyBvd24gZ3Vlc3QgT1MgaWRlbnRpZmllciwgd2hpY2ggaXMg
c29tZSBmdW5jdGlvbiBvZgo+ID4+PiBIVl9MSU5VWF9WRU5ET1JfSUQuCj4gPj4+Cj4gPj4+PiAg
QWxsIHRoZSBzYW1lLCB0aGUgbG9nIGxpbmUgbmVlZHMgdG8gbGVhZCBwZW9wbGUgdG8gc29tZSB3
YXkgb2YgZGVjb2RpbmcgdGhlIG1hZ2ljIG51bWJlcnMgSQo+ID4+IHRoaW5rLiBIb3cgYWJvdXQ6
Cj4gPj4+PiAiVklSSURJQU4gUkVQT1JURUQgQ1JBU0giCj4gPj4+Pgo+ID4+Pj4gPwo+ID4+PiBU
aGF0IGlzIHN0aWxsIGp1c3QgYXMgY29uZnVzaW5nIHRvIHJlYWQuCj4gPj4+Cj4gPj4+IFRoZXJl
IGlzIG5vIHdheSB0byBkZWNvZGUgdGhlIG51bWJlcnMgd2l0aG91dCBrbm93aW5nIHdoYXQgT1Mg
aXMKPiA+Pj4gcnVubmluZywgYW5kIHNpbXBseSBzYXlpbmcgIlZpcmlkaWFuIiBkb2Vzbid0IGhl
bHAgd2l0aCB0aGF0Lgo+ID4+Pgo+ID4+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gY2FsbCBkdW1w
X2d1ZXN0X29zX2lkIGhlcmUgYXMgd2VsbD8gU2VlaW5nIHRoYXQKPiA+PiBpdCBpcyBvbmx5IHBy
aW50ZWQgd2hlbiBpdCB3YXMgZmlyc3Qgc2V0Lgo+ID4gWWVzLCB0aGF0J3Mgbm90IGEgYmFkIGlk
ZWEuCj4KPiBUaGlzIGlzIGFzIG1heWJlLCBidXQgc3RpbGwgZG9lc24ndCBoZWxwIHdpdGggYW1i
aWd1aXR5IGJlY2F1c2UgeW91Cj4gY2FuJ3QgZXhwZWN0IHBlb3BsZSB0byByZWNvZ25pc2UgZ3Vl
c3QtaWQncyBieSB0aGVpciBoZXggdmFsdWUuICBJdCBhbHNvCj4gZG9lc24ndCBoZWxwIHdpdGgg
dGhlIGNvbmZ1c2lvbiBvZiBoYXZpbmcgdGhlIHdvcmQgdmlyaWRpYW4gaW4gdGhlCj4gcHJpbnRl
ZCBzdHJpbmcuCj4KCkkgbG9vayBjbG9zZXIgdG9kYXkuIFRoZXkgY2FuIGJlIGludGVycHJldGVk
IGF0IGxlYXN0IGZvciBMaW51eC4gSXQgaXMKdXNlZnVsIGluZm9ybWF0aW9uIHRvIGhhdmUuIElm
IHdlIHdhbnQgdG8gcHJpbnQgY3Jhc2ggY29udHJvbCB2YWx1ZXMKYXQgYWxsLCBPUyBpbmZvcm1h
dGlvbiBzaG91bGRuJ3QgYmUgb21pdHRlZC4KCkkgZG9uJ3QgcmVhbGx5IGhhdmUgYW4gb3Bpbmlv
biBvbiB3aGV0aGVyIHRoZSB2aXJpZGlhbiBwcmVmaXggaXMgdXNlZnVsIG9yIG5vdC4KCldlaS4K
Cj4gfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
