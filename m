Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC84F7E23C1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 14:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627975.978938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzzQS-0007uT-WC; Mon, 06 Nov 2023 13:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627975.978938; Mon, 06 Nov 2023 13:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzzQS-0007sb-TR; Mon, 06 Nov 2023 13:13:56 +0000
Received: by outflank-mailman (input) for mailman id 627975;
 Mon, 06 Nov 2023 13:13:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eGT=GT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qzzQR-0007sV-8c
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 13:13:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5537c8d7-7ca6-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 14:13:53 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso34315405e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 05:13:53 -0800 (PST)
Received: from EMEAENGAAD19049. ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b0032da40fd7bdsm9494981wrr.24.2023.11.06.05.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 05:13:52 -0800 (PST)
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
X-Inumbo-ID: 5537c8d7-7ca6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699276433; x=1699881233; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HaCRG8hXKyMFUUQ6QvwCzf6vguymuIrfLBnLAzsuP7A=;
        b=PcqEfSeiPBGBS3wAHR73LYHhm96uzrLP1XJxWrks9zpCA0yM/k+BrYS+ZLRN1i2olR
         LoF1NAjtWonHtcHlz/08fSImQDs7pQnveoowNVFl9nCgSdVzee+Xpm3wfc/ps12cuBzZ
         8pxDTE+0QOV+aVkMuW4GNzL+l6eeiQ/8fhmQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699276433; x=1699881233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaCRG8hXKyMFUUQ6QvwCzf6vguymuIrfLBnLAzsuP7A=;
        b=KMz2kqHMxxk8q7BtMLNAgc69d/sWdh2NjkA/goK5C5q2NKWTZn0QsUf/CYOCZtMPeY
         2R1ZLyEh1QFElPPfIu/r3k34+nRtujRB4bSxGxuke+WxNRNehBYUs1YvwDynvAqAzNr7
         BPhr4gJLxlOaugw681kPqBgD37fzwZelIb/Xc/kolrwMKTHNHlvKlTYjeZuth2uqbgV+
         OoNsmnFqRs29JqwXjL6Xh09yOe8ZPwuMmJ/hjf23/bBOFFfT/ADJzT+cux2OWPWGR3tP
         LKq0CynwRAOesl9Wgsbx9214BK/fUWF2jLP7MQ8s3spWk2iWn19YISnesH33OklICYVj
         a6dA==
X-Gm-Message-State: AOJu0Yx1nFZBnpXf/XJ1fzxhWZpFwt8mAH0N4got4qqDYTKLYGlMyLeG
	ck7ATJLN4Xbo6hHqYng3VUW9w+hn1NfKTbGH4qo=
X-Google-Smtp-Source: AGHT+IFnnO7ZMp2xlLL8u09LAlFKBAOWMJ2lgVzuiXewHR42+uVaRLPY4I3dE5ERPjP0rtMxSrwbyw==
X-Received: by 2002:a5d:4a4c:0:b0:32d:d2ef:b0c1 with SMTP id v12-20020a5d4a4c000000b0032dd2efb0c1mr21390340wrs.33.1699276432721;
        Mon, 06 Nov 2023 05:13:52 -0800 (PST)
Message-ID: <6548e690.5d0a0220.b4d80.fa60@mx.google.com>
X-Google-Original-Message-ID: <ZUjmjgxYntDlN28q@EMEAENGAAD19049.>
Date: Mon, 6 Nov 2023 13:13:50 +0000
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andcooper@tibco.com>
Cc: Olaf Hering <olaf@aepfle.de>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools: Remove all DECLARE_* op macros in xc
References: <20231106081946.1055-1-alejandro.vallejo@cloud.com>
 <20231106115852.31df968d.olaf@aepfle.de>
 <3620b635-0014-4def-b4c6-aadf099b0410@tibco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3620b635-0014-4def-b4c6-aadf099b0410@tibco.com>

On Mon, Nov 06, 2023 at 11:29:57AM +0000, Andrew Cooper wrote:
> On 06/11/2023 10:58 am, Olaf Hering wrote:
> > Mon,  6 Nov 2023 08:19:46 +0000 Alejandro Vallejo <alejandro.vallejo@cloud.com>:
> >
> >> +    struct xen_sysctl sysctl = {0};
> > What is that zero doing here? I think a plain {} will do it as well.
> 
> Indeed.  It needs to be {} and not {0} to compile on some obsolete but
> still supported versions of GCC.
> 
> ~Andrew
I tried to find out what you're talking about and all I could find was:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=36750

I'm guessing we are already inhibiting that warning because grepping for
{0} shows a bunch of uses of this pattern both in toolstack and the
hypervisor. If this breaks something it's already broken.

Either way, sure. Let me re-generate the diff. I have strong philosophical
objections to keeping support for >10yo toolchains in detriment of >20yo
standards, but I'll just save the rant for another day.

Cheers,
Alejandro

