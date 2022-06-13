Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE4B54860C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 17:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348420.574667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0mOX-0002Lp-KB; Mon, 13 Jun 2022 15:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348420.574667; Mon, 13 Jun 2022 15:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0mOX-0002JS-H9; Mon, 13 Jun 2022 15:54:25 +0000
Received: by outflank-mailman (input) for mailman id 348420;
 Mon, 13 Jun 2022 15:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7V0V=WU=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1o0mOW-0002JM-BQ
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 15:54:24 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 177d8b71-eb31-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 17:54:23 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id cx11so6009475pjb.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jun 2022 08:54:23 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902ab8200b001616b71e5e3sm5283754plr.171.2022.06.13.08.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 08:54:21 -0700 (PDT)
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
X-Inumbo-ID: 177d8b71-eb31-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=nHJVhnE9ITPoEkRn2jJu6Akvnw4FhB/RBzEVAwrZNYY=;
        b=jLOnW4vvy+7rnedI3UvibpOr7H4Lp9pwo78dNdJXRa85A0cHE+bIjtZRisvPrJLMYX
         kJieV1hk8UBfaylVOAhQgJKGURC7wg41xl1QL1bWdI9yuHWrRSCESDvr8bEJ3DXptdzw
         XpjdzOQaCEmRihXCk7xa+OwNraykTnLQD3SATeus4wMt9eFfIDUHUPMhPEiU13JrWn0g
         i7bAmDbwUT8gYdjptcSRjH6aiItfFV88Kc9s6CC6psxnXUFVtSE/P4PO4FabxmXmXN0B
         W2z8/vZOYtxe/UDLcGTTvq8s2PZmQKeHk1jgH3Tt7cAMstsn8QiZ3Ffaaw05tCvOwLWO
         mfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=nHJVhnE9ITPoEkRn2jJu6Akvnw4FhB/RBzEVAwrZNYY=;
        b=TPasyaMkHIZ3zHRaryneQFK/eTrCsSAFtqiHIpdm8KpoI/qt64An+TQhl7beZ9cdoI
         hlpRs6PeZri7bzrpyAmRyvpD+8Y43zw/iYVzEtDpUcodZLG6X5uH6h0+jQ+MIbf2xV7G
         qAspoMcZQnL/dVZNahf67qLZlMplYqAyIpP3y1Cz6y14JCb075sD4L2Ia5cZHcW3JouP
         RAMqfZnEinIrm0H8TYQZYe/szLIjnNZUmeIP1Slxt93qA7fXnQ7ihnykzo+XZTlx9OUW
         +sf1udO8Pbkojqy4AI/agNEaSb2s7297AijEBK3GN1JJT9KgqWuUb5Ve4D+6azU3rW2y
         /UcQ==
X-Gm-Message-State: AJIora8qz2TvVNRq//lsJbL4FzIcWQkj2aPdp0dcdw8I6QIAr2/8UJKX
	naq2qnA7h6uSFbzuJs+QqvgwOg==
X-Google-Smtp-Source: AGRyM1sD3tyn8G3zosvdRQwgK8NEK7opcw/arRNKm27jqBsG5w/THdyvq7J9m433qMbuCAwQHvwxJg==
X-Received: by 2002:a17:902:ce83:b0:166:42de:29d5 with SMTP id f3-20020a170902ce8300b0016642de29d5mr287593plg.123.1655135661614;
        Mon, 13 Jun 2022 08:54:21 -0700 (PDT)
Message-ID: <ba8e6d19-f49a-a367-918a-2f05c8793864@linaro.org>
Date: Mon, 13 Jun 2022 08:54:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/16] Kraxel 20220613 patches
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
 <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
In-Reply-To: <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/13/22 08:52, Richard Henderson wrote:
> On 6/13/22 04:36, Gerd Hoffmann wrote:
>> The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:
>>
>>    Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 
>> 21:13:27 -0700)
>>
>> are available in the Git repository at:
>>
>>    git://git.kraxel.org/qemu tags/kraxel-20220613-pull-request
>>
>> for you to fetch changes up to 23b87f7a3a13e93e248eef8a4b7257548855a620:
>>
>>    ui: move 'pc-bios/keymaps' to 'ui/keymaps' (2022-06-13 10:59:25 +0200)
>>
>> ----------------------------------------------------------------
>> usb: add CanoKey device, fixes for ehci + redir
>> ui: fixes for gtk and cocoa, move keymaps (v2), rework refresh rate
>> virtio-gpu: scanout flush fix
> 
> This doesn't even configure:
> 
> ../src/ui/keymaps/meson.build:55:4: ERROR: File ar does not exist.

... or, rather, corrupts the source tree on the first configure, so that any retry fails:

	deleted:    ui/keymaps/ar

	deleted:    ui/keymaps/bepo

	deleted:    ui/keymaps/cz

	deleted:    ui/keymaps/da

	deleted:    ui/keymaps/de

	deleted:    ui/keymaps/de-ch

	deleted:    ui/keymaps/en-gb

	deleted:    ui/keymaps/en-us

	deleted:    ui/keymaps/es

	deleted:    ui/keymaps/et

	deleted:    ui/keymaps/fi

	deleted:    ui/keymaps/fo

	deleted:    ui/keymaps/fr

	deleted:    ui/keymaps/fr-be

	deleted:    ui/keymaps/fr-ca

	deleted:    ui/keymaps/fr-ch

	deleted:    ui/keymaps/hr

	deleted:    ui/keymaps/hu

	deleted:    ui/keymaps/is

	deleted:    ui/keymaps/it

	deleted:    ui/keymaps/ja

	deleted:    ui/keymaps/lt

	deleted:    ui/keymaps/lv

	deleted:    ui/keymaps/mk

	deleted:    ui/keymaps/nl

	deleted:    ui/keymaps/no

	deleted:    ui/keymaps/pl

	deleted:    ui/keymaps/pt

	deleted:    ui/keymaps/pt-br

	deleted:    ui/keymaps/ru

	deleted:    ui/keymaps/th

	deleted:    ui/keymaps/tr



r~

