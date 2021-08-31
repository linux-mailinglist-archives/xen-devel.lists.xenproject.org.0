Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1DE3FCAB6
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 17:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175855.320210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL5Yn-0007yc-77; Tue, 31 Aug 2021 15:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175855.320210; Tue, 31 Aug 2021 15:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL5Yn-0007wh-3e; Tue, 31 Aug 2021 15:20:25 +0000
Received: by outflank-mailman (input) for mailman id 175855;
 Tue, 31 Aug 2021 15:20:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/iqM=NW=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mL5Yl-0007wb-84
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 15:20:23 +0000
Received: from mail-pg1-x535.google.com (unknown [2607:f8b0:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28a68d0c-5416-431d-b1fa-4e374ed92493;
 Tue, 31 Aug 2021 15:20:22 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id k24so17034483pgh.8
 for <xen-devel@lists.xenproject.org>; Tue, 31 Aug 2021 08:20:22 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 x8sm7986672pfj.128.2021.08.31.08.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 08:20:20 -0700 (PDT)
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
X-Inumbo-ID: 28a68d0c-5416-431d-b1fa-4e374ed92493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bHjdW+TFSdvqPfi7vbsYmlySYD0qeWma8ZlepyZ1pyA=;
        b=vKMmKg2JfTEH2r2TLKjdeGLs50EV+1jZUgn5bOxg36v536g3yxVJyUm07AJrRe5zpl
         tBmmevtBUhZm2otLHjO+t6XZXSqKFmlgJCMuDJmWa/GXj0SoH6IO4AASbNQrCa0nh7qM
         B7KI7XsRMY0RH1QUZ2VUGE8whdNH2gKq9Z8kV8Ym5rAqaokVsDSlFZJi22dmYwhDgQhT
         USid/NU4WRGPSTarkDcXxdUTAx9LYuGrR6Nv4PIqqo7PphtFsJN7VG6hLWhI5/qBs3Di
         +x+drrXZWdPlOXc87KdUarIUyVQNpVlgBbEDUDQ2DCD3gwGIwD/mm2RVJSZt7qbmg0qd
         mMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bHjdW+TFSdvqPfi7vbsYmlySYD0qeWma8ZlepyZ1pyA=;
        b=FZl2SYYD9MHO/l3XVFT+2ay3Q8IX/JpXqH+WgHfvKg5JXnq/NRDVC9hCGFz8eNWbn3
         TtBzGDXwjBqQEz4vhPJGQUqWldq59LnBSec9ssW+HCf4PLeubfqstBZ06jGlc6gzHQyi
         Sd42H2gNF0jextZDfZk5Pydqe6AcbvhM8WcZaw6RMnXFAhlnc3KnUtG92E6i+W/xt05I
         wz+Y/tWka/cxoB8g8x7XOWgGKaSNETRx1fZZgY8h56dMdOceLCB+cvZdvr0VJ6aj78MF
         /69jOCZV+8kQYNInfP0CYcudU7LVjCg1MSkwHGHqoDnQNVRf9sNBOgHxy0TXlRDRS0Sf
         8qcA==
X-Gm-Message-State: AOAM532cI8tR6Mwo4+nR0/hkNYmWtrZ/krd1rH4h+15ZzH2vox5YoItO
	IhxJkJd8vTRdPdDl1acnKgQ=
X-Google-Smtp-Source: ABdhPJzSdF8ZTtYVUbdAWtHig1Ob457a20faxiqqeItSlT8AzOFj7ZlOHpfBE0oc7/WJzromHshTYw==
X-Received: by 2002:a62:8144:0:b0:3af:7e99:f48f with SMTP id t65-20020a628144000000b003af7e99f48fmr28970407pfd.2.1630423221259;
        Tue, 31 Aug 2021 08:20:21 -0700 (PDT)
Subject: Re: [PATCH V4 00/13] x86/Hyper-V: Add Hyper-V Isolation VM support
To: Christoph Hellwig <hch@lst.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, catalin.marinas@arm.com,
 will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org, arnd@arndb.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, brijesh.singh@amd.com,
 thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com, pgonda@google.com,
 martin.b.radev@gmail.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
 rientjes@google.com, ardb@kernel.org, michael.h.kelley@microsoft.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 parri.andrea@gmail.com, dave.hansen@intel.com
References: <20210827172114.414281-1-ltykernel@gmail.com>
 <20210830120036.GA22005@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <91b5e997-8d44-77f0-6519-f574b541ba9f@gmail.com>
Date: Tue, 31 Aug 2021 23:20:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210830120036.GA22005@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Christoph:

On 8/30/2021 8:00 PM, Christoph Hellwig wrote:
> Sorry for the delayed answer, but I look at the vmap_pfn usage in the
> previous version and tried to come up with a better version.  This
> mostly untested branch:
> 
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/hyperv-vmap

No problem. Thank you very much for your suggestion patches and they are 
very helpful.


> 
> get us there for swiotlb and the channel infrastructure  I've started
> looking at the network driver and didn't get anywhere due to other work.
> 
> As far as I can tell the network driver does gigantic multi-megabyte
> vmalloc allocation for the send and receive buffers, which are then
> passed to the hardware, but always copied to/from when interacting
> with the networking stack.  Did I see that right?  Are these big
> buffers actually required unlike the normal buffer management schemes
> in other Linux network drivers?


For send packet, netvsc tries batching packet in send buffer if 
possible. It passes the original skb pages directly to
hypervisor when send buffer is not enough or packet length is larger 
than section size. These packets are sent via 
vmbus_sendpacket_pagebuffer() finally. Please see netvsc_send() for 
detail. The following code is to check whether the packet could be 
copied into send buffer. If not, the packet will be sent with original 
skb pages.

1239        /* batch packets in send buffer if possible */
1240        msdp = &nvchan->msd;
1241        if (msdp->pkt)
1242                msd_len = msdp->pkt->total_data_buflen;
1243
1244        try_batch =  msd_len > 0 && msdp->count < net_device->max_pkt;
1245        if (try_batch && msd_len + pktlen + net_device->pkt_align <
1246            net_device->send_section_size) {
1247                section_index = msdp->pkt->send_buf_index;
1248
1249        } else if (try_batch && msd_len + packet->rmsg_size <
1250                   net_device->send_section_size) {
1251                section_index = msdp->pkt->send_buf_index;
1252                packet->cp_partial = true;
1253
1254        } else if (pktlen + net_device->pkt_align <
1255                   net_device->send_section_size) {
1256                section_index = 
netvsc_get_next_send_section(net_device);
1257                if (unlikely(section_index == NETVSC_INVALID_INDEX)) {
1258                        ++ndev_ctx->eth_stats.tx_send_full;
1259                } else {
1260                        move_pkt_msd(&msd_send, &msd_skb, msdp);
1261                        msd_len = 0;
1262                }
1263        }
1264



For receive packet, the data is always copied from recv buffer.

> 
> If so I suspect the best way to allocate them is by not using vmalloc
> but just discontiguous pages, and then use kmap_local_pfn where the
> PFN includes the share_gpa offset when actually copying from/to the
> skbs.
> 
When netvsc needs to copy packet data to send buffer, it needs to 
caculate position with section_index and send_section_size.
Please seee netvsc_copy_to_send_buf() detail. So the contiguous virtual 
address of send buffer is necessary to copy data and batch packets.

