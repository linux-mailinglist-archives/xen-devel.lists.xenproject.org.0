Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E547A3DD623
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 14:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162999.298712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXUv-0004Fq-IM; Mon, 02 Aug 2021 12:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162999.298712; Mon, 02 Aug 2021 12:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXUv-0004DH-FN; Mon, 02 Aug 2021 12:56:49 +0000
Received: by outflank-mailman (input) for mailman id 162999;
 Mon, 02 Aug 2021 12:56:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SgE8=MZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mAXUt-0004DB-Fw
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 12:56:47 +0000
Received: from mail-pl1-x62f.google.com (unknown [2607:f8b0:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2660c22f-67ca-4df8-9c45-da8db79ecf32;
 Mon, 02 Aug 2021 12:56:46 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id u16so10955505ple.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Aug 2021 05:56:46 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 g7sm6679837pfv.66.2021.08.02.05.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 05:56:45 -0700 (PDT)
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
X-Inumbo-ID: 2660c22f-67ca-4df8-9c45-da8db79ecf32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/GYPS7X+85wR6YC8425aJSok3ZXyi4U2bTyYNUsfO5w=;
        b=pyQkhPeDqOZN1lKQvpgjaZhDuqcfBH++qI9Yz80iquDkO6oGt+tBuSPtyV0nMGVBJ1
         M2E5aA/XAnoteOyDQT8M+x5AliZKopkoGnInKwL3m2QqBiWDu36W26gL/YPC8K/KeYlr
         lKiZUAf6XKEOBg70NsE3K9fU4mOPUUIoCYKqtgQQ2HjvRH1Q+CjUYFOowxeVCbfkbnu7
         GXswmjuYPprsxcXIE4NienyvsAMjibDdMeps+gxmOrpMJQUHeDF7e/9b+DgNRmsrf0dj
         R82WDqtlRqQuveuh5cTGWXuurfZKwGo+CrnXy7KJkYXeft1AWFi82RFU5cJODZER7tHh
         HwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/GYPS7X+85wR6YC8425aJSok3ZXyi4U2bTyYNUsfO5w=;
        b=p/ca/bCbZMrz4lNl56wNthyYBOdGIknb1s/oIJU0bhBceW/UmeKcgCJc8d5XvIDxKS
         z32yunc5niyRz8RDWeM+TRYylEHxCDBTXzI2hZ8ZFAGtXk22DPOJYoBi3LJFsbwtTVyD
         Kgo4fy6xBH+6rFhuPXSDI2PO+DytGxtf1zuILSvlLTNrkGxc2YTLKMQA63eT6ZnXFSjV
         TNirLytnApF+tTI8u2GVvG6+871RdJTbhrn5aDOz/SqgEWtXnispaQ3WkgJ0EFgUbmjR
         TgzGQG19X8C67FUZDGtHZX6w308sDIQ1EfQ8zVwNuRB/+eZ/q95VvcKbBrO3a6GJhMOV
         +T3Q==
X-Gm-Message-State: AOAM530NycTGjZqv07921UWWsUm0K3AMDuvnE7tADLWq4ZE4yW7g+NKv
	U5Oammwc+zZcUIXRsoFrX40=
X-Google-Smtp-Source: ABdhPJyLDEEPYFYa8bCYhczgLUorbl2lwmF46SVfXQIXh/rESGtdQ+84YDRl3Rg46/KGbl2xu2SCOw==
X-Received: by 2002:a17:902:b48b:b029:12c:59b:dc44 with SMTP id y11-20020a170902b48bb029012c059bdc44mr14086944plr.47.1627909005643;
        Mon, 02 Aug 2021 05:56:45 -0700 (PDT)
Subject: Re: [PATCH 04/13] HV: Mark vmbus ring buffer visible to host in
 Isolation VM
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
 <20210728145232.285861-5-ltykernel@gmail.com> <YQfgH04t2SqacnHn@8bytes.org>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <173823d1-280c-d34e-be2c-157b55bb6bc3@gmail.com>
Date: Mon, 2 Aug 2021 20:56:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQfgH04t2SqacnHn@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/2/2021 8:07 PM, Joerg Roedel wrote:
> On Wed, Jul 28, 2021 at 10:52:19AM -0400, Tianyu Lan wrote:
>> +	if (type == HV_GPADL_BUFFER)
>> +		index = 0;
>> +	else
>> +		index = channel->gpadl_range[1].gpadlhandle ? 2 : 1;
> 
> Hmm... This doesn't look very robust. Can you set fixed indexes for
> different buffer types? HV_GPADL_BUFFER already has fixed index 0. But
> as it is implemented here you risk that index 2 gets overwritten by
> subsequent calls.

Both second and third are HV_GPADL_RING type. One is send ring and the
other is receive ring. The driver keeps the order to allocate rx and
tx buffer. You are right this is not robust and will add a mutex to keep
the order.

