Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C73B81BB3B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 16:46:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659028.1028497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGLFH-0005r4-0M; Thu, 21 Dec 2023 15:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659028.1028497; Thu, 21 Dec 2023 15:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGLFG-0005pP-TO; Thu, 21 Dec 2023 15:45:58 +0000
Received: by outflank-mailman (input) for mailman id 659028;
 Thu, 21 Dec 2023 15:45:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VCQ=IA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rGLFF-0005pH-DJ
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 15:45:57 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07b050fa-a018-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 16:45:56 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso10702635e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 07:45:56 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 s23-20020adf9797000000b00336813bb588sm2309592wrb.111.2023.12.21.07.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:45:55 -0800 (PST)
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
X-Inumbo-ID: 07b050fa-a018-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703173556; x=1703778356; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lseSJ6Mk7oQMCF2lx46a7LM6LUK0AQ9spYT/xLYjDNs=;
        b=gSpFBTHTwRRj8AwZDddoBwC8cJGnhgO+aYTUvs6NS83jCt4Ghsi9WDpqWTryFSKne3
         TleTiYG8PH4aUf4gMPe5B0FfrKu4NyusfAMC2gtdvrTa87xkNc3CqwbnXC6FJ9z8+XMO
         MlrQ7R9cy6EKB5lLhLO0CVmxBnPvCV9KbhAC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703173556; x=1703778356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lseSJ6Mk7oQMCF2lx46a7LM6LUK0AQ9spYT/xLYjDNs=;
        b=iwiUEG09yJNs2Er3FEDNCwvXtdJ6dI37mathKKU1TXsM6Kb3NhgH+Dw/VTXN5vmUSz
         syqTkXrDX1obD8gMtrvHqauoYSdInYNluu76VK1pSKjSfmqF1Y/ppVJmiY6LUfNCSCt7
         0/hHGgd0Mw/NVs8XzaxvLcSPwCL+hxgHCA6e4RGLXwGW311tU925yJqS7v9i57ojvg6u
         Evj8Qhc29ZgUpopco7rd9uTcfh+k/bxZrDDgzcQ0Kig8d4YFcTGJ9vLgVsWUJsq4Ggc5
         hOHnxtdMzb86GPXSg41kKWP1mdwCy/nMyj1mQNy/t/+WG/wS3/T1QYtn9NxtMeTEF5xj
         3jMw==
X-Gm-Message-State: AOJu0YwwPJ8qgO42QVWXLiIDdJMiZ1EdRdwzVIPg2RJaTGrnOVQtjOuD
	9UP7mSJ6sSQSDGO309ITlZTBuQ==
X-Google-Smtp-Source: AGHT+IF8T78joQScqltKUfkGJcpMqdBq9cvFs/6bVcgJjOyEI3unzKjbN8sMl2064URLtw7dpeGtag==
X-Received: by 2002:a05:600c:198a:b0:40c:3774:8ae9 with SMTP id t10-20020a05600c198a00b0040c37748ae9mr946680wmq.7.1703173555995;
        Thu, 21 Dec 2023 07:45:55 -0800 (PST)
Date: Thu, 21 Dec 2023 16:45:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v11 09/17] rangeset: add rangeset_empty() function
Message-ID: <ZYRdsoIRlyfVpIbL@macbook>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-10-volodymyr_babchuk@epam.com>
 <8d44c8f6-aa12-4aa7-996d-68aa50dbec33@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d44c8f6-aa12-4aa7-996d-68aa50dbec33@suse.com>

On Mon, Dec 04, 2023 at 09:36:16AM +0100, Jan Beulich wrote:
> On 02.12.2023 02:27, Volodymyr Babchuk wrote:
> > This function can be used when user wants to remove all rangeset
> > entries but do not want to destroy rangeset itself.
> 
> I have to admit that I'm not happy with the name: We're not consistently
> naming all predicate-like helpers is_...() (see e.g. cpumask_empty()).
> May I suggest to use something which unambiguously expresses an action to
> be taken, e.g. rangeset_purge(), rangeset_reset(), or (less suitable as
> some ambiguity would remain, yet it would be in line with e.g.
> cpumask_clear()) rangeset_clear()?

rangeset_purge() would be my preference probably, second option would
be rangeset_clear().

Thanks, Roger.

