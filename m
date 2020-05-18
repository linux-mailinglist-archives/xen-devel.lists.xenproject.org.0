Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996321D8003
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 19:24:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jajUL-0006lW-Bq; Mon, 18 May 2020 17:23:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZ0o=7A=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jajUK-0006lR-BJ
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 17:23:40 +0000
X-Inumbo-ID: 5046b21e-992c-11ea-b07b-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5046b21e-992c-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 17:23:39 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i16so4689976edv.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1PfetM1HV7IUId1vPTGru1KVmn3gL8fLaU41twFYtLA=;
 b=gwQkfFUf4EgM13hwWdAQrDQ5+BzrE3p6NRcBxRu0knzdQX5qg1W3Gzrlfzl7f7Rms2
 x2MTp9nn8672BecnUt90ywzRbQomEIegSwn2k1J+ykR4oRwNf9nvcNW1sik/2IZjByna
 CMbB9C6SANDa3K2zWDaTj79t33DSoZEYHM8Yd41hiiWPDcCDP73e8dSVBUa7oSlFQxW2
 m2PbomZJdFdlhyR+p1a0c9yCXqrV47m2JDYlEEfcTq6BJEviOLAYnkGhu93TzDfjiVyk
 k044PSBAFlt8rEQ+8fuIiSlJ2BCAlSV5qC0CSTkieJWa9tqu459tfIvpCovlAnJz7AWs
 qwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1PfetM1HV7IUId1vPTGru1KVmn3gL8fLaU41twFYtLA=;
 b=P70FViZIh1VwEvXCBb5p0vuLM6pyhb4YRCvc6aZa4OiJ8Pt/cR07xTczmlSvncrKZB
 f/pyj1gxeJDHgYCvBaHuenl5Awh9khn+sm4u9z8aHWw6VT8kpVXTwLCCSwpc1VdtAKTF
 VbP9n9y87fZqNAcPH3lVsFOIYYK7fBO24a8SZowsSWovS7rkUd5AV//fah61VMZ0YBT9
 WjF4cIXvDqm1FmIGpsuCLPlKQXOPy7rfe2C5TqvdVd09RCRmkc4z119g85ystSSfzUAg
 iU9WHjPilIHv/Js/s6Q9sefVkzCz42UAIQ2MXoQT7NZe/6LEZMkKMsPf/NDsd7GrRaoh
 xxqg==
X-Gm-Message-State: AOAM5310ulniFKI3GH0whIxrhCz3b86fDRgsbRC6Kd6rjiyOtD9Mwret
 vkeE9R4rmSFdR+n08kFT89lup223cKc=
X-Google-Smtp-Source: ABdhPJyQ7RQ6jfOJL1jFmB2KHYLqUV7yrhvk+C22kIBbp9PsWL7xN1yHZtR00dRpwrwmBw1968cofA==
X-Received: by 2002:a50:a7e3:: with SMTP id i90mr15098667edc.6.1589822618283; 
 Mon, 18 May 2020 10:23:38 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id x7sm1403212ejc.58.2020.05.18.10.23.37
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 10:23:37 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id e16so12795943wra.7
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 10:23:37 -0700 (PDT)
X-Received: by 2002:adf:fccd:: with SMTP id f13mr21598322wrs.386.1589822616817; 
 Mon, 18 May 2020 10:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200516122221.5434-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200516122221.5434-1-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 18 May 2020 11:23:00 -0600
X-Gmail-Original-Message-ID: <CABfawhkYRjCegBwMxqhzLNnTneV9WWb=WeYFep=OK2f0qv5TyQ@mail.gmail.com>
Message-ID: <CABfawhkYRjCegBwMxqhzLNnTneV9WWb=WeYFep=OK2f0qv5TyQ@mail.gmail.com>
Subject: Re: [PATCH] x86/hvm: Fix memory leaks in hvm_copy_context_and_params()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, May 16, 2020 at 6:22 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> Any error from hvm_save() or hvm_set_param() leaks the c.data allocation.
>
> Spotted by Coverity.
>
> Fixes: 353744830 "x86/hvm: introduce hvm_copy_context_and_params"
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks for the fix, my bad!

Tamas

