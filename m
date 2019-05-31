Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57D30CC9
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 12:44:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWexP-0002kv-8c; Fri, 31 May 2019 10:40:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=agGR=T7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hWexO-0002kq-3e
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:40:18 +0000
X-Inumbo-ID: 784b0948-8390-11e9-ad98-c3e3f4241c93
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 784b0948-8390-11e9-ad98-c3e3f4241c93;
 Fri, 31 May 2019 10:40:13 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Fri, 31 May 2019 12:40:12 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Fri, 31 May 2019 11:39:58 +0100
Message-ID: <c643070357faa43b056e9a4a1eac486749a0920b.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
Date: Fri, 31 May 2019 12:39:57 +0200
In-Reply-To: <1559267880-27863-1-git-send-email-chenbaodong@mxnavi.com>
References: <1559267880-27863-1-git-send-email-chenbaodong@mxnavi.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen: make keyhanler configurable
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============3775716547341168635=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3775716547341168635==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xQZ2scM6DOWRKXCj6Z0H"


--=-xQZ2scM6DOWRKXCj6Z0H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-05-31 at 09:58 +0800, Baodong Chen wrote:
> keyhandler mainly used for debug usage by developers which can dump
> xen module(eg. timer, scheduler) status at runtime by input
> character from console.
>=20
> Signed-off-by: Baodong Chen <chenbaodong@mxnavi.com>
> ---

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -368,4 +368,13 @@ config DOM0_MEM
> =20
>  	  Leave empty if you are not sure what to specify.
> =20
> +config HAS_KEYHANDLER
> +	bool "Enable/Disable keyhandler"
> +	default y
> +	---help---
> +	  Enable or disable keyhandler function.
> +	  keyhandler mainly used for debug usage by developers which
> can dump
> +	  xen module(eg. timer, scheduler) status at runtime by input
> character
> +	  from console.
> +
>  endmenu
>
I personally like the idea.

I've probably would have called the option CONFIG_KEYHANDLERS, even if
I can see that we have quite a few CONFIG_HAS_*.

But it's not for me to ask/decide, and I don't have a too strong
opinion on this anyway, so let's hear what others think.

I'd at least add the 'S', though (as in CONFIG_HAS_KEYHANDLERS).


> --- a/xen/common/cpupool.c
> +++ b/xen/common/cpupool.c
> @@ -699,6 +699,7 @@ int cpupool_do_sysctl(struct
> xen_sysctl_cpupool_op *op)
>      return ret;
>  }
> =20
> +#ifdef CONFIG_HAS_KEYHANDLER
>  void dump_runq(unsigned char key)
>  {
>      unsigned long    flags;
> @@ -730,6 +731,7 @@ void dump_runq(unsigned char key)
>      local_irq_restore(flags);
>      spin_unlock(&cpupool_lock);
>  }
> +#endif
> =20
>  static int cpu_callback(
>      struct notifier_block *nfb, unsigned long action, void *hcpu)

> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
> @@ -1913,6 +1913,7 @@ void scheduler_free(struct scheduler *sched)
>      xfree(sched);
>  }
> =20
> +#ifdef CONFIG_HAS_KEYHANDLER
>  void schedule_dump(struct cpupool *c)
>  {
>      unsigned int      i;
> @@ -1941,6 +1942,7 @@ void schedule_dump(struct cpupool *c)
>              SCHED_OP(sched, dump_cpu_state, i);
>      }
>  }
> +#endif
> =20
>  void sched_tick_suspend(void)
>  {
Mmm... a lot of #ifdef-fery spread around quite a bit.. I have to admit
I don't especially like that.

> --- a/xen/include/xen/keyhandler.h
> +++ b/xen/include/xen/keyhandler.h
> @@ -48,4 +49,17 @@ void register_irq_keyhandler(unsigned char key,
>  /* Inject a keypress into the key-handling subsystem. */
>  extern void handle_keypress(unsigned char key, struct cpu_user_regs
> *regs);
> =20
> +#else
> +static inline void initialize_keytable(void) {}
> +static inline void register_keyhandler(unsigned char key,
> keyhandler_fn_t *fn,
> +                                       const char *desc, bool_t
> diagnostic) {}
> +static inline void register_irq_keyhandler(unsigned char key,
> +                                           irq_keyhandler_fn_t *fn,
> +                                           const char *desc,
> +                                           bool_t diagnostic) {}
> +
> +static inline void handle_keypress(unsigned char key,
> +                                   struct cpu_user_regs *regs) {}
>
So, with this last change, we have:

static DECLARE_TASKLET(keypress_tasklet, keypress_action, 0);

But since all keypress_action() does is calling handle_keypress(),
which is becoming a nop... can't we kill the tasklet alltogether?


> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -171,8 +171,10 @@ extern unsigned int tainted;
>  extern char *print_tainted(char *str);
>  extern void add_taint(unsigned int taint);
> =20
> +#ifdef CONFIG_HAS_KEYHANDLER
>  struct cpu_user_regs;
>  void dump_execstate(struct cpu_user_regs *);
> +#endif
>
Yes. Or, you provide an empty stub of dump_execstate(), if
CONFIG_HAS_KEYHANDLER is not defined, which means we don't have to mess
with #ifdef-s at the caller site(s).

Of course, I'm not maintainer of this specific piece of code, but I'd
prefer this stub-based approach to be used in general.... ... ...
=20
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -994,8 +994,10 @@ int cpupool_add_domain(struct domain *d, int
> poolid);
>  void cpupool_rm_domain(struct domain *d);
>  int cpupool_move_domain(struct domain *d, struct cpupool *c);
>  int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
> +#ifdef CONFIG_HAS_KEYHANDLER
>  void schedule_dump(struct cpupool *c);
>  extern void dump_runq(unsigned char key);
> +#endif
> =20
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
> =20
... ... ... Like, for instance, in here.

But again, sine these changes are spread around many files, let's see
what others prefer, and use the same strategy everywhere.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-xQZ2scM6DOWRKXCj6Z0H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzxBH0ACgkQFkJ4iaW4
c+4W2Q/+NGbVpLf9rjWrsjm0bFtCSfV6eHKIQEFEiELBK+Xpg9VWBVAQ5P4eaiTs
cMew3ipj9Itj2H2b1tUak58tu1j5mNYGrDyoL9JZTwmhjTVhh22Jo8cL3qKgmoJK
gmmqN4me8kGwqIui76Sn7T9bear3BdyE/PcV1f2+jpDFMVdoGyrGKk40TIgxtSHu
9sL4rb6Sla1vkZCtVd/3Yk1TyMzNERGitsCiD5pOlVyrrCwCr0XJAyzTx39G/qRi
hHsfcBwfrq6GjEaV5FuzgdtdRVfAHPNJMMtYrNeDuLN0oEX5UGb5ZCCniWDJyP8N
Vezb00rSwoWJcSjri+HZUxnkyaJQIOG3dZdg/2r2+CUybmMglVPNke6HpSDyk1rS
hd8EaXefhJtpNuJ7Bir56ieP3+3bKXN98jMe0mr9/m1I2ESoXdV0aDQPPx8JYMlD
NG8bHQWcSuLH2NUCnm3wOtE7Yp6IzmKglOFbDvWy6izk6BiqduiEzXRT4dWFMFKT
7aKGjHylMQpALgwnB2oSghlkgNqO39irtp0Xnmu4edcPE3mjUuw3I95nUVKhv7wa
MGW+XWbvd828RajKaGGhO82acMal9sAlqpss9dQ1WsvpnyINEWVWQMuX8Kslh3KC
pcHTAv9XgztX84sYuHXik6aMjYs/tKl20JDZSGNGd6LeC8vAIp8=
=2Ogz
-----END PGP SIGNATURE-----

--=-xQZ2scM6DOWRKXCj6Z0H--



--===============3775716547341168635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3775716547341168635==--


