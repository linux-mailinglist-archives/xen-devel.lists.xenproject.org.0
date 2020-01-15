Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D813CAD6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 18:22:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irmK0-0002D7-0b; Wed, 15 Jan 2020 17:19:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H2oz=3E=gmail.com=pgnet.dev@srs-us1.protection.inumbo.net>)
 id 1irmJz-0002D2-9y
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 17:19:11 +0000
X-Inumbo-ID: 24d453c0-37bb-11ea-a985-bc764e2007e4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24d453c0-37bb-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 17:19:10 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id z16so8827029pfk.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 09:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LLNX9mnYt3ixshVTrsGoeEn3IeIIs4rhTGP22MRIbZk=;
 b=EVFUyFDkZzoFZ5JG9dqHGh8lPKxyIvFAmqj9rqdeVR6cXltP7Wks1SWKoDvQ478+be
 0z2hJtPSqSqiwGiZntG/96d6eFxoZb/Pwn0aCAjgNP6MoYOTEt4O4Xp9O+V667mZkpCT
 rp3+UbQ/wwkxG++zLuED7AAvTN0AYwwjw0YEhrcAeea61MhlzuTvswTlyZ4Yt0XSVP4s
 vMG0bQ5RNc3PzMJ4+KI85EClj2klP2Lo6OLix7pm4VfqO3y1mhyN1PhUH9vlVg8A94Ys
 lrQoyzyNuvtTHE6Yy/6ktgFss+3WbiiAH7gHQEP3MjdO03ly6QU3S9847f45fLhbNPPS
 OEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LLNX9mnYt3ixshVTrsGoeEn3IeIIs4rhTGP22MRIbZk=;
 b=YmOXHD+7iK0QRaxFQ+1X30sJ7Wt7N/jnvAcoFbovNxbNSWwR2R5x0iRTy6TiuXsADg
 KxyK9ZFTtH6nPBippS55QyYWqTkLUULmyKjMw0d4O3iU6+hlfzJjeLhNVV4Su07N3Jhs
 WZdgw11TFlPwe/bhwS12hyTyQ0sP8U0VIhq3wmzNlCiYgmVFh6k0LL3J4r4puY06MI61
 UZvncN3SzL8XaUtkzoLR/tK5JNjSETBV0D6NS3xvgnSLzMp7k/BzLSmNIXTb5cztejb3
 vjZoxs0WAyYy3M9wvtPHN6q88LuEUjwYCSzJDNsRkAQ+fMKWLL5qQF4MuuTo8CzxyFk1
 M0tw==
X-Gm-Message-State: APjAAAUXPjPpjXqVSiu6cumuDfndtbL9aEFvt5uyaOCOLZFkTgs0WVZs
 2F0jAK7sKzD3729r5Ddx6xkmll6+
X-Google-Smtp-Source: APXvYqynGyMBK0W8mZWeYGDQulF5A/+8iE5KDD9y3a1+pWGaE9+6RD+HCBN4pivHNWFBVtouuNCXFA==
X-Received: by 2002:a62:e30f:: with SMTP id g15mr31837478pfh.124.1579108749940; 
 Wed, 15 Jan 2020 09:19:09 -0800 (PST)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net.
 [99.7.172.215])
 by smtp.gmail.com with ESMTPSA id q11sm22207988pff.111.2020.01.15.09.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 09:19:09 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <6fb9cba6-b19a-680c-09a1-8c32c9f9fe19@gmail.com>
 <19d37ca0-90be-4820-e937-796288fc4517@citrix.com>
From: PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <74cc009f-2d9d-c466-6735-096a47fca7e8@gmail.com>
Date: Wed, 15 Jan 2020 09:19:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <19d37ca0-90be-4820-e937-796288fc4517@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] xen 4.13 + kernel 5.4.11 'APIC Error ... FATAL PAGE
 FAULT' on reboot? non-Xen reboot's ok.
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
Reply-To: pgnet.dev@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

