Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A885EA54D68
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 15:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903599.1311556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqC3T-000781-An; Thu, 06 Mar 2025 14:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903599.1311556; Thu, 06 Mar 2025 14:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqC3T-000749-7S; Thu, 06 Mar 2025 14:18:31 +0000
Received: by outflank-mailman (input) for mailman id 903599;
 Thu, 06 Mar 2025 14:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZnl=VZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqC3R-0006zU-O6
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 14:18:29 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daaa6de3-fa95-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 15:18:19 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so4589655e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 06:18:19 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8b0461sm22619395e9.4.2025.03.06.06.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:18:18 -0800 (PST)
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
X-Inumbo-ID: daaa6de3-fa95-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741270699; x=1741875499; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7mrtuSxKasEWeJrcno3E7tdFVSvtQJwSQ6zARj5IhMM=;
        b=FekBMaxHmGLm6ycFJu+YNYbNN4mMh3ggKf+EBShMHphuUPm9WH4a1/IDjdH6hU1X7N
         bssIFI5WmCQGVYbtswLJjtBF8Jp1kff8vkKL/o4bjrfrDaqGP7NGAscOBAgkR7vp2FKR
         I7c3oNV2jvVgiAmwnxNn8KeJy+gSLaZITkIHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741270699; x=1741875499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mrtuSxKasEWeJrcno3E7tdFVSvtQJwSQ6zARj5IhMM=;
        b=aJp5hnJouSMnmc/yQBbUtOdJ1SFsm2Hjo1C7kc/9jHBDBfj3b9yAlVaAEyTkAIQjox
         dM1rQSlKQVdO8evvhs8fnU2KWDO8tK4cSyfYzVxwcZZ0TTY/LuDEmAoEKqDHBO6rTdx5
         xBcmePKUCBLKbG2NxAnb98l1G+CzOSHdw1VyFRzy116jQ5frbQr+wBopaTVZM7tSj8/a
         hEz4PZNrYtGq1Dg+yD7oXr5sYXOKrBIOZXYU/dzudameksXD20NSHxhONpOK3MFQbl07
         3FDGcHiDfnA8nAGfV3vkdBgQNvZi16lSTlF39n+3HZb7JeWEvORV/4qvM/ZetLKJnEaq
         Iy1A==
X-Forwarded-Encrypted: i=1; AJvYcCW55PjhmkqGpISrgd7BtepObXLjE7K3zWQVuNJFgKR9yAhuGzbR3dLo7R1eAYtRjOtJwO3cOnknvg8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUTRHtFvtdtf34WZSiVfhVE/b8FDTKxAzSlQ1RGCQN9/LCGRhC
	pNkkD6BYp8btZCndW7F4HIwf0e14oozAynbkPh6ZbnUdk9Gb86yhLujvoTC6Eb0=
X-Gm-Gg: ASbGncu7yX3Z1uNPlwoognbe98jHFLW2OZIkWXquYBkiOqLoKzTDPMnkOJVv9VX1yx3
	pvmpR0lisM7o++Kze30SJH6Mz8b9PalAdyhO8NiqiB0rzAgRz60fgh+moI1HuPCymbfx1UXc+e6
	A8kwPn/I+DY6CSF7Hvr1h07K7NZjRhnWv6jRcv1PavWepuNvwBNSIfmOg7C3I1hKkEbaSv1xTPd
	sQxEjTcjrWzWPxkQKCYZGS85LJ1gqNV7n5cenGu3aDkoRb1M5cZQbRAbrFZF+E0zJHlUBmTVEck
	yLqmTbs7PeYZkd99SLU5tUTWS4470WbvFSba4+KVOyk/jKUIYUZ8lOocknv3oQ/mH1BM6L2Kio/
	qgR052SW4
X-Google-Smtp-Source: AGHT+IEvgU3iWmy0VdM5XqzNSGCuZRUu7RjBsViZBWQVmNG7yVCo7FhRNbwNwjZinvgTkIGlpJlfgQ==
X-Received: by 2002:a05:600c:3b82:b0:439:9a5b:87d4 with SMTP id 5b1f17b1804b1-43bd296befcmr51498575e9.13.1741270699343;
        Thu, 06 Mar 2025 06:18:19 -0800 (PST)
Message-ID: <78ca825a-892f-4885-bfd7-c34dbd43566e@citrix.com>
Date: Thu, 6 Mar 2025 14:18:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] XSM: correct xsm_get_domain_state()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>
References: <dbc6907e-e23b-4216-828a-ce7c4b581a20@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <dbc6907e-e23b-4216-828a-ce7c4b581a20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2025 2:16 pm, Jan Beulich wrote:
> Add the missing first parameter and move it next to a close relative.
>
> Fixes: 3ad3df1bd0aa ("xen: add new domctl get_domain_state")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

