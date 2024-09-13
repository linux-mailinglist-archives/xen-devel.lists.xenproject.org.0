Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD8A9782DF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 16:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798255.1208408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7Z8-0004Uo-PW; Fri, 13 Sep 2024 14:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798255.1208408; Fri, 13 Sep 2024 14:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7Z8-0004Rg-MF; Fri, 13 Sep 2024 14:46:30 +0000
Received: by outflank-mailman (input) for mailman id 798255;
 Fri, 13 Sep 2024 14:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSyI=QL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sp7Z8-0004QK-1d
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 14:46:30 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f50d06df-71de-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 16:46:28 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-535694d67eeso2228943e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 07:46:28 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f9040f2sm2317539e87.233.2024.09.13.07.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 07:46:26 -0700 (PDT)
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
X-Inumbo-ID: f50d06df-71de-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726238787; x=1726843587; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QHxsATWMIgZrsrvJyxdQKXlkWwIyIl5WCejtBquQ5+I=;
        b=ne1W2ddswI8pPq2PIYueTlvYMhzq3FXOsqEOZ9+b2hN2RQT4okDkUAYgOKzvHOHNiR
         akMvOylOoYKTOzal99u9BCpHYFNardx8GAfmfwqklTm0eJdXZdRZeSrf/bZl553tacWY
         RIYSy08xvh9CiMtGlPMaTqwQVyiO3gfYjBFYsyHiNLzn7ZZa6bROmonGnn+xP+Jr2p6j
         eFqHDEqEL9PUViCw0LYqzKrO5AgmItLSczIaWekbVOFYEagUSaocF74l8XwqfWBIb8bl
         MVP3CQcRB1Gn7nEoEXfPGziPOng3+bK9X8A2GOgjA091X8L7WHsT8yl4N3ezNhWkJBIn
         XJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726238787; x=1726843587;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QHxsATWMIgZrsrvJyxdQKXlkWwIyIl5WCejtBquQ5+I=;
        b=MG9wsNZtm4Ifcfq3Brbysdhz7PnP58DUvcU04x8DzM3ZnT2TmlNQnanJMl/0vPoKfH
         0JJrNMoNjuLFBBpoz9pD5HODr0V1lRcqwuZmrKgW0yHgXF8nyX2Tle+ZSGeTQAxwir45
         t6MPFb0M+FPcybCNwtAZDxZuz9Mprw7csW9vhUhEgpVhD6NdanMkRT9OEuUwMJ8SRr1C
         IFpsyD6wwexz89G8Rxg5l1Ah/LnU+KJKmUGtAE1Y0NWA+lP0MD9rPlx1boYFCeXqn4pc
         LmyMDra9G1B22dwIV3u1Xy6ALopGeymR7355eYr1S3t6ljWNJEYymIyDg+6BbvaQWpBf
         7hyw==
X-Forwarded-Encrypted: i=1; AJvYcCXax6q82NPqbn87H88bgUdatsSXVzWn+3fghiItya+qmi61BNGd1Cc66++KL+d6Vm/W8TIo1ciIF/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySpwkI4bcr1s7B3d+9/bsW/tLEtOkScvsAOdPV/7KRl2cOUv+V
	JsRIPDXdD77eCdKaCll80NFlvxpDJrw4fLybYOw88doTM3UQUQrR
X-Google-Smtp-Source: AGHT+IHLa3LOpQjrhowOhnC9C6dtaBtMqjJJPr+EQqhWvwDE9d3EVi1bS4/TpNB1EIrGn8xVvcgYjQ==
X-Received: by 2002:a05:6512:2207:b0:533:415e:cd9a with SMTP id 2adb3069b0e04-5367909dd1dmr2373189e87.23.1726238786614;
        Fri, 13 Sep 2024 07:46:26 -0700 (PDT)
Message-ID: <5ddab08fffac7f14dc474720e0530053780fdce1.camel@gmail.com>
Subject: Re: [PATCH v1 2/3] xen/riscv: add section for device information in
 linker script
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 13 Sep 2024 16:46:25 +0200
In-Reply-To: <57de5f57-9de8-4b06-a1c6-d4da6e9c6735@suse.com>
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
	 <e0d5d5505c89a81997240a4099090c96d37c1bee.1726048521.git.oleksii.kurochko@gmail.com>
	 <57de5f57-9de8-4b06-a1c6-d4da6e9c6735@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-09-12 at 17:31 +0200, Jan Beulich wrote:
> On 11.09.2024 12:04, Oleksii Kurochko wrote:
> > Introduce a new `.dev.info` section in the RISC-V linker script to
> > handle device-specific information.
> > This section is aligned to `POINTER_ALIGN`, with `_sdevice` and
> > `_edevice`
> > marking the start and end of the section, respectively.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> This (and patch 1) is okay in principle, provided the description
> actually
> also says "why", not just "what". Placing past .bss is questionable,
> though.
>=20
> Overall, however, this probably could do with abstracting by a macro
> in
> xen/xen.lds.h, then also to be used by Arm.
It make sense. Thanks. I will add the macro in the next patch version.

Thanks.

~ Oleksii

