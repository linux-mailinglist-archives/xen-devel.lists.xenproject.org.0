Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DFEA13B8B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 15:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873615.1284622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYQST-0001It-BP; Thu, 16 Jan 2025 14:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873615.1284622; Thu, 16 Jan 2025 14:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYQST-0001G4-8a; Thu, 16 Jan 2025 14:02:53 +0000
Received: by outflank-mailman (input) for mailman id 873615;
 Thu, 16 Jan 2025 14:02:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPy+=UI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tYQSS-0001Fy-34
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 14:02:52 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92eabec7-d412-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 15:02:51 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so206103566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 06:02:51 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90df91esm911935666b.79.2025.01.16.06.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 06:02:39 -0800 (PST)
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
X-Inumbo-ID: 92eabec7-d412-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737036171; x=1737640971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iFAE9J6bA0Y8GbUjaDp0sHDRaG8WCii4dd6ZDIDMans=;
        b=iNxUdmAnqd70lzXQml6X7deydEN+CKvWEVqwkgla1gAow+pDzC9qjXQJqFYzIH6C1G
         DFA2arMo5sUoJ8tk4E6JzKVad7YzyTRE5x1ErD9C813Be2Xd3GLy6fA6Bkb+RWbtcAf9
         Vaxoz8nMJn5hkAyN3TeYpCob8r+MiYYFs23Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737036171; x=1737640971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFAE9J6bA0Y8GbUjaDp0sHDRaG8WCii4dd6ZDIDMans=;
        b=uIzVEkzju0T59VEsGo0vNVnmm8ADWl3wFAcEk4i8GulZcSp1Y2k6pjE7ktm74SKokL
         ogq3Qsu7pqBD/16ZeLsL/PIy8SKoo5e9tZ6jypI8J6MmFhxi9Cf0aJNEWJisRo7WAeRq
         JvR2y2X7mFi3w7qLzfRcubs8jth2696Z5NjUqpGjTND0iWym7dbnh8Qv17o9GwgcZAeT
         CmdH97IBe3q1AS7uq9E90bjM/BtaAtXUqYlwuN/EzaAN5NggK0s6Zu+8b25PwzmsXAdl
         79QAFYwrUv/6UzyTiSEI2mwn9UqJIOxeZCdX+ETVLlfB79eAHIK82OMr66zYm6dR4rMJ
         s01A==
X-Forwarded-Encrypted: i=1; AJvYcCUJSoHS5v5/lBF4cBvkGjNCJyL+zNQuZbumOzrIC1EGPy0OMinKhaJE2UfiY6vVkH6rOP7/qNX8kGI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYwpeBzicHUc75am/jd7Ars0cqEbr2z4VyvNUfQsApuNQBRN3t
	6Ilb6aew+34qt7rqiLvu8sb4KwHmludDEu8G0yJI6mCLcWRnY32YTDG54WCLoaOkJ8o/dCdBvmy
	vm8s=
X-Gm-Gg: ASbGnctWddedd1krN9dOejXn/yC+ikJRxoNCgGFwuDyMx8eqmb9D6wYA7hVC2/cCAd7
	kRgM0wnKWLr0FWO5pCTZCdbUJpdzQj+0t1pEGpfTwXjlfKt881ne5r4odggoFYHE/psGfrj2Olh
	bx7HqLw66UWoxLYhiRvZuX8Q/CtQ8AD9PKM7JkgPeEWD74oZ9hb//RzTXq+qxsXZR6fzdZEwDlm
	Atf7+awL0o0mB10/yCCCIjDeW9UKE0HQj9EqkwQLRWzwd8peZ/owxvQCLyF1KJvUc0=
X-Google-Smtp-Source: AGHT+IEG+lPJLTujh0IjZrFDiUgCEHn5tcOOqQO4TceZXblBVI1hRU4fS+GIG+10/bnYVL1iDFi5+w==
X-Received: by 2002:a17:907:720e:b0:aa6:6c08:dc79 with SMTP id a640c23a62f3a-ab2ab741567mr3194133166b.35.1737036159445;
        Thu, 16 Jan 2025 06:02:39 -0800 (PST)
Message-ID: <94bbb56e-4a44-4981-a617-cdc541ea5308@citrix.com>
Date: Thu, 16 Jan 2025 14:02:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v2 2/2] automation/cirrus-ci: introduce FreeBSD
 randconfig builds
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <Z4j4s-1iK2CH4ssK@macbook.local>
 <20250116135957.80826-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250116135957.80826-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/01/2025 1:59 pm, Roger Pau Monne wrote:
> Add a new randconfig job for each FreeBSD version.  This requires some
> rework of the template so common parts can be shared between the full and
> the randconfig builds.  Such randconfig builds are relevant because FreeBSD
> is the only tested system that has a full non-GNU toolchain.
>
> While there replace the usage of the python311 package with python3, which is
> already using 3.11, and remove the install of the plain python package for full
> builds.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

That looks cleaner, and likely to have better longevity.  Thanks.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

