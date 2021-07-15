Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43803CA188
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 17:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156695.289159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m43M8-00063e-PG; Thu, 15 Jul 2021 15:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156695.289159; Thu, 15 Jul 2021 15:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m43M8-00060p-MA; Thu, 15 Jul 2021 15:32:56 +0000
Received: by outflank-mailman (input) for mailman id 156695;
 Thu, 15 Jul 2021 15:32:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i0+0=MH=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1m43M6-00060j-S8
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 15:32:55 +0000
Received: from mail-oo1-xc33.google.com (unknown [2607:f8b0:4864:20::c33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59bb3521-48d1-4ff1-803f-35aec814eaf9;
 Thu, 15 Jul 2021 15:32:53 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 n187-20020a4a40c40000b029025e72bdf5d6so1639066ooa.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jul 2021 08:32:53 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id d7sm1128969oon.18.2021.07.15.08.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:32:52 -0700 (PDT)
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
X-Inumbo-ID: 59bb3521-48d1-4ff1-803f-35aec814eaf9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ctPsCQnCwOWC1BXWqxdnW65MNFL9SGWc9DV0HhUmFp8=;
        b=b0Q4rQVW5qzDbmL8dXl4Xl18PnpkfjVwt3adPgkOOLeKrOPcTs7mOV+KmzlE0QlalO
         M76Um9GwwJ6MLrZWrdh5GBZNrlEks/A4ooKQDIEqKBaeq11yk/dm1mJCfKwMvuRvqpZ6
         +LGsjvcpnCrOUhr5cMwsFn6pyoFOP09Sfyqt6fA6sFt2UHVUFrt/XH1KdTlQEelBUmdq
         nVyKl9c7jx+jBhZSNxYTS+bwSligsBTISOBwPBfRyKx0nwyRO/lDn6yO6cGms4tAXtXp
         nQB/zNyAb/tg4H6EtGiWM8DXz7m3GQrQ3LO3QEdQOS9wnDI//+xh2GdnJMWjdbrwsb0A
         lKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ctPsCQnCwOWC1BXWqxdnW65MNFL9SGWc9DV0HhUmFp8=;
        b=F2FoGKzMAM8CoukHPOZCpm05XqHm1nckue/77jpuRE+ntgMJeYU4H/6s5dHv4/Q6Ks
         gJOhM1oWHWwsIIIxHqu83SVBZrxKBiJ+DLGzWZCPv9RsvK48BNomLowA3wPlx7cQRZAs
         0/xURjPQUvSMKtx9m2znHojQvRlYnz+ksAROouhzZbZquc3s3VSiv+/jfNYq9Oq9rN2B
         ezORUImlMl7azGIuFlAhiNfOYjiYZ30MftRYthI0oKW2NXgCWbT9Etcj+JSHSGZNot0w
         Kj8OSuY6rw9WxutPPia4TLQLUXUKrjH4lfDu9i/4OBg+xXZkhZUXWB7i3jWnz8UOwZaN
         JgTQ==
X-Gm-Message-State: AOAM533mTNDyNHvHXe5pa2VpJbx+s+M3rbWPryZO3WO0lC/CZ8koaA13
	rIpZdY0KcqJQ7cgVje0e/LAXNw==
X-Google-Smtp-Source: ABdhPJxKk5KqRByjITyE6sC3mMa6jH/2QpqLo9/XviaZcs14zGBZ5ciDB+yJtGrNf83V/USGE/zOpQ==
X-Received: by 2002:a4a:bf11:: with SMTP id r17mr3859881oop.29.1626363172973;
        Thu, 15 Jul 2021 08:32:52 -0700 (PDT)
Subject: Re: [PATCH] xen-blkfront: sanitize the removal state machine
To: Christoph Hellwig <hch@lst.de>, konrad.wilk@oracle.com,
 roger.pau@citrix.com
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20210715141711.1257293-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <69452380-d55b-4329-73d4-151265351fc5@kernel.dk>
Date: Thu, 15 Jul 2021 09:32:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210715141711.1257293-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/15/21 8:17 AM, Christoph Hellwig wrote:
> xen-blkfront has a weird protocol where close message from the remote
> side can be delayed, and where hot removals are treated somewhat
> differently from regular removals, all leading to potential NULL
> pointer removals, and a del_gendisk from the block device release
> method, which will deadlock. Fix this by just performing normal hot
> removals even when the device is opened like all other Linux block
> drivers.

Applied, thanks.

-- 
Jens Axboe


