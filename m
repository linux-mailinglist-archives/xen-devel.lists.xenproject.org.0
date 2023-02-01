Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9983C6861A8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 09:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488197.756165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN8VW-0003pr-7V; Wed, 01 Feb 2023 08:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488197.756165; Wed, 01 Feb 2023 08:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN8VW-0003nF-4j; Wed, 01 Feb 2023 08:30:18 +0000
Received: by outflank-mailman (input) for mailman id 488197;
 Wed, 01 Feb 2023 08:30:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYYs=55=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pN8VU-0003n6-2N
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 08:30:16 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a66d1e21-a20a-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 09:30:14 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id k16so12049747wms.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 00:30:15 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 f31-20020a05600c491f00b003dc3d9fb09asm922456wmp.47.2023.02.01.00.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:30:14 -0800 (PST)
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
X-Inumbo-ID: a66d1e21-a20a-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/e7owFfcePnLRzxpORdL+Ugp/T7FuArUHTWMklHSZE=;
        b=EHcHSKQDWrNLfrV+Zaa/V6XU/gSZoD0Nre3JE13SUBQh3px4OSMGL+aMGglogy5m4G
         T5/0+KUbLG5vUwYM0WZEJrMxk029b7oaDq96zZ9p+akCHZBRfL79n3bYkbwR1sDSzXsz
         daQko7c6Q07LbIjQADi4sTGv44JTGn9W8gRgt1tApbYSYuu2ddh3IGDOv4nvaPtV5vuD
         iF7KUbJIxQoU8Voq/qIFP7yvkLopvYsGlltoguRNw8y0RRWzW5jECBSxRd+y+1ehGaC/
         GnGELYZ/vMMGOaJPdbRakzxkSc8RfBdP570p5tYDV6PWqGr9cBuUNKlZrS8g6P7MbXYo
         EiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/e7owFfcePnLRzxpORdL+Ugp/T7FuArUHTWMklHSZE=;
        b=AngwNeK6oqaSD+b9YhtWA/SsXNVKUlSTRde7qsudocfgiy4St4bNcniSUq7jULEYeX
         TklcTL/51I1T76z8We9YTWLnAXD3SaGxRjM5OQXzCHhebxujhbFp3fhA6QBBmGZmKnwb
         IGgGcbb9USos6cPW6oZIz23jtLfB4E31pXl5XORECTKkdQlWfZ5VBg6bsRadhxDjL9Yi
         32vBaBcD7DretVFhzBdzCU+ZyA85hj6gr5zUi6yHWoqTQdXiq1CjcLvgwVQayg5EkVBi
         TJGOBcCjq6ftNe513xzV0ooi1h6vkUVeQPOfP3+U1kbkNNp1+HZSBE8e3t+uZ7qFM1Uh
         sjUw==
X-Gm-Message-State: AO0yUKXEa8O/J93F6F/FW8YOyiBg7S1sg5DIUHI+CWMtKQ+uZZar9L0N
	9v7HGJlfycPXGmS5Diog3uA=
X-Google-Smtp-Source: AK7set8U7h6JgTIUz/GSAXKxVEMdwMw6uPhYD8pbylUmygyycWG1uyrxwtyWU9ELgp5Jz13+EJJG8w==
X-Received: by 2002:a1c:7c0e:0:b0:3dc:561a:79d8 with SMTP id x14-20020a1c7c0e000000b003dc561a79d8mr1285631wmc.35.1675240214862;
        Wed, 01 Feb 2023 00:30:14 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <179d773b-2634-b52b-8836-8d8f882e1495@xen.org>
Date: Wed, 1 Feb 2023 08:30:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Reply-To: paul@xen.org
Subject: Re: [QEMU][PATCH v5 09/10] hw/arm: introduce xenpvh machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-10-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/01/2023 22:51, Vikram Garhwal wrote:
> Add a new machine xenpvh which creates a IOREQ server to register/connect with
> Xen Hypervisor.
> 

Is this really the right way? Is it not possible to do the Xen 
initialization (including ioreq server registration) off the back of the 
accelerator init (i.e. AccelOpsClass ops_init function), which seems 
like the right place to do it now that it's no longer architecture specific.

   Paul


