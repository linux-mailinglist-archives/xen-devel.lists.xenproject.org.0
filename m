Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA9C92A044
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 12:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755283.1163603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQlfX-0002jZ-LG; Mon, 08 Jul 2024 10:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755283.1163603; Mon, 08 Jul 2024 10:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQlfX-0002hs-Ib; Mon, 08 Jul 2024 10:32:27 +0000
Received: by outflank-mailman (input) for mailman id 755283;
 Mon, 08 Jul 2024 10:32:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP+Y=OI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sQlfW-0002hm-Mq
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 10:32:26 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dffc742-3d15-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 12:32:25 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso348259066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 03:32:25 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77ea919751sm168943966b.86.2024.07.08.03.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 03:32:24 -0700 (PDT)
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
X-Inumbo-ID: 5dffc742-3d15-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720434745; x=1721039545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OG9jfp2Gky05C9BRwRrEDcd3skzECO68GndxkSmYCMk=;
        b=AmHlyP56fpOXHlu7T8L0bcEO28ZUjVK6GuLCw6ykN+Fpi7gp9lBDGRnDaEvA+udClZ
         Z43oirBlfHIK0sTLcDWptTuYxAYO7zK81WPW/Onga1IBmj8/WcfCl+h1ylEINZP4fpst
         1SUQR0fq6vO/EQXjC0ZJPVRhex0Fe2RWgV2GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720434745; x=1721039545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OG9jfp2Gky05C9BRwRrEDcd3skzECO68GndxkSmYCMk=;
        b=d0ecZjMyd3RKbxuqSHqnBelHXn+ul7EBsM5vUFcPNQ67S1YdZFPPqzkGkXldpZSYKk
         KZAHGxS+7X9kWsRrIPSt5G7CgsXvcbO+kbaDjUia6d1D9ZRpI8lDCYDmy9SWy6DMfKpe
         czmDRkATkI2RPcBQXPpkrN9CoG4XN3xc63/14WlX1zkWPX7do+qakfXsTXXOMnJFdvFN
         OoVVhSVbBlhYcA13fnZKvMX6umI3Xa4j3y6Ddu6WjvzP7y9m7mmIX0Lv0NfL72mDo042
         Pvd8MGVVSpP/ArCPXza3+ADU5aAy/YTVOoe++AGB1mIsFLTNE4hCjZx49KoewtP46pP3
         gDOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF1lmyco6RcrYWbRbr2l44vhTbdlDoUI2YhKQogVfsku5LbvmywzxhGp9XCXAnBH2pW28gUpi0OZ3WhGLtIoOhoBO7r8FXrAj0QfK6i0Q=
X-Gm-Message-State: AOJu0YxkdOA5pn1PzvFWv6MfolWKCcR8bGj4q+JFTluBMcrQtlC6vBiE
	gq+M69nzgcRA2El4yEu0ofjUppfiUs99OEzte4iPZ6ksWkNR9ZzEHz9xkx4s/bHKCtSt3BXNFYj
	i
X-Google-Smtp-Source: AGHT+IFaH24L9tgYxPtpEHhsZCVnTxxPnjr7MpCuZH+VNYQUDEIpU7DZGB64Vn0JgQivZchHV5hWaw==
X-Received: by 2002:a17:907:3f8e:b0:a72:6ff6:b932 with SMTP id a640c23a62f3a-a77ba711c8emr849580666b.51.1720434744632;
        Mon, 08 Jul 2024 03:32:24 -0700 (PDT)
Message-ID: <905c2eb7-9fe2-4a7c-91b3-1f9df245c5a3@citrix.com>
Date: Mon, 8 Jul 2024 11:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2] x86/physdev: Return pirq that irq was already
 mapped to
To: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Huang Rui <ray.huang@amd.com>
References: <20240708080456.401764-1-Jiqian.Chen@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240708080456.401764-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/07/2024 9:04 am, Jiqian Chen wrote:
> Fix bug introduced by 0762e2502f1f ("x86/physdev: factor out the code to allocate and
> map a pirq"). After that re-factoring, when pirq<0 and current_pirq>0, it means
> caller want to allocate a free pirq for irq but irq already has a mapped pirq, then
> it returns the negative pirq, so it fails. However, the logic before that
> re-factoring is different, it should return the current_pirq that irq was already
> mapped to and make the call success.
>
> Fixes: 0762e2502f1f ("x86/physdev: factor out the code to allocate and map a pirq")
>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

As a minor note, we treat Fixes: as a tag like all the others, so tend
not to have a blank line between it an the SoB.

Can be fixed on commit - no need to resend.

~Andrew

