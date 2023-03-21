Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E796C37D3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:09:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512894.793263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefUI-0004j0-PA; Tue, 21 Mar 2023 17:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512894.793263; Tue, 21 Mar 2023 17:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefUI-0004gJ-M2; Tue, 21 Mar 2023 17:09:30 +0000
Received: by outflank-mailman (input) for mailman id 512894;
 Tue, 21 Mar 2023 17:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mk2b=7N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pefUH-0004g9-K7
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:09:29 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2301f83d-c80b-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 18:09:27 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id o12so62460731edb.9
 for <xen-devel@lists.xenproject.org>; Tue, 21 Mar 2023 10:09:27 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 a25-20020a50c319000000b004bc15a440f1sm6629228edb.78.2023.03.21.10.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 10:09:27 -0700 (PDT)
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
X-Inumbo-ID: 2301f83d-c80b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679418567;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6OT3X8Qmdr7B+VGDfyXkLy18kkcGdEG9aiwdI2sOxQw=;
        b=TVFX5ncQ5r8vHjDtBepeIUNvW2ZJbTgQWXQleRgAdXtkb1lMpy/WCDsUoLqZc5Ew5x
         xKGpJKLKEf8KbCnV0C+C+mV+jATuBCrqh1LgbRl3MnTQpGQACKmHQKteLVUCauU+MplT
         JyxV//aiSIpxqeAqcEmAOEZE+pIQuPkUzAE1A2Ltegy8TzqSu6ZcEjKpTQWnGWcRscoZ
         +nrZTy8/jQj8x615EpUoKFp39GHV8DGtB0mxKu/RipbDTb4bOlQZvuv70Yb53qz44RTG
         djKBUiYZtIwYg3vJQcqnownJe9u0vsB0WLNOTfGvUkFMRtuOGjlkZn+TrX4BC65O9BrU
         OQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679418567;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6OT3X8Qmdr7B+VGDfyXkLy18kkcGdEG9aiwdI2sOxQw=;
        b=7Pl2R2e7EGz0k0B01+mLR0FjUaTkVnyMGPO2LnJGsMS/sc+TLIWwPb+9KDByztPKzh
         1bpgiwUul/Do1FWzhsAGf/kUTnA19WYgRbQ0XCtETbQAQZntoftLUz1DTaizcxz+7scI
         VtTuh1ErLBJyMeMv4wxHOGbM1DjBGhFPyukfWsEwTdEmF+ozBdCGceI1zvWT5YRTaFob
         wOYI0zFYS1eSYxa+XOGL7Qi4lc0wVGNBGCaEB7yD99kJz7NwNY8Zg+eJ837LyqR+ydwY
         C3zEpjKiMrpsKrt8d3yUWommO+R33nlhbEuMyE3hx9xkTQyNF7i6b3+CTj7D/7MrzaSC
         9fdQ==
X-Gm-Message-State: AO0yUKU/xBvOwL3SkEq7kz9uShgaK8qx9Uq2GajjvufAw8yfSgmSXGP1
	VwqHGzgOzLM6Ut2p1A7J7RI=
X-Google-Smtp-Source: AK7set9qUjHyXVlx2JBO0rkrd08N41EIwUX7emkviSwAMdtAQwBL310lcCrO1nFY45TOtgQ8l2pHlQ==
X-Received: by 2002:a17:906:7054:b0:932:4eea:17ce with SMTP id r20-20020a170906705400b009324eea17cemr3455727ejj.39.1679418567209;
        Tue, 21 Mar 2023 10:09:27 -0700 (PDT)
Message-ID: <73991bae430bfb8af270d055aa1c21255e61b488.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] xen/riscv: setup initial pagetables
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 21 Mar 2023 19:09:25 +0200
In-Reply-To: <fd290ce1-d1d3-9266-1b90-2b9df052a9e3@suse.com>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
	 <a748d8cf94fbf4ffee3ca3acb553a9caad1f423c.1678984041.git.oleksii.kurochko@gmail.com>
	 <fd290ce1-d1d3-9266-1b90-2b9df052a9e3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-03-20 at 18:03 +0100, Jan Beulich wrote:
> On 16.03.2023 17:43, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > =C2=A0* Update the commit message
>=20
> Odd: It's empty. Since it's not part of the title, you could at least
> say that you're also enabling the MMU. (Most of the time entirely
> empty descriptions are suspicious.)
I thought that 'setup' includes 'enable' too.
Probably I have to reword the commit message.

~ Oleksii


