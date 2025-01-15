Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE97A124C9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 14:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872527.1283496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY3W8-0006K2-F3; Wed, 15 Jan 2025 13:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872527.1283496; Wed, 15 Jan 2025 13:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY3W8-0006HX-Bx; Wed, 15 Jan 2025 13:33:08 +0000
Received: by outflank-mailman (input) for mailman id 872527;
 Wed, 15 Jan 2025 13:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmQ5=UH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tY3W7-0006HR-1e
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 13:33:07 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40870794-d345-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 14:33:06 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so9035121a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 05:33:06 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d990469ef5sm7455361a12.58.2025.01.15.05.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 05:33:05 -0800 (PST)
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
X-Inumbo-ID: 40870794-d345-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736947985; x=1737552785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nm7xH7cC7y2xt6ry/V2kf5OL6Yumca5DQ2prPpi2D60=;
        b=q1g6QITOasbhhSbqOVx7x/g9stnlbGy1XzD31vUP/Ac2qfz8Zzu15FJLQTTHvOVSsm
         Y6aGMqZIQ6+FbcOMzXUkGejrwS28EFDcn4YguQaKzdOVeBEGz/46UGALuMuifdOhA04O
         GzoazNu68vtAsUSGtJ0oyZ7YDkiUXdNyBHRC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736947985; x=1737552785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nm7xH7cC7y2xt6ry/V2kf5OL6Yumca5DQ2prPpi2D60=;
        b=ShDnV19SbsjaU9SkT7b9n5Cq53oBDWy2/ZRBmh3vPf54YuuRE/0ampWK9rfcdzjzZh
         XWkmDNlF5M49UeiZwYqX559Yc824iJhtU7SVaizWvKpvkz5rCeDUSO1PWYnvNG/DPqNI
         77pjB27WfYKBB+dWFf/8busDpNAtxIoEqepWwSzErg0S0G3++aJtgk6H3ARhK+1efrPO
         TQAsmkyyM2F2jPrt1D3dJmSZKHHhcB4dj7m4aG01mRQP1ItVTGfwVSwALVtH066fYJ+a
         u3tGCum+KESe9QeuM8qebRLVE3bKkAF8FCCUHZekqCEyBwnI7LkFwBIwLWszyWmWwOoP
         dcNw==
X-Forwarded-Encrypted: i=1; AJvYcCVDryB1rfQyhmI0tp5BpdVBYr+DIciPKSf5J/lYcDYqPGG0eVDJxKgVYpGSUIktuDvaGwU2KEQJ1Go=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMh9s+I18ioVo8lhXWxvc9sgVs0GT4RlCq1IJsk+fKqAcj9gKa
	NeqVgryCpKm9xk/YOaTLGpJITYStJtuebFmL1FH7y9hNKLvYxfpqHRRuZ405RUs=
X-Gm-Gg: ASbGncuG6tOhNnKPLoFyo6VAjfUR5MG3Myk/gw8atAR2zkkvZfHKtTEQjY6ILQQwzZI
	rStRQL9o4z3TB9MAQR/tsYP3CJsra+XEE6j83zCk3K0H5LuPWVZZqposKhp3VY8xapmkS/XPM5N
	Z/xMb5nBJoM/iLs5YnZ61SaTv3/xLMEt+pgsoNHKR4SBcv/IouPf8Z4EFJXGXk/Mmpo7emYwKl5
	fc1mX86q9XSwQEfvuHdSzdg2Kd9P8elkMlNeEcoiFM4NH5iFfDEEbmdj8z06OnQjIc=
X-Google-Smtp-Source: AGHT+IGlSKvL0owmOrqZVL44ojMLf28WGaG1Aune8QvP+M8I/gkmykYjxje8LhBqh0FzDbuX2RgX3w==
X-Received: by 2002:a05:6402:3554:b0:5da:d16:7387 with SMTP id 4fb4d7f45d1cf-5da0d1675b6mr2384736a12.24.1736947985510;
        Wed, 15 Jan 2025 05:33:05 -0800 (PST)
Message-ID: <5c55541f-f4d3-4c5b-8016-42722238f018@citrix.com>
Date: Wed, 15 Jan 2025 13:33:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/3] trivial improvements to sphinx doc tooling
To: Yann Dirson <yann.dirson@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1736943927.git.yann.dirson@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cover.1736943927.git.yann.dirson@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2025 12:27 pm, Yann Dirson wrote:
> changes:
> v2:
> * move import up and adjust "path setup" instructions
> * new patch for .gitignore rationalisation
>
> Yann Dirson (3):
>   docs/sphinx: import sys for error reporting
>   docs: rationalise .gitignore
>   docs/sphinx: gitignore generated files

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

