Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDFC7AAF5E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 12:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606811.944856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjdIM-00051M-JW; Fri, 22 Sep 2023 10:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606811.944856; Fri, 22 Sep 2023 10:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjdIM-0004z6-Fu; Fri, 22 Sep 2023 10:21:58 +0000
Received: by outflank-mailman (input) for mailman id 606811;
 Fri, 22 Sep 2023 10:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5esq=FG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qjdIK-0004z0-TK
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 10:21:57 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dae5f3ef-5931-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 12:21:55 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32008b5e2d2so1444799f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Sep 2023 03:21:55 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z16-20020a056000111000b003176eab8868sm4037381wrw.82.2023.09.22.03.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 03:21:54 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: dae5f3ef-5931-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695378115; x=1695982915; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9yX/At7hT4WntygSSFE5HgnJcrjF1Z7QzHCDMuS7Hg=;
        b=cZ7mMJBhCOS//c/Vqzv94wOkGeKlUos8L66hBIDa13NH7C5XCwNTVAcwsSNfHCqft9
         Yu0JdYplMUbqEHT0JVM4RrHURS5d5J3tUSkTxJeRUQLZ3ZIP1Fm+wOS62unRxI8gxYfe
         ehuE0UpNlIudOfgib3pL+S6xgbui6Kw+AyT9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695378115; x=1695982915;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9yX/At7hT4WntygSSFE5HgnJcrjF1Z7QzHCDMuS7Hg=;
        b=FEgyvLjHxav9xogmfhQuOZpmMOJ/TEN/szSUou73e6RHg2cRWwjpwrNlmxx4NRDVk6
         unvDa2L4Gq3x5mc5agHL+j5L2DfIFSuPt5GiRBqZiUPHkw/LHRkPZ0j4CTHk/KAvCzB6
         B7tb77MdYzrjX0Dcb1kcS+Z7gG15inJ/mcXGz8VLkEWflzbgKJywUBmqvcLiQUbfdA+5
         SxiWHuUcXkqPi3bpAK10IZjp8YXk2wcRBp7Rfc4fIHX8LXTAklABKayM+Spb9cFzs12t
         AKbCGj47zgbFpqcMI0ruM6wnXfJOE6YPr3QnPFjMZK5zj316kc6hSDQu2caritK78sp3
         lVeQ==
X-Gm-Message-State: AOJu0YxkcJGqx9eW8zhIrBxZM3aYn6hszaGoX7cHYNTpWii3AUbYvMpY
	aym0czabKjf2m+Ks5k7DTH8RMtUDz1nRSjBZZNA=
X-Google-Smtp-Source: AGHT+IEVD1HUQxU80yaqIMscl9eAxIwWXnz9Il18O7lp1XHQb/mcS33iLv40nrR6bEerQx/OAHAt9Q==
X-Received: by 2002:adf:b649:0:b0:317:59a6:6f68 with SMTP id i9-20020adfb649000000b0031759a66f68mr1714505wre.0.1695378115132;
        Fri, 22 Sep 2023 03:21:55 -0700 (PDT)
Message-ID: <384b1442-9f02-1844-4524-72f080e99480@citrix.com>
Date: Fri, 22 Sep 2023 11:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: qemu-system-i386 crashes on i9 coffee lake
Content-Language: en-GB
To: Stefan Kadow <stefan.kadow@ska67.de>, xen-devel@lists.xenproject.org,
 Chuck Zmudzinski <brchuckz@netscape.net>
References: <8ed49454-101a-596f-3a26-3e5702a80001@ska67.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <8ed49454-101a-596f-3a26-3e5702a80001@ska67.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/09/2023 11:24 pm, Stefan Kadow wrote:
> Hello,
>
> since commit b9ade05c
> https://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=b9ade05cbba977673d5a08bc7a5940c5fd8add0e
>
>
> qemu-system-i386 crashes on my Intel i9 Coffee Lake System.
>
> This does not happen when the system is booted with the latest
> microcode update. So I do not know if this is really a regression.
>
> Please, see the discussion on xen-users mailing list:
> https://lists.xenproject.org/archives/html/xen-users/2023-08/msg00014.html
>
>

The commit you reference is the security fix for Gather Data Sampling, a
vulnerability leaking vector registers across threads and privileges.

GTS is very severe.  Literally the easiest thing for a casual attacker
to find is the key material used by AES-NI instructions, owing to an
implementation detail which causes extra copies of the key to exist in
the vector register file.

As you can see in the documentation change (first file in
https://xenbits.xenproject.org/gitweb/?p=xen.git;a=commitdiff;h=b9ade05cbba977673d5a08bc7a5940c5fd8add0e)
if suitable microcode is not available, Xen mitigates the vulnerability
by disabling AVX.

This is necessary because there are some affected CPUs which are out of
support from Intel and not receiving microcode.


At a guess, Qemu is executing an AVX instruction without appropriate
feature checking first.  You'd need to attach GDB and disassemble the
trapping instruction to confirm.

Either way, it's a bug in Qemu, because even if it was compiled to
assume AVX is available, it ought to exit cleanly rather than crashing
like this.

You can disable the security fix by booting Xen with `spec-ctrl=no-gds-mit`.

~Andrew

