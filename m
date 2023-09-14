Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C67A0537
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 15:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602271.938735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgm9S-0006iI-Bc; Thu, 14 Sep 2023 13:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602271.938735; Thu, 14 Sep 2023 13:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgm9S-0006ev-8V; Thu, 14 Sep 2023 13:12:58 +0000
Received: by outflank-mailman (input) for mailman id 602271;
 Thu, 14 Sep 2023 13:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dcB=E6=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qgm9Q-0006ep-I1
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 13:12:56 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a551536-5300-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 15:12:54 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4c0so2220304a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 06:12:54 -0700 (PDT)
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
X-Inumbo-ID: 6a551536-5300-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694697174; x=1695301974; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AumOUiCHXPH8lTKcSmDU3lcvhgb329jr+8FMhGs+oyY=;
        b=I/qqjlVecFukO8OxH+ZYyK/q6dsTwZZ+eiKhndH6t55UfLT6F1spUSeqJKS7OdjSBs
         Y2lqfqhvfVxfP9dx7F+icgzqoytfFDWpQbM6ptolLwA3celveeGm9tnAKiqRFIfiZtwN
         LSfKX3bid7AgLMk7ylRhH6306pGfOAkNExB3SfLmGBQCcprUBkHckNK+1TW59McyJ5Ae
         mk8XUptmy+X7dU2oAVGBjgFLaeBPo3GKW+mf7Iz+iDj57/4aM3Wp1YsFK4syqSStmWG3
         UuSq1HgM/yDPBqAm3I4HaI77YyWvPEuZ35aCi04AUa6ghhxRJqjdZKGJFsR59S8ytbvL
         TuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694697174; x=1695301974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AumOUiCHXPH8lTKcSmDU3lcvhgb329jr+8FMhGs+oyY=;
        b=AHHbItU1s0zk54WUcEPNTQ2Ym1C8uvQCWWrI2oWdB9MJy+vx+8wjLuE/IzvD3rVHJX
         M0Uyq2TdBYcpth0fuAPKfnqKxtVD27qTs/ST2bpK+L5ERCmIezsG5/socudgYlq+zshX
         STeAsdaBteDAKoAWQfhVIMBuszOWjGLIbqwyyYB8EZ9/ZFlTjvkyP+gTc6tcfs7X5w3+
         npzq8y2mkgU/L2gqa0tCcd1M6bSdbP/FZd4r8NJnk5T66sJ6oDNvdh6hvx9lTAlwL8XB
         tFM0rYjxcyIk8Zy3ISjS2/kdUohN8PtF8+bJEWoZHRv5meCY+Uv8et4nY3uhUkLdbWry
         I/wg==
X-Gm-Message-State: AOJu0Yx24PZIU7qNvHmXxXuWdmwM7trHqSC+dhnmHAWTBtPkCUPAxZc6
	gOYNP2IYBvJBf2H7KQKUs9lNuRqcQjs1E46cf+ZnRbI1xp4=
X-Google-Smtp-Source: AGHT+IFdja4vrxhs/sr5ebqzHnZ5ujUwcD3BvrR63AzlerPNBtgB0uvmWzdFOIyMU/1jnyBrr11E7wEfAGvejKd55eI=
X-Received: by 2002:a05:6402:f21:b0:528:9284:61c6 with SMTP id
 i33-20020a0564020f2100b00528928461c6mr2917326eda.0.1694697173785; Thu, 14 Sep
 2023 06:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230913202758.508225-1-andrew.cooper3@citrix.com> <20230913202758.508225-9-andrew.cooper3@citrix.com>
In-Reply-To: <20230913202758.508225-9-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 14 Sep 2023 09:12:42 -0400
Message-ID: <CAKf6xpuRh00P9at-bY+XE669vjoMf_xMwozQkCx=DL6Q2kLwgg@mail.gmail.com>
Subject: Re: [PATCH 8/8] x86/spec-ctrl: Mitigate the Zen1 DIV leakge
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 6:09=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
> @@ -955,6 +960,40 @@ static void __init srso_calculations(bool hw_smt_ena=
bled)
>          setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
>  }
>
> +/*
> + * Div leakage is specific to the AMD Zen1 microarchitecure.  Use STIBP =
as a
> + * heuristic to select between Zen1 and Zen2 uarches.
> + */
> +static bool __init has_div_vuln(void)
> +{
> +    if ( !(boot_cpu_data.x86_vendor &
> +           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +        return false;
> +
> +    if ( (boot_cpu_data.x86 !=3D 0x17 && boot_cpu_data.x86 !=3D 0x18) ||
> +         !boot_cpu_has(X86_FEATURE_AMD_STIBP) )
> +        return false;
> +
> +    return true;
> +}
> +
> +static void __init div_calculations(bool hw_smt_enabled)
> +{
> +    bool cpu_bug_div =3D has_div_vuln();
> +

Would it make sense to add
    if ( !cpu_bug_div )
        return
...

> +    if ( opt_div_scrub =3D=3D -1 )
> +        opt_div_scrub =3D cpu_bug_div;
> +
> +    if ( opt_div_scrub )
> +        setup_force_cpu_cap(X86_FEATURE_SC_DIV);

...so that div-scrub=3D1 isn't setting X86_FEATURE_SC_DIV on un-affected
hardware?  Or do you want to leave command line control in place in
case it might be needed as a future workaround on other hardware?

Thanks,
Jason

