Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D0BCD123A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 18:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190933.1511138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWeFQ-0007ya-N0; Fri, 19 Dec 2025 17:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190933.1511138; Fri, 19 Dec 2025 17:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWeFQ-0007vk-KN; Fri, 19 Dec 2025 17:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1190933;
 Fri, 19 Dec 2025 17:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWeFP-0007vZ-7q
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 17:26:35 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcfc8032-dcff-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 18:26:33 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b804646c718so57548066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 09:26:33 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a5bdb9sm287326766b.7.2025.12.19.09.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 09:26:31 -0800 (PST)
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
X-Inumbo-ID: dcfc8032-dcff-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766165192; x=1766769992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G715qPXc02lworJrrOeiaZA2ZTbc4mrPnR8/Vas9IF4=;
        b=Ns75pEJ+Fn1LVNjc0scQiGEkrX78wateZgSYld3j+1Z0GRxmm3FtVdIoyn365M3JZ6
         vfc6kd3W3P/iw9DHcx9ZoV+HFp7zrttquPvcS+PbVcwYbcTXSz+psKfRusXb9uAhNOPi
         45j6RBHYr+7GMOY8wHK1H23udkXOhnyoZ5dJ/kVPN+HJ27DU0tkxk50cKIk8NKsJeT/e
         T1rSCD7mqeuprqVG6K2a+h5uyuXSGIyPfYPAmFYqLPzJ9FUvs3NuuG8rzeWGBY68sVlX
         sXvYw5uSg0OEzyGWWW5cpZFdlbi2g8RLm8wz3dFYQ3yoCN6o7OagEFYco03e5AEUlHfK
         YYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766165192; x=1766769992;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G715qPXc02lworJrrOeiaZA2ZTbc4mrPnR8/Vas9IF4=;
        b=GMqYMX+Mp9p890ZPHGcz8gQzjcgdujNNccBoT5XeCzhf26Ylh1SjJkTgS1oeYHFnoq
         1cHbyc+OHSlkV5TZB4Ct5MgXzFU0oDYoWE+pVXmPRUy8bwYuya3Jr3nzNIv7fXqcuoUi
         JIRZyYcseSwUg37aBqpiiDVQShPbmaetTaJYRwWecyxiNXOoHt6lrw9VJPlNq11+lYXa
         wtx26Yj/20RIF1ZFm1A4jpgU+xotg0KsdbdXEp/xgCrRIAIa7JnLNndHOgT7ajd8br2+
         Uiynj8Cw/nJWzrI1BfyyczqhBQlRiYtciTZgzQojlJAIfpMeuuE0YglblIbjSO1WbnZ7
         qbXg==
X-Forwarded-Encrypted: i=1; AJvYcCUbUTbUTWpX0QoAxuDK5q9Z1nV7RI9Q34KmnhRsHQ97xc8VVdBtOV5MSls2V1F/dYs9VxyiXscWZUg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyh0NeTbZlNfkthb3eiaT4oepKGQ+bJus1arhypglQEgbtzPjJ/
	1tuMbtHZl5QSANbWzxPq/tbXsZ77ka3BcT8UKBkmeRyu3H2FLC74KBX2
X-Gm-Gg: AY/fxX68ghLb3EHqH1R7dSMujmzDQmgiTwhrfBn1nE50IsTGJIA2sG4gVd3mvb752mt
	tSA1e1o+JWr804bZml6Z65KYEVX/5dLCud/OUH6Xvjnr0msvQC3/47yoFgd9zEdGUAJX9mx8sKM
	mPdcd8SWIyvilONaP1eJldZ64pPR94ZD8l9b2XiKHlKsFN79q5828qbASqX/WcKBVKyZSXKQJHG
	sJFLAy350jwzKj4OYyW7pJdCwB26E5s+D6V7foa6pfrX+TT7iJVtG2i8pBgaII8kBkruIPqidxN
	UTsISE14jystHIaqFloyMaRtotQLwLO55z8Dnh19WXgPn8ASJAriHsSsZjbR+7k2kCM3Opsx6Jb
	zgDElsIrwegLPBDOiuESy6IT9HvLw+KtBUgsyrEyXlsolUHwEDiTmoRdAGtUxb5b+D/IL+gnxb8
	zt71CFO7Mn1JNh8jAOgP/PC7q1FTEfYQQBq+XkIkb3WsK+iznVGtBmRzZvI0+IpWYubovD0fExc
	yA=
