Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248727384B7
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 15:18:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552667.862982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxj3-0003Gp-ER; Wed, 21 Jun 2023 13:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552667.862982; Wed, 21 Jun 2023 13:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxj3-000393-AZ; Wed, 21 Jun 2023 13:18:21 +0000
Received: by outflank-mailman (input) for mailman id 552667;
 Wed, 21 Jun 2023 11:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wbwx=CJ=intel.com=jani.nikula@srs-se1.protection.inumbo.net>)
 id 1qBvqh-0002kk-IW
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 11:18:07 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48e64795-1025-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 13:18:03 +0200 (CEST)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 04:17:58 -0700
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 04:16:58 -0700
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
X-Inumbo-ID: 48e64795-1025-11ee-b236-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687346283; x=1718882283;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=bNOOeYVCQ7poh+/POpUoy8h5Fc7oKKTV5NlBm31y8T8=;
  b=GTQMkg8yX3GS3BRzRBAU2xElsglEmpsLkyU5ksXXmULCIOKAAofkjgaQ
   Y+nH9SiSMCXNlCx6bdBjiP7E0+RNmAMdG/rqazsvqQpIpwHeq3qI1eW2D
   evn145J5ihxK1X9F6KqmEiazfvO3lK6gqQ3h1CzhDdXGYbIQd4MxtX6zE
   6hjllkiWX9/Dxh1WNudiKJ/HmM0Ol/B4/r2b9JSc2NtLKfk2ZHzre7tGQ
   laYAaKrdoxMVqmVnlv18Y38ON1FDxhVg22KuFpp+cY14+TTyKEsk9msNu
   So+azKPMkYdA6Pvdc1EXvEGL88on9jKt/CqRZmMZtofZUx89pEFQi4VqU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="339758042"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="339758042"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="664623042"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="664623042"
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joel Granados <j.granados@samsung.com>, mcgrof@kernel.org, Russell King
 <linux@armlinux.org.uk>, Catalin
	Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael
	Ellerman <mpe@ellerman.id.au>, Heiko Carstens <hca@linux.ibm.com>, Vasily
	Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Andy Lutomirski
 <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 Russ
	Weight <russell.h.weight@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Phillip Potter <phil@philpotter.co.uk>,
 Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Corey
	Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei
	Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Song Liu <song@kernel.org>, Robin Holt
 <robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>, David Ahern
 <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Doug Gilbert <dgilbert@interlog.com>, Jiri
	Slaby <jirislaby@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano
	Stabellini <sstabellini@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Benjamin
	LaHaise <bcrl@kvack.org>, David Howells <dhowells@redhat.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, Chuck
	Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, Jan Kara
 <jack@suse.cz>, Anton Altaparmakov <anton@tuxera.com>, Mark Fasheh
 <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>, Kees Cook <keescook@chromium.org>, Iurii
	Zaikin <yzaikin@google.com>, Eric Biggers <ebiggers@kernel.org>, "Darrick
 J.
 Wong" <djwong@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
	Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Balbir
	Singh <bsingharora@gmail.com>, Eric Biederman <ebiederm@xmission.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 John
	Stultz <jstultz@google.com>, Steven Rostedt <rostedt@goodmis.org>, Andrew
	Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, Naoya Horiguchi
 <naoya.horiguchi@nec.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle
 <ralf@linux-mips.org>, Pablo
	Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Roopa Prabhu <roopa@nvidia.com>, Nikolay
	Aleksandrov <razor@blackwall.org>, Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Steffen Klassert
 <steffen.klassert@secunet.com>, Matthieu Baerts
 <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>,
 Simon
	Horman <horms@verge.net.au>, Julian Anastasov <ja@ssi.bg>, Remi
	Denis-Courmont <courmisch@gmail.com>, Santosh Shilimkar
 <santosh.shilimkar@oracle.com>, Marc Dionne <marc.dionne@auristor.com>,
 Neil
	Horman <nhorman@tuxdriver.com>, Marcelo Ricardo Leitner
 <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Karsten
 Graul <kgraul@linux.ibm.com>, Wenjia Zhang <wenjia@linux.ibm.com>, Jan
 Karcher <jaka@linux.ibm.com>, Jon Maloy <jmaloy@redhat.com>, Ying Xue
 <ying.xue@windriver.com>, Martin Schiller <ms@dev.tdt.de>, John Johansen
 <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James
	Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Jarkko
	Sakkinen <jarkko@kernel.org>
