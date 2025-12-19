Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B84ECD0138
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 14:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190670.1510998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWabT-0006eN-HZ; Fri, 19 Dec 2025 13:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190670.1510998; Fri, 19 Dec 2025 13:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWabT-0006c6-Eu; Fri, 19 Dec 2025 13:33:07 +0000
Received: by outflank-mailman (input) for mailman id 1190670;
 Fri, 19 Dec 2025 13:33:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWabR-0006bj-Rj
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 13:33:05 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39e040a4-dcdf-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 14:32:55 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-64b7318f1b0so2035305a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 05:32:55 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9ef904bcsm1503161a12.22.2025.12.19.05.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 05:32:54 -0800 (PST)
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
X-Inumbo-ID: 39e040a4-dcdf-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766151175; x=1766755975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIrjMXZ23qqS8ENZsGzyNOOuTYeLxaJvfCF+F6Ut4x8=;
        b=WpRDKZ8PNbLR97JlQjxHAVJsjx+zcwFxg8Hy+toJphieib3eCCnmIfJ+4HBboLDSlv
         Iya/Xr8H3bxsVF7A7YqbteUwGzcNDBIcoSEDBKhiBRp8eFn3c7oTYgZWmffKfZAmc8K2
         Y7Kj44Kn6YGI8I09/9gSDPgBpHif02Uv9indfsrexZ5CurlXX7j7nLIIKXfRyRYrVU/K
         A1novwGue1o/d0UC+kPqn7+GDoXEUxFZxqxBzeBSOJ1rXjFMmYBjsMYKQ1E37ThDay1Y
         kINNo6eJHE06b7a9ULJ2Ru+Khrt4Rl72IRRHGdByIlN0pX0Wov9JOwKZk3OYCIkwYRZA
         lqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766151175; x=1766755975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIrjMXZ23qqS8ENZsGzyNOOuTYeLxaJvfCF+F6Ut4x8=;
        b=SRSUM7Q4+BwTBPzGy6QG8LVm3BPs2+wPh0+KyeK+vKeQ//9Wt5FcKy/xoR/1+ayBMb
         Fv3dzZpD3FWfRmaudX5J0YOy9vHe46HUwCf+vyJ4ts7IO94WG/ButsuSrw1SQIHWPKyS
         StZHz6pNmiv6VcgU74jF54yRto+JIvz9b6L3SRnS8TXmbCKL5uhwoGJJp39RWVBQITu8
         0c6V0V8Nk9v7mHE7dOPrRfDPljfPmhmeFFdxxhzcKQcGq7yPLU3d8XZh25P1UTrwZwv/
         n0E/O+YUxxzw0RowOXRIeLpjQR71U0bp1Mjk1nnY9Z9J4qHdfLoBpsD1SNEHkL9BpPBH
         7ZvA==
X-Forwarded-Encrypted: i=1; AJvYcCVcY0EKpnS/TXqIEl5F+7ritD1pf1jp1lwcyd+FDCRyqGpEvnG8Joiqt9V45TBGf7hTUNIml/n9/TE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy8svYrnMJfeGVfoCBVUqfbgBnobh/4OWzFop8T5xkSx2z3qwS
	Cgs8JBZvV0ZEYgEidkEQ4lYU+NvqH+Zaiwc/NcmHFiOPD/4bc7pQBLWS
X-Gm-Gg: AY/fxX50VfnkfGADn/hmwdhWntqjTU3llqq9IDgww3toEdku1T+ZPCg6SfXmryD8Ai/
	5wMRLLywnJDoiiBTfxZgYLbBGso3vsY8IVPOq7+xNkv8KHPLIfLBu/fz+2GuzqrPQ+nw8AqvSj9
	VYCLKNgI+MXWDwPB5Ix47Lx7GdfUhW2KFBI1H2vHyLhaFSuzu+iclDolmXbHII/sNmBc0qMHp9V
	b7d3oK8jYVnoEeWktyDOjAENpeQCk6SmB2VD/ad4RXc79kldvP54XcO1/WrgFzGJI109To2ddd1
	Zl6Z95cl0BLIsq6RHoalqJmQHq3NvD5tqNDPnDJn7Q6rMAqhhutBWPvsR6C6mNBCLntWWjTAcwU
	o7Bq3gAwgF4ejHe70k1FJsFUOnTnGUQrcf+zjIPmqbi37Nf5r7FiCpP3GNgW94rXhBqKjZiKS/v
	P6Jnx+sElQUHjPSPuXIBririwQpq5IFVDuAoKvtTSkX4YJlc2W/CeVxkMydytKyHhh
X-Google-Smtp-Source: AGHT+IGlLNim9BdtoaVgYWZf2FaQC1MQs9OLFaP+IqoPYVXOMsqP/s3Ib+RJlW9ZVkoa6lJxa+slQg==
X-Received: by 2002:a05:6402:2343:b0:641:3492:723d with SMTP id 4fb4d7f45d1cf-64b8eb73c83mr2856911a12.11.1766151174856;
        Fri, 19 Dec 2025 05:32:54 -0800 (PST)
Message-ID: <290b8d4d-f853-418a-ae01-aea2f62b4f56@gmail.com>
Date: Fri, 19 Dec 2025 14:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <946a1c2cfaf4157074470a653bba5baa8561ebbf.1766053253.git.oleksii.kurochko@gmail.com>
 <ea01af72-c94e-4203-90c4-eaf68174b576@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ea01af72-c94e-4203-90c4-eaf68174b576@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/18/25 7:15 PM, Andrew Cooper wrote:
>>   int vcpu_vgic_free(struct vcpu *v)
>>   {
>> -    xfree(v->arch.vgic.private_irqs);
>> +    xfree(v->arch.vgic->private_irqs);
>> +    xfree(v->arch.vgic);
>> +
>>       return 0;
>>   }
> Free functions should be idempotent.  This was buggy before, even moreso
> now.

Was it really buggy before in terms of idempotent.

It seems like xfree() can handle the case when v->arch.vgic.private_irqs is NULL.
Should I still have:
  if ( v->arch.vgic->private_irqs )
     XFREE(v->arch.vgic->private_irqs);
?

~ Oleksii


