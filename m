Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAE18A4CE8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 12:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706024.1103028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJuZ-0006Nd-RO; Mon, 15 Apr 2024 10:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706024.1103028; Mon, 15 Apr 2024 10:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJuZ-0006LN-O8; Mon, 15 Apr 2024 10:50:07 +0000
Received: by outflank-mailman (input) for mailman id 706024;
 Mon, 15 Apr 2024 10:50:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQk4=LU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwJuY-0006GD-Cv
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 10:50:06 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb1a5515-fb15-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 12:50:05 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34782453ffdso1303008f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 03:50:05 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b11-20020adfe30b000000b0034625392416sm11756374wrj.104.2024.04.15.03.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 03:50:04 -0700 (PDT)
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
X-Inumbo-ID: eb1a5515-fb15-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713178205; x=1713783005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jQMNBbQUvDny+CND0VAHwcaY84vHHkZUcJ4xu5OgeYY=;
        b=YqdQFJqrHG5eGrAAahGSP5AdwOXv6ON68c4QMs0Yose45ZDgc/xMAgPNfrW+TK7xyx
         GsUhj1gpPZbX1bXKR6yQiGra0OAlSt4rjGki3VoVsBzFkuHYCeSa/fro+45qotWFV5e3
         kBDSUOqu4TUg+CM1ANyKOBsJfHndHwVejXj34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713178205; x=1713783005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQMNBbQUvDny+CND0VAHwcaY84vHHkZUcJ4xu5OgeYY=;
        b=Zrwc2MJBA5BbuDcvgIOw+HUzf1K26xNNT0HofKW5VtRKXoZLblIy10edV50BA++eT/
         N0Zm0+NyJhcu4hIM8hjHVgYnMKrJqxs0zXc/ZQRW/mHgy42nSrWGvTpAze34tln99mLH
         9ZkbJTC+jkUgDMeragJ6M5Vj8nGTCOP40NWRZDg4Lx8T67uR4gvKTxc2FbNPEUVtr/qr
         j3jZuWPwb5CVuowcBe4MZesWVPxyAuUdY+BcmQEEz4ML/BlYKd+vbfBxKklY/mBxuA8P
         h9EgIgpTGECX+NcvFP6dhhSVi4KWQouAMP+bBu8YqACDTkphHsuOu6sNs+KdHgWOQ7T5
         fQcw==
X-Gm-Message-State: AOJu0Yw1jr73RP1T93n5DuXYvDjq2ZiO0UuqaR6KBDNI9ozXPYQXVjSL
	Gk7GvGnXytpKeXdKlENEDE1ImP9MD1hp8gxhXAIf7a7lQyk+TeNiBWjdi1CwpEw=
X-Google-Smtp-Source: AGHT+IEb71ZvDCLOyKFfOkEDVcGgGBoUDxU8PC+zUAcWzPMcUoHh8Lp7CUdj6Ij8Ueyp/Rr3qiwzjw==
X-Received: by 2002:adf:f80d:0:b0:346:bc1b:4e7c with SMTP id s13-20020adff80d000000b00346bc1b4e7cmr7723055wrp.35.1713178204577;
        Mon, 15 Apr 2024 03:50:04 -0700 (PDT)
Message-ID: <69dcd768-74b8-4033-8ab3-77848d6774dc@citrix.com>
Date: Mon, 15 Apr 2024 11:50:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
To: Julien Grall <julien@xen.org>, John Ernberg <john.ernberg@actia.se>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "conduct@xenproject.org" <conduct@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-2-john.ernberg@actia.se>
 <084b9ed5-1585-4802-b504-6ccd2f262542@xen.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <084b9ed5-1585-4802-b504-6ccd2f262542@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/04/2024 11:25 am, Julien Grall wrote:
> Hi John,
>
> I saw this patch was committed. I have one question this may require
> some adjustment.
>
> On 08/04/2024 17:11, John Ernberg wrote:
>> ---
>>   xen/arch/arm/platforms/Makefile |   1 +
>>   xen/arch/arm/platforms/imx8qm.c | 139 ++++++++++++++++++++++++++++++++
>>   2 files changed, 140 insertions(+)
>>   create mode 100644 xen/arch/arm/platforms/imx8qm.c
>>
>> diff --git a/xen/arch/arm/platforms/Makefile
>> b/xen/arch/arm/platforms/Makefile
>> index 8632f4115f..bec6e55d1f 100644
>> --- a/xen/arch/arm/platforms/Makefile
>> +++ b/xen/arch/arm/platforms/Makefile
>> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>>   obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>>   obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>>   obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
>> +obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
>>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
>> diff --git a/xen/arch/arm/platforms/imx8qm.c
>> b/xen/arch/arm/platforms/imx8qm.c
>> new file mode 100644
>> index 0000000000..3600a073e8
>> --- /dev/null
>> +++ b/xen/arch/arm/platforms/imx8qm.c
>> @@ -0,0 +1,139 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>
> The majority of Xen code is using GPL-2.0-only. In the early days for
> Xen on Arm we started to use GPLv2+ which I consider it was a mistake.
> Unfortunately this started to spread as people copied/pasted the same
> copyright headers.
>
> So can you confirm whether you intended to use GPL-2.0+? If not would
> you be able to send a patch to adjust it? (Better to it before there
> are more modifications).

Julien: I've called you out multiple times before.

Don't ever bully contributors into changing licensing.  It is
unacceptable behaviour, and in most cases - including this one by the
looks of things - not legal.


John: Thankyou for your contribution.  It has been made under a license
compatible with the rest of Xen.  There is no need to make any change,
and please do not feel pressured into doing so.

~Andrew

