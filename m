Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DE2690F1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:59:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqt7-0004ry-J9; Mon, 14 Sep 2020 15:59:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LHiq=CX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kHqt5-0004rt-HH
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:59:27 +0000
X-Inumbo-ID: 9a57acd5-2bff-4ea9-b8c2-12703d00489a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a57acd5-2bff-4ea9-b8c2-12703d00489a;
 Mon, 14 Sep 2020 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=c8RbSSUUg/Os+enHYD0/o+GHEsmdbHFnLsIxTG4Umic=; b=ltOPRHPq0s8lDKPgo29PkU5ckB
 QsZecMBWSqi1MuQveN0UcBz7JMof+EDfqBdL8un3tqbUWg1hKEkBcYIb/Eou1/kww3e+w7IelkKFd
 vtvOrtEaTnxQqUBaACRYe3t8m2YvjypuTEmFppUP+VUuzAyMKNsKkx83cd5C2LiorXUA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kHqt1-0001sm-9q; Mon, 14 Sep 2020 15:59:23 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kHqt1-0008La-0G; Mon, 14 Sep 2020 15:59:23 +0000
Subject: Re: [PATCH V1 06/16] xen/ioreq: Make x86's
 hvm_ioreq_(page/vcpu/server) structs common
To: Jan Beulich <jbeulich@suse.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-7-git-send-email-olekstysh@gmail.com>
 <1c02f776-a9ae-ac7f-4d17-35745c324c91@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6022c151-7878-87f7-8dc8-7ccf44b2f779@xen.org>
Date: Mon, 14 Sep 2020 16:59:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1c02f776-a9ae-ac7f-4d17-35745c324c91@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 14/09/2020 16:16, Jan Beulich wrote:
> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -23,6 +23,40 @@
>>   
>>   #include <asm/hvm/ioreq.h>
>>   
>> +struct hvm_ioreq_page {
>> +    gfn_t gfn;
>> +    struct page_info *page;
>> +    void *va;
>> +};
>> +
>> +struct hvm_ioreq_vcpu {
>> +    struct list_head list_entry;
>> +    struct vcpu      *vcpu;
>> +    evtchn_port_t    ioreq_evtchn;
>> +    bool             pending;
>> +};
>> +
>> +#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
>> +#define MAX_NR_IO_RANGES  256
>> +
>> +struct hvm_ioreq_server {
>> +    struct domain          *target, *emulator;
>> +
>> +    /* Lock to serialize toolstack modifications */
>> +    spinlock_t             lock;
>> +
>> +    struct hvm_ioreq_page  ioreq;
>> +    struct list_head       ioreq_vcpu_list;
>> +    struct hvm_ioreq_page  bufioreq;
>> +
>> +    /* Lock to serialize access to buffered ioreq ring */
>> +    spinlock_t             bufioreq_lock;
>> +    evtchn_port_t          bufioreq_evtchn;
>> +    struct rangeset        *range[NR_IO_RANGE_TYPES];
>> +    bool                   enabled;
>> +    uint8_t                bufioreq_handling;
>> +};
> 
> Besides there again being the question of hvm_ prefixes here,
> is the bufioreq concept something Arm is meaning to make use
> of? If not, this may want to become conditional ...

Yes, I would like to make use of it to optimize virtio notifications as 
we don't need to wait for them to be processed by the IOREQ server.

Cheers,

-- 
Julien Grall

