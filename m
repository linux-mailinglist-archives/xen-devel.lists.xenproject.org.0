Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9A082AC76
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 11:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666149.1036645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNse6-0007Uu-KT; Thu, 11 Jan 2024 10:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666149.1036645; Thu, 11 Jan 2024 10:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNse6-0007T2-Hv; Thu, 11 Jan 2024 10:50:46 +0000
Received: by outflank-mailman (input) for mailman id 666149;
 Thu, 11 Jan 2024 10:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zprx=IV=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1rNse4-0007Sw-MZ
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 10:50:44 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2195d70b-b06f-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 11:49:45 +0100 (CET)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5edfcba97e3so54556787b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 02:49:45 -0800 (PST)
Received: from jmerino-thinkstation (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p7-20020ac87407000000b00427fa8b8159sm323949qtq.76.2024.01.11.02.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:49:43 -0800 (PST)
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
X-Inumbo-ID: 2195d70b-b06f-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704970184; x=1705574984; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s/Q1hglMlj4OJC0XKF8weObxizmgM539bIkSfZVJyfM=;
        b=LA1dTDGZIp2vvM0wqtymqIVoDU3Q6yb6FxpQ0wCozd3k6olMNZ5sp/uRMCFHX40rNc
         u5k82IRTYmqx085Iln5r62+iQsXeYdkZyQtbrGr1hQqT/20HT/2BSua5S4ifTtG1GHiG
         alFAMkyVLoUe9g7PXlZKl+yMTcWrqsHChDER0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704970184; x=1705574984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/Q1hglMlj4OJC0XKF8weObxizmgM539bIkSfZVJyfM=;
        b=nyxmRWJV46A0KU4cPT7a6jUI9IgWD/TPsau1wDhx7JCJaRcEVY5LKYGQSAIlDrTQYL
         7kibZ3WVPdCtzKkAO5VefrbHC5gyEWSpPtDuLo/NamwSyGXWjyuOSkARP4+zbJYtXn5f
         pujilJVjeZQmkYHMcnLpubGdg9Gr/MAr5gVBL07K09HTH1B5Vp9EVfoWXx+B+Ox4slvf
         CMYmpwQqcIPZgGLHCM3zS6XaIyOWU1YHjj4YoiY2cTD2lsnAUuhhzUOX0adnPi7J0EFt
         UhP8Pgb97KjERd0jN+jFgt+CzDa3x9cWFwNJQ17bwfv3aXjGPrL12X6E/l1MN4/cvghS
         0Qhg==
X-Gm-Message-State: AOJu0Yxl4FwR58331QURbgaUibj6lyGXSo9e6SExZnSOCVEoXvYavBG7
	cVIiFheC9+XdN5UQcv+dcAOQZugffwJKOf4zobWqi3JcU14=
X-Google-Smtp-Source: AGHT+IFuv0LaRHNAQ/DBGGCWbbVCNRgFHuBNa6cY35PYWVj9eJUURtNM4Bo7VZ8nWzhrBiy9s+X/1g==
X-Received: by 2002:a05:6902:4f4:b0:dbe:80c0:fdfb with SMTP id w20-20020a05690204f400b00dbe80c0fdfbmr889237ybs.9.1704970184200;
        Thu, 11 Jan 2024 02:49:44 -0800 (PST)
Date: Thu, 11 Jan 2024 10:49:41 +0000
From: Javi Merino <javi.merino@cloud.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.18 v1] xen/common: Don't dereference overlay_node
 after checking that it is NULL
Message-ID: <yjlv6552ddrw7cm6hkoffwus7zflitz4a7lwtoa6txfy6lvsgy@rkvnvhdobdlg>
References: <6b2db92de764b6031647926d27cb14dd455eff7d.1704809355.git.javi.merino@cloud.com>
 <e579994b-80ff-42db-bf57-6c6068fca902@xen.org>
 <ZZ79VcZ1eCqfny-j@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZZ79VcZ1eCqfny-j@amd.com>

On Wed, Jan 10, 2024 at 12:25:57PM -0800, Vikram Garhwal wrote:
> Hi Javi,
> Thank you for spotting and fixing this.

Hi Vikram,

> On Tue, Jan 09, 2024 at 03:31:55PM +0000, Julien Grall wrote:
> > On 09/01/2024 14:19, Javi Merino wrote:
> > > In remove_nodes(), overlay_node is dereferenced when printing the
> > > error message even though it is known to be NULLL.  Fix the error
> > 
> > Typo: s/NULLL/NULL/
> > 
> > This can be fixed on commit if there is nothing else.
> > 
> > > message to avoid dereferencing a NULL pointer.
> > > 
> > > The semantic patch that spots this code is available in
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/null/deref_null.cocci?id=1f874787ed9a2d78ed59cb21d0d90ac0178eceb0
> > 
> > Good catch and glad to see that coccinelle can work on Xen. I am looking
> > forward for more work in that area :).
> > 
> > > 
> > > Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> > > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > c> ---
> > > CC: Vikram Garhwal <vikram.garhwal@amd.com>
> > > 
> > > Vikram, I didn't know what to put in the error message.  Feel free to
> > > suggest something more appropriate than "Device not present in the
> > > tree".
> > 
> > More questions for Vikram, looking at the code, it is not 100% clear in
> > which condition overlay_node could be NULL. Is this a programming error? if
> > so, maybe this should be an ASSERT_UNREACHABLE() (could be added separately)
> > and it would be fine to print nothing.
> > 
> This can happen with failures in add_nodes() function. add_nodes() failure will
> try to call remove_nodes function. Depending on where add_nodes() is failed,
> nodes_address may or may not be NULL.
> 
> We also added a detailed comment on this:
> https://github.com/xen-project/xen/blob/5a3ace21f3d779b291a2d305824b2820d88de7f1/xen/common/dt-overlay.c#L816
> 
> For now, we can return from here without printing anything as error message will
> be printed by the caller of remove_nodes() anyway.

Ok, I'll send a v2 without the printk and add this explanation to the commit message.

Thanks!
Javi

