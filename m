Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785176F6CE0
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:24:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529752.824493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYw6-0000WL-1I; Thu, 04 May 2023 13:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529752.824493; Thu, 04 May 2023 13:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYw5-0000Tp-U3; Thu, 04 May 2023 13:23:53 +0000
Received: by outflank-mailman (input) for mailman id 529752;
 Thu, 04 May 2023 13:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XYMk=AZ=citrix.com=prvs=481980579=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puYw4-0000SC-DT
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:23:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e813e0cf-ea7e-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 15:23:51 +0200 (CEST)
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
X-Inumbo-ID: e813e0cf-ea7e-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683206631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/pvEq/xZicrqe/jwH85spYOYRNCODnIg5BSH4wsVGzc=;
  b=Q4/eDSd3c2ItnxLGYWt0z7h9BvTejdvIfBcyxEfZ51J6rTdatfSLCO59
   CzgFv/NwOQlTb1P9cQp/kNslloGooJa2Lpzk9X77zN4YRlih2gOpBjnDj
   8Nq0AqVaadBikmhPc+QiMIxe/vZlafHxbr2Lvh0nqpmMCAvZL4l1ayskz
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107748272
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:948xPaOPQ9hc62fvrR3al8FynXyQoLVcMsEvi/4bfWQNrUok3zVRy
 2BLCmDSO6rcZWX3e4pwat7joUMD657czNdrHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5gBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vRQIH1+y
 dNBEgIMay6boOSu56K+UPY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXSGpoJzhzH/
 Aoq+UzlXC4kZYOY7Aa9qE/zg8TqgAqkUYENQejQGvlC3wTImz175ActfUS/iem0jFakXNBSI
 FBS/TAhxYA77EGxR8PxdwG5qnWD+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsXywk/+nfj9gJvBPKcM5EFraSntjvBmSlq
 9yVlxTSl4n/nOZSifXgpQmd023zznTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5J+i8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510nfO5SYy8DqiLP4cmjn1NSeN61Hs2OR74M57FySDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17ILHMhsWnDuJLbiilkTP7FZrTCLNIVvzGAfUP79RAWLtiFm9z
 uuzwOPQl00FCLOkOXa/HEx6BQliEEXXzKve86R/HtNv6CI/cI39I5c9GY8cRrE=
IronPort-HdrOrdr: A9a23:7N5aD6qMMpAyQkxcl8ZjXIoaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: 9a23:mLhtnGM8gkpiE+5DSg5G6H4oNZkfQHzY8m/3JVefGWNzV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AfLdoPg1klOxh+1mii7qGBMvHrDUj//qRNhFSlrA?=
 =?us-ascii?q?6g5O5ailbHiq00z20Xdpy?=
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="107748272"
Date: Thu, 4 May 2023 14:23:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>
CC: <xen-devel@lists.xenproject.org>, Anthony Perard
	<anthony.perard@cloud.com>, Wei Liu <wl@xenproject.org>
Subject: Re: [PATCH 1/2] xenalyze: Handle start-of-day ->RUNNING transitions
Message-ID: <96a6a07f-b61a-4c11-9dcb-0c0bf1942bf3@perard>
References: <20230327161326.48851-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230327161326.48851-1-george.dunlap@cloud.com>

On Mon, Mar 27, 2023 at 05:13:25PM +0100, George Dunlap wrote:
> A recent xentrace highlighted an unhandled corner case in the vcpu
> "start-of-day" logic, if the trace starts after the last running ->
> non-running transition, but before the first non-running -> running
> transition.  Because start-of-day wasn't handled, vcpu_next_update()
> was expecting p->current to be NULL, and tripping out with the
> following error message when it wasn't:
> 
> vcpu_next_update: FATAL: p->current not NULL! (d32768dv$p, runstate RUNSTATE_INIT)
> 
> where 32768 is the DEFAULT_DOMAIN, and $p is the pcpu number.
> 
> Instead of calling vcpu_start() piecemeal throughout
> sched_runstate_process(), call it at the top of the function if the
> vcpu in question is still in RUNSTATE_INIT, so that we can handle all
> the cases in one place.
> 
> Sketch out at the top of the function all cases which we need to
> handle, and what to do in those cases.  Some transitions tell us where
> v is running; some transitions tell us about what is (or is not)
> running on p; some transitions tell us neither.
> 
> If a transition tells us where v is now running, update its state;
> otherwise leave it in INIT, in order to avoid having to deal with TSC
> skew on start-up.
> 
> If a transition tells us what is or is not running on p, update
> p->current (either to v or NULL).  Otherwise leave it alone.
> 
> If neither, do nothing.
> 
> Reifying those rules:
> 
> - If we're continuing to run, set v to RUNNING, and use p->first_tsc
>   as the runstate time.
> 
> - If we're starting to run, set v to RUNNING, and use ri->tsc as the
>   runstate time.
> 
> - If v is being deschedled, leave v in the INIT state to avoid dealing
>   with TSC skew; but set p->current to NULL so that whatever is
>   scheduled next won't trigger the assert in vcpu_next_update().
> 
> - If a vcpu is waking up (switching from one non-runnable state to
>   another non-runnable state), leave v in INIT, and p in whatever
>   state it's in (which may be the default domain, or some other vcpu
>   which has already run).
> 
> While here, fix the comment above vcpu_start; it's called when the
> vcpu state is INIT, not when current is the default domain.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

