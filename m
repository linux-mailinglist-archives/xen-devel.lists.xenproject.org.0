Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081CB6BCF90
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510563.788420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmoR-0001el-Vz; Thu, 16 Mar 2023 12:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510563.788420; Thu, 16 Mar 2023 12:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmoR-0001cV-Sv; Thu, 16 Mar 2023 12:34:31 +0000
Received: by outflank-mailman (input) for mailman id 510563;
 Thu, 16 Mar 2023 12:34:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zc16=7I=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pcmoQ-0001cC-Od
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:34:30 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e58b021a-c3f6-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 13:34:30 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id x13so7088580edd.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 05:34:30 -0700 (PDT)
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
X-Inumbo-ID: e58b021a-c3f6-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678970069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UV79hRGtfOqwdSblcZsDbNrI2TzOri+6dUST5JLaGQ=;
        b=fd0LC6MRkZTdMvmE0ZbPqmsdBHNYDykKutDmnpgJP02+1vmYtlF2k3nVYpAarxDIKq
         6xHOfV2VlkdyAIvjQmnLToG1gEoEzmG5+wJ9m+PxRkpbQLN8FsjriiOgSwurvwwEcVzI
         LxXSKnkO2WXz1AxygPvoAKqn5LdEN5bycXfae8JcFYv/h1vLgxvbh5EREu6zXxt6Cs8g
         bhGtuX6stJ6bYsy7bRZKsi6lo+UzLtMIB79c9OIgBj3VBoHNUN8pM9FbB5LsL+LG75Yg
         EUEWM8WHHSJKRYUhwloPL1Y+nygPLZQD6g7Tm3Dx5qKyvq12+uPZz/U0A3pfQw4r1bDG
         cr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678970069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UV79hRGtfOqwdSblcZsDbNrI2TzOri+6dUST5JLaGQ=;
        b=FaRt4Vz8V+ma0kj+nlHLI8WwX5Zn+NUc6M4TG8kULnNO/0qi0ncfkSvRH0KA+EFzWA
         VsvSdguzvDHE0mrgQHaQYgnQjHAsio+cErLX0ZqePaPIN0de3H8Fm4tOSXAax2nSwIAP
         5UQ3u4TwW67DTHVHwj3c5Z236gUH6Ir5aZMQd2V4szQxDZKsgZBW2RIqPckzZLq/qQ5r
         sCRKBrDNdiw46hhbjFeyIshVB3NRjiPvqartZulRUiA/A6HttHOdKK2lIspv/uvGebME
         xOTgLvsKMCe4t7yqkqh2a7qOrLP9otUvmNyPFnBF0TCdq/zOa0kdU1LKH1/6skOpvth0
         ezQw==
X-Gm-Message-State: AO0yUKUbTwp26o01av6MUa+mu40GpRF/1orRx7FMYwtLHxvn6E4RItbW
	lL9W+hpPrNwnKE4sEa+TMPeOaCPqVToASG1kEGo=
X-Google-Smtp-Source: AK7set+hWtlFoRi1kpMvgBPTZTOxdIaffCXd9SU6LO4F4eCr0PhtpCCZAFisvXjmNSG39Pz8McPo1IzJG9kl6HQpUnY=
X-Received: by 2002:a50:d08d:0:b0:4fb:80cf:898b with SMTP id
 v13-20020a50d08d000000b004fb80cf898bmr3349102edd.7.1678970069454; Thu, 16 Mar
 2023 05:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230306204024.124882-1-jandryuk@gmail.com> <d3da0ece-a65a-89f7-85ba-5de31472bdcc@suse.com>
In-Reply-To: <d3da0ece-a65a-89f7-85ba-5de31472bdcc@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 16 Mar 2023 08:34:17 -0400
Message-ID: <CAKf6xpv4byseyAqezUa++fV7XkAqwJowQ7JQhjX-fy-Ojix2bw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] libxl smbios support
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>, George Dunlap <george.dunlap@citrix.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 3:53=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
> Is this work something that's worth mentioning in CHANGELOG.md?

Sure, I'll add an entry.

Thanks,
Jason

