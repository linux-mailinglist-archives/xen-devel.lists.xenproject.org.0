Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B7752BC09
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 16:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332236.555893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKSx-0007Nv-LX; Wed, 18 May 2022 14:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332236.555893; Wed, 18 May 2022 14:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKSx-0007Lz-IJ; Wed, 18 May 2022 14:15:55 +0000
Received: by outflank-mailman (input) for mailman id 332236;
 Wed, 18 May 2022 14:15:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/jlq=V2=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nrKSw-0007Lt-3m
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 14:15:54 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 069e556c-d6b5-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 16:15:53 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id r23so2944825wrr.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 07:15:53 -0700 (PDT)
Received: from [10.7.237.10] (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adfa703000000b0020d012692dbsm2612394wrd.18.2022.05.18.07.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 07:15:52 -0700 (PDT)
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
X-Inumbo-ID: 069e556c-d6b5-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d7pEXmTo1+jiC7c+dMQN/V6wcBYB/n6I1A9uTMxvqzc=;
        b=SpXrkSX72TbuPz7ojR/Ldx05LOgm+AGpVQbA7WJnZBm2bg6FPwO5ACMYPgYxA4kc87
         ohtP2rmJ31797NxKKHkKst5jtttgQHwsqsaud/nBWe2M19FGsKasgCa2XLDsoddIFaeA
         9UVfQJbCG5K4a064/Nl5fSID2RpHnrvP0ZttXbypIZffVYVievJkeezfCKRPaVWtUSUi
         BbeHpEaBpJteBFb/9es4xEwOO741NuVP9vokDl9D1+dCuoW7T2vLYx140ttkA/lpnp5l
         7sIL0Pi2ZpmHFk4Dk0XBl7BFve9Fxkqw4vcwxY02qp4Ls44CAXCQ7IrhP02UCd6GhzXq
         tJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d7pEXmTo1+jiC7c+dMQN/V6wcBYB/n6I1A9uTMxvqzc=;
        b=MnMnPwMMZEqguG9HmRK4TLV2k1ayrhNxxbuAedpZhxqWv1FXsuu/KDlT7YbdbYKomV
         AU2uoLkK498aMC9xmJlor6ADtrEBCmxiCxVgKPvBDCGvtkyCiU5ItjdnsqLQr/jTi51W
         ybq8/KzqsSj1QZMpI/3Bu6VN8bky6dzZci8krsRxpJrH06js4UgVoFRNjS/gTtoLPBvK
         ssJZnX0nVqq8EAd44a11CaseBjx0szqeJ+0rkhYAMTGhaddjDmQv32ETI515Vp50j4U/
         OdOlSiwhlFK19hbK8DGFC7px3W8hqGlX6dbyQST6LnroVpE+Ggat9849ANPRDp9ioiAN
         opGA==
X-Gm-Message-State: AOAM533gyvkKPcRw5jqcOocDuZoD3FKpzYL6jhL5Vdjhts2QRR/KpJr3
	rSiKpFfmDzZyDjN3wKq+dZI=
X-Google-Smtp-Source: ABdhPJzmThoM72mKnHEu4QLQg1pD5emjxOEDlYr9k77eHYKaKqSy9x9l3kGrAdZArAWXoyZniGuv5Q==
X-Received: by 2002:a05:6000:1868:b0:20c:95c4:ed9a with SMTP id d8-20020a056000186800b0020c95c4ed9amr23219040wri.243.1652883352673;
        Wed, 18 May 2022 07:15:52 -0700 (PDT)
Message-ID: <f7e1a658-202e-7297-b1d5-8b18bbac8396@gmail.com>
Date: Wed, 18 May 2022 15:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] block: get rid of blk->guest_block_size
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Xie Yongji <xieyongji@bytedance.com>
References: <20220518130945.2657905-1-stefanha@redhat.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220518130945.2657905-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/05/2022 14:09, Stefan Hajnoczi wrote:
> Commit 1b7fd729559c ("block: rename buffer_alignment to
> guest_block_size") noted:
> 
>    At this point, the field is set by the device emulation, but completely
>    ignored by the block layer.
> 
> The last time the value of buffer_alignment/guest_block_size was
> actually used was before commit 339064d50639 ("block: Don't use guest
> sector size for qemu_blockalign()").
> 
> This value has not been used since 2013. Get rid of it.
> 
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Xen part...

Reviewed-by: Paul Durrant <paul@xen.org>

