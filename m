Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A528D2D1B95
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 22:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47024.83257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmNfH-0007Gc-EN; Mon, 07 Dec 2020 21:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47024.83257; Mon, 07 Dec 2020 21:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmNfH-0007GD-B9; Mon, 07 Dec 2020 21:03:23 +0000
Received: by outflank-mailman (input) for mailman id 47024;
 Mon, 07 Dec 2020 21:03:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmNfF-0007G8-EP
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 21:03:21 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7070f3a1-12cd-4f4a-a5dc-630d71c0be3a;
 Mon, 07 Dec 2020 21:03:20 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id a8so5335278lfb.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 13:03:20 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l7sm534930lja.15.2020.12.07.13.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 13:03:19 -0800 (PST)
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
X-Inumbo-ID: 7070f3a1-12cd-4f4a-a5dc-630d71c0be3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9xUPJN4ARralP1aPENVZ3BLZkCJG+0W2+X4hLd9YekU=;
        b=vLRsPDCQAJbrZ8OjcyJEWKBWgz7CYBzNvv4lBFhMq+K29/24/T4w/19twUdtWAM3xo
         YOcHLvn1O1DMLlmAh5vNyDP3h+EMk9Wdw4+kRjmfFBOXPcM5woTQXF7D98KI6vIBu1nq
         8eMzxx7RcSeRIkvF5oxhyLZEIpymqBHnWDp8I6kihRe8PGOkz0bMk5yU5KCpNwtuDgpY
         v0P8jhCqjgPN+rZqpbWL5Dq0c/4wIE37zSs0DozxOQrM0EC4/XpKtV3HRS5uRSFOWWcG
         lfRt9w2w5TxRvP4DgBlMJAWfsqXuDtlNq/D4nSTfCmBcCUuxrxtrTuJoqenwCaTKiHgA
         RqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9xUPJN4ARralP1aPENVZ3BLZkCJG+0W2+X4hLd9YekU=;
        b=WpIDQpg3BagkP5O5GSeeMZmFWqRQBElFi1IAJVlyXESjH5nllmNOz+5VSmsiXhOpGv
         anLc/ZemNKpRWb8MyJXygWSv++OjU4uvT8ZKu/rT6bZov81VrbDi9zxrj8g/Ay6PwxOO
         ay+YsO8DsE43r3O7vXfqjhIjgzap2MtCctmRlk6TsApe7itngXWyW8mD6/RM32UaLcYa
         uudJYof9EWey8J8izVbz6//tMlTB6otGCV4voeymuEUKB8rBqRRnVH4nP9TfwKv6ZFY+
         z41tNJLjw5G64RftJoLuTamiIgFMJZHyBMEBfj0l/rEOg4YSJtWxYxe15Mefnx/KOmKO
         uAKQ==
X-Gm-Message-State: AOAM530kafK4Sc/1ur5bjZKEPReBWwyLCNd4y1f2oxL1GTV1FW1DtlQy
	1WcOVDEhluMioaJm7kVwiyI=
X-Google-Smtp-Source: ABdhPJxlaxxqUxTKPajCcUsqXcrCc9JOL1RLRS+EVzHMeRcUPhhGqNEWQEJCAWA1nQ0b2j/hPbCigw==
X-Received: by 2002:a19:e8a:: with SMTP id 132mr5762415lfo.108.1607374999655;
        Mon, 07 Dec 2020 13:03:19 -0800 (PST)
Subject: Re: [PATCH V3 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: Wei Chen <Wei.Chen@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <Julien.Grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Artem Mygaiev <joculator@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <66df4a0b-166a-81c3-9237-854649c832f9@gmail.com>
 <AM0PR08MB3747E17FB0F59A85CA72AEDA9ECE0@AM0PR08MB3747.eurprd08.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <76d418d9-a991-1de8-437e-cc950df5bdd5@gmail.com>
Date: Mon, 7 Dec 2020 23:03:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB3747E17FB0F59A85CA72AEDA9ECE0@AM0PR08MB3747.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.12.20 15:03, Wei Chen wrote:
> Hi Oleksandr,

Hi Wei


>
> I have tested v3. It works well with the latest virtio-backend service[1].
> [1] https://github.com/xen-troops/virtio-disk/commits/ioreq_ml1
>
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Thank you very much for the testing!


-- 
Regards,

Oleksandr Tyshchenko


