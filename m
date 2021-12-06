Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F50469866
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:14:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239042.414307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEkv-0003Y2-4B; Mon, 06 Dec 2021 14:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239042.414307; Mon, 06 Dec 2021 14:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEkv-0003Vf-0z; Mon, 06 Dec 2021 14:14:13 +0000
Received: by outflank-mailman (input) for mailman id 239042;
 Mon, 06 Dec 2021 14:14:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmDh=QX=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1muEkt-0003VX-Jr
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:14:11 +0000
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7c2ecc1-569e-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:14:10 +0100 (CET)
Received: by mail-pg1-x52f.google.com with SMTP id g16so2155472pgi.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Dec 2021 06:14:10 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 pi17sm14658528pjb.34.2021.12.06.06.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 06:14:08 -0800 (PST)
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
X-Inumbo-ID: c7c2ecc1-569e-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LG+zF8eXNnqFsGFKA2ZTnXSPUueJWK5YxbpbucSufXI=;
        b=mQqUkA3xIsQY4XmQYBzGNmYRws6Q0JrMJpuTq/VEAZ58elCNocHbrP8QMV+4phw9Ut
         vWKeJdfRRl2H6A3/U0ZfFrg46WCHuxCz5sAlIyGUXSN9dXWnqcoQP+R/jmprw5bfpFHj
         fKOmzAhbS2g+OM1Z5BI3nXKStQ11a7SSrQ5tFd6125uR6KPjsGJebIfx224pdX+EvGle
         FqorCYj7anmbSaX4e41EWyvuvtjfgov84k+oRDD0xrawuDr2dYvzxxLjG9dUVswmsHTE
         elai+rbP43KznXg+HMIMYpPzORZYpPi24LOHZHh8JFVSoiDVYRN7mdHXVcauIlegBAj5
         mHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LG+zF8eXNnqFsGFKA2ZTnXSPUueJWK5YxbpbucSufXI=;
        b=r98KrEc38Hzri2/oRGLEkOaZL/30z0HumrkPB5CuWgUjsCzjXT7KsnwxLmNGWv4CcC
         tMxUeXZxx9uL4Pi7u/8hWnhsXIDMZZlUNt/GQ0IjxKUUlbUfdSbTjRo+N+OeqsOUIS9V
         0akAS7UJiDow85pTnWvzfLXJJGnHvcARKLv6tnuQs77RB5qH43RSYLSBgVYGIydnKOxD
         OL2PN5cMtDzKeav8UqCxOproZwJ8a/ZSmn48Ysp1uwIO/qiKKopnAL+DQZjMXoNgO4y5
         S3zL1/h0nsLNysL6YuomTpidGEHq+HrkIgrqrB/QAfGy0poW3YIUD3OZn892My3rcfi+
         wjjQ==
X-Gm-Message-State: AOAM532ean8g3neAcsK0RnMfnAjxcobLkL8Lbq6xFhZ8My1SPK0TWGGk
	h0WXNeV2K3ZHxc6Uj7ZuVWo=
X-Google-Smtp-Source: ABdhPJySAj+QT4OHzaoYLk1cSWHqCc54qgRjOngjnxP5g2RiZmDR4g0TxiHn1EhVWrwC669mfsgWOQ==
X-Received: by 2002:a62:7e4c:0:b0:4a2:678e:8793 with SMTP id z73-20020a627e4c000000b004a2678e8793mr36890086pfc.75.1638800049309;
        Mon, 06 Dec 2021 06:14:09 -0800 (PST)
Message-ID: <4d9049eb-d3a8-3872-c4c3-4ad41d93b58c@gmail.com>
Date: Mon, 6 Dec 2021 22:13:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V4 2/5] x86/hyper-v: Add hyperv Isolation VM check in the
 cc_platform_has()
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
 <20211205081815.129276-3-ltykernel@gmail.com> <20211206140651.GA5100@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <20211206140651.GA5100@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christoph:
	Thanks for your review.

On 12/6/2021 10:06 PM, Christoph Hellwig wrote:
> On Sun, Dec 05, 2021 at 03:18:10AM -0500, Tianyu Lan wrote:
>> +static bool hyperv_cc_platform_has(enum cc_attr attr)
>> +{
>> +#ifdef CONFIG_HYPERV
>> +	return attr == CC_ATTR_GUEST_MEM_ENCRYPT;
>> +#else
>> +	return false;
>> +#endif
>> +}
> 
> Can we even end up here without CONFIG_HYPERV?
> 

Yes, I will update in the next version.

Thanks.

