Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3337765D724
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 16:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471253.731029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD5Vr-0005f9-W9; Wed, 04 Jan 2023 15:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471253.731029; Wed, 04 Jan 2023 15:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD5Vr-0005co-Sv; Wed, 04 Jan 2023 15:17:07 +0000
Received: by outflank-mailman (input) for mailman id 471253;
 Wed, 04 Jan 2023 15:17:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G5yt=5B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pD5Vp-0005ci-Pg
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 15:17:05 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7979cd7-8c42-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 16:17:03 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id d17so13568528wrs.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 07:17:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b16-20020adfee90000000b002a1dd8ff75fsm3038540wro.62.2023.01.04.07.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 07:17:01 -0800 (PST)
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
X-Inumbo-ID: d7979cd7-8c42-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CeQL5xWC173b6TUlkncPiMJP/Eoy8yXUJGOkp8pSziE=;
        b=J5vToNBwZNPE6isC6rzDCQasdXVM5QQ6ViaudBztq9BY1UjSa7dqNQ4YtwVCTbIlM4
         VcFAiu42pOHnylu6h+Is6Sj4pPaGI2bDWbOdTgS29Hl0K7x09j1lk4l3FoJskBIVbjQy
         XR8I/KX+RNmSq9VDy6LX2bf5BJq4bIg8zUvtZMdjiJSL6yZa/YyfRW5ito3x+6nZpwTE
         swVNnHjOf+0BvmS6nLhRt9rPID6FeaoBnmfqsafX90aGSYTBKdJZO0bWoLLm+/f9yzID
         XB1vwczUCLW8KqQvCyAyboPhmSTxI7uiqJ7R6+kg309LuHLEexw+/tWuQR05HG87CQwu
         ebCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CeQL5xWC173b6TUlkncPiMJP/Eoy8yXUJGOkp8pSziE=;
        b=rQm+OIE5MofYax/tSSnJlP/Vtk1bDx/680QLDyqPzpExeLXzqrNAmFVPFcEockeoKT
         mXfYlpFoPnTrSyu7ZYfzA3wUOuRjJvACbdkv3Yrzc5dKQoYueqkh7wb0YEX7Fdz4HtM9
         El/bX/2QTD9vdyGoAjvg40K26EmZl2LTfsrmnEMM5ilT7it4ZvwVSzUR2JJdMKDvGTxy
         7JjKs2AypC9rxOBaIusthAutckGiOi1gLDK1AIvWjY7oWTG8p8jGZfCnZKou9PlhSeO7
         rxqk4nG0Fn6zCFElOkAaBRLwaEP28IlG8lltk1dAxSZNz5PRpDkQnQBJoqlbOnfg3bMK
         4g8w==
X-Gm-Message-State: AFqh2kq5TF6vzkQZA2rhvN/2ygCgthBbxMxwoY2PoL/R7NlQYqnzpFfJ
	tuRQwdoto3f0S1BStODyFnzbFQ==
X-Google-Smtp-Source: AMrXdXvH2pOn3LWxDaYFR7QAs+zf153SI/Oyb1HLgOqiNzpUp5DYIJp/xLQE53lCu6Un1TZ3PMWlhw==
X-Received: by 2002:a5d:52c1:0:b0:242:5d8e:6c35 with SMTP id r1-20020a5d52c1000000b002425d8e6c35mr29010302wrv.28.1672845422878;
        Wed, 04 Jan 2023 07:17:02 -0800 (PST)
Message-ID: <5a1b4b87-e6eb-de5d-ae1f-b648b6a7fc58@linaro.org>
Date: Wed, 4 Jan 2023 16:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/6] include/hw/xen/xen: Rename xen_piix3_set_irq() to
 xen_intx_set_irq()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Chuck Zmudzinski <brchuckz@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104144437.27479-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/23 15:44, Bernhard Beschow wrote:
> xen_piix3_set_irq() isn't PIIX specific: PIIX is a single PCI device
> while xen_piix3_set_irq() maps multiple PCI devices to their respective
> IRQs, which is board-specific. Rename xen_piix3_set_irq() to communicate
> this.
> 
> Also rename XEN_PIIX_NUM_PIRQS to XEN_IOAPIC_NUM_PIRQS since the Xen's
> IOAPIC rather than PIIX has this many interrupt routes.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/xen/xen-hvm.c | 2 +-
>   hw/isa/piix.c         | 4 ++--
>   include/hw/xen/xen.h  | 2 +-
>   stubs/xen-hw-stub.c   | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


