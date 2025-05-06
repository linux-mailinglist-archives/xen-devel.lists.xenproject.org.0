Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8279AACC09
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 19:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977844.1364765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLsC-0002Wr-Ru; Tue, 06 May 2025 17:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977844.1364765; Tue, 06 May 2025 17:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLsC-0002V0-PK; Tue, 06 May 2025 17:14:28 +0000
Received: by outflank-mailman (input) for mailman id 977844;
 Tue, 06 May 2025 17:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEbg=XW=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uCLsB-0002Tg-PV
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 17:14:27 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ebf9602-2a9d-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 19:14:25 +0200 (CEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-30820167b47so101587a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 10:14:25 -0700 (PDT)
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
X-Inumbo-ID: 8ebf9602-2a9d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746551663; x=1747156463; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOC5OeBMf7pOLob0OlXd7UldqLr5KECMJZ9sNcHSx0M=;
        b=JQo+SknOpGjaZFywK70s+P1pY12RcQPtTqMPwLr2/jP4Oflq6qgXPqnM4gX8nkGihN
         WAP4w9k5onU0kmXlqIU1F8/M66tydZGuqld3/Q2DVWLsDMhS+mITwOttkmm3kk00Wh7o
         9Y/Pd6zeGRIKcHL2iPmXiz2ZuRHqLIx2XLISw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551663; x=1747156463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOC5OeBMf7pOLob0OlXd7UldqLr5KECMJZ9sNcHSx0M=;
        b=wv4RCC9IWefiQc4CwP0MzxxFR+x91hu64+BlZ1PTj6Gh/9I9xBFn9FAuxLQCE4PTbG
         F7bt3UfdAWV5N7Uz2CsLsjJUnRczFJnbg/RcSUG4ES2R1AMaIBRdeLnZAone3hyn+5Tq
         s9EhWpNHI+xzt3tR2SJfsNz6qet5ZS8sQtGy2NyvS0YeOYzhcr6xvu9W7fTrIk+sR9+e
         VaVA3VWqi/ca7TBIOhLFPfwrjiAyzgWnLasQymFcjq2Swn6rlE/nEwX95Dv1RSHp7u+d
         prh9hLh/rztFB5o74pog2m/0t02jv8zKn96vUpSQ34pdL6tBTPgjeuVRPNbARhtOEl9s
         EoUQ==
X-Gm-Message-State: AOJu0YwkGyPSCvVpIq2ev62L/BUKcj+Gk+RxIMDvhOPg6sGAWZDg/n2D
	/UtIjAZBvj/sEnavFRmwPeiTnfImu3YSmnZ3e/vmwKlQl+gAZWXsRywzRDmHLdzR6oEFsKRhxQZ
	3cApKdZyHgKRoeVySa9oO4GkHFfxcYEkVR8wEejns1HPkdmIZJKM=
X-Gm-Gg: ASbGncv15Gd1p3l4m+hWGQk5tQ8fHsE+572e4Mzau5Wf+9T1ejbT30GvmyOZnpsaR9K
	Ir5wS+T2A+S30phpgcIhjEK2VGrLTbA4xGMU8BtMdKfqvcP2UM1TY8mAogZ4IfywC/TeH+uhztO
	rkjjBfmcpLDnC8BgoMZWnQ
X-Google-Smtp-Source: AGHT+IHF4sDTqGWBG9rJQ26zlW4WZMGnk2VmRKuDHRiAnPOphDKjLiVS3faXDgu7Y5YsrQIenFRbI1PR7LyW5HvDBLQ=
X-Received: by 2002:a17:90b:554e:b0:2fa:2133:bc87 with SMTP id
 98e67ed59e1d1-30aa87b408bmr828030a91.6.1746551663490; Tue, 06 May 2025
 10:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250506162510.1676425-1-kevin.lampis@cloud.com> <c853b996-76ea-405c-aee0-b4a26dc149fa@vates.tech>
In-Reply-To: <c853b996-76ea-405c-aee0-b4a26dc149fa@vates.tech>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Tue, 6 May 2025 18:13:59 +0100
X-Gm-Features: ATxdqUHvDCDtD4TRpnRd-qY0jiBiVDDTOTS4VVo9-3muFxug0JGr6uq-Pfk030o
Message-ID: <CAHaoHxa2znWNSPson78rs_Uh1Xd880HgHrhJFafbnhafxegp-Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] Add lockdown mode
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 5:49=E2=80=AFPM Teddy Astie <teddy.astie@vates.tech>=
 wrote:
> (I can't find the PATCH 4/4)

I apologize. The missing patch will be posted as soon as we can.

> I am not convinced of the efficiency of being able to toggle lockdown
> (including disabling it) mode from command-line.

As you say a malicious userland could hijack the xen command-line arguments=
.
Patch 4 is about ignoring potentially dangerous command line arguments
when lockdown mode is enabled.
It is not about disabling lockdown mode itself. Sorry if the
description was confusing.

>Do we consider Dom0 kernel-space as well (thus Dom0 as a whole)

Dom0 kernel is part of the trusted computing base for Secure Boot so
we don't need to worry about that.

>what about privcmd device (which can issue hypercalls) ?

We do have a solution for securing hypercalls but I believe it will be
part of another patch series.

