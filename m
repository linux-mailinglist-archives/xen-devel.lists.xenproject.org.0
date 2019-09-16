Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2C0B3B72
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 15:32:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9r44-0000v0-MG; Mon, 16 Sep 2019 13:29:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDyh=XL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i9r42-0000ur-Ql
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 13:29:10 +0000
X-Inumbo-ID: f63f940a-d885-11e9-95e6-12813bfff9fa
Received: from mail-lf1-f67.google.com (unknown [209.85.167.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f63f940a-d885-11e9-95e6-12813bfff9fa;
 Mon, 16 Sep 2019 13:29:09 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id d17so9622688lfa.7
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 06:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ehhju65e/ML+X+KKnTnpPph7EFxRdwj6L5troLhFtwA=;
 b=I01rhZxXiahwF9oKwVHecOU4thLkhHVhh7bO2zVzyKvAQPSwQrgZFOa2egJDxpBGr+
 Ki0LcXErvhmGf9yLPO09VAm9KI/99hRxzfAblA/nNBQtccSSCUyjEaLkk6+Kn1YYOAlZ
 e9qu+PtEWMwIsNSI8FH28rmIuZKPlp7acSpbpxs4Y1YN1wDr1lZ2k4Y/JVZO2JWZPFCo
 dPpSMUycDCHEz97KMudI4o3ybM8ui21tQ4czQdnUjXnjMvRvRCFj5hWaevQNpBAUGqsc
 Z1lym6Q6C74MDd42435srJ5HPqA6uRFhblvWj7YEXUv/OGTsgZlURL66pXUFBt00cipY
 Zjqw==
X-Gm-Message-State: APjAAAUoy9FCWGszKD4q/bPW22lHtSf/SLyuiVPRnA/vOw8GAomrbjkk
 nYtIyVDgYsluzvekND/q+L01PuDU3xM=
X-Google-Smtp-Source: APXvYqybEJDYOT07NPClIBJcmf05KLYYN0wHHg/XwQtAYg7mQqSf4EEuLY0a/PXbuVtuuEz6VCchQQ==
X-Received: by 2002:a19:d6:: with SMTP id 205mr15690395lfa.144.1568640547979; 
 Mon, 16 Sep 2019 06:29:07 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id l26sm7066488lja.61.2019.09.16.06.29.07
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2019 06:29:07 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id d17so9622645lfa.7
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 06:29:07 -0700 (PDT)
X-Received: by 2002:a05:6512:488:: with SMTP id
 v8mr9911012lfq.37.1568640547291; 
 Mon, 16 Sep 2019 06:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190913160404.495-1-andrew.cooper3@citrix.com>
 <02785fd186584f12bf364a6949ff8a4d@AMSPEX02CL03.citrite.net>
 <302a0acc-618f-5793-5840-36d80881d07f@citrix.com>
 <3a73e41c33f24bbbbae1f6deb5a9e05e@AMSPEX02CL03.citrite.net>
 <387b2c9f-78e2-8c50-b702-b65d3ccb5787@citrix.com>
In-Reply-To: <387b2c9f-78e2-8c50-b702-b65d3ccb5787@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Mon, 16 Sep 2019 14:28:51 +0100
X-Gmail-Original-Message-ID: <CAK9nU=oMcuiJzMO+GvGnGzHKF=DYCvXpQr5y1x2pwdayf9kxsg@mail.gmail.com>
Message-ID: <CAK9nU=oMcuiJzMO+GvGnGzHKF=DYCvXpQr5y1x2pwdayf9kxsg@mail.gmail.com>
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
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNiBTZXAgMjAxOSBhdCAxNDoxMywgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6ClsuLi5dCj4gPj4+PiBSZXBsYWNlIHRoZSBWSVJJRElBTiBw
cmVmaXggd2l0aCAncmVwb3J0ZWQnIHRvIHJlZHVjZSB0aGUgY29uZnVzaW9uIHRvCj4gPj4+PiBu
b24teGVuLWRldmVsb3BlcnMgdHJ5aW5nIHRvIGludGVycHJldCB0aGUgbWVzc2FnZS4KPiA+Pj4g
VGhpcyBpcyBhIG1lc3NhZ2UgdGhhdCBpcyBwZWN1bGlhciB0byBXaW5kb3dzIFZNcywgc28gaG93
IGFib3V0ICJXaW5kb3dzIFZNIENSQVNIIj8KPiA+PiBJIHByZXN1bWUgeW91IG1lYW4gcGFydGlj
dWxhciwgYnV0IG5vIC0gaXQgaXNuJ3Qgd2luZG93cyB3aGljaCBpcyB0aGUKPiA+PiBleGNsdXNp
dmUgdXNlciBvZiB0aGlzIGludGVyZmFjZS4gIExpbnV4IGhhcyBhIGRyaXZlciB0byB1c2UgaXQg
d2hlbgo+ID4+IHJ1bm5pbmcgdW5kZXIgSHlwZXJWLgo+ID4gSG1tLCB0aGF0J3MgYSBiaXQgb2Rk
LiBJIHRob3VnaHQgdGhlIGNyYXNoIGNvZGVzIGFyZSBXaW5kb3dzIHNwZWNpZmljLiBQZXJoYXBz
IHRoZXkgY2FuIGJlIGRpc3Rpbmd1aXNoZWQgaW4gc29tZSB3YXkuCj4KPiBMaW51eCBzZXRzIGl0
cyBvd24gZ3Vlc3QgT1MgaWRlbnRpZmllciwgd2hpY2ggaXMgc29tZSBmdW5jdGlvbiBvZgo+IEhW
X0xJTlVYX1ZFTkRPUl9JRC4KPgo+ID4gIEFsbCB0aGUgc2FtZSwgdGhlIGxvZyBsaW5lIG5lZWRz
IHRvIGxlYWQgcGVvcGxlIHRvIHNvbWUgd2F5IG9mIGRlY29kaW5nIHRoZSBtYWdpYyBudW1iZXJz
IEkgdGhpbmsuIEhvdyBhYm91dDoKPiA+Cj4gPiAiVklSSURJQU4gUkVQT1JURUQgQ1JBU0giCj4g
Pgo+ID4gPwo+Cj4gVGhhdCBpcyBzdGlsbCBqdXN0IGFzIGNvbmZ1c2luZyB0byByZWFkLgo+Cj4g
VGhlcmUgaXMgbm8gd2F5IHRvIGRlY29kZSB0aGUgbnVtYmVycyB3aXRob3V0IGtub3dpbmcgd2hh
dCBPUyBpcwo+IHJ1bm5pbmcsIGFuZCBzaW1wbHkgc2F5aW5nICJWaXJpZGlhbiIgZG9lc24ndCBo
ZWxwIHdpdGggdGhhdC4KPgoKV291bGQgaXQgbWFrZSBzZW5zZSB0byBjYWxsIGR1bXBfZ3Vlc3Rf
b3NfaWQgaGVyZSBhcyB3ZWxsPyBTZWVpbmcgdGhhdAppdCBpcyBvbmx5IHByaW50ZWQgd2hlbiBp
dCB3YXMgZmlyc3Qgc2V0LgoKV2VpLgoKPiB+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
