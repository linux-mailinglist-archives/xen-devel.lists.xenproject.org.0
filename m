Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DD6905240
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 14:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739295.1146282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMwX-00068i-Fl; Wed, 12 Jun 2024 12:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739295.1146282; Wed, 12 Jun 2024 12:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMwX-00065v-C5; Wed, 12 Jun 2024 12:19:09 +0000
Received: by outflank-mailman (input) for mailman id 739295;
 Wed, 12 Jun 2024 12:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXq+=NO=bounce.vates.tech=bounce-md_30504962.66699237.v1-867ad23be80446a7ae42bac702f26d9f@srs-se1.protection.inumbo.net>)
 id 1sHMwV-00065n-BY
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 12:19:07 +0000
Received: from mail180-20.suw31.mandrillapp.com
 (mail180-20.suw31.mandrillapp.com [198.2.180.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f549961d-28b5-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 14:19:04 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-20.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Vzl2b5GkVzFCWkXd
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 12:19:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 867ad23be80446a7ae42bac702f26d9f; Wed, 12 Jun 2024 12:19:03 +0000
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
X-Inumbo-ID: f549961d-28b5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718194743; x=1718455243;
	bh=CCZxrXkAmvRoGJj76f4KfCKkWKu978lQtcipbRAaLzo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=v1nBT4mqsKnOMzey1Yq3iRB4NXZXKwW1daXOcOvPz+Puz3KcTxBIhj4P589ZvLSFJ
	 Wtro3KxfdMq8Gel/To4tf95JKraew5JrLruK4SnZ6CGDIyFf8Jkm4SS+F9jAjLyAmR
	 H3Let47zIt5DUiKOvW06/IscSnFNQ7UYcYtdRkzX7ZqH49K0tt0xvIlBlyJLf2CQrj
	 Mz8gbgpsbLbMNejAbgYAd772JfCojWOnl/j7vJJgJI9rZblZe9zdWoS6ISdGxAeLVx
	 P5ljqDPbMkejqwCIn+YIfMW5RTgnFBKa8FjfOjx8IRr9L3+zk9TyDHXu4d3hKQ1iHA
	 fYKa5kcpvAFRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718194743; x=1718455243; i=anthony.perard@vates.tech;
	bh=CCZxrXkAmvRoGJj76f4KfCKkWKu978lQtcipbRAaLzo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NDNy3OAoFXOSm4nb8KjyhaHC/hObaVL/on975D89MAdJ4LtkXYzD085vJIa+V8MaL
	 uSpqjzz5NsfwSDvmhYWcwF4Q3Ub0/McMz5t4L7pfNzyJXlHi+IZ9aj9xSZMxIP/SK8
	 CUubCdA8SA/LogwTE73nmfGhZRZ4T8kWxQ2yw6QIW3af5PaiFB/ZYh6kOWdFVeJ00L
	 m+eFD660kxZWm228GLE8gyo67K5QzsNvV6Hs1i8kr1Zae5bU5OftARSEACXu8PAvfp
	 srPasW2yohk62WkwGPutFLQ8iYtdTZCcrlBKAd7dNYtX/vWfoKebrMxQn2izzWYHxl
	 ClqYoMceMkGpw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=203/4]=20tools/init-dom0less:=20Avoid=20hardcoding=20GUEST=5FMAGIC=5FBASE?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718194741680
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, Henry Wang <xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>, Jason Andryuk <jason.andryuk@amd.com>
Message-Id: <ZmmSNWaOp6RYcrmU@l14>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop> <20240524225522.2878481-3-stefano.stabellini@amd.com>
In-Reply-To: <20240524225522.2878481-3-stefano.stabellini@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.867ad23be80446a7ae42bac702f26d9f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240612:md
Date: Wed, 12 Jun 2024 12:19:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, May 24, 2024 at 03:55:21PM -0700, Stefano Stabellini wrote:
> From: Henry Wang <xin.wang2@amd.com>
> 
> Currently the GUEST_MAGIC_BASE in the init-dom0less application is
> hardcoded, which will lead to failures for 1:1 direct-mapped Dom0less
> DomUs.
> 
> Since the guest magic region allocation from init-dom0less is for
> XenStore, and the XenStore page is now allocated from the hypervisor,
> instead of hardcoding the guest magic pages region, use
> xc_hvm_param_get() to get the XenStore page PFN. Rename alloc_xs_page()
> to get_xs_page() to reflect the changes.
> 
> With this change, some existing code is not needed anymore, including:
> (1) The definition of the XenStore page offset.
> (2) Call to xc_domain_setmaxmem() and xc_clear_domain_page() as we
>     don't need to set the max mem and clear the page anymore.
> (3) Foreign mapping of the XenStore page, setting of XenStore interface
>     status and HVM_PARAM_STORE_PFN from init-dom0less, as they are set
>     by the hypervisor.
> 
> Take the opportunity to do some coding style improvements when possible.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> +static int get_xs_page(struct xc_interface_core *xch, libxl_dominfo *info,
> +                       uint64_t *xenstore_pfn)
>  {

[...]

> +    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_PFN, xenstore_pfn);
> +    if (rc < 0) {
> +        printf("Failed to get HVM_PARAM_STORE_PFN\n");

Shouldn't we print error message on "stderr" instead?

> @@ -245,20 +232,11 @@ static int init_domain(struct xs_handle *xsh,
>      if (!xenstore_evtchn)
>          return 0;
>  
> -    /* Alloc xenstore page */
> -    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
> -        printf("Error on alloc magic pages\n");
> -        return 1;
> -    }
> -
> -    intf = xenforeignmemory_map(xfh, info->domid, PROT_READ | PROT_WRITE, 1,
> -                                &xenstore_pfn, NULL);
> -    if (!intf) {
> -        printf("Error mapping xenstore page\n");
> +    /* Get xenstore page */
> +    if (get_xs_page(xch, info, &xenstore_pfn) != 0) {
> +        printf("Error on getting xenstore page\n");

Same here.


In anycase:
Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

