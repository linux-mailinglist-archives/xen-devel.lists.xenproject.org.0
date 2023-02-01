Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30562686165
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 09:15:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488171.756137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN8HB-0000Ij-Ll; Wed, 01 Feb 2023 08:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488171.756137; Wed, 01 Feb 2023 08:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN8HB-0000FT-Ip; Wed, 01 Feb 2023 08:15:29 +0000
Received: by outflank-mailman (input) for mailman id 488171;
 Wed, 01 Feb 2023 08:15:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYYs=55=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pN8HA-0000FG-PR
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 08:15:28 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 960bd83f-a208-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 09:15:28 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id k16so12024016wms.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 00:15:28 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b002be34f87a34sm16872031wrr.1.2023.02.01.00.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:15:27 -0800 (PST)
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
X-Inumbo-ID: 960bd83f-a208-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oP9kZX1kICyLQTDEKEZ6//nF1VpBMEFgrmkqWWC3qqk=;
        b=mjKa84MaEQpoKPLz1KTv3MoYcbwR/zi12wF5wCEO4OIguVkj8UrILO803jdyuzCfHp
         l1chHz4jfmGnoZh3FWv3v7NLSsIA2+X66r+9OBxa/Tatkz/zKQWL6H6vjidwL+/XfKA7
         wbmkzZbgi03FpIMjDf9Up8EOElzocb3kHaQQ3JApIJuWleq419nlAYfcLiWivVKEDNzr
         SCDrA2nWktdMLaMd80Nv+tcWuUWm/13foUtAdJBkDRx8KlrmJJs1qkmEWbUuTCivPoX/
         Hx8vhradxqVciJCzgJb+xK1x3XbAL/8OSluDGes1nv/25RQed6tQBMrdrsUiiIEfMnje
         fcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP9kZX1kICyLQTDEKEZ6//nF1VpBMEFgrmkqWWC3qqk=;
        b=3Rw8Fhp5DwmxOUiV7C64KOKCLVtNTYZ6Vq9RUsnNGjPR+heEm8anRxlnFMC017AFnT
         GhE3F4CsdDyJQR0x42o02QJiYbqF2r9mNl2PwKaFHFH/eKEtG1K1auHw6zmORKDJU3bF
         cbGt4OomucQWn1OBOE4a3N6NfgDiQoPEf4Q5+RgeKc5agFzEBhBSQjhKEv2IXHHDIN9C
         HOrYUT/cxC6aa4gIb7fb/EZ+tb2Pd92cOcDBXeJ7s3M/lfIZM3prtBMtFnd3wx32I6R4
         F/dck4NGWEQPWm5Rw43Rva4jGYRh127s1agHapxCFTXiD68D4Xhgthfn3X6d4MVt2hbu
         FDvQ==
X-Gm-Message-State: AO0yUKUJyVoHaXKUvOG6PWWrEFnIEYfQwb44yxAhcgvuced+JOQzaPRJ
	nXf9rjTURpeC3mYnu+eJU00=
X-Google-Smtp-Source: AK7set+HyCLzXLubjcb8nQT7eucxTBk7xcdTcj02Xm/L114C4sDworlfM0TcgU2EXLB2g8Xx8WQlkw==
X-Received: by 2002:a05:600c:4fd1:b0:3dd:1ac2:989 with SMTP id o17-20020a05600c4fd100b003dd1ac20989mr6480850wmq.39.1675239327594;
        Wed, 01 Feb 2023 00:15:27 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9a8b8d11-099b-0263-3283-5e49d8dd7513@xen.org>
Date: Wed, 1 Feb 2023 08:15:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Reply-To: paul@xen.org
Subject: Re: [QEMU][PATCH v5 07/10] hw/xen/xen-hvm-common: Use g_new and
 error_report
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-8-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-8-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/01/2023 22:51, Vikram Garhwal wrote:
> Replace g_malloc with g_new and perror with error_report.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   hw/xen/xen-hvm-common.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


