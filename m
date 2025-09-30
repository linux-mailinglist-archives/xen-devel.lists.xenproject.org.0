Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11805BABCDE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 09:24:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133776.1471839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Ui8-0004rS-RF; Tue, 30 Sep 2025 07:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133776.1471839; Tue, 30 Sep 2025 07:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Ui8-0004pc-NP; Tue, 30 Sep 2025 07:23:44 +0000
Received: by outflank-mailman (input) for mailman id 1133776;
 Tue, 30 Sep 2025 07:23:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Ui7-0004pW-Cz
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 07:23:43 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6473e0b5-9dce-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 09:23:42 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e33b260b9so8578215e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 00:23:42 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f3dbcfsm44146575e9.3.2025.09.30.00.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 00:23:41 -0700 (PDT)
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
X-Inumbo-ID: 6473e0b5-9dce-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759217022; x=1759821822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itVX7tgCqZhn3DDR7jTxWGvfg+OOdlBPano0M6bAsBg=;
        b=rkG3kk5u/JNk6Ha7ilL6KadpTBrAjyI9aUFQqIMZbZD7+i2IDOKbl88nls9d37VzVk
         tloXS2ng0kks1Vur9v8oOKuZm/nG1OFLKMheJAMKGW3dJBRHItyjdRQJe0vXnY0EfOJH
         MTN5TQ+Y06GmEXL106UHix+wl7pApMuAwTvZGEj3WKjt6niFqUlW0yzjlWyH3PIfPRkg
         6MCifRkIEt7WjICGZPavELSF9sll/NM28A6L67nWY6awkgykXPa9CmgvIs+bktDfJuOl
         68wgtc+rUErW7gO9dcO7C1HdBxsONPXZE2+nDp+QVYPXi8qkghde1xVw/SWGsOGT2fAd
         6rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217022; x=1759821822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itVX7tgCqZhn3DDR7jTxWGvfg+OOdlBPano0M6bAsBg=;
        b=cfrMR0YvzpvAnsw3Ivq2MNg4qaEqBUMXeC+rDxIxCF+Zqm3rAdGACVlAaDXdqYVm17
         BTB1JeGazuhed5Tb49Gm6KO7mcQ7DDAt/tsMYlmoZDEsjjtYx+8KGizw+yGaEkAOhwtq
         r00AUuGBTjcypecKZ7FBtfLAu8ePGLQKC/QVp/DrFa+R++Hw1ObaeX7fFVMyf3BYqFjR
         i2Bcu8TWiR5zJrqcIM8beOEI/v+Kq7WzdP9sntlHYc7U3tydo8TjEMy9E3XBbC/RG70y
         Qr3nHEJWoeoMsUDkDm1JwlLV25Ik3ZkJPe/KWLmsbLJftGX4VNP0W1NZpGUqbzFTKcBO
         0kyw==
X-Forwarded-Encrypted: i=1; AJvYcCUyE/pbL23/UqelfmuFEohUZ1xreJl0jXsfsjWEwt1/73Id5HhU81WEGgNkdL5+LPy9AD0Adig1odo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyl+8rqOo9Oeuv6AOy1dCgna29suWGJ/AApY70VS+T/gm/OkGpd
	Is+kS8D34kqml5be6RH0y8SwtdFYxjMx99iR8xJOMSxy/qq73wb2qMLpdecuz412sak=
X-Gm-Gg: ASbGncsG43W38NN0PGmkJCq8q7XZZN0Dbnf6UZ/+yAsqjGzHWk36cRJ7vH57K/nOIFn
	KDyb0msq+LBZidp7j3K9OGtp6/59HzgHEgX3gt/ub3X8cOedwY5Q5v4V+oACpZsOJBUZiaemThx
	TNZzdDFBt9Yx+Dkqg3HE5YuyrdApUqNITmFjhaEpSAskHclltS+AUlVw5PN3eR0q6EuHvzkXSvl
	2JZdpZkMx9cUTe2p+uQuECq0Dahlna04s0lkjnPmYiptUQ4drTiB0w2b0QuMzL/VbeaV9oMkgVk
	myowes5z1P1UswGO3MQoHnxJ9GOIfcS+mYeLdL8f5cMe7ZnnGf/U3laqgNSjg8TKI/r2Oi2jrVF
	9qCTGqMPlwqRGciaTmtlraiWOsdnZjDbYB/OVtaty646PdhDfsi5NR5a6Jmlus8TWPwPyg+eLeh
	DfO+rGCqqveVr8lw==
