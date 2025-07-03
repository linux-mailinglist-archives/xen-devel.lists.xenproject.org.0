Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61979AF69FE
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 08:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031732.1405489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXD0y-0002WO-43; Thu, 03 Jul 2025 06:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031732.1405489; Thu, 03 Jul 2025 06:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXD0y-0002UA-1F; Thu, 03 Jul 2025 06:01:44 +0000
Received: by outflank-mailman (input) for mailman id 1031732;
 Thu, 03 Jul 2025 06:01:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iAPd=ZQ=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uXD0w-0002U4-Le
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 06:01:42 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 302f3873-57d3-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 08:01:40 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-553b3316160so5869162e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 23:01:40 -0700 (PDT)
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
X-Inumbo-ID: 302f3873-57d3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751522500; x=1752127300; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIu0Sa+xFBhu9e2TV+IlwWtStjFfGAhYKBB8tPeGIr0=;
        b=CBD2qWFp/yGLEngbfCrV3uCsb4aZd+Tso+KHMRv/ibMfNc4fvYXzH//Zd7mr51hdAa
         wnRpw86VFw/+XhVn4lIYlm85VzZqqaUuO2I28aQYaw5uWe/Gl+px0IaSFrEHiY4kTTws
         v3/Z3H4j07w4IXYO/3q3/uxyyEM8hT+6ErL4vKj7McDekUP+lqlggzCQ3pJupCqOb7S+
         Dnn49QqaGjhtf22sq/YAitRIKqkxJKAdadYGsOp3DNzQTGbkpYTsgME/JvWhznRfPaV5
         D05c38gAn9GHO5ommU21ru2BeSblMfwmNKfdIY57ziwftblajQPn/M73kwg66NlKowxG
         zWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751522500; x=1752127300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIu0Sa+xFBhu9e2TV+IlwWtStjFfGAhYKBB8tPeGIr0=;
        b=qL9XqB/nSxq8d1fbjNQT3vuHNPm5Tj/yq0oYvdsJjdAlqvxz/PdcFsC9zYPvZqeT9S
         h4Se+73oEbULdrtu638gcaZ3Cv08/LKpVx7ulWOc7+0EQify7u3by+ZDt/G+pBy9Q3cX
         hhzLX6I9s0uqZ45FrWftVzqDDFg+yK/09MkNM0AkIJgjuzLL7QCcMP+yLfX7HDIq8Sc1
         hVvYp8fYe8TMrhnefJYTjy/UGDeKUA0QkD/YdfBtNe6w3dNVj8xCBaBROIc01hWe9af+
         5Wszgfzt4P20jpahM/xBpYMlFO4J1eqLIktAdJCFpkbhSPyc1R948JfkQEU8DwLDOECG
         onhw==
X-Gm-Message-State: AOJu0YyKC6F2PpkWFbAYkFQblnqV6ABSVRJ9Bv2zsXXY91KYu+rGCfVx
	5Fu/Cc/LdSqmVOfAJaFIc+fBrcEGAhybQCYWpAeeSY78yA7ypM9Py6RF7QYR7U+4CUpf88TXG9s
	w3wUQCtUmuWfTpD0KHOy+Zuh1ssaUDWo=
X-Gm-Gg: ASbGncuX96b/Z1xNbew3QOIUPhCBaA+sKVWkv+h5YYI2QJduYv9ZyMpsh98RmGIe8bn
	dB3TNokGp/wbH+ti16VEXlLi2TY5/2KaKF9L20ZERpcoaT+ce0aTij/hY6RRYVSplI4o/HaaODl
	g24qYRMCmkKcdKfabt4WehS1Mb84OzW3aNer2RD9GJcQ==
