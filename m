Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E0A785A13
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 16:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589318.921192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoYD-00049L-JY; Wed, 23 Aug 2023 14:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589318.921192; Wed, 23 Aug 2023 14:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoYD-00047b-Fv; Wed, 23 Aug 2023 14:09:37 +0000
Received: by outflank-mailman (input) for mailman id 589318;
 Wed, 23 Aug 2023 14:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JPpt=EI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qYoYC-00047V-NQ
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 14:09:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b038391b-41be-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 16:09:35 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id BE3A14EE0737;
 Wed, 23 Aug 2023 16:09:34 +0200 (CEST)
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
X-Inumbo-ID: b038391b-41be-11ee-8783-cb3800f73035
MIME-Version: 1.0
Date: Wed, 23 Aug 2023 16:09:34 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, =?UTF-8?Q?Roger_Pau?=
 =?UTF-8?Q?_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 2/3] vpci/msix: make 'get_slot' static
In-Reply-To: <c6e270c813ef1a4da7045a5fcf7bd9e1b8f21947.1692275359.git.nicola.vetrini@bugseng.com>
References: <cover.1692275359.git.nicola.vetrini@bugseng.com>
 <c6e270c813ef1a4da7045a5fcf7bd9e1b8f21947.1692275359.git.nicola.vetrini@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <83384f49acf61489588faf76e54fa106@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 17/08/2023 14:39, Nicola Vetrini wrote:
> The function can become static since it's used only within this file.
> This also resolves a violation of MISRA C:2012 Rule 8.4 due to the 
> absence
> of a declaration before the function definition.
> 
> Fixes: b177892d2d0e ("vpci/msix: handle accesses adjacent to the MSI-X 
> table")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v2:
> - Corrected wrong prefix in the commit subject.
> 
> CC-ing maintainers from "THE REST" as well, perhaps this trivial change 
> can go
> in straight away.
> ---
>  xen/drivers/vpci/msix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 25bde77586a4..f9df506f29bf 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -223,7 +223,7 @@ static void __iomem *get_table(const struct vpci
> *vpci, unsigned int slot)
>      return msix->table[slot];
>  }
> 
> -unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
> +static unsigned int get_slot(const struct vpci *vpci, unsigned long 
> addr)
>  {
>      unsigned long pfn = PFN_DOWN(addr);
> 
> --
> 2.34.1

Any chance of an ack? The maintainer for that file is Roger Pau Monné as 
far as I can tell.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

