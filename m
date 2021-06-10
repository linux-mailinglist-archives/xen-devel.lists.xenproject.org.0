Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA13A2DD5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 16:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139923.258625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLTX-00056t-D0; Thu, 10 Jun 2021 14:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139923.258625; Thu, 10 Jun 2021 14:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLTX-00053r-8s; Thu, 10 Jun 2021 14:16:03 +0000
Received: by outflank-mailman (input) for mailman id 139923;
 Thu, 10 Jun 2021 14:16:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cwq8=LE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lrLTV-00053i-No
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 14:16:01 +0000
Received: from mail-pg1-x536.google.com (unknown [2607:f8b0:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0040e02-451b-4e69-a615-a25f5f320783;
 Thu, 10 Jun 2021 14:16:01 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id e22so22678353pgv.10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jun 2021 07:16:01 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 f6sm2629239pfb.28.2021.06.10.07.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:15:59 -0700 (PDT)
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
X-Inumbo-ID: b0040e02-451b-4e69-a615-a25f5f320783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z06P6xfCZfBoLzLGshR2eXD11imPLnqUoouenixaYFw=;
        b=APiM6yjkYAKij1RjMOo9hW4vLGKN36RaoDPpCZzJkgCIWIc5bNnUPRKfG+5uelh6im
         ZwmwB/K2y2Z+UnBHFw6Ok84giPqAWtESqJu7RLH3vi1s6Wmdl12YoCN5FEDC7FxVL8S3
         xBQJ/O0hMPtGsBtUowS8mRCmJHg4qC1j99bvIODTP9XmlSIGPDf9QrQ49kI/Ur72auK8
         XR3tyDiPInVQQ5Wc5igpAdJ+WpQK2Nh7QdvgHpHFXPPDhb1Z06nj6QGPTXJjDDNCczPn
         w4fJFgDDWFpzxBgC5Dh+DND5ldxosu/Bv7P7MHz+0qfPe5TrP3iyAg6tpfZqrx3I67eW
         JLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z06P6xfCZfBoLzLGshR2eXD11imPLnqUoouenixaYFw=;
        b=CtMxXyLFHIPIiiw7IJp3+thvCn7qW/oEkjUwfM6dTfi6pLAYdvsUdv15Ln1q+T/YGY
         pi+bTHqdpcFqO4Xrl0HP3Wx54TYymQfV+BRcqAtCpTMkLMBCe/J7OLx94NYYfLCgQR43
         HZ9SRuP49wnSJbCxZBWvnPXsmOOO9K7P6VWqDFnpeUnCAaIik4ihdeFETgu2kY7wNLrb
         H/QlOr2eM9gXQjoS/LjSRer/TgI42viSSfIkPWB4YsOdN3Jvb9d2lVVdlCkbkaV3XmFw
         Pu/ltqgxMaTSWvJEfddc2AhbBR8fTJEisyqqkUYMsU7fdVj3qYojZir6OVTSGTlFSUZl
         /sSQ==
X-Gm-Message-State: AOAM530x+QM+7w39BqJ3rb2k9teRPWsAUBVLr+zhvoQgshjcB8prZuXa
	zmHfir8HU+WbgwS6uz7eZ8I=
X-Google-Smtp-Source: ABdhPJzmTLyJiMIH7/kQoP6L+VhlUA+7RnmijLx7oWBaXhPdpzGgcAEZV6BSepEVhxfy3ZoxIY2hkg==
X-Received: by 2002:a63:4e20:: with SMTP id c32mr5182730pgb.104.1623334560354;
        Thu, 10 Jun 2021 07:16:00 -0700 (PDT)
Subject: Re: [RFC PATCH V3 04/11] HV: Add Write/Read MSR registers via ghcb
To: Joerg Roedel <joro@8bytes.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, will@kernel.org,
 xen-devel@lists.xenproject.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-5-ltykernel@gmail.com> <YMC4JdtYO+eLDKh5@8bytes.org>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <bd84a1a1-1dae-1dc0-8175-ed8bf19e705c@gmail.com>
Date: Thu, 10 Jun 2021 22:15:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMC4JdtYO+eLDKh5@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/9/2021 8:46 PM, Joerg Roedel wrote:
> On Sun, May 30, 2021 at 11:06:21AM -0400, Tianyu Lan wrote:
>> +void hv_ghcb_msr_write(u64 msr, u64 value)
>> +{
>> +	union hv_ghcb *hv_ghcb;
>> +	void **ghcb_base;
>> +	unsigned long flags;
>> +
>> +	if (!ms_hyperv.ghcb_base)
>> +		return;
>> +
>> +	local_irq_save(flags);
>> +	ghcb_base = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
>> +	hv_ghcb = (union hv_ghcb *)*ghcb_base;
>> +	if (!hv_ghcb) {
>> +		local_irq_restore(flags);
>> +		return;
>> +	}
>> +
>> +	memset(hv_ghcb, 0x00, HV_HYP_PAGE_SIZE);
>> +
>> +	hv_ghcb->ghcb.protocol_version = 1;
>> +	hv_ghcb->ghcb.ghcb_usage = 0;
>> +
>> +	ghcb_set_sw_exit_code(&hv_ghcb->ghcb, SVM_EXIT_MSR);
>> +	ghcb_set_rcx(&hv_ghcb->ghcb, msr);
>> +	ghcb_set_rax(&hv_ghcb->ghcb, lower_32_bits(value));
>> +	ghcb_set_rdx(&hv_ghcb->ghcb, value >> 32);
>> +	ghcb_set_sw_exit_info_1(&hv_ghcb->ghcb, 1);
>> +	ghcb_set_sw_exit_info_2(&hv_ghcb->ghcb, 0);
>> +
>> +	VMGEXIT();
> 
> This is not safe to use from NMI context. You need at least some
> checking or WARN_ON/assertion/whatever to catch cases where this is
> violated. Otherwise it will result in some hard to debug bug reports.
> 

Nice catch. Will update in the next version.

Thanks.

