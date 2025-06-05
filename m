Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB97ACED97
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006571.1385789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7pS-0006MF-O5; Thu, 05 Jun 2025 10:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006571.1385789; Thu, 05 Jun 2025 10:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7pS-0006KL-LL; Thu, 05 Jun 2025 10:28:10 +0000
Received: by outflank-mailman (input) for mailman id 1006571;
 Thu, 05 Jun 2025 10:28:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uN7pR-0006Ay-La
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:28:09 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6467d7b-41f7-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 12:28:08 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-442ea341570so5007775e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:28:08 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451fb208274sm13761535e9.22.2025.06.05.03.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:28:08 -0700 (PDT)
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
X-Inumbo-ID: c6467d7b-41f7-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749119288; x=1749724088; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H+DbnJ8CZ9+daFhn/guZIDqh4rHu3fH48iQ0nlx2hmo=;
        b=MrNVpftT7jIXDXRO5KSN9bmm6fKWJEjHlC4dXficEv3P4sDNXfAgtr+HeKyi+vUJda
         Ocj30tsHzos0zQLD+YS+CfrPevYsd/I5RPp/078nwcnD3COatc1B36FT9aPBEaaT1PYG
         EHfDHrrFoxwjh0WkpwnKndr/Ho6dGyE47TI/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119288; x=1749724088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+DbnJ8CZ9+daFhn/guZIDqh4rHu3fH48iQ0nlx2hmo=;
        b=pTaSFNRKiDSWXht/RyTeXcgncPgXdRDxhDvaR2jWKUrQY7O90mPkdZxCXOnZljL4uW
         9VE8aMgns5qWCViOn6IxMQOw39wtATLStjrepUgJ921F66QGEJaMlCs/fz5VDg8/XIGL
         SmLAv8hlXgGb+K4KUlVh+VADnKWUy6ABQRC/1CwyuvebTlColxj1zcEkFguHsrTsyPIm
         urSGOkOEANgMvRGrNjBZElQtlOEekBUczCbh25yci3WVhJE0yU6/OtsqcxX+UE3bXNK2
         kXDmcEV9JJLDFYVTk8XiVJhCMQFyXtZ/SJHnCZWkcpOPpUfxiXpwQVC9SI3nFcSQ+oBS
         TZkQ==
X-Gm-Message-State: AOJu0YyEb+d2BpnNKhFH7WiJSPfiE5q87nmaHRvg0s6MhdlIUOkVLvBi
	MMbVS/UoPhUxdBVK4NtMu3IhSQy734HXH0IBoiDIqGo5whz6nIKmOEAi6k7wLywKg6LZ3+LIJrk
	oQqHJ
X-Gm-Gg: ASbGncsgMKwKVpm3qaV3W5G9tkuaog1KQoWTlQD2us1304FBVzKpSmTb3Q48+kbo8i2
	yhEaEJfS+W234dKlrx6JkfQSTa7qhRxOQLgI9OdAMxa0dKw71EfxR85mvwejKKAGTWlz96dpfKw
	H7ssmULIZoAhvfGlyfSXAvRzE++xR43Pbg8w2XY4K3jZbdWSQNGc5MNSuzdQXemmYOo9tGAK/j3
	z1s8Z3V+j5lgpeZRD3Pn/uq0gdnmlawQGXr0U7MvHHcfxDWmvl7P7vAzMBQrbAu1ziLXQubOHsh
	DR9As3LskpdlO9LxbvaiDsgPAjkyTfwAPCZiOh9V5OTCPJSJw76VhRcJqZ8ktKq+YWcDtXj+AkZ
	UFaQAJxnEOqKxQyShAgw=
X-Google-Smtp-Source: AGHT+IE5GScrLKlUIrCVt3HKL/M8lp3gSQ/9SCOSf1mFMOgYwdmLXkH7cUn5xGXxaoJto726Ihty1g==
X-Received: by 2002:a05:600c:46d1:b0:450:d5f6:55f5 with SMTP id 5b1f17b1804b1-451f0a6a475mr58883185e9.6.1749119288328;
        Thu, 05 Jun 2025 03:28:08 -0700 (PDT)
Date: Thu, 5 Jun 2025 12:28:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 4/5] vpci: use separate rangeset for BAR unmapping
Message-ID: <aEFxN6Vdt03fX8Vh@macbook.local>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-5-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250531125405.268984-5-stewart.hildebrand@amd.com>

On Sat, May 31, 2025 at 08:54:02AM -0400, Stewart Hildebrand wrote:
> Introduce a new per-BAR rangeset, unmap_mem, for p2m unmapping. Rename
> existing mem rangeset to map_mem, which is now only used for mapping.
> Populate unmap_mem by moving just-mapped ranges from map_mem to
> unmap_mem. In modify_bars(), skip recalculating the ranges when
> unmapping as they are already stored in unmap_mem.

I'm afraid the copying of ranges from map_mem to unmap_mem is not fully
correct.

The calculations in modify_bars() take into account overlaps between
BARs.  Given the following set of actions:

1. Map dev#0 BAR0.
2. Cache mapped regions for dev#0 BAR0.
3. Map dev#1 BAR0 that overlaps with dev#0 BAR0.
4. Unmap dev#0 BAR0 using the cached regions.

The unmap of dev#0 BAR0 will also have the side-effect of unmapping
dev#1 BAR0, which is wrong.  That's why modify_bars() must be called
for every map and unmap operation.

Thanks, Roger.

