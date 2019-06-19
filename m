Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCF24BDCE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 18:13:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hddAr-0007TB-Bh; Wed, 19 Jun 2019 16:11:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=czgQ=US=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hddAq-0007T6-LX
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 16:11:00 +0000
X-Inumbo-ID: d30b522c-92ac-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d30b522c-92ac-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 16:10:59 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k18so3793082ljc.11
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2019 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DkdCCxdH3ELE2lA1c2J5OgyBATeOrVqqNxAP0f5L51s=;
 b=JfcWppR7snySwxfaFXbAkhtWJZ0Dl89udKei6V6Nieuq5uTawSVyPql5vVwlXjQJKM
 z4IXIqu48OrAMGuggocPPJV0LiXNYjf8366tn1R7uEO9JF4O9aKZuN08dDJmEna+U8Ar
 G7jZTrOEvkFoFtUMVJqpGhFIK2PvTsm7RsBaRmMid/9taf/oy642yA4lRYefYVbsUz/P
 ZTKSJ/oCX0b7WC4qw8j3LIUVRN9/WMHU3VlZ5YfBjOY4K0M+11WBaHiSH0flMdY0Cxll
 Vrux81FmYCYObnC7Q4mCG8DLIPXTf+HKTNYEnypqU9y45WSCex0Ln9lr8VfqxicgjMco
 X/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DkdCCxdH3ELE2lA1c2J5OgyBATeOrVqqNxAP0f5L51s=;
 b=e/Oqy/Xt0SaiAk4Q380wCXRDqMeawB7Y3646xnzjY8MugJTglh/AqW9wmgW1RbDDaq
 bLBn7T6ykLOaMAoAm7rjlFXCRPX6lTMlvi+2cbHM2YWMxwebnT67dfO/Q7T7y7jy2ktd
 +OCAlfuCJC5yIKBpEkaUeWNIwcN/HhbTOT78aG8b5VLpUhj8XCxmHy8XDkK4b/p6Fco6
 9qpxZ93zMfJAmf1mturNkVWD2YElu2RwLb+1yP9G/cm2bds9JUM9UzCTIgUZ0gxLajeP
 GNtql3qL5QvoyNGMUu/MyAkaC4KDGjtqIc3ZHVoKgihVElgYuvlmnto5QZClM/rKEMpm
 WJAw==
X-Gm-Message-State: APjAAAUOmsM9gug7O3Gl/l1oV+o2dPyJDO6vPp9kTLWqyaEUq48JRCLF
 pXGeLVvdfwFTWTXUEtd0G8izajeU6L4=
X-Google-Smtp-Source: APXvYqz4W+j8LIR66JY/EWtrFEZx7Ye8VpuZBbBH2x19Rqtibl9HFrtJqZtj5LnhIlfycFPzJy9UIA==
X-Received: by 2002:a2e:730d:: with SMTP id o13mr22794024ljc.81.1560960657318; 
 Wed, 19 Jun 2019 09:10:57 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 89sm2948130ljs.48.2019.06.19.09.10.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 09:10:56 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Denis Obrezkov <denisobrezkov@gmail.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
 <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
 <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
 <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
 <45406dbd-4aa1-8852-475e-1c37c93a7fa3@gmail.com>
 <04e2ff99-1276-a99b-b86c-825cf8cea858@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <f19a481d-88ba-7880-2baa-20b2b98027aa@gmail.com>
Date: Wed, 19 Jun 2019 19:10:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <04e2ff99-1276-a99b-b86c-825cf8cea858@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS4wNi4xOSAxODozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFJlZ2FyZGluZyB0aGUg
cGxhY2VtZW50IG9mIHRoZSBjb2RlLCBJIGFtIHN0aWxsIHNwbGl0IGJldHdlZW4gdHdvIG1pbmRz
IChlaXRoZXIgaGVhZC5TIG9yIGEgbmV3IHNwZWNpZmljIC5TIGZvciBvbWFwKS4gSG93ZXZlciwg
dGhpcyBjb3VsZCBiZSBkaXNjdXNzZWQgb25jZSB0aGUgcGF0Y2ggaXMgc3VibWl0dGVkLgoKSU1I
TywgdGhhdCBpcyBhIHB1cmUgcGxhdGZvcm0gc3BlY2lmaWMgY29kZS4gRk1QT1YgaXQgc2hvdWxk
IGJlIGFuIGlubGluZSBhc3NlbWJseSBpbiBvbWFwNS5jLCBvciBvbWFwNS5TIHVuZGVyIHBsYXRm
b3JtLgoKPiAoQmVhciBpbiBtaW5kIHRoaXMgaXMgbGlrZWx5IHRoZSBmaXJzdCB0aW1lIERlbmlz
IHdvcmtzIHdpdGggdGhlIFhlbiBjb21tdW5pdHkpLgpZZXA6KQoKLS0gClNpbmNlcmVseSwKQW5k
cmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
