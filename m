Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E611469874
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239055.414340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEnl-0005Lr-5W; Mon, 06 Dec 2021 14:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239055.414340; Mon, 06 Dec 2021 14:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEnl-0005J9-2V; Mon, 06 Dec 2021 14:17:09 +0000
Received: by outflank-mailman (input) for mailman id 239055;
 Mon, 06 Dec 2021 14:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmDh=QX=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1muEnj-0004et-4h
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:17:07 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 308f6e8f-569f-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:17:06 +0100 (CET)
Received: by mail-pf1-x430.google.com with SMTP id g18so10286237pfk.5
 for <xen-devel@lists.xenproject.org>; Mon, 06 Dec 2021 06:17:06 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 d6sm10030597pgv.48.2021.12.06.06.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 06:17:04 -0800 (PST)
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
X-Inumbo-ID: 308f6e8f-569f-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MlPjTzqAzGMiJV1XIvo3CWuIKKPvCgUAVf8fFzgqOVA=;
        b=aUNHCl+dyTHAibi55HobGp+ZEySdQG08OEI+Y5k9nKK1X7xf+qtKsmguZgkbi+whPm
         GdJx9SeuhwP2ruODw9GfMgbHlzGk1gA6u4kF0GNnRTEbqTtzWhv5aQOvFkSisqrp80Je
         AuiZLyvBxRbWVKNJfUOgUEgQe+/ruz2KLZzOD08be7j/r8WHZNcwGCfhgny3RP1zHKHA
         1KDnGlCjbWtR+gN0SkVDdYDBRV83mT0qrFufECTGnYo50zNSja6vhsEoHMcB7bAvEpfm
         2tJ0a1+Qw3wjhe2hKKQCf2+fKGAqtRWFQXDtWW6xNYHAMZ+JXZUxTRR80tunhwvY2yh9
         HWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MlPjTzqAzGMiJV1XIvo3CWuIKKPvCgUAVf8fFzgqOVA=;
        b=uAY+zmvbsLUciXB0+mBoaDn4opAxITg35DZzi+BHJIXWNnK7U+GaDDoFOBwzvuFMAC
         K08dqzYRPbVwRUus94dJgkFzdYMNLnC7umO4Y2FiK6n3Sjh+hSCLUzaVXspupwypB8Vy
         WlGRlL20gY2SduaIy+yNZZHfoxfNsjdLRextcktri8vH7t+Fyct+zWbSPxEihH1F2VKa
         wg0THv/NLAPVzA2pexMxITWE470Wb4sVww/4ZtH5kb+OQlxzR8VFQ0BfYBQvdSGmPzmJ
         iAIKtMkyvgLHPilrIf0LdgYXzFUVGjS64fd/m8oHSLRZhQvNdeT9D+JrOqFu34lQMde9
         2ZGg==
X-Gm-Message-State: AOAM533Z9av51ene6YD2vXld1XBxE8rv/NK0hSTUyLu8bcZFRyxj2jH9
	dpb5ehkuI9vr4BVtMyxRZsM=
X-Google-Smtp-Source: ABdhPJwC0KD/zVGir6spSXosBbRFLHsih0Tulm1FqYapzoO5PMARObP84mGb9GeA31fKmf/7FDoFjA==
X-Received: by 2002:a62:1cc4:0:b0:49f:99b6:3507 with SMTP id c187-20020a621cc4000000b0049f99b63507mr37506196pfc.76.1638800225207;
        Mon, 06 Dec 2021 06:17:05 -0800 (PST)
Message-ID: <ed333f81-0527-ae98-6348-a2bf6e783dae@gmail.com>
Date: Mon, 6 Dec 2021 22:16:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V4 1/5] Swiotlb: Add Swiotlb bounce buffer remap function
 for HV IVM
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, jgross@suse.com, sstabellini@kernel.org,
 boris.ostrovsky@oracle.com, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@infradead.org,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 Tianyu.Lan@microsoft.com, xen-devel@lists.xenproject.org,
 michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, brijesh.singh@amd.com,
 konrad.wilk@oracle.com, parri.andrea@gmail.com, dave.hansen@intel.com
References: <20211205081815.129276-1-ltykernel@gmail.com>
 <20211205081815.129276-2-ltykernel@gmail.com> <20211206140916.GB5100@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <20211206140916.GB5100@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/2021 10:09 PM, Christoph Hellwig wrote:
> Please spell swiotlb with a lower case s.  Otherwise this look good
> 
> Acked-by: Christoph Hellwig <hch@lst.de>
> 
> Feel free to carry this in whatever tree is suitable for the rest of the
> patches.
> 

Sure. Thanks for your ack and will update "swiotlb" in the next version.


