Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C813BAC05E6
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993065.1376513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0W6-0001ej-Fp; Thu, 22 May 2025 07:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993065.1376513; Thu, 22 May 2025 07:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0W6-0001cV-D3; Thu, 22 May 2025 07:39:02 +0000
Received: by outflank-mailman (input) for mailman id 993065;
 Thu, 22 May 2025 07:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI0W4-0001cP-UH
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:39:00 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3481a45-36df-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 09:39:00 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso1297419866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:38:59 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04aed7sm1037687966b.9.2025.05.22.00.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:38:59 -0700 (PDT)
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
X-Inumbo-ID: d3481a45-36df-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747899539; x=1748504339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7YO7CMJfci6zs46H5NMTwaTIOU7pUi3zDYyjePlu7xc=;
        b=UhBAKQM706Je6foONDPANoyBuni+WAKGITbzyb4kHQJ4b9jlu2YGS+T11r52kh0tyQ
         kEHY8ze0U0Bnr9SBPMKQrdGBhWhPgpgSlw+5a4vnPYNfzmPwmfPj85lLW8xhjkWf4WGJ
         o4AEZ99VIUHkGD2+/AuD8Hrijex8DaLJqoUJieZ5Zo5fjfb+gXXx45ZtxLNEI2WjhzNU
         XNFk1aikKnYZSaeje8xotiVmphGZTy112FnThJSp3rXNPJVHqRMIxWHzKsN3roaw4pCH
         i3/L+Ae80HgxVwXS/Xwha0Dob/J9cGmG4MvkfIihtOqnAIJpjHQ2ckmpBGxoHM5i6wwG
         VVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747899539; x=1748504339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7YO7CMJfci6zs46H5NMTwaTIOU7pUi3zDYyjePlu7xc=;
        b=MX+y4eCOxMhDgr3oGB3dEpR0c8drbKXsScuo8mbUcHsJAE7p+E3jUrAxuBP3khZ2aA
         OQLo6gqN+0xUoNheiqmHv4vamfhDLLwMsQcQWQA9pCDN2l/3T42xLlxnNWG2EJelLuTu
         eP0N/I3Qf54mVMK7/0UuUSDHBYutHTOY3kE6aQ/bhTfSXo2ly3baWPIzP+uLWpVBjsiS
         qYULmXJLI8cNhk5T4+x7964udGQlY7zl4oMOiBwzREGaOghEqPCbzxrtfSaK+wiIdmXt
         Gn6K2DEcmoG2Vj/Awd64BYSXqOaq13cSCWPPgNjtWSyEwrJY8e5nHMvDBAVUu/90GfSx
         SoZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjRNBSRibDB+msMXYvuxy2bsfxyeDT9JgnZHUddOkyyg/Rhun886pvcFsBQVR4HPZmaZI1n7JsT4Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzh7f3M+yY74xSEnoPA9IrxVwLLWaJ1mzo75MvIqHF35oLnZgji
	cVGzdWIMBxnjDpIL7ulH4ssBPAiGglcgq3bfbqUgePzgvxW88VV1oPizijgN3DPwYQ==
X-Gm-Gg: ASbGncvNxQt4yz53Y78xRB6xnlchOrXvdPS7YA6KCviElBves182bMihrsNe9HSms1S
	PN18+EPGlr3HEnIAABY4E8OnH+JsZ9fE0zCVFo89EzsRr5/vF8JEpqNA14P8EbtOhCFOXVEw9NY
	cWrmt6n3XqcrAK+IZxyaE1o6CIv/+4dnLiqABLv2lGzGzBMit4y0kFId6l+OAhku1x0YYXnAWbC
	Jpg9kY0h2FIG0U0dDdiHse9Jou3DH1WWMvXKHCz12pQb0RqBjep6YAa0k91R8APot3pTdrzK1KG
	XmACtyoyS2Qvljy44oWBXkhGq+m2wclwFLYdAlTaxiUy3hiLoJQvtLoBaa4o9w==
X-Google-Smtp-Source: AGHT+IEt34VVbAATpDDkGmTk7jsEbds5xedraMlMI/OPBkqS8aNHnu7C/+v9GdsBLRqsJH0m5lvEbg==
X-Received: by 2002:a17:907:728e:b0:ad5:5198:b2ad with SMTP id a640c23a62f3a-ad55198bc52mr1800810766b.48.1747899539430;
        Thu, 22 May 2025 00:38:59 -0700 (PDT)
Message-ID: <9d16d731-c578-480b-a2ec-8761d28aed48@suse.com>
Date: Thu, 22 May 2025 09:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] xen/riscv: introduce init_IRQ()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <3f86f284ebccff9de877844f33c4588ac5631906.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3f86f284ebccff9de877844f33c4588ac5631906.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> Implement init_IRQ() to initalize various IRQs.
> 
> Currently, this function initializes the irq_desc[] array,
> which stores IRQ descriptors containing various information
> about each IRQ, such as the type of hardware handling, whether
> the IRQ is disabled, etc.
> The initialization is basic at this point and includes setting
> IRQ_TYPE_INVALID as the IRQ type, assigning the IRQ number ( which
> is just a consequent index of irq_desc[] array ) to
> desc->irq.
> 
> Additionally, the function init_irq_data() is introduced to
> initialize the IRQ descriptors for all IRQs in the system.
> 
> Reuse defines of IRQ_TYPE_* from asm-generic/irq-dt.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
>  - Add an explanatory comment about NR_IRQS definitions.
>  - Init desc->irq and desc->action before call of init_one_irq_desc().
>  - Drop "desc->action = NULL" as irq_desc[] is zero-initialized.

Just to mention: This is odd to read, as it partially invalidates the
earlier bullet point.

>  - Update the commit message: drop mention of NULLing of desc->action.

Again only for the future: Adjusting the description to match changes
being made is the expected thing (and hence doesn't need mentioning
separately, in the common case at least).

Jan

