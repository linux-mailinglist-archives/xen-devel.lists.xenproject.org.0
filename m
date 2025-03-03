Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B97A4EB30
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 19:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901431.1309381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWsi-0008AS-IV; Tue, 04 Mar 2025 18:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901431.1309381; Tue, 04 Mar 2025 18:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWsi-000884-FY; Tue, 04 Mar 2025 18:20:40 +0000
Received: by outflank-mailman (input) for mailman id 901431;
 Tue, 04 Mar 2025 18:20:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwvO=VX=cc.itu.edu.tr=root@srs-se1.protection.inumbo.net>)
 id 1tpWsg-00087y-Vf
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 18:20:39 +0000
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e0cf2be-f925-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 19:20:36 +0100 (CET)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 1ED3B40D1F5B
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 21:20:35 +0300 (+03)
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6g1Y31LDzG1Fq
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 18:42:57 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id C9663400C6; Tue,  4 Mar 2025 18:42:48 +0300 (+03)
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id 8C1A9421EE
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:55:14 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
 by fgw1.itu.edu.tr (Postfix) with SMTP id 1F1653063EFC
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:55:13 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C02F3A7D51
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8791F17E8;
 Mon,  3 Mar 2025 08:51:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEBB1F151E
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:51:40 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-VA546TMQMj6KekOoIIhgNA-1; Mon, 03 Mar 2025 03:51:38 -0500
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-390f000e962so851941f8f.2
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:51:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:9600:af27:4326:a216:2bfb?
 (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de.
 [2003:cb:c734:9600:af27:4326:a216:2bfb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844a22sm13875701f8f.74.2025.03.03.00.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 00:51:35 -0800 (PST)
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
X-Inumbo-ID: 5e0cf2be-f925-11ef-9898-31a8f345e629
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MUEEaKhH
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MUEEaKhH
X-Envelope-From: <linux-kernel+bounces-541205-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MUEEaKhH
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MUEEaKhH"
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991904; cv=none; b=s+t4rBwbDuB/WPVt85V6S+m+FojOewUkJVHjQmnVLcyr+H6MbsV39zdIGh6wuNduLpy6jl8ZBmq8Kqq9oBSqJ1uhcYSTOuyF0jjJ4DLOSfKEweGLnLTaXB8YL9zq0W+DzRX3mv8RCql5vkfDYLfKqjzOtv4thwTlipNm3pDJOfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991904; c=relaxed/simple;
	bh=K2F9EW+qiAEiFc0wnbOIq8DzI+iuGYeb0zxsjfA4rl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJILvxXCcJ0pELYZ+h/JRQE11NRcS230t56HgjJvxbzwbvGzyFCrRvZVliyPb8vwzNrLQMlkFs6Hlr7piwSW5w1cp3/fvTAw0BdX3vheJr8NBFyMDuok2ZWRNeSK5i7cbUNm5i2deZ4BGZrN3LoDk0gS4SLs0DBvq2/BFE3KxQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MUEEaKhH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740991899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PqwL+v3kSKyO1WWdOm3Dn4wn0YpaEHuXEacsy1CmEn4=;
	b=MUEEaKhHroJTTeUp4KpAtO7naUHm8iEdVaV1kb7KmpWFAiy5a8jkMMipWqsR8y8eLMSPp4
	dnrl21lc0/K2YOTKaSOBGn9zsA1kc9ocXtz5xe95YVTm0IVvFMv2MwtsCe+Cg53OMg8jXj
	RwijkMT2v03xMyv/FWpaAgt37lFShcQ=
X-MC-Unique: VA546TMQMj6KekOoIIhgNA-1
X-Mimecast-MFC-AGG-ID: VA546TMQMj6KekOoIIhgNA_1740991896
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991896; x=1741596696;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PqwL+v3kSKyO1WWdOm3Dn4wn0YpaEHuXEacsy1CmEn4=;
        b=oChVHtL26OvS9qrjvljJrZldt64vp6Jz1zcpZr+vB4t5+9PfB0JpGEB1cYZrHAMEMT
         NXjKzNG+UD7m0IJtZrPQdobkfI7x6bmeS0hJx2aAGQIn1WchGljz5SjaeJIjHE7tzfgr
         hDTBGg8C0cdbQB8I+GIONVRFpHZr+GkYexv5pGqZ2HLxtsmgDD1uP+yWv+ID+hJAb6wD
         +4VT6k645YcC6c/qE0jEWG5z02e3TG8Ok1FHmt7qzF9KB6q/noipl460vIcAnZKWHnhe
         v71KoEQwdSYshC5cyjqeaJEXexb6zeZWj6kWkBMKM+JkDt8xII4sI8E3pQIbUEWfdO7f
         m/MA==
X-Forwarded-Encrypted: i=1; AJvYcCVc25svwb+S47p3fOR3nYCFXI/ntfMoHhydLlSg/5/uGj1PZ4EvXvD3ZIXbPfRaVxzc9Cw4zDLB4hIu1hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxebEQsUp7eWITMai4/rWadHgwKpfor9f97Zlk47fg+K6F7AEce
	MUQ0xvkL1LiZKHsWsBgXDirrSC6NhotHg4fTt5oCXP1y5J76vIm3RFUiabYSN5ztErKMQ8UkOX8
	6WdI/XGMoUk9HpENZlNSfZVfhjjPrjPkdWSGfBi7DBqVEVIFuqy8BOxatWc+RFw==
X-Gm-Gg: ASbGnctLjE9cHh6S5UKLkvL+JgxfDiBC89/AaEca25iyM49CxH2AT5i85xViGDrmxFa
	r88D9yYCqVGhGmOzrcGPM8VG5GGtPdErUHrlR6Gw9QPNL4EzU7fT+g3sMl9wA1Rh4nXDLLOegXl
	X4C46SzHe4Ys1uMsfI4hazpDhITem3D7D4Z+cOsMbu6TqzSXkPZgvyrsPMAg5Sw6oLR9JHvnn/+
	30eV0FLBe+WJcSc+mOhW6eIM+dyuv8VpKoDex3tX4QM7ejjP9IfJZ/Sq9MOIdN5JIHfLiMRCbeR
	Rq+H1iPlPIYAvUil6C3J5JhZUSetRTy7fI0J+qKLd/o9Ox+Q7jv8DFlxR2luuRlsY1/0p/BrmSu
	rx1/skUu2N2QMI+qLT7oKDa8wZUO1puxE72rtFXLS+lk=
X-Received: by 2002:a05:6000:1565:b0:391:9b2:f48d with SMTP id ffacd0b85a97d-39109b2f8ebmr2190202f8f.33.1740991896372;
        Mon, 03 Mar 2025 00:51:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiqrTykXg+NUm0kAtziKqLGECEKRMnAI63MS2I3V/WDMW5AEnsAxTN6b4wA0iNetJkZ/Gt5g==
X-Received: by 2002:a05:6000:1565:b0:391:9b2:f48d with SMTP id ffacd0b85a97d-39109b2f8ebmr2190184f8f.33.1740991895948;
        Mon, 03 Mar 2025 00:51:35 -0800 (PST)
Message-ID: <4af46304-cf25-4c4a-8e4a-3a566193ca62@redhat.com>
Date: Mon, 3 Mar 2025 09:51:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] sparc/mm: Disable preemption in lazy mmu mode
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
 <20250302145555.3236789-3-ryan.roberts@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250302145555.3236789-3-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6g1Y31LDzG1Fq
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741717115.81695@DHKgL0LE/ty5SOoLrhdLQg
X-ITU-MailScanner-SpamCheck: not spam

On 02.03.25 15:55, Ryan Roberts wrote:
> Since commit 38e0edb15bd0 ("mm/apply_to_range: call pte function with
> lazy updates") it's been possible for arch_[enter|leave]_lazy_mmu_mode()
> to be called without holding a page table lock (for the kernel mappings
> case), and therefore it is possible that preemption may occur while in
> the lazy mmu mode. The Sparc lazy mmu implementation is not robust to
> preemption since it stores the lazy mode state in a per-cpu structure
> and does not attempt to manage that state on task switch.
> 
> Powerpc had the same issue and fixed it by explicitly disabling
> preemption in arch_enter_lazy_mmu_mode() and re-enabling in
> arch_leave_lazy_mmu_mode(). See commit b9ef323ea168 ("powerpc/64s:
> Disable preemption in hash lazy mmu mode").
> 
> Given Sparc's lazy mmu mode is based on powerpc's, let's fix it in the
> same way here.
> 
> Fixes: 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy updates")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>   arch/sparc/mm/tlb.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index 8648a50afe88..a35ddcca5e76 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -52,8 +52,10 @@ void flush_tlb_pending(void)
>   
>   void arch_enter_lazy_mmu_mode(void)
>   {
> -	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> +	struct tlb_batch *tb;
>   
> +	preempt_disable();
> +	tb = this_cpu_ptr(&tlb_batch);
>   	tb->active = 1;
>   }
>   
> @@ -64,6 +66,7 @@ void arch_leave_lazy_mmu_mode(void)
>   	if (tb->tlb_nr)
>   		flush_tlb_pending();
>   	tb->active = 0;
> +	preempt_enable();
>   }
>   
>   static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb



