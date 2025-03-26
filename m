Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB1A715F7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 12:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927673.1330399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txP90-0007VZ-C4; Wed, 26 Mar 2025 11:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927673.1330399; Wed, 26 Mar 2025 11:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txP90-0007U5-91; Wed, 26 Mar 2025 11:42:02 +0000
Received: by outflank-mailman (input) for mailman id 927673;
 Wed, 26 Mar 2025 11:42:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txP8z-0007Tx-BO
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:42:01 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51fce241-0a37-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 12:41:56 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso51296865e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 04:41:56 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fcea6ecsm181581975e9.5.2025.03.26.04.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 04:41:55 -0700 (PDT)
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
X-Inumbo-ID: 51fce241-0a37-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742989316; x=1743594116; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B/h+mNytzdRDeeG+8BdkiWsLvRRQOGwL1arIKQBRwE0=;
        b=gIQyEIKjdiYZ5DdruwZIb2+3aQlfQQ6u5iJO3tzoXR4VfmOcbtDo9R3D1NPUXn97Ou
         mj5Um0/7FtYc8syLCHXu1tD2nzLty2+1nvgP+ZO9QXclRrG2+hHUEhtoH0dMEjKKPcnp
         GfoEVuvKYMM/ft2R1gz1UdRsCHv/qHeym/jXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989316; x=1743594116;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/h+mNytzdRDeeG+8BdkiWsLvRRQOGwL1arIKQBRwE0=;
        b=rqSQHMB/CKyji0hazJjI6GCWCbXcvmBzk9ycbeOjGovElb54lXgVttP5bVzcwwOtUI
         ZohKnQv8lQhgeVgI9Yeu3/jNPP1inLd99ZT1drSv7cSUSyJ5JvpqyWLnqriExMtzKo4z
         ANucRDjl5dUZUiHYY3Ucb9muvL7AEnHzEFR+q3rN0C2HLVNTjcYzhpSu08jUin45W/Bn
         /480LcC7L7/sy5DCCGq+PuYcD7h7XulFl38JLGDmYGmQoUzdhbajNS3M0jVNQEG0W64Z
         QIs0aCQqIloR+zRhr2QJcG797MvHhgi/Cvz6NtKBEKohQPo73P6LTNdpEu4XnfNACG9Q
         701A==
X-Forwarded-Encrypted: i=1; AJvYcCXAKG4WaONDsxf6claL0iAXScOM3Px+DxgxJ5k0ZZufSLYWs+FMJA7i+nuMNe84w01nZrp29+5eHFU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhbhXmTPdvacqrZbeXGw5BZGSN0YCRgkY3h5tONnmeH9JArhHN
	w6Od7aWZBbuAiF+byJtHcyppFZucA48pTNsyFJSN2+uljwVVAa3A8wihLycmszE=
X-Gm-Gg: ASbGncsia5toYyVp8byPkZy0l2t5U7y2Vt1guYCl3E+YqJS3mAE/SYClQgZNA6G5faM
	2cafeg9Fw4DRB92FvXHypuzdCycZV4vfxbQnymgFJlfWD5QltM1RbdXJ0zf0btgP+srexPFNR3c
	Z3e8xLCxVRYjdfkYFbRNB9zh2XbwgkUO7QaSaSCORsLpP/XHXoqYJQymoSJDZR1jvPk8RMDnetM
	rstZ98aS7he3SkGi1Qx7J1+C1vOC/DJ7XMUB9NEUoafyUCkxewpEuwej08b/4tSv7Sdp7Oyk7kI
	uiBJo6UAYIS9HKaBp75kE0wQkNozYDg8Aw9OAHRfxOLfAS7AkrIAcKeqN+qZz/Tuzaqh/gGkg+1
	th8pPet8iKQ==
X-Google-Smtp-Source: AGHT+IGM+cY+xt/7uzs+aRE49l0nyrhXw1BHBP/B911RdoDNnEJR6d1sEFMo2rrLvlNq6VTsmJrVhA==
X-Received: by 2002:a05:600c:574b:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-43d5703e686mr143941895e9.7.1742989315909;
        Wed, 26 Mar 2025 04:41:55 -0700 (PDT)
Message-ID: <9e60173d-ec9b-4a76-8299-7d0e492f4407@citrix.com>
Date: Wed, 26 Mar 2025 11:41:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm/domctl: correct XEN_DOMCTL_vuart_op error return
 value
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <fa6d6ca6-d133-4a9e-9da4-42b0c0b50437@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fa6d6ca6-d133-4a9e-9da4-42b0c0b50437@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2025 11:39 am, Jan Beulich wrote:
> copy_to_guest() returns the number of bytes not copied; that's not what
> the function should return to its caller though. Convert to returning
> -EFAULT instead.
>
> Fixes: 86039f2e8c20 ("xen/arm: vpl011: Add a new domctl API to initialize vpl011")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

