Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E357541C13E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198903.352649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVUh-0003mc-Hj; Wed, 29 Sep 2021 09:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198903.352649; Wed, 29 Sep 2021 09:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVUh-0003kc-EP; Wed, 29 Sep 2021 09:03:15 +0000
Received: by outflank-mailman (input) for mailman id 198903;
 Wed, 29 Sep 2021 09:03:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NQqk=OT=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mVVUg-0003SP-Fe
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:03:14 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7889e37e-e89e-4f29-851e-9ebf35dd9aaf;
 Wed, 29 Sep 2021 09:03:13 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-Rna-RbHZOvaQvXp5YvfnTw-1; Wed, 29 Sep 2021 05:03:12 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 y142-20020a1c7d94000000b0030cdc76dedeso2424447wmc.5
 for <xen-devel@lists.xenproject.org>; Wed, 29 Sep 2021 02:03:12 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
 by smtp.gmail.com with ESMTPSA id
 t11sm1548498wrz.65.2021.09.29.02.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 02:03:10 -0700 (PDT)
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
X-Inumbo-ID: 7889e37e-e89e-4f29-851e-9ebf35dd9aaf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632906193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7W9Fc0fF86WyXYecPV/lI8dmSptGKk8vSEWO1VbX84s=;
	b=VgUT5Wkwz6V88ZQWns3PibHMln4HGhgp//Lqv9xtWWLTUU31B+jaqn1HXLjgQC/QydaJh8
	NDkadZGDpMr/7/xCagBYELPHCNxaXtcFe2exkJT+esc+RwifmAL59hZ6W7hNVbT8JgYUIs
	S8u2Og2LtVssz/7JezgZKEYnn+I6IDY=
X-MC-Unique: Rna-RbHZOvaQvXp5YvfnTw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7W9Fc0fF86WyXYecPV/lI8dmSptGKk8vSEWO1VbX84s=;
        b=HPwGRsODjLbesCMLqTQU311gHgqkyT5SbKmMjEPayekjV6ewl01CmsKrLPEkRbgWuk
         T6tkPndx6eCU1yTYBOjPROwOnCYx5HWfUn6eeCh2UsUr2ymMASSMZvqOuuw9bNDYM1q9
         knOW0NlcgCuNoTGuSpH8H0qAf+x+/f207YjIil7yQmb45IXAWdiaAcWfe6csO5tMCRsi
         eVV/2UCZfttvZrjtb+ghxC7ITpMcHKkZhjldyvn75FARczH8uX0iJ15ydXJUIoY3FV4O
         5rbpLLdEQkIpnGm0gYhJnvMW98vovgo4o3Em0+TmDaiFTl9CYzSyS93x9yyChl8p5nNU
         vhUw==
X-Gm-Message-State: AOAM531ja3Og2SVKkw6eZtLmm9kGIqXqWrIWqugZbN4CoQtRJLxkICG7
	IYV/Z5t7rlgAaclLMtFLXaHfcSXbS2Z9CgeIkwnkCLe2kXerMyW5mZOaumGhMOhhyJSCq158z+g
	alEkhqMssWtQuSs+5Xzm0RMlggTU=
X-Received: by 2002:a7b:c219:: with SMTP id x25mr9238902wmi.125.1632906190953;
        Wed, 29 Sep 2021 02:03:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAVvczz8jUTCdMNZ0BC5qvezoqKUBOcf5OajF0CWmKLmPAPf0K3OR8WEfpMUG5vsV5dclhgg==
X-Received: by 2002:a7b:c219:: with SMTP id x25mr9238872wmi.125.1632906190770;
        Wed, 29 Sep 2021 02:03:10 -0700 (PDT)
Subject: Re: [PATCH v1 2/8] x86/xen: simplify xen_oldmem_pfn_is_ram()
From: David Hildenbrand <david@redhat.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, x86@kernel.org,
 xen-devel@lists.xenproject.org, virtualization@lists.linux-foundation.org,
 kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20210928182258.12451-1-david@redhat.com>
 <20210928182258.12451-3-david@redhat.com>
 <4ab2f8c2-c3d5-30b3-a670-a8b38e218b6e@oracle.com>
 <bfe72f46-9a0d-1a87-64bd-4b03999edd1e@redhat.com>
Organization: Red Hat
Message-ID: <e9a230f9-85cb-d4c1-8027-508b7c344d94@redhat.com>
Date: Wed, 29 Sep 2021 11:03:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bfe72f46-9a0d-1a87-64bd-4b03999edd1e@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.09.21 10:45, David Hildenbrand wrote:
>>
>> How about
>>
>>       return a.mem_type != HVMMEM_mmio_dm;
>>
> 
> Ha, how could I have missed that :)
> 
>>
>> Result should be promoted to int and this has added benefit of not requiring changes in patch 4.
>>
> 
> Can we go one step further and do
> 
> 
> @@ -20,24 +20,11 @@ static int xen_oldmem_pfn_is_ram(unsigned long pfn)
>           struct xen_hvm_get_mem_type a = {
>                   .domid = DOMID_SELF,
>                   .pfn = pfn,
> +               .mem_type = HVMMEM_ram_rw,
>           };
> -       int ram;
>    
> -       if (HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a))
> -               return -ENXIO;
> -
> -       switch (a.mem_type) {
> -       case HVMMEM_mmio_dm:
> -               ram = 0;
> -               break;
> -       case HVMMEM_ram_rw:
> -       case HVMMEM_ram_ro:
> -       default:
> -               ram = 1;
> -               break;
> -       }
> -
> -       return ram;
> +       HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a);
> +       return a.mem_type != HVMMEM_mmio_dm;
>    }
>    #endif
> 
> 
> Assuming that if HYPERVISOR_hvm_op() fails that
> .mem_type is not set to HVMMEM_mmio_dm.
> 

Okay we can't, due to "__must_check" ...

-- 
Thanks,

David / dhildenb


