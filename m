Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134CA640107
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 08:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451515.709276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p10VS-0008Am-QS; Fri, 02 Dec 2022 07:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451515.709276; Fri, 02 Dec 2022 07:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p10VS-00087f-My; Fri, 02 Dec 2022 07:30:46 +0000
Received: by outflank-mailman (input) for mailman id 451515;
 Fri, 02 Dec 2022 07:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6g/C=4A=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1p10VR-00087Z-OY
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 07:30:45 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ab94868-7213-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 08:30:43 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id h7so471021wrs.6
 for <xen-devel@lists.xenproject.org>; Thu, 01 Dec 2022 23:30:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay2-20020a05600c1e0200b003cfd0bd8c0asm7871437wmb.30.2022.12.01.23.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 23:30:43 -0800 (PST)
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
X-Inumbo-ID: 3ab94868-7213-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8ql54sZJDunHedzTHnvosP2GFNhHBt/jwxcWVqkKrw=;
        b=TVm1NIYh1Q7iAyTsM7qc7hev15vNkoSE8EUSnwGoHabUGC7UBmF1fkdCO/1U1u9xvo
         KlSdHsLwxaur76EYgZ0zvMRl4P1QQiaY/9VWmVIvozawQHZ6uPeV1DuOyrTs+I80n8LX
         XVNCBStJBxUoIjtj9rxXkW4qSgR1dP7w4xaZtMQGwQqUfRhhF/tswrPe8GJrhrQQ3Qiy
         rPKxcZONGThvC4K9MK7QdaLY39ddR18fAIWzSwK2l+VLUowb05BdG4jphZtRNbWTasSf
         gUm21rixoV27yY4W2G24evxcn5WR5MUUS2rjHYj5mBOZhhfOI32cFVp7kohXXzjZhZQv
         jsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8ql54sZJDunHedzTHnvosP2GFNhHBt/jwxcWVqkKrw=;
        b=ZHoYRUAMGhehNhT/1ugUAFCNpOF9WL7tLqOXBJYlpchwBpPUugpmRwwfLZDIa0Zmv/
         iynnlXC6WVtkVPc9xb+M92SEcsIs6BKevfUvut1RE4NOqUHvbhtc5Pj6zsWhCxhM+nQp
         M6r1SKasDrr9jppGc2cu6Dni2PnYyJUl1ZbMjohXTlotV+Y+MoaKZT1e0Ofyc2T5a2wh
         wVWgufI56Ykjfj2lrxhDgKnBPWDfXiNANSGvbCtLDTGvonWhDKTeHLqeZSlbg+HdwPDa
         FMjS/wjInQIZ0VzZtl/sXoiav0lnHl+cpw7l5ZbnVP9dAW2wf1EKaXOXQLAFRWTLGPdo
         vaig==
X-Gm-Message-State: ANoB5pnLvmYeoHQtogNbKZ2ftUAZiofaS01KIDqSFpJ7tksq2CBKTipI
	tG5XBxCL4bCgIm4ePqSGREuLjA==
X-Google-Smtp-Source: AA0mqf4hLyZpN4MxmrOcTbwU9h/hfXuZXL0BMzihoq1RZI2AynblVXMjBtNnrDSTRdGVTGfqWnAZbA==
X-Received: by 2002:adf:f8cf:0:b0:242:3fac:df9f with SMTP id f15-20020adff8cf000000b002423facdf9fmr2641768wrq.117.1669966243940;
        Thu, 01 Dec 2022 23:30:43 -0800 (PST)
Message-ID: <429495ae-9d8e-9921-9e8a-f913cb5b2779@linaro.org>
Date: Fri, 2 Dec 2022 08:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com
Cc: stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202030003.11441-11-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/22 04:00, Vikram Garhwal wrote:
> Add a new machine xenpv which creates a IOREQ server to register/connect with
> Xen Hypervisor.
> 
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
> TPM emulator and connects to swtpm running on host machine via chardev socket
> and support TPM functionalities for a guest domain.
> 
> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>      -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
>      -tpmdev emulator,id=tpm0,chardev=chrtpm \
> 
> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
> provides access to TPM functionality over socket, chardev and CUSE interface.
> Github repo: https://github.com/stefanberger/swtpm
> Example for starting swtpm on host machine:
>      mkdir /tmp/vtpm2
>      swtpm socket --tpmstate dir=/tmp/vtpm2 \
>      --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
> 
> /* Comment about machine name. Will be removed in next version*/
> Please reply with the machine name you agree. Below are two possible names:
> 1. xenpv
> 2. xenpvh
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/arm/meson.build            |   2 +
>   hw/arm/xen_arm.c              | 175 ++++++++++++++++++++++++++++++++++
>   include/hw/arm/xen_arch_hvm.h |   9 ++
>   include/hw/xen/arch_hvm.h     |   2 +
>   4 files changed, 188 insertions(+)
>   create mode 100644 hw/arm/xen_arm.c
>   create mode 100644 include/hw/arm/xen_arch_hvm.h


> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
> index 26674648d8..c7c515220d 100644
> --- a/include/hw/xen/arch_hvm.h
> +++ b/include/hw/xen/arch_hvm.h
> @@ -1,3 +1,5 @@
>   #if defined(TARGET_I386) || defined(TARGET_X86_64)
>   #include "hw/i386/xen_arch_hvm.h"
> +#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
> +#include "hw/arm/xen_arch_hvm.h"
>   #endif

Do we really want to maintain a 32-bit PV machine?

