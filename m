Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95270763D46
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570629.892584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi0d-0004TR-Hp; Wed, 26 Jul 2023 17:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570629.892584; Wed, 26 Jul 2023 17:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi0d-0004Qd-EY; Wed, 26 Jul 2023 17:09:11 +0000
Received: by outflank-mailman (input) for mailman id 570629;
 Wed, 26 Jul 2023 17:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi0c-0004QX-Dc
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:09:10 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22a5e896-2bd7-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 19:09:09 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5221e487e08so18423a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:09:09 -0700 (PDT)
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
X-Inumbo-ID: 22a5e896-2bd7-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391349; x=1690996149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuQFtCmaQChQNFDM3bDswWPcQ+lWFT/tUMMXj0Sc1KE=;
        b=fiuQnsOawlHOw2pSThp6YlE6UsyZk2KbDF3i+avo/wP6nxNCMJhHhTyGwZa5xY91uo
         QQPBvkN4IVTOR190yntnB0FJOSaq78FWscPa3v4vRoo8FlK19uisze8XKWJsRhb5R48G
         BQJjgo5zl4w+hVmtsQOOrSrWIgjmfcqJh39mNi/p34ugWOEJQ6jro5qrL+uOJgfOSFzp
         D+ehaNs4amolwBuOAWDybD8GsPb+5VxKOy8dxWrYuKYEmOvfWkq1u0CIQewAW3zMXhVA
         /QyWOXRS0ahSMFLwAW+M3/aXQl1fQ0NZvqqumo5hPmC1JJnj2NRbXXuryrA33ZeIgC5/
         r6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391349; x=1690996149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuQFtCmaQChQNFDM3bDswWPcQ+lWFT/tUMMXj0Sc1KE=;
        b=JASu9iE89W/TrOTHnl8o/e8b8UOl+9xmdzQePjoZseqNq6NdptIySf0gPK1NCsP72h
         LAaq3+nkLaDG6FW/dGgjk6Ni0YbseTd5NcJ/cTvhXvzQPOgpZna1Qe+cVenVabzw/DqR
         uYcQ5vYUTq3J0Le/SqTMA1Vr51bCZEUwxByNwO/dEoE1c1ISRh3BWlqGcKPmakUQFBKw
         7h9SUnaWRhWRSMJS9AbMbsarOZqKOYIJNTL5nVSDHRxZddv6xaVus5vhE6uCFB2bj+3O
         VTtFIir8TTC5n2MJTHDOVHquvpaJS7RbkeO4EmrLLnRmrRw6Jru8NW/2XaJjCbS1Qgde
         vNpA==
X-Gm-Message-State: ABy/qLa7tqP9MHhCn9i/+xF/EqAlKyKiB09uALyZMAeHEn1JLbUOYuHC
	6b28HmPdPKujcq5wrBdE4KGXfwnxQ+mH8sGl6pg=
X-Google-Smtp-Source: APBJJlEG3m0KY4MBemSEXmIhF6/eZDFud60v3YH4tIuTuS5NxQjiqE1UK+TieeN9I4gdghGqGWPD2XkgDWfiUkSr8KA=
X-Received: by 2002:a05:6402:1847:b0:522:29c9:d30 with SMTP id
 v7-20020a056402184700b0052229c90d30mr2289484edy.10.1690391348886; Wed, 26 Jul
 2023 10:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230724125857.11133-1-jandryuk@gmail.com> <20230724125857.11133-7-jandryuk@gmail.com>
 <7636d3d2-c78d-711a-ed90-aedd1b464c6c@suse.com> <CAKf6xpt1LzKMv7E-G3sTpUWrEApy+BX8z7dG69oS1upHcpytMg@mail.gmail.com>
 <d3d8123e-2b81-d3e0-3883-83dcdaf99700@suse.com> <CAKf6xpsE_=XYWcC8Q6NhKkboMajnOKZAsfUpOROeGuhU+7CTdw@mail.gmail.com>
 <3f43f36d-b661-ea65-e8de-d1c4fba34509@suse.com>
In-Reply-To: <3f43f36d-b661-ea65-e8de-d1c4fba34509@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 Jul 2023 13:08:57 -0400
Message-ID: <CAKf6xpuMwHff_SRHfeX7xTt+HPDS9tkO9ab-h=jfyp9F09U2LA@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 10:37=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 25.07.2023 15:26, Jason Andryuk wrote:

> >     #define hwp_err(cpu, fmt, args...) \
> >         printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, args)
>
> ..., just that you're missing the ##:
>
>     #define hwp_err(cpu, fmt, args...) \
>         printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ## args)

Thanks.  I thought I was trying to avoid the use of "##", which sent
me off in the wrong direction.

Regards,
Jason

