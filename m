Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AFF3DD72C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 15:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163089.298848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAY3o-0005t8-4b; Mon, 02 Aug 2021 13:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163089.298848; Mon, 02 Aug 2021 13:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAY3o-0005qx-0c; Mon, 02 Aug 2021 13:32:52 +0000
Received: by outflank-mailman (input) for mailman id 163089;
 Mon, 02 Aug 2021 13:32:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SgE8=MZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mAY3m-0005qr-UJ
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 13:32:51 +0000
Received: from mail-pj1-x1030.google.com (unknown [2607:f8b0:4864:20::1030])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86fdc286-2182-4faf-9a10-b251b659e0b4;
 Mon, 02 Aug 2021 13:32:50 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso24670145pjf.4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Aug 2021 06:32:50 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 f5sm11780560pfn.134.2021.08.02.06.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:32:49 -0700 (PDT)
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
X-Inumbo-ID: 86fdc286-2182-4faf-9a10-b251b659e0b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zaf+5dU3RLSl9eL+MQvIjvf9i9eq7xHute6xnxP/ss8=;
        b=lzLycDZx+VgbDgddV/I+3isOD43Vy0BkIdAf1yHmxOpy7/nQ2h/20I3MZKvLheRAfo
         bQGladbLi22o2mpFkEByG5LNltJK09xhP1gfAPOR8XF9Vgo3NEVD/jyTJznRBYBCRjq7
         mmnAa6JV8TPX7L6HR2Yw9fBKonGL4iSYr9ttnd9k3KcVWf/HnsrrQ0l71AwCJ07/uolw
         qMzfDw7EEeP/xzHEQK5KLJHSpIyFcZ1xwGqJvKS7M/hpYiX31RexDYDQYOH3f8znEAYa
         +gp0X5yO6CkoB7PtXKHyTPRWGAPzTrwFvh3JsjSYhcxB6xBY5Zyqb4DJ96A4xrQjjHm+
         1kNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zaf+5dU3RLSl9eL+MQvIjvf9i9eq7xHute6xnxP/ss8=;
        b=CSlwdJa2fL4n7NY6j7q8NGbsRoXOCIV2DqrlcSgDGQHkx5/yMfK/Z7clNAr98Rl8vg
         p5Fi8N5XlU0tP8kaiwoJ+F3BmHvqbLqkcugR4MF+ZRYwEKI6W7wCyJMSeKHDsI0PhOrz
         kuy3zDOJPnVFFI1lGlhW1W2hmovwzDGKPpTp61s94V5CpA0nudB0BlLVz4+SduqAMhvi
         8+38oiiqfV+YJ5CZzMQE7ZrBJfdhfEsqwA6ICY2XcHR2uh/YEZ9F7lIH6mjMQ/qF+HES
         DFWTwqt+FwxlSM/4qkS6CupBVLxC8lSSmmB9uO0bc9AnOj1xnfi4eg6FWbMYE5MJCOKo
         UZWA==
X-Gm-Message-State: AOAM5315755iDLntzfpJkwBAkvJiBgi2g82ja+cU3E2YdOCWAZnTJBPV
	MBK29cSuMGtp/CUPMu3DO4w=
X-Google-Smtp-Source: ABdhPJw26TcdJx7nJdP8OVOffK3BNROQGPQJnGpjzP8q2wSE+WsIrRM3Kk21HhrucVZR9IjyKRevpw==
X-Received: by 2002:a65:6a01:: with SMTP id m1mr1550797pgu.201.1627911169578;
        Mon, 02 Aug 2021 06:32:49 -0700 (PDT)
Subject: Re: [PATCH 06/13] HV: Add ghcb hvcall support for SNP VM
To: Joerg Roedel <joro@8bytes.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, will@kernel.org, davem@davemloft.net,
 kuba@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
 arnd@arndb.de, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, ardb@kernel.org,
 Tianyu.Lan@microsoft.com, rientjes@google.com, martin.b.radev@gmail.com,
 akpm@linux-foundation.org, rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, anparri@microsoft.com
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-7-ltykernel@gmail.com> <YQfnlBwyZUJyixQX@8bytes.org>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <436a4eda-bed2-9107-e297-3dee381354ff@gmail.com>
Date: Mon, 2 Aug 2021 21:32:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQfnlBwyZUJyixQX@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/2/2021 8:39 PM, Joerg Roedel wrote:
> On Wed, Jul 28, 2021 at 10:52:21AM -0400, Tianyu Lan wrote:
>> +	hv_ghcb->ghcb.protocol_version = 1;
>> +	hv_ghcb->ghcb.ghcb_usage = 1;
> 
> The values set to ghcb_usage deserve some defines (here and below).
> 

OK. Will update in the next version.


