Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93843A6AB62
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 17:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922976.1326739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvJ2a-0007Gb-3n; Thu, 20 Mar 2025 16:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922976.1326739; Thu, 20 Mar 2025 16:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvJ2a-0007EW-18; Thu, 20 Mar 2025 16:46:44 +0000
Received: by outflank-mailman (input) for mailman id 922976;
 Thu, 20 Mar 2025 16:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gs4t=WH=bounce.vates.tech=bounce-md_30504962.67dc466f.v1-fadaaee4b8b34f67b425c65aab174710@srs-se1.protection.inumbo.net>)
 id 1tvJ2Y-0007EO-Ie
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 16:46:42 +0000
Received: from mail134-16.atl141.mandrillapp.com
 (mail134-16.atl141.mandrillapp.com [198.2.134.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e558248f-05aa-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 17:46:40 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-16.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4ZJWgg1qw9zB5p4tX
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 16:46:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fadaaee4b8b34f67b425c65aab174710; Thu, 20 Mar 2025 16:46:39 +0000
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
X-Inumbo-ID: e558248f-05aa-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1742489199; x=1742759199;
	bh=8Xo+x/2C9t1vWpO4HSebgj6NrkPdkEj6wnV4ktQ7KDA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nn2CBv1HOUaVy1ySHRhCIuaLecYU3uiZRyn7IQrA0ZZAcByy6jrgxED4X4aUT22S0
	 t1PEqodg7ORDWNejVPpfrHLeWqLeGNaJjdN+FdyPDAeeFnwyxlMlo5MQ52O7DmTo9N
	 Z0qo1ImrBkOV27t37xbX7mgv109UE/kR6Ujfc8+5xvmIJnQcD1w8vquKqpnIE+3FvL
	 Resln1+IhwsCYlBmIEXcBoXu3C8fmamY4BOKZfupTqrAp3lbdv2R9O1NlMEnDiyrz1
	 B9wSwJyLCti6J7C82BGpWi3sDP53LJ9eTDxhcZKixQtYL/xrH/PMRBhr32MZwadWuI
	 /OX2JsdcrHUtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1742489199; x=1742749699; i=anthony.perard@vates.tech;
	bh=8Xo+x/2C9t1vWpO4HSebgj6NrkPdkEj6wnV4ktQ7KDA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Cfpfw3YKLncNAwUsPKYJPBJBwDHiOYO+sY2Z5TkoOfbHk5RMJjsRYld+rDjorDCjp
	 rSO992ozNe69Smyg4o3SjsQA0FNdN551ghQYXZIjgDYsnIStn6JPr8vn3cFMO11bri
	 3+Q88c8uXtuEUHDEEFC7aLCtEHDZS9AZ8J3gfVxiuTRZ3CAO+hg8MtHM3JHiMaZvRX
	 /cJ09rqY7vQ+dlWm5hId5D8wG8YxBqv5uWY8JA4ZdGwJwltIC3PvjsJUF3WUtdTKc4
	 DRXK6t2CSchSyuG+pYfgDUZrxN1x0YzBtD+IQOOOuOkQrVWlQw+WHhe/1uqm5y8oGR
	 ahb9idtnOOm9g==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20tools/arm:=20Fix=20nr=5Fspis=20handling=20v2?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1742489197873
To: "Michal Orzel" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, "Juergen Gross" <jgross@suse.com>, "Luca Fancellu" <luca.fancellu@arm.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>
Message-Id: <Z9xGbTYJG6s6Wvl0@l14>
References: <20250318090013.100823-1-michal.orzel@amd.com>
In-Reply-To: <20250318090013.100823-1-michal.orzel@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fadaaee4b8b34f67b425c65aab174710?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250320:md
Date: Thu, 20 Mar 2025 16:46:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Mar 18, 2025 at 10:00:13AM +0100, Michal Orzel wrote:
> We are missing a way to detect whether a user provided a value for
> nr_spis equal to 0 or did not provide any value (default is also 0) which
> can cause issues when calculated nr_spis is > 0 and the value from domain
> config is 0. Fix it by setting default value for nr_spis to UINT32_MAX
> (max supported nr of SPIs is 960 anyway).
> 
> Fixes: 55d62b8d4636 ("tools/arm: Reject configuration with incorrect nr_spis value")
> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  tools/libs/light/libxl_arm.c     | 7 ++++---
>  tools/libs/light/libxl_types.idl | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 2d895408cac3..5bb5bac61def 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -84,7 +84,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>                                        libxl_domain_config *d_config,
>                                        struct xen_domctl_createdomain *config)
>  {
> -    uint32_t nr_spis = 0;
> +    uint32_t nr_spis = 0, cfg_nr_spis = d_config->b_info.arch_arm.nr_spis;
>      unsigned int i;
>      uint32_t vuart_irq, virtio_irq = 0;
>      bool vuart_enabled = false, virtio_enabled = false;
> @@ -181,13 +181,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>  
>      LOG(DEBUG, "Configure the domain");
>  
> -    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
> +    /* We use UINT32_MAX to denote if a user provided a value or not */
> +    if ((cfg_nr_spis != UINT32_MAX) && (nr_spis > cfg_nr_spis)) {
>          LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
>              nr_spis);
>          return ERROR_FAIL;
>      }
>  
> -    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
> +    config->arch.nr_spis = (cfg_nr_spis != UINT32_MAX) ? cfg_nr_spis : nr_spis;

Could you try to check only once if there is a user provided value for
nr_spis?

>      LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
>  
>      switch (d_config->b_info.arch_arm.gic_version) {
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index bd4b8721ff19..129c00ce929c 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -723,7 +723,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                 ("vuart", libxl_vuart_type),
>                                 ("sve_vl", libxl_sve_type),
> -                               ("nr_spis", uint32),
> +                               ("nr_spis", uint32, {'init_val': 'UINT32_MAX'}),

Could you introduce something like LIBXL_NR_SPIS_DEFAULT in libxl.h
instead? (Like we have LIBXL_MAX_GRANT_DEFAULT or LIBXL_MEMKB_DEFAULT)

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

