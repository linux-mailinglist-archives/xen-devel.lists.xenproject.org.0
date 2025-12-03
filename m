Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25509CA06D7
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 18:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177003.1501431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQqcm-0001PC-P2; Wed, 03 Dec 2025 17:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177003.1501431; Wed, 03 Dec 2025 17:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQqcm-0001N7-MT; Wed, 03 Dec 2025 17:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1177003;
 Wed, 03 Dec 2025 17:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qm2A=6J=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQqck-0001N1-GM
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 17:26:42 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aae0154-d06d-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 18:26:40 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-64320b9bb4bso104545a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 09:26:40 -0800 (PST)
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
X-Inumbo-ID: 3aae0154-d06d-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764782800; x=1765387600; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82aUxN6z1AEXBhiLhdI9OrxP4fk0J5kUshV4gL9CybA=;
        b=iRaMdpiuprzUnCU2AZPPptDfqVd7YO4KQRUE7cdk/U51w6U/oamdHARiXnoFMSN58I
         jgzGY5tezO5Jj2BZongZBZgKgRINi+BI0UtVOie3g3NgjYD1Qgj9JE97J3/AHnV35fX0
         REC+jZp00NcDpbX//pkayoFGU/fZiRb8JBXYzyh+CSAGU8SWFtgtU648sxCE1QGpEBW7
         C1UKclvIBV3KPcGRQpeUc3IK0rX4MN/YhQS7mJirkUMAuQJ/+5pgzA3IzNvmEialJ6ZF
         1xzGo21MRYTh6Hy35hzM8TRsEHF5gVfsEh79mwHuuKBSztHv+b1aA8F47zCKt+YvANyM
         z5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764782800; x=1765387600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=82aUxN6z1AEXBhiLhdI9OrxP4fk0J5kUshV4gL9CybA=;
        b=xO6o3zNDTz7EGhe+Z5fnIFph3y/0EsTVUUSCv89EYSn0Zcy1WjcgYhdJ3lp2Vend+2
         F79F6TJDrD3/xKd3ZClnXi+xmlZEnTZaBhJeAhmmt5OZCaQzXcV6XoWFM3qxbbRP3caV
         ypKaIkXmBS+F0j0UUlcpgxt5IlHcGA1n1Um7I+BvyJ4VjD+fzt2Gd1Xp6sTafUhpv7dr
         OHtvrh1xDLxwySf/90GZv7BhOAn3Ow96/9Eh0n7u6MdTJPkc2weEAqzkXkT5sQ0GfYzf
         rjnl4vf0xMMJ1FZ9Y06ult9wLAspG5A8pOzBnoQ1U9jSI2tKxD2ZXsAOBeUMlmNPVIqI
         SdcQ==
X-Gm-Message-State: AOJu0Yz2/438ZFR5yPP4onlEjW1v7anrzGbEjA7s/PFOKJQsc4LVx+a9
	rJMu3Pbgq8ABb5WD1XEH8of05JNsw2LCbLpVzVjr4AqbZf3NTe5rrFOFKnmhprxxoIWNrNYuiQa
	TZDeZGH3LxF4VKoNRQ5Q9vS+HYI38jBpdzJqjMjuGjg==
X-Gm-Gg: ASbGncscYlb0mvGqV4y1tyW2olNJP4EjSbgd6kxtefGOo7JlO0AqVAPoiIPlWwSKe1q
	Mt6k9ArUBywwfhwsYPxSE/fsNFwTPAIT8mYZicysUll3nYVLNCLwzvyawTZF3CE49F8BREk3ofg
	SY6Xv7hXFpuretA6Hhvunuk4NS8gI0oi5tT+djNIncVQwtAXMDnk72NaH5mUYPL1UaOQ+jLXV4i
	GqHGanILYXUcQM9tEolacWavNWBDGumHBckGR4yeSfqzL+2bRJVovjlxpbnLx/4CdESyEEngtFF
	sIpGl9VaYWXxk5ztkl+mVXwMzw==
X-Google-Smtp-Source: AGHT+IFYwj/gtlCE5BBQQSz1MlJIVq2nx6mlr5zaT3UB3JBBT+XSJCQgyUe7PAQqejEo+QZYKKTAwqyn2OsQ2ORAk5E=
X-Received: by 2002:aa7:d407:0:b0:640:931e:ccac with SMTP id
 4fb4d7f45d1cf-647a6a0eb5amr156977a12.7.1764782799950; Wed, 03 Dec 2025
 09:26:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com> <06eae7d0caaf5379086d9a2efde8489448f14f39.1764254975.git.bertrand.marquis@arm.com>
