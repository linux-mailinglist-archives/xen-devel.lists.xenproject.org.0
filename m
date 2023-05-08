Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175496FBBC1
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 02:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531940.827914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwAl9-0001Yg-Ne; Mon, 08 May 2023 23:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531940.827914; Mon, 08 May 2023 23:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwAl9-0001Vz-L1; Mon, 08 May 2023 23:59:15 +0000
Received: by outflank-mailman (input) for mailman id 531940;
 Mon, 08 May 2023 23:59:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FoPu=A5=gmail.com=htejun@srs-se1.protection.inumbo.net>)
 id 1pwAl8-0001Vt-9S
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 23:59:14 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 534dac68-edfc-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 01:59:11 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ab14cb3aaeso36432505ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 May 2023 16:59:11 -0700 (PDT)
Received: from localhost
 (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com.
 [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a170902b21800b001a505f04a06sm45882plr.190.2023.05.08.16.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 16:59:09 -0700 (PDT)
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
X-Inumbo-ID: 534dac68-edfc-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683590350; x=1686182350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YJeCVahMakSFFIeHkE0L5vaAYWzeS9qst+vBo++bi0=;
        b=TPN5cpDiUj++UaBuLClkHYKSZJQANDd2z/20VxIZVWHMxUq8xHaiESgezp9rxD7Gua
         kwQsYUXcUlV+z/TE10zkBILwoSSFW9HIsSnlJiytJoJy7FpjLcJSkMTQ5FwrG0ZhPqpv
         mNklxZ3suiwvDBCj7EVZBtRDY5IACqgNnR8WuwKVGfhpG2I7i1f+Mkf7pj595ha9os6j
         TJJUiDx5lGMYJli6SFP6m5BzTEv5qxMT9T42KuwnS05NEL9gk7D+TTxRe4Ne2ObBXqzJ
         tDju3HLcbYeZK1v2hcxZ5e6OH+eh3geSlD4uCw+dEJXNmHBvdg/GJYTwaPZT50EygaGc
         RMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683590350; x=1686182350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YJeCVahMakSFFIeHkE0L5vaAYWzeS9qst+vBo++bi0=;
        b=N5CDiXqdbeTJeLyORa6q43ZQYcTEFRMLxDRKlMvDnsOILvQOXXDuvb7Wu95SRH+43y
         yinCKEaLaHTGixDMJ4vYrBlmh/TqfBt2ot/s6cvSh2tLGzo2OMu5y/kxURA9X8pll49e
         n8XO9BcabH3wO7SQB+ZHThHM69M+grJ6zmckRm8j8xDJE1znbIpt/TNkltVOEeeTCWQT
         9yP2tkn0Hf+zlPvGY1bPy4pD4lWMX0wWc2M6SH3ZQ4xOkjagrvlRy23RKTkXzxov4KfW
         LRtzqLy2euO319cT6jFh9G9L/GQK4JylLU24wRfxpGA2/UqUUJBIuJzbpsi7ISW8e3kF
         FnJg==
X-Gm-Message-State: AC+VfDz3aaEpPpzvPnsXWxczmI/Y1Nk0LJMq/HxsvhR5PASC6vd/ktea
	lbq+kGgwWDIYnlbg57bgbdY=
X-Google-Smtp-Source: ACHHUZ7b+WkCZIE72n5uctblOVhF8S4nx7C/p93x2y2+UjUpxZ3gKtCgsPeB10q3QmlKSF1IQOuFjA==
X-Received: by 2002:a17:902:a583:b0:1aa:f818:7a23 with SMTP id az3-20020a170902a58300b001aaf8187a23mr12371985plb.27.1683590349547;
        Mon, 08 May 2023 16:59:09 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 8 May 2023 13:59:07 -1000
From: Tejun Heo <tj@kernel.org>
To: jiangshanlai@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 15/22] xen/pvcalls: Use alloc_ordered_workqueue() to
 create ordered workqueues
Message-ID: <ZFmMy_QxaOzIoy0P@slm.duckdns.org>
References: <20230421025046.4008499-1-tj@kernel.org>
 <20230421025046.4008499-16-tj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421025046.4008499-16-tj@kernel.org>

Applied to wq/for-6.5-cleanup-ordered.

Thanks.

-- 
tejun

