Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E282EC04
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 10:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667690.1039204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPg1Q-000402-KZ; Tue, 16 Jan 2024 09:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667690.1039204; Tue, 16 Jan 2024 09:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPg1Q-0003yB-Hv; Tue, 16 Jan 2024 09:46:16 +0000
Received: by outflank-mailman (input) for mailman id 667690;
 Tue, 16 Jan 2024 09:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvQ1=I2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPg1P-0003y3-KV
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 09:46:15 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16249e4e-b454-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 10:46:13 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50e80d14404so9180461e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 01:46:13 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2-20020ac24822000000b0050e7555d7a4sm1706202lft.6.2024.01.16.01.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 01:46:12 -0800 (PST)
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
X-Inumbo-ID: 16249e4e-b454-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705398373; x=1706003173; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P6mx/Gd+SFP6tPsyavF5dliAe0VRZv+bFCzrTourHb0=;
        b=TSxMCtwFH55R/Q3sFdFQwGDfsDCmykj7hsGsRQMFwbEReNsPITVarBlZR/CzuDfcF1
         i8lnFZz/1URBq/gA3WOfM4wfRxGWJ87A18fwNKHJ5kQh4LTcDsF7v+iIV/+WEASe6Owj
         /lHq2woQdlR9HD/xzpT1xo5dVRe4c+RJKSNE8cfB55gJZYdpL6wCLjKCmDHDtcr+vdsX
         d4JakUFqE/LCVe6Fl84oJoSv8ju1yY7BTuOdPvEZEIGxTH0NQErVoX/LxvYIBel1E9Ts
         aTJe+Nq4nDAewa8SKAsHJWyaSZtbwhBaw9vBBZ/EUbsTO/csEvIxXC0fItoZSP1E79q0
         p+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705398373; x=1706003173;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6mx/Gd+SFP6tPsyavF5dliAe0VRZv+bFCzrTourHb0=;
        b=uWnYhBo+VcWgHY5+KFLbI73u1k5HJTNueHOIMXuKo0OiXlGqbDYtytbC4Xp1mMv8N9
         CFqCkMvDgfWhS4Y25BmwXEg30JyI0mZ0b5w5QbceyfVeqMcKOFtiNarXPvdBg8VoH7HL
         M/ndws6a3nHnY6DhEYBHIgZue7E8PdTGVWtEq+ndMc2dnHB38YwuXPqR7+NYh6KXJINV
         iTdub8Md+T8zZ4/mU0S2Lz1d+AeVd8vYt4xVRQ+vx0cOyhpfBu449Bn9o8EJjnyOW0CG
         bP5kZTrsK97QSftqHnfEbgtiuqau11yruYt5pfivXoqHfl1sql8LgefWrMM4MCxIg1Ep
         hzQw==
X-Gm-Message-State: AOJu0YzR9Zqz/hnR1UdOV3Go3uWRSYpy4csyd4vF2ICk3sofN1M7esCj
	ezy7JYMYGq0NRyplmUNsfsk=
X-Google-Smtp-Source: AGHT+IFS12zgVL6MTVrHD8Im00yLXJUUnqYiV0ds0ntf6ERLiaf6mcDKuUxPvgGNzWjj0xr4vghmfw==
X-Received: by 2002:a19:654a:0:b0:50e:74e1:2e35 with SMTP id c10-20020a19654a000000b0050e74e12e35mr4749698lfj.5.1705398373061;
        Tue, 16 Jan 2024 01:46:13 -0800 (PST)
Message-ID: <37f3bac7bd801727dc97168895d28c01d122a718.camel@gmail.com>
Subject: Re: [PATCH v3 22/34] xen/riscv: introduce regs.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 16 Jan 2024 11:46:11 +0200
In-Reply-To: <0d3cf7ef-a601-42c0-a6ed-61ab421f6c69@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <3d1ae540120804af5fc812a1492931afac66bd39.1703255175.git.oleksii.kurochko@gmail.com>
	 <0d3cf7ef-a601-42c0-a6ed-61ab421f6c69@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-01-15 at 18:00 +0100, Jan Beulich wrote:
> On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0- update the commit message
> > =C2=A0- add Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> I see none above the --- marker.
Thanks for noticing. I'll add in the next patch version.

~ Oleksii

