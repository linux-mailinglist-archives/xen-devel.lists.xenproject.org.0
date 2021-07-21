Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0B23D14A6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 18:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159457.293325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6FTc-00047L-L4; Wed, 21 Jul 2021 16:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159457.293325; Wed, 21 Jul 2021 16:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6FTc-00045W-I4; Wed, 21 Jul 2021 16:53:44 +0000
Received: by outflank-mailman (input) for mailman id 159457;
 Wed, 21 Jul 2021 16:53:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UdBc=MN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1m6FTa-00045Q-S9
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 16:53:42 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8c90d1a-a5ee-4915-b11f-58a8c6330ebc;
 Wed, 21 Jul 2021 16:53:41 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d2so2964778wrn.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jul 2021 09:53:41 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:d056:9219:797d:dc70?
 ([2a00:23c5:5785:9a01:d056:9219:797d:dc70])
 by smtp.gmail.com with ESMTPSA id y3sm27703954wrh.16.2021.07.21.09.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 09:53:40 -0700 (PDT)
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
X-Inumbo-ID: c8c90d1a-a5ee-4915-b11f-58a8c6330ebc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n7t3GhqlutTbX8xfbSEoGEk87Bn0XqLJSiPGh2BUojY=;
        b=EFmJRwQPCf7e8HEUNlwbQo5yc6owicTr8lVAsfRr7DK080j6LP0KxHcd0XkPZSwydh
         CjQAIiIrb6Cpor8rZve6qR2Aoq4oTSMkbU2o0ZswDXhlX+ILqYTuBqThN5SMHUxd7cAx
         RYuii0PQfxg2nZwZVD9Q4QaE4X8/Ufk/l47dldI4TUwGEDMidaTIGDXEkxBYqBRJV0kX
         6RC7iU4opD68jdYhuOjcWv+W1rdE8QoZcOWaFPWlvu1Pzr7E3PwmdJzL+Q4oIHioqpY1
         TH2SBRUDAJI9AgaTo3vnL+rxR00staYXzabopNX1AXJZTsdZF9iWeAqOD/az0rDrbfX4
         8o6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=n7t3GhqlutTbX8xfbSEoGEk87Bn0XqLJSiPGh2BUojY=;
        b=IzHE3rdL83cPZgw8LLn95aTNPUV1evRV1Z+fm/mi+8d1pbSDwTrdgn9Iw0RF9WIpIw
         T1NhMNEIROIJqLR8IGyFYzLjGED3dOkOLYaEg5gV7fCQn75+1jAGGNUEog2wpSfYSFEG
         aEI0kXyDxoNqIDq9P+TnSApL+A5htUkLCzbYSCLHeK8Tq8LWv202moqnKGIEvA5NoX5a
         YSwSoCOmN3oTHInCa+u9IXk6uqCitChOUS5wbyJZrU97tKORyuZ/YOc+7/JGYhio8wtL
         rRJjgB4DA0L6i5r/WddkyomXmyXOoTraxJeYYs61hr7YPOPI3HfQWo6681lLPsSQU+OE
         NmFA==
X-Gm-Message-State: AOAM530qQciJBp+mKjstItokIovcheEsATtYt8A7dKT86lw2iu/krpiH
	fs5db9dGpKYj/Hmrnkbnfp23Zohe0SM=
X-Google-Smtp-Source: ABdhPJzxazDRghtRwtQUay1mhnGdHclPiMZmGnRVxAF+yazcO28nMMv5ofKZ1ifqx878+uMFtF9ObQ==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr42928038wrv.403.1626886421120;
        Wed, 21 Jul 2021 09:53:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: your change "iommu: make map and unmap take a page count, similar
 to flush"
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <185f185b-443b-bea4-5068-b9ed763a4c2f@suse.com>
Message-ID: <0553727e-5dd3-23d1-6698-01b8bcb5dd1f@xen.org>
Date: Wed, 21 Jul 2021 17:53:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <185f185b-443b-bea4-5068-b9ed763a4c2f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21/07/2021 16:58, Jan Beulich wrote:
> Paul,
> 
> the description of this says
> 
> "At the moment iommu_map() and iommu_unmap() take a page order rather than a
>   count, whereas iommu_iotlb_flush() takes a page count rather than an order.
>   This patch makes them consistent with each other, opting for a page count since
>   CPU page orders are not necessarily the same as those of an IOMMU."
> 
> I don't understand the latter sentence at all, now that I read it again.
> What may differ is the base page size, but that affects counts of pages
> and page order all the same.
> 

Hi Jan,

What it's supposed to mean is that a CPU may e.g. have page orders 0 
(4k) , 9 (2M), etc. but the IOMMU may not use the same orders. And by 
page count it means a count of (CPU) order 0 pages (which I assume all 
IOMMUs will support).

> I'm intending to make an attempt to cut through the page order (or
> count) to the actual vendor functions, in order to then be able to
> establish large page mappings where possible. In all cases (perhaps
> most noticable on Arm) handing them a page order would seem easier, so
> I was considering to have iommu_{,un}map() do that step of abstraction
> (or transformation). But since you did explicitly convert from order to
> count, I was wondering whether me following this plan would cause
> problems with any of your further intentions back then.
> 
> If we really wanted to cater for base page size varying between CPU and
> IOMMU, besides the IOMMU vendor code needing to announce their value, I
> guess we'd have to do quite a bit more abstracting work, as it would
> matter to outer layers in particular if the IOMMU base page size was
> larger than the CPU's.

Yes, if the order 0 page size was different between IOMMU and MMU then 
that would clearly be more tricky to deal with.

> Supporting just smaller IOMMU base page sizes,
> otoh, would seem entirely feasible to deal with inside the rework of
> iommu_{,un}map() as mentioned above.
> 

Yes. The aim of the patch was really only to make the calls consistent. 
Changing all of them to use an order rather than a count would be ok too 
I think.

   Paul

> Jan
> 


