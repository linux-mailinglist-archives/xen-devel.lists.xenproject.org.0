Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52EACE106
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 17:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005662.1385083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpne-00007l-I7; Wed, 04 Jun 2025 15:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005662.1385083; Wed, 04 Jun 2025 15:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpne-0008WS-Ea; Wed, 04 Jun 2025 15:13:06 +0000
Received: by outflank-mailman (input) for mailman id 1005662;
 Wed, 04 Jun 2025 15:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xa+O=YT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uMpnd-0007yF-Ej
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 15:13:05 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69ea6eb1-4156-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 17:13:05 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a374f727dbso6116263f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 08:13:05 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5253a7aeesm600914f8f.1.2025.06.04.08.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 08:13:03 -0700 (PDT)
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
X-Inumbo-ID: 69ea6eb1-4156-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749049984; x=1749654784; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xitLzBlMV1JQpJ/aBXMyhSPmWh6MH4hoLGJtOXCcl1U=;
        b=vic22R41tWWHrnwgAzGDinPClkyYi/yrgPBJfACgDlAVQwE3S7oJV860NxdYva4q8p
         UhNYBJiKeB/QfZoLdjXQ/MqhqJdNglTYH+NlBI3/jzYpoCmnPPhYUKb3GHm246NLyDSA
         E0cXQ/ZtjOM11LHiFSjkOS4dK2Wi9L/i1R3s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749049984; x=1749654784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xitLzBlMV1JQpJ/aBXMyhSPmWh6MH4hoLGJtOXCcl1U=;
        b=dN5jKkckztQMgd4+SRHnGJspTziM6qQTvDHf1NPG4zpVDPqtXYqdu9W2m0R818m/a+
         zkSZp6bhX9MfWsosOwHGX/9gJfWIMToz8yaISwCbxMpGOBqxpbeO/K+o6sKKF+NhGPDp
         d6i2afGLsaqxHA3LssdEOUNO32ubKPdfxGaQltkiUQj4upX1E/DBS5f7ZiAjFJku4J8X
         EfcyyP2wszt1relRYTa8zRTZNQ3RIU0DVq0sCMkJfdlsZlIVdkHOLtBzzmAZTWN9dt+B
         WGDpP7PynzIbKSMHEq0c64i3Kg0lR88L3U3wP4gn0cEknZr7WRKJl9MUbhaCO8qyoL88
         7kOA==
X-Forwarded-Encrypted: i=1; AJvYcCXc0XlDNo8+MZN7zyKtVvZOOSXEPxHs0/GlrbrKmoYN3L0W9WrNLQBfCjOY0X3HOzwsyVsDg+hm4no=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBi3vEn54VephwceyZMNu9bbgXwogHClXOMg6hWbraX9PuYTcP
	QPUCFlT3NL/swR1b4YW0j8BNr3JBhf9sCMB30B17QghCpl1emr4YOjdruvSmejyo910=
X-Gm-Gg: ASbGnctyUb8oL1724E0n0t2KgENrEIsIIwmGK0E2VrCNVgqKST4/xNDm72W2xTVUSNQ
	qUo8MaPgN4ni4wdCnI83VNuWla1ugr9fQjHbdcpvBvYVKn4dhBxaFO33/HNiSIjwAnFHMTQ5naf
	uNgqfTrpgNtKtP8QaLzuel53UXD2+WXatiL2fajpTSHU6U2ioRHCT6vZLjDREpfRSjmFbXFQRCy
	felTz4d2YKpyp4dBUUXiqwnGP6qQ4Ao3EPw1b2/Aziv6fxTji76K3wDdF74A5UwrrnnEsAYqU9d
	km0jZFkdOUfoXp/g4pGlSQxLP8bM3VFUTHzFYGT1V8uAruI2pVjyUddbtBDB3uMv2ze07yN8EcN
	8fKA0+MAGJJEjBh7vEY7cAlbM
X-Google-Smtp-Source: AGHT+IFI5748rw0qTSZpO584EyoNsU5hs9vzricJt0LgJ6hI/FSjq2DObGwkyPbA/tYUgpiwbvwIEA==
X-Received: by 2002:a05:6000:dc6:b0:3a5:25d0:cf3e with SMTP id ffacd0b85a97d-3a525d0d330mr486273f8f.21.1749049984314;
        Wed, 04 Jun 2025 08:13:04 -0700 (PDT)
Date: Wed, 4 Jun 2025 17:13:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/numa: introduce per-NUMA node flush locks
Message-ID: <aEBif3V6tkBOIz96@macbook.local>
References: <20250522084815.825-1-roger.pau@citrix.com>
 <20250522084815.825-3-roger.pau@citrix.com>
 <2c120e48-edaa-4518-a92e-38872bfc6eac@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c120e48-edaa-4518-a92e-38872bfc6eac@suse.com>

On Wed, Jun 04, 2025 at 02:42:45PM +0200, Jan Beulich wrote:
> On 22.05.2025 10:48, Roger Pau Monne wrote:
> > +bool flush_numa_node(const cpumask_t *mask, const void *va, unsigned int flags)
> > +{
> > +    nodeid_t node = num_online_nodes() > 1 ? cpumask_to_node(mask)
> > +                                           : NUMA_NO_NODE;
> > +    struct arch_numa_node *info;
> > +
> > +    if ( node == NUMA_NO_NODE )
> > +        return false;
> 
> One further question: Here you limit NUMA flushing to a single node, using
> global flushes in all other cases. Did you consider extending this?

I did consider it, my first through was that such approach would
require taking multiple per-node locks at the same time, and so was
not worth pursuing.

I now realize however that we can decompose multi-node flushes into
per-node actions, and execute them sequentially, taking just one
per-node lock for each action.  I can see into doing this.  I'm unsure
whether such decomposing into sequential per-node flushes won't add
more latency (even if reducing contention).

As you say below, that way we would avoid having to allocate an extra
vector.

Thanks, Roger.

