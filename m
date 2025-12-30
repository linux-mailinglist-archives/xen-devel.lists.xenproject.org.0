Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C440CEA20F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 17:04:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194373.1512775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vacCe-0005LP-8n; Tue, 30 Dec 2025 16:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194373.1512775; Tue, 30 Dec 2025 16:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vacCe-0005Jk-5b; Tue, 30 Dec 2025 16:04:08 +0000
Received: by outflank-mailman (input) for mailman id 1194373;
 Tue, 30 Dec 2025 16:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKsM=7E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vacCc-0005Je-Gb
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 16:04:06 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2995876d-e599-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 17:04:04 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b832522b47cso556724166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 08:04:04 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0cea9sm3624154066b.50.2025.12.30.08.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 08:04:02 -0800 (PST)
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
X-Inumbo-ID: 2995876d-e599-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767110643; x=1767715443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fnhyMCr8T/iszehS58YhFGhLWSLr/RAMi197kNxHSnE=;
        b=NhwJPoCYrhTLz9tKLcL54kcndCPPxR/v8lRlD24XqMFxp1pr3FupfMdaK0BBwuMaIW
         ERfaVHGUPiABYxQ83O2M8pCtQ88kM0vAjVmxpg21+/ONcI9mkuBvnUVXRDZOB70PBXH5
         2Vh8jiOXbgEnW3ZhOWBpXT6lWWLKn2r4vju8Lvghi/YFgZn1McnNoRyyxSCMaywj48q0
         DvprPzjIH2cEf2892cYS2s0ZFdof8/pOh3NbPi6PUOVDJlBRrjKqxd5GR0WNBz7hSL40
         JsTn4PBWXZSecluPI74C0fwgmM/ka0zf4MKykT5mpBqSteT05o9FShMjakaLZKjHxqfz
         fPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767110643; x=1767715443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnhyMCr8T/iszehS58YhFGhLWSLr/RAMi197kNxHSnE=;
        b=E61bE5ff3nU8UCh2Nxhg/DTJvJvmdxsDvbAGYnVUfgaXpDZcP2zzRK9cBjBFQB1HC+
         VwGMFpOkYxXaA2bGMZvKwFDv0mntvdiPHRbGVX1BxEngboeUC4qM12cKJiTW+/KMSi4r
         jxqOz2r+8oQvNL2JTLUrh46SoUXRaurozUPyoTSPeQH59tiXi7FKL+bOKkEmME5oaB5D
         zYEyfNSRrqQh/N+KifFCeSzN7Dh1ucAoW4DPBe9atm5KS68lohN/2Cj5P18tJ5iI4ouL
         7zMd7WHJgR/78ZjY7PtpO7HD3TNkddGu71Btg9Hg6EeYOUEpIwQHDqC/RgstSvUnemgN
         8i6w==
X-Forwarded-Encrypted: i=1; AJvYcCXiQFMO/jbltY3BqRZH2aCXqiEAON+sxmFA78bQCyVgmAchivBn5Gz5QhqKjJXGmykmFd9PeSCxFpw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySkLR0YL1EX6zM14mqmtlUc9zt54uCXmpk0bAKRnWnJJweVhsR
	Y6yqTYmZr0Q+MpKPKjSGQU5BOPPWio/9crLFU4+QXFjN9RF6wLaqSDaUzg0s/A==
X-Gm-Gg: AY/fxX4JG+t1MWCqSoMif9chq9HTgobrb5BuKQRMah2B9bJH76lUWbWfrHIhCQ2H209
	TUPMTKkPOLDkRZGNbgTXv5fqCdJp/Iz1eXwwRkDU/kcw434Y4Fv1Ncex384POOOmBdN3Db8rlDg
	74osOKzqMvdeHLixniNW71ssnNQds6CeAWQqOIitT7xl9ZwidtpqGENozAe3esxB0kTBOdmSpTI
	bgH78lxbLlHDiowUsXWP76++LPUHQB87emW7j34ZRDx1WrANmeJbwvgFE5tfmxzgziyKtK4wiXT
	QfGptgAcxm+VvE1OSzviOICQrC9ezMSJtK7XqaYdITJLdxZHnchzVr0fBezjIuoANcH5j+OFjRc
	bg+d9WKeo7dHHXnJjhBkkP4XMp116RDlRvvQVoJ0803uNcxfWLuPtNtpA2l7up+JIMxNGsG/cpz
	EUo2Hi+VqUkx3sWmuQOpQSs4su7aM2dZ9Z0DrNxP0secdrBIaD+M+rcHoWn6u/SY8=
X-Google-Smtp-Source: AGHT+IErZpa+22bSz0+RlmLdzxxrIJqmj+e6rRQzrAD4CptdPmXHu8b4Ylvwh59XnT1ERFd9PacfGg==
X-Received: by 2002:a17:907:724e:b0:b6d:5bc3:e158 with SMTP id a640c23a62f3a-b8036f2ac34mr3630100566b.17.1767110643229;
        Tue, 30 Dec 2025 08:04:03 -0800 (PST)
Message-ID: <3ffe9668-84c6-4866-9833-20b5748bf339@gmail.com>
Date: Tue, 30 Dec 2025 17:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/arm: optimize the size of struct vcpu
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
 <0756ee97dd47f6acdefe593694b743eb6bfefacb.1766504313.git.oleksii.kurochko@gmail.com>
 <9f2c9e4a-64e3-4e5e-b5da-976ab433f6cd@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9f2c9e4a-64e3-4e5e-b5da-976ab433f6cd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/29/25 12:08 PM, Orzel, Michal wrote:
>
> On 23/12/2025 18:01, Oleksii Kurochko wrote:
>> When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
>> exceeds one page, which requires allocating two pages and led to the
>> introduction of MAX_PAGES_PER_VCPU.
>>
>> To remove the need for MAX_PAGES_PER_VCPU in a follow-up patch, the vgic
>> member of NEW_VGIC's struct vgic_vcpu member private_irq is changed to a
> s/vgic_vcpu/vgic_cpu/
> s/private_irq/private_irqs/
>
>> pointer to struct vgic_irq.
>> As a result, the size of struct vcpu for Arm64 is reduced to 2176 bytes,
>> compared to 3840 bytes (without these changes and with CONFIG_ARM_64=y)
>> and 4736 bytes (without these changes and with both CONFIG_ARM_64=y and
>> CONFIG_NEW_VGIC=y).
> You only touch new vGIC, so there should be no size reduction without it but the
> paragraph reads as if the change affected both old and new vGIC. Also I would
> mention that probably you provided the numbers based on a defconfig target.

   Yes, all the numbers are provided based on defconfig target.
   I will update this paragraph in the following way to be more clear:
   As a result, the size of struct vcpu for Arm64 is reduced to 2176 bytes
   in the case when CONFIG_ARM_64=y and CONFIG_NEW_VGIC=y, compared to 3840
   bytes (without these changes and with CONFIG_ARM_64=y) and 4736 bytes
   (without these changes and with both CONFIG_ARM_64=y and CONFIG_NEW_VGIC=y).
   Note that all numbers are based on defconfig with the mentioned options
   enabled or disabled as specified.

>
>> Since the private_irqs member is now a pointer, vcpu_vgic_init() and
>> vcpu_vgic_free() are updated to allocate and free private_irqs instance.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Other than that:
> Acked-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

~ Oleksii