X-Google-Smtp-Source: AGHT+IH/MPDdUfyaTQdF6b8xTfDf24k1y1o3SPs0JhhcmSj9g+mUw8JilzgQDU5uc/QCU6MIBA7AHj9OiIHwdPLQfKE=
X-Received: by 2002:ac2:51d1:0:b0:553:2f61:58eb with SMTP id
 2adb3069b0e04-5562838f95emr2213016e87.49.1751522499736; Wed, 02 Jul 2025
 23:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751020456.git.mykola_kvach@epam.com> <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
 <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org> <CAGeoDV-Zze2LtAdofS5EENkANH46SGU3+kqHkTB-k33MBmBXLQ@mail.gmail.com>
 <3cf697b8-9c23-4e24-980e-3f9696692bb4@xen.org> <CAGeoDV8_bB6Yrr0eLmUM562Q1CEsGuHXe7S5f6-yYwwwLdiXkg@mail.gmail.com>
 <7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org>
In-Reply-To: <7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 3 Jul 2025 09:01:27 +0300
X-Gm-Features: Ac12FXxYntFM_lDdnXAuOmulwbb5FfIhfzsqdvx7D8isDfWNIamH4twxnpqWU1M
Message-ID: <CAGeoDV8oo_J7f9YT3Vfh1nBVt7Eb21YGj8-P9xw958KQNvHz8g@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Thu, Jul 3, 2025 at 1:57=E2=80=AFAM Julien Grall <julien@xen.org> wrote:
>
> Hi Mykola,
>
> On 02/07/2025 23:27, Mykola Kvach wrote:
> > On Wed, Jul 2, 2025 at 3:28=E2=80=AFPM Julien Grall <julien@xen.org> wr=
ote:
> >> Why should we return an error? This is valid for a 64-bit domain to us=
e
> >> SMC32 convention.
> >
> > I mean =E2=80=94 in that case, is it possible that the upper 32 bits ar=
e set to
> > non-zero values without it being an explicit error from the guest?
> >
> > In my code, the macro used to extract 64-bit values (on 64-bit Xen, of
> > course) just copies values from the Xn registers directly.
> >
> > According to the SMC Calling Convention specification:
> > "System Software on ARM Platforms" (ARM DEN 0028A), we must use Wn
> > for SMC32 parameters in AArch64.
>
> The version A is more than 12 years old. You want to use the latest
> version. From the SMCCC DEN0028G [1] section 3.1 (Register use in
> AArch64 SMC and HVC calls):
>
> "
> The working size of the register is identified by its name:
> =E2=80=A2 Xn: All 64-bits are used.
> =E2=80=A2 Wn: The least significant 32-bits are used, and the most signif=
icant
> 32-bits are zero. Implementations must
> ignore the most significant bits.
> "

You're right =E2=80=94 I should have referred to the latest version of the
specification. Thanks for pointing that out, and for the detailed review
and explanation. I appreciate your time!

>
> So...
>
> >
> > AFAIK, writing to Wn zeroes the top 32 bits of Xn. So, if the guest
> > is properly using 32-bit values for arguments, the upper bits will alre=
ady
> > be zeroed.
>
> ... while the guest should write 0 in the top 32-bit, we should not
> reject not reject non-zero values nor do nothing. Instead we should
> ignore the top bits.
>
> Also, per the Arm Arm (ARM DDI 0487J.a) page D1-5406, it is
> implementation defined on whether the top 32-bits are zeroed when the
> previous exception context was AArch32. Xen will zero them on entry to
> avoid any surprise (see [2]), but that's only guarantee if this is a
> 32-bit domain (running either on 64-bit or 32-bit Xen) as SMC can only
> be called from EL1.
>
> As a side note, KVM is also ignoring the top 32-bits (see [3]).

Got it. I'll update the code to ignore the top 32 bits when an AArch64
domain issues SMC32 calls.

Thanks for the clarification!

>
> Cheers,
>
> [1] https://developer.arm.com/documentation/den0028/gbet0/?lang=3Den
> [2]
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D32365f3476ac46=
55f2f26111cd7879912808cd77
> [3]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/arm64/kvm/psci.c#n223
>
> --
> Julien Grall
>

Best regards,
Mykola

