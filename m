Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5390FA4E55C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 17:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901289.1309257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpUwy-0007DA-Bn; Tue, 04 Mar 2025 16:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901289.1309257; Tue, 04 Mar 2025 16:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpUwy-0007A0-82; Tue, 04 Mar 2025 16:16:56 +0000
Received: by outflank-mailman (input) for mailman id 901289;
 Tue, 04 Mar 2025 16:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwvO=VX=cc.itu.edu.tr=root@srs-se1.protection.inumbo.net>)
 id 1tpUww-00079u-S2
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 16:16:55 +0000
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1356c45d-f914-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 17:16:50 +0100 (CET)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 5C5B340CEC88
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 19:16:48 +0300 (+03)
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6glg4JR4zG2r3
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 19:15:59 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 7187042724; Tue,  4 Mar 2025 19:15:45 +0300 (+03)
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id C159B43221
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:32:24 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
 by fgw1.itu.edu.tr (Postfix) with SMTP id 957443063EFF
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:32:24 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by am.mirrors.kernel.org (Postfix) with ESMTPS id F01721893D34
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6401F4193;
 Mon,  3 Mar 2025 10:30:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25661F1905
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 10:30:07 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-tnGv85UwP9S0nPUri8jj5g-1; Mon, 03 Mar 2025 05:30:05 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4399304b329so19191485e9.3
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 02:30:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:9600:af27:4326:a216:2bfb?
 (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de.
 [2003:cb:c734:9600:af27:4326:a216:2bfb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7b6asm14383034f8f.51.2025.03.03.02.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 02:30:03 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1356c45d-f914-11ef-9898-31a8f345e629
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KZtc5OV4
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KZtc5OV4
X-Envelope-From: <linux-kernel+bounces-541379-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KZtc5OV4
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KZtc5OV4"
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740997809; cv=none; b=hYQY+3oAZKStz2ByieBNt24QJE6SxnX718khX7pUxXY+xjWO+GlMDsP7uRgCbJNZHSBLDIDaNsF9w9Wro9IJUlG+F7IHNrkQ7BVnV5M/2dW1E1491Jjv6cUpOoBTaAwCMHvBz2bVue+LlKZ3Fcp+DTsGVQAFAG/t3JqYaf43JN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740997809; c=relaxed/simple;
	bh=UV+fNTBbDPNvHmzvbwDtpiyYBuV69xe7oYGvZxbLxGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bSAUeeeET64rsCdFeC2Vx8MI3eUv4GfuRozF9KNlbSfHO28Qpw/zUW+F5hBsKM99MhYUsFm+Mj0mkR02SKgJ3Eq8vSg0Wenyp7bCeqDaffsf859Rezcsy2hizrKNfXM2OLEjcItdP+pLcsobiG12jr9vESkLii/cvlnMvzTZZYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KZtc5OV4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740997806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XrsGCGG9AtfSViD3RsQm+eGPnJF4uoft9nYq0L+9jdk=;
	b=KZtc5OV4fX/X80X/MMaReiU/+3p0TvTV7sWi7NlgWYv/nKmLGGBeaMDe4/dt3UPdvnMJ7x
	ars7KHsWn4sTA59ftM+5oc2kRAVRp8Scv9F3CJDHdZaYYe+wo2aIPprQ7c3XkofgTxUSwA
	bPi4DIIu9IK+3RCH+PwHi9568NyTJbs=
X-MC-Unique: tnGv85UwP9S0nPUri8jj5g-1
X-Mimecast-MFC-AGG-ID: tnGv85UwP9S0nPUri8jj5g_1740997804
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740997804; x=1741602604;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XrsGCGG9AtfSViD3RsQm+eGPnJF4uoft9nYq0L+9jdk=;
        b=N3XYvmG0+jCY6/Rkwanv02pEIqKVxJYcaQFC7z8XZb7HLzeAQVtec/ZMdrrXMM8aUO
         6br/6hAzy8iPVyVOqoaHcF5ffzX5JY/CGXtdb5ooMt/gO9LBOl6KjEfbMMfOkec9/vd/
         VFVXcYQ6snbOAbUV12GDVVinMmB713o7kG5KAYsf3QfNGU1/CrYMgSMcrNHxnPHkU+z0
         3Gnl2Mk/D7J2VLvD4GXEXO4efOjRzyLJxKjfbpyh+mVq4IEL+6DWViekryxkZNuKrW+z
         xvwPnGtaP5X8DWANUVQgPsCWME/vbYo0mr2/xKF2siNr6S30Nvt3E1q+tcgpS0925FOm
         t8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUchrrcARy9XxRUl2sXmQwigVt5jMhuIuPRg4pKyvgRamaXYnBbxF4tDA/ybmKrGWyey9T64GjJMxsq7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkdlT7biGty3iP381f67W+nOWyw84ghI+wHAQdqBLszo6TNqob
	fWtC3xAFJibGkAgt/hYXPQ+F1YAFuXz/35JNG+u6LmPH5Y+aIQQNjshe+YW+LwJxifb8dJvGo/s
	hdM6EoYlh0uz3F+/mvCWP5YYLFv6txY88uNfrHCWWdL9lgYnUnLBLlZ8INvoRjg==
X-Gm-Gg: ASbGncs5NOevEg1/aOP9qPC1LSvAUhVKus1yvHQnDE2csMLEBTlQG2EEXBsR3HMe9IV
	pYMeXHyBZKK9QXQ4XackruiC70T/uScJ9lWo42hW19kIcniZETRnbPSOj+HFcWSFWclZixWmgh9
	aBbZQ38b+bh74Swv0e0OzF2Zkn8G29MU+q3lTMycDFYXqr3fd7fRWkTtx3c98NN6TNXetU3GHty
	DJXguDjhZELt1i/4Mgb2UDwmDEVaG7cW85ui0n9+CQBOA775nzdrWn8cCB+4jFLQQfmEo5EsLRR
	pt2mGskuTPOrVrtx8Ozb88up9qTSMZRYUYmPuVG1lTmZwbYRuz2aPKu9aQKH7je6ykKgig1YEiy
	TYWhCllnwvUkzTPw/xXdRUPi2K7P5ZtTs3MQHEyU0e7I=
X-Received: by 2002:a05:6000:186f:b0:390:fbba:e64e with SMTP id ffacd0b85a97d-390fbbb1cc2mr7331370f8f.38.1740997804370;
        Mon, 03 Mar 2025 02:30:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHoLAZ6fEWXVIxhxcXtWWYyuOPAHrr7D24c6RFsAPg6NR1E/hXM+QKIu4+7Y0Ej8r5W1JDdQ==
X-Received: by 2002:a05:6000:186f:b0:390:fbba:e64e with SMTP id ffacd0b85a97d-390fbbb1cc2mr7331318f8f.38.1740997803893;
        Mon, 03 Mar 2025 02:30:03 -0800 (PST)
Message-ID: <34388e5d-f9d1-4d29-a0e0-202a9fad345f@redhat.com>
Date: Mon, 3 Mar 2025 11:30:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: Fix lazy mmu docs and usage
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250302145555.3236789-1-ryan.roberts@arm.com>
 <20250302145555.3236789-2-ryan.roberts@arm.com>
 <5418a661-dbd0-46e9-8ef7-b1c5a34acce3@redhat.com>
 <a9e21c14-d390-4119-ad93-b23e6ccbac15@redhat.com>
 <1ff509c7-187b-4e43-b266-db8ada33b9a2@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1ff509c7-187b-4e43-b266-db8ada33b9a2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6glg4JR4zG2r3
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741709771.53768@QZUbxuI3rrlvIcCNq91l+A
X-ITU-MailScanner-SpamCheck: not spam

On 03.03.25 11:22, Ryan Roberts wrote:
> On 03/03/2025 08:52, David Hildenbrand wrote:
>> On 03.03.25 09:49, David Hildenbrand wrote:
>>> On 02.03.25 15:55, Ryan Roberts wrote:
>>>> The docs, implementations and use of arch_[enter|leave]_lazy_mmu_mode()
>>>> is a bit of a mess (to put it politely). There are a number of issues
>>>> related to nesting of lazy mmu regions and confusion over whether the
>>>> task, when in a lazy mmu region, is preemptible or not. Fix all the
>>>> issues relating to the core-mm. Follow up commits will fix the
>>>> arch-specific implementations. 3 arches implement lazy mmu; powerpc,
>>>> sparc and x86.
>>>>
>>>> When arch_[enter|leave]_lazy_mmu_mode() was first introduced by commit
>>>> 6606c3e0da53 ("[PATCH] paravirt: lazy mmu mode hooks.patch"), it was
>>>> expected that lazy mmu regions would never nest and that the appropriate
>>>> page table lock(s) would be held while in the region, thus ensuring the
>>>> region is non-preemptible. Additionally lazy mmu regions were only used
>>>> during manipulation of user mappings.
>>>>
>>>> Commit 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy
>>>> updates") started invoking the lazy mmu mode in apply_to_pte_range(),
>>>> which is used for both user and kernel mappings. For kernel mappings the
>>>> region is no longer protected by any lock so there is no longer any
>>>> guarantee about non-preemptibility. Additionally, for RT configs, the
>>>> holding the PTL only implies no CPU migration, it doesn't prevent
>>>> preemption.
>>>>
>>>> Commit bcc6cc832573 ("mm: add default definition of set_ptes()") added
>>>> arch_[enter|leave]_lazy_mmu_mode() to the default implementation of
>>>> set_ptes(), used by x86. So after this commit, lazy mmu regions can be
>>>> nested. Additionally commit 1a10a44dfc1d ("sparc64: implement the new
>>>> page table range API") and commit 9fee28baa601 ("powerpc: implement the
>>>> new page table range API") did the same for the sparc and powerpc
>>>> set_ptes() overrides.
>>>>
>>>> powerpc couldn't deal with preemption so avoids it in commit
>>>> b9ef323ea168 ("powerpc/64s: Disable preemption in hash lazy mmu mode"),
>>>> which explicitly disables preemption for the whole region in its
>>>> implementation. x86 can support preemption (or at least it could until
>>>> it tried to add support nesting; more on this below). Sparc looks to be
>>>> totally broken in the face of preemption, as far as I can tell.
>>>>
>>>> powewrpc can't deal with nesting, so avoids it in commit 47b8def9358c
>>>> ("powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes"),
>>>> which removes the lazy mmu calls from its implementation of set_ptes().
>>>> x86 attempted to support nesting in commit 49147beb0ccb ("x86/xen: allow
>>>> nesting of same lazy mode") but as far as I can tell, this breaks its
>>>> support for preemption.
>>>>
>>>> In short, it's all a mess; the semantics for
>>>> arch_[enter|leave]_lazy_mmu_mode() are not clearly defined and as a
>>>> result the implementations all have different expectations, sticking
>>>> plasters and bugs.
>>>>
>>>> arm64 is aiming to start using these hooks, so let's clean everything up
>>>> before adding an arm64 implementation. Update the documentation to state
>>>> that lazy mmu regions can never be nested, must not be called in
>>>> interrupt context and preemption may or may not be enabled for the
>>>> duration of the region.
>>>>
>>>> Additionally, update the way arch_[enter|leave]_lazy_mmu_mode() is
>>>> called in pagemap_scan_pmd_entry() to follow the normal pattern of
>>>> holding the ptl for user space mappings. As a result the scope is
>>>> reduced to only the pte table, but that's where most of the performance
>>>> win is. While I believe there wasn't technically a bug here, the
>>>> original scope made it easier to accidentally nest or, worse,
>>>> accidentally call something like kmap() which would expect an immediate
>>>> mode pte modification but it would end up deferred.
>>>>
>>>> arch-specific fixes to conform to the new spec will proceed this one.
>>>>
>>>> These issues were spotted by code review and I have no evidence of
>>>> issues being reported in the wild.
>>>>
>>>
>>> All looking good to me!
>>>
>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>
>>
>> ... but I do wonder if the set_ptes change should be split from the pagemap change.
> 
> So set_ptes + docs changes in one patch, and pagemap change in another? I can do
> that.

Yes.

> 
> I didn't actually cc stable on these, I'm wondering if I should do that? Perhaps
> for all patches except the pagemap change?

That would make sense to me. CC stable likely doesn't hurt here. 
(although I wonder if anybody cares about stable on sparc :))

-- 
Cheers,

David / dhildenb



