Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1568088FD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 14:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649861.1014888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEFk-0005az-8B; Thu, 07 Dec 2023 13:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649861.1014888; Thu, 07 Dec 2023 13:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEFk-0005Y8-4h; Thu, 07 Dec 2023 13:17:20 +0000
Received: by outflank-mailman (input) for mailman id 649861;
 Thu, 07 Dec 2023 13:17:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qi5/=HS=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rBEFi-0005VT-4n
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 13:17:18 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0f7a799-9502-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 14:17:16 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54cae99a48aso1981984a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 05:17:16 -0800 (PST)
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
X-Inumbo-ID: f0f7a799-9502-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701955035; x=1702559835; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqmhgQ6IUlZJ82gSiojTSv2+yYvRh+WxRcfBls1+Bjw=;
        b=Jb993qIy/J/EnEtqx+sJ9trR41o0YObLExIi01uWSXKkClVt3CTmJ2Nxz5p2YSyhmt
         /9paifk+wK4vhEvKV6iYlvEo/AweuPbEWYulGNhfbQTdphL4YOY6av/v7fGsbpbIDmUs
         i5PTzF/wfy+R6JKpuHqKT6519+IR0P3o72MpT3aUvTuAgW9+a801SvBGKLlYpl8O0pb0
         YbwxwQ12yk/I9QViv6R0qEkSD04qdSrOQOPpEkvmmhhqdoAMTpf+Kzz1s8SsqBElYWW7
         Vkx6nwhB0cALn90Sv39SrE1oPbeV2BpwGBloZWZHIHcm0iuJVo2paz7440CugbF6drC3
         zSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701955035; x=1702559835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqmhgQ6IUlZJ82gSiojTSv2+yYvRh+WxRcfBls1+Bjw=;
        b=rQmepJsNFNeShgL/5ts37DMSQeAqxmQXqSxoxsvmOI/Da/Cxu8oF3pmgNrcIq5R70+
         BnKtzy0g7QXXbA3bHTkpmyWmC7HrrRENCkbsFOKtKnSBI2uzLces7Vnf9223oXZpNZQ5
         VM/zYcz2a7aaATP3gElu6pExSiXZfvu8zZVv8dN0JGpKPhhm88Cc3f6B3gZXG8/f76k1
         ju1fsyrwkuaYw9QYv1d1zQcGNV+39x/W1AsbZvd6tTu+GbCalC2aic7g2X/b/VLZ6nau
         fF9nXxERFZRI/hnfqXNPluyMxER443IziNzBqlrLBvgmmjpoURYEFN4H8xbSjHDCYcoL
         O7OQ==
X-Gm-Message-State: AOJu0YyKcGpwTl5KTsAApS/TnmnQ8M+vSCtUcZc9G95utiaVOCPpibyj
	nJufhkRafKSJiktNluXHVkEvF5JEdqfB0R+P8X1yMKYY
X-Google-Smtp-Source: AGHT+IE7ueSYllPm62fE6z8gKqOv9MWgdEDXYYPgJ9NeRnsCFglZWYO5lBA+K6hkzXVyZa+VrLNceCbb4GBanQLuMV4=
X-Received: by 2002:a50:8dcb:0:b0:54d:8d00:de34 with SMTP id
 s11-20020a508dcb000000b0054d8d00de34mr2587026edh.6.1701955035456; Thu, 07 Dec
 2023 05:17:15 -0800 (PST)
MIME-Version: 1.0
References: <20231207062551.19825-1-jgross@suse.com>
In-Reply-To: <20231207062551.19825-1-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 7 Dec 2023 08:17:03 -0500
Message-ID: <CAKf6xpt7RSpsR3eFXqSJX-XJeEBZAv6MFTrK67QTpDy+s-=Byg@mail.gmail.com>
Subject: Re: [PATCH v2] tools/libs/evtchn: replace assert()s in stubdom with
 proper locking
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 1:26=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> In tools/libs/evtchn/minios.c there are assert()s for the current
> thread being the main thread when binding an event channel.
>
> As Mini-OS is supporting multiple threads, there is no real reason
> why the binding shouldn't be allowed to happen in any other thread.
>
> Drop the assert()s and replace them with proper locking of the
> port_list.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thank you for doing this.

-Jason

