Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC622915B42
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747078.1154375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuRz-0004Fe-TK; Tue, 25 Jun 2024 00:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747078.1154375; Tue, 25 Jun 2024 00:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuRz-0004CZ-Pm; Tue, 25 Jun 2024 00:54:23 +0000
Received: by outflank-mailman (input) for mailman id 747078;
 Tue, 25 Jun 2024 00:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuRy-0004CT-Gq
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:54:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7444e6b5-328d-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:54:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D3291CE009F;
 Tue, 25 Jun 2024 00:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58942C2BBFC;
 Tue, 25 Jun 2024 00:54:17 +0000 (UTC)
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
X-Inumbo-ID: 7444e6b5-328d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719276858;
	bh=NXN1BhwIOh5OLWFV//jAMfvC42Gi+qhFna9VSGGA4/g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O3g8xvayeg6NbwYVGzaxXCtwFtQIDAeFLpOe0qnpU/XUaEVRdxAi05kysgbqLKchz
	 pB316b+RRQ9UIQOkrS6RVdyQVDt3tzDGDk9cuL13JeEIKkX33FI4yfFECtmjSuwm0g
	 lOMJ1WCdhviLXISUlPQSFmfUQWZENU1vMLfUPXsX6OXkBzMM+EJghklabNkz7niCqQ
	 /RwS18khkwooc+mh6VPodHck4F5ibHrWobBK81RJ8KO76q3x0+9t78b2brrApFEnP2
	 BbG5+C13zT3XXYsmYjxf6klG2qohxC0d3nVCw7qzRX7XKkpA/62gRIbsu/Ml0xKO7X
	 asyvgINOmjFQg==
Date: Mon, 24 Jun 2024 17:54:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 05/13] x86/traps: address violations of MISRA C
 Rule 16.3
In-Reply-To: <4f44a7b021eb4f78ccf1ce69b500b48b75df81c5.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241753260.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <4f44a7b021eb4f78ccf1ce69b500b48b75df81c5.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Add break or pseudo keyword fallthrough to address violations of
> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/traps.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 9906e874d5..cbcec3fafb 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1186,6 +1186,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        break;

Please add ASSERT_UNREACHABLE to the list of "unconditional flow control
statements" that can terminate a case, in addition to break.


>      }
>  }
>  
> @@ -1748,6 +1749,7 @@ static void io_check_error(const struct cpu_user_regs *regs)
>      {
>      case 'd': /* 'dom0' */
>          nmi_hwdom_report(_XEN_NMIREASON_io_error);
> +        fallthrough;
>      case 'i': /* 'ignore' */
>          break;
>      default:  /* 'fatal' */
> @@ -1768,6 +1770,7 @@ static void unknown_nmi_error(const struct cpu_user_regs *regs,
>      {
>      case 'd': /* 'dom0' */
>          nmi_hwdom_report(_XEN_NMIREASON_unknown);
> +        fallthrough;
>      case 'i': /* 'ignore' */
>          break;
>      default:  /* 'fatal' */

These two are nice improvements

