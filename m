Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C2874BA5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 11:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689711.1074942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riAYR-0007gw-6f; Thu, 07 Mar 2024 10:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689711.1074942; Thu, 07 Mar 2024 10:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riAYR-0007eH-3n; Thu, 07 Mar 2024 10:00:47 +0000
Received: by outflank-mailman (input) for mailman id 689711;
 Thu, 07 Mar 2024 10:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z5IG=KN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1riAYQ-0007dw-3g
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 10:00:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90b1cd7d-dc69-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 11:00:45 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-412e96284b9so5660745e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 02:00:45 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 y24-20020a05600c341800b00412f6f4dea4sm2027120wmp.41.2024.03.07.02.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 02:00:44 -0800 (PST)
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
X-Inumbo-ID: 90b1cd7d-dc69-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709805645; x=1710410445; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=arMovgd2mIYnMLIDoAuAlvPpErBwmnW02thqvjtKbD8=;
        b=JzGhEDG8HX+8eC8HfN74hDEs+XswOz5zYD69nQFbTLFSf/mDa/vdVgIIEYBEotksaf
         dDSfyIv2NQcJcM3ee0IOBxIr7YD1iPPOPeZ4RenD3sZu8UjR7T3sK2KAiqiAxGrVIfSR
         ysylCckgDKj85F2zSdfKQ78jIaMLcNH6JvwuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709805645; x=1710410445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arMovgd2mIYnMLIDoAuAlvPpErBwmnW02thqvjtKbD8=;
        b=mKRjZ8CvpE+jfbxi3XaJGGw1CEtChlulTzWZwG0xJm/X0xh/IS2O71zpu2RHfGPkoP
         abPG6XsI70wLOkZ24LzYdJ6SWJRB2XVjkCu1H0P1CBZCRlgzVPcOu2IPQR6eJae/4H0A
         qJQI+RYgjxfLRN1F8r4fPnlVxwa7cABNokgnDlGN5Snwi0l/egoPgAxdC+q9r3LMhETr
         BUom+zXilFDHYfAyHJ9nPShwwR+xKXIvncCOHSB3lDQZ1bdAyTeB26w2LuciAX5wrbjo
         xcMUuW8hobShFbuRla5H/bKgY8gEbhwQ/fQA8ee04+oU8qbWQ91Hsyv6ddq5lkU61VLN
         1kcA==
X-Gm-Message-State: AOJu0Ywl8nuH/PrfDkZmrmyh6Afh1KSr7klgqwVD6jRFLjoBAv29T45o
	Pyf6BUVDg/Zn5rhmYlaOCIZOSNeuLM4qJbjfTjMkq7B2FhXJo4BwYHdLk6WZfVY=
X-Google-Smtp-Source: AGHT+IEUn/aZgDVhaZFPBF+ELwsOFaLiJMxKSj+uLOEmBCVVeca61mkWd8QhlvtEgqXvD03JizpeLQ==
X-Received: by 2002:a05:600c:3ba5:b0:412:f979:587b with SMTP id n37-20020a05600c3ba500b00412f979587bmr2424003wms.17.1709805644662;
        Thu, 07 Mar 2024 02:00:44 -0800 (PST)
Date: Thu, 7 Mar 2024 11:00:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/3] x86/pvh: Support relocating dom0 kernel
Message-ID: <ZemQS-8a_a5pwzf-@macbook>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240306185032.103216-1-jason.andryuk@amd.com>

On Wed, Mar 06, 2024 at 01:50:29PM -0500, Jason Andryuk wrote:
> Xen tries to load a PVH dom0 kernel at the fixed guest physical address
> from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
> it can be configured.
> 
> Unfortunately there exist firmwares that have reserved regions at this
> address, so Xen fails to load the dom0 kernel since it's not RAM.
> 
> The other issue is that the Linux PVH entry point is not
> position-independent.  It expects to run at the compiled
> CONFIG_PHYSICAL_ADDRESS.
> 
> This patch set expands the PVH dom0 builder to try to relocate the
> kernel if needed and possible.  XENFEAT_pvh_relocatable is added for
> kernels to indicate they are relocatable.  However, we may want to
> switch to an additional ELF note with the kernel alignment.  Linux
> specifies a kernel alignment in the bzImage boot_params.setup_header,
> but that is not present the ELF vmlinux file.

I wonder whether we need a pair of notes, to signal the min/max
addresses the kernel supports being relocated to.

Thanks, Roger.

