Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000423DB15B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 04:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162266.297643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Idz-0004r2-25; Fri, 30 Jul 2021 02:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162266.297643; Fri, 30 Jul 2021 02:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Idy-0004p4-VF; Fri, 30 Jul 2021 02:53:02 +0000
Received: by outflank-mailman (input) for mailman id 162266;
 Fri, 30 Jul 2021 02:53:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAuf=MW=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m9Idw-0004oy-L3
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 02:53:00 +0000
Received: from mail-pl1-x634.google.com (unknown [2607:f8b0:4864:20::634])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af19f24a-2eb2-4b3d-9a5b-d144e54e92bd;
 Fri, 30 Jul 2021 02:52:59 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id e21so9329176pla.5
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jul 2021 19:52:59 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:18:efec::4b1])
 by smtp.gmail.com with ESMTPSA id
 l10sm154977pjg.11.2021.07.29.19.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 19:52:58 -0700 (PDT)
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
X-Inumbo-ID: af19f24a-2eb2-4b3d-9a5b-d144e54e92bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bmL4SQ8GAZJWK3xApvq+PZaab/7COKw/aR8FnJTkZ8A=;
        b=NAhocIP4f3vAt+HHEuF7oFkro+lh/6vEAuGcefhg6XueHZFW/VgAw1rUNxuPFA9NmR
         cmXx+ceLZex9nGJ0OyzZaxsYsT8tiRb1jRyPL71vgLtSWLPo0cCqvQ2qriDvy8CpQssj
         viNqrboexe+B/LVVnnduOrHj946GTrR2N6htuF3Da/GGsbOKkj/XSoD3hUHgJvjwaB5p
         T3Mh0d9xRtStBYG2xEqHf2hhw7W3QR/YGkGCbpjg9hYVaJSISM4slgqWraPF6pZEHZNm
         jukHYbtabQpZEinKjbGFHZgXMHh/LOo9XYtuFBdeFaYM0POV1AQF6Po3lzHo4DXqdZqC
         RNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bmL4SQ8GAZJWK3xApvq+PZaab/7COKw/aR8FnJTkZ8A=;
        b=qYUZfxKsSWrattOtzwuYmqjMnOaSTeKQg32AnWzxt9dfapvLQz7y4/ObXl4PqJRKHW
         bruf0zCey//od8MtihFenNav5pfWTT0bOqxvYVYkG2MbmwroEKE79bir2eWNvKuiVq/0
         9H0ZCYh78vMJmbL2lbU+MK+EBC3FDW7puOjONVlnKa/dc72DN/O9f7YWa5dxuua3a0lV
         E9Z3AVTIRnvPmr46EoqDHpvMLqt3wkuhq8n7/KK9D5LVGuRCxrY5bx2lNAPlTPfhmp2I
         /kXfILqRoPXi3ag8ODRL/CMzmYioBtBik6sRdYxNM3bN6zZr2HbM2hjNRWjuupLidKaY
         9CPQ==
X-Gm-Message-State: AOAM531ttBt05m2ox4nyjJ1dQKBc6KlLENRynaCW+OuBvciAVFU8RP6F
	izDh73iDAIOlzGC3jr9ceGs=
X-Google-Smtp-Source: ABdhPJyyZoBDWV7ZCj8Ji9VpActKffc9EXcufc2IzXROiuNMi/ja4nm1BshkPIm0WrFthtY+V0e3wQ==
X-Received: by 2002:a17:90a:1109:: with SMTP id d9mr575516pja.183.1627613579170;
        Thu, 29 Jul 2021 19:52:59 -0700 (PDT)
Subject: Re: [PATCH 03/13] x86/HV: Add new hvcall guest address host
 visibility support
To: Dave Hansen <dave.hansen@intel.com>, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
 rientjes@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 anparri@microsoft.com
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-4-ltykernel@gmail.com>
 <a2444c36-0103-8e1c-7005-d97f77f90e85@intel.com>
 <0d956a05-7d24-57a0-f4a9-dccc849b52fc@gmail.com>
 <ec1d4cfd-bbbc-e27a-7589-e85d9f0438f4@intel.com>
 <8df2845d-ee90-56d0-1228-adebb103ec37@gmail.com>
 <7a2ddcca-e249-ba63-8709-e355fcef2d41@intel.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <fa6cf8b6-7da0-dadf-b137-d90ce3513d5e@gmail.com>
Date: Fri, 30 Jul 2021 10:52:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7a2ddcca-e249-ba63-8709-e355fcef2d41@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/30/2021 12:05 AM, Dave Hansen wrote:
> On 7/29/21 8:02 AM, Tianyu Lan wrote:
>>>
>>
>> There is x86_hyper_type to identify hypervisor type and we may check
>> this variable after checking X86_FEATURE_HYPERVISOR.
>>
>> static inline bool hv_is_isolation_supported(void)
>> {
>>      if (!cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
>>          return 0;
>>
>>          if (x86_hyper_type != X86_HYPER_MS_HYPERV)
>>                  return 0;
>>
>>      // out of line function call:
>>      return __hv_is_isolation_supported();
>> }
> 
> Looks fine.  You just might want to use this existing helper:
> 
> static inline bool hypervisor_is_type(enum x86_hypervisor_type type)
> {
>          return x86_hyper_type == type;
> }
> 

Yes,thanks for suggestion and will update in the next version.

