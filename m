Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8070E287F65
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 02:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4671.12351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQg13-0004sb-7Y; Fri, 09 Oct 2020 00:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4671.12351; Fri, 09 Oct 2020 00:12:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQg13-0004sC-4M; Fri, 09 Oct 2020 00:12:09 +0000
Received: by outflank-mailman (input) for mailman id 4671;
 Fri, 09 Oct 2020 00:12:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fkdD=DQ=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1kQg11-0004s7-U7
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 00:12:08 +0000
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dbd2706-d179-4524-b125-ee5550b06ab2;
 Fri, 09 Oct 2020 00:12:07 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m9so6648656qth.7
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 17:12:07 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fkdD=DQ=zededa.com=roman@srs-us1.protection.inumbo.net>)
	id 1kQg11-0004s7-U7
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 00:12:08 +0000
X-Inumbo-ID: 0dbd2706-d179-4524-b125-ee5550b06ab2
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0dbd2706-d179-4524-b125-ee5550b06ab2;
	Fri, 09 Oct 2020 00:12:07 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m9so6648656qth.7
        for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 17:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HHRiFQ4uAxyxJTCGNYZBIb0TKAWtUin/2niu/YgVXnQ=;
        b=HUdtsfdvPBlhhc7EQpsjwxX5Hc9V+glCtpfeETSf3Euf8qWuALlXAx1hlvSOB7d33c
         E19ycS1uZr0UDRa2EZK9fJXmiavRsLkUqzvQ/QbEwh9CrcJWNlUO28lbyBTPJlRz3Pj1
         f2uVTgg1j+n4kGun4MPofHtXDzbV2mdQxBFSjwOAXLoTkW59IQkdoMp36a/4pmAQBQt3
         uf0SnY3rbGQR+SBbrMHnyATUY0NQvW2a9L83lazNlCBofJBiNgC0gR5zlb7IM3cNd2Ah
         DuxyTAB8D0O8UYhsac1yxlWUyIWVdFCZWrAecLt22ItOhUfBeGml+ed5ukDGc3RzHr0F
         oDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HHRiFQ4uAxyxJTCGNYZBIb0TKAWtUin/2niu/YgVXnQ=;
        b=M4r9sz7S9qqjkTKRdmkZcqQpVrbzZ3lwCk2RUgxTAzdSpzGEYT9bJyEl+nhwqhh5va
         M1HUxmPG3qRsj9ktAR4bbaAj31ZclRWlNxFF1x85tG9Zu/rJ8vH8PgVmcFss3TyXLSHN
         b1RscauyiGPNrC4+6hbp02WYxr3JQSt0Q4yO1ogRlGwT+Rhlfik8Wej5aPDlXNqJvAYq
         pEkQS5uKJuekq3tX3g5MzcFXA1mPCHlOxyq8XaGbOrTimuk7lPMXJraxAwsH4QscqLct
         1fKAdlxzrDeSLX/R3XKkNgBIvzUWGqszDqVJm+yZbTYMYfwXFvWOMjMlVSEGps8scpuS
         qKpw==
X-Gm-Message-State: AOAM5309uptlHZcsus/NUsfTrOv2FXkuRkXVIvbgP7GvgQWxQdRNoZ3e
	P1rkiWeNjb1WK9VR+XwHkfEyJomUb+76viqgOO9fVg==
X-Google-Smtp-Source: ABdhPJw8kncMGVqev5RvUyGx/Jx2ui4Z9cK7wL1d3QzYyToBWwwlvOy9Yq/L8YICpUEv72KeZQowOV5pFzjESf/w5NQ=
X-Received: by 2002:ac8:b83:: with SMTP id h3mr10964807qti.113.1602202326731;
 Thu, 08 Oct 2020 17:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201007223813.1638-1-sstabellini@kernel.org> <1A694341-33AC-41E1-B216-2D3E1A6C45B4@arm.com>
In-Reply-To: <1A694341-33AC-41E1-B216-2D3E1A6C45B4@arm.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 8 Oct 2020 17:11:55 -0700
Message-ID: <CAMmSBy8wxneKDk01HRCZxHR-58R8v6Kp1-5TA28iQgM4OG56Wg@mail.gmail.com>
Subject: Re: [PATCH v3] xen/rpi4: implement watchdog-based reset
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
	"open list:X86" <xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2020 at 12:58 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> > On 7 Oct 2020, at 23:38, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >
> > The preferred method to reboot RPi4 is PSCI. If it is not available,
> > touching the watchdog is required to be able to reboot the board.
> >
> > The implementation is based on
> > drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux v5.9-rc7.
> >
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Acked-by: Julien Grall <jgrall@amazon.com>
>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

FWIW:

Tested-by: Roman Shaposhnik <roman@zededa.com>

Great to see it being merged -- one less custom patch for us to carry in EVE.

Thanks,
Roman.

