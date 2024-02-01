Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96101845DD8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 17:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674557.1049583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaLU-0003Tc-1i; Thu, 01 Feb 2024 16:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674557.1049583; Thu, 01 Feb 2024 16:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaLT-0003RB-VI; Thu, 01 Feb 2024 16:55:23 +0000
Received: by outflank-mailman (input) for mailman id 674557;
 Thu, 01 Feb 2024 16:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNcs=JK=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rVaLS-0003R5-G8
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 16:55:22 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aefe8879-c122-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 17:55:20 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cf1288097aso15575301fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 08:55:20 -0800 (PST)
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
X-Inumbo-ID: aefe8879-c122-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706806520; x=1707411320; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBRoiFhzBwl5VFAP4C+wSNH9W94y9ZIzJo2QLJgsqTM=;
        b=acovdA5UYl4Y7QJUzxQiTAjAWKSE0+ZCpH8ElH6jluz6jwtPOwvKD1Cmeufg48qqHF
         1G1Coz7v58k/sVHmqPLOgZmvRi0PTKGDlI+Arzwx+RJ1ao+wvllsMmiMcBizI36yrb2o
         0kCWG5UbFrrODDID7h0ulWWJHCIcsYrgXsOB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706806520; x=1707411320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBRoiFhzBwl5VFAP4C+wSNH9W94y9ZIzJo2QLJgsqTM=;
        b=XmtKB6yrP6chDq1twnJ7niwk2pjhMojicbD5bQk/SVAKX27fmEk6/NLVAD8wxcjFNc
         SbiHIRb9fY7/lpVtq43DJI4PrQreq4om/Ms5KCxHfHkIcskdxHYT6bvQ6hlKd8myOABF
         DF3wQFtt6cyRqFqi+uFD6n8JK/6B3EVfi+sJvnlYA4N+9mllnNGUbD/4Xa4lENX1iUUZ
         af7nvVdDyHBofJ11LpgdOkUe4nK+/e7fxrPAi87+efoaw88HmiQV58IQblHLZy5yVmr2
         e6suKcvGSg/Baj0NK1cmbHdmQ6ysrnNKncO3pkoRcF2f0hXIWdVS7fEWiAWA/Q695A+E
         r4kg==
X-Gm-Message-State: AOJu0YyCbm0XJRcZQLKs76MVsc3mMlvJqQpYY/b9noQDTzGg2KIyy0g0
	FCGk6QZU/zvV+X5hizorGMPfsuTOESa+Z3mfdjQBgmo2CLwK38/1aj4Byj6X4/LJP0Q/N9f/7WX
	ohSPEQJbzUWvLqB9efZwgDs690H5aYKgSuxOSkw==
X-Google-Smtp-Source: AGHT+IFMO8fChOZ+UHjzvt1AawyangJW+kQdJkUS6kcWOuEeYgsZ8hD7DskmrNqhrWCEIJFKNgf1UYcIsGa+df8Rytk=
X-Received: by 2002:a2e:b0f7:0:b0:2d0:7dab:d45e with SMTP id
 h23-20020a2eb0f7000000b002d07dabd45emr959137ljl.9.1706806519868; Thu, 01 Feb
 2024 08:55:19 -0800 (PST)
MIME-Version: 1.0
References: <aea51d2e-5da8-4da8-954f-2ee2a43be73e@vates.tech> <1be8f6f1-f977-4743-bd26-362ada960dc6@vates.tech>
In-Reply-To: <1be8f6f1-f977-4743-bd26-362ada960dc6@vates.tech>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 1 Feb 2024 16:55:08 +0000
Message-ID: <CA+zSX=Yu_Epi6fge71iQNkecYOn92XO4KzwRtQNfrchtMaCxzw@mail.gmail.com>
Subject: Re: Next steps for Rust guest agent
To: Yann Dirson <yann.dirson@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Lunfan Zhang <Lunfan.Zhang@citrix.com>, Xihuan Yang <xihuan.yang@citrix.com>, 
	dpsmith@apertussolutions.com, marmarek@invisiblethingslab.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 12:27=E2=80=AFPM Yann Dirson <yann.dirson@vates.tec=
h> wrote:
> > - what should be the criteria to advertise it as official Xenproject
> > guest agent ?
>
> What do people think here?

As we discussed at the community call, I think that we should
basically set a date at which we consider this the official Xen
Project guest agent.  Anyone who wants to have input can give it
before then.  Then once you guys think it's ready, we can start to
"market" it to the distros.

Shall we say 29 February, 8 weeks from now?

 -George

