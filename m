Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AFA5048FA
	for <lists+xen-devel@lfdr.de>; Sun, 17 Apr 2022 20:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306699.521853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng9oB-0007nm-7O; Sun, 17 Apr 2022 18:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306699.521853; Sun, 17 Apr 2022 18:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng9oB-0007lG-3J; Sun, 17 Apr 2022 18:39:39 +0000
Received: by outflank-mailman (input) for mailman id 306699;
 Sun, 17 Apr 2022 18:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3EG=U3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ng9oA-0007lA-E9
 for xen-devel@lists.xenproject.org; Sun, 17 Apr 2022 18:39:38 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bba85544-be7d-11ec-a405-831a346695d4;
 Sun, 17 Apr 2022 20:39:37 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id d6so3653957lfv.9
 for <xen-devel@lists.xenproject.org>; Sun, 17 Apr 2022 11:39:37 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 p41-20020a05651213a900b00443e2c39fc4sm1003889lfa.111.2022.04.17.11.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 11:39:36 -0700 (PDT)
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
X-Inumbo-ID: bba85544-be7d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=I4fx1hE4/XanHvXXT61GagAtRkg7k3tgW0Yywww1X/E=;
        b=FEccoRnaF+wbNXngW5iZweCAocsqLhshHwThOJF6lZswLZbeUUkZJlHXWlqwYvu2zh
         M6ncNqOqhSdo8d0h6tcZAH0cscsrN4GQj3wKFmXZIgr/YNtoQylktDQ6T0NwCPLzx+Zb
         UCfa6UQWqEocDxiT9sS+j8rhj4cHHVfZvRYiWLJCoJe0c2v1mxt3yQN9NmWmE1QZIxFe
         HDyRfhqmjvoIy/MN7AlJQUMyMyC/9X+OV+dSXqpZEXPkl+1+OyY6nzO2neMzYhanmAlz
         3VNJtEcmSmxMjyWNhi+jpm8saHRv/Xv8IYnE8HiDOYMOW1pGVbcazbvNURWkmjqemdcL
         4IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=I4fx1hE4/XanHvXXT61GagAtRkg7k3tgW0Yywww1X/E=;
        b=RI74sUAMHtrjpVQAwT2WzG8ma+yxpjSKP/vhCP7yAKMGDfUg/tx8upm5xhtYU1EOky
         TJCRoXOUEeWA0gnJv0IMyMcdUxUZn+X8ZPthANeeYfz0yTbcHKnpPSasngewrg6aa3uf
         UqM1qoihHXCVRu18EtqmkO/tAPpA1TwaMmaW6IljMyFIRPE03jraMmL3vtWoS/RBboJr
         Th1RqoAZlWugpqyZb7oBwJ2bb+rgkvdAnjRi2w080mF49dqBmUAiDNcKeRM6WtvsVpb4
         bv/r8Qp2BJYVZyc+mA481VRYZgl933HWCqcFFWPGCHNQVaLRhcv9JSfiFJKFE34VMUSu
         J1Gg==
X-Gm-Message-State: AOAM530E/Fpj1Ehp3cGsP4x1/DRB0s9EsiaVhciPLi2lux8/iVf5363M
	Qu8L4lpd2MiYPgcwVCuKawE=
X-Google-Smtp-Source: ABdhPJzA+VxQFkx8HmF0tiTX8iqmLNuHvigncHHa0RSibVSg5k0iQLaeVAuqP3PChRgmomWCGz3WGw==
X-Received: by 2002:ac2:5296:0:b0:46d:da1:773e with SMTP id q22-20020ac25296000000b0046d0da1773emr5704173lfm.197.1650220776577;
        Sun, 17 Apr 2022 11:39:36 -0700 (PDT)
Subject: Re: [RFC PATCH 4/6] virtio: Various updates to xen-virtio DMA ops
 layer
To: Christoph Hellwig <hch@infradead.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <1649963973-22879-5-git-send-email-olekstysh@gmail.com>
 <YlpcqOUK59yExXlq@infradead.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a8ef5394-3eb8-cd2a-f61d-a38277407eed@gmail.com>
Date: Sun, 17 Apr 2022 21:39:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YlpcqOUK59yExXlq@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 16.04.22 09:05, Christoph Hellwig wrote:

Hello Christoph

> On Thu, Apr 14, 2022 at 10:19:31PM +0300, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Various updates is a big indicator that the patch should be split
> further.  Please do one change at a time, and fold updates to the
> previous patches in the series into those patches instead of fixing
> them up later.


Sure, next (non-RFC) version will do things properly.


-- 
Regards,

Oleksandr Tyshchenko


