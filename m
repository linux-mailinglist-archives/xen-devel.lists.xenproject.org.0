Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9C7607550
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427593.676825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpZ8-00021j-Qa; Fri, 21 Oct 2022 10:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427593.676825; Fri, 21 Oct 2022 10:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpZ8-0001yf-Mj; Fri, 21 Oct 2022 10:47:50 +0000
Received: by outflank-mailman (input) for mailman id 427593;
 Fri, 21 Oct 2022 10:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zhrr=2W=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1olpZ6-0001yZ-Bv
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:47:48 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb39f43e-512d-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 12:47:45 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8DA803200583;
 Fri, 21 Oct 2022 06:47:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 21 Oct 2022 06:47:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 06:47:38 -0400 (EDT)
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
X-Inumbo-ID: cb39f43e-512d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1666349262; x=
	1666435662; bh=BKrThsSHd2dY6s2MvGu8SZPANjCrL3zT8QZ9BWHePeM=; b=h
	nMefmewy13PD7ufHm+auo5FNZfkDji+kfmHpMSYlC5/9Hgj5LkDN9pAymSwCW5P4
	88/4q6hvuFVaw22YZ7xm7cMDuHN+kBKc07GI7cYbPOaQX/XNPGz6WiXMoHS2ghLt
	xGmT18J4K2Aj3AFbexZ4I1q2G3Ykp2aZd8SKyVyCUd5W++S/5vdwqxAr4jw+p6gA
	so/A3C2abF0MgPLgyI3vxPqqZyWRsLc+8iC7eJQTbtbzVnkbn7hU7M3oOq3KTGkM
	cWs8u6sjaM5zM2KusYmwGSKwbdiqcWrR31nS9cfqlKGJflr6vh19IGDnA6BPJlMo
	q+nBnkJhNmCKw4jkQ/FNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666349262; x=1666435662; bh=BKrThsSHd2dY6s2MvGu8SZPANjCr
	L3zT8QZ9BWHePeM=; b=dU4qBwPoV8719JGDkc4835Tl2v6m/d6q+IKHj6L9fv/Q
	Pg4Zof/iNmNryJZ7ycPZPWZUS4xrEJA2jRxyyBUpZ0LiyaMNAfDrdPMREk/5boa1
	SXNC7OxGAJogeyOB6qjbD4ZtFNMQlpvCbkarihmZfmFHjGo5W2mJqHq3Dh3hVIHI
	ZfYZgEbBGRMYQUeMJffRkPg4GGQrcBK7SzGWcB3oKWDiqMRBreTqFFj4Z2ehrgkw
	V2+PZQTCCRTnvRZi/AEHkIheIa15IYaQUZBII7eb49+YOrq7Sou7yAsSIY/zBhZa
	q++iSyzZZbTocb2jbSyEp5CFvtt4TFop7WP5oLquVg==
X-ME-Sender: <xms:zXhSY-dXcDW4gJE85cbRp65-IxUzND2HBszft8hyMZQrxGS3X1dAtw>
    <xme:zXhSY4MTuVLlvK1rGHM9ZU7_Jg_PRNLtnUWeKVnD9EfxLlZyI2kjWwcL8Q6agwjUi
    3ZWe25Rbox_QQ>
X-ME-Received: <xmr:zXhSY_hYeQ5w9PMdpqH0GX2U019QQIvA7zHT4d9tmt0wHqwTHXGdRU7sr5n0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelkedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:zXhSY78dHYkM1n3XmJyR0m6ZUZoi2wMmLbwNboO2B760-lHjVEC11Q>
    <xmx:zXhSY6sId9Q1OGlUvcOfdCBVB2N1_etd4gyyDrF9EqijpgktSWiNJQ>
    <xmx:zXhSYyHvAjE-Haxb_cyHrEDInr1i8R4T_afyTvBcmNnxzWFeNva1Jw>
    <xmx:znhSY4BvkCd5gYeawj_WsSnkN6QUy29mrOm2wGVeo32lWkK4X8-SuQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 21 Oct 2022 12:47:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it
Message-ID: <Y1J4x6gRYXoyo5Mc@mail-itl>
References: <20221021065806.14316-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lD+LUEZELFm9I3Zc"
Content-Disposition: inline
In-Reply-To: <20221021065806.14316-1-jgross@suse.com>


--lD+LUEZELFm9I3Zc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Oct 2022 12:47:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it

On Fri, Oct 21, 2022 at 08:58:06AM +0200, Juergen Gross wrote:
> When the system is coming up after having been suspended,
> restore_vcpu_affinity() is called for each domain in order to adjust
> the vcpu's affinity settings in case a cpu didn't come to live again.
>=20
> The way restore_vcpu_affinity() is doing that is wrong, because the
> specific scheduler isn't being informed about a possible migration of
> the vcpu to another cpu. Additionally the migration is often even
> happening if all cpus are running again, as it is done without check
> whether it is really needed.
>=20
> As cpupool management is already calling cpu_disable_scheduler() for
> cpus not having come up again, and cpu_disable_scheduler() is taking
> care of eventually needed vcpu migration in the proper way, there is
> simply no need for restore_vcpu_affinity().
>=20
> So just remove restore_vcpu_affinity() completely.
>=20
> Fixes: 8a5d50dd0b04 ("xen: sched: simplify ACPI S3 resume path.")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Juergen Gross <jgross@suse.com>

I can only test it on a different configuration right now, but I can
confirm with this patch applied the system survives S3 (and it did
crashed without it at least once on this config).

With the now-unused function (also noticed by Jan) dealt with, you can add =
my:

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>


