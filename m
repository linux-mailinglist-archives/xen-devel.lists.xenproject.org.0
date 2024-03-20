Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980F8815C1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 17:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696055.1086616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyxL-0000qE-Ni; Wed, 20 Mar 2024 16:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696055.1086616; Wed, 20 Mar 2024 16:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmyxL-0000nH-Kv; Wed, 20 Mar 2024 16:38:23 +0000
Received: by outflank-mailman (input) for mailman id 696055;
 Wed, 20 Mar 2024 16:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmyxK-0000nB-9a
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 16:38:22 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42810574-e6d8-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 17:38:20 +0100 (CET)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-789e70d7c07so4752485a.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 09:38:20 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 k18-20020a05620a0b9200b00789fe83b050sm3280675qkh.78.2024.03.20.09.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 09:38:19 -0700 (PDT)
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
X-Inumbo-ID: 42810574-e6d8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710952699; x=1711557499; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pwvBsWrTVhu00Fq5EFiwRJ76Vn375jjCvCvO5Vl/ebk=;
        b=Vzh02c9tcrOnJZZMX3lky40LmICrZDMVU59RINe/EsC2Jm4lUXxq/Lv0XcffAVnUVJ
         ku7FBeKWd37AO1d/SQsklLENKqfOrnb0f9hDsf/e0h/iBbnl97KQizq6P9PC1vx0tMIc
         X8YW9RRMM9N7ypAb9tnIvfy1TjFX7FFFJaV3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710952699; x=1711557499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwvBsWrTVhu00Fq5EFiwRJ76Vn375jjCvCvO5Vl/ebk=;
        b=xPKgLNd8jFwMEp3CwAlK6ZidElJsDwJcG3SCJXC1vnV3ivJdZWLGV8PzJNF6KKaWd1
         xWr/f8dOE/zhhq6ZhpbawcsDEsMx5eYb8MSxXcj+6Dka3fcYwCeORNixHzVBmaNuxo83
         RL7NLv983lqKobl7asR0dxGuF3LNEf+/OCz/syWkAhqcw3AmqddHKFPFDFC65VBWbDoo
         wyvR8iTF468ADCOhUHl4wwNL5EvmUKLF88T4RG7s3C3XHNZOGNBeIQ6RAQvnxcCyiW3v
         tFnq1gg+one4a4hKGx6VzeezsoMxmtVMJ6cflUP3LmDrNjbbK8TRd1nLr93aB7CagssB
         bvHg==
X-Gm-Message-State: AOJu0YxritbeK7gzvnrdj0/5exmkwTUWE/9RM/xrc1rV1+i9jrKWSr+t
	2qmXMTZS4aIkrg1X/+O3Fbikmp5ZFH6ItA2JwWjW5GqWDm4CuFC/mfKqozt0Xxs=
X-Google-Smtp-Source: AGHT+IG8Jg/VQAnI4r9TtMjSaXzMRJ4tbz93uWeGqNFw4KyeWF1dV8f/KmdGbZCWhuBDHdJaznEJRQ==
X-Received: by 2002:a05:620a:1a1d:b0:788:2e94:ead8 with SMTP id bk29-20020a05620a1a1d00b007882e94ead8mr3065390qkb.42.1710952699365;
        Wed, 20 Mar 2024 09:38:19 -0700 (PDT)
Date: Wed, 20 Mar 2024 17:38:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 10/36] preseed_create: Workaround fail
 grub-install on arndale
Message-ID: <ZfsQ-THtGas3sdEV@macbook>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <20240318165545.3898-11-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318165545.3898-11-anthony.perard@citrix.com>

On Mon, Mar 18, 2024 at 04:55:19PM +0000, Anthony PERARD wrote:
> grub-installer on arndale-* machine fails with Debian Bookworm. It
> tries to install "grub-pc" which doesn't exist. Skip installation.
> 
> Somehow, cubietruck-* installation works fine.

I'm kind of puzzled by this, as cubietruck and arndales are both armhf
IIRC? (IOW: they should use the same repo?)

Does the install of grub-pc succeed on the cubietruck, or is skipped
for some other reason that doesn't require us to intervene?

Thanks, Roger.

