Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7497B8B548B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 11:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713950.1114870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1NeF-0004c8-Ed; Mon, 29 Apr 2024 09:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713950.1114870; Mon, 29 Apr 2024 09:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1NeF-0004ZW-BR; Mon, 29 Apr 2024 09:50:11 +0000
Received: by outflank-mailman (input) for mailman id 713950;
 Mon, 29 Apr 2024 09:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a10X=MC=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s1NeD-0004ZQ-MD
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 09:50:09 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbec7a2e-060d-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 11:50:07 +0200 (CEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5aa27dba8a1so2644939eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 02:50:07 -0700 (PDT)
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
X-Inumbo-ID: dbec7a2e-060d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714384206; x=1714989006; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHR8+YYx5dGRg3GOFhwWOWEzmGokYulG5Lm96GRek2o=;
        b=u2ofRnfF/sNS8+BgA95OpgfDEbMSJcf0JhroJHtQ8orIdmU3SnGn6mnn3DqZGyeDCV
         sudz7WmGQ1tQOhe3v5et8Nfnl6EednpOhrpC13Z4yuZTThAu/2MC1mdGpbWT7HbMeAl4
         1+akFlUc5sup02YDD4lYNeO5xEzQ4+vdtVViNOoC8ffrEcTEFoGpkInTxvWnHwS8t4dQ
         hw7nbERhPiNUqbp97atO3lVhJ+rhSrN3EAlXU5Nd92as5hGeIHxPIBIcisn+jLuTeB4Y
         hfRDKdaGmFvLd5/Qv/m5npv1LpqP4OgVEqZI/8a+6jhJsEAMGPHCF7zdE7O4o0ADgY69
         wqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714384206; x=1714989006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHR8+YYx5dGRg3GOFhwWOWEzmGokYulG5Lm96GRek2o=;
        b=AH8RIgZcVU1WQlv1fIRRSzOu8ep+1QZKahGlrVthEdWYOtABCR+JtBkjQe5/QqOiWU
         Xx8D+W7JYt8uJWyOOERdvGr2pE1ovRKSos4zOQ83/PSlm0PlxQIGh4WfqybdxHVzTJ7X
         7JtHl03ZNXtC2+hO13KVuormth/1Vix1c67+lGQ9zzVIXzCJW7MTs7jYR4dWk6tjBb2n
         X/FgemBzuh9XQ2F37N8kSsMARhUN8rFcLBeiuwqm/VXZjVqhT7tUQUbJPcsp4HrIEcoD
         YE3xpS0IG/OHKi8HIeb3rCSZLq3PBactrO3osxXiZ6X1OQATOR+0CbTIdJ67VC6/yQta
         pDWA==
X-Forwarded-Encrypted: i=1; AJvYcCVDZ3k3VJP9Pyfd8nYOaAubwX1jagvwwJvTX1HlK5Fhl+pVM7JZI4LTTdKiir6YfsL0YKu7X4jx895n1EQxxfzXpwzSiA5ZuiIOegTDtNE=
X-Gm-Message-State: AOJu0YwQtosui48QoLk3JDSN3SS7pAN+bvwD1OC/2n9stwZ7r5dcNx59
	3RmUymgTrhgmChyeN4P2pG1tumOheT4PbShC2WnXPSs0/mIhxEC9HUwMxYfhn011YD3uOGTb5HJ
	utxdzq+qQjiKaXBGx+mDegl8MUlHr60BKoDIjSA==
X-Google-Smtp-Source: AGHT+IEcVDkTz0if5+nAL2XzXsNQCtJmK5A8MyTisU6+xtPZQCpoRyYrOX+EUO/SEK1yAOGdQYd4Znkl0rb4kQQKq9g=
X-Received: by 2002:a4a:ae8d:0:b0:5ac:9f37:3ef4 with SMTP id
 u13-20020a4aae8d000000b005ac9f373ef4mr12233559oon.4.1714384205975; Mon, 29
 Apr 2024 02:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org> <c7a672a7-02f8-4d24-b87e-1b8439d7eb4c@xen.org>
 <1A23083C-9605-4291-AF2F-5891AF270333@arm.com>
In-Reply-To: <1A23083C-9605-4291-AF2F-5891AF270333@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 29 Apr 2024 11:49:54 +0200
Message-ID: <CAHUa44HdmxV4oBeYu4rX89sFm7_NQcwza3Eotme9Z5g7EDRQew@mail.gmail.com>
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Apr 29, 2024 at 9:20=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
[...]
> >> +static void notif_irq_handler(int irq, void *data)
> >> +{
> >> +    const struct arm_smccc_1_2_regs arg =3D {
> >> +        .a0 =3D FFA_NOTIFICATION_INFO_GET_64,
> >> +    };
> >> +    struct arm_smccc_1_2_regs resp;
> >> +    unsigned int id_pos;
> >> +    unsigned int list_count;
> >> +    uint64_t ids_count;
> >> +    unsigned int n;
> >> +    int32_t res;
> >> +
> >> +    do {
> >> +        arm_smccc_1_2_smc(&arg, &resp);
> >> +        res =3D ffa_get_ret_code(&resp);
> >> +        if ( res )
> >> +        {
> >> +            if ( res !=3D FFA_RET_NO_DATA )
> >> +                printk(XENLOG_ERR "ffa: notification info get failed:=
 error %d\n",
> >> +                       res);
> >> +            return;
> >> +        }
> >> +
> >> +        ids_count =3D resp.a2 >> FFA_NOTIF_INFO_GET_ID_LIST_SHIFT;
> >> +        list_count =3D ( resp.a2 >> FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT=
 ) &
> >> +                     FFA_NOTIF_INFO_GET_ID_COUNT_MASK;
> >> +
> >> +        id_pos =3D 0;
> >> +        for ( n =3D 0; n < list_count; n++ )
> >> +        {
> >> +            unsigned int count =3D ((ids_count >> 2 * n) & 0x3) + 1;
> >> +            struct domain *d;
> >> +
> >> +            d =3D ffa_get_domain_by_vm_id(get_id_from_resp(&resp, id_=
pos));
> >
> > Thinking a bit more about the question from Bertrand about get_domain_i=
d() vs rcu_lock_domain_by_id(). I am actually not sure whether either are o=
k here.
> >
> > If I am not mistaken, d->arch.tee will be freed as part of the domain t=
eardown process. This means you can have the following scenario:
> >
> > CPU0: ffa_get_domain_by_vm_id() (return the domain as it is alive)
> >
> > CPU1: call domain_kill()
> > CPU1: teardown is called, free d->arch.tee (the pointer is not set to N=
ULL)
> >
> > d->arch.tee is now a dangling pointer
> >
> > CPU0: access d->arch.tee
> >
> > This implies you may need to gain a global lock (I don't have a better =
idea so far) to protect the IRQ handler against domains teardown.
> >
> > Did I miss anything?
>
> I think you are right which is why I was thinking to use rcu_lock_live_re=
mote_domain_by_id to only get a reference
> to the domain if it is not dying.
>
> From the comment in sched.h:
> /*
>  * rcu_lock_domain_by_id() is more efficient than get_domain_by_id().
>  * This is the preferred function if the returned domain reference
>  * is short lived,  but it cannot be used if the domain reference needs
>  * to be kept beyond the current scope (e.g., across a softirq).
>  * The returned domain reference must be discarded using rcu_unlock_domai=
n().
>  */
>
> Now the question of short lived should be challenged but I do not think w=
e can
> consider the current code as "long lived".
>
> It would be a good idea to start a mailing list thread discussion with ot=
her
> maintainers on the subject to confirm.
> @Jens: as i will be off for some time, would you mind doing it ?

Sure, first I'll send out a new patch set with the current comments
addressed. I'll update to use rcu_lock_live_remote_domain_by_id() both
because it makes more sense than the current code, and also to have a
good base for the discussion.

Thanks,
Jens