> ---
>  xen/arch/x86/acpi/power.c |  3 --
>  xen/common/sched/core.c   | 70 ---------------------------------------
>  xen/include/xen/sched.h   |  1 -
>  3 files changed, 74 deletions(-)
>=20
> diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
> index 1bb4d78392..b76f673acb 100644
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -159,10 +159,7 @@ static void thaw_domains(void)
> =20
>      rcu_read_lock(&domlist_read_lock);
>      for_each_domain ( d )
> -    {
> -        restore_vcpu_affinity(d);
>          domain_unpause(d);
> -    }
>      rcu_read_unlock(&domlist_read_lock);
>  }
> =20
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 83455fbde1..358fa077e3 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1196,76 +1196,6 @@ static void sched_reset_affinity_broken(const stru=
ct sched_unit *unit)
>          v->affinity_broken =3D false;
>  }
> =20
> -void restore_vcpu_affinity(struct domain *d)
> -{
> -    unsigned int cpu =3D smp_processor_id();
> -    struct sched_unit *unit;
> -
> -    ASSERT(system_state =3D=3D SYS_STATE_resume);
> -
> -    rcu_read_lock(&sched_res_rculock);
> -
> -    for_each_sched_unit ( d, unit )
> -    {
> -        spinlock_t *lock;
> -        unsigned int old_cpu =3D sched_unit_master(unit);
> -        struct sched_resource *res;
> -
> -        ASSERT(!unit_runnable(unit));
> -
> -        /*
> -         * Re-assign the initial processor as after resume we have no
> -         * guarantee the old processor has come back to life again.
> -         *
> -         * Therefore, here, before actually unpausing the domains, we sh=
ould
> -         * set v->processor of each of their vCPUs to something that will
> -         * make sense for the scheduler of the cpupool in which they are=
 in.
> -         */
> -        lock =3D unit_schedule_lock_irq(unit);
> -
> -        cpumask_and(cpumask_scratch_cpu(cpu), unit->cpu_hard_affinity,
> -                    cpupool_domain_master_cpumask(d));
> -        if ( cpumask_empty(cpumask_scratch_cpu(cpu)) )
> -        {
> -            if ( sched_check_affinity_broken(unit) )
> -            {
> -                sched_set_affinity(unit, unit->cpu_hard_affinity_saved, =
NULL);
> -                sched_reset_affinity_broken(unit);
> -                cpumask_and(cpumask_scratch_cpu(cpu), unit->cpu_hard_aff=
inity,
> -                            cpupool_domain_master_cpumask(d));
> -            }
> -
> -            if ( cpumask_empty(cpumask_scratch_cpu(cpu)) )
> -            {
> -                /* Affinity settings of one vcpu are for the complete un=
it. */
> -                printk(XENLOG_DEBUG "Breaking affinity for %pv\n",
> -                       unit->vcpu_list);
> -                sched_set_affinity(unit, &cpumask_all, NULL);
> -                cpumask_and(cpumask_scratch_cpu(cpu), unit->cpu_hard_aff=
inity,
> -                            cpupool_domain_master_cpumask(d));
> -            }
> -        }
> -
> -        res =3D get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
> -        sched_set_res(unit, res);
> -
> -        spin_unlock_irq(lock);
> -
> -        /* v->processor might have changed, so reacquire the lock. */
> -        lock =3D unit_schedule_lock_irq(unit);
> -        res =3D sched_pick_resource(unit_scheduler(unit), unit);
> -        sched_set_res(unit, res);
> -        spin_unlock_irq(lock);
> -
> -        if ( old_cpu !=3D sched_unit_master(unit) )
> -            sched_move_irqs(unit);
> -    }
> -
> -    rcu_read_unlock(&sched_res_rculock);
> -
> -    domain_update_node_affinity(d);
> -}
> -
>  /*
>   * This function is used by cpu_hotplug code via cpu notifier chain
>   * and from cpupools to switch schedulers on a cpu.
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 557b3229f6..072e4846aa 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1019,7 +1019,6 @@ void vcpu_set_periodic_timer(struct vcpu *v, s_time=
_t value);
>  void sched_setup_dom0_vcpus(struct domain *d);
>  int vcpu_temporary_affinity(struct vcpu *v, unsigned int cpu, uint8_t re=
ason);
>  int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity);
> -void restore_vcpu_affinity(struct domain *d);
>  int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
>                           struct xen_domctl_vcpuaffinity *vcpuaff);
> =20
> --=20
> 2.35.3
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--lD+LUEZELFm9I3Zc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNSeMgACgkQ24/THMrX
1yyHAQgAkNfI118UqI8K4l+iNoRqBx/1N9XlfbfOvFiIfytM8k4BlxJEAzy5TmeE
P132Oi3RQfbZuXjxgTav4u869w7H5pep7EF6TwhVNUlPGDUYU4FwjOOlDxD3b6tF
gpNl+S0nE3SLVP6bUSV9sKfY+ObxjwbfykR29xB/XP2/5icq9u5pX02Tce0SECPH
MGr+WSMP2TBLG2duaJ41SoEfU5PVDBEyPlQtrrCkbiIrOFBtJS4RKXkg0bc4zZiK
E604ZQ+rjhb0i95m7x3gotJnfLkKS8i+bkkDnqVLHkZwxBR73sNPmv//QfyE2lBp
Y6DEAeXIUId1HaNXwL/osOX9CM+gXw==
=e07O
-----END PGP SIGNATURE-----

--lD+LUEZELFm9I3Zc--

