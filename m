Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C61ADB5AE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 17:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017411.1394401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRBy3-00040Y-1m; Mon, 16 Jun 2025 15:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017411.1394401; Mon, 16 Jun 2025 15:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRBy2-0003yW-VS; Mon, 16 Jun 2025 15:41:50 +0000
Received: by outflank-mailman (input) for mailman id 1017411;
 Mon, 16 Jun 2025 15:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppVY=Y7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRBy2-0003yP-0i
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 15:41:50 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a47c5a4-4ac8-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 17:41:48 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so40588085e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 08:41:48 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e232e4asm146606925e9.11.2025.06.16.08.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:41:47 -0700 (PDT)
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
X-Inumbo-ID: 6a47c5a4-4ac8-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750088508; x=1750693308; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gsd37mpintvqqll2VXaHhVyGAM2PUNPG2rpZ7QLI5uA=;
        b=dqH7/9lVe7zFupuW1LmQnM6OjhpuFxXa1MzRcQmvyieDSi+4EfMjqbiU4mRONfFqFV
         CMX1qE4TOr2/fMsEuhm0mYdAx+QlMInwOYN5amZkyks1mEjL4Ux3dI9s8Fl1GVVWcVtN
         srX6h84PEoknTUN8Q/Pp0odJ0e8mIjYjkIeSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750088508; x=1750693308;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gsd37mpintvqqll2VXaHhVyGAM2PUNPG2rpZ7QLI5uA=;
        b=LNzSY857IhJ4hocTq+VGGK+EXQFoOXLvF9mTqkf60yYK5xD3BSm7QgArdA+/OGa+8N
         LUznsyUxWEYNlmER+t/bdSi/00dnJGxAdajgd0oR50kpWzIqbB45DIm0+tN41u/IUVLt
         rwxkwktZNj/zvD8hjTA4yMmZ1x2fytht2xd+WmJk1v7wwdoqgKx/662/SdQYxBCV0Nqo
         9B9x00IWgCm3rLFjP/surbKovWqXu3giFK0cdUAkxC7/kM+Vqli9w9ODh/WRMTuz3A+p
         cmclXgc/PBBP1gXdGaqtPQP6Su1Hso66qfR73iVLlJVU4Qfg7BZaZ0yLXqmajS6Gk0jl
         ZoZg==
X-Gm-Message-State: AOJu0Yw2DBzvFLkQ2V2Jk+6Ee6D59DU3BgmWOA93ltpnvViKPj/oqkve
	XqUu8vZFay+iMMUqyln7xEXGi1E8KSZ2mlX95VEzo7T1aDk+O7WaSAMDbO+mR3dBge4=
X-Gm-Gg: ASbGnctvC3195c0hC6IIk+3QZUQNiyNY4S3Zopm+auWRf0A/UmGrtg2mG/Edsmp1YLr
	n2U5HyI8xnGe3EFhPvtwg+vUtl3YYxJFcf3WbluCXOMmaZeyMwonnZEFj0JbWTAuZj579rTMhaU
	pd+WQO8h77Ey/348hfiUdA/cTFh6frdbCsN8AIroDrzjH0utuat+2KynfkQJ9LNy2RY2QsN7Tq2
	4kv7sb94MByaXSFZhkIN0QeW/DQEPihLUtYgkBgYiD2sHbrhxHYx7/Ui7uKrN3Aqjlp+NbIPRBH
	7WhUDKQ/HNfras3yT5IVVLYaboQGNY/VPV9c9TXQJ7vVdSTEKRoQda5FV/RgzCg47zwlF0yGBRx
	SLxJ6b8ZnE4J992JXqapsoKw36/iGLMmXEnU=
X-Google-Smtp-Source: AGHT+IFWaBJmosdHxX3HA5XBljzOQzZ+5wC0CW/DYPk4tQ5374AU+m+iZv9u3XsodxqFJnFqQCpAvQ==
X-Received: by 2002:a05:600d:d:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-45345f19d92mr52610645e9.14.1750088508087;
        Mon, 16 Jun 2025 08:41:48 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:41:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] memory: arrange to conserve on DMA reservation
Message-ID: <aFA7OiV8AX-ua-W_@macbook.local>
References: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>
 <aFAbqhfmM_GBxjVC@macbook.local>
 <9b036f26-f275-48d0-9a33-7cef38b29f48@suse.com>
 <aFAuRXSryHKj3jVa@macbook.local>
 <2969b5d8-5879-4674-8332-046898e17257@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2969b5d8-5879-4674-8332-046898e17257@suse.com>

On Mon, Jun 16, 2025 at 05:20:45PM +0200, Jan Beulich wrote:
> On 16.06.2025 16:46, Roger Pau Monné wrote:
> > One question I have though, on systems with a low amount of memory
> > (let's say 8GB), does this lead to an increase in domain construction
> > time due to having to fallback to order 0 allocations when running out
> > of non-DMA memory?
> 
> It'll likely be slower, yes, but I can't guesstimate by how much.

Should there be some way to control this behavior then?  I'm mostly
thinking about client systems like Qubes where memory is likely
limited, and the extra slowness to create VMs could become
noticeable?

Thanks, Roger.

