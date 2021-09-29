Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E9741C7D9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 17:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199224.353142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVbB2-0008Ng-6B; Wed, 29 Sep 2021 15:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199224.353142; Wed, 29 Sep 2021 15:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVbB2-0008Lf-1j; Wed, 29 Sep 2021 15:07:20 +0000
Received: by outflank-mailman (input) for mailman id 199224;
 Wed, 29 Sep 2021 15:07:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NQqk=OT=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mVbB0-0008LY-5p
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 15:07:18 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ef5b9445-2136-11ec-bd0f-12813bfff9fa;
 Wed, 29 Sep 2021 15:07:17 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-buY_zqtcOh2t29buqRu-Dw-1; Wed, 29 Sep 2021 11:07:14 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so1361613wmc.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Sep 2021 08:07:13 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
 by smtp.gmail.com with ESMTPSA id
 f8sm177044wrx.15.2021.09.29.08.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 08:07:12 -0700 (PDT)
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
X-Inumbo-ID: ef5b9445-2136-11ec-bd0f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632928036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gapF6Q7MxbKj+/Jpg0HNCHa+0ngI63VYNLFNHFDInM4=;
	b=KM8YB6ciT9CY51YYfZdK61z7iUAtHYXNHB1ZJ8fpmZyP0UrhOHXBGnTimY0jE0uxLJ+SXR
	yZZNjyqnG+w1t7LH71OrlenCXfMGSpg1RlNDY54gu1a3oo3DN4FaHbcVN0WHEAOaxM5wyJ
	rTLtvokMYRooahm2NYzm6Af+dcD4fxg=
X-MC-Unique: buY_zqtcOh2t29buqRu-Dw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gapF6Q7MxbKj+/Jpg0HNCHa+0ngI63VYNLFNHFDInM4=;
        b=c/6kbwthcfUKWJyDKLKW/gjTjYKAFX6JekASPcHnKzeUNdRFJAoxyQCfecIygS5nrk
         Ta+GLoF3bPok5E6oZhzLd+NU1EwrkSj/wuAjbbsbPUQFtF3cbuTLoWsieN7qmxyDHTkQ
         cBD+iI8tldiXghHLa/EA1B2lyAKjO2BNsGfmWczTUgTXpreor27neBMvG3V0JIiSlHAE
         xE5iLOPojB8rY5V+g2ZKYiPQ8LGKYPxu9uDbqQGY5mQUJBjiANh05zzCRPGJy8KH+06p
         jGdy8Ud4Rh/TrYAOR4uKDCIudW2OqalHhBDLSdkNvB9Wbcj3LFNzCzRJlqV+hA8oTlLc
         yH+g==
X-Gm-Message-State: AOAM530wM+9tjsMX6NcY++54r167pCla21Ru0JjEtMwRA0KyaFhB8KWp
	d8xpac0HAYg5frYZWexGvQplGee3AUjqDdUUvZHElmzrx07cKcix8wAlD9bm/d4ABVIxOdSzKDy
	e8+Qrcea3qTGo3Fmldsbkv9O2xMs=
X-Received: by 2002:a5d:4e4e:: with SMTP id r14mr378694wrt.147.1632928032838;
        Wed, 29 Sep 2021 08:07:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo/OiD1pi8Vj8uvbtvhFWxk5A000qCxnhsR/1CMHH5asTCVBPsn8x+8H3lxRFK4haIMhJq1A==
X-Received: by 2002:a5d:4e4e:: with SMTP id r14mr378630wrt.147.1632928032598;
        Wed, 29 Sep 2021 08:07:12 -0700 (PDT)
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
 <bfe72f46-9a0d-1a87-64bd-4b03999edd1e@redhat.com>
 <e9a230f9-85cb-d4c1-8027-508b7c344d94@redhat.com>
 <3b935aa0-6d85-0bcd-100e-15098add3c4c@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e6ace8c8-8a2d-9bf7-e65b-91d0037c4d08@redhat.com>
Date: Wed, 29 Sep 2021 17:07:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3b935aa0-6d85-0bcd-100e-15098add3c4c@oracle.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.09.21 16:22, Boris Ostrovsky wrote:
> 
> On 9/29/21 5:03 AM, David Hildenbrand wrote:
>> On 29.09.21 10:45, David Hildenbrand wrote:
>>>>
>>> Can we go one step further and do
>>>
>>>
>>> @@ -20,24 +20,11 @@ static int xen_oldmem_pfn_is_ram(unsigned long pfn)
>>>            struct xen_hvm_get_mem_type a = {
>>>                    .domid = DOMID_SELF,
>>>                    .pfn = pfn,
>>> +               .mem_type = HVMMEM_ram_rw,
>>>            };
>>> -       int ram;
>>>     -       if (HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a))
>>> -               return -ENXIO;
>>> -
>>> -       switch (a.mem_type) {
>>> -       case HVMMEM_mmio_dm:
>>> -               ram = 0;
>>> -               break;
>>> -       case HVMMEM_ram_rw:
>>> -       case HVMMEM_ram_ro:
>>> -       default:
>>> -               ram = 1;
>>> -               break;
>>> -       }
>>> -
>>> -       return ram;
>>> +       HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a);
>>> +       return a.mem_type != HVMMEM_mmio_dm;
> 
> 
> I was actually thinking of asking you to add another patch with pr_warn_once() here (and print error code as well). This call failing is indication of something going quite wrong and it would be good to know about this.

Will include a patch in v2, thanks!


-- 
Thanks,

David / dhildenb


