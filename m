Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF028B03921
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 10:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042681.1412760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubEP9-0002JL-KF; Mon, 14 Jul 2025 08:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042681.1412760; Mon, 14 Jul 2025 08:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubEP9-0002Gn-HV; Mon, 14 Jul 2025 08:19:19 +0000
Received: by outflank-mailman (input) for mailman id 1042681;
 Mon, 14 Jul 2025 08:11:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdAa=Z3=canonical.com=heinrich.schuchardt@srs-se1.protection.inumbo.net>)
 id 1ubEH8-0001s1-LH
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 08:11:02 +0000
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13ba85df-608a-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 10:11:00 +0200 (CEST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 913D93F691
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 08:10:59 +0000 (UTC)
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-adf58589c90so506588166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 01:10:59 -0700 (PDT)
Received: from [10.27.73.177] ([212.144.242.210])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e90b09sm770592166b.25.2025.07.14.01.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 01:10:57 -0700 (PDT)
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
X-Inumbo-ID: 13ba85df-608a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1752480659;
	bh=nqw+Zq4IYXJ5LysW9CQUZGqMpjh9E9bB5LqggaTSXJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=dN4DmX0DLUqKv1ro/VkcSZ9jYhJ4VpK4hCWo8mLw6Yq8lstvkdGZWF9rB/FkGpDuU
	 FJdfSeqKPPn8QpEgthzmHd41uHYNzPxUIU8uQMTYY60XglXSwhWVc2lPh6vnfByPIV
	 15oA/0Fhq1M6ikg/3OxqGcS+Ad1UBqnbJEWYRaHZMYgbH1y5SDfxnYr+2Ene5K01WT
	 bH6InG3dqPrvkN+k6MeDA5kfZaHtX23f0iM3d4EjYzfCzkFWoH7Y3QNcle5G6iu3//
	 rkxCBIig0HlKpyEmI/ovydri/zyYQLxzm9ZYDOKdSp1QUoZc32HMmFrwL7KPssGgAx
	 zThu4L+n/ySoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752480659; x=1753085459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqw+Zq4IYXJ5LysW9CQUZGqMpjh9E9bB5LqggaTSXJc=;
        b=MVeeieDTRXKvzCE9fLCj8fK34D/ixvTa45XTxyJkgzQeXZ5Bjh4u8NHJwF5Y8DWPkw
         3j0xUOUntemLhG9yV05hz9fASdyR0pnDogP4DBN9uHbzbg13jEm6PalzjCxDJ1gDyWF9
         jlYbzZtX/iD/4kzPL0RHFOhw6B67dU18Rh2zpb2F+f6EtCifrw4TXm0jVhwS2/SIhxbY
         MTu2vfBOex9wmARNCMzZjx5KcRvmvlrzmhkdtOsz7TRRgmBF4u3TRHylFFx84WctXFsm
         lEIELp1/Gd6bnfTmO+keBrM0RFkBMiq2b+IsICxi9OXPTbsyoCkF8S9tQ4mBtXU0cKlr
         +Dag==
X-Forwarded-Encrypted: i=1; AJvYcCWkEibbKUt23WFCv8YOxJAvziYm0DAe2nIEqygXiNhWR7vpfojmDLfePlGZdov5xky16OepNYpo1QI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSqUaArB1LjJxIysdOPB2ymHwP4GJ1utQ0vmlDg+2IahCVlTny
	5N/k30IO4aOkttnyx3zEKRc8heee4HJICmwvRkJJICd4x8ZWEVgk+coBtk/PhPTb06zGe34Fes0
	yhTfUYuqk5M2IX/s9HDVR328h9OA95z0uKy1u6+MU99K3veZCqdq8fgKojnfBCIHbJDDwIQp2fv
	rEar43/E6l
X-Gm-Gg: ASbGncsZYIgUc43OR0FDktw1TaNSh9XtoJdgf2VZJ/IedbvqO3Yh6GVpc8jVqhJ+Dl8
	M8U9RhGw9t8BhcQL/oBr3xwSUDHnAk9lZI2JU8jSGm7pH5HFR+Y5HtL7lOGqZGs6X3sxvoPkmyA
	+8eYagJiF+NsI3Km6jjWY9QIOq8kH9tzB22jiVe5OlOaIZ7iFMm4NO/9pi2DF2wC23I4ZcpnVfu
	h6rFYY31kpzCZG6hts7wLSn774V/G3Vwo2rXIvwm6cSJDTCOYyQGCRuzmFr8yFj6ea7mpcBFMAn
	3AyrtMe8+Lm8tuTyD2QsY7tqUpkU533pwuML8iwW/l+nJW/9nDmd1+MzA8JA8o8=
X-Received: by 2002:a17:907:9450:b0:ad8:adf3:7d6d with SMTP id a640c23a62f3a-ae6fb8a57eemr1155262166b.21.1752480658903;
        Mon, 14 Jul 2025 01:10:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVNG4cGhbgl6DZuAszmrlgOEZ5D4CwRcSMPsKcvD43UnpSt6BkYsm9BCpJ8sMqD6XmPCotBg==
X-Received: by 2002:a17:907:9450:b0:ad8:adf3:7d6d with SMTP id a640c23a62f3a-ae6fb8a57eemr1155257866b.21.1752480658379;
        Mon, 14 Jul 2025 01:10:58 -0700 (PDT)
Message-ID: <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
Date: Mon, 14 Jul 2025 10:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Bibo Mao <maobibo@loongson.cn>,
 linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250714060843.4029171-5-ardb+git@google.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/25 08:08, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Using EFI runtime services to program the RTC to wake up the system is
> supported in theory, but rarely works in practice. Fortunately, this
> functionality is rarely [if ever] used to begin with so we can just drop
> it. (Note that the EFI rtc driver is not used by x86, which programs the
> CMOS rtc directly)

The main problem I see with firmware offering access to the RTC via UEFI 
services is that two different drivers, the firmware one and the Linux 
one might be trying to access the same busses or registers which might 
lead to unexpected results.

Recently there was a discussion in the RISC-V technical group for the 
server platform specification where the same issue was discussed 
concerning SetTime().

As a UEFI firmware should not care which operating system is booted, it 
should be up to the OS to disable EFI access to the RTC if it has native 
access.

Could we disable all the EFI services for the RTC in Linux dynamically 
when an RTC driver is successfully probed?

Best regards

Heinrich

> 
> The same applies to GetNextHighMonoCount(), which, if implemented,
> usually relies on SetVariable() under the hood *, which is often not
> supported at runtime by non-x86 platforms. But it has no known users
> either so let's drop support for it as well.
> 
> This means we need to drop the slightly pointless tests for it too.
> 
> * EDK2 based EFI implementations usually have a MTC variable carrying
>    the monotonic counter variable, which is therefore not truly
>    monotonic, given that SetVariable() will happily overwrite it.
> 
> Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Cc: Feng Tang <feng.tang@linux.alibaba.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: Sunil V L <sunilvl@ventanamicro.com>
> Cc: Bibo Mao <maobibo@loongson.cn>
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-efi@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: x86@kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: loongarch@lists.linux.dev
> 
> Ard Biesheuvel (3):
>    efi-rtc: Remove wakeup functionality
>    efi/test: Don't bother pseudo-testing unused EFI services
>    efi: Remove support for pointless, unused EFI services
> 
>   arch/x86/platform/efi/efi_64.c          |  22 ----
>   drivers/firmware/efi/runtime-wrappers.c |  68 ------------
>   drivers/firmware/efi/test/efi_test.c    | 108 +-------------------
>   drivers/rtc/rtc-efi.c                   |  76 +-------------
>   drivers/xen/efi.c                       |  56 ----------
>   include/linux/efi.h                     |   6 --
>   6 files changed, 4 insertions(+), 332 deletions(-)
> 


