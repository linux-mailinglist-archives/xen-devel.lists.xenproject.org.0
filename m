Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B47EF158
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 12:04:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635057.990767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3we3-0001Ta-9e; Fri, 17 Nov 2023 11:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635057.990767; Fri, 17 Nov 2023 11:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3we3-0001R9-6v; Fri, 17 Nov 2023 11:04:19 +0000
Received: by outflank-mailman (input) for mailman id 635057;
 Fri, 17 Nov 2023 11:04:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tr9K=G6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r3we1-0001R3-98
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 11:04:17 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b8a8a12-8539-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 12:04:14 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c523ac38fbso23851161fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 03:04:14 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b004094c5d929asm2348941wms.10.2023.11.17.03.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 03:04:14 -0800 (PST)
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
X-Inumbo-ID: 0b8a8a12-8539-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700219054; x=1700823854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dsMEn8VdLDcY4n9dfxdRO2j5SuKks8m5V1waqXpirS4=;
        b=M4GwRm0Z8oEnD3ehckNZwlNN7cBjuDlztKY7P1g2ZcfH1JHXwlQvoIWhywWmXy2W/j
         ii18M0IF7YmXpRgIHHM20moXMkRaivP4MNT91fL/q09iVGRTYId2C9YnzYCBJFxGUDwm
         jJPrw3dGHLKbxKhg+rdTbBXrig+U2LkrGtido=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700219054; x=1700823854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsMEn8VdLDcY4n9dfxdRO2j5SuKks8m5V1waqXpirS4=;
        b=eJ50aD1pIBH/W+yCaST22Yrc1oP0JUM/0MQr3keyeSHoCETLy37W+7UBVRwqDa9laG
         sZoC7tVmiirbmrKAW2S1jK5chKpbdq+hLKPfXtroRG9vgInvROWoxyDnxwFfV36FjlYp
         aKETDJY9eOVn2sSXdvgYJn92hDXDMv4iqsbRr9dheujuMVQ7BRlRDSi9oBxB7yvSsf4j
         dsHmWEPF+LVre02U0LbLvkycL/V8BEkePvRaqGAxOXknrwOFYCFZTRsjKWgUZqr3ZN5r
         anPKl22pIQ9oRZc3JXwyI9iAc3bgkm0Snm1e4Un2b01aZ7/6S6H42mB2alDm3TEqhcmP
         IZCg==
X-Gm-Message-State: AOJu0YxegijIQGMukqgOcJuHBgAU3FMN6gF3zQM6OSRt6mV2uvqmEmOz
	KGTbVvlQ44iC5lJMUH0SqsTmlA==
X-Google-Smtp-Source: AGHT+IGSF2HngHygQA4Y7YnYdrfVQgHOdTH4TwIDyk7AfCHxUNwZFWIw838AnPSNpvmOZaszxBFOuA==
X-Received: by 2002:a2e:8e6c:0:b0:2c6:efc6:946f with SMTP id t12-20020a2e8e6c000000b002c6efc6946fmr3836568ljk.30.1700219054347;
        Fri, 17 Nov 2023 03:04:14 -0800 (PST)
Message-ID: <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com>
Date: Fri, 17 Nov 2023 11:04:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Devise macros to encapsulate (x & -x)
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: Consulting <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jbeulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Roger Pau <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/11/2023 10:17 am, Nicola Vetrini wrote:
> Hi all,
>
> As discussed in this thread [1], which is about complying with MISRA C
> Rule 10.1,
> a macro was introduced to encapsulate a well-known construct:
>
> /*
>  * Given an unsigned integer argument, expands to a mask where just
> the least
>  * significant nonzero bit of the argument is set, or 0 if no bits are
> set.
>  */
> #define ISOLATE_LSB(x) ((x) & -(x))
>
> This macro has a gained some calls in the subsequent patches in that
> thread, but concerns were raised around the fact that it would be
> better to devise a macro that evaluates its argument only once. A
> proposed solution is this (thanks to Jan Beulich):
>
> #define ISOLATE_LSB(x) ({ \
>      typeof(x) x_ = (x); \
>      x_ & -x_; \
> })

Of course this was going to explode.

This isn't even the first time an unwise attempt to do single-evaluation
has needed to be reverted because it doesn't work with Integer Constant
Expressions.

Switch it back to the first form.  It's obviously a macro to begin with,
and not likely to be used in cases that have side effects.

~Andrew

