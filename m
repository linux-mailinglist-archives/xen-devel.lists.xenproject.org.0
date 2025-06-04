Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77C6ACDA81
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 11:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005279.1384764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMk46-00008d-UP; Wed, 04 Jun 2025 09:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005279.1384764; Wed, 04 Jun 2025 09:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMk46-000066-RL; Wed, 04 Jun 2025 09:05:42 +0000
Received: by outflank-mailman (input) for mailman id 1005279;
 Wed, 04 Jun 2025 09:05:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xa+O=YT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uMk45-000060-G5
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 09:05:41 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15777d14-4123-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 11:05:39 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so31418645e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 02:05:38 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-450d7fa23f4sm199000615e9.14.2025.06.04.02.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 02:05:37 -0700 (PDT)
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
X-Inumbo-ID: 15777d14-4123-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749027938; x=1749632738; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVb5eqYruBVqHy+zG7LsLfZyeooeoPVXNOTackwmwOg=;
        b=FC0ewMQIUwvw7yeGI8yTfzo9MohSoQRFP+YjJNHshwoyf7xSf63iuoiHdNlMm96BLJ
         iTzku2WCwQjOCV06Ht77ilCaevuTDif7V0AnWBZEmvqG6oCf5CYZZlbZRl5LjoFFd6rw
         8W731yy3VTmkXmRyCJVFx6CpZYarhA+arCueo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027938; x=1749632738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVb5eqYruBVqHy+zG7LsLfZyeooeoPVXNOTackwmwOg=;
        b=NwV3muhVKF64n32Z7kMxHNKQXuUE5V8EAslm6FsfO/ju1pug/ZoNzY592RRDeUsAhi
         AWThbRSXtOdYVjRm1tP6DmIzB0kuTs/QpEm47im+WEE2Ohx9hp8FQmY4IuzKAyebB4JN
         3Lq2mQxH/RTPaeDUYuLU2eBk1eQxO+NcS6E1L3ZfkIzA7KdgcMyraI1XDekecoTxQj0d
         D0VAhtZL3VfVi79neAIFIk3WTDeEHJe3AADoql4WKjalXXm8O470fBCpMvYxaQ3pEEBv
         TdycdyJkJ5O5HpsF4foLMkNgbMkH889vceeXHuBc6Jd1MQSfK9WPu/dc5B+tCqBxZwto
         TxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzOtDVEdA3WDrzgOXznWYy0kaZ0FWvqzZ5JZzaXGlUVzFK5EwecE2hQohrhJJ9JX/8iGJnojeThpo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw/k19jhAQ6uHk0y+Xo3bvUQI+NOWR+DeFZNph+T5wOoqu+jzY
	RnEA65Duv0xk/aJO1tw8HTAtQtbXny5BAO7FcgGwGLLS8yx3DSOgc/AKBx3kntQXr3Y=
X-Gm-Gg: ASbGncsou+PQnR0RdFz5hzCHLmo5lxrj9QF1gSrzSjlW58ZLDv7P7tPZKwQ2DKX+upQ
	w/ckUpNm+JcfqnuGGOMDYbXt2NrTFuxk8BlmjKHnhiR7gzrTr856zIBsiiPDHLn5lH1+lNm/Hfn
	jaRT5RK1+7oPyHtgrKoIyJD8T9ZXdE7RfokaZ4KjZ0kc3q8KIJBdW2tclVfRQX93ok8EwZbTI3e
	MwwqRK3zcaIkGClV/fMaBoCxzn55NExW1CWot2RJJCJzkfmyIEv6bnZMo4pDPPmusTCh5c6fOUW
	ICaJu+AvH8jCfdHiOu2UUZUDu5MmxWTZty24Jr0fAUPGlhb//hQ2YiPE6nyxq72KSUWJOd6WEog
	S33c+3DyEqaN5ssLgSfk=
X-Google-Smtp-Source: AGHT+IEcUyT09/XfaNmWdciSWhU27h3VqV3bQOUkQsrKqpG8i5mraxw+h0c+zWsMBUgUfCIQ2wYWsg==
X-Received: by 2002:a05:600c:4590:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-451f0b1e4e7mr13579255e9.23.1749027938211;
        Wed, 04 Jun 2025 02:05:38 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:05:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] tests/vpci: Use $(CC) instead of $(HOSTCC)
Message-ID: <aEAMYRN5rfQh3sbI@macbook.local>
References: <20250604072128.16628-1-michal.orzel@amd.com>
 <d8fc3301-30b9-48bd-9832-b4fc18828a0c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8fc3301-30b9-48bd-9832-b4fc18828a0c@suse.com>

On Wed, Jun 04, 2025 at 10:07:46AM +0200, Jan Beulich wrote:
> On 04.06.2025 09:21, Michal Orzel wrote:
> > When cross-compiling, HOSTCC can be different than CC.
> 
> I'm sorry for being pedantic, but the two can also be different for other
> reasons (and I'd like to avoid this becoming a bad precedent, then getting
> copied elsewhere). Both may target the same architecture. Hence I'd like
> to suggest ...

Would you be fine with:

"Depending on the build environment, HOSTCC can be different than CC.
With ..."

And the s/cannot/will not/ adjustment below?

If so, I don't have any further objections:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

