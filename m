Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA66E0EB8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520758.808719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmx4T-0000NZ-Pw; Thu, 13 Apr 2023 13:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520758.808719; Thu, 13 Apr 2023 13:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmx4T-0000KR-N2; Thu, 13 Apr 2023 13:33:05 +0000
Received: by outflank-mailman (input) for mailman id 520758;
 Thu, 13 Apr 2023 13:33:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmx4S-0000KH-9R
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:33:04 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b719632f-d9ff-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 15:33:03 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso14767826wmq.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 06:33:03 -0700 (PDT)
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
X-Inumbo-ID: b719632f-d9ff-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681392782; x=1683984782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4K1UoNLB5Wh1WQWKgQkyNekfW4Vh91Orm3gyoXK+OJI=;
        b=hTXsYSWz5Dn9kvDBeZ0XboBhjt7uqGu2jk483osiWXjOtVRqk/5dT+U1eS71bIcjR0
         UMlJQ8B1GlyFrqpDr4NUdHNiBV65MYiwnS9rO941CfebCd+NZDyWSM+WOg/nC41xynmW
         +fpE/uitj2GPKKMpUYW8Q1ZIOgHb9fTOK4XdZsYLHBzx5+DBwCOKx5ZxMQEbqE+b+rwU
         MFFBOjg38BdJ8a+XiTIg1xp9euR1wXMFUGc1hWsjNOGTiN7Xg7eIMe1lEkhLCW2sP25E
         E1AnGys5R7T/C1n5V+WXMNhe1zk5yd7KSezlWrEHGl+e1jV9MAqllKNIzTIyP1XF6EFa
         6Ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681392782; x=1683984782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4K1UoNLB5Wh1WQWKgQkyNekfW4Vh91Orm3gyoXK+OJI=;
        b=Hj40aOlhZ6I/qZSNDVjGYZrTdA694MwhaGH9zfUjwH82M8W+k69QJk5K2aNTBoeV8J
         RNAoeyv6zTWhEKNCVoHuJDrOHvWyq5je9DBuDygrjkuY0OSCKNRqxErhZ/cSmcCTppTn
         vWRYDKwhptCx9zp23I7bp0OdkZuf4Jh4/keZpazmq6BMAx1MqQBTGyig5Xfjuaq6Ynm/
         UI1KeTSIaxg7M1wOZABJgJ+u9uFoZ3Bkzt27pDlIOiDAa3AL4/1yIuGkyIkV3W6YtX6K
         sQhJ/3dIfVL2Wbha5hY4PVc8wtwZRnNQb3nYy2Hubjr1H0vmQ9Mndh6S6XgdizNUpIx9
         ps0Q==
X-Gm-Message-State: AAQBX9cuAXA2cLq40p5Q4hGFxxLD10RQDkeZcmfOyKkrnhV7zYyXgTTz
	W49xAzKk2tW/AkwahpRVaTjqj8KWDcvMlKpoqiUi0Q==
X-Google-Smtp-Source: AKy350Yj2W0pP0IaXaltscmIrZBLEU5xTRF8xqKcfSByIv/x+OFAODxCo8j1+sHOjWAx5c4VWIs382d/bMIGCD9Dijs=
X-Received: by 2002:a1c:f302:0:b0:3df:97de:8bab with SMTP id
 q2-20020a1cf302000000b003df97de8babmr574193wmq.4.1681392782610; Thu, 13 Apr
 2023 06:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-5-jens.wiklander@linaro.org> <AS8PR08MB7991150DD65CAB61C276A21892989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB7991150DD65CAB61C276A21892989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Apr 2023 15:32:51 +0200
Message-ID: <CAHUa44HWND3BHE8X2_iYcEyXH6mOcv-WwCFXizxZijD8g3y62Q@mail.gmail.com>
Subject: Re: [XEN PATCH v8 04/22] xen/arm: ffa: add remaining SMC function IDs
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 12:18=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wr=
ote:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 04/22] xen/arm: ffa: add remaining SMC function =
IDs
> >
> > Adds the remaining SMC function IDs from FF-A 1.1 specification.
>
> Nit: I would suggest that in commit message you can mention the documenta=
tion
> number you used. During my review of this patch I am using
> DEN0077A version 1.1 REL0.

OK, I'll add that.

>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> I also confirm that the macro values introduced by this patch is consiste=
nt with
> the spec in commit message, hence:
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Thanks,
Jens

>
> Kind regards,
> Henry

