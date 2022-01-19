Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDA493B15
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 14:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258849.446261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAAzW-0003e4-3W; Wed, 19 Jan 2022 13:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258849.446261; Wed, 19 Jan 2022 13:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAAzW-0003bU-07; Wed, 19 Jan 2022 13:27:10 +0000
Received: by outflank-mailman (input) for mailman id 258849;
 Wed, 19 Jan 2022 13:27:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GOcB=SD=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1nAAzU-0003bO-BV
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 13:27:08 +0000
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [2607:f8b0:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f0b1700-792b-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 14:27:07 +0100 (CET)
Received: by mail-il1-x132.google.com with SMTP id r16so2140731ile.8
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jan 2022 05:27:07 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id c7sm4569815ioi.18.2022.01.19.05.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 05:27:05 -0800 (PST)
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
X-Inumbo-ID: 7f0b1700-792b-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bOtjTSupMPdLeWMiVKrD7jaORGYKT+sk6BwRJT6YH5k=;
        b=7BEfqJqRzXAE088B+2bHOpvIL0UUVYOZUvHjaUycgtIQCZS6qJSTGhtIwa1Xa6EPfk
         oV2YXPGcxgiVF5LaQHluLKvgATLLAeZKgM3nn6DNYQRh6ifI6cdJPU7ZNOAzZ5g1fFkO
         MWYcErn30fkxjWY45t9Yboy2jcExTsCrzys7xQCWMUAHOZ2PvIOKEUon3RlzTMdRHOFW
         W8Ams8MdRsSgkRcx2W8R30267oa8zRJAWTCRB6MNRYIPNawBrTjM+yr6IoXc6oDoeZjs
         ao5paPXCdk//Rx9HxN4miEoGhchTg9VDu7RK7HyILmak+tgC3BqPCX5DU7MxKWRj66d8
         cjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bOtjTSupMPdLeWMiVKrD7jaORGYKT+sk6BwRJT6YH5k=;
        b=4p4OgccJJX/nqZWwlLBsiM5bdNuUacByBCHlc5FiRbYIB5k4rIv6l7bBgD6RK2TUr7
         +W1FHjRQ/iDaNGiE6Fw1CVPgHJieOt+pT0pH7t4GwrSzZc4MNdGQj19MMD5/gKfbme+7
         gt+OfObMUArmeeDaUW03M/LsPtfUB0o7FoZsh5rFvcSZKfEX2H+gYbWcX96pY5O97XXH
         LXptEpULf+5D4tpxVcanpXar3+eaqztAiz3DVrEe/yFtUOllXNGGjvWXytkSjoySD/t7
         ntbF5RFdpza9JuIlsaSQ9qCC5j0hdZLCd/hTBEclb3pEkqubYG/+tdPtOfbq9Fu8tcK8
         JBrQ==
X-Gm-Message-State: AOAM532YzxmMYyE4qPIinAI9M9wfpTGEK0LYcVZU/WS0kNXYgwfhOmMU
	LNOTs4M7dtFmTu7s5FqAoe65hg==
X-Google-Smtp-Source: ABdhPJy/gK+ACUkzeActiCIlSLAxm2cSY3hrzhU1AqADv9+8T7xomkwrCDZtFgg9hB/5uCyhH7Qi5A==
X-Received: by 2002:a05:6e02:144a:: with SMTP id p10mr9326688ilo.152.1642598825847;
        Wed, 19 Jan 2022 05:27:05 -0800 (PST)
Subject: Re: improve the bio allocation interface
To: Christoph Hellwig <hch@lst.de>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Mike Snitzer
 <snitzer@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Md . Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang
 <jinpu.wang@ionos.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.co>, Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, xen-devel@lists.xenproject.org,
 drbd-dev@lists.linbit.com
References: <20220118071952.1243143-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2b9aedb6-4531-91fe-3493-133470ebee80@kernel.dk>
Date: Wed, 19 Jan 2022 06:27:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220118071952.1243143-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/18/22 12:19 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series is posted early because it has wide-ranging changes and
> could use some early ACKs before -rc1.
> 
> It changes the interface to the bio allocators to always pass a
> block_device and the operation, which is information needed for every
> bio submitted through bio_submit.  This means the fields can be
> directly initialized in bio_init instead of first being zeroed and
> thus should help to micro-optimize even better than the __bio_set_dev
> that Pavel proposed while also cleaning up code.

Looks pretty straight forward from the block core point of view. Didn't
look too closely at the fs/driver changes yet.

-- 
Jens Axboe