X-Google-Smtp-Source: AGHT+IHvY4Ey9R8Ex4kFK/h9CrX/gZMo0TkG92UrmsqICbzAXLN4hHP/QkaUH3LOu+37Fvfb480y1w==
X-Received: by 2002:a05:600c:4e4a:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-46e4b7906ecmr109670425e9.31.1759217021708;
        Tue, 30 Sep 2025 00:23:41 -0700 (PDT)
Message-ID: <61c31076-5330-426a-9c28-b2400bec44f6@linaro.org>
Date: Tue, 30 Sep 2025 09:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] system/physmem: Un-inline
 cpu_physical_memory_read/write()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Herne <jjherne@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Garzarella <sgarzare@redhat.com>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Eric Farman <farman@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Zhao Liu <zhao1.liu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-s390x@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20250930041326.6448-1-philmd@linaro.org>
 <20250930041326.6448-15-philmd@linaro.org>
 <193cd8a8-2c4c-4c2c-af22-622b74c332ee@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <193cd8a8-2c4c-4c2c-af22-622b74c332ee@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/9/25 07:02, Thomas Huth wrote:
> On 30/09/2025 06.13, Philippe Mathieu-Daudé wrote:
>> Un-inline cpu_physical_memory_read() and cpu_physical_memory_write().
> 
> What's the reasoning for this patch?

Remove cpu_physical_memory_rw() in the next patch without having
to inline the address_space_read/address_space_write() calls in
"exec/cpu-common.h".

Maybe better squashing both together?

> 
>   Thomas
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/cpu-common.h | 12 ++----------
>>   system/physmem.c          | 10 ++++++++++
>>   2 files changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
>> index 6c7d84aacb4..6e8cb530f6e 100644
>> --- a/include/exec/cpu-common.h
>> +++ b/include/exec/cpu-common.h
>> @@ -133,16 +133,8 @@ void cpu_address_space_destroy(CPUState *cpu, int 
>> asidx);
>>   void cpu_physical_memory_rw(hwaddr addr, void *buf,
>>                               hwaddr len, bool is_write);
>> -static inline void cpu_physical_memory_read(hwaddr addr,
>> -                                            void *buf, hwaddr len)
>> -{
>> -    cpu_physical_memory_rw(addr, buf, len, false);
>> -}
>> -static inline void cpu_physical_memory_write(hwaddr addr,
>> -                                             const void *buf, hwaddr 
>> len)
>> -{
>> -    cpu_physical_memory_rw(addr, (void *)buf, len, true);
>> -}
>> +void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len);
>> +void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr 
>> len);
>>   void *cpu_physical_memory_map(hwaddr addr,
>>                                 hwaddr *plen,
>>                                 bool is_write);
>> diff --git a/system/physmem.c b/system/physmem.c
>> index 70b02675b93..6d6bc449376 100644
>> --- a/system/physmem.c
>> +++ b/system/physmem.c
>> @@ -3188,6 +3188,16 @@ void cpu_physical_memory_rw(hwaddr addr, void 
>> *buf,
>>                        buf, len, is_write);
>>   }
>> +void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len)
>> +{
>> +    cpu_physical_memory_rw(addr, buf, len, false);
>> +}
>> +
>> +void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len)
>> +{
>> +    cpu_physical_memory_rw(addr, (void *)buf, len, true);
>> +}
>> +
>>   /* used for ROM loading : can write in RAM and ROM */
>>   MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
>>                                       MemTxAttrs attrs,
> 


