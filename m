Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B835833C3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 21:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376438.609204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGms8-0000Nc-KQ; Wed, 27 Jul 2022 19:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376438.609204; Wed, 27 Jul 2022 19:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGms8-0000Kh-Hr; Wed, 27 Jul 2022 19:39:08 +0000
Received: by outflank-mailman (input) for mailman id 376438;
 Wed, 27 Jul 2022 19:39:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0cJb=YA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oGms6-0000Kb-CM
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 19:39:06 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c61f1831-0de3-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 21:39:05 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id t22so22136479lfg.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 12:39:05 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a05651232b700b0047f6b4a53cdsm3924130lfe.172.2022.07.27.12.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 12:39:04 -0700 (PDT)
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
X-Inumbo-ID: c61f1831-0de3-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=fJ2Ae/vdufhtrjHgsvvHcimV/8iioJZZmT29p5C1vVc=;
        b=mJ65Syy8nn9oZNPstgGmJKpAnhe2vKJYIOsNXOVBY9S10NEHg6VL7Gp1WJG9TsJ0+N
         /0Y79fw9tpCUHdmRpaZVCH+Vlq2Ch2obcnBVq+fvArfQkcuqU+N6MuB4nHN6hdmu6U63
         hsXCIoZR2xQAh++kSMB89Rg34IZvcyNXi8RXk3VletvnxhwX3jeCTI/lBGrfsbR46CD5
         Y7GrVWwv18he2IPlEPAyQ6zz0TchS199io0xzPSUScfwOZZN+NZiwlhybFsZEwpcCVGz
         /PGX6KqePyc1w2b7Gp3M5VPYLIs/jz9fDzV4ZYwB2ulrW8zbFaAv6p5wWPgMv8VpVr1q
         duMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=fJ2Ae/vdufhtrjHgsvvHcimV/8iioJZZmT29p5C1vVc=;
        b=DcNYnfwD+ltJos6Z7yVdIFdHp6T15HVUUxbcvp749V5Q8EIIcjgDgxzPJ9eBV7wNO0
         GVKZC7ILPMLgnfxI416KveuTpd/Aym0HWwX9pQpih9KffGa4ejJaJN0R6gymIlw4IiJc
         +dJpmxxb5MbBeCwnzhedZ4Jt1U9qQNPqXvqfOECy2BG6rvwp00hR4H4Vjd5uoUiP09xK
         bgIIzrGl8BiemAcGRnhsi4DuPq9BQqP8oN2iw1b7T9T7kevsVgzd8vXN7dz2dMtiD5h3
         hcKYVXYCROLxxB+6e9vHrsfpJCW5EdyJv7nb79GTkb5Twf3u7dV8kLIGvW+jpSkN2JqF
         VQ4Q==
X-Gm-Message-State: AJIora+HdVapZbieC+sy36Uhd2v6aYeQUTCs5tsVSc1qeTCMxY0GWf4+
	bIaHNBSqprEC0Q3V54fUOYc=
X-Google-Smtp-Source: AGRyM1tHQiiqgIMJcDdTnRDgyrfUmGGEi2GEotBvvBvsEtloM94SjEIz0j4ffeK/3QZQogwsMQoZoA==
X-Received: by 2002:ac2:5498:0:b0:48a:86f1:86a5 with SMTP id t24-20020ac25498000000b0048a86f186a5mr7130338lfk.158.1658950744571;
        Wed, 27 Jul 2022 12:39:04 -0700 (PDT)
Message-ID: <8e839472-f49d-a464-34aa-c7b26b9c50de@gmail.com>
Date: Wed, 27 Jul 2022 22:39:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 10/11] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-US
From: Oleksandr <olekstysh@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-11-olekstysh@gmail.com>
 <6e1a842f-e577-0f01-5046-f96c3c75db5b@suse.com>
 <b0f69f8b-d163-f984-e5ec-88a0a158eafc@gmail.com>
In-Reply-To: <b0f69f8b-d163-f984-e5ec-88a0a158eafc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hello Jan


On 27.07.22 20:54, Oleksandr wrote:
>
> On 26.07.22 18:16, Jan Beulich wrote:
>
> Hello Jan
>
>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>> --- a/xen/arch/arm/vpci.c
>>> +++ b/xen/arch/arm/vpci.c
>>> @@ -41,6 +41,16 @@ static int vpci_mmio_read(struct vcpu *v, 
>>> mmio_info_t *info,
>>>       /* data is needed to prevent a pointer cast on 32bit */
>>>       unsigned long data;
>>>   +    /*
>>> +     * For the passed through devices we need to map their virtual 
>>> SBDF
>>> +     * to the physical PCI device being passed through.
>>> +     */
>>> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
>>> +    {
>>> +        *r = ~0ul;
>>> +        return 1;
>>> +    }
>> I'm probably simply lacking specific Arm-side knowledge, but it strikes
>> me as odd that the need for translation would be dependent upon 
>> "bridge".
>
>
> I am afraid I cannot answer immediately.
>
> I will analyze that question and provide an answer later on.


Well, most likely that "valid" bridge pointer here is just used as an 
indicator of hwdom currently, so no need to perform virt->phys 
translation for sbdf.

You can see that domain_vpci_init() passes a valid value for hwdom and 
NULL for other domains when setting up vpci_mmio* callbacks.

Alternatively, I guess we could use "!is_hardware_domain(v->domain)" 
instead of "!bridge" in the first part of that check. Shall I?



-- 
Regards,

Oleksandr Tyshchenko


