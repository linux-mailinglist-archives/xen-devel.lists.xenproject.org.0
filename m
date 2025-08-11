Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166E4B21727
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 23:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078075.1439079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZqn-0008Od-UU; Mon, 11 Aug 2025 21:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078075.1439079; Mon, 11 Aug 2025 21:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZqn-0008MK-RF; Mon, 11 Aug 2025 21:14:37 +0000
Received: by outflank-mailman (input) for mailman id 1078075;
 Mon, 11 Aug 2025 21:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn8B=2X=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ulZqm-0008ME-4e
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 21:14:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cada37c-76f8-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 23:14:32 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1F42D4EE0744;
 Mon, 11 Aug 2025 23:14:31 +0200 (CEST)
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
X-Inumbo-ID: 2cada37c-76f8-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754946871;
	b=EOwGbPJK/Q4spxeAV+e4aueL4DkiZ8Ps4UlrYSzgjxNU+mrd1sWGIpv5wu+EYuuyw+Go
	 Qx4QYPrWjGi5a1bD3cKsaj5zCWR9YzvqnJ3TEK1osm14h16ykJh/3ejJhuBdOBl5VsEEe
	 qi1jqKxWTm4l5cWXLhnOhmKXpuYJB8kyXktkhx1kI0Av6eij7U8yHkAeqZdO9mAPDIZye
	 Nf/ItNFF/rnW7O6STUKijeI3icPT6oL8iVDZYSFBGgHicvHGUYmmBTUprXuB4sMRYWZoa
	 ZlBMD2o11Ak0LyXjs8X4KwrvsXNhejKodzzHo4wIWw/nilYnIivR/IR6OIS7RvpsBnysP
	 4l+NEBotl7T1IBk0eiEnllggXcSMFI+osudYK/H0axQkdo0b9qrX3SGR6HD/RRK6wU0r5
	 YChS8vplr3iPGT4SZDifE3LkQroOcTHw8V2W+UpUOmUjJmwcfzkfv/6XqLbRfsOXGV/G7
	 gOPMhzsqxzrlvsB+ki4bw/o/Ic0hJX6yQjok7fSLiLyDasq2I8RxfCRErrxxZcTU+APHA
	 LIpgwBMBGvIJ4w2TiimuH7lYqJuoHkJ/X0qXnwbZn2sA4KuUBtUVxmsaq4YwmkqCde3JX
	 qpRaixVdYgN/oGqSFJYRVw2L0zy6deQniLpBgeKwc5k0segjHSwHX6FEpNC2TPA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754946871;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=kcFKs1Rrl9bmR44jzkik5PqdmBGE1cxvNNwL9ft+GzQ=;
	b=tka9eSZlZoaZVT8atfM6R4yEFqNZ4fAWQ71W03y3ChI9+c2ofjHqCt7toO5VPAFoQfqI
	 /9NuYBsyfzOZySg02wk/BUmK3NVmXTA0g44Uef9RPWdBcyW5G5jmKZvhG2zSFsVAXMU2H
	 vj+oV0lVC3ocFrmNvTvknCt3T8d7WNkQ1mIGvRwH9desgsUeI+kxVQIdEXPrjegYNj3qp
	 Z6i9VtTNfXcXb8XWxOuuebKRwsj9PsDKrgPiPLcsFr4kkOu7UGYdTiolo7tUXRnEwE85D
	 lTAM6B9utkrA8QOx3M9f18pVdSFM3n7KrJ/17pHAOVJi57hUdlKRjFtRBwd4Hb/gJtuqw
	 ZaKrhFysDQBjNnKeHWcxfmWBYyb70C+hIdiU0mbk7n25fI4okLCi9RXbwWX+c5Xg1CDTl
	 PN+GZn56x6jA4AfsZ0JjoD4F3QtS0NANukolZo2NZiN2KhY1BXab+HkrZqmNX0x4yb+Ar
	 hX8+n8xcYgvtWFnOE1YjUK4F0wbM9x2gmiKFFJGxJNmUf935xuqkLmjXR77xPKvGK3VI8
	 +qhPg7mHIgypDb7P+mkD5w2wxuOXyPkPhP09yAGFoPuWZQtsFIwuwG5MSfzZeIEDhg7HT
	 LBTooPTTjpX9PBVigHcsHh1UTHT9nT2IZ+dV1UVISZT7k4oc0y/MvMwjlfj/sSo=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754946871; bh=s5COTrlItNwcj5eVX5W0Z4jL8xWyiQFjPT9842rw/uQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ddqy0vIVu3T15ZHHi/o6xEvpmVRzULc3Pc4bVdBYRJDeBafCe8+n39LBgkUQ+1q0G
	 Ls2R8ms5FD1jDDGHqMZMuq32VGnSYofqXERPtcbLWDlvRW/7pK6s7N2vekIOxh/DL+
	 +e9WddJVtYee4TXTMjVeFBV+U9jwu9AO6az7lBE/YvpQPcGiaeZlnyRl6nRmgOnQbM
	 3Ypi/YdDR3U8v08ZAAPKK1pZOtju7sN6TeeceGSM644cpWLm3AxbYQEo6phq0GSlrc
	 38V5OVEi7Y8nYlUH0Wtw0O2fcJoog/RLr9C1HsUNFtQBIcGNp/Y5mT5e0TyVyZcYqB
	 FUMwx/Dz+/+2A==
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 23:14:31 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] misra: comment default case in single-clause switch
In-Reply-To: <1d3c5364b726e42a8c38c396f2e20efc52790f62.1754933752.git.dmytro_prokopchuk1@epam.com>
References: <1d3c5364b726e42a8c38c396f2e20efc52790f62.1754933752.git.dmytro_prokopchuk1@epam.com>
Message-ID: <d82cc723a17ec65f12fd60182fd6fe20@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-11 19:36, Dmytro Prokopchuk1 wrote:
> MISRA Rule 16.4: Every switch statement shall have a default label. The
> default clause must contain either a statement or a comment prior to 
> its
> terminating break statement.
> 
> This change adds comments in default cases in single-clause switches to
> avoid violations of the rule where the `default` clause lacks a 
> suitable
> comment or statement.
> 

