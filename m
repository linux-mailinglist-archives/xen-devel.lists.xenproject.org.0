Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3A7A540F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 22:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604222.941458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiKot-0003Bj-5X; Mon, 18 Sep 2023 20:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604222.941458; Mon, 18 Sep 2023 20:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiKot-00039G-2i; Mon, 18 Sep 2023 20:26:11 +0000
Received: by outflank-mailman (input) for mailman id 604222;
 Mon, 18 Sep 2023 20:26:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCDX=FC=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiKor-00039A-TJ
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 20:26:09 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 998338dd-5661-11ee-8789-cb3800f73035;
 Mon, 18 Sep 2023 22:26:08 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31aeef88a55so4420021f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 13:26:08 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adfea02000000b003143867d2ebsm13596262wrm.63.2023.09.18.13.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:26:07 -0700 (PDT)
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
X-Inumbo-ID: 998338dd-5661-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695068768; x=1695673568; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPSSM+M1prGuni2WddGvcumFU/9OPfnn8CrXiy79fCk=;
        b=bsL5gF8A9RGeykeNs8movmDYeLJoOQ3z5vmPZmap60VJuv4f5yb3fJ/MQrikenPQBH
         zERlj2wYxULE35k2sgDdgep5Wz3o5Giy+J1YmYHtYq3q/iOYjgvxsIb+5rymNrm9iXWg
         psIoHzsJbbDzl4dQIpUcCDuFz5UvbVznpWzes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695068768; x=1695673568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPSSM+M1prGuni2WddGvcumFU/9OPfnn8CrXiy79fCk=;
        b=L3rzkVdqTwoj9hR+afvXbODECDtJmx0FdfawPX2lp5GRa5PRv7WvVdOFnQ6PNsDnfO
         R82Y9VU7xMtDGfe9/OXH1jndBIq4opATAVS5izsW60k4XjytKg/65i1YSXWQasFfmkbQ
         hFpqb2eIf+kqNyvfZEpDEeApoxTAEDCQA8PPGfFhRcVXni+2i767KR03lmTV9paA8PTK
         WZBwghKxypFVr4xSNgAIUfQvYhWI3GwKLXK9KHvwdnEyNpRjttIAvcVj2PYD0exet7dV
         fgO593eqSoqVBZLViv1MYZ0NK7KkiC2fqowQ0j3lZ/hwIfg3HyVRBFSvXhig37ddqPtU
         QRiQ==
X-Gm-Message-State: AOJu0YzFOHOG0inYU8WVk2xQw36JiM7kvvtxWy/f85NQDz2Qep8kxnuU
	er6VGojRymhbCk6FvnnRHXiVgA==
X-Google-Smtp-Source: AGHT+IEsv1CXrN9xmDh8xEp6oyWZfxYSBYUneVty1mbOTJkNd3WKriubcUCSpBolICz0DprPHQ0JMw==
X-Received: by 2002:a5d:46c4:0:b0:31d:cf59:8de with SMTP id g4-20020a5d46c4000000b0031dcf5908demr8725976wrs.19.1695068767942;
        Mon, 18 Sep 2023 13:26:07 -0700 (PDT)
Date: Mon, 18 Sep 2023 21:25:57 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, 
	George Dunlap <george.dunlap@cloud.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 5/5] README: update to remove old note about the
 build system's python expectation
Message-ID: <ni5iorx7nuxelv2ij6whl4rnecyqngaqfmzjf7nrmsraq7wfum@u3jcu4fozw3q>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <2b98d4409f0220c5b24517c5b230344228717eb8.1694450145.git.javi.merino@cloud.com>
 <3bf11a57-d3f0-7dcc-b31e-8ecb598346bc@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3bf11a57-d3f0-7dcc-b31e-8ecb598346bc@citrix.com>

On Tue, Sep 12, 2023 at 01:25:06PM +0100, Andrew Cooper wrote:
> On 11/09/2023 5:51 pm, Javi Merino wrote:
> > The configure script tests for the availability of python3, python and
> > python2 in that order and sets PYTHON to the first one found in path.
> > You don't need to have a symlink to python.
> 
> I think this was fixed by 5852ca48526316918cd82fba1033a6a5379fbc4c
> "build: fix tools/configure in case only python3 exists"

Indeed! I should have put it in the commit message.

> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> I'm happy to fix the commit message on commit.

Thanks!

