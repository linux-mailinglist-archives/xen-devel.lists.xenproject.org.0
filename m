Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE1C68E31
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 11:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164593.1491518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLJCC-00036v-QQ; Tue, 18 Nov 2025 10:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164593.1491518; Tue, 18 Nov 2025 10:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLJCC-00034b-NK; Tue, 18 Nov 2025 10:44:24 +0000
Received: by outflank-mailman (input) for mailman id 1164593;
 Tue, 18 Nov 2025 10:44:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGil=52=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vLJCB-00034V-Ps
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 10:44:23 +0000
Received: from mail-yx1-xb129.google.com (mail-yx1-xb129.google.com
 [2607:f8b0:4864:20::b129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88924a8e-c46b-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 11:44:18 +0100 (CET)
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-640e065991dso4810029d50.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 02:44:18 -0800 (PST)
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
X-Inumbo-ID: 88924a8e-c46b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763462657; x=1764067457; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mz8ybMx7hDWYwBCrXoytwSB/9UsW/C9AlXT+Uj0KnbQ=;
        b=jdM6fINm8MpFfExU4Y+nIQ4USgXbEUferxCohnRzOKlv8Fm2pjsvhvNhVZcuQU3iQa
         3bJiz3JJ39F0Jg5G22MAVbP1us83X3bUM7o3Xhjow0xNJiVF+tPeAuR8lZRvV/fhCv+7
         5WcoE8x2y5aLRUQpq7SZ3ttcaUMn+QQjQdrU4OpCW6tMhICmRiYNFXC9+Go1gu56iDT0
         opuaLzZdxpZfahGp/AlCsbO2PAgR5LQpn1Y3uuK44rKcf3CCi6vIxYzWUiVuO+sBH/dq
         3NBH27z6ii+0rAn2Qo+i8LLEbIShhSBqx15NzIhGBYRVgiPfFWrZ3b7SFxmCpt9K0Pvw
         wuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462657; x=1764067457;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mz8ybMx7hDWYwBCrXoytwSB/9UsW/C9AlXT+Uj0KnbQ=;
        b=K3ehXeth1uCKulK9Vtl11STtoK9vXNasHJD52zus7AZBPB4j4MmiFrhpAKjlV4O+1O
         wu1U2ot9vWfFtnyvLdkN4LQGUa2eEHM9ZNINq/Fuqn6NNqMy8Ph/7WDJwmPvzmNWx8AJ
         0usbri7pQylse5oXGfmqFXqwhnMVh7VJjM4MVvy8saQmj/uhkCu6Z8oJNJdNt5DFqUCp
         02WR2uwOhAS5I1AwMEE4kDvrM7BtZMldm8zteNbwd758VapCitlOY1kVE5uAAyuwa+1G
         j+RPXNYR34jfvDjU4+SvIPyvI1SbnynNT67AQXv/z9rDO5F0BEF/SvRIAB0IuVXYjfeK
         +pYQ==
X-Gm-Message-State: AOJu0YyAAYRagNxWNXy1Zd1mTVte7Xk1zngcaeyK9o9m492K8EGdczLj
	kdOiqBvQn9SE+zDvqTejjglBYXicPRjxLmFxDvKp8VjJ5xd0+vCwuNlcYXsb3IXUY7/WUlZF/RS
	cT+uLwWVdXCvaXAInVxEfXsENzpI9MJDN/ksz
X-Gm-Gg: ASbGnctXZYxSbUAqXAvYFufgD3ED2+byxRgZqq0aVqKBvRgXplOXhIDsbEbxYsRoTmG
	kThHjsH/GNZ3Y7Jn1GTd7ozkh37hs55M1RF7+1v7mae9+74ARuNVbZhU/97QHIOozgjsJuT2TpW
	RzsfYFaWCMA+sYAD7hYpmFcUPR8UjVcbvC1BgzZJUFL7orSh96hKYr1zFgh6qK+VREHZ0snaC2c
	babXUWcaVQfWn6yIAEBg+T16gwclk9yuBmOeolK0SC1wYYqWr4qI+GUvWQZlAiqzANDPbM=
X-Google-Smtp-Source: AGHT+IGQOnybtDWPwHbD6wAQpklliqZ9jCdSSduqW83IcY78AzA/+5CGKQ0XueyvXFxrWhmxaHTz2sB+TAkTGNLmtXY=
X-Received: by 2002:a05:690e:250e:20b0:640:d303:3522 with SMTP id
 956f58d0204a3-641e755578cmr11731565d50.7.1763462657242; Tue, 18 Nov 2025
 02:44:17 -0800 (PST)
MIME-Version: 1.0
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 18 Nov 2025 10:44:06 +0000
X-Gm-Features: AWmQ_bnIll_Vij3Ua-vaVSyUjAUYbxGd4Y_iThT8iwNEXl4hlAPP3ddWilUMHKM
Message-ID: <CAHt6W4ejPT-A7bGfrZGW-8zEBxmQ__LVa91GRcXhYZO_3C1meg@mail.gmail.com>
Subject: RE: [PATCH livepatch-build-tools v2] Treat constant sections as
 string sections
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"

> > Newer compiler can put some constant strings inside constant
> > sections (.rodata.cstXX) instead of string sections (.rodata.str1.XX).
> > This causes the produced live patch to not apply when such
> > strings are produced.
> > So treat the constant sections as string ones.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> Thanks,
> Ross

Hi,
  any update on this change? Could it be merged?

Regards,
   Frediano

