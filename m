Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27398BF6C6
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 09:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718614.1121110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4bS2-0001SM-KO; Wed, 08 May 2024 07:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718614.1121110; Wed, 08 May 2024 07:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4bS2-0001Ph-Fs; Wed, 08 May 2024 07:10:54 +0000
Received: by outflank-mailman (input) for mailman id 718614;
 Wed, 08 May 2024 07:10:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vH+U=ML=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s4bS0-0001Pa-Gd
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 07:10:52 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19cf6894-0d0a-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 09:10:51 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5b20c4eda82so1596770eaf.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 00:10:51 -0700 (PDT)
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
X-Inumbo-ID: 19cf6894-0d0a-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715152250; x=1715757050; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi75ktYMuiFMsqMhE3oQ1E3tXNLWFdpqtaKZxL0bRec=;
        b=erJQhViCEd9QV0fz2vryXV4nVp3NxYjn2xEjivpKYM2sZWF5zNhywF3ZD5fyonP/vc
         eNzDrhxKD3KxNz8H9n6UyJdGcWYsm903ollQ172AmaayWA0wHAJy1YCfwRhZc/j3b1Ye
         IfObFOqPjCKllcqzcwIqxbhFLI4hTSQMebmXF0hxCfXf1GuvQvbBaGlKbMICAZXpgm3t
         gZU33DUOwWDVDbN1IKKvS19fmFNmdx0O/V0dqDQZ88rWTgjaqBWtsoC6OHM0TcV2XKrl
         0LoKKieDoclIRpR1qfk4Tz1q1ksODgyfBJ1Sfz8QirRuNMCsaKrToQQ/hctAvyOJUeV4
         PODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715152250; x=1715757050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zi75ktYMuiFMsqMhE3oQ1E3tXNLWFdpqtaKZxL0bRec=;
        b=thRSUBR+FdyW07d42tsx9U4IS+9SQIJj7w9MGG4gWj9E8SldMEkx3tgOJt42d4CXy0
         pO4RWc6lYyc3w6kj9O01O2tNC3c6T3jC8XP5RhiF2LdTOvUPvdIYWts9Fhuh4QF211rO
         lfltoiNAeYjeNloJBnAmq//ybumMBzFp2p9coxJGpkaijMUKj/mLg9tr3U8buzcomLdo
         8zVX9JpXgECtsG70y9ADgwgYB25SbPTVqqykHqX98B5lZlT/PCHhGibTeQ0Anl71mP/2
         6PWyebxItv9ndW+s3oO544hluDFDHuox1ZgPEeXpjrArZ1mbwXVvFKsuxwGpiM7C0qeS
         kKIw==
X-Gm-Message-State: AOJu0Ywz7KtXahw3uLZbtqVRBI2AIWCBAyAtoixm6VdFROyS9h/p4IS1
	5VqYUJLH351ZXODlqwzFtuxkNz1mjMWt9j6Ok4G4I7hR8JVibIc65eFSg7203sx3iNbMnSzWRV3
	MNb0VOdyEAlI1ASoD9FqXP6XGHIVrab0UTs7UQg==
X-Google-Smtp-Source: AGHT+IEtaaIGSPo28NZBXRaOTyHq1x2iLQutmbFpfTb/gbinupTDsQ9DB+58YSI+/LvR3z8YZwXUjTOZo2UMuOaGwM4=
X-Received: by 2002:a4a:8c23:0:b0:5b2:2b9:a502 with SMTP id
 006d021491bc7-5b24d15bd67mr1503817eaf.2.1715152250006; Wed, 08 May 2024
 00:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4SmTy4eWhyN+F+w@mail.gmail.com>
 <b965ee57-c6fc-459f-a5fd-fae47dc6ea9d@suse.com>
