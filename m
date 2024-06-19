Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B122D90F1EE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 17:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743890.1150886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJx2e-0001yC-1y; Wed, 19 Jun 2024 15:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743890.1150886; Wed, 19 Jun 2024 15:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJx2d-0001vN-VW; Wed, 19 Jun 2024 15:16:07 +0000
Received: by outflank-mailman (input) for mailman id 743890;
 Wed, 19 Jun 2024 15:16:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXUT=NV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJx2c-0001vH-Jt
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 15:16:06 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d656f3e0-2e4e-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 17:16:01 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7955aaf8006so506752985a.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 08:16:01 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eca9c1sm78714396d6.39.2024.06.19.08.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 08:15:59 -0700 (PDT)
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
X-Inumbo-ID: d656f3e0-2e4e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718810160; x=1719414960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ItYjzeLz9pCHlYwoslznxmKtrPfREFj+z5aB8KdzW/Y=;
        b=lgiP6/3JCNw2f6h1RxrOoMvpxYKHv+EzvDrLZY4sFjdsaL3hzgTaYlVHJZGDnrNHe3
         3nKQ1VJnV7+EBLC7wo6O1uSoxqSxThwKNFnpMb6QiCs0anid6J7tANPuCqLagjrGd9px
         KVqO/GrvCoFfS5FCPVJF7zA6sbX7SOOmdtXao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718810160; x=1719414960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItYjzeLz9pCHlYwoslznxmKtrPfREFj+z5aB8KdzW/Y=;
        b=jZaemUCDEKowJ2HrH88HmytcyVQB6nfcShu6QbV12UDkhTfvM8mZGeM0kVk+pvNL+K
         O0qx7TcoSqZha3Yyn64Lka2O2OtVdZG+s+6VoFPCbO64jN4Qmn8GtJsxb5Z2CibEtXRN
         zRKUTwXG5FoLnrPADuvV/vNTyR4J827xpmdl7QkmwcPqiVEfgLGhrCy+tz13Y3RwAaVZ
         9hYIHzbojUZuci/USQHXW3qzBh0yZ5W4S/G+tAs907b9fc88mconh+0Dx6XN2e/BjY1z
         3zxJo7A4qmH4QiSaLVHlIBsHA0ekxkv+vt5Rez2t/H817BzwgMDrQJimTpdt8WfYXVRO
         Ve1g==
X-Gm-Message-State: AOJu0Ywzs5a6fZhCyDcv1VXoBrgJnchUQaD/KojO36SjUqKyUndSMOrC
	neumHdqZfqcDTiNH5GaRAdBffp1QObHA5XiR8IsMnkq6xBRwVySxiR8uegxuLJr8unSt0QAwDQg
	9yW8=
X-Google-Smtp-Source: AGHT+IHSvRA+epUNuVPlhYXYEHKgwy49psFLjn7oHwsv/w8BP10LOTc1yhrGfai1ndv/hKONw/pN5Q==
X-Received: by 2002:a05:6214:caa:b0:6b2:bad8:b72b with SMTP id 6a1803df08f44-6b501e3939fmr38892276d6.28.1718810159939;
        Wed, 19 Jun 2024 08:15:59 -0700 (PDT)
Message-ID: <87424aa5-758b-42c6-a777-14af385d1203@cloud.com>
Date: Wed, 19 Jun 2024 16:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 43d5c5d5
To: xen-devel <xen-devel@lists.xenproject.org>
References: <6672eede44602_2e3c548bc2022ad@gitlab-sidekiq-catchall-v2-649cf875c5-bssqj.mail>
Content-Language: en-GB
Cc: Jan Beulich <jbeulich@suse.com>
From: Andrew Cooper <andrew.cooper@cloud.com>
Autocrypt: addr=andrew.cooper@cloud.com; keydata=
 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
 nf3Bbzx81wZK14JdDDHUX2Rs6+ahAA==
In-Reply-To: <6672eede44602_2e3c548bc2022ad@gitlab-sidekiq-catchall-v2-649cf875c5-bssqj.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/06/2024 3:44 pm, GitLab wrote:
> GitLab
> ✖ 	Pipeline #1338876222 has failed!
> 
>  
> Project 	xen-project <https://gitlab.com/xen-project> / xen
> <https://gitlab.com/xen-project/xen>
> Branch 	
> 	staging <https://gitlab.com/xen-project/xen/-/commits/staging>
> 
> Commit 	
> 	43d5c5d5
> <https://gitlab.com/xen-project/xen/-/commit/43d5c5d5f70b3f5419e7ef30399d23adf6ddfa8e>
> 
> xen: avoid UB in guest handle arithmetic At le...
> Commit Author 	
> 	Jan Beulich <https://gitlab.com/jbeulich>
> 
>  
> Pipeline #1338876222
> <https://gitlab.com/xen-project/xen/-/pipelines/1338876222> triggered by
> 		Ganis <https://gitlab.com/ganis>
> 
> had 1 failed job
> Failed job
> ✖ 	build
> 
> 	debian-bookworm-gcc-arm32-debug-randconfig
> <https://gitlab.com/xen-project/xen/-/jobs/7136417308>

This is:

In file included from common/livepatch.c:9:
common/livepatch.c: In function 'livepatch_list':
./include/xen/guest_access.h:130:25: error: cast to pointer from integer
of different size [-Werror=int-to-pointer-cast]
  130 |     __raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
      |                         ^
common/livepatch.c:1283:18: note: in expansion of macro
'__copy_to_guest_offset'
 1283 |             if ( __copy_to_guest_offset(list->name, name_offset,
      |                  ^~~~~~~~~~~~~~~~~~~~~~
./include/xen/guest_access.h:130:25: error: cast to pointer from integer
of different size [-Werror=int-to-pointer-cast]
  130 |     __raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
      |                         ^
common/livepatch.c:1287:17: note: in expansion of macro
'__copy_to_guest_offset'
 1287 |                 __copy_to_guest_offset(list->metadata,
metadata_offset,
      |                 ^~~~~~~~~~~~~~~~~~~~~~


The problem is that (off) is of type uint64_t, so

   (const void *)(s_ + (off) * sizeof(*_d))

ends up being a uint64_t -> uint32_t down-convert in arm32.

This wants to use the _p() macro which takes care of casting through
(unsigned long) on its way to a pointer.  I'll do a patch.

~Andrew

