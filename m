Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D397CA5A564
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 21:59:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906845.1314222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trkDD-0003O2-Lm; Mon, 10 Mar 2025 20:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906845.1314222; Mon, 10 Mar 2025 20:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trkDD-0003LM-Hg; Mon, 10 Mar 2025 20:58:59 +0000
Received: by outflank-mailman (input) for mailman id 906845;
 Mon, 10 Mar 2025 20:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UYYE=V5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1trkDB-0003LE-9s
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 20:58:57 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79aff57f-fdf2-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 21:58:54 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so14754905e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 13:58:53 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdff72sm16244727f8f.36.2025.03.10.13.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 13:58:52 -0700 (PDT)
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
X-Inumbo-ID: 79aff57f-fdf2-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741640333; x=1742245133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cb8VwozYLihPlXOI0f+/TMwpoy8uXYoZ099zSO2jGrY=;
        b=EG8ANhzrCky4RV7M1uNIOPiImEpGn4XUrAnUV/8YwmRIuCCdWUo4dF6rflr/iQRbFf
         AV6yeThlZ/UETtcARhDT4AhAWy6/5Ha3QU7p3aXz30YnQyKKc4UpWgl+XHVsqwksCBFl
         NaHHgSzIY3h0/nCAiXkFswPSzvbakKFon28AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741640333; x=1742245133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cb8VwozYLihPlXOI0f+/TMwpoy8uXYoZ099zSO2jGrY=;
        b=BstXiEG7rb7fE/1jJ7xv8ECcK4+ryKymSIyFlAYhwPR4tJiVFYxxyi4RUecSNgvAat
         KCgg+Qannsbc/DlUcnsTmoMIIhEAhdU/RKOsXTU5pG0reKcTUhxjMTkzBbgbOkIEjnM3
         xY6CxL415VDuxhlsHPI59Lxz7hUBmkQwSsLxv5ttGsNS4WuA3loQ26ResO0zoJKqgLbt
         LE84QBVu+yPgghLftPNYgKCqmUD9rw/kfMvTGRzc8OIY3g7LYuEyDPh7EVb1scpcS62h
         YWXMLhILh+e+V7j1NzEOu9okfVjmPJO0YQZWQMNOXIoIyiJZMTu8TFIqSEYy50+AFT+5
         sVMw==
X-Forwarded-Encrypted: i=1; AJvYcCUAGXL9+9CvJEKC2ZRDLbDnslDHwMEVqqiw2T/YBCZ0LM12bZ+j9bcrmGsTAHAfQoI7QX6OZIYQS5I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWLx9cx4/ZrpghQQYvqa15yiAOymfNN9K9LYvxdMik9R62O7c2
	TNN2/WYDoJp2YnvecE4CHJ9TSQDdwto1UvodPgugNvKRlOgmklxeY78G1ziKTVc=
X-Gm-Gg: ASbGncvPWwMyGBMZImaBLvgGAJ7r96ACMTWkMJjob9QPalDZCeRHMiO9A0oSLdvEKsb
	d6HNDhWmLGY+DVlmZtftcYOHvRxgFF2hl1Jcw/zcoJaayWArZtrJSahcjMtzy2p4+8qW+d8tiLU
	WSLPpFZRNZMziwnombQZmTqU3/NF/75qE8q07w/FJnTqeovxKeK85rLwhOtUehiVDp1u6itIHsS
	z1Kpq6ggZrup8UIxhNqha+l2qmZCELBa0Qn0x7Gfoa8RXaxX514WZF7BFogSBdxZWdmQcb6qaRU
	3epkzynh5qB9fyjmXgMALZ4H7RYtfHH5/TvKXHLNwskWCa1mhYbZbQgUIZiivu2r14IkFLs8IPN
	knJCSJhYu
X-Google-Smtp-Source: AGHT+IFMFL7Db4G/4h+vbm5L3e+h03+zVh8NKDYLPX4Dlkz72erFh9IJx5d/IKWv+ktO3ksqq6oQHw==
X-Received: by 2002:a05:6000:18a3:b0:391:3207:2e6f with SMTP id ffacd0b85a97d-39132d984abmr10880095f8f.42.1741640333312;
        Mon, 10 Mar 2025 13:58:53 -0700 (PDT)
Message-ID: <137cc8c6-0727-4253-96b8-45d28ce40943@citrix.com>
Date: Mon, 10 Mar 2025 20:58:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/console: make console buffer size configurable
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250306080428.155039-1-dmkhn@proton.me>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250306080428.155039-1-dmkhn@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2025 8:05 am, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Add new CONRING_SHIFT Kconfig parameter to specify the boot console buffer size
> as a power of 2.
>
> The supported range is [14..27] -> [16KiB..128MiB].
>
> Set default to 15 (32 KiB).
>
> Link: https://gitlab.com/xen-project/xen/-/issues/185

Minor note, we typically use Resolves: for this, which will auto-close
the issue when it's merged.

~Andrew

