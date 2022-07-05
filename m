Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3B567984
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361621.591222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qQG-0006iG-Oy; Tue, 05 Jul 2022 21:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361621.591222; Tue, 05 Jul 2022 21:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qQG-0006fY-MI; Tue, 05 Jul 2022 21:49:32 +0000
Received: by outflank-mailman (input) for mailman id 361621;
 Tue, 05 Jul 2022 21:49:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLZa=XK=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8qQF-0006fS-2d
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:49:31 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58fafa62-fcac-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 23:49:30 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 r81-20020a1c4454000000b003a0297a61ddso10513439wma.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 14:49:30 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056000108500b002167efdd549sm5804766wrw.38.2022.07.05.14.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 14:49:29 -0700 (PDT)
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
X-Inumbo-ID: 58fafa62-fcac-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IkApP0qBnWfBhxv+dsAyKahnuOswQt2rNblrcG1NROA=;
        b=nxetrEp0FEGIUqLOxGkqr/LOvRAfoRPP7JKL2dSQthAxJyEUtmJw9ks6g94I+XocmZ
         RLb50jXS/wzUE/9JNA5HIM4tVb23gSXWpLaIIBq8BuxXKLxUFaSVrkfeHSBwaRyUrOY7
         /vBPb/x09b8SRrkejY1MwQYZDe3E3kmA0ntBKVv8LdZ6G1AywIXouBWUMQXnQd5vRWkI
         p1b5pSVDYscc+puGcfhX2qBrqTc+iMMlrVWTEV+RRzaNYFBHWWlXw17Gtq1O5GolkdkY
         80DXGFYth9eW8wyUEbUn6VnHcHDcmW8oC4LQOc0th5TGRoJwOExpY7jLaIa2gINQJJlC
         d+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IkApP0qBnWfBhxv+dsAyKahnuOswQt2rNblrcG1NROA=;
        b=UsIAZF6pwsPL2XPXsF/7ONRF/aIGudr7peBQDtrwlv6gF9/9z+msEBMmYW4LRqJgOt
         GNAvjy2eWZnXAOcx4nrhApbFX1qrb8JffTlHihOcErreffh0Es6IYyQcKp5pP8FDmAmC
         kNMygP/oOpj9WaR8Jlh3iNKq7UpDTfEZA92aEiV7vihZooxPpcEXikHAfOvC28tkCVNx
         q2TgdP29R9Xc4bPgU8C1zDYIlBwxr9ro448Z/5YDds4gYJ1DX8fFHZjZxW1pWUFWcR1i
         6uI6LMGf9QCRcXXV1zxx3Whe8p3Pnipf4UfZWj+alI0YIT6AHN8KeyzVvJJdBfecniUk
         tW/w==
X-Gm-Message-State: AJIora+K1bywOrHAi+2jbOfMtCeM/KGqJZl0hQHzEWJ+qfK1ILMbmCwH
	sNhV7G9izakS1dd7PP35Lzo=
X-Google-Smtp-Source: AGRyM1sUl5v6+2mZNbRHJe4Sbn+IuHfpRCeSPAHBuh0xSy2oneQ+V7UVSL3vko6/ydOn21Kj2DzQkA==
X-Received: by 2002:a1c:6a0d:0:b0:3a0:4b6e:b64e with SMTP id f13-20020a1c6a0d000000b003a04b6eb64emr38988406wmc.188.1657057769642;
        Tue, 05 Jul 2022 14:49:29 -0700 (PDT)
Message-ID: <0accbe13-2155-185f-5d77-a590e1855af3@gmail.com>
Date: Wed, 6 Jul 2022 00:49:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/4] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violations
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-2-burzalodowa@gmail.com>
 <f0f36355-29c5-7355-f784-4d844ebc5566@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <f0f36355-29c5-7355-f784-4d844ebc5566@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Julien,

On 7/6/22 00:28, Julien Grall wrote:
> Hi Xenia,
> 
> On 05/07/2022 22:02, Xenia Ragiadakou wrote:
>> Add the function prototypes of the functions below in 
>> <asm/processor.h> header
>> file so that they are visible before the function definitions in traps.c.
>> enter_hypervisor_from_guest_preirq()
>> enter_hypervisor_from_guest()
>> do_trap_hyp_sync()
>> do_trap_guest_sync()
>> do_trap_irq()
>> do_trap_fiq()
>> leave_hypervisor_to_guest()
> 
> I have actually came across those missing prototypes in the past and I 
> have refrained to add them because they are not meant to be called from C.
> 
> While I agree this is a violation of Misra C, I am still not convinced 
> they should be added (there is no need to verify the prototype).

Yes, there is no need. Here, I decided to follow the example of 
do_trap_hyp_serror() and do_trap_guest_serror() for consistency.

> 
> So IMHO, they should be marked as deviation.
> 
> Cheers,
> 

-- 
Xenia

