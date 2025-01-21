Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D384A17BC2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875345.1285793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBYh-0001dO-OM; Tue, 21 Jan 2025 10:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875345.1285793; Tue, 21 Jan 2025 10:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBYh-0001bX-LY; Tue, 21 Jan 2025 10:32:35 +0000
Received: by outflank-mailman (input) for mailman id 875345;
 Tue, 21 Jan 2025 10:32:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQWO=UN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1taBYg-0001bR-JE
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:32:34 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05cd2b37-d7e3-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 11:32:32 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so62734585e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 02:32:32 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389046bab0sm170524625e9.38.2025.01.21.02.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 02:32:31 -0800 (PST)
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
X-Inumbo-ID: 05cd2b37-d7e3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737455552; x=1738060352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4QzFt9GYqnwY9aYauCPhmlgp8rdqc3OvPDr0+heicTk=;
        b=oWctKYr3pChIleklC2b/DbLO4I3cwQPro3+Hn+M1QZw8bbzq1XqVij8qC+rVc/3tZ7
         xipaINlF5x0ZmoEXC0kxR+//x0fl4uU/oMBDbPaWzpb7agGNEbEGghHtZuRxcrpLZgsv
         bGRUXvackwfP3LIhzeYpvDKzJw0e7dcWsOhRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455552; x=1738060352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QzFt9GYqnwY9aYauCPhmlgp8rdqc3OvPDr0+heicTk=;
        b=VSW7ZBxiNkhOSO/K4FBzZ1fY4Ci75oL97l5h5JPdcojix0GKcxN2q07fTFnAcSWSLe
         mQrk2/uUDHzt5zYz7JN5YPu2QcZ6kD+gY4REXtzB5TL9Spwr3Rgnq0RFmqO15riiAHXM
         65HZSRSS+Skrq25zsDrfpzlRhTwJcviFBMfYHkmalnHJSaFdbceeGXnMY1oI60YgTonY
         6/KP9c7zO3Xke/CbD6tmYYU6PYuTkGQga+cdbTJtB6fzON8vVziznVJhxGqEOjxqixB7
         ld+9mfxDDfTbXWe1RvzRvAUB1+DI7RmZQqOkNtmuDpwGbsyuEpJxVKftr6cS0ATG9/nF
         7NGA==
X-Forwarded-Encrypted: i=1; AJvYcCWldlz2t6D1Qf+01QH/fmwgoBxCIfzTyK3xuEXVHwCIzKWaMA+3U3+Cx9Z/vgxsuprFSpCnwrIS6iM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywn9yRGhgrqsuMyazr2lCXonAKqiNYBhCLLX/KhM0jhkhYtEso5
	0KYvuZV4c1JRS8KSv9mg4Dim8tLZagRMIsKCg/wwhq3aBdu1LCC7j0MH2csubh4=
X-Gm-Gg: ASbGncvvzQ7/PV4mweatSxKqe8+De6A4tNqbad7TLzhzRRK1cv6sHfiOOM1SOJ4areW
	9r93ZdPATy4AmjnhYAgLDJliGBukXeFZSF0lEtY5JTpOrQ7VmX95u0aGt/rBJpyb8HuwL480edC
	7hPmnGfjG2EGmbMuXtXccfiQ3ggZah2+9FFSGc9pYhUAeu5K9uQ69x0I6dj6eI6ofcpBMb2GHj+
	hW7tr3g8JmBF7Ph5BwP8/Hbgiq/ml21z1D6dgahChrlx/HAoxz+VispjUTUZU0pgxrrO+GlZKHX
	6veNkIG2fNq/oawC2hY1BaMsBHq6wZINPg==
X-Google-Smtp-Source: AGHT+IH/2R1yLXmm0bCeC2YLju5ekfwU1aNWfAVVjKUM2AewxbpZZzrcb/mliNrSPn2Phs0JgjQkcg==
X-Received: by 2002:a05:600c:4fd6:b0:436:18e5:6917 with SMTP id 5b1f17b1804b1-438912d3aa3mr165222155e9.0.1737455552125;
        Tue, 21 Jan 2025 02:32:32 -0800 (PST)
Message-ID: <a1bbceec-e4b3-4ce5-a54e-b3080508f340@citrix.com>
Date: Tue, 21 Jan 2025 10:32:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/amd: atomically update IRTE if supported
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250121095704.18769-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250121095704.18769-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/01/2025 9:57 am, Roger Pau Monne wrote:
> If using a 32bit Interrupt Remapping Entry or a 128bit one and the CPU
> supports 128bit cmpxchg don't disable the entry by setting RemapEn = 0
> ahead of updating it.  As a consequence of not toggling RemapEn ahead of
> the update the Interrupt Remapping Table needs to be flushed after the
> entry update.
>
> This avoids a window where the IRTE has RemapEn = 0, which can lead to
> IO_PAGE_FAULT if the underlying interrupt source is not masked.

It's probably worth saying that this race condition was identified in
the field, rather than being a theoretical issue.

~Andrew

