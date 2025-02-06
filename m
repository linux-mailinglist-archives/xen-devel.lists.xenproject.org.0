Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489DA2A6B9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 12:05:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882734.1292832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfzgk-0005dP-FO; Thu, 06 Feb 2025 11:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882734.1292832; Thu, 06 Feb 2025 11:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfzgk-0005bw-CO; Thu, 06 Feb 2025 11:04:54 +0000
Received: by outflank-mailman (input) for mailman id 882734;
 Thu, 06 Feb 2025 11:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ba3s=U5=bounce.vates.tech=bounce-md_30504962.67a49751.v1-9c990b17c548416f9b2ff7c4042f705a@srs-se1.protection.inumbo.net>)
 id 1tfzgj-0005bq-HO
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 11:04:53 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f23bfbf-e47a-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 12:04:50 +0100 (CET)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4YpZ4d3Y7szDRHx4W
 for <xen-devel@lists.xenproject.org>; Thu,  6 Feb 2025 11:04:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9c990b17c548416f9b2ff7c4042f705a; Thu, 06 Feb 2025 11:04:49 +0000
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
X-Inumbo-ID: 2f23bfbf-e47a-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1738839889; x=1739109889;
	bh=q5ywWBTkLFjjBjvJmrf2xXLm3TqSV5k5I1Ltojx1R/U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=X0eHB/hL2g9YM/kAZvezhe3+Ku8oDDsKuTPHX3rc9Sg534uZuRA310Cw+cqX0O5xc
	 cd/Is2gyEPqrbJN9GKB/7yqjLXEuQKgrIpEvH6e8zoeFmZNOcXDpKZ4yiSpeLsVMvX
	 RQvdpaBKrUcgPNsN6oAju6V/aUOL8/ql4j1UD8lKnYPGAJAE1zTLd6OKBEc2LuO2Kv
	 EICywk9j0QKMsYxs5lmSXkP3s+JdH+kFcvS+najwab5Gn9z9oUKcCHCJtTvn8/ghOn
	 yU+bDdEIV/+w7CULtRPGEBHrUxuXD1DPwwQYL0xPs+SvdNbkGrsWeHcHWpxdN3BnJE
	 nDzsgrhsTyjOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1738839889; x=1739100389; i=teddy.astie@vates.tech;
	bh=q5ywWBTkLFjjBjvJmrf2xXLm3TqSV5k5I1Ltojx1R/U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Fq8hGLFGtOZSnbXl5cJhFuhTjF4EDvYxKMN1Xr2lQbLGrBRlK4EMmnZJahtj6lr+D
	 YcJvdjdyrwpRAlygc1eTnEviB8Wf+YIUAQjhq1ClpT1Q+MyAGkQAeOm3Yal8MzcDLH
	 WnA80nOQayMkssqXZGGLUD/EtjZLt6ePsJEE+3uBzFp/1S0UK5uJG/B0oFepFAySFa
	 xNZ1+C6iF9RVLwKnArGan7gCow+cM2nJOvq1n56Gv0ibK/kKsb0ZqvKw/BlTtqgTC/
	 pj8TJsh/LBV0/dGj7fzbNJSBPG8p/3aiizX09CxwGAdlwEP+59yc5oqDbHQgrjqXad
	 fQ7FRXI8mdrzw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH]=20iommu/amd:=20Remove=20redundant=20values=20redefinitions?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1738839888379
Message-Id: <1d1e8d22-bdf3-4f2d-93be-2afc70c63654@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <bb95c2ffee689905293f73b6b71e8f5a5e666ec0.1738838825.git.teddy.astie@vates.tech>
In-Reply-To: <bb95c2ffee689905293f73b6b71e8f5a5e666ec0.1738838825.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9c990b17c548416f9b2ff7c4042f705a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250206:md
Date: Thu, 06 Feb 2025 11:04:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 06/02/2025 =C3=A0 11:49, Teddy Astie a =C3=A9crit=C2=A0:
> In amd_iommu_setup_domain_device, we redefine req_id and ivrs_dev
> without using it the first time we read it. This is effectively dead
> logic that we can refactor.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>   xen/drivers/passthrough/amd/pci_amd_iommu.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/pa=
ssthrough/amd/pci_amd_iommu.c
> index f96f59440b..1511a2a099 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -147,17 +147,14 @@ static int __must_check amd_iommu_setup_domain_devi=
ce(
>       if ( rc )
>           return rc;
>   
> -    req_id =3D get_dma_requestor_id(iommu->seg, pdev->sbdf.bdf);
> -    ivrs_dev =3D &get_ivrs_mappings(iommu->seg)[req_id];
> -    sr_flags =3D (iommu_hwdom_passthrough && is_hardware_domain(domain)
> -                ? 0 : SET_ROOT_VALID)
> -               | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
> -
> -    /* get device-table entry */
>       req_id =3D get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
>       table =3D iommu->dev_table.buffer;
> +    /* get device-table entry */
>       dte =3D &table[req_id];
>       ivrs_dev =3D &get_ivrs_mappings(iommu->seg)[req_id];
> +    sr_flags =3D (iommu_hwdom_passthrough && is_hardware_domain(domain)
> +                ? 0 : SET_ROOT_VALID)
> +               | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
>   
>       if ( domain !=3D dom_io )
>       {

Looks like there is a subtle issue with this change when mapping a 
phantom device.
In this case, we have bus,devfn not matching pdev->sbdf, but we want to 
know if there are unity regions for the actual device (not its phantom bdf)=
.

But there is only one check for SET_ROOT_WITH_UNITY_MAP (when req_id is 
different than PCI_BDF(bus, devfn). So I am not sure how problematic it is.

Teddy
Thanks


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


