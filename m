Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8074DB37FED
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 12:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095898.1450755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urDQt-0003ae-DE; Wed, 27 Aug 2025 10:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095898.1450755; Wed, 27 Aug 2025 10:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urDQt-0003XV-A8; Wed, 27 Aug 2025 10:31:11 +0000
Received: by outflank-mailman (input) for mailman id 1095898;
 Wed, 27 Aug 2025 10:31:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AuO=3H=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1urDQr-0003XP-Vb
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 10:31:09 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eec98066-8330-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 12:31:03 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3c7aa4ce85dso2163683f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 03:31:03 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c8bedsm26507755e9.1.2025.08.27.03.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 03:31:02 -0700 (PDT)
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
X-Inumbo-ID: eec98066-8330-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756290663; x=1756895463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=umTll9mn8G1OuylrPeOEqFOpl3MPV8hO/E09j/ZFpmM=;
        b=aRbCNb0/4pIOh7GkeDkBwONMsioceiv1VyqCijvFxPyGYEhzJ9ufTvFrZ1HxQpVEc8
         5MdTprDmS7OB1EZQeh3ukHR1KFe1EpBuI0M/CwVCClOL7ml/NKOlRycLZarvQfrs/pze
         9dkNFHHxGRaogm/m8tDRzRqH3bmd7GC5oTL1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756290663; x=1756895463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umTll9mn8G1OuylrPeOEqFOpl3MPV8hO/E09j/ZFpmM=;
        b=SGB9z3oBbaOY0QCfQa+evc4+/Ckd4ta/UrP2KVvuKSugBx8B1ZaejzlzK6StRc6dd5
         rZrXl4Y72xZVUZpPfdu55SfbfLwZa0ssbF8kmyPrm5aqUJgZ6hJzHgnZKtUdTrKcMklq
         D/rKePHqphwE4wXj9SwHhNNdcXvjJ1hVkH7rZJ+sf95/VOK4rmXq4/xCfuOQ/otGPXet
         1HYeLvZKAptG9fzQA0zYYK/yzEGx3bhCumRb/TimNP7WnAU8Ly9Vjr+8ZYaisQTEg/xw
         F32dJTq27TTbnCFrfBPNpt0cGen2oxY9KLOsJFIkw1htT3GkbKhvmy3SX46Nw6HQy0LW
         akdg==
X-Forwarded-Encrypted: i=1; AJvYcCXXdFHbBW7X9Iyi/XPATyveQ6fi74ET+3W2QThzfj00iXTclyeOdB1XoxQYfGkT2Sa2+K9h6SNnZgU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8/6BlGlM0165eF6GKXr3L3wohNs/AnmDsSAywaBjSJ0+1FDhK
	fP4wHI5UdAzzv6p8GzgaZqtewCtnYr6cOZsCjOEYeKt834IBtnlt+e6pDNfVlHO0hSc=
X-Gm-Gg: ASbGncuHFnKHB17a9oRtz9UIL5AdlS5u3VOg5tTWvnOIVV5fX80i6N6fr2BYQO3Rz5P
	WpP6/v1hxc2edHrTvDoPlEL+P9VqD0ODFSJGEAewAx5YVb0TsEavUVBO98hdEdg3og4Y4hBxVqs
	op20r7IgSpuVlRVkfbB91WpmS0EKflZYhE+iKhrsYt3pasa07+DotTU/2dpqYHRNX0+FIF179FO
	Wu3/4C2YcouVYTcaGZqUPUsMzAwShQRL7E+zxR9p/MVL2099tp95LGpIhsEFkQlUTQxn7TBXXK0
	J6n2ee0qvDCtzkXDIui7Tu1BY/fJ6nzttUbavt0haRhAQy7tIO9x7diovgBJKvxs2enZ7iBHT/w
	WqnO9RpF29phlmR+9bphqRgUhydNtsVqYTy0Cg7117PYgjuV8vWyQRRstCSyBWwkNNrG+ozXhGe
	NJPGk=
X-Google-Smtp-Source: AGHT+IGRRTU5x6N44+5mSkcPg15VyR4PNGiZpkgj+gTpAQ9se39dRwqJU6RaDunThpwjOrKCD3rxxQ==
X-Received: by 2002:a5d:64cf:0:b0:3a4:f663:acb9 with SMTP id ffacd0b85a97d-3c5daa27b91mr11273524f8f.9.1756290663042;
        Wed, 27 Aug 2025 03:31:03 -0700 (PDT)
Message-ID: <de3424a5-8525-478e-b108-cbd1e5d1550e@citrix.com>
Date: Wed, 27 Aug 2025 11:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/08/2025 4:50 pm, Oleksii Kurochko wrote:
> Hello community,
>
> I’d like to remind everyone that the Feature Freeze deadline is approaching,
> and we still have some outstanding requests from the community for patch series
> to be merged into 4.21:
>
> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
> 2. Introduce SCI SCMI SMC multi-agent support [2]
> 3. Introduce eSPI support [3]
> 4. FRED work: [4], [5], possibly others (?)
> 5. Introduce CONFIG_DOMCTL [6]
> 6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
> 7. Some other patch series I missed.

Fixes for Intel Fam18/19.  These are partly done, with some work
remaining.  These are more of a bugfix than a feature anyway, and needed
in order for Xen to function on CPUs being released this year (i.e.
fairly critical for 4.21.)

Cleanup/etc for new toolchains.  There's been a lot of work done
already, with a few already-posted patches needing a refresh.

Both of these areas are low risk changes and have been going on (at a
background priority) for most of 4.21.  They should be safe into the
first few RCs.

~Andrew

