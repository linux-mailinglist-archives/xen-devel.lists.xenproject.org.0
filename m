Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD3B10227
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055375.1423795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqeY-0003Hc-T6; Thu, 24 Jul 2025 07:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055375.1423795; Thu, 24 Jul 2025 07:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqeY-0003FZ-QN; Thu, 24 Jul 2025 07:46:10 +0000
Received: by outflank-mailman (input) for mailman id 1055375;
 Thu, 24 Jul 2025 07:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P3HE=2F=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ueqeX-0003FT-It
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:46:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4210165f-6862-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 09:46:07 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 4DCE64EE3C07;
 Thu, 24 Jul 2025 09:46:06 +0200 (CEST)
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
X-Inumbo-ID: 4210165f-6862-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753343166;
	b=yDcxSn+0yFjHxkiFwXUxlEL5jA8XhGX3++QhowQzA0ix/YTxkeoV1qzJlgkeyw1EhmfA
	 +LogUYK2dHxLoQtb3Nt8E8DCT6z5UFuVwzg1cfmGsR0SMtYuE3h9zBWsf+YdBMoMpiZ5Q
	 CRz0e2xRBBC6D0xnQ5gPBNJev+97U0HX+2A/aEteEql2nzVOhRQhkkNGgYoaTvojptPU+
	 b4PFdhdoJXJ2lB+BreZ6m2QpYxx2oztUDEoyQYzwihhojHxydBWQiEyZCOyluF9UIJaBy
	 q3yu0rRbdRyOo4/ctE2lJ5YltKcdI6LRSqmB+gPMuMg1740vQcOrxzMdDzRYOg2RMa2lm
	 VcM7xgLlCYopQ9mADDlSyn3WG8WpgrYnD/8cM5CgzFTUIJ2n/Te1YEt06pmRrTUzuSU/3
	 fi/eng4JTjrBR9HwgVhuY/AAW94kLfQ3PQ5US/ZUr1fiO3Mk7rQuf4LQUi7iaxniE0AxQ
	 2HfVanpS/AZucER+9flAr5MjYBusJ2iJBdZpHkWLlIPZsQ+0yKpkLG/J12dLaOffUj2Gs
	 U3tZFWuneRN0/ZklnqvtQlg/EjqePN+L79FV8+7x81HOZM7cvBOfRHOCgsLuptYtx6hgm
	 QCxpU8c2TPRF90dTv3HqeGaayrZ3T0lHK0o8t1B8oQeXvEOt/FH4gFOYYITup7U=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753343166;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=YPvqOtuhBLnUPVueWvPwhRNMt3LlhcbxpiQajzJX72I=;
	b=lKHqljpqRPjqUUQxep+QPWhgSc/7jnNfzNOweHHn31n8TWLpDqH/2hGb/ht8WXelVY+S
	 VEXvS0QaWkmfSUP+s8Pcvf+e61eFNdngszuu6Jpe8nEsdJV1Egn8lHbPuTd6YDZMs02YY
	 b1v8QhIteZZ86GrNJliywNhJG31Qenv/dE9to2deTOF8qX4F3cxPHR6ezOtrH/aL753+S
	 H5pMjgq5StFq40Fr5IQ4KDBuknleEiTX3MAnx3j8qKwKY/c9Lb3EDah1AgqIWb1mtbU2s
	 NFBewOltgw+ApS8pFeZNX8NjM8BAfMIBL6UWC8o4+2Cbvb9lE5yj0MdRmQ/+RQjMLOSxI
	 jZOF5MI7zyqeSEfOEGUFeac6WIFw1ew5R8qSx89LcKhKGiZFvTqv0R8RqMCSpXUCxrRi/
	 jCYun4+tgrbhfNwegMBag59vsNo3+/aQXyS897rJ/xCMtWWkgRSHAFftevACWYJJdQLZg
	 ET3Kx1XhMNMpsq5bWfYkbYj2UDom4kGOuIagEXjOJohw3xKrsqFjAKArp9JJyJpIEcvlp
	 NGZBvbcXvWttWi/Pb2f3kp/FLw3wfkm5Evmf3exgrhHuZ1tIaTaCnYlm2rZoEt8NR3Xme
	 e4deMAkP5UBGfSRVrmnbvjEERapvhFV1uhjfGc+nGqzqReOM1tFRJ29qyAo38Z4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753343166; bh=Wjv/AxhkxC3VrQYJ4KyfhoZHfbe9UX+PpaWUvtTRFps=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lOh6MP8KHgW36p4uo62aVp57IK9MBc9+YTn0bL9K0lZ+ZChEAT/kAODUAPGiW3Ws1
	 MNZheBvIhjuhFT7L/37Je9Y2EyahoL0XBDKg8RffBOLjahM/BfoErqO/LYQ3okEhxe
	 dMNXqRtuf6sqB6cv2gMf8Sg9x8w6PbJPFWgt1Tw1i7K/K9ffkWr3MCmvIf/NOY+AZv
	 u+3JaQpiB7GYVJqD1q0Lkxfmko02qiEiQrMPJwe9nh/986BxE+hPHKWHYvKVycyYu6
	 So9JplFGp+m+07etfq71Z4/baumq8FI/6oKkDpBC5HUIb2K01U8e6jQVtx+NYqprxv
	 0fLuLvLkNo3yw==
