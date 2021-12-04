Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD944468323
	for <lists+xen-devel@lfdr.de>; Sat,  4 Dec 2021 08:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238055.412798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtPN2-0006cF-2A; Sat, 04 Dec 2021 07:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238055.412798; Sat, 04 Dec 2021 07:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtPN1-0006aH-V2; Sat, 04 Dec 2021 07:22:07 +0000
Received: by outflank-mailman (input) for mailman id 238055;
 Sat, 04 Dec 2021 07:22:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Auw7=QV=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mtPN0-0006aB-Ql
 for xen-devel@lists.xenproject.org; Sat, 04 Dec 2021 07:22:06 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1ba1dd5-54d2-11ec-8a4d-196798b21f7b;
 Sat, 04 Dec 2021 08:22:05 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so6898509pju.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Dec 2021 23:22:05 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 t10sm4331860pga.6.2021.12.03.23.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 23:22:03 -0800 (PST)
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
X-Inumbo-ID: e1ba1dd5-54d2-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZkQEYozmB0wgYJcxDO/m983AAdy8n14FhucCaGoUzA4=;
        b=blREAYP23qBjIahcqczEuNSUq6MRbQ5UXgW1oG4ZGSSpOed90dbanN+LHvJF7N6ME0
         Y9LKoSwodHr9BOd//+DW6OvBPSh6Rf4BdMb2EzDvtQ+sVoes1f6+7VWyUKFWqiaSHHqU
         Am+FtOCVPnOAgj6oTP0k0IWgh4dooTt7QX7KQKbCT+o69WR7nP4hJQspPwFm25qXtPCW
         kBdkmADgMPc7HTKvYOavrblwjUfXQ3wlSxkW6E/shgs8QAhLWvPBZ3tVRmEVD7CWY44S
         t8LTdIFpatSjby01xMjLjf42MSd1m5DtLtC+1uS3bLpAx3vREm/i+1aUCO81LPZgXzuP
         nkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZkQEYozmB0wgYJcxDO/m983AAdy8n14FhucCaGoUzA4=;
        b=nf5g6E9l0jkGlu+hSpcdacZnlMwQoW+j1n92qFeeZV1RS0kl+idSmLGj2yMYnUYQlN
         5uK5bMpYx641iLflehuyUJG+f7gpxaKZUEIEz9WU1phpiyCzLfQI9YUYBFIX02ZeWhr/
         jlX+JumoLx0sKeWAvzOP18GzGzcMwNO2SRkWlFjVgjlxWNUaee/e/iQoAb63FVbA6Ufq
         9vVsbqQ3g11hHvs4LoFlh6eZ3dq7STb8hMO3oJ/dG5t8DrF/uS6qoSY4g/4P1PccBsmZ
         tzWRqdcIA9Sgez0krnZAfJ5hIk2pEpMvL9NuDLgjGa8arclp4S0iSrFfNJBv84i2CJT0
         GzRA==
X-Gm-Message-State: AOAM533+tJyPsWCfPudRygLLBES0gX3roGbAi/wnAEXMPaUZVcgeGV9p
	zRRg4GSpDTTp08FFqNsipAo=
X-Google-Smtp-Source: ABdhPJzcZuwuxSGpXoC+LpAfScg+HY+PAZl5x85Fy3cmkRF8TnHHjxYQIiUVC9++sZKTL0nxBihlXA==
X-Received: by 2002:a17:903:1105:b0:143:a593:dc6e with SMTP id n5-20020a170903110500b00143a593dc6emr28523850plh.6.1638602524291;
        Fri, 03 Dec 2021 23:22:04 -0800 (PST)
Message-ID: <59e41c28-260f-876d-c7cf-a13669ad8984@gmail.com>
Date: Sat, 4 Dec 2021 15:21:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V3 1/5] Swiotlb: Add Swiotlb bounce buffer remap function
 for HV IVM
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, jgross@suse.com,
 sstabellini@kernel.org, boris.ostrovsky@oracle.com, joro@8bytes.org,
 will@kernel.org, davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@infradead.org,
 m.szyprowski@samsung.com, robin.murphy@arm.com, Tianyu.Lan@microsoft.com,
 xen-devel@lists.xenproject.org, michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 brijesh.singh@amd.com, konrad.wilk@oracle.com, hch@lst.de,
 parri.andrea@gmail.com, dave.hansen@intel.com
References: <20211201160257.1003912-1-ltykernel@gmail.com>
 <20211201160257.1003912-2-ltykernel@gmail.com>
 <41bb0a87-9fdb-4c67-a903-9e87d092993a@amd.com>
 <e78ba239-2dad-d48f-671e-f76a943052f1@gmail.com>
 <06faf04c-dc4a-69fd-0be9-04f57f779ffe@amd.com>
 <1b7b8e20-a861-ab26-26a1-dad1eb80a461@amd.com>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <1b7b8e20-a861-ab26-26a1-dad1eb80a461@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/4/2021 4:06 AM, Tom Lendacky wrote:
>>> Hi Tom:
>>>        Thanks for your test. Could you help to test the following 
>>> patch and check whether it can fix the issue.
>>
>> The patch is mangled. Is the only difference where 
>> set_memory_decrypted() is called?
> 
> I de-mangled the patch. No more stack traces with SME active.
> 
> Thanks,
> Tom

Hi Tom:
	Thanks a lot for your rework and test. I will update in the next version.

Thanks.

