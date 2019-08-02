Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C8A7F7E0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:09:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXHo-0007MF-DN; Fri, 02 Aug 2019 13:07:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bRuE=V6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1htXHm-0007Lf-OD
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:07:54 +0000
X-Inumbo-ID: 88c72c46-b526-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 88c72c46-b526-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 13:07:52 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h10so1330523ljg.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 06:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yQm8tFXYwp2YqE1fvGINtbS8YZuUPqc6NZCog8ixBFk=;
 b=BjxWNRLxTn9NgGYriR3loNnuCC+XAT7duUTDVxn2lpeTJC3H7PN0rHfhs5XsoZT2/y
 yYmauJmaxCb/UTjV3MJXykP+f3LBsmLyXn9ojW42xiJdzJk71h8cbIkK/Ted+31a0vjP
 WsiBZHkt7H7u0lSJlHeVUcHnqLb5aRJqHmZptq3HUth07iSKd8if5xNT0rDixGRZmr+k
 5+d5Yo9DhvgQFXrWhVJEv+8qo+Z+r2Vq++2Tka716Wic5KmxowL4K48ZJYup6+yxxZKm
 CqonPk7fggaUg5F/+B967miGZZp99A0g3jiF3fVApt4B8M/RAix8Vzrp3Ab/xUxDT1lW
 IR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yQm8tFXYwp2YqE1fvGINtbS8YZuUPqc6NZCog8ixBFk=;
 b=fovo970aTPw1p8KBLSLqCEGoaTMlgwSKBmz51pLSny/0FZSZ9SbuU7aAFnmZPweXzb
 SeFu7GExG4I6SY91DfWex9+DOW4gq4SIbAVnPJ+G4QgPHitNP4BC9UzeqEcfdFHVQ1zL
 6nn2F4aXuLgrJ27FdzmNYp8nKzclcDoeM8jeLOgyTrKfY3mmLeQ2SFY6WjjKjszFB9ZZ
 B5FxK+erHeTdyc4SEzSoaLW+HtXlI8Zdqz1AFKqzt/IUgZw2U1vpJmyLiqIjil71Ictx
 1glWgFW4U4ywZWoWFjSJxz8ZpVjss7bIF4zYkREoy/1E18ieSQDYhIZgrTUXzX4t/Wd6
 bmDg==
X-Gm-Message-State: APjAAAX7iTtc2B69ubSHKHUwdaL1af6lKBTEAm46W5Txl8Ucd1oUSatc
 Re3v5LF8oPFYKjZmA7Sg3Ck=
X-Google-Smtp-Source: APXvYqw/U2k/kXnJHagug2/E9jj74ElBh3urxUym1DxtFCScbTZMi6vd5iIXlA9onSc0e9AYyJRitg==
X-Received: by 2002:a2e:93c8:: with SMTP id p8mr21889636ljh.6.1564751271349;
 Fri, 02 Aug 2019 06:07:51 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 q21sm12798408lfc.96.2019.08.02.06.07.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 06:07:50 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>, 
 xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <3d07492e9a9e1ebb1bff17a4f42afa2bd9ec1723.camel@suse.com>
 <a71ddd42-173d-32be-0674-47818316232e@gmail.com>
 <189da8d7-dee8-18f8-fbbf-699761f0b656@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <d92cecb0-397a-004f-aa80-e2761d9fadb5@gmail.com>
