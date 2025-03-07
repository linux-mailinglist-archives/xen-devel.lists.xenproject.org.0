Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F0A55CB1
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 02:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904465.1312347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMD9-0002AR-4N; Fri, 07 Mar 2025 01:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904465.1312347; Fri, 07 Mar 2025 01:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMD9-00028x-0e; Fri, 07 Mar 2025 01:09:11 +0000
Received: by outflank-mailman (input) for mailman id 904465;
 Fri, 07 Mar 2025 01:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqMD7-00028r-OT
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 01:09:09 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c58c7a6a-faf0-11ef-9ab4-95dc52dad729;
 Fri, 07 Mar 2025 02:09:08 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43bc38bb6baso7874275e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 17:09:08 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd93ca9fsm34484085e9.28.2025.03.06.17.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 17:09:07 -0800 (PST)
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
X-Inumbo-ID: c58c7a6a-faf0-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741309748; x=1741914548; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=78iHD5flU4maXgc1kFm09Dz/lpHTb5P9P6U95jZS7u4=;
        b=mTY5py5t/58V9qvAMa9gpxrsYSFo1u1GY6SDjrOmlHHW+QgVrAJM2+nsqh3bWq1uVS
         1FBqg3XmTfR5qqIDHkLtSYiz0NhjEx44zPdY5kqxfbS3ONwhAIqAOmZc2HGnpGjmYu03
         ioFlLKwCh7FN+B2Ybfmetis06dxGIxDrsjkuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741309748; x=1741914548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78iHD5flU4maXgc1kFm09Dz/lpHTb5P9P6U95jZS7u4=;
        b=kURvYLPn47mBjwfAyJGYrCTwiirLL4pk8uaFmGiN3AVyvEdbNOjEVMNGnGdyaJ6V+O
         QInECCcmpk7jgQT9GFOcvd7RH1TH+SdXSUvqrpubKfrJUa4dPYjcii2438BNkSjdAcsz
         vYTrGjtl+TLgdtoYYZuGTMH3ehI60kq9Rz6jbRdszwMne1254aG95E6COGUSPgMuqLoz
         ChU0tag8q+TtlDIEVWHbAelailOkoFatFxDK9yv/JL921/k5WyYF8f8Y83uoH6cUxkvW
         DxClO2sS7/Bg7jo2hj3xtQMkmnXse6XGyaa4BRhbSBYJ2h5aWwEnpYDVNRBWNSKClGwe
         87uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF1i8S7YfwmY8k8w8tCFZovMgasR4ZAC2qPdIHwsuqjEJD6lRAg0IZwmY+GKam94q0M9n/e6V+faU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSHoY6+Zbu55deMBT3OZE4im7EG4SYAmA5xjiV+RF9S3j7igvl
	NE9Mi0ge4Xslloq0JaMnftwEieJ+FUnQg/XUu+PHgUIcljJGkvIEWdr1v6SRBvZwiYQTcso5A3I
	g
X-Gm-Gg: ASbGncvWpRgEeC0nEEmE8FSIamgfZlew8c01YALyEptMMWiFkeQpIq1ifhP3VIeGgY2
	3Kzsud/ezLbMwk94+9ZUwVxuWyHI6nbLyAOYZQjk3QBQujcJvBa2yvtHCvz4f0TS3RetspnxQzX
	+b3BjSvHjBB0ZG+BaQzOwaN0K9lL6nnaoIK3HonYiIRbwYQxfkgTbMzYeCi4ANx4CWNr+44NRPU
	SSKRTK7UjzKrJHTLqjSBtGwCThio/iNQbKMpUfjqFmwcRWDnyTQS9SJw1VDznEFkRFxJJRe8TUA
	dLUn5jl6jQpalAfvRzWoA1dm6G91C+Il0hPAZOcW0VDAfbG2Utf6FOK0XrHCwh2+GivmoCvUkZv
	VWx70dyC/
X-Google-Smtp-Source: AGHT+IHTQGCSD/WUBDljflGQB3hzsRS6e/6jr7yMQlzqZY6eFlHaLh+RciLsOFrLRruq20sUKKog6Q==
X-Received: by 2002:a05:6000:186d:b0:390:df75:ddc4 with SMTP id ffacd0b85a97d-39132db1113mr843996f8f.44.1741309748110;
        Thu, 06 Mar 2025 17:09:08 -0800 (PST)
Message-ID: <1cf7e95c-eea5-4a93-81ea-7505ee158b4f@citrix.com>
Date: Fri, 7 Mar 2025 01:09:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/IDT: Make idt_tables[] be per_cpu(idt)
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
 <20250305000247.2772029-3-andrew.cooper3@citrix.com>
 <636170c8-2b61-4918-8c17-5c4953aa25ca@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <636170c8-2b61-4918-8c17-5c4953aa25ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 2:01 pm, Jan Beulich wrote:
> On 05.03.2025 01:02, Andrew Cooper wrote:
>> This can be a plain per_cpu() variable, and __read_mostly seeing as it's
>> allocated once and never touched again.
> cpu_smpboot_free() certainly touches (really: modifies) it again.

Not really.  That's a dead path because we always park CPUs.

But fine, I'll rephrase to "not touched again during it's lifetime".

~Andrew

