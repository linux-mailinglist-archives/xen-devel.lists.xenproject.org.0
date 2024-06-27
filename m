Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167AF919C1A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 02:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749607.1157827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdNV-0007oD-KP; Thu, 27 Jun 2024 00:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749607.1157827; Thu, 27 Jun 2024 00:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdNV-0007kv-G4; Thu, 27 Jun 2024 00:52:45 +0000
Received: by outflank-mailman (input) for mailman id 749607;
 Thu, 27 Jun 2024 00:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMdNU-0007kk-Fs
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 00:52:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d7a08f1-341f-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 02:52:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ACB03CE2D27;
 Thu, 27 Jun 2024 00:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3424FC116B1;
 Thu, 27 Jun 2024 00:52:35 +0000 (UTC)
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
X-Inumbo-ID: 8d7a08f1-341f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719449556;
	bh=3XBUqB1BWWvZXcl1jQExnngeSLnZJqieStD/qTwNCqI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZMrzQ3YR/js3R0mg1DIFCncXY1TO/q/UyaYwKvAa0igSTaAK7D7nlER0EKTHnTdWa
	 lVm3MRt/Rj1RktDu6YTM1F1xHmtOksA0Dsegv9H8OxZgFZ3C49+0ddsDlAXBHBnMrz
	 9BXqSME4PAkHisb+9FwDg5lKqxQ07kxTRPSvjV0GmqlgOB5OicsA/yKwmr2jDGHxVW
	 73NEZftDP2i93jdqwLXOqEXgImgF/clDtyoq6aPvgLKQdzvazkCA6Sm0yn9UnlvtD9
	 Vfp7498hLll4Rfn2U4NEcWmdJtoGGzU/t7MaOTFZPcnivdzdmhvhiriqGGyGOCmXkk
	 oE30WbDHNyvgw==
Date: Wed, 26 Jun 2024 17:52:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3 05/12] x86/traps: address violations of MISRA C
 Rule 16.3
In-Reply-To: <e7aea6bacb9c914a06a929dfe3606f7cc360588f.1719383180.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406261751370.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719383180.git.federico.serafini@bugseng.com> <e7aea6bacb9c914a06a929dfe3606f7cc360588f.1719383180.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Federico Serafini wrote:
> Add break or pseudo keyword fallthrough to address violations of
> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v3:
> - use break instead of fallthrough.
> ---
>  xen/arch/x86/traps.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 9906e874d5..d62598a4c2 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1186,6 +1186,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>  
>      default:
>          ASSERT_UNREACHABLE();
> +        break;

FYI the ASSERT_UNREACHABLE is still being discussed

Other than that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>      }
>  }
>  
> @@ -1748,6 +1749,7 @@ static void io_check_error(const struct cpu_user_regs *regs)
>      {
>      case 'd': /* 'dom0' */
>          nmi_hwdom_report(_XEN_NMIREASON_io_error);
> +        break;
>      case 'i': /* 'ignore' */
>          break;
>      default:  /* 'fatal' */
> @@ -1768,6 +1770,7 @@ static void unknown_nmi_error(const struct cpu_user_regs *regs,
>      {
>      case 'd': /* 'dom0' */
>          nmi_hwdom_report(_XEN_NMIREASON_unknown);
> +        break;
>      case 'i': /* 'ignore' */
>          break;
>      default:  /* 'fatal' */

