Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D2AA5E732
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 23:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910867.1317466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsUOR-0003yu-NR; Wed, 12 Mar 2025 22:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910867.1317466; Wed, 12 Mar 2025 22:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsUOR-0003wa-KY; Wed, 12 Mar 2025 22:17:39 +0000
Received: by outflank-mailman (input) for mailman id 910867;
 Wed, 12 Mar 2025 22:17:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFa6=V7=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1tsUOQ-0003wU-Hy
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 22:17:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c902e66f-ff8f-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 23:17:29 +0100 (CET)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-t8R2WAC7P6O7eHZ_2ULvZw-1; Wed, 12 Mar 2025 18:17:23 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39130f02631so140815f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 15:17:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:7c00:4ac1:c2c4:4167:8a0f?
 (p200300d82f1a7c004ac1c2c441678a0f.dip0.t-ipconnect.de.
 [2003:d8:2f1a:7c00:4ac1:c2c4:4167:8a0f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c4f9d59dsm62270f8f.0.2025.03.12.15.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 15:17:20 -0700 (PDT)
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
X-Inumbo-ID: c902e66f-ff8f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741817848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GjIBl5yndOQdnleTRVmAst04zzkiJlZJAcEZZ6NnjC8=;
	b=aB+onykU416EHhh48QzWBn0Nm0H7C+cS5O4i2WyKNjlXarUNtDnEBrjG52XOAJRb8EQj4P
	nYornZtXI4WFvKRvHZWMfuXH7GujPfmRRc3nBEZ3eY+9SaA2EqEMB8+QVmaje+2wcplsnG
	/wNggY0jhTDtV18/fBg/VxBN2S56bAE=
X-MC-Unique: t8R2WAC7P6O7eHZ_2ULvZw-1
X-Mimecast-MFC-AGG-ID: t8R2WAC7P6O7eHZ_2ULvZw_1741817841
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741817841; x=1742422641;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GjIBl5yndOQdnleTRVmAst04zzkiJlZJAcEZZ6NnjC8=;
        b=WGLpBmvxwRT5hPF2xA7uQ9tOXj4LeacgJBtwXfcxVMnk9kPyOpoAgUEtrMHjgtoYZZ
         CS0QmBRIxesFTaNGTwLqx73JAWeJv2iw5BwKTqq+lRUkH2vt3Dxds1d730ucnXiSZ/ZJ
         98oz7vKsWLLNMr8zpxQV4vSVeAqKmZJYJIU9Qoe0rOBBrW45+vw6K07lSI4jhYqKQfwD
         cvJbnyQZnpbbgIWnJVlopKa9qWJ3lm/x761/1I6r0UDFX0MH3lwPt8cUnirB3wX4Is8v
         211hqCrHsg2cJwzC1RiaAxrvFsDm809nbjK7ykaN2jGwwxgPXRfKk/KRe9YwsB+iIu9R
         XDOA==
X-Forwarded-Encrypted: i=1; AJvYcCWPqWz/aKCq1s7/yEWgk9qRmtkx3Df97T5jGsdEkeFHG/ADVL6sY8hmfiY8j4eS0R7Lu5pOxxIZ1l0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyl4IFXAtdBgstNIWX3jVBVqzDyA+hhmQdHRceRWp2kSGG9eA2J
	4YJ8OoDr2HuEmV2uCdO5MPSb3nSfFgoaDWP2Q6PoM+jYueYgpxFTBOLOGkJBFC1cGYfjfgVrCgJ
	OlPoUC3zhDKgiYeQTaQ/bYL3ygTUNz3OXwHCB7j7use2Kh7D2HIagGcoPfC9ljqSs
X-Gm-Gg: ASbGncvu+wrEXFNG5774fQAd/oD92s8ZM4GoZTptN8//9rvetoLagbE45KrujLvqUck
	bdIFzZ5IKGM8UTjQ3R1AhopgTfpkbgxyallwcqZYHB1L+Rd5WDrAERtu06lfsGu7qlStU/7aCBP
	Y+iwD8WfdPmRG/eLcorLDB5vvVxNR5YAuIU3Pqr2exUuu2EOIvKvnhUD3iM0zh79nb8Tgxovff0
	BGb1Tq1CSbDB3vwbySEcoctTs5OE8YTgwnnE1NqquVaE2gPTdi6MIHxaS0TrIExRnAMxFq030zB
	B35OAiB+P7pfpKYTBMDBsoOybekSVAuYOwBl2vGo5o/PmOqdMSKesqSUXlf7+y5dEuCqjua4ULF
	MFPHv1JV1enwsLMDQh8EhnpnjK1PIXN94ym4CZFrI2H0=
X-Received: by 2002:a05:6000:156d:b0:391:2192:ccd6 with SMTP id ffacd0b85a97d-3926c1cd9e5mr10444698f8f.39.1741817841286;
        Wed, 12 Mar 2025 15:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7ajs+DbkvWkZrtvS3kgtwWoElT+oDfxGjlF1xcQLWnYsT+dOgzewtbm0o82DOv1DRYwzp5A==
X-Received: by 2002:a05:6000:156d:b0:391:2192:ccd6 with SMTP id ffacd0b85a97d-3926c1cd9e5mr10444674f8f.39.1741817840917;
        Wed, 12 Mar 2025 15:17:20 -0700 (PDT)
Message-ID: <26e942e3-4e06-4644-b19b-ae0301bf9b2a@redhat.com>
Date: Wed, 12 Mar 2025 23:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/5] vmx_balloon: update the NR_BALLOON_PAGES state
To: Nico Pache <npache@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, jerrin.shaji-george@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
 eperezma@redhat.com, jgross@suse.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, akpm@linux-foundation.org,
 hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
 shakeel.butt@linux.dev, muchun.song@linux.dev, nphamcs@gmail.com,
 yosry.ahmed@linux.dev, kanchana.p.sridhar@intel.com,
 alexander.atanasov@virtuozzo.com
References: <20250312000700.184573-1-npache@redhat.com>
 <20250312000700.184573-5-npache@redhat.com>
 <20250312025607-mutt-send-email-mst@kernel.org>
 <CAA1CXcDjEErb2L85gi+W=1sFn73VHLto09nG6f1vS+10o4PctA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAA1CXcDjEErb2L85gi+W=1sFn73VHLto09nG6f1vS+10o4PctA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: miGkV1RFSXSFwCK_XJ2bOThIdZi3DvlvDexyKggCr_8_1741817841
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.03.25 21:11, Nico Pache wrote:
> On Wed, Mar 12, 2025 at 12:57 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Tue, Mar 11, 2025 at 06:06:59PM -0600, Nico Pache wrote:
>>> Update the NR_BALLOON_PAGES counter when pages are added to or
>>> removed from the VMware balloon.
>>>
>>> Signed-off-by: Nico Pache <npache@redhat.com>
>>> ---
>>>   drivers/misc/vmw_balloon.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
>>> index c817d8c21641..2c70b08c6fb3 100644
>>> --- a/drivers/misc/vmw_balloon.c
>>> +++ b/drivers/misc/vmw_balloon.c
>>> @@ -673,6 +673,8 @@ static int vmballoon_alloc_page_list(struct vmballoon *b,
>>>
>>>                        vmballoon_stats_page_inc(b, VMW_BALLOON_PAGE_STAT_ALLOC,
>>>                                                 ctl->page_size);
>>> +                     mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
>>> +                             vmballoon_page_in_frames(ctl->page_size));
>>
>>
>> same issue as virtio I think - this counts frames not pages.
> I agree with the viritio issue since PAGE_SIZE can be larger than
> VIRTIO_BALLOON_PFN_SHIFT, resulting in multiple virtio_balloon pages
> for each page. I fixed that one, thanks!
> 
> For the Vmware one, the code is littered with mentions of counting in
> 4k or 2M but as far as I can tell from looking at the code it actually
> operates in PAGE_SIZE or PMD size chunks and this count would be
> correct.
> Perhaps I am missing something though.

vmballoon_page_in_frames() documents to "Return: the number of 4k 
frames.", because it supports either 4k or 2M chunks IIRC.

I think the catch is that PAGE_SIZE will in these configs always be 4k. 
Otherwise things like vmballoon_mark_page_offline() wouldn't work as 
expected.

So I think this is correct.

-- 
Cheers,

David / dhildenb


