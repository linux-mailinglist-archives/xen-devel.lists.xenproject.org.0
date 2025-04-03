Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 692D0A7AB94
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 21:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937226.1338239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Q8Y-0004jh-Jf; Thu, 03 Apr 2025 19:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937226.1338239; Thu, 03 Apr 2025 19:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Q8Y-0004iA-G9; Thu, 03 Apr 2025 19:22:02 +0000
Received: by outflank-mailman (input) for mailman id 937226;
 Thu, 03 Apr 2025 19:22:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0Q8X-0004i4-If
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 19:22:01 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea3a35b7-10c0-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 21:22:00 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso9129315e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 12:21:59 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec169abd7sm29503565e9.18.2025.04.03.12.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 12:21:58 -0700 (PDT)
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
X-Inumbo-ID: ea3a35b7-10c0-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743708119; x=1744312919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lrFEpHrIilUSSMkgYQI2gbZruyjnulK5DcIoWs+kEOA=;
        b=iFwB/I2UKk0lWt8jYiSfTolpDc7OKkZpNLRzv5JL+QdJ0UmGgivwd3oVp1UsjuPVpG
         TwWz/eliR/Ks/3OLZ5LImz2uvbVQMgdyRSriBNmiE00F1YdS54pFBk1CFmweJUfl1Qp+
         NU7sByFeaeOHPfVJDxC97pnxe0VpVgtifr76w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743708119; x=1744312919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrFEpHrIilUSSMkgYQI2gbZruyjnulK5DcIoWs+kEOA=;
        b=hhFpWK5EsrWq/cQOukAr1B4aeTaDtAtLZIgzzF7TABmB1rV7jdmSQ6r2oO45qj2lJq
         E2dgKO8JSBEJNnLTzwteOLb5eGDg6ugg5CaVDPCkhQzCoAHN4A9/5CQStdow6iSzPYNe
         QU1Cp5IcWZyI2MDZDzQQRZF6LwwZ4ZrS2b4hYZ6K3z9CECrVsKKSSKauq1CIwv82jJF2
         Xw54FuL+yUBWoQG6OzuBmMuGw6gea6rIV/03Ck8inbhHYmA9TZl5KolQh0BOSt+jKnqd
         ZYPXlm2UGnQWd9fLi8ID4iCJRyym7IPpkn+htO3D6jXKR28q9ofmwOd8pUYHiXiBCfVV
         H7Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX3aO5UqVivqa25DCDc6+Z2Rr7uFkkI/wRE4aGbRz8cBEHI32xNgqlRdzgIRgbRD5Wj1SVriFSJmNI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZx3vN+1gsyb4+Iw1N7Z9VIC7aceDwIwGeqnGF9HValBvMpHi6
	z2Fg542yV9rxuGde1jJpj/IAZDIF/uM0gqcVdC/rSgJFvWnCv8BG3GvDHLYn45YACAMkS34lJSA
	7B6I=
X-Gm-Gg: ASbGnct3XYSgqNSBC9E4FnNopR1dO125WqVQLXMta0MX/8CqTnCvlhiQnKJPXDlwCnq
	9pUXGMb/6WJ1sOESZvYNPW+F3fnmRUggwDOFYk31cu/7xMoCZ1z77BFOjsOvAeJCpudM5XLtJGD
	ZVNLoX0Rz4ZIfoVDH/2fV9z5D3e1bBcgdj1p8NXmJiCjQjynQX6NNzc4OsJrqD8S1mhDry8BQMO
	tnHqyZsn8+yJNuGBMbqO23+yZeOQ7Fn0106Ref8sNMExiWyBoMIsdJb2ACI4BNxpGy5k48dAI/f
	liRysoVytVQIehmXkAkUZ2qyscaWPoIVpKUnerYkDpGvdeAr6RCjyxiXySuZ5/lllB8G1M+F37X
	15lLAN/WTmg==
X-Google-Smtp-Source: AGHT+IEcVS2Nukkf75qDp4Y8gHYwy4QOHWIrScAyx0xit3ZNnjWmmwvLaLWmRVV4gYZRustacrc3fg==
X-Received: by 2002:a05:600c:c07:b0:43d:224:86b5 with SMTP id 5b1f17b1804b1-43ecf81c5a4mr3679645e9.4.1743708119299;
        Thu, 03 Apr 2025 12:21:59 -0700 (PDT)
Message-ID: <de2ef26a-f999-4962-abbc-3ffcc684e7f7@citrix.com>
Date: Thu, 3 Apr 2025 20:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/emulate: remove HAVE_AS_RDRAND and
 HAVE_AS_RDSEED
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250403182250.3329498-1-dmukhin@ford.com>
 <20250403182250.3329498-6-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250403182250.3329498-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2025 7:23 pm, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> The new toolchain baseline knows the rdrand/rdseed instructions,
> no need to carry the workaround in the code.
>
> Resolves: https://gitlab.com/xen-project/xen/-/work_items/208
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/arch.mk            |  2 --
>  xen/arch/x86/x86_emulate/0fc7.c | 15 +++++----------

Huh...

I was expecting a hunk in xen/arch/x86/include/asm/random.h but lookin
at it, I see that didn't even get the HAVE_AS_RDRAND treatment in the
first place.  Also, the + constraint, rather than =, looks suspicious.

Could I ask you to clean those up too please?  The rest of this patch
looks fine.

~Andrew

