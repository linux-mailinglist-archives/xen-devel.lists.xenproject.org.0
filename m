Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B4D7B71A2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 21:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612318.952200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnkvJ-0004Yl-Ty; Tue, 03 Oct 2023 19:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612318.952200; Tue, 03 Oct 2023 19:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnkvJ-0004W3-QS; Tue, 03 Oct 2023 19:19:13 +0000
Received: by outflank-mailman (input) for mailman id 612318;
 Tue, 03 Oct 2023 19:19:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CxR1=FR=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qnkvJ-0004Vv-4N
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 19:19:13 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9672bc8-6221-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 21:19:09 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 393JIZb5031510
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 3 Oct 2023 15:18:41 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 393JIZVY031508;
 Tue, 3 Oct 2023 12:18:35 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: b9672bc8-6221-11ee-9b0d-b553b5be7939
Date: Tue, 3 Oct 2023 12:18:35 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
 <ZRvQNKyYpLDVTs0i@MacBookPdeRoger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZRvQNKyYpLDVTs0i@MacBookPdeRoger>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Tue, Oct 03, 2023 at 10:26:28AM +0200, Roger Pau Monné wrote:
> On Thu, Sep 28, 2023 at 07:49:18PM -0700, Elliott Mitchell wrote:
> > I'm trying to get FreeBSD/ARM operational on Xen/ARM.  Current issue is
> > the changes with the handling of the shared information page appear to
> > have broken things for me.
> > 
> > With a pre-4.17 build of Xen/ARM things worked fine.  Yet with a build
> > of the 4.17 release, mapping the shared information page doesn't work.
> 
> This is due to 71320946d5edf AFAICT.

Yes.  While the -EBUSY line may be the one triggering, I'm unsure why.
This seems a fairly reasonable change, so I had no intention of asking
for a revert (which likely would have been rejected).  There is also a
real possibility the -EBUSY comes from elsewhere.  Could also be
71320946d5edf caused a bug elsewhere to be exposed.

> > I'm using Tianocore as the first stage loader.  This continues to work
> > fine.  The build is using tag "edk2-stable202211", commit fff6d81270.
> > While Tianocore does map the shared information page, my reading of their
> > source is that it properly unmaps the page and therefore shouldn't cause
> > trouble.
> > 
> > Notes on the actual call is gpfn was 0x0000000000040072.  This is outside
> > the recommended address range, but my understanding is this is supposed
> > to be okay.
> > 
> > The return code is -16, which is EBUSY.
> > 
> > Ideas?
> 
> I think the issue is that you are mapping the shared info page over a
> guest RAM page, and in order to do that you would fist need to create
> a hole and then map the shared info page.  IOW: the issue is not with
> edk2 not having unmapped the page, but with FreeBSD trying to map the
> shared_info over a RAM page instead of a hole in the p2m.  x86
> behavior is different here, and does allow mapping the shared_info
> page over a RAM gfn (by first removing the backing RAM page on the
> gfn).

An interesting thought.  I thought I'd tried this, but since I didn't see
such in my experiments list.  What I had tried was removing all the pages
in the suggested mapping range.  Yet this failed.

Since this seemed reasonable, I've now tried and found it fails.  The
XENMEM_remove_from_physmap call returns 0.

> Ideally we would like to use an unpopulated gfn, but doing so is not
> trivial right now, as the point where the shared_info page is mapped
> we don't yet have an easy way to account for unpopulated regions.
> 
> My suggestion would be to do something like:
> 
> diff --git a/sys/x86/xen/hvm.c b/sys/x86/xen/hvm.c
> index 4122daeaf600..7251bc69ae15 100644
> --- a/sys/x86/xen/hvm.c
> +++ b/sys/x86/xen/hvm.c
> @@ -194,18 +194,20 @@ xen_hvm_init_shared_info_page(void)
>  {
>  	struct xen_add_to_physmap xatp;
>  
> -	if (xen_pv_domain()) {
> -		/*
> -		 * Already setup in the PV case, shared_info is passed inside
> -		 * of the start_info struct at start of day.
> -		 */
> -		return;
> -	}
> -
>  	if (HYPERVISOR_shared_info == NULL) {
> +		struct xen_remove_from_physmap rm = {
> +			.domid = DOMID_SELF,
> +		};
> +		int rc;
> +
>  		HYPERVISOR_shared_info = malloc(PAGE_SIZE, M_XENHVM, M_NOWAIT);
>  		if (HYPERVISOR_shared_info == NULL)
>  			panic("Unable to allocate Xen shared info page");
> +
> +		rm.gpfn = vtophys(HYPERVISOR_shared_info) >> PAGE_SHIFT;
> +		rc = HYPERVISOR_memory_op(XENMEM_remove_from_physmap, &rm);
> +		if (rc != 0)
> +			printf("Failed to remove shared_info GFN: %d\n", rc);
>  	}
>  
>  	xatp.domid = DOMID_SELF;
> 
> But in the long term we should see about initializing the shared_info
> page as part of xenpv_attach().

Didn't even look at the example since I already had ones handy.
Unfortunately this has also failed.  The XENMEM_remove_from_physmap call
returns 0.

If there is a need I can hand off a build of Xen and Tianocore, then let
someone else with better Xen/ARM diagnostics play with it.  Runs about
75MB, someone could place it in a better sharing place if desired.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



