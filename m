Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B97059C0
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 23:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535702.833651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz2TB-0003JW-Ms; Tue, 16 May 2023 21:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535702.833651; Tue, 16 May 2023 21:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz2TB-0003HQ-JY; Tue, 16 May 2023 21:44:33 +0000
Received: by outflank-mailman (input) for mailman id 535702;
 Tue, 16 May 2023 21:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XeCQ=BF=goodmis.org=rostedt@kernel.org>)
 id 1pz2T9-0003HK-OX
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 21:44:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5f8ed1f-f432-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 23:44:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B42C632DB;
 Tue, 16 May 2023 21:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF912C433EF;
 Tue, 16 May 2023 21:44:25 +0000 (UTC)
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
X-Inumbo-ID: d5f8ed1f-f432-11ed-b229-6b7b168915f2
Date: Tue, 16 May 2023 17:44:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: x86@kernel.org, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Juergen Gross
 <jgross@suse.com>, "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
 Alexey Makhalov <amakhalov@vmware.com>, VMware PV-Drivers Reviewers
 <pv-drivers@vmware.com>, Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-pm@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 01/20] x86: move prepare_ftrace_return prototype to
 header
Message-ID: <20230516174422.63e1e942@gandalf.local.home>
In-Reply-To: <20230516193549.544673-2-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
	<20230516193549.544673-2-arnd@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 16 May 2023 21:35:30 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>=20
> On 32-bit builds, the prepare_ftrace_return() function only has a global
> definition, but no prototype before it, which causes a warning:
>=20
> arch/x86/kernel/ftrace.c:625:6: warning: no previous prototype for =E2=80=
=98prepare_ftrace_return=E2=80=99 [-Wmissing-prototypes]
>   625 | void prepare_ftrace_return(unsigned long ip, unsigned long *paren=
t,
>=20
> Move the prototype that is already needed for some configurations into
> a header file where it can be seen unconditionally.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/x86/include/asm/ftrace.h | 3 +++
>  arch/x86/kernel/ftrace.c      | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
> index 5061ac98ffa1..b8d4a07f9595 100644
> --- a/arch/x86/include/asm/ftrace.h
> +++ b/arch/x86/include/asm/ftrace.h

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

