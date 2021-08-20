Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2353F3354
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 20:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169649.309925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH98m-0005nS-IC; Fri, 20 Aug 2021 18:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169649.309925; Fri, 20 Aug 2021 18:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH98m-0005l7-Ek; Fri, 20 Aug 2021 18:21:16 +0000
Received: by outflank-mailman (input) for mailman id 169649;
 Fri, 20 Aug 2021 18:21:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YXI=NL=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mH98l-0005l1-6C
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 18:21:15 +0000
Received: from mail-pf1-x42e.google.com (unknown [2607:f8b0:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca0e4bfe-a460-4768-9ac3-3d35a942731d;
 Fri, 20 Aug 2021 18:21:14 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id j187so9303703pfg.4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Aug 2021 11:21:14 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 n12sm9253074pgr.2.2021.08.20.11.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 11:21:13 -0700 (PDT)
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
X-Inumbo-ID: ca0e4bfe-a460-4768-9ac3-3d35a942731d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FnnZUNvhPvIx/VcFIRs7Mx/cKrQt7VgripjVwaHxsaI=;
        b=nOkgFzUUeuE2uOq6KpBWbmk2uCSVbcFBzkWKWriACYTXwD2Dfd42Y/PQxXFWgP/UQB
         TogIgojLtlyPz9QZAvWYG7x2Pth4sWyW9aCIzNRMkahsKt7LnIP0hQceLcgKHpy70hBM
         tN3pbDH8t4qDq8nt48kTuMyGdfR+karexcyZbSVJGxqKp8Xjr7WSOFalJR4zWRTyN9eU
         cS/bv7TIGxxMVY+JEwNGmD+vn6WhpJX2S3CF5XZsTbPF9biARKkYXKoQGAuaOxtAT4R5
         vG04+TCNyrhDuU8ZUFurYQVnP2CxwvKxr71yt2ETcHsuHN50myIZUfVBAsyoQwK7oxl8
         TKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FnnZUNvhPvIx/VcFIRs7Mx/cKrQt7VgripjVwaHxsaI=;
        b=Uhgj6VALhyDqCAjnTmdaANgxw+Zb8cR+INrSZ3JkIP5khIC4kRFymeXJMDB/8LjGkK
         8notbs/CcPTqPeeLqUC4KdmmVJtxq6lP/mYAcYxuJQY9kO7m3+V+Wlyb+D7inm+IW6DP
         eyD9Xdm+IV84DIHQcbLxtqjYLHbhdXzh+kUOXVPZ6qSMaVsCFd/8+w4vaKvNhiBPkcvC
         NOVik9ZfNiKreVD79giGRmwpxaRAlcWzvW0hSPg/mMABS/5Lopzap4WAz1UZTqpUXJ3F
         GUDAl+QrUCaWLp9tpVzqBKsYHt5KBEOVrnhKfZYnU6uv3QgtnEhsmjxh8SMNUR8p+tZI
         /IYw==
X-Gm-Message-State: AOAM532v+MRcHqPxcFFcRaKt+hB1cI4sfTrFrRLz83VpWjyGT9cB334P
	2z2orRtsX1Bbu7tD4uU1EWU=
X-Google-Smtp-Source: ABdhPJxzsYelAgPwIrLwHXwqEGliJ5vS+we4MW2tj375Z/nX9HFwmx8yp+6BPHWxDivdPsW7WY4m1A==
X-Received: by 2002:a62:78c1:0:b0:3e2:bdc:6952 with SMTP id t184-20020a6278c1000000b003e20bdc6952mr20448852pfc.45.1629483673512;
        Fri, 20 Aug 2021 11:21:13 -0700 (PDT)
Subject: Re: [PATCH V3 12/13] HV/Netvsc: Add Isolation VM support for netvsc
 driver
To: Michael Kelley <mikelley@microsoft.com>, KY Srinivasan
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "ardb@kernel.org" <ardb@kernel.org>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 "pgonda@google.com" <pgonda@google.com>,
 "martin.b.radev@gmail.com" <martin.b.radev@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "saravanand@fb.com" <saravanand@fb.com>,
 "krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "rientjes@google.com" <rientjes@google.com>,
 "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "tj@kernel.org" <tj@kernel.org>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 vkuznets <vkuznets@redhat.com>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-13-ltykernel@gmail.com>
 <MWHPR21MB15936FE72E65A62FBA3EF4F2D7C09@MWHPR21MB1593.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <713480b3-f924-60dd-96a4-b6318930383f@gmail.com>
Date: Sat, 21 Aug 2021 02:20:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <MWHPR21MB15936FE72E65A62FBA3EF4F2D7C09@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/20/2021 2:14 AM, Michael Kelley wrote:
>> @@ -477,6 +521,15 @@ static int netvsc_init_buf(struct hv_device *device,
>>   		goto cleanup;
>>   	}
>>
>> +	if (hv_isolation_type_snp()) {
>> +		vaddr = netvsc_remap_buf(net_device->send_buf, buf_size);
>> +		if (!vaddr)
>> +			goto cleanup;
> I don't think this error case is handled correctly.  Doesn't the remapping
> of the recv buf need to be undone?
>

Yes, actually I thought to return error here and free_netvsc_device() 
will help to unmap recv_buffer finally. But I forget to set ret = 
-ENOMEM when add netvsc_remap_buf() helper.


