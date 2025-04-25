Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA7EA9C7B5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967764.1357489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HKY-0006dg-3S; Fri, 25 Apr 2025 11:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967764.1357489; Fri, 25 Apr 2025 11:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HKY-0006bZ-0r; Fri, 25 Apr 2025 11:34:54 +0000
Received: by outflank-mailman (input) for mailman id 967764;
 Fri, 25 Apr 2025 11:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c45=XL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u8HKW-0006bT-8x
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:34:52 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c06082c-21c9-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 13:34:49 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso14426865e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 04:34:50 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a0692a22sm41515115e9.2.2025.04.25.04.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 04:34:49 -0700 (PDT)
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
X-Inumbo-ID: 4c06082c-21c9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745580890; x=1746185690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3YnxlXY+Xui4B0XEZ2ZjL2k0jYlZEV0bUPMTA5Og2jc=;
        b=mmQA51leY7VmaG6sDbPqJeSY2EMUy+0aF9NeRo51gDDpncPDDhFLue0pG4xsDcifmP
         84t2HBASbTNnnnLZoyO0lsARD5B0taqTWy3Ic2ILfrOk3k4ZCQUXHFjxH6idSMfP1na+
         +jDZm39bYBkpwvDfrShRVd3KJp64ZLBHm6fjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580890; x=1746185690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YnxlXY+Xui4B0XEZ2ZjL2k0jYlZEV0bUPMTA5Og2jc=;
        b=o3RSpFTk49oNJMFjaUeXrcEstedP6mjyRTUsnbEBxEnGTnYfPOz/PeTSVTwtNWEiLV
         zVSGve3qwTFE1wELzjRwTs4DGoU8v+4ojv4oXikh1fhJz7Gtov7CYQYXqJyZqETQ0tS0
         5aqKKPg+z30HAY3uEFw2QsxagANzCan0nt7Y3/2NRd/W62qUzaS/iSkfZuKQQnTeBokO
         5yVLtQjS5mmGJh6XFLYR5yQlI4liLD4I9dpcU4YpzG+unCr9naVEFd6ExciHGZKwf9jB
         J0L7x1UdoVcmy4agt3BZ4P4BKEAXmS0sA+tRCKmgNw9NDI585RSwba83p0j0LLs847TI
         +Xvg==
X-Forwarded-Encrypted: i=1; AJvYcCWnFE3hxr0ggSQ9XQalhh7qXH6G5vDViOpD2Fl9YiXbDMadUSWRSGSv8wLviHskSYGAuRjvobH8XL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlFCTcCiQPaGpUlRpTzIpqdf4ZWJmEA7KD8mAmah9yigncXbdO
	HNKIyKEITSCmNRsqSUJobwsuqa1QsNRiVScyXdAEt6kDlsrCf+Bt9WCtf9MeLic=
X-Gm-Gg: ASbGncttZEEngBqdwH5FMtHqv/Bb2+D5qfDLsZH4gWQTMHqWPi2YxbIwyEqq+hg7Cbe
	diQ9kYAHY/w6KNR1VzcYDWx5Ru6FUc3HQhfZzxzgUj/X+Sq9xsmpNkQkc/lgJnpubrfDUInLe9/
	IGfA7bOsBoZ3AleOX68CRV9yXT6kLDxWdKR4jO+NC+dPZZsj8DzHikjgpuTbbdV2Zec3gE+l6OV
	DerD5dDk6YfMIPWbrHD0lZOSLIsdzxecqOMzXSCB5pd24pGxltcfBpJBNRbN8Qri43udMXbBmND
	Ogh0g8X/yCpoRyDXlpJkpTXl9aNvsIRvHofmyYlAJ8ncmgLMR5s2xgsDhp2M0bMCPAkFgyhAV1c
	Mg0Fd9w==
X-Google-Smtp-Source: AGHT+IGdOImIl8KhFDSVFLRKK2DFbSbAjTOkK7OneR5lUYdyCzgDyvttsHs5HhSL8GfjmQjMdBTu2A==
X-Received: by 2002:a05:600c:4f52:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-440a65cf326mr15546705e9.5.1745580889541;
        Fri, 25 Apr 2025 04:34:49 -0700 (PDT)
Message-ID: <46d6243f-89c8-4ab8-aeac-6f9ed69d5f61@citrix.com>
Date: Fri, 25 Apr 2025 12:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: fix buffer over-read in bitmap_to_xenctl_bitmap()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250425113227.10243-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250425113227.10243-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/04/2025 12:32 pm, Roger Pau Monne wrote:
> There's an off-by-one when calculating the last byte in the input array to
> bitmap_to_xenctl_bitmap(), which leads to bitmaps with sizes multiple of 8
> to over-read and incorrectly use a byte past the end of the array.
>
> Fixes: 288c4641c80d ('xen: simplify bitmap_to_xenctl_bitmap for little endian')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

