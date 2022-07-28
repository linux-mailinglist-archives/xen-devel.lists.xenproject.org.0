Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713B584441
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 18:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376957.610027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH6Tg-0001Bz-1b; Thu, 28 Jul 2022 16:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376957.610027; Thu, 28 Jul 2022 16:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH6Tf-00018w-UL; Thu, 28 Jul 2022 16:35:11 +0000
Received: by outflank-mailman (input) for mailman id 376957;
 Thu, 28 Jul 2022 16:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2Bu=YB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oH6Te-00018q-5j
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 16:35:10 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e5833eb-0e93-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 18:35:08 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id b21so2516857ljk.8
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 09:35:08 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a192d12000000b0048a854462a4sm260629lfj.214.2022.07.28.09.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 09:35:07 -0700 (PDT)
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
X-Inumbo-ID: 3e5833eb-0e93-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Sxv92ZJs3ks/JCHHiU3btXv/lQmsRNCIjFRqW7Zg0uU=;
        b=NsDTTkpilNTsNHxaJ5ktZzVbng13QHkXSXq7A21SNjtYa/yTUQqGdJeALyFe6b4wC1
         G1wyUBntJVhTrwdlPjrfZvl/bAOc4pW3kvXZlzKSsn7FJK6IDDr+4WLwsv6xKN7tQocL
         I77o9CjgL2bK7uPHkgBWyr5dGShf7ejaSwg+jSZFV3N+7b+bjdvxTX32yyDTSKUZmDN3
         X6ZYMeIonmBtRnJi/Anm4O/713SeDkAfTNUbwtImPe6vNVWK5BvTkE/+zcZ9P+a4AAEQ
         BqdSKmag+7otKXSMpXuzuqTwXdAF/Z5vE39DzM4sR7ulzIgdynjbqQeWQjKPvKPzb5yv
         Xwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Sxv92ZJs3ks/JCHHiU3btXv/lQmsRNCIjFRqW7Zg0uU=;
        b=zJG8yZpip/MWvlX+xjlYGllNgaLBN8Xp4lL3gfZIgS/coEzgv6mDc5zF+v6Ty8a72f
         viDKu0iVQWNEgqSA7HRmRRZ7Vqp+ZjlNtbHYqSMXuMeEjNqPpjNZc5nww7rOr3Q/GIav
         TTk3c8aVvxA+LKWEbkzZQfdY+hvsknSFktAqaCmZTYy8UC8DXlVNf2UxqpPQj8XSXTUq
         rF7ejlqiLTV44TDGu8dIPvvPtWud+99ut1JnmbtNLbFm9yvG5Bfgl7XVMp42Vjfzfhw6
         hs3jNNYmY1EyTu2sjkhr8hWmq292MqKjLfwrTTnRGAletwoFzaApgMVc+auvWczBQAQq
         R2zw==
X-Gm-Message-State: AJIora8K069dRSPU24dfcdAuPeC8Lm25lA7ItfRdB8QWgJjMQ9DJwO35
	/z68ctAPfxHlopZMNWjXBUY=
X-Google-Smtp-Source: AGRyM1sRrFF4CxITdzq6DOgcBvvTuOwxJVZXCMo9f4LEuYOSGqPQCwErehECmxNkiBdb1Er43JQ0hw==
X-Received: by 2002:a2e:b945:0:b0:25d:e607:ae27 with SMTP id 5-20020a2eb945000000b0025de607ae27mr9557290ljs.368.1659026108141;
        Thu, 28 Jul 2022 09:35:08 -0700 (PDT)
Message-ID: <3752a158-85a1-e758-36eb-2feb0c5be954@gmail.com>
Date: Thu, 28 Jul 2022 19:35:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 10/11] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-US
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
 <8e839472-f49d-a464-34aa-c7b26b9c50de@gmail.com>
 <cfc6488d-c06e-e943-fc8c-7b12d330f263@suse.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <cfc6488d-c06e-e943-fc8c-7b12d330f263@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 28.07.22 10:15, Jan Beulich wrote:

Hello Jan

> On 27.07.2022 21:39, Oleksandr wrote:
>> On 27.07.22 20:54, Oleksandr wrote:
>>> On 26.07.22 18:16, Jan Beulich wrote:
>>>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>>>> --- a/xen/arch/arm/vpci.c
>>>>> +++ b/xen/arch/arm/vpci.c
>>>>> @@ -41,6 +41,16 @@ static int vpci_mmio_read(struct vcpu *v,
>>>>> mmio_info_t *info,
>>>>>        /* data is needed to prevent a pointer cast on 32bit */
>>>>>        unsigned long data;
>>>>>    +    /*
>>>>> +     * For the passed through devices we need to map their virtual
>>>>> SBDF
>>>>> +     * to the physical PCI device being passed through.
>>>>> +     */
>>>>> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
>>>>> +    {
>>>>> +        *r = ~0ul;
>>>>> +        return 1;
>>>>> +    }
>>>> I'm probably simply lacking specific Arm-side knowledge, but it strikes
>>>> me as odd that the need for translation would be dependent upon
>>>> "bridge".
>>>
>>> I am afraid I cannot answer immediately.
>>>
>>> I will analyze that question and provide an answer later on.
>>
>> Well, most likely that "valid" bridge pointer here is just used as an
>> indicator of hwdom currently, so no need to perform virt->phys
>> translation for sbdf.
>>
>> You can see that domain_vpci_init() passes a valid value for hwdom and
>> NULL for other domains when setting up vpci_mmio* callbacks.
> Oh, I see.
>
>> Alternatively, I guess we could use "!is_hardware_domain(v->domain)"
>> instead of "!bridge" in the first part of that check. Shall I?
> Maybe simply add a comment? Surely checking "bridge" is cheaper than
> using is_hardware_domain(), so I can see the benefit. But the larger
> arm/vpci.c grows, the less obvious the connection will be without a
> comment.


Agree the connection is worth a comment ...



>   (Instead of a comment, an alternative may be a suitable
> assertion, which then documents the connection at the same time, e.g.
> ASSERT(!bridge == !is_hardware_domain(v->domain)). But that won't be
> possible in e.g. vpci_sbdf_from_gpa(), where apparently a similar
> assumption is being made.)


    ... or indeed to put such ASSERT _before_ vpci_sbdf_from_gpa().

This will cover assumption being made in both places.


diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index a9fc5817f9..1d4b1ef39e 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -37,10 +37,24 @@ static int vpci_mmio_read(struct vcpu *v, 
mmio_info_t *info,
                            register_t *r, void *p)
  {
      struct pci_host_bridge *bridge = p;
-    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
      /* data is needed to prevent a pointer cast on 32bit */
      unsigned long data;

+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
+    sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
+    {
+        *r = ~0ul;
+        return 1;
+    }
+
      if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                          1U << info->dabt.size, &data) )
      {
@@ -57,7 +71,18 @@ static int vpci_mmio_write(struct vcpu *v, 
mmio_info_t *info,
                             register_t r, void *p)
  {
      struct pci_host_bridge *bridge = p;
-    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
+
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
+    sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
+        return 1;

      return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                             1U << info->dabt.size, r);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d4601ecf9b..fc2c51dc3e 100644


Any preference here?


Personally, I think that such ASSERT will better explain the connection 
than the comment will do.


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


