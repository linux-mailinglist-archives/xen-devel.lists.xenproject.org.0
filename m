Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D6F903819
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 11:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738215.1144895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGy21-00073H-Ts; Tue, 11 Jun 2024 09:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738215.1144895; Tue, 11 Jun 2024 09:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGy21-000717-QS; Tue, 11 Jun 2024 09:43:09 +0000
Received: by outflank-mailman (input) for mailman id 738215;
 Tue, 11 Jun 2024 09:43:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I6Ds=NN=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1sGy1z-0006zn-Py
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 09:43:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0001f2fb-27d7-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 11:43:05 +0200 (CEST)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-kVRicqTLOXGsh_la4MqUdw-1; Tue, 11 Jun 2024 05:43:00 -0400
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-52bbd8ac2c1so3189025e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 02:43:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c748:ba00:1c00:48ea:7b5a:c12b?
 (p200300cbc748ba001c0048ea7b5ac12b.dip0.t-ipconnect.de.
 [2003:cb:c748:ba00:1c00:48ea:7b5a:c12b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2cd247sm176185215e9.40.2024.06.11.02.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 02:42:57 -0700 (PDT)
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
X-Inumbo-ID: 0001f2fb-27d7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718098984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4Fvo4snqjmjLL5YGwAq7AoShRlEWBSMshPzLS47jMwA=;
	b=bDEHSvn1pkrM2xWjOzrnCT7EE58Kqp+J1PxYmA1sw/NIWno3Wy+9Gzd5/qpDrmPb5T6tA2
	mcxAGUqAjlf24ZEcRSUndxkziTAJvIWMla8SgkUoCjZlsHFWoW443/XwClFEFKK+x1FeeR
	8oSBs4RTnMqlv4D9E2GOolxdUMEKznE=
X-MC-Unique: kVRicqTLOXGsh_la4MqUdw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098979; x=1718703779;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Fvo4snqjmjLL5YGwAq7AoShRlEWBSMshPzLS47jMwA=;
        b=X2zqVxPT7EBS1b2vRnAAqytEY/9CguKR/Oo1ABHk2HMrmScJne8rvCvWCHMl6bQ1Pr
         gaKkQrUgI64dwtzG3WYL7g7G/3MbsP8NJSKHTvUTuLICyiw8ns4K8jNgBhFCtYC4WFP5
         +86KQSMTtAgoStGVPtAPsAgJODcN2SU6O+WEcbj+keGtJYnDvFve7/9YFs0eD9DgKdND
         2956t10CmGRnoyXpcwr1APAtVjSPzBTpoqOaNVYUBHy+xEwZRD6AFhS4EQJmL0VA/uzB
         1mO4IugAdEjjcFcaaTJRpgsUe7MwNyEmdhg9P9lnv9RbncAFRQMvlxrw3E7Rhabq4lYs
         I77g==
X-Forwarded-Encrypted: i=1; AJvYcCW2ud+BCLIAb6/AaBYlapr/W8B7q+PQq/X3vObR+dyzVGahWad1XAnpmAj82VHPRS+IDJbqR6mfGz85DAfFMOxLH043lqiVf6dj5T1zSJE=
X-Gm-Message-State: AOJu0YxEIBDzAyxcnQVtliLz8OCLd12AMlSTH1W64BCB55Iagz8JKZpF
	Q5raCRQG5/NAwVI4lAdXYO30YuFHvPAGoKo6wkemo3S3R5eL3i0rzHHsHNnhfbW4BDAR1XujQ1u
	Tnbs+FEvq1KQkkbxjpFeFTi0Sa7g6VH88cV8uo7tNCse+eDuxl6j5SeejIG4LEpUo
X-Received: by 2002:ac2:5a43:0:b0:52b:e7ff:4eb7 with SMTP id 2adb3069b0e04-52be7ff4ed8mr5513980e87.59.1718098978996;
        Tue, 11 Jun 2024 02:42:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXolbyC1nt04woF61IXkeFzl40jH1amuFwhtMdKb0jcnAeO4WTr7EvpCOinxTpGFsUzHiFKA==
X-Received: by 2002:ac2:5a43:0:b0:52b:e7ff:4eb7 with SMTP id 2adb3069b0e04-52be7ff4ed8mr5513958e87.59.1718098978571;
        Tue, 11 Jun 2024 02:42:58 -0700 (PDT)
Message-ID: <824c319a-530e-4153-80f5-20e2c463fa81@redhat.com>
Date: Tue, 11 Jun 2024 11:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] mm/memory_hotplug: initialize memmap of
 !ZONE_DEVICE with PageOffline() instead of PageReserved()
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 kasan-dev@googlegroups.com, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>
References: <20240607090939.89524-1-david@redhat.com>
 <20240607090939.89524-3-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240607090939.89524-3-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.06.24 11:09, David Hildenbrand wrote:
> We currently initialize the memmap such that PG_reserved is set and the
> refcount of the page is 1. In virtio-mem code, we have to manually clear
> that PG_reserved flag to make memory offlining with partially hotplugged
> memory blocks possible: has_unmovable_pages() would otherwise bail out on
> such pages.
> 
> We want to avoid PG_reserved where possible and move to typed pages
> instead. Further, we want to further enlighten memory offlining code about
> PG_offline: offline pages in an online memory section. One example is
> handling managed page count adjustments in a cleaner way during memory
> offlining.
> 
> So let's initialize the pages with PG_offline instead of PG_reserved.
> generic_online_page()->__free_pages_core() will now clear that flag before
> handing that memory to the buddy.
> 
> Note that the page refcount is still 1 and would forbid offlining of such
> memory except when special care is take during GOING_OFFLINE as
> currently only implemented by virtio-mem.
> 
> With this change, we can now get non-PageReserved() pages in the XEN
> balloon list. From what I can tell, that can already happen via
> decrease_reservation(), so that should be fine.
> 
> HV-balloon should not really observe a change: partial online memory
> blocks still cannot get surprise-offlined, because the refcount of these
> PageOffline() pages is 1.
> 
> Update virtio-mem, HV-balloon and XEN-balloon code to be aware that
> hotplugged pages are now PageOffline() instead of PageReserved() before
> they are handed over to the buddy.
> 
> We'll leave the ZONE_DEVICE case alone for now.
> 

@Andrew, can we add here:

"Note that self-hosted vmemmap pages will no longer be marked as 
reserved. This matches ordinary vmemmap pages allocated from the buddy 
during memory hotplug. Now, really only vmemmap pages allocated from 
memblock during early boot will be marked reserved. Existing 
PageReserved() checks seem to be handling all relevant cases correctly 
even after this change."

-- 
Cheers,

David / dhildenb


