Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A935ACB0
	for <lists+xen-devel@lfdr.de>; Sat, 10 Apr 2021 12:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107994.206524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVAbh-0000yg-3K; Sat, 10 Apr 2021 10:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107994.206524; Sat, 10 Apr 2021 10:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVAbg-0000xy-Tj; Sat, 10 Apr 2021 10:12:48 +0000
Received: by outflank-mailman (input) for mailman id 107994;
 Fri, 09 Apr 2021 22:40:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oZlh=JG=alpha.franken.de=tsbogend@srs-us1.protection.inumbo.net>)
 id 1lUznw-0006Mo-4n
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 22:40:44 +0000
Received: from elvis.franken.de (unknown [193.175.24.41])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3a3e17f6-9b01-45cc-b713-be8e006fd93a;
 Fri, 09 Apr 2021 22:40:42 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lUznc-00038n-01; Sat, 10 Apr 2021 00:40:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id EDAA4C24FC; Sat, 10 Apr 2021 00:39:11 +0200 (CEST)
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
X-Inumbo-ID: 3a3e17f6-9b01-45cc-b713-be8e006fd93a
Date: Sat, 10 Apr 2021 00:39:11 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexander Lobakin <alobakin@pm.me>, Wei Liu <wei.liu@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>, Mike Rapoport <rppt@kernel.org>,
	Corey Minyard <cminyard@mvista.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Vasily Gorbik <gor@linux.ibm.com>,
	"Jason J. Herne" <jjherne@linux.ibm.com>,
	Joerg Roedel <jroedel@suse.de>,
	Michael Kelley <mikelley@microsoft.com>,
	Joe Perches <joe@perches.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Scott Branden <scott.branden@broadcom.com>,
	Olof Johansson <olof@lixom.net>,
	Mihai Carabas <mihai.carabas@oracle.com>,
	Wang Wenhu <wenhu.wang@vivo.com>,
	Marek Czerski <ma.czerski@gmail.com>,
	Hongbo Yao <yaohongbo@huawei.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Alexander Egorenkov <egorenar@linux.ibm.com>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Steven Rostedt (VMware)" <rostedt@goodmis.org>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-hyperv@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
	openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
	linux-edac@vger.kernel.org, coresight@lists.linaro.org,
	linux-leds@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	netdev@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-arch@vger.kernel.org, kexec@lists.infradead.org,
	rcu@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Richard Henderson <rth@twiddle.net>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Corey Minyard <minyard@acm.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>, Alex Elder <elder@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Jens Frederich <jfrederich@gmail.com>,
	Daniel Drake <dsd@laptop.org>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Iurii Zaikin <yzaikin@google.com>,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <20210409223911.GA21445@alpha.franken.de>
References: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 09, 2021 at 01:02:50PM +0300, Andy Shevchenko wrote:
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
> 
> There are several purposes of doing this:
> - dropping dependency in bug.h
> - dropping a loop by moving out panic_notifier.h
> - unload kernel.h from something which has its own domain
> 
> At the same time convert users tree-wide to use new headers, although
> for the time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Kees Cook <keescook@chromium.org>
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> v2:
>  - fixed all errors with allmodconfig on x86_64 (Andrew)
>  - checked with allyesconfig on x86_64
>  - additionally grepped source code for panic notifier list usage
>    and converted all users
>  - elaborated commit message (Luis)
>  - collected given tags (incl. Andrew's SoB, see below)
> 
> I added Andrew's SoB since part of the fixes I took from him. Andrew,
> feel free to amend or tell me how you want me to do.
> 
>  arch/mips/kernel/relocate.c                   |  1 +
>  arch/mips/sgi-ip22/ip22-reset.c               |  1 +
>  arch/mips/sgi-ip32/ip32-reset.c               |  1 +

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

