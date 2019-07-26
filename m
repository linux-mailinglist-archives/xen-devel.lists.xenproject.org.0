Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA079763CD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:46:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqxi9-000827-5z; Fri, 26 Jul 2019 10:44:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQyu=VX=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hqxi8-00081z-2r
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 10:44:28 +0000
X-Inumbo-ID: 5665988b-af92-11e9-8980-bc764e045a96
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5665988b-af92-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 10:44:27 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id h28so36728502lfj.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gIWmyT8w3U+4wNmThR4A8/fMlTSyxbQR8oPrsz2v5UU=;
 b=qFJ+cT8WP+XcjL0M2CkiiUoEgRLXAQNb9GqrCAbmPRoY9VYN1YvaMa208XiGYSyhJ2
 +7CFjToB1gplgfOOyeZL9lYSPGbQb9OBceMUuUcDF4Jl0TGgeze/tyDnDk6s/vB6WSBh
 K8O72dI4eMh4NHXR65clREOwQVCeSTmQxh8hFhTACrEFTrBr+XnfKEG5Nls6uCjE2FkP
 9TUvI0qvhog+fdLaYQS9fmrpTO8CoB8r62BHbcjQDW4gr+MUXhSNplbouZEcFavcsRxt
 W6fsGYipTpEvg9Ph4JYMYb9nAPaMxN9sMP6bva6x6JsegYGeWCgR4qr1tJzRwuu7Us2h
 WCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gIWmyT8w3U+4wNmThR4A8/fMlTSyxbQR8oPrsz2v5UU=;
 b=C0FJ69pTLBq87zeZqKxKV0kY0vPuXCJcP1GzUMAdRYK1cjkfatlGvS1K95gGVi2y5Q
 o5nYpYMKoYV1MKiMyWiCYyWcWG/Kg2Ja+TtoD3XSsyi+hMlphxzlugAkI5rI2u9fqRb1
 WQrNE9yZ4SdJS4L2h2Q6FqJmn013HjV7t55Q20M0acw8S5AyYQOMHcxATuWRdruvj7cv
 TvKoLIj3mMoXrq8Mb+sZbUE7vxdfZq5sZL5pzQuFc5ESuykb1VY6KCmpYOtiWhXFpjZG
 zmaFFC0MsCCUdKHGoPdWijLfwHfN6aIi/byrngyWQ0FuEIHRqh7uTBBT5lJNhXMWJUAQ
 7iTQ==
X-Gm-Message-State: APjAAAVQtZTLfJTBPLH2bAcHfRexZAiQ+a4LYokvPPXC/i9vEAIxDgkS
 NKk/dzjilXDD3GH5+5e4rc8=
X-Google-Smtp-Source: APXvYqzwPEEYNNE3+w8ctzXpKEGb2ogRLQ7GlqtdA7p8rjLwXgJlGnzgz7LHdThk9ma7zrjHem3pcg==
X-Received: by 2002:a19:4a50:: with SMTP id x77mr131587lfa.91.1564137865538;
 Fri, 26 Jul 2019 03:44:25 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 n24sm10002686ljc.25.2019.07.26.03.44.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 03:44:24 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-6-git-send-email-andrii.anisov@gmail.com>
Message-ID: <6552848a-b2fa-e3fe-11d0-af8fb4b7cc21@gmail.com>
Date: Fri, 26 Jul 2019 13:44:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564137460-25629-6-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] 
 =?utf-8?b?W1JGQyA1LzZdIGFybTY0OiDRgWFsbCBlbnRlcl9o?=
 =?utf-8?q?ypervisor=5Fhead_only_when_it_is_needed?=
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnkgZ3V5cywKCkkgd2FzIGVsaW1pbmF0aW5nIGN5cmlsbGljICLRgSIgaW4gdGhlIGNvbW1p
dCB0aXRsZSBhbmQgb2NjYXNpb25hbGx5IGxlZnQgdGhpcyBwYXRjaCBpbiB0aGUgZm9sZGVyLgpQ
bGVhc2UgaWdub3JlIGV4YWN0bHkgdGhpcyBwYXRjaC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBB
bmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
