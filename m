Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D201C6D2D7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 19:35:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoAHf-00069S-66; Thu, 18 Jul 2019 17:33:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nWwS=VP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hoAHd-00069D-IF
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 17:33:33 +0000
X-Inumbo-ID: 291420c9-a982-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 291420c9-a982-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 17:33:32 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v85so19776767lfa.6
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FljBvERFMnI9Majbjpbwb6oS48rYvM63QGTIPQOtI/o=;
 b=uxx/1QAcQxt5g+WZZFjbzQnsZ34J3qQ2EMRb594eLOcZSAJdLTKJpsGQQnohHmcx2p
 dxZXloQm8/n+zqZhyi28X3KUe+pTLbKxyPAovBlmkYDLOW1Oq4jWFPu+nkTccUjMaEqn
 dyEEx+II21KgLpZU6oCXQT5wqpZY3N0+sjzr4GOWMmr79+zjefxGW7wx/fqBNB017w5r
 jFSe90084TWUQFwtT29PwuXk4XkfYFwnKvkRE8REgLBKuaQgeb2SszP8eDLhxE0HsaqI
 t0Q42BiRwqUbm42Phxlf+jY6J61ScnRBOT0GJt16RrYjTSz69oenLlxGl41eJgtjqBDr
 0trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FljBvERFMnI9Majbjpbwb6oS48rYvM63QGTIPQOtI/o=;
 b=ckV4X87Zbs7JaMKdzwWNk+oyC6s007Ip3NoLzqpyrSZpvYVSlTMLB7xx5182p0RSJ5
 /DrR8Gv10iyJYDtnEkqXA/VJ847lHkDkVLcuJKRjILFiViTcp6ptzdRqZSqw/86UFAwd
 1Razmhol53255GP99XMZ94aoh3ZKWV2V9VO8Uezv9geeqyqb6a3ZfLw/9p+/KURqRnr9
 gIPgDKrsSK51hrdSp13fgUdnQ6YPvmVjQmudNZ9/n6HwnOuAO2/5CES+xLuC794hh9hh
 NtWA8XznIq+npdCGy7BZo7DQRGVIWpfL+9rFbRNRUbnBgO9GvBXpAGs/vCvNrgB0DSlH
 VeLw==
X-Gm-Message-State: APjAAAV2G5BeGxd+jkVBgI84W+kKlLwZDOkJOLzjzhuYqPNPVoEOJoTs
 I+DwpeHC2SWLCfyczyPHW7s=
X-Google-Smtp-Source: APXvYqyP72LySgD9lyXPUmQfX+N+hIp1FhNwJMmA7WqM5/BYpw+UlLDkrmdfCcZ31EOMObptG7z4Ew==
X-Received: by 2002:ac2:4a78:: with SMTP id q24mr20151217lfp.59.1563471210587; 
 Thu, 18 Jul 2019 10:33:30 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 u22sm5804221ljd.18.2019.07.18.10.33.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 10:33:29 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <581a9cc4-5ba7-717e-faf3-ac52d529d61d@citrix.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <e3d349b3-76bc-677e-5209-fb09fc9b3ea7@gmail.com>
Date: Thu, 18 Jul 2019 20:33:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <581a9cc4-5ba7-717e-faf3-ac52d529d61d@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gQW5kcmV3LAoKT24gMTguMDcuMTkgMjA6MTYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4g
SWYgeW91IGNhbiBjb21lIHVwIHdpdGggYSBzdWl0YWJsZSBwaWVjZSBvZiB0ZXh0LCBJIGNhbiBm
aXggdXAgb24gY29tbWl0LgoKRm9sbG93aW5nIHRleHQgbWlnaHQgaGF2ZSBhIGJldHRlciByZWZl
cmVuY2UgdG8gdGhlIGN1cnJlbnQgcHJvYmxlbToKCkN1cnJlbnRseSB2dW5tYXAoKSBpcyBjYWxs
ZWQgZnJvbSAgZnJvbSB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgd2l0aCBhbgphZGRyZXNzIHBv
dGVudGlhbGx5IG5vdCBwYWdlIGFsaWduZWQuIEluc3RlYWQgb2YgZml4aW5nIHRoYXQgaW4gQVJN
IGNvZGUsCndlIGxldCB2dW5tYXAoKSBtYWtpbmcgYWxpZ25tZW50IGJ5IGl0c2VsZiBhbmQgc3Ry
aXBwaW5nIG90aGVyIGV4aXN0aW5nCnZ1bm1hcCgpIGNhbGxzIGZyb20gcHJpb3IgbWFza2luZy4g
VGhpcyBtYWtlcyBpdCBjb25zaXN0ZW50IHdpdGggaG93CnssdW59bWFwX2RvbWFpbl9wYWdlKCkg
Y3VycmVudGx5IHdvcmtzLgoKV2l0aCB0aGUgbWFpbiBjaGFuZ2UsIGFsc286CiAgLSByZXBsYWNl
IG9wZW5jb2RlZCBQQUdFX01BU0sgbWFjcm8gaW4gdm1faW5kZXgoKQoKU2lnbmVkLW9mZi1ieTog
QW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHksCkFu
ZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
