Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8186DA4E5C6
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 17:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901313.1309284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpV5v-00018X-FQ; Tue, 04 Mar 2025 16:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901313.1309284; Tue, 04 Mar 2025 16:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpV5v-000169-CD; Tue, 04 Mar 2025 16:26:11 +0000
Received: by outflank-mailman (input) for mailman id 901313;
 Tue, 04 Mar 2025 16:26:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwvO=VX=cc.itu.edu.tr=root@srs-se1.protection.inumbo.net>)
 id 1tpV5u-000163-Gd
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 16:26:10 +0000
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 600e2009-f915-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 17:26:07 +0100 (CET)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id D50D0408B5EE
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 19:26:06 +0300 (+03)
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gx21VFmzG3Fy
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 19:24:06 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id BCDAB42764; Tue,  4 Mar 2025 19:23:53 +0300 (+03)
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id CEBFE41FA6
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:54:49 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
 by fgw1.itu.edu.tr (Postfix) with SMTP id 68CEC3064C0B
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:54:49 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A9BE169015
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id C47981F0E55;
 Mon,  3 Mar 2025 08:49:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F831F0E49
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:49:52 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-5l4JXGGbM2CRqTw9V2nWCA-1; Mon, 03 Mar 2025 03:49:45 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43998ec3733so21975005e9.2
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:49:44 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:9600:af27:4326:a216:2bfb?
 (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de.
 [2003:cb:c734:9600:af27:4326:a216:2bfb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc032d049sm33471735e9.5.2025.03.03.00.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 00:49:43 -0800 (PST)
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
X-Inumbo-ID: 600e2009-f915-11ef-9898-31a8f345e629
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ANFNs5G8
X-Envelope-From: <linux-kernel+bounces-541202-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ANFNs5G8
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ANFNs5G8"
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991794; cv=none; b=nMtHFIBulIZ6Z/2ALR2aBXrucFC2S93dSrygWsnuHiCRwMUn1tuUXYi7hRZ0Sq90dWs74rtYQPdDmzU3tKB0I+zviZsM1cevBXMmpkKPnIsDUyhoq6nDI0B74EafmckPKIWfCnn6n64aZwbStgsOUzubT15Z8tZYVrR2BE9kouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991794; c=relaxed/simple;
	bh=zCOjBv5AvYJcTcxt92Gav4gKEM+8D+EuXV0aeC3s2D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFLDKmkAO78ilHXkJ4rSfhMcJ2YmoAo7ySSmGPsOdstmAvwNdmwIGL/TKg3Du1W/9hZAzz9jURujHU7eO1hP73DFSTJmDX8XCgdkFPvh6+RqT4L63oV9bLLpdu+3RmfXtlTjmI03Dt5Q1Z1S0SsX1GmcvVxYqRHc5amSzRrNUYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ANFNs5G8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740991791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HZgsvoWWTlj/z7Wx3jz+2Ap6TQJJXYjKQ3XMWzn2w2I=;
	b=ANFNs5G8byBVKUkRox21ASS4NXH2VXk9lCsJmqvq2Od3fYiBxB40uuSh+SbPJIdfO5HFuz
	dHJjChulSiROJLDvYIakJV/lOmDFqmGsGeQ7Q6ilF2oEwDWDypshkKbQgWdU5vipbHksg/
	mNTuHUfIhIdXvf3vMrG9FFqAeMfCQc0=
X-MC-Unique: 5l4JXGGbM2CRqTw9V2nWCA-1
X-Mimecast-MFC-AGG-ID: 5l4JXGGbM2CRqTw9V2nWCA_1740991784
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991784; x=1741596584;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HZgsvoWWTlj/z7Wx3jz+2Ap6TQJJXYjKQ3XMWzn2w2I=;
        b=T/dvDygW2wviUV1m6e0IPOCijiB0GPkLJhVk3JK8krA1rJ2IF9otmKR0zitlIZfCUf
         kfbJownTcQ3TJO/HzJoVe87Z89gPU0g4naMeWgejMGIMjhVZrsqpXfk7CLInXtqYfvfW
         IizLIKWKN4RAuLTRURcKNt9mJT0wgvKb81CmFJkULZNzyYurGnuCevFCbe238oaEkhev
         Dk1fHhMN53g2uroB+KcdfHPVNqTXPk50YtvkWG30ceL+tA8UBBc6pujvmrxlsMuEPYAp
         WG1ep3FdW8BlipMY22ZjxhWqrG2DjD7p9DsL36aGMLNFu/mmdtYdS7sWj541rPYLBpjl
         /Z4w==
X-Forwarded-Encrypted: i=1; AJvYcCWcVHr9QZt1NKSP/Tg2WHREksTWSWql5b4+pBnZlLmbRRhzUmZjCqHUfDCpeCyjXlBMdhAA7lFHVKswyD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YztARJiuHLnyPtTHtl7rUVMsZscTR/leJpYtLqSXva3CyIYbNtp
	+mBqySS8ybgKOmLdbOW5/EHQoh1BwoUKuJGi2kHr4xTULtgtTz1X2oySkdCZfqgkBY8SV28wXax
	Qnt9OyavMenX8hKahtRR5aQCpt/0m86Gd1/aIg2ja0HiH1KnZKLQI8bCfNbNf6g==
X-Gm-Gg: ASbGncvXd5ipcC5ss7ySu+a1bcuC+g3CrB59TuThYnul7RaDpXsVCUnfXIT1nq3Zlvg
	h3iCvzrPsAiBSy9FxasLX2xAdr7EtfJY3y5yO7fx7osF/Px3kT9WJkozExNrY8PqqswFfBtr4tP
	o7AbTH6RLOvzhutqPws16Vlr6Tqg4xKk1zXQKJBY+eZ+sx+25fZESNyBAFueQG2Rs4qBfZh+tvL
	lJjeAACvF7SIlD/1HCR9E3Y+spr7DpYXh0lQgYWpKNvoQkZ9LBCpN5S6Q0+cnFhradrxfAeg8pN
	9OCy9Tvrj0KVLHY4jEqS9UDY67aG+3D8z+k91Dft3fYNwsWHrxCvUIaV57oxuKgl6zf/LhXJxTl
	widEnTiFIXZNJdFTxNR8eRs65ycS4cAZfJd0xXRbtq/w=
X-Received: by 2002:a05:600c:6a98:b0:43b:c1ac:aeeb with SMTP id 5b1f17b1804b1-43bc1acb051mr17807955e9.2.1740991783872;
        Mon, 03 Mar 2025 00:49:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfkTeqUr6av3ulFhHw4w32J7M9dmMHOsqprQVn7qo3OHB2JAoIA5h/UZCV7efl/bOzE0qShA==
X-Received: by 2002:a05:600c:6a98:b0:43b:c1ac:aeeb with SMTP id 5b1f17b1804b1-43bc1acb051mr17807725e9.2.1740991783445;
        Mon, 03 Mar 2025 00:49:43 -0800 (PST)
Message-ID: <5418a661-dbd0-46e9-8ef7-b1c5a34acce3@redhat.com>
Date: Mon, 3 Mar 2025 09:49:41 +0100
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250302145555.3236789-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6gx21VFmzG3Fy
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741710277.06255@TwCZU9PgcA6DQmXvRIcv8A
X-ITU-MailScanner-SpamCheck: not spam

On 02.03.25 15:55, Ryan Roberts wrote:
> The docs, implementations and use of arch_[enter|leave]_lazy_mmu_mode()
> is a bit of a mess (to put it politely). There are a number of issues
> related to nesting of lazy mmu regions and confusion over whether the
> task, when in a lazy mmu region, is preemptible or not. Fix all the
> issues relating to the core-mm. Follow up commits will fix the
> arch-specific implementations. 3 arches implement lazy mmu; powerpc,
> sparc and x86.
> 
> When arch_[enter|leave]_lazy_mmu_mode() was first introduced by commit
> 6606c3e0da53 ("[PATCH] paravirt: lazy mmu mode hooks.patch"), it was
> expected that lazy mmu regions would never nest and that the appropriate
> page table lock(s) would be held while in the region, thus ensuring the
> region is non-preemptible. Additionally lazy mmu regions were only used
> during manipulation of user mappings.
> 
> Commit 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy
> updates") started invoking the lazy mmu mode in apply_to_pte_range(),
> which is used for both user and kernel mappings. For kernel mappings the
> region is no longer protected by any lock so there is no longer any
> guarantee about non-preemptibility. Additionally, for RT configs, the
> holding the PTL only implies no CPU migration, it doesn't prevent
> preemption.
> 
> Commit bcc6cc832573 ("mm: add default definition of set_ptes()") added
> arch_[enter|leave]_lazy_mmu_mode() to the default implementation of
> set_ptes(), used by x86. So after this commit, lazy mmu regions can be
> nested. Additionally commit 1a10a44dfc1d ("sparc64: implement the new
> page table range API") and commit 9fee28baa601 ("powerpc: implement the
> new page table range API") did the same for the sparc and powerpc
> set_ptes() overrides.
> 
> powerpc couldn't deal with preemption so avoids it in commit
> b9ef323ea168 ("powerpc/64s: Disable preemption in hash lazy mmu mode"),
> which explicitly disables preemption for the whole region in its
> implementation. x86 can support preemption (or at least it could until
> it tried to add support nesting; more on this below). Sparc looks to be
> totally broken in the face of preemption, as far as I can tell.
> 
> powewrpc can't deal with nesting, so avoids it in commit 47b8def9358c
> ("powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes"),
> which removes the lazy mmu calls from its implementation of set_ptes().
> x86 attempted to support nesting in commit 49147beb0ccb ("x86/xen: allow
> nesting of same lazy mode") but as far as I can tell, this breaks its
> support for preemption.
> 
> In short, it's all a mess; the semantics for
> arch_[enter|leave]_lazy_mmu_mode() are not clearly defined and as a
> result the implementations all have different expectations, sticking
> plasters and bugs.
> 
> arm64 is aiming to start using these hooks, so let's clean everything up
> before adding an arm64 implementation. Update the documentation to state
> that lazy mmu regions can never be nested, must not be called in
> interrupt context and preemption may or may not be enabled for the
> duration of the region.
> 
> Additionally, update the way arch_[enter|leave]_lazy_mmu_mode() is
> called in pagemap_scan_pmd_entry() to follow the normal pattern of
> holding the ptl for user space mappings. As a result the scope is
> reduced to only the pte table, but that's where most of the performance
> win is. While I believe there wasn't technically a bug here, the
> original scope made it easier to accidentally nest or, worse,
> accidentally call something like kmap() which would expect an immediate
> mode pte modification but it would end up deferred.
> 
> arch-specific fixes to conform to the new spec will proceed this one.
> 
> These issues were spotted by code review and I have no evidence of
> issues being reported in the wild.
> 

All looking good to me!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb



