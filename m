Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1CB7409C7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 09:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556335.868780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEPnv-0002Pq-NV; Wed, 28 Jun 2023 07:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556335.868780; Wed, 28 Jun 2023 07:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEPnv-0002NU-Km; Wed, 28 Jun 2023 07:41:31 +0000
Received: by outflank-mailman (input) for mailman id 556335;
 Wed, 28 Jun 2023 07:41:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eIKH=CQ=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1qEPnt-0002NO-Ho
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 07:41:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3015fd41-1587-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 09:41:27 +0200 (CEST)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-gnqE8qFxMz-gRsOfKocUdg-1; Wed, 28 Jun 2023 03:41:22 -0400
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4edbdd8268bso4851652e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jun 2023 00:41:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c715:ef00:fa40:f6df:a68d:a0e4?
 (p200300cbc715ef00fa40f6dfa68da0e4.dip0.t-ipconnect.de.
 [2003:cb:c715:ef00:fa40:f6df:a68d:a0e4])
 by smtp.gmail.com with ESMTPSA id
 hn10-20020a05600ca38a00b003fba586100fsm3970092wmb.6.2023.06.28.00.41.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 00:41:20 -0700 (PDT)
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
X-Inumbo-ID: 3015fd41-1587-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687938086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SH32jNlN6Jqg7DPKFWcTzn8QudVshhtxY6DizRJx1h4=;
	b=Fz4IIN84tOBJ9RZKWNlH8ThOWFhnJfLbuwsl2Xfo5krBuqLiY7URpNFluNvdsrcjRRJ0eU
	stIKMPRgvt9x3w7Cm8O0r94bt6tT7e47xkdehSPo7poIxHuSreTOwN3e+xzeGUXrDeDapc
	JGnab5Xig7oS0pi/voMx65AXIp1Us7s=
X-MC-Unique: gnqE8qFxMz-gRsOfKocUdg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687938081; x=1690530081;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SH32jNlN6Jqg7DPKFWcTzn8QudVshhtxY6DizRJx1h4=;
        b=W6RC6wYdEgExBBrzWVWDhukd1ie1/kUltjsFvIITHRJuQyNb2cO5NZOs5ix/ggnlFC
         3C9oeg/BJLH3xJqgK7NfyIqImNeunX0fJTx6VnzBtGf7qdocHMT8bqGffjq6rXqU5h5P
         TEBUgUyAsqZYE5nU7bgxX/piCmN4Qc8eN3K6bOyHg6RsUAEzSov+OjoqVZNpx8AnEIN2
         D2+fLrvPoDVnM5zy6R8S2VLV7wQZScrh50tSJr97h7dVSs2zGbQ3l4bv9XRXe/OOSx9g
         6g8ZrcShlhNbap7OQzJBZQ+qiWycQLYFtCBuge02IZvWw3gzJu1fu63S3EkX1umSbzKi
         ao/Q==
X-Gm-Message-State: AC+VfDyySJj+7i0Mx9P5T0y20e23pjUvNsTiQUErSbQM0RT4bxhnxr1C
	NxH1fpapdgZ5EyXQCfEqITo1ERnwfc/Alx7OP5Piagi7/zhruYVKfHOw+lpBLg4FTrnOKHsgNX5
	4dIJ/UwtQTjLBTeeV8ekGs4Nf8Rs=
X-Received: by 2002:a05:6512:10cb:b0:4fb:9341:9921 with SMTP id k11-20020a05651210cb00b004fb93419921mr540056lfg.52.1687938081198;
        Wed, 28 Jun 2023 00:41:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/LL8Q6ptsPVewMKWY4urM5AzIoWSMnfr2lL0PypvevicnXRpVgfkYzOOBDpLnug9qgwbQPw==
X-Received: by 2002:a05:6512:10cb:b0:4fb:9341:9921 with SMTP id k11-20020a05651210cb00b004fb93419921mr540021lfg.52.1687938080672;
        Wed, 28 Jun 2023 00:41:20 -0700 (PDT)
Message-ID: <26282cb8-b6b0-f3a0-e82d-b4fec45c5f72@redhat.com>
Date: Wed, 28 Jun 2023 09:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Hugh Dickins <hughd@google.com>
Cc: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "David S. Miller" <davem@davemloft.net>, Richard Weinberger
 <richard@nod.at>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
 <e8992eee-4140-427e-bacb-9449f346318@google.com>
 <ac1c162c-07d8-6084-44ca-a2c1a4183df2@redhat.com>
 <90e643ca-de72-2f4c-f4fe-35e06e1a9277@google.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
In-Reply-To: <90e643ca-de72-2f4c-f4fe-35e06e1a9277@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.06.23 22:13, Hugh Dickins wrote:
> On Tue, 27 Jun 2023, David Hildenbrand wrote:
>> On 27.06.23 06:44, Hugh Dickins wrote:
>>> On Mon, 26 Jun 2023, Vishal Moola (Oracle) wrote:
>>>
>>>> The MM subsystem is trying to shrink struct page. This patchset
>>>> introduces a memory descriptor for page table tracking - struct ptdesc.
>>> ...
>>>>    39 files changed, 686 insertions(+), 455 deletions(-)
>>>
>>> I don't see the point of this patchset: to me it is just obfuscation of
>>> the present-day tight relationship between page table and struct page.
>>>
>>> Matthew already explained:
>>>
>>>> The intent is to get ptdescs to be dynamically allocated at some point
>>>> in the ~2-3 years out future when we have finished the folio project ...
>>>
>>> So in a kindly mood, I'd say that this patchset is ahead of its time.
>>> But I can certainly adapt to it, if everyone else sees some point to it.
>>
>> I share your thoughts, that code churn which will help eventually in the far,
>> far future (not wanting to sound too pessimistic, but it's not going to be
>> there tomorrow ;) ).
>>
>> However, if it's just the same as the other conversions we already did (e.g.,
>> struct slab), then I guess there is no reason to stop now -- the obfuscation
>> already happened.
>>
>> ... or is there a difference regarding this conversion and the previous ones?
> 
> I was aware of the struct slab thing, didn't see much point there myself
> either; but it was welcomed by Vlastimil, and barely affected outside of
> slab allocators, so I had no reason to object.
> 
> You think that if a little unnecessary churn (a *lot* of churn if you
> include folios, which did save some repeated calls to compound_head())
> has already occurred, that's a good precedent for allowing more and more?

Well, if you phrase it like that ... no, I'm not in favor of unnecessary 
churn at all. Yes, folios were/are a lot of churn (IMHO not unnecessary, 
though).

I'm not a friend of these "overlays"; it all only really makes sense to 
me once we actually allocate the descriptors dynamically. Maybe some of 
the existing/ongoing conversions were different (that's why I was asking 
for the difference, as you said the "struct slab" thing was well received).

If they are primarily only unnecessary churn for now (and unclear 
when/how it will become useful), I share your opinion.

-- 
Cheers,

David / dhildenb


