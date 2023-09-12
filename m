Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F31179D611
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 18:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600643.936363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg663-0001yQ-IZ; Tue, 12 Sep 2023 16:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600643.936363; Tue, 12 Sep 2023 16:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg663-0001vr-FG; Tue, 12 Sep 2023 16:18:39 +0000
Received: by outflank-mailman (input) for mailman id 600643;
 Tue, 12 Sep 2023 16:18:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qg661-0001vk-6Q
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 16:18:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05b11f97-5188-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 18:18:34 +0200 (CEST)
Received: from [192.168.1.9] (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 38D6D4EE0749;
 Tue, 12 Sep 2023 18:18:34 +0200 (CEST)
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
X-Inumbo-ID: 05b11f97-5188-11ee-9b0d-b553b5be7939
Message-ID: <2b2495cf-cd83-c870-d9a9-62917477de0f@bugseng.com>
Date: Tue, 12 Sep 2023 18:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 08/13] xen/hvm: address violations of MISRA C:2012
 Rule 7.3
Content-Language: en-US
To: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <d1be6a0bad7e5cd6277a7b258a1fa70e58a68140.1691053438.git.simone.ballarin@bugseng.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <d1be6a0bad7e5cd6277a7b258a1fa70e58a68140.1691053438.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/23 12:22, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> The changes in this patch are mechanical.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>   xen/arch/x86/hvm/emulate.c | 2 +-
>   xen/arch/x86/hvm/io.c      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> index 75ee98a73b..053c6b495d 100644
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -74,7 +74,7 @@ static int cf_check null_read(
>       const struct hvm_io_handler *io_handler, uint64_t addr, uint32_t size,
>       uint64_t *data)
>   {
> -    *data = ~0ul;
> +    *data = ~0UL;
>       return X86EMUL_OKAY;
>   }
>   
> diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
> index 53de1a967d..d75af83ad0 100644
> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -400,7 +400,7 @@ static int cf_check vpci_mmcfg_read(
>       unsigned int reg;
>       pci_sbdf_t sbdf;
>   
> -    *data = ~0ul;
> +    *data = ~0UL;
>   
>       read_lock(&d->arch.hvm.mmcfg_lock);
>       mmcfg = vpci_mmcfg_find(d, addr);

This patch still applies cleanly on staging, any change of getting an Ack?

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