aGkKCk9uIDEvMTUvMjAgOToxMCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSXMgdGhpcyBh
IGtub3duL2ZpeGFibGUgaXNzdWU/Cj4gCj4gVGhlIEFQSUMgZXJyb3JzIGFyZW4ndCBmYXRhbC4g
IFRoZXkgbmVlZCBsb29raW5nIGludG8gYW5kIGFkZHJlc3NpbmcgaW4KPiBkdWUgY291cnNlLgo+
IAo+IFRoZSByZWFsIGNyYXNoIGlzIEVGSSBmaXJtd2FyZSBmYWxsaW5nIG92ZXIgYSBOVUxMIHBv
aW50ZXIgd2hpY2ggaXMKPiB3aWxkbHkga25vd24gaXNzdWUuICBGaXhpbmcgaXQgcmVxdWlyZXMg
Zm9sbG93aW5nIHRoZSBMaW51eCBhcHByb2FjaAo+IHdoaWNoIGlzIHRvIG5vdCB1c2UgRUZJIHJl
Ym9vdCB1bmxlc3MgYWJzb2x1dGVseSBuZWNlc3NhcnkuCj4gCj4gWW91IGNhbiB3b3JrIGFyb3Vu
ZCBpdCB3aXRoIHJlYm9vdD1hIG9uIHRoZSBjb21tYW5kIGxpbmUsIGJ1dCBhY3R1YWxseQo+IGZp
eGluZyB0aGlzIGluIFhlbiBpcyBwcm9iYWJseSBuZXZlciBnb2luZyB0byBoYXBwZW4gYmVjYXVz
ZSBJJ3ZlIGxvc3QKPiBpbnRlcmVzdCBpbiB0cnlpbmcgdG8gYXJndWluZyB0aGF0IGRlZmF1bHQg
YmVoYXZpb3VyIGxpa2UgdGhlIGFib3ZlIGlzIGEKPiBiYWQgdGhpbmcgd2hpY2ggd2Ugc2hvdWxk
IGNvZGUgYXJvdW5kLgoKY3VycmVudGx5LCBoZXJlLAoKY2F0IC9wcm9jL2NtZGxpbmUKCXJvb3Q9
L2Rldi9tYXBwZXIvVkcwLVJPT1Qgc29mdGxldmVsPXhlbiByZC5zaGVsbCBtZHM9ZnVsbCBsMXRm
PWZsdXNoIHJkLmRlYnVnPTAgcmQudWRldi5sb2dfcHJpb3JpdHk9ZGVidWcgcmQuYXV0bz0xIGRv
bHZtIGx2bXdhaXQ9L2Rldi9tYXBwZXIvVkcwLVJPT1Qgcm9vdD0vZGV2L21hcHBlci9WRzAtUk9P
VCByb290ZnN0eXBlPWV4dDQgcm9vdGZsYWdzPWpvdXJuYWxfY2hlY2tzdW0gbm9yZXN1bWUgbm9t
b2Rlc2V0IG5vdXZlYXUubW9kZXNldD0xIHZpZGVvPXZlc2E6b2ZmIHZpZGVvPWVmaWZiOjEwMjR4
NzY4IHhlbmNvbnM9eHZjIGNvbnNvbGU9dHR5MCBjb25zb2xlPWh2YzAgcGNpZV9hc3BtPW9mZiBt
Y2U9b2ZmIGZzY2subW9kZT1za2lwIGZzY2sucmVwYWlyPXByZWVuIHJlYm9vdD1hY3BpIGNsb2Nr
c291cmNlPXhlbiBpbnRlbF9pb21tdT1vbiBhcHBhcm1vcj0wIHBseW1vdXRoLmVuYWJsZT0wIHNj
c2lfbW9kLnVzZV9ibGtfbXE9MSBlbGV2YXRvcj1tcS1kZWFkbGluZSBjcHVpZGxlIGNwdWZyZXE9
eGVuOm9uZGVtYW5kIG5ldC5pZm5hbWVzPTEgYmlvc2Rldm5hbWU9MCBzaG93b3B0cyBub3F1aWV0
IGxvZ19idWZfbGVuPTEwTSBwcmludF9mYXRhbF9zaWduYWxzPTEgc3lzdGVtZC5sb2dfbGV2ZWw9
aW5mbyBzeXN0ZW1kLmxvZ190YXJnZXQ9a21zZyBlYXJseXByaW50az14ZW4sa2VlcCBhdWRpdD0w
Cgpub3RlIHRoZQoKCXJlYm9vdD1hY3BpCgphbHJlYWR5IHRoZXJlLgoKc29tZXRoaW5nIGVsc2Ug
SSdtIG1pc3NpbmcsIHBlcmhhcHM/CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
