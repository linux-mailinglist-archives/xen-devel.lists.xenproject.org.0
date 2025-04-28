Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83580A9EF6B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970592.1359244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Mpp-0007Zy-8B; Mon, 28 Apr 2025 11:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970592.1359244; Mon, 28 Apr 2025 11:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Mpp-0007XW-4n; Mon, 28 Apr 2025 11:39:41 +0000
Received: by outflank-mailman (input) for mailman id 970592;
 Mon, 28 Apr 2025 11:39:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Olx=XO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9Mpo-0007XQ-DL
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:39:40 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 771cb681-2425-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 13:39:38 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so3514506f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 04:39:38 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073cbe386sm10745519f8f.42.2025.04.28.04.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 04:39:37 -0700 (PDT)
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
X-Inumbo-ID: 771cb681-2425-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745840377; x=1746445177; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nPKO/xNIYefnPKOouXiCqcAbJj0eh0MSPZil9ZG/Io8=;
        b=OqoMwzAJrkvvl9U47OhqfZcuwiiS2lz+eMuItoSkkmFY4myS/rN90olOZEoDRxt5JU
         E72zJ19upmUucwC7vImqji9QhWYuMNRCtcb6PA9ne7+WrvApD4U2FKvNjUVgH4QXxnEY
         Kv1BPmB69GGm3hvaV96fy14AX3bNeFP+SHNzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840377; x=1746445177;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPKO/xNIYefnPKOouXiCqcAbJj0eh0MSPZil9ZG/Io8=;
        b=HffjxPb5zX1jPANxr+dCr2p5krXYGN4y59RjYsZsvwcp/bDpiqjWqn7wtJJuBoTco/
         GncenTdvLIpd9sop8mGptYdojt3zu34ZIf5aS3c4p21wubnL8Xz3/InSqT3yvXYiNGre
         Z/0a8JdkofWlT3+xLeWC7XOYZ4OXQFcawQnfFvY6UylD2pLcHtC0Ux40pEWkRUpHmta2
         0DdvfB6cckACH+RFS73I60WmK8LeUdCLy0aV28xowG2aygdpkHDAVMq9pn2FtvGXMZTU
         spowhn2kLXwIsWP0+oITSnvSn9Vqv9mQnVSNzOIMe3qUSe8OdoSYoa/GDzQeP2zql7Xz
         BsPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVSnW+/HazZ07u/hE+2mKsx5O9RxOpRWr73d1PnmcHEfVoUtw/Qgw0TvszHDYKi4Zd0Mcm09Huk44=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJJIN6RoLl+G78aLt7KmPttfqUG1wbkhVW2xIoTlK7LyNxrmM8
	b92M7nFL0K1NZIo6Et6nvXJVcp7PDY9Lh5xAyVGR5EPwTxXJUhCtkhqJ8caheYM=
X-Gm-Gg: ASbGncu3IF92x3Bb71NldSePUsVFDmztgf7+nwvZRcGzcBUPsaRJx/7aP+HAzwtY6y9
	lP5Q7UmY89Q6ceo7URa4H42MMVZ25E8vbvH7cCr3FFHjMaE+tiIuUgsTZcYjYBbRS4A5nxg/hHx
	h9za0Avk9l1taGGmCFJdpCGmn6FCjABvUg1eDqmko5mC+XlQhiXemduLfVqLgBUVLqEbt2lv8qi
	vlkhNGynHwZz/0RV+u2lNCxsSn0tmw0JDnouiaW5t4BaSPD84HuvEitazh6ZdvLuLgoFF10sSxj
	vLgV3hCRqXajP8m0zO7p0b9LkMqtOGMHfcfrwz/BRLSpcRg9r1w6OK0RGvSb7I1sJzaC5nwGfG9
	XLAHRIw==
X-Google-Smtp-Source: AGHT+IGe7ERBMii86zEn87NNl2LpZi2E3A9RXM6Fym0C6OAhksFEUmzcvJagdUFZFNbtz/tOgDGOJA==
X-Received: by 2002:a05:6000:4382:b0:39c:2665:2c13 with SMTP id ffacd0b85a97d-3a07ab8a510mr6595213f8f.54.1745840377605;
        Mon, 28 Apr 2025 04:39:37 -0700 (PDT)
Message-ID: <0b47b52c-e998-430a-90f6-e95bda74524d@citrix.com>
Date: Mon, 28 Apr 2025 12:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] x86/vmx: Introduce vmread()
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
References: <20250426072720.39317-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250426072720.39317-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/04/2025 8:27 am, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> The current implementation of __vmread() returns the result via pointer
> argument which leads to excess code in some places.
>
> Introduce a new vmread() function as suggested in [1].
>
> [1] https://lore.kernel.org/xen-devel/c452a1d7-4a57-4c5f-8a83-36a74ff228ec@citrix.com/

Usually for this, we use

Suggested-by: whoever

rather than links to emails.  I can fix on commit.

~Andrew

