Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B6B824A48
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 22:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661908.1031696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLVFp-00072R-8B; Thu, 04 Jan 2024 21:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661908.1031696; Thu, 04 Jan 2024 21:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLVFp-0006z9-47; Thu, 04 Jan 2024 21:27:53 +0000
Received: by outflank-mailman (input) for mailman id 661908;
 Thu, 04 Jan 2024 21:27:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a8MA=IO=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1rLVFn-0006z3-KA
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 21:27:51 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c85f46c-ab48-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 22:27:50 +0100 (CET)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso857758276.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 13:27:50 -0800 (PST)
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
X-Inumbo-ID: 1c85f46c-ab48-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704403669; x=1705008469; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KvHya6V6w88PX2+fR0diTH9XlozJR6iVhdv4BsUSx+0=;
        b=CNm47DLh2QUIw216TVovzVuGtNRnh5ytyusI1uaMvEDxRd3txWy0p8NJ9JYfhHNtHO
         5Em9YSy5bbwePkGQmXRMitDGyHhejXZ4tIiAEJS6h5iY0ZyWzCP2mF96PyO0NEl7+UsV
         JQ8iGRkQkgEjrFf5cbTg3PUm4c07VHfeRS5DTLJBAy3OODKeLpsZVhGplXBRuTGH/R3h
         5/81YStQqh7/3Amoa55j2Rs6hHBi9QuNOVAAZPKPAUzfwwLzOt0Q65OUdGPZMcqcdPEK
         seDQGgwgN0hQcVsjJpfwKF/BvEwAVW5JW+7vJWOnJFofTcspSnEAXObXfCurgDd1R3+z
         w5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704403669; x=1705008469;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvHya6V6w88PX2+fR0diTH9XlozJR6iVhdv4BsUSx+0=;
        b=swW8871p5XOT+B2Gng60GScvtkQUZ1gg+z5UwtwSCRymGs8ybJ3ArQb1Kxys+62WRG
         c9gIlGM0qzQyKTBbSwiu/9Sf3FNVdAsAYdevu5jTlEUCJ/3KFgTOopEHobOFCIL0BZET
         z4UvD/CJS9K3EckT1jn7IQmUy9Lcww/0j3tk4lLnjd6Hc3vtTJ2TCsheoPbIPmOTf80J
         tQezcfod2FXE0BTCBkQgB0zIdeUA/ye12EMoZ3XgUuCbZBWy6Av2EJ4ATqT0K4jlkS1Z
         /lCOsOyUPL3muRV4tLixbKNxATPS5aPaK3Znz1jpxZvntlUZMsm8fv+KQUWZunMNmqSo
         nltg==
X-Gm-Message-State: AOJu0YwYwMBaN7mkALrWivX6jYypXrzcb3Hi12O1tHWUEqvurbg3D/Yr
	d1m7APuTFPL8pn/FsOiv3xYZ+priCUuqdpggVgs=
X-Google-Smtp-Source: AGHT+IF0k9k7UT+AIzjGwe9U5q3OSKdXFyDVEeqJt9U8gOb+1FuD+y7gbcgmjTeRawRV/YjTqDDcLaI5K7iGHyIVqQE=
X-Received: by 2002:a25:b226:0:b0:dbe:a4d8:c5c6 with SMTP id
 i38-20020a25b226000000b00dbea4d8c5c6mr1149784ybj.48.1704403669340; Thu, 04
 Jan 2024 13:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
 <1248487f-4852-41f5-9ffd-d4d12897a622@suse.com> <7d35a648-a69b-4dfb-bf4f-d30272df5e9b@citrix.com>
 <5fd69614-a236-4a5b-8ec1-8cfea6d28d32@suse.com>
In-Reply-To: <5fd69614-a236-4a5b-8ec1-8cfea6d28d32@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 4 Jan 2024 16:27:13 -0500
Message-ID: <CABfawh=0JmGXZeR980bR-bx3cH3hkBsqOGFe-x_tuuubESK9-A@mail.gmail.com>
Subject: Re: [PATCH] xen: Use -Wuninitialized and -Winit-self
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Roberto Bagnara <roberto.bagnara@bugseng.com>, 
	"consulting@bugseng.com" <consulting@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> > Getting ~0 back is strictly less bad than getting stack rubble because
> > at least it's obviously wrong.
>
> But then why not change things so there's no issue anymore? Plus I'm not
> sure how / whether "obviously wrong" would manifest. I expect it would
> be an entirely unobvious boot hang, or other misbehavior.

+1 for changing these APIs to make it clear when an error happened
instead of returning magic value. Otherwise yea clearly should not use
init-to-self anywhere just to silence other warnings..

Tamas

