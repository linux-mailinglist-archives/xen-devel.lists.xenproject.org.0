Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E2F7600C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 09:46:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hquu4-0000xA-Ge; Fri, 26 Jul 2019 07:44:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQyu=VX=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hquu2-0000wk-LC
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 07:44:34 +0000
X-Inumbo-ID: 34b33744-af79-11e9-8980-bc764e045a96
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 34b33744-af79-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 07:44:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id d24so50519666ljg.8
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 00:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vMhww4Kp93ZEIijf+K14VeP3q7R6DZ2suNPsE7s+B4s=;
 b=SGkHlHfh69FsCuzYGSZIEPQ3UdIrlMoyMAp2SKaqoQGjWUfP1tzKPwDJfVy/en534Y
 SyK+tofzDNkJ4jq6/pHCwh7vVgNEArhEPB4NsMVPlB1mQcAZ4D1lZxumd90oBiM1n+W8
 WKXZYeZ8nokSTOYCGC8C6uSDyfFaIt4WY9l2mA46nP2eKJeFofvXCEC9GAjoW3PFOpRb
 pZ+VoNQJON0XTsQzUpP4VuHDOHQ9Z85KUCtJuT3H00HyUVPYUUXibQazMTrSKEep8bL9
 MjXHz98gdmAWBJqseV1C6ZEElQrtWnWBJzdqU2qzkGp5hWxRBe7S3jsgjIj3fmDEUtns
 LTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vMhww4Kp93ZEIijf+K14VeP3q7R6DZ2suNPsE7s+B4s=;
 b=EAl6KND1c0a0SEC5bF1E14X42qOvjxDBICRPCtoB4RyiVPCNFuVifNkhELeVhX0+FN
 /+xZQgW7GtZ8EhkyuwF1rYPHZSOYEumccjaEhcvQIGYTEVNRt4JCInYtFE1Bm+26VPDK
 +xvcSUM4ADv1eR26+yhy16/CHtL5GXPNvIXMzArMbFvh7UGu7TJOmob0NUloTREa1+qq
 jNq96gghl+9otpw3VGyhDHRbHjRX8xn5iRgRcAhSpbkaxGNAt5N3ckX9lH/ncJUNpY36
 2wjR3SsduKJ+mLTkHrTARf8exDUG8jnWPbuIM9Iiuebh+DX4VOue48S5e9srtt6Yw1uH
 buVg==
X-Gm-Message-State: APjAAAVV5bqIjbdM2iMpBGsMd1b60YwASPLKK0KSguM9wu+rBXt5XpXE
 No3ppZxJJFK/40TjBUyH51BYAXpy
X-Google-Smtp-Source: APXvYqwhviILChVpD2LSq+Zbv6sL8Mx3E8suy+UaW3S9qyvgouUadVf/jt0d22SZiPriKXm1uniNZA==
X-Received: by 2002:a2e:5b5b:: with SMTP id p88mr12761299ljb.192.1564127071062; 
 Fri, 26 Jul 2019 00:44:31 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 c19sm8056401lfi.39.2019.07.26.00.44.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 00:44:30 -0700 (PDT)
To: Raushan Kumar <Raushan.Kumar@kpit.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <BMXPR01MB27756A5FB61F20E8035AE7E58FC00@BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <748a561c-6a59-58a9-0a65-4b8f37b09f68@gmail.com>
Date: Fri, 26 Jul 2019 10:44:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BMXPR01MB27756A5FB61F20E8035AE7E58FC00@BMXPR01MB2775.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
Subject: Re: [Xen-devel] Assign dedicated CPU to domain
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gS3VtYXIsCgpPbiAyNi4wNy4xOSAwOToyNiwgUmF1c2hhbiBLdW1hciB3cm90ZToKPiBD
b3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgbWUgYW55IHJlbGV2YW50IGxpbmsgZm9yIHNhbWU/IEkg
aGF2ZSB0d28gQ1BVIEFSQ0ggQ29ydGV4IOKAk0E1NyBhbmQgQ29ydGV4IEEtNTPCoCBhbmQgSSB3
YW50IHRvIGFzc2lnbiBkb20wIHRvIENvcnRleCDigJNBNTcgYW5kIGNyb3NzIGNoZWNrIHRoYXQg
SXMgaXQgYXNzaWduIHRvIHNhbWUgb3Igbm90PwoKQXMgbG9uZyBhcyB5b3UgaGF2ZSBiaWcuTElU
VExFIG9uIHlvdXIgc2l0ZSwgeW91IHNob3VsZCByZWFkIFsxXS4gSXQgYWxzbyByZWZlcnMgd2F5
cyB0byBwaW4gVkNQVXMgdG8gUENQVXMuCgpbMV0gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9ZG9jcy9taXNjL2FybS9iaWcuTElUVExFLnR4dAoKLS0g
ClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
