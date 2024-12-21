Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B589FA29B
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2024 22:32:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862551.1274176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tP74Z-0003zy-35; Sat, 21 Dec 2024 21:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862551.1274176; Sat, 21 Dec 2024 21:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tP74Z-0003xT-07; Sat, 21 Dec 2024 21:31:43 +0000
Received: by outflank-mailman (input) for mailman id 862551;
 Sat, 21 Dec 2024 21:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aaI+=TO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tP74X-0003xN-PG
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2024 21:31:41 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6458011-bfe2-11ef-a0d9-8be0dac302b0;
 Sat, 21 Dec 2024 22:31:39 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso20640705e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 21 Dec 2024 13:31:39 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828cc8sm7363868f8f.17.2024.12.21.13.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Dec 2024 13:31:37 -0800 (PST)
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
X-Inumbo-ID: f6458011-bfe2-11ef-a0d9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734816698; x=1735421498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g80Xv9sdG8bld1hI5N8TIg0l0usJaOYYz4GMokDzByQ=;
        b=TJBg/CsNHogDUNIuF7KeHBntwavhntxi0LeNsbvsO/8iwjbDwPrsYBFIvnahDZ89y2
         uCzSTFpX45IPaMgjzsjRraIx0OY5GWxXRhQEN1VkrRkvcHJF2Qlwg3UnDfgVm31tMTBJ
         00LnxRhTLe1YEeC64KD5Li31ChG4Bmp8TAdRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734816698; x=1735421498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g80Xv9sdG8bld1hI5N8TIg0l0usJaOYYz4GMokDzByQ=;
        b=C9+RcVH16oU+54MUo/kNq5fNc/wI1ZDylr2fGoI9sr7jtYV2MwXmwdzI59ur+A381f
         l89x1hvotrlEutYZMz5bX0anfsPQYY0FwONPC+G0mH4T8tz4ZYnLnsCtDt1BWkly/gqm
         wXZRvdDocwx1yDDq+c65v1gOVLNJos7Q4nHXMLOSGtVWmoeOHRe/JNm5Zwqd/on3bRYm
         utwAfdGctqJEp/HVLSE8TJdfHg2++ImdrMHsRW2wGFkOhaNNIAUTmdtw2EAwSKj7d/L7
         Wbqn9efEU7fSxMswsxHRjKM0bpoiNKt3b8v62z8jRKpqXhXM2C2ynTtOyq9HQ7CIq6/G
         J7bA==
X-Forwarded-Encrypted: i=1; AJvYcCW28Wj7FXdmSvo/Mc9fzM26dn1fnVfdqEFWzHpUg/G4zs/mpYgYaEikUh8LmbXHO2RIptKSOOWTY/4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSHrqtijEANIRTeuInLZjkJFYUlMNhEsQGwcQatRHbO/FvIgPP
	umQAykp+d9LQ4OK/NloWeDANh9pBzCQpMqpy9MIo8CQRFWbYT1ij6B3jRDRfd8k=
X-Gm-Gg: ASbGncs3lPMJNw5vs1Dikx1MQ4Eb4uI+2YiSIYm8V0+L7YQDLl+ff05ZcEIOabOzoeW
	u54i19zSXmAFSP8+4HAc21xYXU+xavYFI8eXwjy4DrFtVTPMKiJTHhMY/qOocR7RQXEo3XmCm7w
	Tgzf+2Mh4i9HOaoeHzmN4w9yOkzzyhnkpvnyZ8YN9pzXVOt1x91dm+ynkcNNMTIn8wNjBd6v7ub
	SdpOZLHmSjVkmbiC3ZTcy3ajRrelR49uzgad3pXMYhA8g4Rd1EsXTZnxfeA0+/eObSeEC5St+Bz
	Fhy4/hdUfJZ2HP8s/S6s
X-Google-Smtp-Source: AGHT+IFrVlLP9YH10ZAu9oKbTiFL/KTq/9QViPYsupLF2ej43cn2G5wKtY+3Gp7pjqL4avgqCHPezA==
X-Received: by 2002:a05:6000:156f:b0:386:2aba:a7f6 with SMTP id ffacd0b85a97d-38a224071e3mr5767422f8f.49.1734816698193;
        Sat, 21 Dec 2024 13:31:38 -0800 (PST)
Message-ID: <698f48a0-b674-4d7f-9c47-f1f8bf86379e@citrix.com>
Date: Sat, 21 Dec 2024 21:31:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: sedat.dilek@gmail.com
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com>
 <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
 <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com>
 <CA+icZUVo69swc9QfwJr+mDuHqJKcFUexc08voP2O41g31HGx5w@mail.gmail.com>
 <43166e29-ff2d-4a9d-8c1b-41b5e247974b@citrix.com>
 <CA+icZUUp9rgx2Dvsww6QbTGRZz5=mf75D0_KncwdgCEZe01-EA@mail.gmail.com>
 <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+icZUV0HEF_hwr-eSovntfcT0++FBrQN-HbFL+oZtnKjJzLtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/12/2024 6:25 pm, Sedat Dilek wrote:
> With...
>
> dileks@iniza:~/src/xtf/git$ mv tests/xsa-454 ../
> dileks@iniza:~/src/xtf/git$ mv tests/xsa-consoleio-write ../

That's completely bizzare.   There's nothing interestingly different
with those two tests vs the others.

I take it the crash is repeatable when using either of these?

~Andrew