Cc: Joel Granados <j.granados@samsung.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Mike Travis <mike.travis@hpe.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Amir Goldstein
 <amir73il@gmail.com>, Matthew Bobrowski <repnop@google.com>, John
 Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Yonghong Song <yhs@fb.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav
	Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
 <boqun.feng@gmail.com>, John Ogness <john.ogness@linutronix.de>, Dietmar
	Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel
	Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>, Andy Lutomirski
 <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Stephen Boyd
 <sboyd@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-raid@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 linux-aio@kvack.org, linux-cachefs@redhat.com, codalist@coda.cs.cmu.edu,
 linux-mm@kvack.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, bpf@vger.kernel.org,
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-hams@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux-foundation.org,
 dccp@vger.kernel.org, linux-wpan@vger.kernel.org, mptcp@lists.linux.dev,
 lvs-devel@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-afs@lists.infradead.org, linux-sctp@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-x25@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org
Subject: Re: [PATCH 09/11] sysctl: Remove the end element in sysctl table
 arrays
In-Reply-To: <20230621094817.433842-1-j.granados@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230621091000.424843-1-j.granados@samsung.com>
 <CGME20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3@eucas1p2.samsung.com>
 <20230621094817.433842-1-j.granados@samsung.com>
Date: Wed, 21 Jun 2023 14:16:55 +0300
Message-ID: <87o7l92hg8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 21 Jun 2023, Joel Granados <j.granados@samsung.com> wrote:
> Remove the empty end element from all the arrays that are passed to the
> register sysctl calls. In some files this means reducing the explicit
> array size by one. Also make sure that we are using the size in
> ctl_table_header instead of evaluating the .procname element.

Where's the harm in removing the end elements driver by driver? This is
an unwieldy patch to handle.

> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index f43950219ffc..e4d7372afb10 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4884,24 +4884,23 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
>  
>  static struct ctl_table oa_table[] = {
>  	{
> -	 .procname = "perf_stream_paranoid",
> -	 .data = &i915_perf_stream_paranoid,
> -	 .maxlen = sizeof(i915_perf_stream_paranoid),
> -	 .mode = 0644,
> -	 .proc_handler = proc_dointvec_minmax,
> -	 .extra1 = SYSCTL_ZERO,
> -	 .extra2 = SYSCTL_ONE,
> -	 },
> +		.procname = "perf_stream_paranoid",
> +		.data = &i915_perf_stream_paranoid,
> +		.maxlen = sizeof(i915_perf_stream_paranoid),
> +		.mode = 0644,
> +		.proc_handler = proc_dointvec_minmax,
> +		.extra1 = SYSCTL_ZERO,
> +		.extra2 = SYSCTL_ONE,
> +	},
>  	{
> -	 .procname = "oa_max_sample_rate",
> -	 .data = &i915_oa_max_sample_rate,
> -	 .maxlen = sizeof(i915_oa_max_sample_rate),
> -	 .mode = 0644,
> -	 .proc_handler = proc_dointvec_minmax,
> -	 .extra1 = SYSCTL_ZERO,
> -	 .extra2 = &oa_sample_rate_hard_limit,
> -	 },
> -	{}
> +		.procname = "oa_max_sample_rate",
> +		.data = &i915_oa_max_sample_rate,
> +		.maxlen = sizeof(i915_oa_max_sample_rate),
> +		.mode = 0644,
> +		.proc_handler = proc_dointvec_minmax,
> +		.extra1 = SYSCTL_ZERO,
> +		.extra2 = &oa_sample_rate_hard_limit,
> +	}
>  };

The existing indentation is off, but fixing it doesn't really belong in
this patch.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