In-Reply-To: <b965ee57-c6fc-459f-a5fd-fae47dc6ea9d@suse.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 8 May 2024 09:10:37 +0200
Message-ID: <CAHUa44FsFi0F4tz3jN+d3WkR4dTPJ1HdUru+ME1YQyzMSbMG7Q@mail.gmail.com>
Subject: Re: Referencing domain struct from interrupt handler
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Fri, May 3, 2024 at 12:32=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 03.05.2024 09:45, Jens Wiklander wrote:
> > Hi Xen maintainers,
> >
> > In my patch series [XEN PATCH v4 0/5] FF-A notifications [1] I need to
> > get a reference to a domain struct from a domain ID and keep it from
> > being destroyed while using it in the interrupt handler
> > notif_irq_handler() (introduced in the last patch "[XEN PATCH v4 5/5]
> > xen/arm: ffa: support notification"). In my previous patch set [2] I
> > used get_domain_by_id(), but from the following discussion
> > rcu_lock_live_remote_domain_by_id() seems to be a better choice so
> > that's what I'm using now in the v4 patch set. The domain lock is held
> > during a call to vgic_inject_irq() and unlocked right after.
> >
> > While we're reviewing the patch set in [1] I'd like to check the
> > approach with rcu_lock_live_remote_domain_by_id() here.
> >
> > What do you think? Is using rcu_lock_live_remote_domain_by_id() the
> > best approach?
>
> Is it guaranteed that the IRQ handler won't ever run in the context of a
> vCPU belonging to the domain in question? If not, why the "remote" form
> of the function?

No, that's my mistake.

>
> Furthermore, is it guaranteed that the IRQ handler won't interrupt code
> fiddling with the domain list? I don't think it is, since
> domlist_update_lock isn't acquired in an IRQ-safe manner. Looks like
> you need to defer the operation on the domain until softirq or tasklet
> context.

Thanks for the suggestion, I'm testing it as:
static DECLARE_TASKLET(notif_sri_tasklet, notif_sri_action, NULL);

static void notif_irq_handler(int irq, void *data)
{
    tasklet_schedule(&notif_sri_tasklet);
}

Where notif_sri_action() does what notif_irq_handler() did before
(using rcu_lock_domain_by_id()).

I have one more question regarding this.

Even with the RCU lock if I understand it correctly, it's possible for
domain_kill() to tear down the domain. Or as Julien explained it in
another thread [3]:
> CPU0: ffa_get_domain_by_vm_id() (return the domain as it is alive)
>
> CPU1: call domain_kill()
> CPU1: teardown is called, free d->arch.tee (the pointer is not set to NUL=
L)
>
> d->arch.tee is now a dangling pointer
>
> CPU0: access d->arch.tee
>
> This implies you may need to gain a global lock (I don't have a better
> idea so far) to protect the IRQ handler against domains teardown.

I'm trying to address that (now in a tasklet) with:
    /*
     * domain_kill() calls ffa_domain_teardown() which will free
     * d->arch.tee, but not set it to NULL. This can happen while holding
     * the RCU lock.
     *
     * domain_lock() will stop rspin_barrier() in domain_kill(), unless
     * we're already past rspin_barrier(), but then will d->is_dying be
     * non-zero.
     */
    domain_lock(d);
    if ( !d->is_dying )
    {
        struct ffa_ctx *ctx =3D d->arch.tee;

        ACCESS_ONCE(ctx->notif.secure_pending) =3D true;
    }
    domain_unlock(d);

It seems to work, but I'm worried I'm missing something or abusing
domain_lock(). I can do this in v5 of the patch set if that helps to
see what I mean.

[3] https://patchew.org/Xen/20240426084723.4149648-1-jens.wiklander@linaro.=
org/20240426084723.4149648-6-jens.wiklander@linaro.org/#c7a672a7-02f8-4d24-=
b87e-1b8439d7eb4c@xen.org

Thanks,
Jens

>
> Jan
>
> > [1] https://patchew.org/Xen/20240502145645.1201613-1-jens.wiklander@lin=
aro.org/
> > [2] https://patchew.org/Xen/20240426084723.4149648-1-jens.wiklander@lin=
aro.org/
> >
> > Thanks,
> > Jens
>

