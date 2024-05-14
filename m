Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239398C57BD
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721554.1125045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ss7-0005uR-Lg; Tue, 14 May 2024 14:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721554.1125045; Tue, 14 May 2024 14:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ss7-0005rz-Ht; Tue, 14 May 2024 14:11:15 +0000
Received: by outflank-mailman (input) for mailman id 721554;
 Tue, 14 May 2024 14:11:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6ss6-0005qF-K5
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:11:14 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0e4ff07-11fb-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 16:11:12 +0200 (CEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5b27c5603ddso2647521eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 07:11:11 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f185520sm53864086d6.37.2024.05.14.07.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 07:11:09 -0700 (PDT)
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
X-Inumbo-ID: d0e4ff07-11fb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715695870; x=1716300670; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kTbCmzldkSuVzK/l9M/kWx9NnmGiRIbnkodtilfb1LE=;
        b=ipLdMt5Y2OGYwCnbaQvzAkKOKv6IO6zyh3fiKPTymDlxrVr+5VK//vLES+VPthjwYz
         3GCNCyAwLYRUVUVF/t1TRtl2C0nUmECfRez0T4Nf23POpMb9U5k77HDmi+Cw448uJ3+y
         kON1/Odf6jtPb/yYvyn3wAUkiWHcQE1rBgyEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715695870; x=1716300670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTbCmzldkSuVzK/l9M/kWx9NnmGiRIbnkodtilfb1LE=;
        b=OJa42Rdm2t5ubPUQWSeWxCRRnjHi3+fUcMXTp8IGzoJR5fZABRUHfS+knlk4ER5v4I
         mq06B2r88taVnfJr7hjeduARnJ6gKqUynqvY7BMWEvBL7ohggaCGppDCtiFyb+lrkz+6
         Y4IcVyNPrRFJr82kYaUPgi/cvWHUQPZj6dfg1dfeQrpzB7o1Z14VtDeTxOUFmPZi4cNw
         f6rOopTA6ukviB4zCg0J0lDT64oRmlKNbr0jv4X+5kxgTpCBVSah0Jheq17EToDTdgzo
         FPPPuLODNQMtasvQYeDRTNnsAGkYlBAZxoGp4C46zhWoYZDTTLwvhLdhGuWFJ8aTdTWV
         Lqow==
X-Gm-Message-State: AOJu0YwncczUXd+HeJmAiF5KYA0uCh9VwW+nwRSUxLUwdtz97gBsOTUg
	4z4x4AuEURFgE+EMXUpj6mYC3sPcEHIn13lqMLd6rWEhlTLF+UEoS70cik12dfM=
X-Google-Smtp-Source: AGHT+IF1Jzn2YwLw4PBVy0Wb4XrnA83eHVGfMyo4h7joC0rfxnmJNbb6HPtEvI9wNw/buSmPOpKHtw==
X-Received: by 2002:a05:6358:b38c:b0:186:ea4:b1a3 with SMTP id e5c5f4694b2df-193bd00b481mr1187437755d.32.1715695870358;
        Tue, 14 May 2024 07:11:10 -0700 (PDT)
Date: Tue, 14 May 2024 16:11:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 11/19] x86/setup: Leave early boot slightly
 earlier
Message-ID: <ZkNw--0ilcMh5YeB@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-12-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-12-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:38PM +0000, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When we do not have a direct map, memory for metadata of heap nodes in
> init_node_heap() is allocated from xenheap, which needs to be mapped and
> unmapped on demand. However, we cannot just take memory from the boot
> allocator to create the PTEs while we are passing memory to the heap
> allocator.
> 
> To solve this race, we leave early boot slightly sooner so that Xen PTE
> pages are allocated from the heap instead of the boot allocator. We can
> do this because the metadata for the 1st node is statically allocated,
> and by the time we need memory to create mappings for the 2nd node, we
> already have enough memory in the heap allocator in the 1st node.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index bd6b1184f5..f26c9799e4 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1751,6 +1751,22 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>  
>      numa_initmem_init(0, raw_max_page);
>  
> +    /*
> +     * When we do not have a direct map, memory for metadata of heap nodes in
> +     * init_node_heap() is allocated from xenheap, which needs to be mapped and
> +     * unmapped on demand.

Hm, maybe I'm confused, but isn't xenheap memory supposed to be always
mapped when in use?  In one of the previous patches xenheap memory is
unconditionally mapped in alloc_xenheap_pages().

IMO, this would better be worded as:  "... is allocated from xenheap,
which needs to be mapped at allocation and unmapped when freed."

>                             However, we cannot just take memory from the boot
> +     * allocator to create the PTEs while we are passing memory to the heap
> +     * allocator during end_boot_allocator().

Could you elaborate here, I don't obviously see why we can't consume
memory from the boot allocator.  Is it because under certain
conditions we might try to allocate memory from the boot allocator in
order to fulfill a call to map_pages_to_xen() and find the boot
allocator empty?

Thanks, Roger.