Date: Fri, 2 Aug 2019 16:07:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <189da8d7-dee8-18f8-fbbf-699761f0b656@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMi4wOC4xOSAxMjoxNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBJIGNhbiBtYWtlIHN1
Y2ggYSBsaXN0LCBob3cgaXQgaXMgZG9uZSBpbiB0aGlzIHNlcmllczoKPiAKPiAgRnJvbSB0aGUg
bGlzdCBiZWxvdyBpdCBpcyBub3QgY2xlYXIgd2hhdCBpcyB0aGUgc3BsaXQgYmV0d2VlbiBoeXBl
cnZpc29yIHRpbWUgYW5kIGd1ZXN0IHRpbWUuIFNlZSBzb21lIG9mIHRoZSBleGFtcGxlcyBiZWxv
dy4KCkkgZ3Vlc3MgeW91ciBxdWVzdGlvbiBpcyAqd2h5KiBkbyBJIHNwbGl0IGh5cC9ndWVzdCB0
aW1lIGluIHN1Y2ggYSB3YXkuCgpTbyBmb3IgdGhlIGd1ZXN0IEkgY291bnQgdGltZSBzcGVudCBp
biB0aGUgZ3Vlc3QgbW9kZS4gUGx1cyB0aW1lIHNwZW50IGluIGh5cGVydmlzb3IgbW9kZSB0byBz
ZXJ2ZSBleHBsaWNpdCByZXF1ZXN0cyBieSBndWVzdC4KClRoYXQgdGltZSBtYXkgYmUgcXVpdGUg
ZGV0ZXJtaW5pc3RpYyBmcm9tIHRoZSBndWVzdCdzIHBvaW50IG9mIHZpZXcuCgpCdXQgdGhlIHRp
bWUgc3BlbnQgYnkgaHlwZXJ2aXNvciB0byBoYW5kbGUgaW50ZXJydXB0cywgdXBkYXRlIHRoZSBo
YXJkd2FyZSBzdGF0ZSBpcyBub3QgcmVxdWVzdGVkIGJ5IHRoZSBndWVzdCBpdHNlbGYuIEl0IGlz
IGEgdmlydHVhbGl6YXRpb24gb3ZlcmhlYWQuIEFuZCB0aGUgb3ZlcmhlYWQgaGVhdmlseSBkZXBl
bmRzIG9uIHRoZSBzeXN0ZW0gY29uZmlndXJhdGlvbiAoZS5nLiBob3cgbWFueSBndWVzdHMgYXJl
IHJ1bm5pbmcpLgpUaGF0IG92ZXJoZWFkIG1heSBiZSBhY2NvdW50ZWQgZm9yIGEgZ3Vlc3Qgb3Ig
Zm9yIGh5cCwgZGVwZW5kaW5nIG9uIHRoZSBtb2RlbCBhZ3JlZWQuCgpNeSBpZGVhIGlzIGFzIGZv
bGxvd2luZzoKQWNjb3VudGluZyB0aGF0IG92ZXJoZWFkIGZvciBndWVzdHMgaXMgcXVpdGUgT0sg
Zm9yIHNlcnZlciBhcHBsaWNhdGlvbnMsIHlvdSBwdXQgc2VydmVyIG92ZXJoZWFkIHRpbWUgb24g
Z3Vlc3RzIGFuZCBjaGFyZ2UgbW9uZXkgZnJvbSB0aGVpciBidWRnZXQuCllldCBmb3IgUlQgYXBw
bGljYXRpb25zIHlvdSB3aWxsIGhhdmUgbW9yZSBhY2N1cmF0ZSB2aWV3IG9uIHRoZSBndWVzdCBl
eGVjdXRpb24gdGltZSBpZiB5b3UgZHJvcCB0aGF0IG92ZXJoZWFkLgoKT3VyIHRhcmdldCBpcyBY
RU4gaW4gc2FmZXR5IGNyaXRpY2FsIHN5c3RlbXMuIFNvIEkgY2hvc2VuIG1vcmUgZGV0ZXJtaW5p
c3RpYyAoZnJvbSBteSBwb2ludCBvZiB2aWV3KSBhcHByb2FjaC4KCldlbGwsIEkgc3VwcG9zZSB3
ZSBtYXkgYWRkIGdyYW51bGFyaXR5IHRvIHRoZSB0aW1lIGFjY291bnRpbmcsIGFuZCB0aGVuIGRl
Y2lkZSBhdCB0aGUgc2NoZWR1bGVyIGxldmVsIHdoYXQgd2UgY291bnQgZm9yIHRoZSBndWVzdCBl
eGVjdXRpb24gdGltZS4KCkJ1dCBpdCBpcyBzbyBmYXIgZnJvbSB0aGUgZW5kLCBhbmQgd2UgYXJl
IGhlcmUgdG8gZGlzY3VzcyBhbmQgYWdyZWUgdGhlIHN0dWZmLgoKLS0gClNpbmNlcmVseSwKQW5k
cmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
