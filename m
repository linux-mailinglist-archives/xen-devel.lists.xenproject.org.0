Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C3DC9E2DB
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 09:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176463.1500955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQi6v-0005T1-Nl; Wed, 03 Dec 2025 08:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176463.1500955; Wed, 03 Dec 2025 08:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQi6v-0005QR-Kh; Wed, 03 Dec 2025 08:21:17 +0000
Received: by outflank-mailman (input) for mailman id 1176463;
 Wed, 03 Dec 2025 08:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qm2A=6J=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQi6u-0004Eh-Pj
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 08:21:16 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03307dda-d021-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 09:21:06 +0100 (CET)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-65962c714eeso419031eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 00:21:06 -0800 (PST)
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
X-Inumbo-ID: 03307dda-d021-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764750065; x=1765354865; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8N0YgyFKdSngXQfHGPmBwD03gL16SL5yPxUgUvFtSKg=;
        b=qX2lH8vVdr3GeikBXW4sI1KIbj2b1oWYmPgh5yyJqYQSynAznbz2GueZOKAv5lULkb
         xVzLk5ik9JqHft3mLpXHTByuNFF8oTqnu+DDzZ8uglJT2oEg7ujl4AwjA9v3mZ7v8Hlz
         oUXGSSc5nGXc/oIZ4qsEEtzlTjV6NhZDFt/DD2SnQaUtEUjIuYLvZ+l8IZo8bWAqPe/X
         2kcEU99aT8YbseaGkWF4ZdNYz+qkcxbqi9QDpbRxYOmpo8o8zL18Ez+pUnmiiVbRf7nO
         Kwy9eAeQDRIJlt1p5X8EZQRDKmIQaZvm4gcsrUJ3NezbHDDaCCYoWbsJPwGQer2vXOpM
         vBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764750065; x=1765354865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8N0YgyFKdSngXQfHGPmBwD03gL16SL5yPxUgUvFtSKg=;
        b=aJGEccFXaKYIvM1hZueb2bACsS/z8VOFSEd6yHmrR3mEEsXuIsXsTwDcvgoY8GTX73
         19z/7qHgkeXDC64g9ziE+GfCW7WBZjZrSP2puYBAwukAmYFbFGax7TFDFv2Kgk38VaoS
         n2zZNq60XuKX7AoVCIxLIOU1M7N7wiytqMCge/rT9tSjUv9A3Cx83T3pxPSIVS83RUZB
         XGPVAEPNzD/O0B6SovzQYIE0y0s3BOw/lgVkxfFhabth5aRosibshMCDLx2ziTN9+EVW
         EM5iB28bE9eY7Ju53xUt+dTutknVWZ2BOVE8CEXMvlOMlp44MysjAa6tjn+6i/79VKUh
         3EFQ==
X-Gm-Message-State: AOJu0YwOClg14gTOuPWSo1YjRxGjsTzXAV9wtkOY6GizxECAnQxXOaE4
	J3QxMQnwhBcQrQIKHAMxTPwkduVBc5sHJ1UqLKxeAJovwXdJZxuW4vNd1MyoKXnXYkwJVqlTAKY
	t93sB2LgPCx7eDWlmoZ+uAWAkCCoKONTsO75U70eQfA==
X-Gm-Gg: ASbGncvYK9iqx7GWYkY0LyRKtZ45YdiYlWH2fjypnHQ2lW6z9E6lF3N1mZ6vByfwEMY
	nzs+f8pIE4nLJ3NbQei7V249k4hT2SBS38jwL8WPArL3CI+bF10Jpq7wRWvba/xyeor/nqKVjUi
	Z+a+tPBtj9PTANMxitIbvVjoQJRq05IALdmFoKXeRXEfpFo3xUO0qdpU0IP2/nG98RLnw75iZyH
	x3de+eBJAgzrCZt1yvBAje4QiduSHkW+MGSjpMlYXPXonTVdJI8ViHtU0KyZ48QN/5pPCUis917
	0bED3hpGL72qqQmvnlONtsH5Xw==
