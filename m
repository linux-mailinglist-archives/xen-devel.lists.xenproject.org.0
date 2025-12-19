Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC74CD11F2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 18:23:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190923.1511130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWeBk-0007SV-8g; Fri, 19 Dec 2025 17:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190923.1511130; Fri, 19 Dec 2025 17:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWeBk-0007PQ-5q; Fri, 19 Dec 2025 17:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1190923;
 Fri, 19 Dec 2025 17:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWeBi-0007PK-DX
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 17:22:46 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54fa47aa-dcff-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 18:22:45 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-640a0812658so3274629a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 09:22:45 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b916b3b35sm2743384a12.30.2025.12.19.09.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 09:22:43 -0800 (PST)
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
X-Inumbo-ID: 54fa47aa-dcff-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766164964; x=1766769764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6mZvMyHh0Q/356NIXF4FwU1znnqona4e6GQ+jsYG1Y=;
        b=jpjKXV7DejxcoiCXot4t6YiI2VJPmXxI6Gs4titbsXONQ1wgI5hkqmDNqbMmdz59Fh
         mAf52CEjl1EY8OL7LeMrGwHeSYKvWIus75SAFP+pw3TPqGXonVORR15Ku5rKggoJLCIv
         ITOJr+OErePTs6Zgts9FTp3Ao6b8QRHpo5DrxchSYuu5D/9Tq7BLdCjn3/hnINrpNVID
         LHD12sMX+1a/Z8MC/dKQc7DSVf1maNIyRI+yPa5bcWO5AAetYn9k/kOM1SUSMvvsUwac
         CvT5CHKoFk1lZcQcjjyi40bMJ5K0IaV3wVF7i+Hg9JG0ac1769vZIN1psG55rXJP4d8j
         L7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766164964; x=1766769764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6mZvMyHh0Q/356NIXF4FwU1znnqona4e6GQ+jsYG1Y=;
        b=mR6qtXCDa9/dQVvyx+yDL3p6x1P5oY1Xx708rDNYO0nPfEvWG3FSbrBqHpkrzmbfaY
         NgmeTYqTwPqjWyddXcIZNsmfMZCOWgnoPp5OnL9qTIm77Ja6V1a0y/VVVQ2xkoquHAQ5
         PRpbnd9Qr5si8FeCjgIOwIicm5xG8/ByESNLN/JR0OLI+kaN+Epli2kvqA5h61E+y3ZN
         vOQ3pXhJi1eOGnQdBa6ZYl26QxiDSHEePGjPdcSiB4dplBaaaD5hntyXYqU+CO87Eua2
         SeMBtosYriwTQW1mlCqwRjFWYSkXiWts+F8EDPfN15zLxxfSSiriKeJ17GLJO3kTuAIy
         X5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWB2TnzdOFxvtOJmC73aI+Y7WN5IrTw2By6K+MsKYIp5ePcCjUAYr4Z9ZkpKmyocTobbbeDPG5NafQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yytd2nevyVuWwsiq5H7VlTmCZx+DWfpoUfclDOPGc6a4K9uN3Z6
	WQvxv2t77wHjl2Lp/Y8RZbmhjOopeS+dM51vlZEaUc5nrTr+6Q6I9M3d
X-Gm-Gg: AY/fxX4kuQ2rbf25UJNxjqOHhCGX4xfMqq5Gl90pb4+8sbz/cdBfMqOdps59Zs5+z8Q
	b4OFclvJD9+Dwyvj1/fqygPOrQRIH936kNfA1HYL9rOGowOBMvuNghcxMz51cjokUXVH7Ep7ii7
	KfkIlOj7YPsdr7Oeen53kl8D9b/2GIVjoOYJuM9ELIp0ipm3hNu6Ls3I7PtonCEvrZQHbnxHV2W
	J528cCDxQ+IVpS/g5+N4fvqiEUuXt8prmZgBLt4+om3rMZt6I00nT1al1PsLmjbwXu/KFbfMIbn
	KzGr5jTdW05jhUvzbZ2pNlfQwttAthvlqYtoWU8AhzVShLMqJAMIiLvKybzt+gIrGakE7R1xZnm
	PBUw9KY5kiPxWg360x6IQnEtipgMT87zvSFoSa82TZoqPEZpJjT4AKyB27fkCvBbL0FoGcievqc
	gep7y10urygNQ3p70MaYnmbLUtnsA/J5da2RvHnehBhjvRVcQXM1mfV+etBy1AczKz
X-Google-Smtp-Source: AGHT+IFrfpZDdtIo4g6VhH5xt2thWooj+ZYHd8Ilz0I9RwI53Qcn0IsD9Hwo4ssYL20TuuqAwzNXdg==
X-Received: by 2002:a05:6402:2115:b0:64d:170:79a3 with SMTP id 4fb4d7f45d1cf-64d01707b55mr293997a12.20.1766164964272;
        Fri, 19 Dec 2025 09:22:44 -0800 (PST)
Message-ID: <a52c4214-aed1-445d-91a6-e86546c9a191@gmail.com>
Date: Fri, 19 Dec 2025 18:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8b045139-10dc-4b07-9ef6-d3b9c8b1efbb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/19/25 3:16 PM, Jan Beulich wrote:
> On 19.12.2025 14:32, Oleksii Kurochko wrote:
>> On 12/18/25 7:15 PM, Andrew Cooper wrote:
>>>>    int vcpu_vgic_free(struct vcpu *v)
>>>>    {
>>>> -    xfree(v->arch.vgic.private_irqs);
>>>> +    xfree(v->arch.vgic->private_irqs);
>>>> +    xfree(v->arch.vgic);
>>>> +
>>>>        return 0;
>>>>    }
>>> Free functions should be idempotent.  This was buggy before, even moreso
>>> now.
>> Was it really buggy before in terms of idempotent.
>>
>> It seems like xfree() can handle the case when v->arch.vgic.private_irqs is NULL.
>> Should I still have:
>>    if ( v->arch.vgic->private_irqs )
>>       XFREE(v->arch.vgic->private_irqs);
>> ?
> No, and iirc Andrew also didn't ask for this.

Andrew wrote:
```
Free functions should be idempotent.  This was buggy before, even moreso
now.  It wants to be:

void vcpu_vgic_free(struct vcpu *v)
{
      if ( v->arch.vgic )
      {
          XFREE(v->arch.vgic->private_irqs);
          XFREE(v->arch.vgic);
      }
}

Given the type change, this probably wants splitting out into an earlier
patch.

Given the fact that the single caller doesn't even check the return
value, you're fixing a MISRA violation by making it void.
```

It isn't clear what "This was buggy before" means. In my changes
it will be an issue if vcpu_vgic_free() would be called twice because
without "if ( v->arch.vgic )" we will have NULL pointer dereference
XFREE(v->arch.vgic->private_irqs) here. But considering that before
it was just:
   int vcpu_vgic_free(struct vcpu *v)
   {
	xfree(v->arch.vgic.private_irqs);
	return 0;
   }
In that case, it seems that calling|vcpu_vgic_free()| twice would not cause
anything serious to happen. Am I misunderstanding what was buggy in the original
code, or probably I'm misunderstanding what is idempotent?

~ Oleksii


