Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B58786CF2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 12:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589927.922002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7lQ-0002DV-Ip; Thu, 24 Aug 2023 10:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589927.922002; Thu, 24 Aug 2023 10:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7lQ-0002BX-G3; Thu, 24 Aug 2023 10:40:32 +0000
Received: by outflank-mailman (input) for mailman id 589927;
 Thu, 24 Aug 2023 10:40:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EWrD=EJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qZ7lP-0002BR-3a
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 10:40:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a483bc2a-426a-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 12:40:29 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 98A994EE0737;
 Thu, 24 Aug 2023 12:40:28 +0200 (CEST)
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
X-Inumbo-ID: a483bc2a-426a-11ee-9b0c-b553b5be7939
MIME-Version: 1.0
Date: Thu, 24 Aug 2023 12:40:28 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Gianluca
 Luparini <gianluca.luparini@bugseng.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 2/4] xen/vpci: address violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <2cb770d946c4bf858a41271fd7b9985f789ca149.1690368810.git.simone.ballarin@bugseng.com>
References: <cover.1690368810.git.simone.ballarin@bugseng.com>
 <2cb770d946c4bf858a41271fd7b9985f789ca149.1690368810.git.simone.ballarin@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <1b4e6569c0c8d17c73341e43ed46c232@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/2023 13:03, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to 
> other
> literals used in the same contexts or near violations, when their 
> positive
> nature is immediately clear. The latter changes are done for the sake 
> of
> uniformity.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v4:
> - change commit headline
> 
> Changes in v3:
> - change 'Signed-off-by' ordering
> - add 'uint32_t' casts in 'msi.c' and 'msix.c'
> 
> Changes in v2:
> - minor change to commit title
> - change commit message
> ---
>  xen/drivers/vpci/msi.c  | 2 +-
>  xen/drivers/vpci/msix.c | 2 +-
>  xen/drivers/vpci/vpci.c | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 

Like other patches in this series, this one could also benefit from an 
ack from
VPCI maintainers to get committed, as it does apply cleanly on staging.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

