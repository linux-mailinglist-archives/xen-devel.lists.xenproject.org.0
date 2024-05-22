Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39428CBFF2
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 13:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727506.1131988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9jsn-00012c-5S; Wed, 22 May 2024 11:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727506.1131988; Wed, 22 May 2024 11:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9jsn-0000zo-2o; Wed, 22 May 2024 11:11:45 +0000
Received: by outflank-mailman (input) for mailman id 727506;
 Wed, 22 May 2024 11:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ieL=MZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s9jsl-0000zi-KL
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 11:11:43 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e29335f-182c-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 13:11:37 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3c9c67c059bso2317914b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 04:11:37 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf27f847sm1384224385a.29.2024.05.22.04.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 04:11:35 -0700 (PDT)
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
X-Inumbo-ID: 0e29335f-182c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716376296; x=1716981096; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5TGGydkdUDAa2iDRyDX9I68XDOJ0g6xmW8BLIK0f/dU=;
        b=PLAuUWDikjaOtUWDLLj0nJsb8mVqWlWptB3pKFTw0PZOr5hUPuBs8qeCc7UdExdQn8
         rUoC17qSH/1mbJycGGCd5Lc+WysXVPZmEOs8PIGtupLSk8JUvSReM3SX8gcMQZvUGxhV
         3mSdDt7oy5PC33tlE9wWdg1WELl/HUbt5lCDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716376296; x=1716981096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TGGydkdUDAa2iDRyDX9I68XDOJ0g6xmW8BLIK0f/dU=;
        b=nH+HbbFZCeZaj/PXH3IWZZFc3KUgOqvwpVw+uMGYPCT5n09n/bSJcZ+bVGZ5+oTJsI
         Z//YkNpqLPkyLdMFZgk2lYhyf3YzY2m4F8B434172E7Z3WOfebWefFdOdi4zA+QEriZO
         0kX+EiTfR8W2PLWS5v4VNoKKXgb8Lq+UhEX5uGDx+vB4pOTA6+8QYX2bCUWtrL3ge72V
         jWSIHBn4/cwbZx08XFqBFb/hgjgfD9mGKrTuAcAE6s/LitRnnw9nllXgc9iCY8jWeWwf
         TOuNn7Nz9BIm59C1ZMV9ywsAlmgUCXH+zEG5dCAiHFirvQy+lWhJJAdA3mYgG8UZc4hT
         KLgQ==
X-Gm-Message-State: AOJu0Yw2n5cyVrB8U13oBTw/U9IFG/qgvnAgiRUDxK8gZtOQEcAsYO4S
	g3cB5y1WD4qWGiYEMn72oHBx5ch3Txpo8RBOomKbIG7VjGAb/JP9EOUmVJpo2yU=
X-Google-Smtp-Source: AGHT+IEAsOkFas2LpR9RdVRT4Yfp/4g3CfgAqp5COztGmmByyhedJzET8Z28W4YqVot/waccbXaZZg==
X-Received: by 2002:a05:6808:211a:b0:3c9:956b:c738 with SMTP id 5614622812f47-3cdb9d39676mr2856569b6e.43.1716376296055;
        Wed, 22 May 2024 04:11:36 -0700 (PDT)
Date: Wed, 22 May 2024 13:11:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
	George Dunlap <george.dunlap@cloud.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] x86/shadow: don't leave trace record field uninitialized
Message-ID: <Zk3S5SBC0fp-gk4G@macbook>
References: <5133a01d-346d-4779-b319-a156ef944669@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5133a01d-346d-4779-b319-a156ef944669@suse.com>

On Wed, May 22, 2024 at 12:17:30PM +0200, Jan Beulich wrote:
> The emulation_count field is set only conditionally right now. Convert
> all field setting to an initializer, thus guaranteeing that field to be
> set to 0 (default initialized) when GUEST_PAGING_LEVELS != 3.
> 
> While there also drop the "event" local variable, thus eliminating an
> instance of the being phased out u32 type.
> 
> Coverity ID: 1598430
> Fixes: 9a86ac1aa3d2 ("xentrace 5/7: Additional tracing for the shadow code")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

