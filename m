Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8115FF26D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 18:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422958.669370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojNly-0003q2-0e; Fri, 14 Oct 2022 16:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422958.669370; Fri, 14 Oct 2022 16:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojNlx-0003n3-TE; Fri, 14 Oct 2022 16:42:57 +0000
Received: by outflank-mailman (input) for mailman id 422958;
 Fri, 14 Oct 2022 16:42:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y2dk=2P=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1ojNlv-0003mx-Qk
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 16:42:56 +0000
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [2607:f8b0:4864:20::e36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f172810-4bdf-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 18:42:53 +0200 (CEST)
Received: by mail-vs1-xe36.google.com with SMTP id p7so5469861vsr.7
 for <xen-devel@lists.xenproject.org>; Fri, 14 Oct 2022 09:42:53 -0700 (PDT)
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
X-Inumbo-ID: 3f172810-4bdf-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wt+V0AcGUrkJBrd79DUopZc6pHSzx6aJRfDTWLn7cSc=;
        b=oo4KrEuoZ3NrkSg+MhFPpK6gOj0yNiatXyHzLv+IfdUhKtLhxxX3JJ3EHgsSAzDPbH
         8p1XuOnwX6B+odUyZCSTLnQGFV3KXzS/7C2rlO42o4jSc0hLQxbjBAgS6tWjBBTtgB/t
         b1k9nkbdg8xxAs4js9PHEsz+LFZBI9u7Df5O4OpYGtIT5G6uuAb5CeH0z6bjVN2x3XDx
         JH3wzSYhAy6tarQYJ9Q2FAFb5m3l0a3rBExfPbK68szGYY7XVp3CvgGK/QVBf1L0Ofj0
         zXB9Yk59BYRF3t2jN+ghUsCHctQNgW/jO5vT2f21iSs/ra6fVBE+jlfq6bk3+TIi9v5l
         xqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wt+V0AcGUrkJBrd79DUopZc6pHSzx6aJRfDTWLn7cSc=;
        b=aKO75/qZZNa71Oi859MbDwWI7JDEF9O72i2Bjvy227VdJ9c9R10Q70TSTCM+5E7sDY
         Dbp2EygOJ+64hDKRnyV+oGUApuXI7IsRPVd5eqWeJ3T0ZAap/Awejhrw3H/JbTV0l6Ja
         Qqc2T4KFUJouiVEYyyeRYJSGR00Jj7N44jNU1Ov/dKPStx+zXwUZiZbRIBfQRemuULci
         m0PYv3sRFPQfGoFR85GWOMj1QbsbSo7wcCYGOchHYyYFD2qE2VX+eSajkLkU7ONJQtqg
         USkUuoj+rxz4TNvk0ZSoIItYalQvKmXMQsv/iGjiEGOu/4S6Myjcj5wZ3IwHT4/7qwBa
         b87w==
X-Gm-Message-State: ACrzQf1Y/8UX59eLv8dTSKcAcR0tqy62SjEmLQ0MTaLHvE01RP4ePIRn
	PIjGWLsDIyfXbKHPadDBbs2NN6qasjWdtOnrTZY=
X-Google-Smtp-Source: AMsMyM50XvsG6U43Q6xZNb7s/q9oFPAnd8MKy+6yvokZChN+au6TXK0wWikh0H7YxTYRvGpbrBCA5DdFPCpqEbFopTE=
X-Received: by 2002:a67:c891:0:b0:398:a7ff:e0f0 with SMTP id
 v17-20020a67c891000000b00398a7ffe0f0mr3240416vsk.22.1665765772147; Fri, 14
 Oct 2022 09:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200323000946.GH18599@mail-itl> <20200929142730.GA25731@mail-itl>
 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com> <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com> <20210131021526.GB6354@mail-itl>
 <YWHDIQC3K8J3LD8+@mail-itl> <YwJZ3X0HpT9w6Veh@mail-itl> <b1df84d5-a1ca-3019-16a7-36d0bb568779@suse.com>
 <YwNTu1fL7uITg0OZ@mail-itl> <YymUZCfLZRWl6xr5@mail-itl>
In-Reply-To: <YymUZCfLZRWl6xr5@mail-itl>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 14 Oct 2022 17:42:40 +0100
Message-ID: <CAFLBxZZUknp80CQx9rhQhD=hzqV+eOR5Me=eyU1sJUHMaMUybg@mail.gmail.com>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.de>, 
	Dario Faggioli <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: multipart/alternative; boundary="00000000000020c10005eb015106"

--00000000000020c10005eb015106
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 11:23 AM Marek Marczykowski-G=C3=B3recki <
marmarek@invisiblethingslab.com> wrote:

>
> I have two (non exclusive) ideas here:
> 1. If old_cpu is actually still available, do not move it at all.
> 2. Use sched_migrate() instead of sched_set_res().
>

Other possibilities:

3.  Make sure that svc->rqd is set to null when the affinity is broken.

Currently on vcpu creation, sched_init_vcpu() expects to set the pcpu; and
it looks like for credit2, the svc->rqd may not be set until the first time
it's woken up (that's the 'if' part of the 'if/else' clause whose 'else'
contains the ASSERT() you're hitting).  If when we broke the CPU affinity
on suspend, we set the runqueues to NULL, then on wake it would "take" the
runqueue assigned by restore_vcpu_affinity().

4. Make sched2_unit_wake() tolerant of pcpus changing under its feet.

#3 would potentially make things more robust, but would require adding some
sort of call-back to notify schedulers that affinity had been broken.  ATM
this might only be used by credit2.

#4 would potentially be dangerous: if some other bit of credit2 code which
assumes the svc->rq is valid.


> Here is the patch that fixes it for me:
> ---8<---
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 83455fbde1c8..dcf202d8b307 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1246,19 +1246,29 @@ void restore_vcpu_affinity(struct domain *d)
>              }
>          }
>
> -        res =3D get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
> +        /* Prefer old cpu if available. */
> +        if ( cpumask_test_cpu(old_cpu, cpumask_scratch_cpu(cpu)) )
> +            res =3D get_sched_res(old_cpu);
> +        else
> +            res =3D get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)))=
;
>          sched_set_res(unit, res);
>
>          spin_unlock_irq(lock);
>
> -        /* v->processor might have changed, so reacquire the lock. */
> -        lock =3D unit_schedule_lock_irq(unit);
> -        res =3D sched_pick_resource(unit_scheduler(unit), unit);
> -        sched_set_res(unit, res);
> -        spin_unlock_irq(lock);
> -
> +        /*
> +         * If different cpu was chosen, it was random, let scheduler do
> proper
> +         * decision.
> +         */
>          if ( old_cpu !=3D sched_unit_master(unit) )
> +        {
> +            /* v->processor might have changed, so reacquire the lock. *=
/
> +            lock =3D unit_schedule_lock_irq(unit);
> +            res =3D sched_pick_resource(unit_scheduler(unit), unit);
> +            sched_migrate(unit_scheduler(unit), unit, res->master_cpu);
> +            spin_unlock_irq(lock);
> +
>              sched_move_irqs(unit);
> +        }
>      }
>
>      rcu_read_unlock(&sched_res_rculock);
> ---8<---
>
> I have several doubts here:
>
> 1. If old_cpu is available, is sched_set_res() needed at all?
> 2. Should both calls be changed to sched_migrate()? Currently I changed
>    only the second one, in case scheduler could be confused about
>    old_cpu not being available anymore.
> 3. Are there any extra locking requirements for sched_migrate() at this
>    stage? The long comment above sched_unit_migrate_start() suggests
>    there might be, but I'm not sure if that's really the case during
>    resume.
> 4. Related to the above - should thaw_domains() be modified to call
>    restore_vcpu_affinity() for all domains first, and unpause only
>    later? That could reduce locking requirements, I guess.
>

Unfortunately this code has had a lot of churn since the last time I really
engaged with it; I'm going to have to come back to this on Monday.

J=C3=BCrgen / Dario, any thoughts?

 -George

--00000000000020c10005eb015106
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 11:23 AM Mare=
k Marczykowski-G=C3=B3recki &lt;<a href=3D"mailto:marmarek@invisiblethingsl=
ab.com">marmarek@invisiblethingslab.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><br>
I have two (non exclusive) ideas here:<br>
1. If old_cpu is actually still available, do not move it at all.<br>
2. Use sched_migrate() instead of sched_set_res().<br></blockquote><div><br=
></div><div>Other possibilities:</div><div><br></div><div>3.=C2=A0 Make sur=
e that svc-&gt;rqd is set to null when the affinity is broken.</div><div><b=
r></div><div>Currently on vcpu creation, sched_init_vcpu() expects to set t=
he pcpu; and it looks like for credit2, the svc-&gt;rqd may not be set unti=
l the first time it&#39;s woken up (that&#39;s the &#39;if&#39; part of the=
 &#39;if/else&#39; clause whose &#39;else&#39; contains the ASSERT() you&#3=
9;re hitting).=C2=A0 If when we broke the CPU affinity on suspend, we set t=
he runqueues to NULL, then on wake it would &quot;take&quot; the runqueue a=
ssigned by restore_vcpu_affinity().</div><div><br></div><div>4. Make sched2=
_unit_wake() tolerant of pcpus changing under its feet.</div><div><br></div=
><div>#3 would potentially make things more robust, but would require addin=
g some sort of call-back to notify schedulers that affinity had been broken=
.=C2=A0 ATM this might only be used by credit2.</div><div><br></div><div>#4=
 would potentially be dangerous: if some other bit of credit2 code which as=
sumes the svc-&gt;rq is valid.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Here is the patch that fixes it for me:<br>
---8&lt;---<br>
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c<br>
index 83455fbde1c8..dcf202d8b307 100644<br>
--- a/xen/common/sched/core.c<br>
+++ b/xen/common/sched/core.c<br>
@@ -1246,19 +1246,29 @@ void restore_vcpu_affinity(struct domain *d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D get_sched_res(cpumask_any(cpumask_scra=
tch_cpu(cpu)));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Prefer old cpu if available. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( cpumask_test_cpu(old_cpu, cpumask_scratch=
_cpu(cpu)) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D get_sched_res(old_cpu);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D get_sched_res(cpumask_an=
y(cpumask_scratch_cpu(cpu)));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sched_set_res(unit, res);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irq(lock);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* v-&gt;processor might have changed, so reac=
quire the lock. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D unit_schedule_lock_irq(unit);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D sched_pick_resource(unit_scheduler(uni=
t), unit);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_set_res(unit, res);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irq(lock);<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If different cpu was chosen, it was ra=
ndom, let scheduler do proper<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* decision.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( old_cpu !=3D sched_unit_master(unit)=
 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* v-&gt;processor might have ch=
anged, so reacquire the lock. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock =3D unit_schedule_lock_irq(=
unit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D sched_pick_resource(unit=
_scheduler(unit), unit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_migrate(unit_scheduler(uni=
t), unit, res-&gt;master_cpu);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irq(lock);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sched_move_irqs(unit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0rcu_read_unlock(&amp;sched_res_rculock);<br>
---8&lt;---<br>
<br>
I have several doubts here:<br>
<br>
1. If old_cpu is available, is sched_set_res() needed at all?<br>
2. Should both calls be changed to sched_migrate()? Currently I changed<br>
=C2=A0 =C2=A0only the second one, in case scheduler could be confused about=
<br>
=C2=A0 =C2=A0old_cpu not being available anymore.<br>
3. Are there any extra locking requirements for sched_migrate() at this<br>
=C2=A0 =C2=A0stage? The long comment above sched_unit_migrate_start() sugge=
sts<br>
=C2=A0 =C2=A0there might be, but I&#39;m not sure if that&#39;s really the =
case during<br>
=C2=A0 =C2=A0resume.<br>
4. Related to the above - should thaw_domains() be modified to call<br>
=C2=A0 =C2=A0restore_vcpu_affinity() for all domains first, and unpause onl=
y<br>
=C2=A0 =C2=A0later? That could reduce locking requirements, I guess.<br></b=
lockquote><div><br></div><div>Unfortunately this code has had a lot of chur=
n since the last time I really engaged with it; I&#39;m going to have to co=
me back to this on Monday.</div><div><br></div><div>J=C3=BCrgen / Dario, an=
y thoughts?<br></div><div><br></div><div>=C2=A0-George=C2=A0</div></div></d=
iv>

--00000000000020c10005eb015106--

