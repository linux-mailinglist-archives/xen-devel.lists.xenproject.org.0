Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9BB53C177
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 02:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341326.566547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwvRK-0004X0-O5; Fri, 03 Jun 2022 00:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341326.566547; Fri, 03 Jun 2022 00:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwvRK-0004VF-Jf; Fri, 03 Jun 2022 00:45:22 +0000
Received: by outflank-mailman (input) for mailman id 341326;
 Fri, 03 Jun 2022 00:45:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwvRJ-0004V9-4W
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 00:45:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70c41ece-e2d6-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 02:45:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0120161957;
 Fri,  3 Jun 2022 00:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBD5C385A5;
 Fri,  3 Jun 2022 00:45:17 +0000 (UTC)
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
X-Inumbo-ID: 70c41ece-e2d6-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654217117;
	bh=DBmfjowaN657Cd99JHjlKuX84DHWg1Q4arRQB2dxD/0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qsmDVO4ZIKqkdTYOiRGFsmU2smuq4lNjkRDI47tTSFoUxQ8ZNVxDT3RzXBSc5mUBv
	 poCkD/Gx6ce08Hb4ht7WCwGkJB/LxppBpwi0SBEEMhd4C6lc06g5vFgS739XiUdemL
	 KGsbYU2IusRid1+JvEuXCyu8FCQKGAAEZJFWMBsW4oOUsU4LSUUZeCMsa3PrprlHGY
	 FQPi1kZPjo+e64AjO63D8TgL6b7nEdsF0Eb9ektYjQJv+qs4kt0xWR/d9Ir2qy5rSa
	 Du0nu1XAPKWkmQrz1/0mWntKL9xjm7FJEqXCf1tztNs/N1tTRt0vkmN3YDaHpsqJGH
	 xw/rg0CUkZh2A==
Date: Thu, 2 Jun 2022 17:45:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/4] arm: add ISAR2, MMFR0 and MMFR1 fields in
 cpufeature
In-Reply-To: <4a0aef106ac7b6c16048ff3554eda1d8b3eab61a.1653993431.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206021738430.2783803@ubuntu-linux-20-04-desktop>
References: <cover.1653993431.git.bertrand.marquis@arm.com> <4a0aef106ac7b6c16048ff3554eda1d8b3eab61a.1653993431.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 May 2022, Bertrand Marquis wrote:
> Complete AA64ISAR2 and AA64MMFR[0-1] with more fields.
> While there add a comment for MMFR bitfields as for other registers in
> the cpuinfo structure definition.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - patch introduced to isolate changes in cpufeature.h
> - complete MMFR0 and ISAR2 to sync with sysregs.h status
> ---
>  xen/arch/arm/include/asm/cpufeature.h | 28 ++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index 9649a7afee..57eb6773d3 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -234,6 +234,7 @@ struct cpuinfo_arm {
>      union {
>          register_t bits[3];
>          struct {
> +            /* MMFR0 */
>              unsigned long pa_range:4;
>              unsigned long asid_bits:4;
>              unsigned long bigend:4;
> @@ -242,18 +243,31 @@ struct cpuinfo_arm {
>              unsigned long tgranule_16K:4;
>              unsigned long tgranule_64K:4;
>              unsigned long tgranule_4K:4;
> -            unsigned long __res0:32;
> -
> +            unsigned long tgranule_16k_2:4;
> +            unsigned long tgranule_64k_2:4;
> +            unsigned long tgranule_4k:4;

Should be tgranule_4k_2:4


> +            unsigned long exs:4;
> +            unsigned long __res0:8;
> +            unsigned long fgt:4;
> +            unsigned long ecv:4;
> +
> +            /* MMFR1 */
>              unsigned long hafdbs:4;
>              unsigned long vmid_bits:4;
>              unsigned long vh:4;
>              unsigned long hpds:4;
>              unsigned long lo:4;
>              unsigned long pan:4;
> -            unsigned long __res1:8;
> -            unsigned long __res2:28;
> +            unsigned long specsei:4;
> +            unsigned long xnx:4;
> +            unsigned long twed:4;
> +            unsigned long ets:4;
> +            unsigned long __res1:4;

hcx?


> +            unsigned long afp:4;
> +            unsigned long __res2:12;

ntlbpa
tidcp1
cmow

>              unsigned long ecbhb:4;

Strangely enough I am looking at DDI0487H and ecbhb is not there
(D13.2.65). Am I looking at the wrong location?


> +            /* MMFR2 */
>              unsigned long __res3:64;
>          };
>      } mm64;
> @@ -297,7 +311,11 @@ struct cpuinfo_arm {
>              unsigned long __res2:8;
>  
>              /* ISAR2 */
> -            unsigned long __res3:28;
> +            unsigned long wfxt:4;
> +            unsigned long rpres:4;
> +            unsigned long gpa3:4;
> +            unsigned long apa3:4;
> +            unsigned long __res3:12;

mops
bc
pac_frac


>              unsigned long clearbhb:4;

And again this is not described at D13.2.63. Probably the bhb stuff
didn't make it into the ARM ARM yet.


>  
>              unsigned long __res4:32;
> -- 
> 2.25.1
> 

