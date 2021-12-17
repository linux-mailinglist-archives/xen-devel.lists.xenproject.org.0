Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED14479517
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:51:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248911.429333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myJFL-0007jI-Gn; Fri, 17 Dec 2021 19:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248911.429333; Fri, 17 Dec 2021 19:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myJFL-0007gR-Da; Fri, 17 Dec 2021 19:50:27 +0000
Received: by outflank-mailman (input) for mailman id 248911;
 Fri, 17 Dec 2021 19:50:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6k1w=RC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1myJFJ-0007gL-R2
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:50:25 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9270bec2-5f72-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 20:50:23 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44372)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1myJF9-000y9u-h4 (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 17 Dec 2021 19:50:15 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 089D41FC34;
 Fri, 17 Dec 2021 19:50:14 +0000 (GMT)
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
X-Inumbo-ID: 9270bec2-5f72-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <4382c02a-4207-729b-67b8-c9a8bf65b921@srcf.net>
Date: Fri, 17 Dec 2021 19:50:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
 <20211217233437.13791-3-dpsmith@apertussolutions.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [RFC 02/10] is_system_domain: replace open-coded instances
In-Reply-To: <20211217233437.13791-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/12/2021 23:34, Daniel P. Smith wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> There were several instances of open-coded domid range checking. This commit
> replaces those with the is_system_domain inline function.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Ah - probably my fault.  When I added is_system_domain(), I didn't think
to scan for other opencodes - I was guts deep in the domain creation logic.

In addition to the ones you've got here...

xen/arch/x86/cpu/mcheck/mce.c:1521
xen/common/domain.c:586
common/domctl.c:55, 411 and 421

according to `git grep DOMID_FIRST_RESERVED`

> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> index 8ec4547bed..179f3dcc5a 100644
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -188,7 +188,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
>       * in XENPMU_MODE_ALL, for everyone.
>       */
>      if ( (vpmu_mode & XENPMU_MODE_ALL) ||
> -         (sampled->domain->domain_id >= DOMID_FIRST_RESERVED) )
> +         (is_system_domain(sampled->domain)) )

Can drop one set of brackets now.

> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 28146ee404..1df09bcb77 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -613,6 +613,11 @@ extern struct vcpu *idle_vcpu[NR_CPUS];
>  #define is_idle_domain(d) ((d)->domain_id == DOMID_IDLE)
>  #define is_idle_vcpu(v)   (is_idle_domain((v)->domain))
>  
> +static inline bool is_system_domain_id(domid_t id)
> +{
> +    return (id >= DOMID_FIRST_RESERVED);
> +}
> +
>  static inline bool is_system_domain(const struct domain *d)
>  {
>      return d->domain_id >= DOMID_FIRST_RESERVED;

is_system_domain() wants implementing in terms of is_system_domain_id().

That said, could I talk you into is_system_domid() as a better name?

This is all sufficiently trivial that I'm tempted to fix on commit if
you'd like.  This patch is cleanup that stands on its own merit, and
isn't tied to hyperlaunch specifically.

~Andrew

