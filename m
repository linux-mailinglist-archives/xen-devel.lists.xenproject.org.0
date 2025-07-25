Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA98B12062
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058045.1425708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJoh-0000Bm-2r; Fri, 25 Jul 2025 14:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058045.1425708; Fri, 25 Jul 2025 14:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJoh-00009x-0B; Fri, 25 Jul 2025 14:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1058045;
 Fri, 25 Jul 2025 14:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uo0a=2G=bounce.vates.tech=bounce-md_30504962.68839aa3.v1-a64c343d64be4b199ae25f136d0f516b@srs-se1.protection.inumbo.net>)
 id 1ufJof-00009o-JD
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:54:33 +0000
Received: from mail145-22.atl61.mandrillapp.com
 (mail145-22.atl61.mandrillapp.com [198.2.145.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 431c0aae-6967-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 16:54:28 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-22.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bpW9b1f2YzFCWYf0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 14:54:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a64c343d64be4b199ae25f136d0f516b; Fri, 25 Jul 2025 14:54:27 +0000
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
X-Inumbo-ID: 431c0aae-6967-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753455267; x=1753725267;
	bh=rywDZ5XoRH1dOVxyyoIW8YeXUxvCj/EWPSYoi1xWSY8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tIoXeAlNf7LEiVZFOy3D3k2eU1g5QOsk9bt29krRMoRzpAcG2LeMDHO7aEXFH+Wfq
	 VF6OKXKCFV06lu8/JiL1YWDikf7F8I8MJT3g9OUREpWeA3E9hAYCrV/Q+dZlXge+Z1
	 CL9Rddsd+B35VdtWoQySofimI05xjXFD3LL1W/fwIIPm1+4jvRmfcyXLU/SdWgw4I+
	 L7EUDE+8+vsA0E4k6xb6O2q5mv0BVvBtXqUqvRbfS788zWxQwXTVKnaVNwVwTDS+EM
	 9rMr91Fy5Wb16/hMBvR6u04hcddyVBKKWJmsE+sUBh+RzqL9Z9UtOh57UmH3Wn8VlI
	 h006iw1Ipt9fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753455267; x=1753715767; i=teddy.astie@vates.tech;
	bh=rywDZ5XoRH1dOVxyyoIW8YeXUxvCj/EWPSYoi1xWSY8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QFhTXVynd5Jsh/kYVZ2gIZb1x8oB8T8xXPkYYLNZHgZGN9YFypEj3YSC5w8rbL/ku
	 pQKpHBSUeMwmrXXEpetplLeSVPzBZwnqpesg3Ozw5TDh/Qg8yChgJylpGayVRJDrAd
	 tzTOWEmTc1UWcpCZDOiMXHo5zTTFNSDebhGeMpJBto2rXYgbCJeMratStwkArAuHCh
	 cNfpba6Qz2hXFyThiwKVvaF2OHQhN1wyQc7R/zgn2c+dye9w8mBHMUDd1auZHcn/EE
	 ca1rostAc0YEn6VHrETHDo4BWEoQZ+0q0+wssVCMyW69go9aVcyjNXIkqcD13GR2pD
	 zZBZAWEFnmYtw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=203/6]=20vpci:=20rename=20and=20export=20vpci=5Fbar=5Fadd=5Frangeset?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753455266324
Message-Id: <5c4ef157-5741-4f19-b274-f2320030ded1@vates.tech>
To: "Mykyta Poturai" <Mykyta_Poturai@epam.com>, xen-devel@lists.xenproject.org
Cc: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <cover.1753450965.git.mykyta_poturai@epam.com> <2c7999d1186738a9f57364f127b9fbbbd440ca78.1753450965.git.mykyta_poturai@epam.com>
In-Reply-To: <2c7999d1186738a9f57364f127b9fbbbd440ca78.1753450965.git.mykyta_poturai@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a64c343d64be4b199ae25f136d0f516b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250725:md
Date: Fri, 25 Jul 2025 14:54:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25/07/2025 =C3=A0 16:26, Mykyta Poturai a =C3=A9crit=C2=A0:
> Export functions required for SR-IOV support.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/drivers/vpci/header.c | 8 ++++----
>   xen/include/xen/vpci.h    | 2 ++
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index f33fb27bde..f947f652cd 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -733,8 +733,8 @@ static void cf_check rom_write(
>       }
>   }
>   
> -static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar =
*bar,
> -                            unsigned int i)
> +int vpci_bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *b=
ar,
> +                          unsigned int i)
>   {
>       char str[32];
>   
> @@ -950,7 +950,7 @@ static int cf_check init_header(struct pci_dev *pdev)
>           else
>               bars[i].type =3D VPCI_BAR_MEM32;
>   
> -        rc =3D bar_add_rangeset(pdev, &bars[i], i);
> +        rc =3D vpci_bar_add_rangeset(pdev, &bars[i], i);
>           if ( rc )
>               goto fail;
>   
> @@ -1009,7 +1009,7 @@ static int cf_check init_header(struct pci_dev *pde=
v)
>               rom->type =3D VPCI_BAR_EMPTY;
>           else
>           {
> -            rc =3D bar_add_rangeset(pdev, rom, num_bars);
> +            rc =3D vpci_bar_add_rangeset(pdev, rom, num_bars);
>               if ( rc )
>                   goto fail;
>           }
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 0f0f321023..06f7039f20 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -294,6 +294,8 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg=
, unsigned int len,
>   
>   /* Map/unmap the BARs of a vPCI device. */
>   int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom=
_only);
> +int vpci_bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *b=
ar,
> +                            unsigned int i);
                              ^
nit, alignment is a bit off

With that fixed

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

>   
>   #endif /* __XEN__ */
>   



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



