Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A45E7D7E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 16:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410798.653955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1objwR-0005OT-5s; Fri, 23 Sep 2022 14:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410798.653955; Fri, 23 Sep 2022 14:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1objwR-0005M2-3A; Fri, 23 Sep 2022 14:46:11 +0000
Received: by outflank-mailman (input) for mailman id 410798;
 Fri, 23 Sep 2022 14:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/q9Q=Z2=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1objwP-0005Lw-FH
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 14:46:09 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 757fa0c5-3b4e-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 16:46:08 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id z6so389514wrq.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Sep 2022 07:46:08 -0700 (PDT)
Received: from [192.168.18.134] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 bn20-20020a056000061400b00228d7078c4esm7802940wrb.4.2022.09.23.07.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 07:46:07 -0700 (PDT)
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
X-Inumbo-ID: 757fa0c5-3b4e-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date;
        bh=5dKyLNAFPtIfqdPRxJaoTYKZE22uPEk/oKvtZ7XZNlw=;
        b=aHUmLESOnd6l5fs1LbJ7b58jWIGTGrZl1zlxag2mItvwsAPmb2fI82iPWXjJssLr5x
         DFeqNib4sBFuDCdHwnwzYPM/ih4K4da1t7mRHYOstLV4GzuLchrsbcx5jaU+lESyWkX8
         GuisRZErGcTLprnN9X1svgif8XRgaVRaek+sOySR7PABgDBVLzxBc/UhGxRjNiqvm7k5
         JyDGSgi0Al6X1EswaPKjGFHbD5qYen4TNBGxHaeiWmV+oATxlKGyI6nppJBK0SEGNq1F
         ZjbgAbef9oEI4ifu3yEemaEo3muQhmFjz4cHUt9EIqo7+jNVbonThkJ0hjwdKNkWG8Sr
         daNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=5dKyLNAFPtIfqdPRxJaoTYKZE22uPEk/oKvtZ7XZNlw=;
        b=ez7LKPhIHYMmkseE3iHnKENksTbv6ACfFb2b3y+xQSs1YxneblIo5S8ICfBxQ6oPME
         7scCq28kMZ0lRVc8djcM6XeatpO5zk4JNGMW7dbsXdSNkywXhVfmeAXBguFl+fQYOQkf
         BYKZqvarK0mh7nRWAmi45lPvCEL1J7bXzeYPh6zCueVAIJx9GGJ68lwpX2iOlcbebuHA
         y3HT1MJ4AyEnvzv0pf0q3sIX2PI9ljhWFyMsTL7tu/JwyBZzWIpnONiATOpReUizJZ2v
         S3AqZgPjsi/ipqivkJR0hONvWnfj4/5zz0DDo1l01q6obF7Nu4xyKBXnMSA5WLougPfk
         /YcA==
X-Gm-Message-State: ACrzQf1XZ7s0f7JxWMzrj/RrGvA2MlP3jVOaYK4eZSSHOn36W4hp7XmB
	TGxhXU3QmKZLMWoZ6xPUcjHPDKGRWFxivQ==
X-Google-Smtp-Source: AMsMyM644IWpNcCUyKNNjeR1BeZbOK+8PjEujJrEDKRnHF6/c7RyzMJjqy6Btsawj0Q+mEyuBilvoA==
X-Received: by 2002:a5d:5591:0:b0:22a:e401:2052 with SMTP id i17-20020a5d5591000000b0022ae4012052mr5586519wrv.435.1663944367742;
        Fri, 23 Sep 2022 07:46:07 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b500092c-a711-9ff3-b752-ce4a0b114727@xen.org>
Date: Fri, 23 Sep 2022 15:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
To: "Ji, Ruili" <Ruili.Ji@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>
Cc: "Liu, Aaron" <Aaron.Liu@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
 <8be84a25-c31d-fd88-f913-c03c15046a55@xen.org>
 <BL1PR12MB59937394D936EE7EDF5E3F809B469@BL1PR12MB5993.namprd12.prod.outlook.com>
 <DS7PR12MB60068137A02E32BE77526E439B4F9@DS7PR12MB6006.namprd12.prod.outlook.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <DS7PR12MB60068137A02E32BE77526E439B4F9@DS7PR12MB6006.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/09/2022 02:19, Ji, Ruili wrote:
> [AMD Official Use Only - General]
> 
> Hi Paul and AFAIK:

^^^ you mean Anthony :-)

> 
> Thanks for your help.
> When could we see this patch on the master branch? 😊
> Our project urgently needs this solution.
> 

Anthony? Ping?

   Paul


