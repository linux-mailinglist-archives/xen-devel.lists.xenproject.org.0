Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234443EC9EB
	for <lists+xen-devel@lfdr.de>; Sun, 15 Aug 2021 17:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167079.304969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFHx6-0008Pi-BJ; Sun, 15 Aug 2021 15:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167079.304969; Sun, 15 Aug 2021 15:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFHx6-0008Ns-6V; Sun, 15 Aug 2021 15:21:32 +0000
Received: by outflank-mailman (input) for mailman id 167079;
 Sun, 15 Aug 2021 15:21:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=782z=NG=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mFHx4-0008Nm-VM
 for xen-devel@lists.xenproject.org; Sun, 15 Aug 2021 15:21:31 +0000
Received: from mail-pl1-x633.google.com (unknown [2607:f8b0:4864:20::633])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca17943f-15f8-44b5-ab24-1a9f8ab2f164;
 Sun, 15 Aug 2021 15:21:29 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id u1so880697plr.1
 for <xen-devel@lists.xenproject.org>; Sun, 15 Aug 2021 08:21:29 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 nn18sm6289319pjb.21.2021.08.15.08.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 08:21:28 -0700 (PDT)
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
X-Inumbo-ID: ca17943f-15f8-44b5-ab24-1a9f8ab2f164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lqJuD6ruM5b7S82+pL+Pgu4dT3Aqj2AS9hae1tFkdRo=;
        b=UDo6cP9FMCJZ7xCJSIXhjRcP0ErAenE3P03nucshW6LzGwza1JB05cdoyvyJEbpJya
         8aLc4Djx0DAWFPSijwKCksggpzGOsA8NJq7xgbAAE0ffHXqq0QXSiy6tfbcSn5jEQof6
         2ma3PA51qPRAxAYmuW2j7KtkKsDVNuEpegmAaBxh1f/jI4N5cAWqPcx4oFXN2pO1Ashc
         87gLBUkKiBVoGeCUHLrBIQIIXvlCZHYUAOsOdCOfo4PAkq83QiSfgI8TAI23zhfr8YUr
         vMCV/udIh/MHgkHngzhYrcPnpUZMQSk6GK/ENzO0mZC8nGBR7d73iCxBtmg3WUTr+cQr
         /F0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lqJuD6ruM5b7S82+pL+Pgu4dT3Aqj2AS9hae1tFkdRo=;
        b=mhAn79nqQAJTpTA23JcrQETQ9C4F8XXES8NL9SWMQD1MDaP4yy4Z7qIugjWWB6IflZ
         uVzoZSw0K27D8UQCFLeJt9ixTKidhrPKvk40mGaZ7DIcEIuq0d0vLDiuISM7GUbZQfL2
         9tni19/4jeVDR6wkBmpiQisQ15QFdeN/KpLDZY5UHPM6HVmBObekr1pZ3FkN9YVGveSH
         4E6QdFb2a8SrllGjjogAbAAJLP0rGmreLTDp2f2VLn5G6nWoRmEazzDEv+/O3mY961lS
         cpXvl0DYVgtFbGoj4n7On8qHK3M2QFbiXINNAtVMJqRoNWUU8XAwTZdj1vAu78Y/A0+Q
         HGug==
X-Gm-Message-State: AOAM5333BSwpJIfD/bdIw0ubbMi92eN2PkWfUz/qlt7n4Sy4+w0sU/RW
	eU/0hE7SJqniaAH/2GJp8WY=
X-Google-Smtp-Source: ABdhPJxpcs+C9yGRhB/oJwUav2sPEXUGNBEjk6Xqpn3/4lgsrB3QPLQ97I5YOwA+8w9+RuIKBCv5Rw==
X-Received: by 2002:a63:770f:: with SMTP id s15mr11711033pgc.137.1629040889118;
        Sun, 15 Aug 2021 08:21:29 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH V3 04/13] HV: Mark vmbus ring buffer visible to host in
 Isolation VM
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
 <20210809175620.720923-5-ltykernel@gmail.com>
 <MWHPR21MB1593CCBBBB83E721F8FDACD3D7F99@MWHPR21MB1593.namprd21.prod.outlook.com>
Message-ID: <43d4cb59-5ddd-516d-1f5c-4a1a799a9f2d@gmail.com>
Date: Sun, 15 Aug 2021 23:21:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <MWHPR21MB1593CCBBBB83E721F8FDACD3D7F99@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/13/2021 6:20 AM, Michael Kelley wrote:
>> @@ -474,6 +482,13 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
>>   	if (ret)
>>   		return ret;
>>
>> +	ret = set_memory_decrypted((unsigned long)kbuffer,
>> +				   HVPFN_UP(size));
>> +	if (ret) {
>> +		pr_warn("Failed to set host visibility.\n");
> Enhance this message a bit.  "Failed to set host visibility for new GPADL\n"
> and also output the value of ret.

OK. This looks better. Thanks.

> 
>> @@ -539,6 +554,10 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
>>   	/* At this point, we received the gpadl created msg */
>>   	*gpadl_handle = gpadlmsg->gpadl;
>>
>> +	channel->gpadl_array[index].size = size;
>> +	channel->gpadl_array[index].buffer = kbuffer;
>> +	channel->gpadl_array[index].gpadlhandle = *gpadl_handle;
>> +
> I can see the merits of transparently stashing the memory address and size
> that will be needed by vmbus_teardown_gpadl(), so that the callers of
> __vmbus_establish_gpadl() don't have to worry about it.  But doing the
> stashing transparently is somewhat messy.
> 
> Given that the callers are already have memory allocated to save the
> GPADL handle, a little refactoring would make for a much cleaner solution.
> Instead of having memory allocated for the 32-bit GPADL handle, callers
> should allocate the slightly larger struct vmbus_gpadl that you've
> defined below.  The calling interfaces can be updated to take a pointer
> to this structure instead of a pointer to the 32-bit GPADL handle, and
> you can save the memory address and size right along with the GPADL
> handle.  This approach touches a few more files, but I think there are
> only two callers outside of the channel management code -- netvsc
> and hv_uio -- so it's not a big change.

Yes, this is a good suggestion and Will update in the next version.

> 
>> @@ -859,6 +886,19 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, u32 gpadl_handle)
>>   	spin_unlock_irqrestore(&vmbus_connection.channelmsg_lock, flags);
>>
>>   	kfree(info);
>> +
>> +	/* Find gpadl buffer virtual address and size. */
>> +	for (i = 0; i < VMBUS_GPADL_RANGE_COUNT; i++)
>> +		if (channel->gpadl_array[i].gpadlhandle == gpadl_handle)
>> +			break;
>> +
>> +	if (set_memory_encrypted((unsigned long)channel->gpadl_array[i].buffer,
>> +			HVPFN_UP(channel->gpadl_array[i].size)))
>> +		pr_warn("Fail to set mem host visibility.\n");
> Enhance this message a bit: "Failed to set host visibility in GPADL teardown\n".
> Also output the returned error code to help in debugging any occurrences of
> a failure
Yes, agree. Will update.

Thanks.