X-Google-Smtp-Source: AGHT+IFJQ8PJKluLvDrX5br9DlFOy9pR/2tzVPh0zb3flF2drXM/2oyqegMLr3WVVrXKHNklD8dQHViugjkZZliBM5o=
X-Received: by 2002:a05:6820:30f:b0:657:182a:a5e2 with SMTP id
 006d021491bc7-65966caea70mr2077267eaf.4.1764750064755; Wed, 03 Dec 2025
 00:21:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <5e66b2991340f010befcaa3a57d0f35ad18d4149.1764254975.git.bertrand.marquis@arm.com>
 <CAHUa44E1SnhBR8=ibG+r6QPN9hehcRVPa93zKpYd756OHza+=A@mail.gmail.com> <BBA18875-32B0-4CAE-91B3-160DBD1B3BB8@arm.com>
In-Reply-To: <BBA18875-32B0-4CAE-91B3-160DBD1B3BB8@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 3 Dec 2025 09:20:53 +0100
X-Gm-Features: AWmQ_bnCzIK1lMsusdan31d70d_Y8QvRtUxri0gam-BE64OPdJCq-vatgqoXSN4
Message-ID: <CAHUa44Fhk=thuwPuSC3V35p8c31OVRcerC4xxLca_ob2FPyd1g@mail.gmail.com>
Subject: Re: [PATCH 02/10] xen/arm: ffa: per-VM FFA_VERSION negotiation state
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 2, 2025 at 5:26=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 2 Dec 2025, at 12:33, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi Bertrand,
> >
> >
> > On Thu, Nov 27, 2025 at 4:52=E2=80=AFPM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> Track FF-A version negotiation per VM and enforce that no FF-A ABI
> >> (other than FFA_VERSION) is processed before a guest has selected a
> >> version.
> >>
> >> Each ffa_ctx gains a dedicated guest_vers_lock, a negotiated version
> >> (guest_vers) and a guest_vers_negotiated flag. guest_vers records the
> >> version requested by the guest so the mediator can provide data
> >> structures compatible with older minor versions. The value returned to
> >> the guest by FFA_VERSION is always FFA_MY_VERSION, the implementation
> >> version, as required by FF-A.
> >>
> >> FFA_VERSION may be issued multiple times. Negotiation becomes final
> >> only when a non-FFA_VERSION ABI is invoked, in accordance with the
> >> FF-A requirement that the version cannot change once any other ABI has
> >> been used. Before this point, non-FFA_VERSION ABIs are rejected if no
> >> valid version has been provided.
> >>
> >> Once negotiation completes, the context is added to the global FF-A
> >> VM list (when VM-to-VM is enabled) and the version may not be modified
> >> for the lifetime of the VM. All VM-to-VM paths and teardown logic are
> >> updated to use the guest_vers_negotiated flag.
> >>
> >> This prevents partially initialised contexts from using the mediator
> >> and complies with the FF-A 1.2 FFA_VERSION semantics.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> xen/arch/arm/tee/ffa.c         | 115 +++++++++++++++++++++++++--------
> >> xen/arch/arm/tee/ffa_msg.c     |   2 +-
> >> xen/arch/arm/tee/ffa_private.h |  21 ++++--
> >> 3 files changed, 104 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 2b4e24750d52..3309ca875ec4 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -158,40 +158,89 @@ static bool ffa_abi_supported(uint32_t id)
> >>     return !ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> >> }
> >>
> >> -static void handle_version(struct cpu_user_regs *regs)
> >> +static bool ffa_negotiate_version(struct cpu_user_regs *regs)
> >> {
> >>     struct domain *d =3D current->domain;
> >>     struct ffa_ctx *ctx =3D d->arch.tee;
> >> -    uint32_t vers =3D get_user_reg(regs, 1);
> >> -    uint32_t old_vers;
> >> +    uint32_t fid =3D get_user_reg(regs, 0);
> >> +    uint32_t in_vers =3D get_user_reg(regs, 1);
> >> +    uint32_t out_vers =3D FFA_MY_VERSION;
> >>
> >> -    /*
> >> -     * Guest will use the version it requested if it is our major and=
 minor
> >> -     * lower or equals to ours. If the minor is greater, our version =
will be
> >> -     * used.
> >> -     * In any case return our version to the caller.
> >> -     */
> >> -    if ( FFA_VERSION_MAJOR(vers) =3D=3D FFA_MY_VERSION_MAJOR )
> >> -    {
> >> -        spin_lock(&ctx->lock);
> >> -        old_vers =3D ctx->guest_vers;
> >> +    spin_lock(&ctx->guest_vers_lock);
> >>
> >> -        if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
> >> -            ctx->guest_vers =3D FFA_MY_VERSION;
> >> -        else
> >> -            ctx->guest_vers =3D vers;
> >> -        spin_unlock(&ctx->lock);
> >> +    /* Handle FFA_VERSION races from different vCPUs. */
> >> +    if ( ctx->guest_vers_negotiated )
> >> +        goto out_continue;
> >>
> >> -        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !old_vers )
> >> +    if ( fid !=3D FFA_VERSION )
> >> +    {
> >> +        if ( !ctx->guest_vers )
> >>         {
> >> -            /* One more VM with FF-A support available */
> >> -            inc_ffa_vm_count();
> >> -            write_lock(&ffa_ctx_list_rwlock);
> >> -            list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
> >> -            write_unlock(&ffa_ctx_list_rwlock);
> >> +            out_vers =3D 0;
> >> +            goto out_handled;
> >>         }
> >> +
> >> +        /*
> >> +         * A successful FFA_VERSION call does not freeze negotiation.=
 Guests
> >> +         * are allowed to issue multiple FFA_VERSION attempts (e.g. p=
robing
> >> +         * several minor versions). Negotiation becomes final only wh=
en a
> >> +         * non-VERSION ABI is invoked, as required by the FF-A specif=
ication.
> >> +         */
> >> +        if ( !ctx->guest_vers_negotiated )
> >
> > ctx->guest_vers_negotiated is always false here, due to the check above=
.
>
> Absolutely, I will remove the if here so that we set version to negotiate=
d on
> the first pass and do not come back here after.
>
> >
> >> +        {
> >> +            ctx->guest_vers_negotiated =3D true;
> >
> > I'm on thin ice here, but I think that barriers or some other
> > primitives are needed to close the gap if ffa_handle_call() is called
> > concurrently during these conditions:
> > ctx->guest_vers_negotiated =3D=3D false
> > CPU0 called with FFA_VERSION 1.1 -> sets ctx->guest_vers =3D 1.1
> > CPU1 called with a valid FF-A ID !=3D FFA_VERSION -> sets
> > ctx->guest_vers_negotiated =3D true
> > CPU2 called with a valid FF-A ID !=3D FFA_VERSION -> guarantee is
> > missing that CPU2 will observe the updated ctx->guest_vers if it
> > observes the updated ctx->guest_vers_negotiated
>
> Definitely you are right and the combination of guest_vers and
> guest_vers_negotiated has an issue with ordering.
>
> I think the following modification should solve this:
> - remove guest_vers_negotiated and use guest_vers =3D 0 as test for
> version negotiated used with ACCESS_ONCE
> - introduced a guest_vers_tmp only accessed under the lock to store
> the temporary agreed version until negotiation is done
> - during negotiation done copy tmp into guest_vers with a previous
> write barrier before and ACCESS_ONCE to ensure visibility
>
> Tell if that sounds right :-)

That should work. I think we may be able to skip an explicit barrier
or even ACCESS_ONCE since the other CPUs will either see the updated
version or enter ffa_negotiate_version() to take the lock (which
includes a barrier) for synchronized access.

Cheers,
Jens

