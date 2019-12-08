Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99E511617D
	for <lists+xen-devel@lfdr.de>; Sun,  8 Dec 2019 13:00:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idvBe-0000Ea-1y; Sun, 08 Dec 2019 11:57:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+SuD=Z6=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1idvBc-0000EV-MT
 for xen-devel@lists.xenproject.org; Sun, 08 Dec 2019 11:57:16 +0000
X-Inumbo-ID: e006fe4a-19b1-11ea-86b0-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e006fe4a-19b1-11ea-86b0-12813bfff9fa;
 Sun, 08 Dec 2019 11:57:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so12513908wmg.0
 for <xen-devel@lists.xenproject.org>; Sun, 08 Dec 2019 03:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cpOQV/RaTbnMFBdFB3DrE6iIutsMZwklTFZrcC27u4o=;
 b=KUHghxkpunI/383PDQPHKFeW6frtPB06nZEamCqwVVkxaWWQANMNpuTo8+DYDSlKke
 Cr5+/DqUtorjmCozn0RDT2K4LCk42xDpJTSL0+koqKnlaWcIa+jt417TnkGPCKtoreYm
 vtrI/71mwAt28zMvtfOWy6bJkK69ccg61AdKBKqa0/Gt+QL1YBMfVet2/fR16tKguotQ
 rIBrxmWnTdE12ia+Dtmmo12JxPj+vMiWxeTYTQ9iTGQh9z1z+MZNr2VZzKasLobr4BkX
 U+qMoqLF8VJnaBb1c+HgFXmFWwdf+uU4L7lyRv5BBOzi8KXCX4YHN/vwu3dguXvDUFYu
 iTwA==
X-Gm-Message-State: APjAAAXVehjIz75m87xr25P+fUmjChc9qlcRqNXJZ2SroJjG59KeW38G
 3oQUdJPTPbDczqWOFXJ7u4U=
X-Google-Smtp-Source: APXvYqxQRZNZgr4D87ebcE9Qay31BMdgWT4YWyBsBoNjf0+ZvN2N169GmS8qW3Xmc/dKjUs3SqcMAA==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr21193693wmg.66.1575806234310; 
 Sun, 08 Dec 2019 03:57:14 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-225.amazon.com.
 [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id l6sm9774930wme.42.2019.12.08.03.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Dec 2019 03:57:13 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7e1eae0d-d022-b9b1-eead-afd481a6fe69@xen.org>
Date: Sun, 8 Dec 2019 11:57:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191205223008.8623-2-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/6] xen/tasklet: Fix return value
 truncation on arm64
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMDUvMTIvMjAxOSAyMjozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBU
aGUgdXNlIG9mIHJldHVybl9yZWcoKSBhc3N1bWVzIEFSTSdzIDMyYml0IEFCSS4gIFRoZXJlZm9y
ZSwgYSBmYWlsdXJlIHN1Y2ggYXMKPiAtRUlOVkFMIHdpbGwgYXBwZWFyIGFzIGEgbGFyZ2UgcG9z
aXRpdmUgbnVtYmVyIG5lYXIgNCBiaWxsaW9uIHRvIGEgNjRiaXQgQVJNCj4gZ3Vlc3Qgd2hpY2gg
aGFwcGVucyB0byB1c2UgY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpLgo+IAo+IEludHJvZHVj
ZSBhIG5ldyBhcmNoX2h5cGVyY2FsbF90YXNrbGV0X3Jlc3VsdCgpIGhvb2sgd2hpY2ggaXMgaW1w
bGVtZW50ZWQgYnkKPiBib3RoIGFyY2hpdGVjdHVyZXMsIGFuZCBkcm9wIHRoZSByZXR1cm5fcmVn
KCkgbWFjcm9zLiAgVGhpcyBsb2dpYyB3aWxsIGJlCj4gZXh0ZW5kZWQgaW4gYSBsYXRlciBjaGFu
Z2UgdG8gbWFrZSBjb250aW51YXRpb25zIG91dCBvZiB0aGUgdGFza2xldCB3b3JrLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4g
QWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
