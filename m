Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1880C087C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:23:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDs4E-0003xE-3u; Fri, 27 Sep 2019 15:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDs4C-0003x4-Ip
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:21:56 +0000
X-Inumbo-ID: 89ecd912-e13a-11e9-967e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 89ecd912-e13a-11e9-967e-12813bfff9fa;
 Fri, 27 Sep 2019 15:21:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C879AB7D;
 Fri, 27 Sep 2019 15:21:54 +0000 (UTC)
Message-ID: <ac88e8f0ced860d2af4d8f391408262684ef1f81.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 17:21:52 +0200
In-Reply-To: <20190927070050.12405-35-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-35-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 34/46] xen/sched: add fall back to idle
 vcpu when scheduling unit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2850696196577875529=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2850696196577875529==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qLT958UtIiGEix0DSgm6"


--=-qLT958UtIiGEix0DSgm6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> When scheduling an unit with multiple vcpus there is no guarantee all
> vcpus are available (e.g. above maxvcpus or vcpu offline). Fall back
> to
> idle vcpu of the current cpu in that case. This requires to store the
> correct schedule_unit pointer in the idle vcpu as long as it used as
> fallback vcpu.
>=20
> In order to modify the runstates of the correct vcpus when switching
> schedule units merge sched_unit_runstate_change() into
> sched_switch_units() and loop over the affected physical cpus instead
> of the unit's vcpus. This in turn requires an access function to the
> current variable of other cpus.
>=20
> Today context_saved() is called in case previous and next vcpus
> differ
> when doing a context switch. With an idle vcpu being capable to be a
> substitute for an offline vcpu this is problematic when switching to
> an idle scheduling unit. An idle previous vcpu leaves us in doubt
> which
> schedule unit was active previously, so save the previous unit
> pointer
> in the per-schedule resource area. If it is NULL the unit has not
> changed and we don't have to set the previous unit to be not running.
>=20
> When running an idle vcpu in a non-idle scheduling unit use a
> specific
> guest idle loop not performing any non-softirq tasklets and
> livepatching in order to avoid populating the cpu caches with memory
> used by other domains (as far as possible). Softirqs are considered
> to
> be save.
>=20
> In order to avoid livepatching when going to guest idle another
> variant of reset_stack_and_jump() not calling
> check_for_livepatch_work
> is needed.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Julien Grall <julien.grall@arm.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

With one request.

> @@ -279,21 +293,11 @@ static inline void vcpu_runstate_change(
>      v->runstate.state =3D new_state;
>  }
> =20
> -static inline void sched_unit_runstate_change(struct sched_unit
> *unit,
> -    bool running, s_time_t new_entry_time)
> +void sched_guest_idle(void (*idle) (void), unsigned int cpu)
>  {
> -    struct vcpu *v;
> -
> -    for_each_sched_unit_vcpu ( unit, v )
> -    {
> -        if ( running )
> -            vcpu_runstate_change(v, v->new_state, new_entry_time);
> -        else
> -            vcpu_runstate_change(v,
> -                ((v->pause_flags & VPF_blocked) ? RUNSTATE_blocked :
> -                 (vcpu_runnable(v) ? RUNSTATE_runnable :
> RUNSTATE_offline)),
> -                new_entry_time);
> -    }
> +    atomic_inc(&per_cpu(sched_urgent_count, cpu));
> +    idle();
> +    atomic_dec(&per_cpu(sched_urgent_count, cpu));
>  }
> =20
So, I recall that during review of v1, there was a discussion about why
we were marking this as urgent. You said it was to avoid latencies,
which makes sense. Jan said this is a policy that should be set
elsewhere, which also makes sense.

Ideally, we'd check with specific tests and benchmark whether playing
with the urgent counter in here is really necessary/good. That was, in
fact, my plan, but I did not got round to actually doing that.

So, can we have a comment stating the reason why we're doing this? I'd
like for that information not to be lost in a random email thread on
xen-devel. And that would also remind us (me? :-P) to actually go and
check things with actual benchmarks, at some point.

I'd be fine if such comment would come from a follow-up patch, (as,
since it will only add comments, I expect it can go in during the
freeze).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-qLT958UtIiGEix0DSgm6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OKREACgkQFkJ4iaW4
c+51zRAA2GT/VYZAxvuBULnVlsif3yoKzwDg6aOhTCE29nf6IuwbYzzKD1TClVdb
TFRp+EHB6H4HHxWOzuIluBoIuEv/BNiHLWjRnNozFa4FuJj6+BmhIVhdulPFQF85
SpEypUUX1SkfGZOLBvYeYriTvDqwXLSq/zdMRkVzLMcvIDvs608ZBtlyaTR5CGw/
4Cj7AcqOEe/4fwQo0oi9CThLidEh08YMMspZQMEVPe4sNcF4uXnvVqTC+Cl60p+F
GcDMf7CKiZNVnLsKwSOcE8htqfFBOEQ2Z9ybez+78MNOeL+NidRl8LbTNgYLyVDE
ibJ+bk7KmC1/ZnrroL0i8krqZ0UaHlmDBCW/bGh+3L1XEn1+BQCQ3tFCJzQC9RrM
Yxkampa3eyT40oMReNt5JzdnznJzmU/86xURyg1lVMlBPBz9qFHTaUFwXbvIzRLl
6DxCZx83dRON1atmyyU/CAGfPhsCjHFssM37br3/wEjyMXhwq9CtOxAVOYH5rBPz
v6VqHtOiRrJOuSKV4G+hMKiRuShQY/6IEsgKM+K6giKbnAbZ271OP5r8VJTn10v0
ee01IVD/7UrcL6qy+klkN488HGWzHbSFBl9rEMfutDb2i1IPXhpAmPil2CRFaKFc
PMUbG1CloV0Srr08KsiC7p1hl47YdErz5p/rxNUmwbr6+KP0IQw=
=fN8V
-----END PGP SIGNATURE-----

--=-qLT958UtIiGEix0DSgm6--



--===============2850696196577875529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2850696196577875529==--


