Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7A43346
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 09:22:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbK0a-0004DS-5b; Thu, 13 Jun 2019 07:18:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okag=UM=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbK0Y-0004Ci-6E
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 07:18:50 +0000
X-Inumbo-ID: 7cafe6d1-8dab-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7cafe6d1-8dab-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 07:18:49 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id i21so17476350ljj.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2019 00:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aZQQhyVJ/wwYRbIScFICYHjpb2zl9pC/Jce/e31FP2Q=;
 b=nriUd9NsEfDDp+2S33QsINk6/upsw8gc8QZJ8PfH9jmXAbWN1dLQ8dTXpo/Le8aS8E
 /KOpX8/oKkEWVll83fgICSRiONjYvOSw70V+SoiUSN6N10ex3bytyjRNDa1tZd/Ke+CL
 GQ4UTxKOu3Dk/mGbNWoOTB37CCwCN5LARxqCVQt3mSQe/jGP085vbJA8tp3g52OeRfnG
 ypizZJ2zzVX84mqYCRKO1T8eose34H5eZmN2h4er4OUmEl6nwtHlnWgSppaO6u5i8+f3
 Hg2oDFozAM1FIkYqK2bVh0HFigTFIjjlTTCW8ImGEmCvvNgwmCB0rmGRL2gJXKAbqaLv
 duCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aZQQhyVJ/wwYRbIScFICYHjpb2zl9pC/Jce/e31FP2Q=;
 b=oHH77kI83fAegPN2ECgemPGybituE09IoY+I8NA1TbxYuk/FeqapkwYJXGQ5tjx4Zo
 gHHBMyAe5fb6mtaanrP49Y+QPLRx9Akl5KYxma4URGSdvJT4jtdJh5s+yjB71yRflYuE
 NuPNrEWM4WVC2/yklIrFeU3VZivr7K6Gw3Aw1iKUDwI8TgEtxy0YbfWB/BCi24yGiwwc
 r3Bde87hXAi7zu5J1TWmhZ90L/ooynJOeNVSwPPlDDfZOsFum/sUvLNAPZkeF74K4r/Q
 zfCWkS95ZMpTbGjsXCvJGD99lJMzzamZygUz2cw6tvuX4CRSNv6gogwHlOx8TkXyiEO9
 vX9A==
X-Gm-Message-State: APjAAAUSO9d7CZ3YCQ/yTOpKr6mPOPnqwwLcAsy8y1tx2rn9dYlyL0RX
 cSLOp9klHqamndxD8d0gsCg=
X-Google-Smtp-Source: APXvYqzFPEjzH7E03XKDZ7WRgunLzVsxhMAPFaDqpKJrxZ1cdK27CHC++LHVobqRLKBHo6xxwn4tIA==
X-Received: by 2002:a2e:9188:: with SMTP id f8mr26929433ljg.33.1560410327618; 
 Thu, 13 Jun 2019 00:18:47 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 b11sm416988ljf.8.2019.06.13.00.18.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 00:18:46 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-14-jgross@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <c2fcade8-8cad-9f02-0f1b-35e0b156ff72@gmail.com>
Date: Thu, 13 Jun 2019 10:18:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528103313.1343-14-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVlcmdlbiwKClBsZWFzZSBub3RlIHRoYXQgdGhpcyBwYXRjaCB3aWxsIGNsYXNoIHdp
dGggWzFdLgoKT24gMjguMDUuMTkgMTM6MzIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gdmNwdS0+
bGFzdF9ydW5fdGltZSBpcyBwcmltYXJpbHkgdXNlZCBieSBzY2hlZF9jcmVkaXQsIHNvIG1vdmUg
aXQgdG8KPiBzdHJ1Y3Qgc2NoZWRfdW5pdCwgdG9vLgoKYGxhc3RfcnVuX3RpbWVgIGlzIG1vdmVk
IHRvIGNyZWRpdCBwcml2YXRlcyBhcyBmb3IgY3VycmVudCBzdGFnaW5nLgoKClsxXSBodHRwczov
L3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdDtoPTYwODYzOWZmYTBh
MGQ2ZjIxOWUxNGJhNzM5N2FiMmNjMDE4YjkzYzkKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlz
b3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