MIME-Version: 1.0
Date: Thu, 24 Jul 2025 09:46:06 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] misra: add deviations of MISRA C Rule 5.5
In-Reply-To: <7e1c381d6fab6d38bb2a5484d5fac5e863ba135f.1752689112.git.dmytro_prokopchuk1@epam.com>
References: <7e1c381d6fab6d38bb2a5484d5fac5e863ba135f.1752689112.git.dmytro_prokopchuk1@epam.com>
Message-ID: <ff5f0d0989ced1b55b5af06e8bbd36cc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-16 20:08, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 5.5 states that: "Identifiers shall
> be distinct from macro names".
> 
> Update ECLAIR configuration to deviate:
> - clashes in 'xen/include/xen/bitops.h';
> - clashes in 'xen/include/xen/irq.h';
> - clashes in 'xen/common/grant_table.c'.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> This patch makes MISRA Rule 5.5 "clean" for ARM only.
> 
> Was agreed to narrow deviation:
> https://patchew.org/Xen/cover.1752096263.git.dmytro._5Fprokopchuk1@epam.com/e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro._5Fprokopchuk1@epam.com/
> 
> CI:
> https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/rule_5.5_deviation_final/ARM64/10706457595/PROJECT.ecd;/by_service.html#service&kind
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
>  docs/misra/deviations.rst                        | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 8504e850c1..3895148460 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -117,6 +117,13 @@ it defines would (in the common case) be already 
> defined. Peer reviewed by the c
>  -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>  -doc_end
> 
> +-doc_begin="Clashes between function names and macros are deliberate 
> and needed to have a function-like macro that acts as a wrapper for the 
> function to be called.
> +Before calling the function, the macro adds additional checks or 
> adjusts the number of parameters depending on the configuration."
> +-config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)) && 
> macro(name(__test_and_set_bit||__test_and_clear_bit||__test_and_change_bit||test_bit)))"}

                                                                          
                         ^^^^ No blanks here, just like below.

> +-config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/common/grant_table\\.c$))&&macro(name(update_gnttab_par||parse_gnttab_limit)))"}
> +-config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(all_loc(file(^xen/include/xen/irq\\.h$))&&macro(name(pirq_cleanup_check)))"}
> +-doc_end
> +
>  -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
>  depending on the guest."
>  
> -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 620e97f0bd..84bc933cbf 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -142,6 +142,13 @@ Deviations related to MISRA C:2012 Rules:
>         memmove.
>       - Tagged as `deliberate` for ECLAIR.
> 
> +   * - R5.5
> +     - Clashes between function names and macros are deliberate and 
> needed
> +       to have a function-like macro that acts as a wrapper for the 
> function to be
> +       called. Before calling the function, the macro adds additional 
> checks or
> +       adjusts the number of parameters depending on the 
> configuration.
> +     - Tagged as `deliberate` for ECLAIR.
> +

At least this wants to delimit to which macros you actually allow to 
overlap with functions, as this seems to imply that the deviation is 
general, which is not

>     * - R5.6
>       - The type ret_t is deliberately defined multiple times depending 
> on the
>         type of guest to service.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

