Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CFFAC05FA
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993071.1376523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0YM-0003X4-RH; Thu, 22 May 2025 07:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993071.1376523; Thu, 22 May 2025 07:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0YM-0003VC-OC; Thu, 22 May 2025 07:41:22 +0000
Received: by outflank-mailman (input) for mailman id 993071;
 Thu, 22 May 2025 07:41:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI0YL-0003Ri-1y
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:41:21 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 263cb3e7-36e0-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:41:19 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-601dfef6a8dso7364949a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:41:19 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad5572f6428sm787415366b.185.2025.05.22.00.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:41:18 -0700 (PDT)
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
X-Inumbo-ID: 263cb3e7-36e0-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747899678; x=1748504478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D1GjXYXB99+XfHp9l4xA/pYZT59fXSGf+SsASpoYDTo=;
        b=HCPL45pyvE7lcVGw8AF7GWTpaVGmkPaWu+ohGFGxNaTghH46oSnpme5xlMY3o9mJeT
         e8N3S1kTE4VhjH8AJcrbcOGBypEFO+15RuW18lSLppMWT0blWzj+27/iPrvP3MkgsAwC
         HKVpJ/sIDPf0zaU1Djg11mGmMiVBkcnAuv6Roi7JOkywB3vn4YhF9WUDn179ce/sUcT6
         QTmkwNJSi/9pAiNNYYJ+awHtNu7k6+V6w8kcHRkPpNns9nsqi3ALwg7lCVafvUaSZY9a
         4LquKnWBkTYmzvbMArlwPdfXkptW7Dfam7YLVVTo/iRox2jwcLYsvpbdOv3Pv0L3FXcH
         7Tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747899678; x=1748504478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1GjXYXB99+XfHp9l4xA/pYZT59fXSGf+SsASpoYDTo=;
        b=szuYhVY9uUT4SNlr1U6Z9yacsYEoYVl3J4e2LJXs0HnB8/n4b+9ZUn2gyFcJuWH3/p
         8rJ+VIfeVy56ximqtAzFUkN3GmkjFpgwG0mcUddX3o/kVoZNmjzz8F8azlXUTkm3/2Kl
         9a7atdgDvrHjTkzIHQN5TJlHihIB/zeRccCW+r/NtvnWarW55r1vEqWPx/4k8gFRQyYt
         8vfAoVahfUMUE+ah6J8E0IuEy5i692lPsyWZlfSD/RUTU0+eZD9oCikSKfWo6NYIpxG0
         4PYRWaltfs73Oy9zhJN1dhg22mGhwMA0b95BjmYyqDibqxUYl5jLSAKzDyha+jeYYs60
         5DXA==
X-Forwarded-Encrypted: i=1; AJvYcCWWY3eQAY69ZNeICOEvxVHxYX5KUDNhg6Q/ed9laQ+Ekkaw76CXauig1SnJj4JkZ5YE9gjoLqnC+5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqX4iqnDRaW116UEIUVWU//oNobNmD/oRneEQ5DjZOokBcmCzJ
	z0qwf+vxTiD4wgFRptBPkL2Ri69/OH9HC4OMJ5e/pWSb5ltTDBRCCsc8Z6r7kIhWmg==
X-Gm-Gg: ASbGncsyi+zjgZsOgrgwGeZUDsh4N9U07DG6rR1Mni4j7Oh5sTrcn0KEsQcVkSH8Ymy
	Mknm5pvMdwF9/kjI+9XX5HgRlA2kCXkqJCL8XwRNyWt+zDYnBbsAhoPFuj6xPhUxr1d9H8Zf+Yb
	dqFCA5H5Ln7+vf1CnJPTkODDFTV0U5v2hvEQH6Iw/Erz08+ccieMZSRzZHwmqeEfVX4SucGQnWr
	GCtHuTzlpfmOfkPYmEmeG820O4Qae+qXsogeGfpD9W8mofufnXCnHuKeNnkbGaDP82YI78UWKUl
	cBxI1pvK0JtIC+qHdS3eKlpBUHOX/gcidRvEmeCDieWddSI/D2Ld845psaBz4A==
X-Google-Smtp-Source: AGHT+IHVCAM7O8NretBqnbWBNfVEQEG36Z4iCgxPrIT/mT41LLcYi0go2ee3PLhHRQ6vlNOweHJOXQ==
X-Received: by 2002:a17:907:6eaa:b0:ad2:4b33:ae70 with SMTP id a640c23a62f3a-ad52d55a3d8mr2313642066b.31.1747899678621;
        Thu, 22 May 2025 00:41:18 -0700 (PDT)
Message-ID: <62a084d9-5ee2-48b5-b017-3612c7116f4e@suse.com>
Date: Thu, 22 May 2025 09:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] xen/riscv: introduce platform_get_irq()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <1729279a0ab39e2a2f09e475c2eb48fefd4aef54.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1729279a0ab39e2a2f09e475c2eb48fefd4aef54.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> platform_get_irq() recieves information about device's irq ( type
> and irq number ) from device tree node and using this information
> update irq descriptor in irq_desc[] array.
> 
> Introduce dt_irq_xlate and initialize with aplic_irq_xlate() as
> it is used by dt_device_get_irq() which is called by
> platform_get_irq().
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


