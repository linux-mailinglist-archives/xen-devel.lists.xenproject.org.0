Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE479585140
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 16:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377555.610801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHQak-00052x-Fw; Fri, 29 Jul 2022 14:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377555.610801; Fri, 29 Jul 2022 14:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHQak-00050c-DA; Fri, 29 Jul 2022 14:03:50 +0000
Received: by outflank-mailman (input) for mailman id 377555;
 Fri, 29 Jul 2022 14:03:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHQai-00050W-Nw
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 14:03:48 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4317ce0e-0f47-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 16:03:46 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id w5so5914133edd.13
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 07:03:46 -0700 (PDT)
Received: from [192.168.1.93] (adsl-93.176.58.224.tellas.gr. [176.58.224.93])
 by smtp.gmail.com with ESMTPSA id
 k16-20020aa7d2d0000000b0043a6fde6e7bsm2403100edr.19.2022.07.29.07.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 07:03:45 -0700 (PDT)
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
X-Inumbo-ID: 4317ce0e-0f47-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=j5Yz/Xjss3H9E9SD2eUZecqkfFFQnVIl+HJzuFb9IwU=;
        b=AwUB+33/SPZyiYuru7nMz39kdD4XaogxfYTRFOiZoGl6lDbPZSJvfM55qYTt6BU2mt
         fDAduUdrR8cCseO+6EKvNbpRCBBNq6clfW67DFxUmXGmaoBemYlPSJKMqgu11jm7V0yU
         jdBOTUE+juAi8RyqLOwL6xE2x/SI7y/QS9EQqqT5zGLwCLF/5RMYjkZQwo0IrJqYiVHP
         X5Wzg+EhDq3tD/oklzEwXQSJWw8bPTmBNXXbPaKGPj1hyywg8KpqF7PYqH4kb3ajTn2b
         chu2UZYqRxE2OwR4CKHwAlfjwzTJRMZG7xvd6KVNQLL8MX305wl0u1BnLF+Jqn8zxSwm
         4VJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j5Yz/Xjss3H9E9SD2eUZecqkfFFQnVIl+HJzuFb9IwU=;
        b=lKHQ8lRBySmxv2p3BdtKSt1Donnxw0H7gHmm/HU0oEztCeohFASYbk7goidJ8D6q0F
         E+MUOGOZ8Eb5F6RzF3blchDuA6Y+zBKbPqU8MTS+JbjB9YrQMhvkwEWJvwbukymTv+6r
         fbd3PNPiPFZn5f9+NwVDU6teDuZYKjleAVoVzneV2W44GDo8xVH4JVlnAyOAn0VSvToi
         6iqUZ2dXzHb2ksXGWQlQCDgLpEAZyBIyX6MypbYwbd6jBu2P4tb94+mkr+s2M7RBnV2g
         dS4+Y4F0QZWhowepLAaBfBj9A7zxgSlv6V1DjHD9vzAuT0HXbTOyFo9W1ExHhEAZhFL6
         iC0Q==
X-Gm-Message-State: AJIora+wtm3WfDF6T5zf0l7MTuXzqD3mC3E+NjSYIowj9jBW5cKQr9eN
	i4dvRQkQQ8+Iofrr/8gOi18=
X-Google-Smtp-Source: AGRyM1uXn6m2/lWtaAfIVV0VBkVTaOjlDnLn4r1b7YhIjqLgyBUVZFxXVFrnuVO0ktYnlLwAbOWgSw==
X-Received: by 2002:a05:6402:518:b0:43c:a863:55b with SMTP id m24-20020a056402051800b0043ca863055bmr3704847edv.127.1659103425740;
        Fri, 29 Jul 2022 07:03:45 -0700 (PDT)
Message-ID: <01bb7315-91a1-de7a-2c17-c6772f740619@gmail.com>
Date: Fri, 29 Jul 2022 17:03:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220728162151.1228747-1-burzalodowa@gmail.com>
 <65adc941-78a9-2e2d-fa43-6189ea95773d@suse.com>
 <b9f3bbc1-e6ec-35c3-6ff6-35e051c86953@gmail.com>
 <4327CBBD-315D-44C0-A429-25F3CA5BE25D@arm.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <4327CBBD-315D-44C0-A429-25F3CA5BE25D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/29/22 16:41, Bertrand Marquis wrote:
> Hi Xenia,
> 
>> On 29 Jul 2022, at 07:31, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>
>> Hi Jan,
>>
>> On 7/29/22 09:26, Jan Beulich wrote:
>>> On 28.07.2022 18:21, Xenia Ragiadakou wrote:
>>>> --- a/xen/arch/arm/domain.c
>>>> +++ b/xen/arch/arm/domain.c
>>>> @@ -63,7 +63,7 @@ static void do_idle(void)
>>>>       rcu_idle_exit(cpu);
>>>>   }
>>>>   -void idle_loop(void)
>>>> +static void idle_loop(void)
>>> While you're adding "noreturn" below, shouldn't this one be marked so
>>> as well? Preferably with the addition:
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Yes, but I was not sure if this should go in this patch or in a separate one.
> 
> As you modify the function to make it static, I think it is ok to also add the noreturn in the same patch.
> 
> With that done, you can add my:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Cheers
> Bertrand

I consider this change unrelated to the patch. I think it is a bad 
practice to squash unrelated changes in a single patch. Also, I do not 
think it is unfair to be obliged to make it in order for the patch to be 
accepted.
I could have taken the opportunity to fix this in the same patch but I 
decided to not take it.

-- 
Xenia