X-Google-Smtp-Source: AGHT+IEq2e9FfntHEIOFopDYQcgfmuIRslN/l+D8XYl32jqtH5s6dtTXGr4I+6OjVEkcySphRJovvg==
X-Received: by 2002:a17:907:7f0d:b0:b73:301c:b158 with SMTP id a640c23a62f3a-b8036ecdbf1mr311172466b.6.1766165192279;
        Fri, 19 Dec 2025 09:26:32 -0800 (PST)
Message-ID: <63d82b7c-5e6e-4ea4-91a7-39f81b6065bb@gmail.com>
Date: Fri, 19 Dec 2025 18:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <946a1c2cfaf4157074470a653bba5baa8561ebbf.1766053253.git.oleksii.kurochko@gmail.com>
 <ea01af72-c94e-4203-90c4-eaf68174b576@citrix.com>
 <290b8d4d-f853-418a-ae01-aea2f62b4f56@gmail.com>
 <8b045139-10dc-4b07-9ef6-d3b9c8b1efbb@suse.com>
 <a52c4214-aed1-445d-91a6-e86546c9a191@gmail.com>
Content-Language: en-US
In-Reply-To: <a52c4214-aed1-445d-91a6-e86546c9a191@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/19/25 6:22 PM, Oleksii Kurochko wrote:
>
> On 12/19/25 3:16 PM, Jan Beulich wrote:
>> On 19.12.2025 14:32, Oleksii Kurochko wrote:
>>> On 12/18/25 7:15 PM, Andrew Cooper wrote:
>>>>>    int vcpu_vgic_free(struct vcpu *v)
>>>>>    {
>>>>> -    xfree(v->arch.vgic.private_irqs);
>>>>> +    xfree(v->arch.vgic->private_irqs);
>>>>> +    xfree(v->arch.vgic);
>>>>> +
>>>>>        return 0;
>>>>>    }
>>>> Free functions should be idempotent.  This was buggy before, even 
>>>> moreso
>>>> now.
>>> Was it really buggy before in terms of idempotent.
>>>
>>> It seems like xfree() can handle the case when 
>>> v->arch.vgic.private_irqs is NULL.
>>> Should I still have:
>>>    if ( v->arch.vgic->private_irqs )
>>>       XFREE(v->arch.vgic->private_irqs);
>>> ?
>> No, and iirc Andrew also didn't ask for this.
>
> Andrew wrote:
> ```
> Free functions should be idempotent.  This was buggy before, even moreso
> now.  It wants to be:
>
> void vcpu_vgic_free(struct vcpu *v)
> {
>      if ( v->arch.vgic )
>      {
>          XFREE(v->arch.vgic->private_irqs);
>          XFREE(v->arch.vgic);
>      }
> }
>
> Given the type change, this probably wants splitting out into an earlier
> patch.
>
> Given the fact that the single caller doesn't even check the return
> value, you're fixing a MISRA violation by making it void.
> ```
>
> It isn't clear what "This was buggy before" means. In my changes
> it will be an issue if vcpu_vgic_free() would be called twice because
> without "if ( v->arch.vgic )" we will have NULL pointer dereference
> XFREE(v->arch.vgic->private_irqs) here. But considering that before
> it was just:
>   int vcpu_vgic_free(struct vcpu *v)
>   {
>     xfree(v->arch.vgic.private_irqs);
>     return 0;
>   }
> In that case, it seems that calling|vcpu_vgic_free()| twice would not 
> cause
> anything serious to happen. Am I misunderstanding what was buggy in 
> the original
> code, or probably I'm misunderstanding what is idempotent?

Oh, it is about that xfree() doesn't set private_irqs pointer to NULL. I thought it is
doing that inside xfree().

~ Oleksii


