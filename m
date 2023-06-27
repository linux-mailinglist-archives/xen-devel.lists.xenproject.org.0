Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD1273F51E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 09:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555874.868031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE2uM-0001HW-G0; Tue, 27 Jun 2023 07:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555874.868031; Tue, 27 Jun 2023 07:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE2uM-0001Eb-DB; Tue, 27 Jun 2023 07:14:38 +0000
Received: by outflank-mailman (input) for mailman id 555874;
 Tue, 27 Jun 2023 07:14:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLJe=CP=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1qE2uL-0001ET-N9
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 07:14:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45660713-14ba-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 09:14:36 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502--EKyO_lEN2mmsYowDpUkPw-1; Tue, 27 Jun 2023 03:14:33 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fa979d0c32so8080525e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 00:14:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c737:4900:68b3:e93b:e07a:558b?
 (p200300cbc737490068b3e93be07a558b.dip0.t-ipconnect.de.
 [2003:cb:c737:4900:68b3:e93b:e07a:558b])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c22d500b003f96d10eafbsm9778433wmg.12.2023.06.27.00.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 00:14:31 -0700 (PDT)
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
X-Inumbo-ID: 45660713-14ba-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687850075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N1scKhPxxz/YxysE64BuheSdyQmgV4XhiinPf6icWX8=;
	b=gLHtxCt7YxT7fD4RUMsMt5nkuqomgRGHLVnhkE5mtTO9G6qqlrV6MupV/chx6JnAHldSvj
	wk86egqixoIqEzSgzOQ0uzhhe50WyoLlDU0uUS0mQ8IJsOJB9b5honExYv+XEhLrorqKcT
	tv5LsStXpK5QhintwqeKkiF2P9peTmQ=
X-MC-Unique: -EKyO_lEN2mmsYowDpUkPw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687850072; x=1690442072;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1scKhPxxz/YxysE64BuheSdyQmgV4XhiinPf6icWX8=;
        b=VWzjCisqDGRsHyv+GDiqw5gZ0JURRgq4Qhq7Jg0IyFvYrPnrJpaaKsA1V4XL/LCh4D
         YEujccaf0kq/2NPq7rWbB3JizSQHHUo+VzeTvtwet1KlS1Y3Gmr+rTrija7L2iXjhJrG
         A1WOpUvQFR9uOz64fditZBZaM3S/rmhAYwCvg+sS0XyH/Qnt+L+TxB9AxkA11OJYHlcN
         gyGk4VnJ0f2uNTD91tAsTsuinBPKHLoZXQWx4UDttrBXz1GUaruLdD3/u3mXLZIDug63
         pb08mZquSknJvRSr4VI0LRi5HaPBT/mDJ7x3p2+klpupMmv9tCfH3VXjCVKW3LJGYsrU
         TSnQ==
X-Gm-Message-State: AC+VfDwMlwnlsVKj8W1Qz1FHl0h75YG2u/9TWOiB2zyJbGu6drkg6wxV
	/Je8dIz/3sjFGMmuCrluTdmSFMw3rzK9Iid0/bjEoE+K/7umX58VC10FGXyA0axkolVsuOjbwRr
	bRZhVCwX8b/AE0CkDvlPC/mrLW1k=
X-Received: by 2002:a05:600c:3655:b0:3fa:9d0f:f1e1 with SMTP id y21-20020a05600c365500b003fa9d0ff1e1mr2936789wmq.35.1687850072226;
        Tue, 27 Jun 2023 00:14:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HIpOGvancvhac5jw2GR0kOhKc72MxDndtCuN9HZ1pSF+uaoBl/D52ddajPiSHV9uK1Eb9sw==
X-Received: by 2002:a05:600c:3655:b0:3fa:9d0f:f1e1 with SMTP id y21-20020a05600c365500b003fa9d0ff1e1mr2936755wmq.35.1687850071891;
        Tue, 27 Jun 2023 00:14:31 -0700 (PDT)
Message-ID: <ac1c162c-07d8-6084-44ca-a2c1a4183df2@redhat.com>
Date: Tue, 27 Jun 2023 09:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
To: Hugh Dickins <hughd@google.com>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <e8992eee-4140-427e-bacb-9449f346318@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.06.23 06:44, Hugh Dickins wrote:
> On Mon, 26 Jun 2023, Vishal Moola (Oracle) wrote:
> 
>> The MM subsystem is trying to shrink struct page. This patchset
>> introduces a memory descriptor for page table tracking - struct ptdesc.
> ...
>>   39 files changed, 686 insertions(+), 455 deletions(-)
> 
> I don't see the point of this patchset: to me it is just obfuscation of
> the present-day tight relationship between page table and struct page.
> 
> Matthew already explained:
> 
>> The intent is to get ptdescs to be dynamically allocated at some point
>> in the ~2-3 years out future when we have finished the folio project ...
> 
> So in a kindly mood, I'd say that this patchset is ahead of its time.
> But I can certainly adapt to it, if everyone else sees some point to it.

I share your thoughts, that code churn which will help eventually in the 
far, far future (not wanting to sound too pessimistic, but it's not 
going to be there tomorrow ;) ).

However, if it's just the same as the other conversions we already did 
(e.g., struct slab), then I guess there is no reason to stop now -- the 
obfuscation already happened.

... or is there a difference regarding this conversion and the previous 
ones?

-- 
Cheers,

David / dhildenb


