Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF673BB81
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 17:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554380.865538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCiaO-0003sz-U9; Fri, 23 Jun 2023 15:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554380.865538; Fri, 23 Jun 2023 15:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCiaO-0003pn-RW; Fri, 23 Jun 2023 15:20:32 +0000
Received: by outflank-mailman (input) for mailman id 554380;
 Fri, 23 Jun 2023 15:20:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qeel=CL=suse.com=pmladek@srs-se1.protection.inumbo.net>)
 id 1qCiaM-0003ph-KQ
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 15:20:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c0c023f-11d9-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 17:20:28 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D24151F45F;
 Fri, 23 Jun 2023 15:20:27 +0000 (UTC)
Received: from suse.cz (pmladek.udp.ovpn2.prg.suse.de [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1AE602C141;
 Fri, 23 Jun 2023 15:20:22 +0000 (UTC)
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
X-Inumbo-ID: 7c0c023f-11d9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687533627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1mTZQB6E8gpW9xyv3IdX7kwRMApo1npl8Ta69cylcgI=;
	b=cw+6g9R2o/Umv74/BGjs0HZFU73NXkDTjRhAwElwD9yLjkG2loVWkX98zsq+Jw9f7GWEbv
	1LhcZAdPyuPlH6OaETf856CLkRN01mJSpFOO8X/jovaGWHnPkt2fDQYbq4M0K8/oavd3Ir
	XsYDO2FS6i0HJDFn6EWyGK6+OhLducU=
Date: Fri, 23 Jun 2023 17:20:17 +0200
From: Petr Mladek <pmladek@suse.com>
To: Joel Granados <j.granados@samsung.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mcgrof@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Benjamin LaHaise <bcrl@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Balbir Singh <bsingharora@gmail.com>,
	Eric Biederman <ebiederm@xmission.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Amir Goldstein <amir73il@gmail.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, Mark Rutland <mark.rutland@arm.com>,
	Miaohe Lin <linmiaohe@huawei.com>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	bpf@vger.kernel.org, kexec@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 08/11] sysctl: Add size to register_sysctl_init
Message-ID: <ZJW4MdIvrWjbKtVy@alley>
References: <20230621091000.424843-1-j.granados@samsung.com>
 <CGME20230621091037eucas1p188e11d8064526a5a0549217d5a419647@eucas1p1.samsung.com>
 <20230621091000.424843-9-j.granados@samsung.com>
 <2023062150-outbound-quiet-2609@gregkh>
 <20230621131552.pqsordxcjmiopciq@localhost>
 <fc37eccc-b9b3-d888-6b57-78cd61986a11@kernel.org>
 <20230622140021.g3odhui75ybwuai5@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622140021.g3odhui75ybwuai5@localhost>

On Thu 2023-06-22 16:00:21, Joel Granados wrote:
> On Thu, Jun 22, 2023 at 06:21:48AM +0200, Jiri Slaby wrote:
> > On 21. 06. 23, 15:15, Joel Granados wrote:
> > > On Wed, Jun 21, 2023 at 12:47:58PM +0200, Greg Kroah-Hartman wrote:
> > > > On Wed, Jun 21, 2023 at 11:09:57AM +0200, Joel Granados wrote:
> > > > >   static int __init random_sysctls_init(void)
> > > > >   {
> > > > > -	register_sysctl_init("kernel/random", random_table);
> > > > > +	register_sysctl_init("kernel/random", random_table,
> > > > > +			     ARRAY_SIZE(random_table));
> > > > 
> > > > As mentioned before, why not just do:
> > > > 
> > > > #define register_sysctl_init(string, table)	\
> > > > 	__register_sysctl_init(string, table, ARRAY_SIZE(table);
> > > Answered you in the original mail where you suggested it.
> > 
> > I am curious what that was, do you have a link?
> of course. I think you will find it here https://lore.kernel.org/all/20230621123816.ufqbob6qthz4hujx@localhost/

Let me to copy the answer here:

<paste>
I considered this at the outset, but it will not work with callers that
use a pointer instead of the actual array.
Additionally, we would not avoid big commits as we would have to go
looking in all the files where register is called directly or indirectly
and make sure the logic is sound.
</paste>

For the callers using a pointer. A solution would be to create another
wrapper which would take the array size, e.g.

#define register_sysctl_init_limited(string, table, size)	\
	__register_sysctl_init(string, table, size);


And ARRAY_SIZE() is defined in include/linux/kernel.h as:

#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))

It will create a compiler error when either an array[] or *array is
passed.

When using this:

1. The compiler will tell us where the other wrapper is needed.

2. Some locations might need the @size parameter even when a static
   array is passed. For example, neigh_sysctl_register() terminates
   the array early.

   But this will work when __register_sysctl_init() supports
   both ways.I mean that it will stop either on @size or empty
   element, as discussed in the other subthread.

   This should be caught when the final "empty" is removed
   from the particular caller.

Best Regards,
Petr

