Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20956B92772
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 19:43:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127922.1468455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0kYv-00052V-SG; Mon, 22 Sep 2025 17:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127922.1468455; Mon, 22 Sep 2025 17:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0kYv-000509-OT; Mon, 22 Sep 2025 17:42:53 +0000
Received: by outflank-mailman (input) for mailman id 1127922;
 Mon, 22 Sep 2025 17:42:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1v0kYu-000503-Kt
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 17:42:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v0kYu-004kvM-0f;
 Mon, 22 Sep 2025 17:42:52 +0000
Received: from [2a02:8012:3a1:0:b59c:e142:82de:6ab8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v0kYu-007QtQ-0e;
 Mon, 22 Sep 2025 17:42:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=wpILqGiJ7kMrDstks7MVXnKplG1k0Pb6L1+RBO3f3gE=; b=xav9WgkuQj+E3fbVju5HJ/ct8V
	dhbaNVYszUe/S2OvIOED5Jj9KyJ6jRAfeUDQvR7D0b8LW69rvxVvHh5NGIyahPeD5S3ydd1WHKr+s
	tGy6EJByRtksLcTyRmvZwfadrmW26L3Flx5DAMw9naQ0XlzD+TkNRa2lsni/nwqld0N8=;
Message-ID: <6476dc12-1f9f-4b37-b569-e994bde6bcdb@xen.org>
Date: Mon, 22 Sep 2025 18:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Reorder SCI resource cleanup in domain
 destruction
Content-Language: en-GB
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20ec9d9a8533417489a95543c1b72f7f55865c9c.1757856381.git.oleksii_moisieiev@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20ec9d9a8533417489a95543c1b72f7f55865c9c.1757856381.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Release manager)

Hi,

On 14/09/2025 14:26, Oleksii Moisieiev wrote:
> Move the SCI (System Control and Management Interface) resource cleanup
> earlier in the domain_relinquish_resources() sequence to ensure proper
> cleanup ordering during domain destruction.
> 
> The SCI cleanup is now performed before TEE (Trusted Execution Environment)
> cleanup rather than after P2M mapping cleanup. This reordering ensures that
> SCI resources are properly released before other subsystems that might
> depend on them are torn down.
> 
> This change addresses potential resource cleanup dependencies where SCI
> resources need to be released before P2M mappings are cleaned up, preventing
> potential issues during domain destruction on ARM platforms with SCI support.
> 
> Fixes: e2cc10867b (xen/arm: add generic SCI subsystem, 2025-09-04)

I am not sure where you found this syntax. This is not the one we use 
for Xen. It should be:

Fixes: <commit-id> ("<patch-subject>")

Where the commit-id is 12 characters. For this patch it should be:

Fixes: e2cc10867b63 ("xen/arm: add generic SCI subsystem")

> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
 > --->
> Changes in v2:
> - rearrange enum by placing PROG_sci before PROG_tee
> - add "Fixes:" tag
> 
>   xen/arch/arm/domain.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 1a8585d02b..e36719bce4 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -1042,6 +1042,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>    */
>   enum {
>       PROG_pci = 1,
> +    PROG_sci,

Can you confirm this is fine to release the SCI resources *after* we 
releases the devices? Does this mean they are not linked somehow? For 
instance, if a device is re-assigned to another VM, could it fail 
because the associated (?) SCI resources were not yet released?

Cheers,

-- 
Julien Grall


