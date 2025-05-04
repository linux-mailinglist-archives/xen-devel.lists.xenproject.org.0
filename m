Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A104FAA89F3
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 00:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975707.1363049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBiFo-0002Uq-RY; Sun, 04 May 2025 22:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975707.1363049; Sun, 04 May 2025 22:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBiFo-0002Sh-OT; Sun, 04 May 2025 22:56:12 +0000
Received: by outflank-mailman (input) for mailman id 975707;
 Sun, 04 May 2025 22:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7EWK=XU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uBiFn-0002Sb-ET
 for xen-devel@lists.xenproject.org; Sun, 04 May 2025 22:56:11 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f86653dd-293a-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 00:56:10 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so2813107f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 04 May 2025 15:56:10 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae32fesm8388524f8f.22.2025.05.04.15.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 May 2025 15:56:09 -0700 (PDT)
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
X-Inumbo-ID: f86653dd-293a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746399369; x=1747004169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cbaE/GnJz5CyQDcgxDT7E6SEFV3Vy2U3/HcegLmP3aI=;
        b=CO/YJsaLFN5LjPcga+VX63lUlmI0Gi+hgUTrOlUUOdkUP9s80MzP/vREBaZT3P7ZIR
         G+Ob4iH+fGak0yFl3AkunBJzVLb255cJBk+bbA4APjCG9kJ9OXut9n/4jRZL1lbPwo+O
         0EfSvQXSNwaeQTlM22d3yex3ZbkY//i24mmYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746399369; x=1747004169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbaE/GnJz5CyQDcgxDT7E6SEFV3Vy2U3/HcegLmP3aI=;
        b=uxNM/P5SzXeTkhX9nFQb0H1D45OsjH/adGqpcbn/KepybhRxVIOcnWmVhcyWVyg/a1
         xTD5uNSctZ5VFgTlwMfW2+cx7VGCHIFAiXRXhsD+3LpItKerjUgiGxiyUNF7lHU+nl4j
         m3WCLefu+mTnmQa4guzHgObGD6MZszYxOYswAsgY0oziFME6FOjAuqYs3VsSX5Jx6ZBR
         fSqA5Z4LMW/k0PPq/WKwjWtpWi5l/rzx0WABK5Bt/5D03kIjXCNKa+KW5awMJ0NuMCwq
         C0MvB771e/NB3xPB0vsd1yLjj01up5vy0EbBolL/fo8ofD/xmioWqDciVUWxMRjQ+4Jv
         DVBg==
X-Forwarded-Encrypted: i=1; AJvYcCWje9wV9B2C1PEZpBIThzOcYEEqeQ59tyN3kGfHyCxKOFD+PfoGLL9og1Pk5YPaUppYDJ5aKkgXpBk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/chfMGrIeK60PKN7M9lHymo9sm92YJNq4GOIPDiykmkTKKYXV
	YD4MzdEFvR8T2qPLFzowmLu7II/KCC1n+eFamKKZxFJgz6lhw7jn6y+4pSbXdgM=
X-Gm-Gg: ASbGnct5pz4hiwuMtc6wTn6zR/5KVLt11fwImOwokjbakfuR/X15MmfpyasexyMjzCr
	6yjUSr4K84wDRE4e4bXNxP/QysrM21jZcL+ZSjjYUpBUhj5dngKk/7nBoogZqof4fihpCUhcIbO
	XCBanHdx6w3A5UQ1AE7lpVywT1nqffaFRrs6Y5DQuICYwGyZl7JR3iDPL2VkI1QO9cqtkOQ/s/x
	RjvtwVe+WuPNe6hi0Ris+0BDhvhDhHtSJRGjLB8aga+3hX4tRnIF37ore2lzorzl7woHuWE3pPv
	VZgQ3n+JroOUWkMs+srrqTrhHdoBGaiF2Xg7PbHZQGfiWVPFlYwU3/mf5RTKee3aqT+jwfWH3Nh
	TZbZIRA==
X-Google-Smtp-Source: AGHT+IE1SSxHLjPeoAZoTBcMCeKvu3uDB013+pb+pGKylR3Qr2Jba3OelLZheIhHAvJ874vh5GTG1w==
X-Received: by 2002:a5d:59a4:0:b0:39e:e259:91fd with SMTP id ffacd0b85a97d-3a09fd7326bmr3229692f8f.17.1746399369647;
        Sun, 04 May 2025 15:56:09 -0700 (PDT)
Message-ID: <fec23d81-8e31-4a95-9ec1-14148ac2098f@citrix.com>
Date: Sun, 4 May 2025 23:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Mapping memory into a domain
To: Demi Marie Obenour <demiobenour@gmail.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/05/2025 11:51 pm, Demi Marie Obenour wrote:
> What are the appropriate Xen internal functions for:
>
> 1. Turning a PFN into an MFN?
> 2. Mapping an MFN into a guest?
> 3. Unmapping that MFN from a guest?
>
> The first patch I am going to send with this information is a documentation
> patch so that others do not need to figure this out for themselves.
> I remember being unsure even after looking through the source code, which
> is why I am asking here.

See the top of xen/include/xen/mm.h which has an overview of
terminology, including an explanation of why Xen doesn't know what the
guest thinks of as PFN.

~Andrew

