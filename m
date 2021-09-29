Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9AB41C0F2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198856.352574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVDs-0006EV-0Q; Wed, 29 Sep 2021 08:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198856.352574; Wed, 29 Sep 2021 08:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVDr-0006B2-Sg; Wed, 29 Sep 2021 08:45:51 +0000
Received: by outflank-mailman (input) for mailman id 198856;
 Wed, 29 Sep 2021 08:45:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NQqk=OT=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mVVDp-0006Av-NP
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:45:49 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 00b06123-e617-4a03-876b-6382a1d85a59;
 Wed, 29 Sep 2021 08:45:49 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-ea6IgI18M3OMzyRxCb88eQ-1; Wed, 29 Sep 2021 04:45:47 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 17-20020a05600c029100b00305eac9f29aso579110wmk.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Sep 2021 01:45:47 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
 by smtp.gmail.com with ESMTPSA id
 t126sm893773wma.4.2021.09.29.01.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 01:45:45 -0700 (PDT)
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
X-Inumbo-ID: 00b06123-e617-4a03-876b-6382a1d85a59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632905148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gvu4L83YOBGLGvWqLGUuGEaO/DEUZyEQ1rFR5bn6b8M=;
	b=JX8sXbowIGFwf7cZnZnH3wolVvbBg/04UwcHDM4LArKbK7y5RdnLF7GKBfNlCIqxj7WeYb
	EJQIzjv+Oko8xuDDKM8M1tO52KUIC4K0DaVpqAhlyP0JmqIwixnUFtYcSt5jJSOtPXDc77
	LK4n2WibCqgob34LQwQqKU6A/2Ads4g=
X-MC-Unique: ea6IgI18M3OMzyRxCb88eQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Gvu4L83YOBGLGvWqLGUuGEaO/DEUZyEQ1rFR5bn6b8M=;
        b=gFNDIsRUnCWhwCrxyg8q/sxxkd/Wg0yKyGaTHmROkaWBba8R5JC3Zis3p2ZdULvBG2
         PQP9IFYZxMWDkl/6t3+LLRaTzvk7+XhBnANIyMChdjFlKyNwCzW5pD43aDjTGHGpOhRz
         dnAp2muBWcSehGsWtzAPq5anf41RYNjlNKZZ7bdwAbKiNni+iIczlqGav1lYs+NBfgTT
         DHJt9ic/AMpVHolLu4Hqq0ZHcJ9HG0PcAqFCLPDsNjC5o3ayjnijqKuc2v3bLvjn+uSt
         MxiiySvutsna2DO0BVk12ASAZ9k3UvJJKlxlB6WCQr+qaCVR/X11/+uAtzo65BdePL1M
         q+BQ==
X-Gm-Message-State: AOAM533hZjR5jUlDjzh3MMBAac/viXeBP1Njz9M5VGgDOLuJBycEhWDj
	0molHrw83NA+/DEjqUSGKd2dNoFNn9I0UrbkQr2oxR38NVg3ibPcTHlnRnVU/H3oXjViYBKSU/0
	PlkHmaRyby2Z9tEoAHS9iy2ypefY=
X-Received: by 2002:a1c:7c0f:: with SMTP id x15mr8734511wmc.149.1632905146275;
        Wed, 29 Sep 2021 01:45:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaikWIkzzrJGqHValULa/ZmnNfg4rl1LyjKqzMWVt+gz9mbskxaXhni5v3m042+vSd753h3g==
X-Received: by 2002:a1c:7c0f:: with SMTP id x15mr8734485wmc.149.1632905146123;
        Wed, 29 Sep 2021 01:45:46 -0700 (PDT)
Subject: Re: [PATCH v1 2/8] x86/xen: simplify xen_oldmem_pfn_is_ram()
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <bfe72f46-9a0d-1a87-64bd-4b03999edd1e@redhat.com>
Date: Wed, 29 Sep 2021 10:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4ab2f8c2-c3d5-30b3-a670-a8b38e218b6e@oracle.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

> 
> How about
> 
>      return a.mem_type != HVMMEM_mmio_dm;
> 

Ha, how could I have missed that :)

> 
> Result should be promoted to int and this has added benefit of not requiring changes in patch 4.
> 

Can we go one step further and do


@@ -20,24 +20,11 @@ static int xen_oldmem_pfn_is_ram(unsigned long pfn)
         struct xen_hvm_get_mem_type a = {
                 .domid = DOMID_SELF,
                 .pfn = pfn,
+               .mem_type = HVMMEM_ram_rw,
         };
-       int ram;
  
-       if (HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a))
-               return -ENXIO;
-
-       switch (a.mem_type) {
-       case HVMMEM_mmio_dm:
-               ram = 0;
-               break;
-       case HVMMEM_ram_rw:
-       case HVMMEM_ram_ro:
-       default:
-               ram = 1;
-               break;
-       }
-
-       return ram;
+       HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a);
+       return a.mem_type != HVMMEM_mmio_dm;
  }
  #endif


Assuming that if HYPERVISOR_hvm_op() fails that
.mem_type is not set to HVMMEM_mmio_dm.

-- 
Thanks,

David / dhildenb


