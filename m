Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A06AC084D
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 11:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993348.1376766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI223-0005xG-MS; Thu, 22 May 2025 09:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993348.1376766; Thu, 22 May 2025 09:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI223-0005v9-Jm; Thu, 22 May 2025 09:16:07 +0000
Received: by outflank-mailman (input) for mailman id 993348;
 Thu, 22 May 2025 09:16:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI222-0005v3-3a
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 09:16:06 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6233ce8e-36ed-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 11:16:05 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a36e950e41so2908723f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 02:16:03 -0700 (PDT)
Received: from [10.10.6.18] (server.hotelpassage.eu. [88.146.207.194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f73d3edcsm100615565e9.20.2025.05.22.02.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 02:16:02 -0700 (PDT)
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
X-Inumbo-ID: 6233ce8e-36ed-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747905363; x=1748510163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nl4dyR5F2gZP9fPzMMobhVGpr32We3YsDWUuMsZXgV0=;
        b=Qy1ZIQK01+LFUWV23oyFWTnq24W4gJ5qEfJJzZOXv8XV6EZ7mBiNqLsJBkP8DJA6hA
         NqQiRCbY79GHZWE/4IfN0nBbjcG8LWYhhKrKesYt8tbXcr/TNYsSGi1GQ64ePCBBHE3o
         N5WzetrDss5vYdQQwtRCdAVNQhczK0dANsG6Onm5JfUfgBBjG40ong/YKZrhyPmiWXSS
         crK8uWN69v9E8kMyVT8bEqDkJhDaTx3tIOHzHBA3dkVldrV1z8qMUHGmJWilRArEfPpo
         PTMcb4FDFvTtzvtFvjhnRlnOnqVAhCPLHmrEQzT/maHgLeKCCzi9UHw2ZSYnWcpeIDA9
         6NAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747905363; x=1748510163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nl4dyR5F2gZP9fPzMMobhVGpr32We3YsDWUuMsZXgV0=;
        b=fBS+ZEJq673y7ILyT9ynSMx9U8DOkr+zEitO0IlaobxGSTkruAlJgx63SW0ZcthHl7
         XZBmJrBsHVWwhsFVrjIxU0/az96shTNgWKEw/N7vebHzFAtGFDOju7CQQ2hYhuOTIIWp
         cOc7bGf7CN8BISAz7h8UFSlrO6Zca2HlmGRGw7Y3ntCw4xu+QLUJ1VJVo8CZgppJ+G+P
         Z9yIhhZ/LintNqmGnGqJ/MCprDZNhi7XEjjDnlZr1nzVbSvjWCk0onQfu32t1lCyMxTX
         269B5sNWhQQI459K5LaWQam+jbNzC+KxJoigcocuLGJItctsaFHyNyd1Xh+W+y8rFD3d
         3MuA==
X-Forwarded-Encrypted: i=1; AJvYcCXfPXw4Z4lsNEEXgsJr8uMobCMRPwSOAFKZ8NCrbQrVDFVKQff32TI5UE/C4fFEP2dPYMm4i5ATMlI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKZlKNXTMzQN/+R9rriXC0+Qo12uafMWW/tF3HdJqDTjzUoMDB
	iz2JLRktjPx1eoQ7UKBYCWZm9h6nQpL5LJVbQ2FuWBCZFUlgjyesrTEzpgyYuklhCw==
X-Gm-Gg: ASbGncuV3Z2SkeCkvd//QhVzBJGP5XQmZOGLjVCp6RPSUfFoWxPP55/3MujZjmJY8HE
	BiyvW5ZZnpNUGwrbKRlQJ/FV7CyGTwn5liH3gqELS2HNTt90umni45j2ePo3XcvCnHVv7KwAkTl
	6odBHiB+Pgw64LuZ7V1OqNfFuvvFGRiz1IxgUkl15bUSYDr0Jh3Wz8422gNW8+IObORYU5dcbfH
	WM870UN5Ufh4wINIzqZ+ZLcq5dHpM0FnOiSqwhILs2RB7ziyeyYOV14izkmFxf0xBFgIto9QVTv
	wJir+tOR9RMvriUrpKDuqoM1SEVvycyoYQz3Q+xVR0zJruRtqJ9A00CqUq2s8hDmq3RYQpTP2EM
	5PnKc
X-Google-Smtp-Source: AGHT+IFYai6Qe0O07ei4lHtGYQdbqPAMbdseW3bA9QXv7KQCVBQHuGvc8bjZ5e58W69NQfQKJJOSXA==
X-Received: by 2002:a5d:65c2:0:b0:3a3:5c7c:188c with SMTP id ffacd0b85a97d-3a35c856459mr16031199f8f.57.1747905362695;
        Thu, 22 May 2025 02:16:02 -0700 (PDT)
Message-ID: <1cdf2744-5b12-485f-9fe0-40d986dbf2d5@suse.com>
Date: Thu, 22 May 2025 11:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/traps: remove smp_mb() ahead of IPI dispatch
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250522075440.99882-1-roger.pau@citrix.com>
 <20250522075440.99882-3-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250522075440.99882-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2025 09:54, Roger Pau Monne wrote:
> The IPI dispatch functions should already have the required barriers to
> ensure correct memory ordering.

To be quite honest, "should" isn't sufficient here for my taste. Either
they are there or they aren't. According to my check they are, so ...

> Note other callers of send_IPI_mask() don't use any barriers.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with the word dropped.

Jan

