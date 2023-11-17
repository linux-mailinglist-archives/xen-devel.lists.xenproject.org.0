Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765AA7EEFC3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 11:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635002.990687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vlQ-00072y-Gr; Fri, 17 Nov 2023 10:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635002.990687; Fri, 17 Nov 2023 10:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vlQ-00070U-E8; Fri, 17 Nov 2023 10:07:52 +0000
Received: by outflank-mailman (input) for mailman id 635002;
 Fri, 17 Nov 2023 10:07:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3vlP-00070N-1m
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 10:07:51 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a05f4e1-8531-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 11:07:50 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4083f613275so14699355e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 02:07:50 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c458500b003fefaf299b6sm2153194wmo.38.2023.11.17.02.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 02:07:41 -0800 (PST)
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
X-Inumbo-ID: 2a05f4e1-8531-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700215661; x=1700820461; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rXQYdP2yECEsDwWfLsrCu1ALufV0Ny4J8ENU7pc2fVs=;
        b=tEdUS/nHzFmXugYiD4pRiFzLsVrY9zL51LbrWFvvEEoYPRIqHNv0EeGcsUjC6G2EEI
         l4Tgc0XZo1Ho4OxAGFsS1k922rqnBzuTTmhUuUlQv7virEKd6t578maSFHTBaKbXNQma
         J2HYB2HT2pa5QEA4TQc0eV8aHkJ1XtE9wvQzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700215661; x=1700820461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXQYdP2yECEsDwWfLsrCu1ALufV0Ny4J8ENU7pc2fVs=;
        b=Ptn9rHlMW4OpVFSeC8pmvf0anCuy/xa9xFZkAks43MP9nLLNjLO0nsIijuy1r0OiF0
         GahtelRccnezHWyPvThsverX2fg8vpUuI+g25NczQno/v7+INmn5xVIj85X+mM7I5y6a
         R7rCWil9s4zc1WhiFLn89lHspz2OJd7JX02dPgrLBUGWQlC/aQNW952x8WM5YgmiTN3H
         XbvpNDAwpGSjAc8y4M9LW5eKwHmeVZvrDi0MbSdmDYPTzfLaGKYTVXY9eswf52Rs/rml
         ZAP1gxEWnkyCjZPisI79yjRC/yRPqGt/MxrslDflUGuS/StZFpwi26Zq52NSdIi3X3aI
         Czjw==
X-Gm-Message-State: AOJu0Ywa/s6oez9PSKWrbVLs5BsPYVQm1TEpfrGIgjtZpfO4a96AgVXd
	AetH64kgEl2K8u7Ky87Mu4O+dg==
X-Google-Smtp-Source: AGHT+IEvPyAn2pbqF6IIFTWMXaaBOyuoU1Y93SjA3tmj2MURrIcCyzDfMFhzGQhUFKOrq9XFeA9ZLg==
X-Received: by 2002:a05:600c:524c:b0:3fd:2e89:31bd with SMTP id fc12-20020a05600c524c00b003fd2e8931bdmr4075760wmb.14.1700215661544;
        Fri, 17 Nov 2023 02:07:41 -0800 (PST)
Date: Fri, 17 Nov 2023 11:07:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/6] automation: remove CR characters from QEMU serial
Message-ID: <ZVc7a56DXOtEoS0N@macbook.local>
References: <20231116121310.72210-1-roger.pau@citrix.com>
 <20231116121310.72210-2-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2311161701420.773207@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2311161701420.773207@ubuntu-linux-20-04-desktop>

On Thu, Nov 16, 2023 at 05:05:28PM -0800, Stefano Stabellini wrote:
> On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> > The gitlab CI webpage seems to have issues displaying the \CR\CR\LF "\r\r\n"
> > sequence on the web interface used as line returns by the Linux kernel serial
> > output.  This leads to the QEMU tests output looking like:
> > 
> > (XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
> > (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> > (XEN) Freed 664kB init memory
> > mapping kernel into physical memory
> > about to get started...
> > qemu-system-x86_64: terminating on signal 15 from pid 52 (timeout)
> > 
> > This not helpful, so strip the CR characters from the output that goes to
> > stdout, leaving the output in the smoke.serial untouched.
> > 
> > Fixes: 3030a73bf849 ('automation: add a QEMU based x86_64 Dom0/DomU test')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks for the patch. Let me see if I understood correctly.
> 
> In the gitlab web UI everything after the last (XEN) log line
> disappears, for instance:
> 
> https://gitlab.com/xen-project/xen/-/jobs/5556551478
> 
> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> / # qemu-system-aarch64: terminating on signal 15 from pid 145 (timeout)
> 
> 
> While if I look at the full logs there are plenty of Linux kernel logs
> after it:
> https://cdn.artifacts.gitlab-static.net/ec/ad/ecad5145a0ec1eb179fd47d1590d5ec43d705e8af2f9a816607ac31891cb82b9/2023_11_16/5556551478/6032156805/job.log?response-content-type=text%2Fplain%3B%20charset%3Dutf-8&response-content-disposition=inline&Expires=1700183635&KeyName=gprd-artifacts-cdn&Signature=vT8CBwI2Th23OvRvQKvNPgHiT5Y=
> 
> And this patch aims at fixing that, is that correct?
> 
> 
> But I went to check your pipeline
> https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1074512137
> and the corresponding job
> https://gitlab.com/xen-project/people/royger/xen/-/jobs/5549620441 has
> the same issue?

I made the change just for qemu-alpine-x86_64-gcc:

https://gitlab.com/xen-project/people/royger/xen/-/jobs/5550049674

I didn't realize qemu-smoke-dom0-arm64-gcc was also using it.  If the
fix is acceptable I can submit v2 adding the arm instances also.

Thanks, Roger.