If you want to go this way then at least this config wants dropping:

-doc_begin="A switch statement with a single switch clause and no 
default label may be used in place of an equivalent if statement if it 
is considered to improve readability."
-config=MC3A2.R16.4,switch_clauses+={deliberate,"switch(1)&&default(0)"}
-doc_end

and probably this one too (haven't checked):

-doc_begin="A switch statement with a single switch clause and no 
default label may be used in place of an equivalent if statement if it 
is considered to improve readability."
-config=MC3A2.R16.6,switch_clauses+={deliberate, "default(0)"}
-doc_end

In the end it's a tradeoff; placing a comment with a suitable 
argumentation might be strictly better than simply tagging the tool 
report, at least from a developer's perspective. From a MISRA compliance 
standpoint in my opinion both are fine. Let's see what the maintainers 
think.

> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>  xen/arch/arm/cpuerrata.c | 5 +++++
>  xen/arch/arm/gic.c       | 6 ++++++
>  xen/arch/arm/mmu/p2m.c   | 6 ++++++
>  xen/arch/arm/time.c      | 6 ++++++
>  xen/common/kexec.c       | 6 ++++++
>  5 files changed, 29 insertions(+)
> 
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 17cf134f1b..e31c72694b 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -735,6 +735,11 @@ static int cpu_errata_callback(struct 
> notifier_block *nfb,
>          rc = enable_nonboot_cpu_caps(arm_errata);
>          break;
>      default:
> +        /*
> +         * Default case left empty as other notifier actions do not 
> require handling here.
> +         * The single CPU_STARTING action in the switch is sufficient 
> because this function
> +         * specifically handles enabling errata workarounds during CPU 
> startup.
> +         */
>          break;
>      }
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index e80fe0ca24..dfbb0dfe08 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -436,6 +436,12 @@ static int cpu_gic_callback(struct notifier_block 
> *nfb,
>          release_irq(gic_hw_ops->info->maintenance_irq, NULL);
>          break;
>      default:
> +        /*
> +         * Default case left empty as other notifier actions do not 
> require handling here.
> +         * The CPU_DYING action specifically handles releasing 
> resources acquired by
> +         * init_maintenance_interrupt(), when the CPU is being taken 
> offline. Other CPU
> +         * actions do not require GIC-specific handling.
> +         */
>          break;
>      }
> 
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 51abf3504f..d1f0ae0226 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -1828,6 +1828,12 @@ static int cpu_virt_paging_callback(struct 
> notifier_block *nfb,
>          setup_virt_paging_one(NULL);
>          break;
>      default:
> +        /*
> +         * Default case left empty as other notifier actions do not 
> require handling here.
> +         * The CPU_STARTING action is specifically handled because 
> this function sets up
> +         * virtual paging for CPUs, particularly for non-boot CPUs 
> during hotplug. Other
> +         * actions do not involve virtual paging setup.
> +         */
>          break;
>      }
> 
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index e74d30d258..4776110d97 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -382,6 +382,12 @@ static int cpu_time_callback(struct notifier_block 
> *nfb,
>          deinit_timer_interrupt();
>          break;
>      default:
> +        /*
> +         * Default case left empty as other notifier actions do not 
> require handling here.
> +         * The CPU_DYING action is specifically handled to revert 
> actions done in
> +         * init_timer_interrupt() and properly disable timer 
> interrupts on the CPU being
> +         * taken offline. Other actions do not involve timer 
> deinitialization.
> +         */
>          break;
>      }
> 
> diff --git a/xen/common/kexec.c b/xen/common/kexec.c
> index 84fe8c3597..0f78087a4a 100644
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -549,6 +549,12 @@ static int cf_check cpu_callback(
>          kexec_init_cpu_notes(cpu);
>          break;
>      default:
> +        /*
> +         * Default case left empty as other notifier actions do not 
> require handling here.
> +         * The CPU_UP_PREPARE action is specifically handled to 
> allocate crash note buffers
> +         * for a newly onlined CPU. Other actions do not pertain to 
> crash note allocation
> +         * or memory preservation for kexec.
> +         */
>          break;
>      }
>      return NOTIFY_DONE;

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

