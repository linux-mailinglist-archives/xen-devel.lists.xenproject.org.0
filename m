Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A33AAC18F
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 12:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977030.1364115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCFjH-0002BH-01; Tue, 06 May 2025 10:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977030.1364115; Tue, 06 May 2025 10:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCFjG-00028v-TP; Tue, 06 May 2025 10:40:50 +0000
Received: by outflank-mailman (input) for mailman id 977030;
 Tue, 06 May 2025 10:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCFjF-00028p-QN
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 10:40:49 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b677f72-2a66-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 12:40:36 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso52129575e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 03:40:36 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099b0fe9dsm13244046f8f.71.2025.05.06.03.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 03:40:35 -0700 (PDT)
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
X-Inumbo-ID: 8b677f72-2a66-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746528036; x=1747132836; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I62aSuetZC4Vo7o9CLyiqhHPLmx8Jfdaq3hMQktMJGg=;
        b=RKV5wM6Jbac0l/1iB2V6uaNScGNeVSaAI5xQckF437juCEEaODP19TnEVvWReSNfg7
         84D3Xpdrg/oxQKhkduIR+LWk37AD0bO9NvYlOVALFbT8y/BdhxXN4hiaIc9LvjAArlaj
         iR7gaJTUXqxSTYBR690M9jLiKDrbWkHMhv2cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746528036; x=1747132836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I62aSuetZC4Vo7o9CLyiqhHPLmx8Jfdaq3hMQktMJGg=;
        b=OP9cq0PSZxX51gSbU2al5ryrxCEC1SGNJ/3Zg1S6v4QNjCVjzDacuuR+S77jHOVO+f
         nVdDI+8rxJdPFSo14tEQ6iYtUCXZg1S+AHAnwHstBad2v3DqCb6xxu7l5EZ8ds++vLKF
         3iR8J6S4lY9V9BnsKaurs5g0gsH+WC/vFOsdXcP4UsuKIN2ySsWMxn/ns9vvy5/9BQsR
         ryhVtRvBp65Eq+5fBwzfG3m7e1op4q791rDjd1yoJBdDFhRrAo1l4xbbpgNkpe6Q6SHV
         G9z1M/2nHAuvkSyTklhsOSnfvDBOpjxU45+LHPwzdmkcHx3v6BiSLYVOPwJ7yLbLwYBA
         L76A==
X-Gm-Message-State: AOJu0YzHRORu5PKk+FCSmA01ltvzk0IFovN2NZ2OWbBUfXsDIEfefR6I
	5kLdKyrbRCsqpJAmhndSdrp3XPehdRZd/K4jkFpUvvBSx0IQ051zsQAKTEDJYRg=
X-Gm-Gg: ASbGncvmGJTX64cDY1VR/mdN0H4/jEJnUJK5MqIX1kpuJjLUs1sTGqKDmXVDGS3pjAD
	437LkIaAUlw4Ue3CzWHTcyFAOX2qt1noAEa0cC8K61Reirdo0JQPBtVmBGXR5lWdOW0GMMhkHFw
	4Fclg3Y9HYhJ5X9IlXyIW4Wby29P2svajRTMUBj4luBG0/9iS1OX3EHjUFoWWQcPZ8Fy5F9uoZb
	tNmgUdxOg1gIRVFRaogef8F6vJAOeH4+hZw6aLx2dAdkUmMAoFYW9GHUyKOsJS7t8LvPnaDdANq
	yYOl8Yujs7LLb1/kU+uRIuMypV0Ho8P2zM+DAsAlrjVgsA==
X-Google-Smtp-Source: AGHT+IFiXPN1jr3LP+KnWPdnXYVkO0X1phn4ZVRmJS4H1NiXmyqZJEfBOlFLrfE7/tkubPzsMFehUQ==
X-Received: by 2002:a05:600c:870b:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-441c494849emr90177905e9.27.1746528035668;
        Tue, 06 May 2025 03:40:35 -0700 (PDT)
Date: Tue, 6 May 2025 12:40:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/9] xen/gnttab: limit cache flush operation to guests
 allowed cache control
Message-ID: <aBnnIm-Zg1bEJmJF@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-4-roger.pau@citrix.com>
 <daf9d45e-bcbf-4554-83d8-e51e3fc0ed38@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <daf9d45e-bcbf-4554-83d8-e51e3fc0ed38@xen.org>

On Tue, May 06, 2025 at 11:15:09AM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 06/05/2025 09:31, Roger Pau Monne wrote:
> > Whether a domain is allowed to issue cache-control operations is reported
> > by the cache_flush_permitted() check.  Introduce such check to limit the
> > availability of GNTTABOP_cache_flush to only guests that are granted cache
> > control.
> 
> Can you outline what's the problem you are trying to solve? Asking, because
> I don't see the problem of allowing any guest calling GNTTABOP_cache_flush
> on Arm from any domains.

At least on x86 cache flush operations are restricted to guests for
which cache_flush_permitted() returns true.  I've assumed the same
would apply to Arm, since cache_flush_permitted() is also defined
there.  If it's fine to issue cache flush operations from any guests
on ARM, I suggest cache_flush_permitted() should unconditionally
return true then.

The problem on x86 is that it's an expensive operation when done
correctly, as it involves flushing the caches of all pCPUs where the
vCPU has been scheduled.  Note however the implementation of
GNTTABOP_cache_flush is incorrect on x86, and won't work as
expected.

Thanks, Roger.

