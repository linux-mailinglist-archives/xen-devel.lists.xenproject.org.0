Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C1A10E22
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 18:48:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871631.1282613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXl1d-0000ik-O9; Tue, 14 Jan 2025 17:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871631.1282613; Tue, 14 Jan 2025 17:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXl1d-0000hE-Ku; Tue, 14 Jan 2025 17:48:25 +0000
Received: by outflank-mailman (input) for mailman id 871631;
 Tue, 14 Jan 2025 17:48:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIyo=UG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXl1c-0000h8-2A
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 17:48:24 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf166675-d29f-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 18:48:22 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so1220212866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 09:48:22 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b1bb6sm655502766b.159.2025.01.14.09.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 09:48:21 -0800 (PST)
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
X-Inumbo-ID: bf166675-d29f-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736876901; x=1737481701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r6oNJN1eINmgsqALrqyDnvakvimZUgWCgoqWrsJsb9U=;
        b=PhTGXfX2XeVbkEhTCWGnBG5ejhKbAxY8td1aqSs7MMWnR2MiQdT3Nop9bBxbOtw8wM
         4wHX6ozd7rs3TKks4X7C+m1Ue3mC715vvcaUgV0HO+2FvN02GG6m8DoXjHEtB0CtwuI4
         ifRkUCEfvlEOTRiKj/eCyh7aDi/Bwnv275KnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736876901; x=1737481701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6oNJN1eINmgsqALrqyDnvakvimZUgWCgoqWrsJsb9U=;
        b=sSNyQxm7jmT2hJKDEK0OAZGAHj2uQK63/c4mOMpERwg5hSgWG0/rBoM9Og74wVpQeF
         ciQbvKYhdQkURHB6qxYY7b5rfuvnFcw3HEg81F/dmMU3EaZ/WoVlgOMCZBKUuVz4aIqU
         cqIj7BHLUDSi4Pa10SPRrKKdNMvR6noGejhbAxBYHi92iVgHip5YRUWDg7UZPNoS1XBC
         PLFCb9mEd3Pdo1P0dfRpb63NVZkExV4vV7ft7Y9PFlduAaWuaMR2nuhanyy5Orz072IB
         lqk0m4IOrYYTC3QvJPMRv2J5kiLYSnBwA/pOFjt8boPMFdXKWsjdqPGEFocOL4uuVngi
         FmgA==
X-Forwarded-Encrypted: i=1; AJvYcCW5DRUX8gWWpwPoeFmKFoGyxaHahEaq/8t2h/MuDcjmWFDVL9GHLZSmAyuJw1AJilvME1HR/aPvctk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlI6HsLcnO+r7aIGtE6yv2cJVTbdUX4OqCsKFSsLAzPagmsMeh
	+oOP4rgInjYPxzk7GY4xHzB+EqGkw8nA9Q68rE8ywy+6mC7unuA7jBls+jNgRZ2qWLe0Hviv2JN
	B
X-Gm-Gg: ASbGncuz9WR6pLgL4U/mTnY7RwNl4FIpJ43SU84RPj/lsCI5OxibufXkAev0UWspGsR
	ltwmtXaDGeibTIRjftGgVVTwgL2CyX/sF8RA5f2v4YHX+fjPEbRtVuQuYI9rE7MAbfOhX7Pi/B/
	gzldxeCCn6gBpgntudRXhAC+QUQmfIKEu2lyoahJi4owtZYr0eWgLtPttqV/+QGGNSIyU1y+Cxb
	fwE3VkWWBublVsXBRlcGc7fci7h3sXoxAxNy8blvOz5jgWqjVX0E8zP4cpaYObGgK0=
X-Google-Smtp-Source: AGHT+IE9hjYI4wc/tvpZ86gYpx14zl0zxXPjfrc+VndMXGhVgy6UjyJLrb918EYw4/FsYhpcPUEoTg==
X-Received: by 2002:a17:907:3f26:b0:ab2:da92:d0bc with SMTP id a640c23a62f3a-ab2da92d9cemr1918284366b.3.1736876901471;
        Tue, 14 Jan 2025 09:48:21 -0800 (PST)
Message-ID: <c715348e-0f40-4ac4-b38e-1aead29cde52@citrix.com>
Date: Tue, 14 Jan 2025 17:48:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] automation/gitlab: disable coverage from clang
 randconfig
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250114174345.60887-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250114174345.60887-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2025 5:43 pm, Roger Pau Monne wrote:
> If randconfig enables coverage support the build times out due to GNU LD
> taking too long.  For the time being prevent coverage from being enabled in
> clang randconfig job.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> I will fix the orphaned section stuff separately, as I'm considering just
> removing LLVM coverage support because the llvm coverage format is not
> stable, and the code to dump it has already become stale.  However I need
> to think about it, and in the short term disabling coverage support from
> randconfig is more straightforward.

Oh, so it's broken too?  Unless the fix is trivial, we should have a
Kconfig level disable on it.  No point letting people turn on something
that's broken.

~Andrew

