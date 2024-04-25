Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051F38B20A7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 13:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712036.1112414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzxYs-0006mG-1N; Thu, 25 Apr 2024 11:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712036.1112414; Thu, 25 Apr 2024 11:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzxYr-0006k3-Uj; Thu, 25 Apr 2024 11:46:45 +0000
Received: by outflank-mailman (input) for mailman id 712036;
 Thu, 25 Apr 2024 11:46:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kLQ4=L6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzxYq-0006jx-58
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 11:46:44 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b99b010-02f9-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 13:46:42 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3c74a75d9adso622767b6e.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 04:46:42 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 i19-20020ae9ee13000000b0078eca9de099sm6916113qkg.134.2024.04.25.04.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 04:46:40 -0700 (PDT)
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
X-Inumbo-ID: 7b99b010-02f9-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714045601; x=1714650401; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKpC0DfL4EP+lGfzDMJ1iuC1TStvH9Q8qqVnwUbfwAQ=;
        b=iHhMs8mbgFU0eyhHwqj9arArdgejhqtaT9IKqKcQ7l4Py9azuHH9Zb61h7UTAVoCvh
         vitsyohu5Q2ypI8l5bHaNT7TaugeIUeV205dUhadDbEv2l/8Seka9DMFVrUKgz6Pu5Za
         vbMPJ+1afzp0Fm4dbyRw/fvJMh3XOy3etoS6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714045601; x=1714650401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKpC0DfL4EP+lGfzDMJ1iuC1TStvH9Q8qqVnwUbfwAQ=;
        b=tv6v7Tp//b+yRIREAdhTKqWORidAfnDCNiD2eNYBGfZtU3i7fROKvmhTcWYYd1eKoe
         CXJX+WPknw7BwX+bmkB+l5R7j6WLK41Yi7Lbhy06aIN0TsOUJtrVFJCDT8sHwRlbt0K3
         7DiVAYIIiX9yrwIM8OrHDHjhXhSbmN+yC5SlzGq/W+xxeYzTHYHEyk/5SAeB9pyXCGqt
         zzKbnWhr7WgiV3BNXrb5sylDlJip6ztuJtsW5UVKZ+oHul0Lir8yvvFIBEi6GQPNCJ6g
         w5hWvPIYjhhJGh7oDJHMHh0MhmJoIoqhlZlToGAtKfoLgL/btd/pxXCfLfIE+naxpzh7
         oUww==
X-Gm-Message-State: AOJu0YzC6crIVjDMnFi1vLvYpsLZkVfrcDJabGKAK98JzoWouN89qBo7
	8nLOv4b8a9S9b2udlPkbhKz+ly0m0YBX+TtAUYM0n3z3QQi2sxEfi6Tatg5Y5y2p7yRcBhobnWI
	b
X-Google-Smtp-Source: AGHT+IGcfQiOACRC3XcOGcpd+sh+hCoSfd6D7L9ekrTskiL91lWMnPb2C+z+0V+MTaCkonWdrXh/Cg==
X-Received: by 2002:a05:6808:1597:b0:3c8:509b:242f with SMTP id t23-20020a056808159700b003c8509b242fmr1203458oiw.0.1714045600957;
        Thu, 25 Apr 2024 04:46:40 -0700 (PDT)
Date: Thu, 25 Apr 2024 13:46:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v4 3/4] livepatch: refuse to resolve symbols that belong
 to init sections
Message-ID: <ZipCnpooVKrRcYbY@macbook>
References: <20240424081957.34326-1-roger.pau@citrix.com>
 <20240424081957.34326-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240424081957.34326-4-roger.pau@citrix.com>

On Wed, Apr 24, 2024 at 10:19:56AM +0200, Roger Pau Monne wrote:
> Livepatch payloads containing symbols that belong to init sections can only
> lead to page faults later on, as by the time the livepatch is loaded init
> sections have already been freed.
> 
> Refuse to resolve such symbols and return an error instead.
> 
> Note such resolutions are only relevant for symbols that point to undefined
> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
> and hence must either be a Xen or a different livepatch payload symbol.
> 
> Do not allow to resolve symbols that point to __init_begin, as that address is
> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
> resolutions against it.
> 
> Since __init_begin can alias other symbols (like _erodata for example)
> allow the force flag to override the check and resolve the symbol anyway.

I've been thinking more about this, and it has further corner cases,
for example with this patch applied attempting to livepatch a function
that contains a rune like:

if ( system_state < SYS_STATE_active )
    call_init_function();

Will now fail as Xen will refuse to resolve the call_init_function
symbol.

I however don't have any better ideas about how to solve this.  Maybe
it's fine to require such patches to use the --force option, as
refusing to resolve init symbols adds a bit more safety to
livepatches.

Thanks, Roger.

