Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D546A46370
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896779.1305539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIgb-0000k0-Kc; Wed, 26 Feb 2025 14:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896779.1305539; Wed, 26 Feb 2025 14:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIgb-0000hg-HN; Wed, 26 Feb 2025 14:46:57 +0000
Received: by outflank-mailman (input) for mailman id 896779;
 Wed, 26 Feb 2025 14:46:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9YQ=VR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnIga-0000SM-7Z
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:46:56 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8622ed3a-f450-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 15:46:55 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e0373c7f55so10520975a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:46:55 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e460ff861esm2922391a12.49.2025.02.26.06.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 06:46:54 -0800 (PST)
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
X-Inumbo-ID: 8622ed3a-f450-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740581215; x=1741186015; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cqxPCEEEzyoVerxha89wahj3A7VImrMsVm1f4Y3pzu0=;
        b=mU0nfLwsXvyU7LlUDHWXyMrwP2oe8TzU/Z49NP4N6JnocpOPeexD7EKzlMWvGwXGM5
         TVcitbz8QTn7xVLrHTvTilg6qs1zQmp0ugEf0IH9ZnqFyRLUL/2zw1szbkICobRXUi6h
         uVLXcg5VgA/FAuADnBxNFyxqtEO5dHIu7X6Y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581215; x=1741186015;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cqxPCEEEzyoVerxha89wahj3A7VImrMsVm1f4Y3pzu0=;
        b=RGvNm7jVIczibIrPhyqdzq4d/oy1blPQ54yx6ErF2R2+tvMo08guiyMGHd0dv4pybq
         OT2VdinrReLCj+mlA0J1o3VGL5Cv5aQfEMs6HFDRpFUi7yT6r8aCm9Wzm4hsY9I8rPoW
         Si5snuDouf3tcCtsMknM8BDq8s+Q5O9pBo8C4410dmLNPfM2Cn83tivgzr63yX55uwOt
         CRnVQl9u2jKijxMO62/iqjWOK5o/b/yzcg67hGTJjNAt/DIFzcA/8hJqh8R1y1kOpjJ2
         jgnzvmLv4RrySfX+OTiQPuiUSIL0cStZQZCYhrU8Gz8owcie4dKfB6SzhepPLwQ11KDJ
         +9ug==
X-Gm-Message-State: AOJu0YxdHfYzl0aDUq2TojYdcdk/Nh86PYrzVE7HDWTk9wP8Bwchkix4
	M31Po1838xWC16P/0l3BOSEmnceBYTEgxJCdbpuKeS6BwVIiduS4kDS7fhXHhhU=
X-Gm-Gg: ASbGncve5f4BloSE++LlBLE41FfENFEIXgrhAQcE6vc1vk8AncUA4W5+yoNC+8yJfmC
	Akkbt5eSEDbzYyErFYOetISI2rdX9e4mcZVZ/2SQq0nNG2tAhhZMUy48v49UPhCygHr4RkF0ss6
	owfF8kzHaZ1GqxSabuHK5OLGTWp0f2X1Qi3becR9cDpXMutGLYDHnYndvXhuYSCL3c8qyUzMnSe
	TQYhwxML6mMK+e6KM1754geyWFPh73jnS51MUOSfi4NiGhfFoE8L2eeoBxF19KVXUY9IbzvV/nP
	53cxWS2B6nYGd0mPsBaBtcxdi6nYTfY=
X-Google-Smtp-Source: AGHT+IFyw8FrJQ1YMNFWsncPfnQ7M3kvOC0CYWSWvZX95zKgg2S1DKIL6dBoUG+5FoPdKpEnvpPTxA==
X-Received: by 2002:a05:6402:35c3:b0:5dc:c9ce:b01b with SMTP id 4fb4d7f45d1cf-5e4a0d71e54mr4242190a12.8.1740581215261;
        Wed, 26 Feb 2025 06:46:55 -0800 (PST)
Date: Wed, 26 Feb 2025 15:46:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony Perard <anthony@xenproject.org>
Subject: Re: [PATCH] PCI: drop pci_segments_init()
Message-ID: <Z78pXcBww9cWUgM9@macbook.local>
References: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>

On Wed, Feb 26, 2025 at 12:38:21PM +0100, Jan Beulich wrote:
> Have callers invoke pci_add_segment() directly instead: With radix tree
> initialization moved out of the function, its name isn't quite
> describing anymore what it actually does.
> 
> On x86 move the logic into __start_xen() itself, to reduce the risk of
> re-introducing ordering issues like the one which was addressed by
> 26fe09e34566 ("radix-tree: introduce RADIX_TREE{,_INIT}()").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

