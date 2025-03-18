Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2923A67B48
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919704.1324088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tub0t-0004SM-OE; Tue, 18 Mar 2025 17:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919704.1324088; Tue, 18 Mar 2025 17:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tub0t-0004Qs-Lc; Tue, 18 Mar 2025 17:46:03 +0000
Received: by outflank-mailman (input) for mailman id 919704;
 Tue, 18 Mar 2025 17:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tub0s-0004QY-8W
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:46:02 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db2e127a-0420-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 18:46:01 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso30087565e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:46:01 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb627csm140808165e9.5.2025.03.18.10.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 10:46:00 -0700 (PDT)
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
X-Inumbo-ID: db2e127a-0420-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742319961; x=1742924761; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wQXA2GDGReC2bJp2CCt8ooyzuAjyPY35ctQvdguzg1k=;
        b=lyaNZ2uu8XrZvMe5CDSb/aBKJUgr+BibG9YtgU1XQA0P7SRo6HE2ZbmBzKA/3kKpWz
         EnypvHObFo7QA2hX4NKtOsXf+rSdjdGhyb4wQOLT4ChjujSiHuayYFo6bvff6UAKJV8H
         TtGCyvqltoFapvq2REffKX0pM+bwNi9HBgcL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319961; x=1742924761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQXA2GDGReC2bJp2CCt8ooyzuAjyPY35ctQvdguzg1k=;
        b=Ktzo8HHGMcv9beCgonZYaiW4af7iV25rQNOzl2kQGvuNdj/7I9aGuOcffuyCh7t4Hu
         4lp3Q2z5DNkXFKI82R8zUnxrOv0ghQPiuYHSrS7Hg7PBjUk/GtMJVd2KwySlfRnDKHLz
         PYAZ5H9Vph1EzLzKZ5JvHrJfjT7suZ7bmsUqcoLdqJnTl2/B+hbdR46ldfWCzeY1Vs3x
         jXJDyOEKqEarZCK2rrkhPRSxhi8QUd6VKxxj1/cHQJYXU/CJUcFcXcMvD4X17Lzs+xa5
         iZhMJ30vrGy/qxqiuhhKU87kmhrWMZ2O2f57LDKeRXTroG6r9UBIy/5U3q7nEytGJj50
         hWDg==
X-Forwarded-Encrypted: i=1; AJvYcCV4Ub+qlVeeC2oX3VIqbDYijQSvSJToT93CmRUfSJQ/alrKAx1MfdKAk2eEVHqUVcAxTxDwUyi+al8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJq6U/5gpkJDGaobKlCwe5PdwG8t2Ug6hLfi7yMwZBq3FilPy1
	LE+/mGxdRMAB8Nx+TIuGdfW4ZiKrglIs64ZCIMg7SLOgDSYnW24J6L9VTcnw+kQ=
X-Gm-Gg: ASbGncuDHtzQ/PwGfOpB8cE5jRvbzb5AccQGRnN6ZQ6SPVI95Nw/npnMmIvPDnbykOi
	MZ+aHN77/8/SdCIkH5hm0WWbEue+fMdbzmZkysuGtytKuY/gGtlXPy51WfP7EoSo8cZtuyzzvkp
	zP3HrvZafj44Mm4IoCBPIMttAvJypSIeZqvAsNf+yuFymkH9mLszdYwMIHAwzeRD90CWdrmPe8F
	otAS2cE+Ty4girPzSigKFkn7Ez7mXqipltnKaNcljR97gbtAt41tKv3bFKHlmpzV2Ul4WmdkRtI
	8f1PVTnsB6vLAk6NZa+4GXzBG8rbG3gr4z2XmZeoHb4cxusxbkefibZOacl9Vkd2aJ8affuzwbo
	eCUIRfTvU
X-Google-Smtp-Source: AGHT+IFCwKVk77OGfDfjgCBTY1RI+M+Y2DmdgxpZcnpfPzYLDKFwhh8OpKdRBNmt9x+B6g8spcolHg==
X-Received: by 2002:a05:600c:4f52:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43d3b980b4cmr39072295e9.7.1742319960663;
        Tue, 18 Mar 2025 10:46:00 -0700 (PDT)
Message-ID: <92fa6eaf-4e52-446c-8f0d-36ee63decd8c@citrix.com>
Date: Tue, 18 Mar 2025 17:45:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/mkelf32: account for offset when detecting note
 segment placement
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250318173547.59475-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 5:35 pm, Roger Pau Monne wrote:
> mkelf32 attempt to check that the program header defined NOTE segment falls
> inside of the LOAD segment, as the build-id should be loaded for Xen at
> runtime to check.
>
> However the current code doesn't take into account the LOAD program header
> segment offset when calculating overlap with the NOTE segment.  This
> results in incorrect detection, and the following build error:
>
> arch/x86/boot/mkelf32 --notes xen-syms ./.xen.elf32 0x200000 \
>                `nm xen-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$/0x\1/p'`
> Expected .note section within .text section!
> Offset 4244776 not within 2910364!
>
> When xen-syms has the following program headers:
>
> Program Header:
>     LOAD off    0x0000000000200000 vaddr 0xffff82d040200000 paddr 0x0000000000200000 align 2**21
>          filesz 0x00000000002c689c memsz 0x00000000003f7e20 flags rwx
>     NOTE off    0x000000000040c528 vaddr 0xffff82d04040c528 paddr 0x000000000040c528 align 2**2
>          filesz 0x0000000000000024 memsz 0x0000000000000024 flags r--
>
> Account for the program header offset of the LOAD segment when checking
> whether the NOTE segments is contained within.
>
> Fixes: a353cab905af ('build_id: Provide ld-embedded build-ids')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

