Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F1B828B82
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 18:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664891.1035008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNGG1-00024f-FP; Tue, 09 Jan 2024 17:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664891.1035008; Tue, 09 Jan 2024 17:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNGG1-00022X-B9; Tue, 09 Jan 2024 17:51:21 +0000
Received: by outflank-mailman (input) for mailman id 664891;
 Tue, 09 Jan 2024 17:51:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bEKq=IT=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1rNGG0-00022R-8G
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 17:51:20 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afaeff2a-af17-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 18:51:16 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55783b7b47aso3000669a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 09:51:16 -0800 (PST)
Received: from jmerino-thinkstation (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 dt13-20020a170906b78d00b00a26b057df46sm1246405ejb.126.2024.01.09.09.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 09:51:15 -0800 (PST)
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
X-Inumbo-ID: afaeff2a-af17-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704822676; x=1705427476; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YgRb8MKHr8h0tFnzTJhPr7fl80PWyC+x0SDz9mVCcg4=;
        b=dKgfJ90QeK7jRtoq8J2eutANTuV4iOrDKzeunDskSCAyLi3kFJ6hrrpCp2JhXFfxX6
         Yng9+7md1qJKw/NnuCUx2ubCkG6bbKm+UXjVy5b8KzVHY1xR3QQJKnncxgsr6/h/SZN2
         Jw1HElPOCTxmamtzvqTqPzcZod4n/Wzo990yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704822676; x=1705427476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgRb8MKHr8h0tFnzTJhPr7fl80PWyC+x0SDz9mVCcg4=;
        b=XKHkvc9SscnONWpYH7dJBAKesSVVesoS9hZgx4bdB/iML9vkP5lV7JlVOAKiVgTrAP
         Ofay24lc2F0JNIp8minW53yYCBbSZjXe1+YS3kZZnfj2MfNCjX3aF4jbSK7wSdDMv3ic
         363Tqn0WQx4fQCVnkyyaqOa4IuwbZeyTgUmDJztiKA+1XhPaH0k2Pw1qQfKBr2MRa6dc
         wTUnZ29f6Na7aD1NYLqG7Z9J4J/pxLyf7wzyf6/okdIRDoKdJON+r3YCP39o9FJDaTFq
         wLlLZ3EikzGP9jBzcNjBm/hw/h+r8hsF9eN1385V8TxA9xHhX3EJspF9O+6ywGCWRskM
         lAcA==
X-Gm-Message-State: AOJu0Yx0HiYqGy7KjWmIcWNYZvpMt7HSNbtMuTCVJxM2ioRITpPs8Y5e
	HurMWCKvtn0h2m8Mgn1I4IC2tk4JpuxwCA==
X-Google-Smtp-Source: AGHT+IGfboNQ+rTqUFQiHIKf6mlZgjzx1Y2J1VToNH3bCU6RYYnC4R3mCEHFAIbtkTcfUwR2YxH6cQ==
X-Received: by 2002:a17:907:1b28:b0:a2a:fc9b:c05a with SMTP id mp40-20020a1709071b2800b00a2afc9bc05amr1202339ejc.15.1704822676056;
        Tue, 09 Jan 2024 09:51:16 -0800 (PST)
Date: Tue, 9 Jan 2024 17:51:15 +0000
From: Javi Merino <javi.merino@cloud.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Vikram Garhwal <vikram.garhwal@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.18 v1] xen/common: Don't dereference overlay_node
 after checking that it is NULL
Message-ID: <y5ity42qgf634cg2kh2bxnwwlpksxpif7volgvvgcdtg55izlx@bgneyecst7hp>
References: <6b2db92de764b6031647926d27cb14dd455eff7d.1704809355.git.javi.merino@cloud.com>
 <e579994b-80ff-42db-bf57-6c6068fca902@xen.org>
 <4pfn6xyqw2eum4hokedzeqzvteyrwjokynt2zxq6wesaxfwzsp@cfk6iab3etey>
 <6fe36a67-b798-42a7-8eab-07b154cfd781@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6fe36a67-b798-42a7-8eab-07b154cfd781@xen.org>

On Tue, Jan 09, 2024 at 03:50:38PM +0000, Julien Grall wrote:
> Hi Javi,
> 
> On 09/01/2024 15:42, Javi Merino wrote:
> > On Tue, Jan 09, 2024 at 03:31:55PM +0000, Julien Grall wrote:
> > > Hi Javi,
> > > 
> > > Title: Any reason this is titled for-4.18? Shouldn't this patch also be
> > > merged in staging?
> > 
> > This is for staging and 4.18.  If the tag "for-4.18" meant "this is
> > only for 4.18", then that's not what I meant.  Sorry for that.
> 
> We usually use "for-4.XX" during code freeze to indicate whether a patch
> should be part of the upcoming relase of the next week. Hence my confusion.

Ok, I know for next time.  Thanks for the clarification.

> Outside of the code freeze, we sometimes add the tag "Backport: 4.XX+" just
> above the Signed-off-by in addition to the Fixes tag to indicate how far the
> backport should go. The Fixes tag is also sufficient.
> 
> As a side node, this is fixing experimental code. So in general we would not
> backport such patch (we only do backport for supported features). This is
> because there are no guarantee that an experimental would not crash Xen.
> 
> Although, the tag is still useful for downstream that may have decided to
> take the patch in (I think AMD/Xilinx is using them) and accept some of the
> risks.
> 
> Stefano is the person doing the backport for Arm. So I will let him decide
> whether he wants to backport it.

Fair enough.

Cheers,
Javi