In-Reply-To: <06eae7d0caaf5379086d9a2efde8489448f14f39.1764254975.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 3 Dec 2025 18:26:27 +0100
X-Gm-Features: AWmQ_bnjmRS87CIqkuotEQ_s_E0Izk0P01BbmLUcY-3r6YYeeyK4R7xx5QxCi5g
Message-ID: <CAHUa44F2cGs=xqHbqsG=me1qnJ8u+gawoqmf__1CuOtx3B5XwA@mail.gmail.com>
Subject: Re: [PATCH 09/10] xen/arm: ffa: add MSG_SEND_DIRECT_REQ2 support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Nov 27, 2025 at 4:53=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Extend the direct-request path so FF-A v1.2 guests can issue
> FFA_MSG_SEND_DIRECT_REQ2 and receive the matching RESP2.
>
> The handler now marshals registers x8=E2=80=93x17, and
> ffa_finish_direct_req_run() copies back the 17-register response used by
> FFA_MSG_SEND_DIRECT_RESP2. The new opcode is exposed via FFA_FEATURES
> and gated on guests that negotiated v1.2.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c     | 20 +++++++++++++++++++
>  xen/arch/arm/tee/ffa_msg.c | 39 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 92cb6ad7ec97..8b2f042287fc 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -234,6 +234,8 @@ out_continue:
>  static void handle_features(struct cpu_user_regs *regs)
>  {
>      uint32_t a1 =3D get_user_reg(regs, 1);
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>      unsigned int n;
>
>      for ( n =3D 2; n <=3D 7; n++ )
> @@ -262,6 +264,16 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>      case FFA_MSG_SEND2:
>          ffa_set_regs_success(regs, 0, 0);
>          break;
> +    case FFA_MSG_SEND_DIRECT_REQ2:
> +        if ( ctx->guest_vers >=3D FFA_VERSION_1_2 )
> +        {
> +            ffa_set_regs_success(regs, 0, 0);
> +        }
> +        else
> +        {
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        }
> +        break;
>      case FFA_MEM_SHARE_64:
>      case FFA_MEM_SHARE_32:
>          /*
> @@ -347,6 +359,14 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>      case FFA_MSG_SEND_DIRECT_REQ_64:
>          ffa_handle_msg_send_direct_req(regs, fid);
>          return true;
> +    case FFA_MSG_SEND_DIRECT_REQ2:
> +        if ( ctx->guest_vers >=3D FFA_VERSION_1_2 )
> +        {
> +            ffa_handle_msg_send_direct_req(regs, fid);
> +            return true;
> +        }
> +        e =3D FFA_RET_NOT_SUPPORTED;
> +        break;
>      case FFA_RUN:
>          ffa_handle_run(regs, fid);
>          return true;
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index 472bfad79dd3..1f42aae1e0b6 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -49,6 +49,30 @@ static void ffa_finish_direct_req_run(struct cpu_user_=
regs *regs,
>      case FFA_MSG_YIELD:
>      case FFA_INTERRUPT:
>          break;
> +    case FFA_MSG_SEND_DIRECT_RESP2:
> +        /*
> +         * REQ2 / RESP2 use a 17-register payload (x1=E2=80=93x17). Copy=
 all of them
> +         * back to the guest context.
> +         */
> +        set_user_reg(regs, 0, resp.a0);
> +        set_user_reg(regs, 1, resp.a1);
> +        set_user_reg(regs, 2, resp.a2);
> +        set_user_reg(regs, 3, resp.a3);
> +        set_user_reg(regs, 4, resp.a4);
> +        set_user_reg(regs, 5, resp.a5);
> +        set_user_reg(regs, 6, resp.a6);
> +        set_user_reg(regs, 7, resp.a7);
> +        set_user_reg(regs, 8, resp.a8);
> +        set_user_reg(regs, 9, resp.a9);
> +        set_user_reg(regs, 10, resp.a10);
> +        set_user_reg(regs, 11, resp.a11);
> +        set_user_reg(regs, 12, resp.a12);
> +        set_user_reg(regs, 13, resp.a13);
> +        set_user_reg(regs, 14, resp.a14);
> +        set_user_reg(regs, 15, resp.a15);
> +        set_user_reg(regs, 16, resp.a16);
> +        set_user_reg(regs, 17, resp.a17);
> +        return;
>      default:
>          /* Bad fid, report back to the caller. */
>          ffa_set_regs_error(regs, FFA_RET_ABORTED);
> @@ -107,6 +131,21 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_=
regs *regs, uint32_t fid)
>      arg.a6 =3D get_user_reg(regs, 6) & mask;
>      arg.a7 =3D get_user_reg(regs, 7) & mask;
>
> +    if ( fid =3D=3D FFA_MSG_SEND_DIRECT_REQ2 )
> +    {
> +        /* 17 registers are used for REQ2 */
> +        arg.a8 =3D get_user_reg(regs, 8);
> +        arg.a9 =3D get_user_reg(regs, 9);
> +        arg.a10 =3D get_user_reg(regs, 10);
> +        arg.a11 =3D get_user_reg(regs, 11);
> +        arg.a12 =3D get_user_reg(regs, 12);
> +        arg.a13 =3D get_user_reg(regs, 13);
> +        arg.a14 =3D get_user_reg(regs, 14);
> +        arg.a15 =3D get_user_reg(regs, 15);
> +        arg.a16 =3D get_user_reg(regs, 16);
> +        arg.a17 =3D get_user_reg(regs, 17);
> +    }
> +
>      ffa_finish_direct_req_run(regs, &arg);
>      return;
>
> --
> 2.51.2
>

