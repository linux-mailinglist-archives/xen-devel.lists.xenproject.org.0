Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5E8B05DE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 11:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711290.1111134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzYk8-0008Mz-I9; Wed, 24 Apr 2024 09:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711290.1111134; Wed, 24 Apr 2024 09:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzYk8-0008LB-FO; Wed, 24 Apr 2024 09:16:44 +0000
Received: by outflank-mailman (input) for mailman id 711290;
 Wed, 24 Apr 2024 09:16:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmhA=L5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzYk6-0008L5-VQ
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 09:16:42 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cb75cb4-021b-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 11:16:42 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-78edc0f9636so415763485a.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 02:16:42 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 c13-20020ae9e20d000000b0078efd245e09sm5965379qkc.79.2024.04.24.02.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 02:16:40 -0700 (PDT)
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
X-Inumbo-ID: 5cb75cb4-021b-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713950201; x=1714555001; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fmBFVNFS5QwY0jqVgvB9uI5zfjJArolBDLxbcixrvEA=;
        b=shhgG0zeLoqNPfO1scZLbjj9ZoPMwZk2NI/BwEJDcrsFtvx/4QMjesU1q6G/iBzIkL
         k0d15sSfZlpu7riut07k1UES2aFYVpLOBt3dFiU7Vv7D9/uXBPrDA4lG2+pf1NSr8rVi
         45X2YcxrxwWZ6GEBn9e0oq8Ur+0ywnkUjeHVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713950201; x=1714555001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmBFVNFS5QwY0jqVgvB9uI5zfjJArolBDLxbcixrvEA=;
        b=iNvs1cA9RNAmL1DobN2ONb2y2UoS7u2r8JaUdxzfiuxN2L8+ICIDK+Hu7seySeB9L8
         O0ZxMLxV+vLp7ejAbbeWgJFbt+ENqnEmX1U4dbAkJxI5IOPvWpzKaKJK2DQb28dmEklk
         mggFAEuQeM5UVFoXvI9gx5DE2AAAKu1Duxvkbv6WjUWfGYYeUwmfinEaUive014qMg2F
         McQ/WGwZZLMSfjg/khde/0Jbb3+m+TJ3vdcAkaW90T7mJ20wRS79NJatG1yTdX0+xG83
         kLB0g0A0qgLiU1TO2VR4U3XLDiW78m2bobOPvDX13272CIYWh/TCrzVmo/9zKm5oadj7
         JykA==
X-Gm-Message-State: AOJu0YzVwMzoy+1s5RfCsFiJnf+vfDI9YyPzGdT35TuLYdZRFiseoBHd
	dCnMoKLYusWhPZzVdeJcMYW1H2To5wlSUHNzEXIe7aXg9Jmric5Py0ziAPYu7jA=
X-Google-Smtp-Source: AGHT+IFsmYBvP7VVNNXyTOtSzhTnKHI/3leAe8E2bHFvn6KtpDSyZDD+b6aWMhugPjE6ExJrvaBaNA==
X-Received: by 2002:a05:620a:e8e:b0:790:86da:a9b1 with SMTP id w14-20020a05620a0e8e00b0079086daa9b1mr1979842qkm.63.1713950200987;
        Wed, 24 Apr 2024 02:16:40 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:16:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 2/4] x86/P2M: un-indent write_p2m_entry()
Message-ID: <ZijN9l4crUTi_-LA@macbook>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <52b4b0d8-1761-45c7-b6e6-91e1c308209c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52b4b0d8-1761-45c7-b6e6-91e1c308209c@suse.com>

On Tue, Apr 23, 2024 at 04:32:14PM +0200, Jan Beulich wrote:
> Drop the inner scope that was left from earlier if/else removal. Take
> the opportunity and make the paging_unlock() invocation common to
> success and error paths, though.

TBH I'm not sure I prefer the fact to continue function execution
after an error is found, I specially dislike that you have to add a
!rc check to the nestedhvm conditional block, and because anything
that we further add to the function would also need a !rc check.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I do prefer the extra call to paging_unlock() and early return
from the function in case of error.

Thanks, Roger.

