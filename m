Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44BD9D2400
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 11:53:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839980.1255761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLql-0008F6-N7; Tue, 19 Nov 2024 10:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839980.1255761; Tue, 19 Nov 2024 10:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLql-0008Cy-Ix; Tue, 19 Nov 2024 10:52:51 +0000
Received: by outflank-mailman (input) for mailman id 839980;
 Tue, 19 Nov 2024 10:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Kxf=SO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tDLqk-0008Cs-OR
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 10:52:50 +0000
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 685798d2-a664-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 11:52:45 +0100 (CET)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7180c7a4e02so427126a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 02:52:45 -0800 (PST)
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
X-Inumbo-ID: 685798d2-a664-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC1vdDEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY4NTc5OGQyLWE2NjQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDEzNTY1Ljc4NTgsInNlbmRlciI6ImZyZWRpYW5vLnppZ2xpb0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732013564; x=1732618364; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxCkrnScSvfn//DVJNwW3Ml6tAJs/0iP2qdpFnESu2A=;
        b=UCzSFjIyMGylQPWE2ZEFVNy9DEie/agD6oqJUXV3UZ2BSXaZFPiYVeAKhDl/2qBK9P
         IKlRj1w7/YgHC6nOP5mlT8+PIuofY9LCmyK6n+Frb7/Fbk9ivbtMyrKoJPITK/GGAsOD
         HpCsvVu2xULwMSSINCRwvMqOOj4j0H9kjKV1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732013564; x=1732618364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxCkrnScSvfn//DVJNwW3Ml6tAJs/0iP2qdpFnESu2A=;
        b=Suuny7mquwiKKlUgNZWoewHNwgVr3MMsDyxfA7++ArQSXcaKl0VKp31xRqNe0YMO6i
         Mimi0Bve9gIpID7+R+5dMeulTr/1vwdAf6FEwq1xx5K72az8nxyV4baFW9Uky0M9hjR4
         qHe/wvHILMB3zkv7RngiAz72MgoKGi1EqBLX+ui20UkKNl/4JZtDODewNaG4vl3OSJau
         RyZmZOY1og+4eC1gjYTPXAG1lmsxoIn3+maxl29uYcOBTH9Y3Ejbq43pqbiO5isDHKpF
         x4cNcxCTDRMxEytTsMOUhxl3Aw/FTETm975ud5LjPuYtCBuyb6zcE8LT9rrDDuywYuld
         7M9g==
X-Gm-Message-State: AOJu0YxYLet9yuFHOUTnj2okj46IwDPD4ggMIKgSHH8Q/+HntQ6KAz8D
	cso7FOUd/MJI9v3YDsGj6gGuE6Ir5vC8GvYUmeGP+kWth/Z65MxnMVgbM9/wu75843+6V7cdiRw
	S/zeMEXGCeKxJfvTAhwzCFwbs7VVRIIRL5Jcn8Q==
X-Google-Smtp-Source: AGHT+IGYsBtfP+me0MbKFuYQAtViohazc9z7mAX7if75tE7qveHJTosGzNwD6bl4xQHVjGPBIy5wxd8tprncqMc1KzQ=
X-Received: by 2002:a05:6830:6217:b0:715:3f20:bd2c with SMTP id
 46e09a7af769-71a77988358mr12411311a34.10.1732013564456; Tue, 19 Nov 2024
 02:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20241119103444.23296-1-roger.pau@citrix.com> <20241119103444.23296-2-roger.pau@citrix.com>
In-Reply-To: <20241119103444.23296-2-roger.pau@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 19 Nov 2024 10:52:26 +0000
Message-ID: <CACHz=Zg20Sxw_HY6EwXYvhcm=3ZjPwUH7vbdsZtSCU+2_TU7Kw@mail.gmail.com>
Subject: Re: [PATCH 1/4] x8&/mm: fix IS_LnE_ALIGNED() to comply with Misra
 Rule 20.7
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 10:35=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.=
com> wrote:
>
> While not strictly needed to guarantee operator precedence is as expected=
, add
> the parentheses to comply with Misra Rule 20.7.
>
> No functional change intended.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: 5b52e1b0436f ('x86/mm: skip super-page alignment checks for non-pr=
esent entries')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 494c14e80ff9..fa21903eb25a 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5498,7 +5498,7 @@ int map_pages_to_xen(
>   * be INVALID_MFN, since alignment is only relevant for present entries.
>   */
>  #define IS_LnE_ALIGNED(v, m, n) ({                              \
> -    mfn_t m_ =3D m;                                               \
> +    mfn_t m_ =3D (m);                                             \
>                                                                  \
>      ASSERT(!mfn_eq(m_, INVALID_MFN));                           \
>      IS_ALIGNED(PFN_DOWN(v) | mfn_x(m_),                         \

Minor, typo in subject: x8& -> x86

Frediano

