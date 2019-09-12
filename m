Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1517B0EE6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 14:32:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8ODl-0000Fe-QN; Thu, 12 Sep 2019 12:29:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fyaC=XH=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i8ODk-0000FZ-Ni
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 12:29:08 +0000
X-Inumbo-ID: ea2694e6-d558-11e9-b299-bc764e2007e4
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea2694e6-d558-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 12:29:08 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id y23so23061265ljn.5
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2019 05:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+7rta2fludm3bujP96CCqYuKlD/w9QmHyp6NU/Zmefo=;
 b=uCQ37pqCwbWVMGHvb7HH8gAtt5HG3z/5znyX/81H8+VR4S6cB0kc0mLn8lsb2R+OZ7
 scx1/PhMyS3EoerJIWsCnmtXtHZSxeY2G3jwTi3TamIuhmOymo8VpQUNNNDeQPYPaE8R
 t8kPr009aMUbx0YLzr5ydPb+6u5eb4FCW6vuCjIHAxpVCVcnfgJwQUYjOpJdB37bL7Ga
 49eB/DWNhXgO3y/4co01yg8gBOSeQjtKMDnCNrK8nw0c8SBCSEni7dnso3ZKuipjI+JF
 aGdOtsihDQFftUdkWaZwlC3zGx9xxfTpox5w63xi1kb6ifSr316rOtc4xuwRXN28p4aH
 omEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+7rta2fludm3bujP96CCqYuKlD/w9QmHyp6NU/Zmefo=;
 b=ThPwK+Tbft+xUhLg7wATu747TIl3qryg+GpqyxJ4eKOeGksQTll79dIumPheeZHlDh
 yX6SHBda3JAF6Je6/zqJ/6RLpQ2j3tM8AhC0MpEI5jKHaEfP+qO4g7UGSWZMgt97ZWSV
 GeT5Ym+fhoK2+6nO7Tic3ZGpLQPiWUveNqQTl9phygQYiWzJWgPfXL/YQXYW40KyciPu
 k0QnbwgSo2cGh8K2ZXEWVO8gYySNDtfVwpX3caCKeyKLBYIORCVpQ1z5gw0JlPOMII47
 8sifFOhCE34lC10SIGtbP+7PHdePLkOtG1BFCIbhVXR7/FS5TM4e40zfPNg6WHdAUnnR
 Oo5A==
X-Gm-Message-State: APjAAAVKMnE4qw/QMEEzHRIFEOC5vz6XIwNemsIRPhhUNeR8lhG4leXU
 QG+LbC4v7BRgWZkVecDAgE8=
X-Google-Smtp-Source: APXvYqy7YV/tBB9B0EHt84A7g0f7wUBv0x/++nuSlo7RyrERmSn7+fOCHwKR8Bth9CMIotxTbs8a5w==
X-Received: by 2002:a2e:8114:: with SMTP id d20mr518824ljg.200.1568291346785; 
 Thu, 12 Sep 2019 05:29:06 -0700 (PDT)
Received: from [10.17.180.84] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 b12sm5614643lji.24.2019.09.12.05.29.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 05:29:06 -0700 (PDT)
To: Julien Grall <julien.grall@gmail.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
 <1568197942-15374-5-git-send-email-andrii.anisov@gmail.com>
 <87pnk6g1vz.fsf@epam.com> <3d39ee7e-f63a-0fa6-c323-ff4742627ea4@gmail.com>
 <CAF3u54BG4F-10UOCqAdTWgAHkB-sYdZUupbr0VrEZD8fjOda+Q@mail.gmail.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <98ad4381-43ab-fbf7-2b6d-9b06fb47d7f5@gmail.com>
Date: Thu, 12 Sep 2019 15:29:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAF3u54BG4F-10UOCqAdTWgAHkB-sYdZUupbr0VrEZD8fjOda+Q@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 4/9] arm64: utilize time accounting
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMi4wOS4xOSAxNToxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoaXMgYW4gUkZDIGFu
ZCBJIGFtIHN1cmUgdGhlcmUgY3VycmVudCBzdGF0ZSBpcyBlbm91Z2ggdG8gc3BhcmsgYSBkaXNj
dXNzaW9uLiBUaGVyZSBhcmUgbm8gbmVlZCB0byB3YXN0ZSB0aW1lIHJlc2VuZGluZyBpdCBhbmQg
dXNlIGZpbGxpbmcgdXAgaW5ib3hlcy4KPiAKPiBQbGVhc2Ugd2FpdCBmb3IgbW9yZSB0aW1lLgoK
R290Y2hhIQoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
