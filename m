Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E5941C0C2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198850.352562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVV6R-0004mH-6W; Wed, 29 Sep 2021 08:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198850.352562; Wed, 29 Sep 2021 08:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVV6R-0004jp-2w; Wed, 29 Sep 2021 08:38:11 +0000
Received: by outflank-mailman (input) for mailman id 198850;
 Wed, 29 Sep 2021 08:38:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NQqk=OT=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mVV6P-0004jP-6m
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:38:09 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bfdec212-d0ea-4532-946d-be04bda7a37a;
 Wed, 29 Sep 2021 08:38:08 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-L-gDeITiP5KIMHHqZx5kIg-1; Wed, 29 Sep 2021 04:38:04 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 r66-20020a1c4445000000b0030cf0c97157so882621wma.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Sep 2021 01:38:04 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
 by smtp.gmail.com with ESMTPSA id
 f17sm1497220wrm.83.2021.09.29.01.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 01:38:02 -0700 (PDT)
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
X-Inumbo-ID: bfdec212-d0ea-4532-946d-be04bda7a37a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632904688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/rI4ipp+6p4YsURf5SVEvaXl3JhZmp49Hm7auACiD3c=;
	b=DMfSawGAybfbS151O4N/LvnBQadruDMRXtuIB36ZdHqhhac5RFCmu5iv5l3bSIMCgAcBAM
	yhX2qak3Q1iF10Y96ktyzLl8tZMzLWBHT2iGIMZPZnsin0CxyhXFXdqC1NDhDKY10/vXud
	st+nBFwaXHnmt2iob5qQ2IvrAdlD+Gc=
X-MC-Unique: L-gDeITiP5KIMHHqZx5kIg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/rI4ipp+6p4YsURf5SVEvaXl3JhZmp49Hm7auACiD3c=;
        b=GN10XZc87nSHORmOkyCZgOnI5b6MD0CC1V8ZQ/xI8+57UPQvLrWJTPBiFvqTwXhBzx
         2D72zNGpiYFZ3voljhZ0Fa1UvcUCmuMF0DTjyWyh7yKdj8vUnl8KRULXCWa5MNs6UqEA
         luV0RZ9ONLlUsj5TTbSwPdbY4LD1Yy/o35USVy9cvRysA9uIt7zSaj/aqyCI1FWOTMPx
         lOZedHdbi2/jZnkYfrrT2lJG7Ov03kHz3l2Zp5XjiMMARz2LsxbAo9jHC0+p6dsKPlKV
         pgbmMFyDcie2KEOjRw+pqLy98hw68qUeNv2OfKsYmYlLAMaqE425fB51ESw2Xu7BfzbQ
         XRFg==
X-Gm-Message-State: AOAM530W2rSu2+Lpd0jBwFusEHAprzxI+yrZEPI6l/XJI0lGPIo/S94k
	1jqwwRuRhwKpkYdpL6rRZur0nfZ4tGNUkT9zCSoY+/dJjcMt3O4oZORJQ6LdyXk6Ux5CK8WtI93
	luFQIodxkY9ashDC+NlbCCLuxelo=
X-Received: by 2002:a05:600c:3652:: with SMTP id y18mr8982006wmq.66.1632904683468;
        Wed, 29 Sep 2021 01:38:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1UYD13jo4zi2cV8ML8JLWg6MbDn1wfsjZAud8HZY/udqsA+Bzs8BSxqVjAL69LYYlXkKLHw==
X-Received: by 2002:a05:600c:3652:: with SMTP id y18mr8981980wmq.66.1632904683305;
        Wed, 29 Sep 2021 01:38:03 -0700 (PDT)
Subject: Re: [PATCH v1 8/8] virtio-mem: kdump mode to sanitize /proc/vmcore
 access
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, x86@kernel.org,
 xen-devel@lists.xenproject.org, virtualization@lists.linux-foundation.org,
 kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20210928182258.12451-1-david@redhat.com>
 <20210928182258.12451-9-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e01cdc7f-cda8-3268-c971-1255a71fb8ac@redhat.com>
Date: Wed, 29 Sep 2021 10:38:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210928182258.12451-9-david@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

[...]

> +
> +static bool virtio_mem_vmcore_pfn_is_ram(struct vmcore_cb *cb,
> +					 unsigned long pfn)
> +{
> +	struct virtio_mem *vm = container_of(cb, struct virtio_mem,
> +					     vmcore_cb);
> +	uint64_t addr = PFN_PHYS(pfn);
> +	bool is_ram;
> +	int rc;
> +
> +	if (!virtio_mem_contains_range(vm, addr, addr + PAGE_SIZE))

Some more testing revealed that this has to be

if (!virtio_mem_contains_range(vm, addr, PAGE_SIZE))


-- 
Thanks,

David / dhildenb


