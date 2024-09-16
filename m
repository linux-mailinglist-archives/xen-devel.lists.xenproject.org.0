Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8E979C35
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:45:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799255.1209189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6Pg-0006Fp-3N; Mon, 16 Sep 2024 07:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799255.1209189; Mon, 16 Sep 2024 07:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6Pg-0006Ce-0S; Mon, 16 Sep 2024 07:44:48 +0000
Received: by outflank-mailman (input) for mailman id 799255;
 Mon, 16 Sep 2024 07:44:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H51U=QO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sq6Pf-0006CY-95
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:44:47 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b4a91c6-73ff-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 09:44:46 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42cbbb1727eso33558345e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 00:44:46 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73e84a9sm6395889f8f.44.2024.09.16.00.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 00:44:45 -0700 (PDT)
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
X-Inumbo-ID: 8b4a91c6-73ff-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726472686; x=1727077486; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDcToQTfNo5kXSDNfggI3M3nwx8KiOaWmEgg5hlnH9c=;
        b=CPcyZinigod9bDbM8tGCPHQQwGMoPkFKjEbszpWMYtsVn4eiGYuU9ZRs3wTY8x3qYN
         J/yx+UvJP2ZjfziAy+J2bjXbTwN8bWCG0dfHwXSbwa8u/zj66tOYAIaxvfOQStHBPKXj
         DQ9vwUEMNT7GHwOGFpfn+MHeZnsme/L0fLK04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726472686; x=1727077486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDcToQTfNo5kXSDNfggI3M3nwx8KiOaWmEgg5hlnH9c=;
        b=tECIz1yGoNJnTJbvO7L61PwFWADnN4UA89UEFB5JnIGoK1EW+IilyhKS+927GgREOg
         PDX02e7pbptvUOWcV/BCTdktQFDXP/hvU7canGxxIOyQAmGZL3bJHDh6tJ4zoTJkzS1B
         uHTm0abM5m58bmrEAEow37tTqPqLP7wfOB9okxmQ3OB9gNyNC7jowsiLMmrDlmMa7m9K
         RhHdCwRYIxXnLsRJcLnifahEBGvPkuiBfc6TxprIvbRAzzqpoXlFZbkEmDJ1xGg4D9Vo
         YCG+5G5ottIzC1vsmQsiquOJ4g063MoYiA4ja61DRu/oU0GrBbDMDqw5eVRLwxZpZxpe
         f97A==
X-Gm-Message-State: AOJu0YyDLzuEF9ztoARMk75xYQKTuCceU6mgEBOLZaLC7TMtuQ8+JMVb
	1BWtOkxIa6nXv+ZWk2gTsO6VOrLdAgvCsBJheYdGTDqmgC/K911HeAaRGcVo+1Q=
X-Google-Smtp-Source: AGHT+IFAO5mPcIT3d8kGQ2WBHsw3/eUQBr+Xm/WHNGwS81S9AQvJ2+/w9BR973vuAFB6W5WtpEClMg==
X-Received: by 2002:a5d:5482:0:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-378c2cfc460mr7204092f8f.19.1726472685589;
        Mon, 16 Sep 2024 00:44:45 -0700 (PDT)
Date: Mon, 16 Sep 2024 09:44:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
Message-ID: <Zufh7DOSCwzhrpZG@macbook.local>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>

On Mon, Sep 16, 2024 at 09:37:57AM +0300, Sergiy Kibrik wrote:
> Introduce config option X86_PMTIMER so that pmtimer driver can be disabled on
> systems that don't need it.

Same comment as in the VGA patch, you need to handle the user passing
X86_EMU_PM.  It's not OK to just ignore the flag if the hypervisor is
built without ACPI PM timer support.

Regards, Roger.

