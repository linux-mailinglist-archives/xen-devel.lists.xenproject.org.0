Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7CC9714D6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794147.1202868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbI3-0008Kb-O5; Mon, 09 Sep 2024 10:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794147.1202868; Mon, 09 Sep 2024 10:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbI3-0008J2-Kz; Mon, 09 Sep 2024 10:06:35 +0000
Received: by outflank-mailman (input) for mailman id 794147;
 Mon, 09 Sep 2024 10:06:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snbI2-00089c-CY
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:06:34 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 315e1b1b-6e93-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 12:06:34 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f761cfa5d8so16108391fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:06:34 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd46886sm2785166a12.34.2024.09.09.03.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 03:06:32 -0700 (PDT)
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
X-Inumbo-ID: 315e1b1b-6e93-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725876393; x=1726481193; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgnN6KKjwKQiWNYJ0ZLdfCpd/y3NAcbZZBLivmi+KrI=;
        b=MvHSlnqz0UkHDJBQmYuUHXnfwoaH3NhFFZ6drKkT3NmxYTm4UHeJS15QSPGaoqPZLE
         LdKH8IGIj5ubDhL4GuXOobZZTRElyA8y8Mo7ELf+pwyEyPw53ZaJyMo6mM4N8FcfEonY
         xh3+8Y/QnwHnDlcIhkZnEe11Ug/St9ZGhNX3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725876393; x=1726481193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgnN6KKjwKQiWNYJ0ZLdfCpd/y3NAcbZZBLivmi+KrI=;
        b=ByfG8/6DW5IjUqObD4rw6zWIXqMS9PDjG1NKErI3MNoHqOeifBAOpcGxinHJp2ZnsH
         y5Q4PtaaIwbnnhQ92nN4a5omgg8Z5ufxJD0E+mW+C7aBCKwlZC6sVW1KUalhVs12vOp7
         fc9iOZPkDD5LOM0xMHhazb99Tnm1drbJ8OBAXGLYDS4l9TUleRoj5/dTf2+gAAzV9g4G
         yU4fUXu/PFwn00w6O3yiLnIYm6ucoksDtsLd7T6Su0RDFH9ru7iGapuYTdNTeac8gzVc
         8r9bAE/1gO+cQ1S17vYfD14QYfnD94IHVMhN4yMTu4vWn1SjNcNynH9ECCa6pQGtPOzs
         CTig==
X-Gm-Message-State: AOJu0YxR6HDknEMVEfqui16rkI3PiayX0N0p59GRhXZuL1N5zjKrJxh/
	fq9/tb5VCjPDiMvODN564coB3kHiRGMVRrBxVfG+x0wmy51UfAtztQ2vuFUId6U=
X-Google-Smtp-Source: AGHT+IFeDKwDwR6+hyekEMUVYBgIIPmAeEsTu5O4EKRIfHJxFPYih38koU4MIFgv3ylvdxZUHQaqQw==
X-Received: by 2002:a2e:bc21:0:b0:2f3:aed8:aa9b with SMTP id 38308e7fff4ca-2f751eaef7emr71101461fa.5.1725876393110;
        Mon, 09 Sep 2024 03:06:33 -0700 (PDT)
Date: Mon, 9 Sep 2024 12:06:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Kelly Choi <kelly.choi@cloud.com>,
	"Charles-H. Schulz" <charles.schulz@vates.tech>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Xen Project Advisory Board <advisory-board@lists.xenproject.org>
Subject: Re: Setting up the Xen Communications Team
Message-ID: <Zt7Ip9i6c8sh7nC6@macbook.local>
References: <e56ff82c1a1d7398a5b38784fc84a7adf51ec918.camel@vates.tech>
 <PH8PR12MB7326CC5D9546BE7CBD8CAF7DBC8E2@PH8PR12MB7326.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2408210916300.3871186@ubuntu-linux-20-04-desktop>
 <CAO-mL=yH=jdFb+cZffJLNw=wU2DZj7JR0LEJJM3e1bsPVxyABQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAO-mL=yH=jdFb+cZffJLNw=wU2DZj7JR0LEJJM3e1bsPVxyABQ@mail.gmail.com>

On Fri, Sep 06, 2024 at 01:54:13PM +0100, Kelly Choi wrote:
> Hi all,
> 
> Thank you for your interest, we'll look into setting up a new Xen
> PR/communications group.
> If anyone else in the community would like to join, please reply directly
> to this email.

I would be interested in joining.

Thanks, Roger.

