Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F281CCD5
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 17:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659652.1029353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGiJr-000063-HB; Fri, 22 Dec 2023 16:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659652.1029353; Fri, 22 Dec 2023 16:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGiJr-0008US-ED; Fri, 22 Dec 2023 16:24:15 +0000
Received: by outflank-mailman (input) for mailman id 659652;
 Fri, 22 Dec 2023 16:24:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGiJp-0008UM-U3
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 16:24:14 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a809909-a0e6-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 17:24:12 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e67e37661so1270625e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 08:24:12 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a195f0a000000b0050e70af4be0sm23791lfb.228.2023.12.22.08.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 08:24:11 -0800 (PST)
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
X-Inumbo-ID: 8a809909-a0e6-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703262252; x=1703867052; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9QV2S+vU9AAYaocuuXdKbDcmwWsr+yXKcseseABTN3Q=;
        b=INSyTXA4fxNSuYqOgUNr/+DBtJCIMcBS/J0Z/ZFTgvxno8Uh0XyhSjRapD9BpTSRYY
         keEhMv5C/Z5T9ikZl2MAtPm8noNXgbouBg4wv5ZDT8k1xF5ORyIFqxA/XdSE/jWNk0Fu
         AWjzxEARgNI71oFT7b/fHZZRQgCC8nbR42i4PW49Kkx6g8pTh56EqbW7lcNb7O5m88dR
         6TqW9flIwjLX1hZI1air+aX4cW/Bf0pjQG9IVToNknyroo+ScF14gBbH1ZjG/ibNK9f4
         8TAs6UhgidRqWFcxsbhE7aQszvzPu7yidI3oziSz38cruTWqWoEdVGaMjoLDEIykhAN0
         udxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703262252; x=1703867052;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9QV2S+vU9AAYaocuuXdKbDcmwWsr+yXKcseseABTN3Q=;
        b=VE4+sFV6BoaexN7cstxR6/a9ceVcdBzhW7rWS0B2Zz8i/AYPVTxiW3frvTZYJJUjNO
         5S5y5PWZT4LXjtgrOHg8yZk9C7EW716gEie+jE+KzPqlNcbOlewSoZTaYgGUOTKNjKrq
         tvPLKGhq9UxOpDI4cQHJ8ppUC8hXZ+JzKYoTrnXRP52hi2lI+z0EZmGuEkPcnUwD0yF2
         YXiW5G0w167j6PF0643xSXJLLgz3iqMB0TUN7sY/XRXjbCuAT+OVy1B7lJeVGzVyY7Za
         WrcTE0rCCyqCBJ+ezQPKZtXDcygI40jXuZ286uXii+TyNdFG8kUQkokEWyDp4G5r8Zu+
         TAcw==
X-Gm-Message-State: AOJu0YwnLkwaExk9OfVnvCgJd6p6fKlDhkUTmAotJYEDYly3qrwbgYHj
	iJvKrKbCIyjjhCm4wbOVvys=
X-Google-Smtp-Source: AGHT+IG/biM7M9Si1GoDPUhIU8WYMlA3YBQtfMq8kRAefM8ypXzsRGTy9ZBvjoNLQB+D/xaMdgzmkw==
X-Received: by 2002:a19:651e:0:b0:50e:38ed:f7af with SMTP id z30-20020a19651e000000b0050e38edf7afmr851864lfb.124.1703262251561;
        Fri, 22 Dec 2023 08:24:11 -0800 (PST)
Message-ID: <9f2ec5d4d0812ad1c13143550b54ea2f691bfbc1.camel@gmail.com>
Subject: Re: [PATCH v6 9/9] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, Jan
 Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
Date: Fri, 22 Dec 2023 18:24:10 +0200
In-Reply-To: <926a5c12-7f02-42ec-92a8-1c82d060c710@xen.org>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <55d6810e2f8b0f54261c504354bf879c5b887c40.1703072575.git.oleksii.kurochko@gmail.com>
	 <f41894c6-b061-4aef-9d4a-18effd917043@xen.org>
	 <4ce1258b22962f959abf2437d6427ec34d420023.camel@gmail.com>
	 <926a5c12-7f02-42ec-92a8-1c82d060c710@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

>=20
> > Generally,
> > I think it's okay not to use #ifdef DEVICE_PCI_HOSTBRIDGE to keep
> > the Arm code cleaner.
> >=20
> > Does it make sense?
>=20
> I don't quite understand your last sentence. Are you saying you would
> be=20
> ok to remove #ifdef CONFIG_HAS_PCI around DEVICE_PCI_HOSTBRIDGE?
Yes, that is what I meant.


~ Oleksii

