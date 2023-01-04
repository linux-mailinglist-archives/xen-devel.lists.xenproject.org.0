Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C021965D729
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 16:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471260.731040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD5Xk-0006FC-Bo; Wed, 04 Jan 2023 15:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471260.731040; Wed, 04 Jan 2023 15:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD5Xk-0006Cv-8k; Wed, 04 Jan 2023 15:19:04 +0000
Received: by outflank-mailman (input) for mailman id 471260;
 Wed, 04 Jan 2023 15:19:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G5yt=5B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pD5Xj-0006Cp-8h
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 15:19:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e7f6673-8c43-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 16:19:02 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so26704581wms.4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 07:19:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 6-20020a05600c024600b003cfd0bd8c0asm44453781wmj.30.2023.01.04.07.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 07:19:01 -0800 (PST)
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
X-Inumbo-ID: 1e7f6673-8c43-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ppHjajXu00sfHG3gYewiMMYX9m68H41AIgp8I+UXRqY=;
        b=UC2d663kGMVSshGb3omgRSAw0Ledaea0D1mgz5XDzXkbSgMftbWdaODs4OZmZOZBoh
         FyMvchGQ+037Hv9r0gY2rD51/ne2FMsPDuiE3Zr9tDtd+GSwonagjkiT7goqZzl2Gh+U
         W4ctjpskbLJNK16iOyLNAxtSD8TykO7UWVx0+q05zFYM+chKLMn8WWzPXDTOREDFoFoX
         ai1PC9EBJ+Nyq85ZUfyieR+RVa63WqYZX6+4bmFIFPCpfBkXyscUWiRMXh36EpIKeSMd
         SKarwbnDmbMBH9wuFC0txM58BjgBz9sYihOWquggB5SiYOaAcSqkst3g2R31OfWxnwCT
         tISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppHjajXu00sfHG3gYewiMMYX9m68H41AIgp8I+UXRqY=;
        b=lEdKjYJOc7ks5opfm5A+glUuT2bZWlLgGwAi+Xr8z6Gnf8fFgeHVYTlMMthk9hW+mT
         5p/Fg2h1bbhnirKy00MlO2wnx6hh5D5Q4tWuDQao2vYwgftW+htNtzT5PaOhZ5OOWBZe
         aKu6xhBhG12g67lWDMvIS9aUic6L2xQWswvXYusSdqxuqmj5X8XzuOcfp/Zv4ilXotje
         hn52WPPVdllQj0mqruwUdfYJICI2gLSWOp0QLd0Q5K/w66q9xsVPE2Z+JaRPjiqqwiaV
         pe2sAwl+8aZu0k6H+3RhMqa01jKWgMmgXhjAJSDzIuy0BZZA+Y12ofiDx7pZhUG7wfX0
         dl4g==
X-Gm-Message-State: AFqh2krWRvTaYyTjQU6Hr5W6dWhcme5YsV/dHW+3Jc9QYWn3uaRCGGbr
	Qdzh23zkMrdy86MqsajrSW8onw==
X-Google-Smtp-Source: AMrXdXs4D+lia01lWxYpxoqiFcHhQKZtcCTZ221KZh9cuBly4YiKqjSpq4+CbaUrUFzi9gJI4l5cIg==
X-Received: by 2002:a05:600c:3844:b0:3d3:4406:8a3a with SMTP id s4-20020a05600c384400b003d344068a3amr41590590wmr.30.1672845541824;
        Wed, 04 Jan 2023 07:19:01 -0800 (PST)
Message-ID: <90e7dc87-e2a1-90ae-1002-6f98abe2224e@linaro.org>
Date: Wed, 4 Jan 2023 16:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/6] hw/isa/piix: Wire up Xen PCI IRQ handling outside
 of PIIX3
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
 <20230104144437.27479-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104144437.27479-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/23 15:44, Bernhard Beschow wrote:
> xen_intx_set_irq() doesn't depend on PIIX state. In order to resolve
> TYPE_PIIX3_XEN_DEVICE and in order to make Xen agnostic about the
> precise south bridge being used, set up Xen's PCI IRQ handling of PIIX3
> in the board.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c | 12 ++++++++++++
>   hw/isa/piix.c     | 24 +-----------------------
>   2 files changed, 13 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


