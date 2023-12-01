Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC160800A1F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 12:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645496.1007699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r924C-0006Ve-Uf; Fri, 01 Dec 2023 11:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645496.1007699; Fri, 01 Dec 2023 11:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r924C-0006T4-R3; Fri, 01 Dec 2023 11:52:20 +0000
Received: by outflank-mailman (input) for mailman id 645496;
 Fri, 01 Dec 2023 11:52:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bjU=HM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r924B-0006Sw-4D
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 11:52:19 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13cfb883-9040-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 12:52:18 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33332096330so262060f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 03:52:18 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 l5-20020a5d5605000000b003330f9287a6sm4001098wrv.11.2023.12.01.03.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 03:52:17 -0800 (PST)
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
X-Inumbo-ID: 13cfb883-9040-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701431537; x=1702036337; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iuCMcAaU9a++WJnHM/qBcNi/BO/t6xyrDi2iaX2aYIQ=;
        b=g+HB7YTScRTzOQH32y1uDDnHePhtl/V+ZszdkqiFdAl7lLqqMFHv61PkvFrFKpy241
         XHcou/7/aDj3srxjW3lr9hxtLsajZwpYkMKQPnPW+VF3bGc0H/yjiO91vD9gwdBJlPkf
         j4dzUtzuyz9OJXVNAUXNVaJLi2cYnidF47Iec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701431537; x=1702036337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuCMcAaU9a++WJnHM/qBcNi/BO/t6xyrDi2iaX2aYIQ=;
        b=lWwE4NxoIP3FbbhCPvigPMk9DgwBrTZv/jZmsImgK76VxADzs/YI3xg4iLf0/JCwNV
         IwLVVuWzbwiLtrFuDsCjy8ZUfGw9whiC/Xi7ED9RleathI4XjTX1gd+J23uti7hx3t+P
         HA/EFOMZtaJVogkduJE3y7jhhsYYxKBCq7IDeEiDyUa4UADKUquctTit52cqmlrPdxWU
         jC/7e18tywsYePNub07llzwR42hJsrR4hw2A4N3X1JCSzYA6bfSslBXrHN+CRKjNu39F
         TCQ82mhCXPyAm70Jici5t57IeUC4Ifjdv/gQIzjwJXVpFBE3HjT1aB7QRKHFn5gPN2lb
         OG9g==
X-Gm-Message-State: AOJu0YwFg/X0R1K/ooOlGkEQQAIeC4Rt6jiN5/ZlLWJ/8qjxXWgIBcyf
	rcVjDwjw2QBNJsxZAD5hf39thA==
X-Google-Smtp-Source: AGHT+IHI10mCEOwajLHHDzxhkcmkHt8k2l1B4elZ1Hf3yCy7tfldY6Mn/TWheKtn3/4J/2EWSNJ5iQ==
X-Received: by 2002:adf:a1d5:0:b0:332:ca1e:711c with SMTP id v21-20020adfa1d5000000b00332ca1e711cmr636531wrv.21.1701431537614;
        Fri, 01 Dec 2023 03:52:17 -0800 (PST)
Date: Fri, 1 Dec 2023 12:52:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 3/5] xen/x86: introduce self modifying code test
Message-ID: <ZWnI8DQ-ipk5RzNA@macbook>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-4-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2311291857340.3533093@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2311291857340.3533093@ubuntu-linux-20-04-desktop>

On Wed, Nov 29, 2023 at 06:58:38PM -0800, Stefano Stabellini wrote:
> On Tue, 28 Nov 2023, Roger Pau Monne wrote:
> > Introduce a helper to perform checks related to self modifying code, and start
> > by creating a simple test to check that alternatives have been applied.
> > 
> > Such test is hooked into the boot process and called just after alternatives
> > have been applied.  In case of failure a message is printed, and the hypervisor
> > is tainted as not having passed the tests, this does require introducing a new
> > taint bit (printed as 'A').
> > 
> > A new sysctl is also introduced to run the tests on demand.  While there are no
> > current users introduced here, further changes will introduce those, and it's
> > helpful to have the interface defined in the sysctl header from the start.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Rework test and interface.
> > ---
> >  tools/include/xenctrl.h             |  2 +
> >  tools/libs/ctrl/xc_misc.c           | 14 ++++++
> >  xen/arch/x86/Makefile               |  1 +
> >  xen/arch/x86/include/asm/test-smc.h | 18 ++++++++
> >  xen/arch/x86/setup.c                |  3 ++
> >  xen/arch/x86/sysctl.c               |  7 +++
> >  xen/arch/x86/test-smc.c             | 68 +++++++++++++++++++++++++++++
> 
> If possible, could we name this differently?

Wikipedia also suggests 'smoc' as an alternative acronym for
self-modifying code, would test-smoc be OK?

Thanks, Roger.

