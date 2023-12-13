Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605AB811609
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 16:21:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654082.1020734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDR30-000717-Au; Wed, 13 Dec 2023 15:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654082.1020734; Wed, 13 Dec 2023 15:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDR30-0006yU-6s; Wed, 13 Dec 2023 15:21:18 +0000
Received: by outflank-mailman (input) for mailman id 654082;
 Wed, 13 Dec 2023 15:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CjQj=HY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rDR2y-0006wp-46
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 15:21:16 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41393aa6-99cb-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 16:21:14 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-336210c34ebso3238705f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 07:21:14 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l6-20020adfa386000000b00336419542f0sm1299275wrb.87.2023.12.13.07.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 07:21:14 -0800 (PST)
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
X-Inumbo-ID: 41393aa6-99cb-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702480874; x=1703085674; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ycyKjlVlAV8V+V5o2A+LTIncCi5f6PuD+Wrhw0xReOM=;
        b=FWoed5o38vTNJOxLJkN1kLLDwznYPxF/XulxgONLM6LVYeVMKY0g3MOKSneH4rxMdC
         eHwt6HttYjxwM/yWC3TT5EbqMVzu2l87USW4qoDtSlA+OQtxpFRLEHeYWl8GyYMXg5BB
         Kpt8WhSf+8sPpxLNG5nzYyQ/ExsoK31tCSFZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702480874; x=1703085674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycyKjlVlAV8V+V5o2A+LTIncCi5f6PuD+Wrhw0xReOM=;
        b=PnOo+uH+oYzcrbMEGi3Y+ge4jM55uwb1AQJQkfqnkjMYUJ03NVZwNBc5mQQ/QsF6iO
         0eJbX6gNJnGeskVx+GGNvSExxl3sE0Kl7k6bTd/D8P3rdxwAPAiQGcutcF/rQUFuVcTk
         je6Fpup5i8qVeX/fH4kFFHZw1j7yT0KUZOPoDrKk9BeJd5YyinJHRIDMllpDALYNvtrT
         CYiT0jqrT4nYvm5bBxOIYUVeuVqle1zL0mNClmdGS4BpEwzWmf2LeqERrUlCejt8Vfok
         qiZvsjYFBkw8emW0RpDDbIQvk0wlyqbEybYfupHb6gZ51JRjkFh41o1JlyS6zwz30AP0
         Zvww==
X-Gm-Message-State: AOJu0Yzr2oD3YTawDxzO7nmJNuKx63Xz/R4WOH4mQnqicnnhPazdmL7m
	JfASe+JqB1zLS1bNdsgeVxRSpyk90wzsqT2rzEs=
X-Google-Smtp-Source: AGHT+IHV0vGICmHPYRAeJSqchVRhkVwINfHODWsargtBpSENgNKqHj71viGk/cwLjsewKn+tOSU66A==
X-Received: by 2002:adf:fd0d:0:b0:336:38ec:3fed with SMTP id e13-20020adffd0d000000b0033638ec3fedmr480208wrr.81.1702480874326;
        Wed, 13 Dec 2023 07:21:14 -0800 (PST)
Date: Wed, 13 Dec 2023 15:21:13 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libs/evtchn: fix locking in Mini-OS
Message-ID: <95f5cbad-eaea-47e7-a240-d5e99b1f8eb7@perard>
References: <20231211071017.27752-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211071017.27752-1-jgross@suse.com>

On Mon, Dec 11, 2023 at 08:10:17AM +0100, Juergen Gross wrote:
> When adding locking to tools/libs/evtchn/minios.c a semaphore was
> used. This can result in deadlocks, as the lock is taken inside the
> event handler, which can interrupt an already locked region.

Or maybe the issue was with xenevtchn_unbind() which calls
port_dealloc() which was also trying to get the mutex.

> The fix is rather simple, as Mini-OS is supporting a single vcpu
> only. So instead of the semaphore it is enough to disable interrupts
> when operating on the port list.

Semaphore implementation does that as well, so that's fine, and it works
recursively.

> Fixes: bc4fe94a69d4 ("ools/libs/evtchn: replace assert()s in stubdom with proper locking")
> Signed-off-by: Juergen Gross <jgross@suse.com>


And osstest is happy with the patch:
http://logs.test-lab.xenproject.org/osstest/logs/184123/
> test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass
> test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass

So overall, patch looks fine to me:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

