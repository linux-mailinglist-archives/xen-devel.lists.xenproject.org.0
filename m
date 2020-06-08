Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7361F131D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 08:57:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiBiX-00075K-Rz; Mon, 08 Jun 2020 06:57:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiBiW-00075F-0D
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 06:57:08 +0000
X-Inumbo-ID: 441a3388-a955-11ea-96fb-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 441a3388-a955-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 06:57:07 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id q13so12484682edi.3
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jun 2020 23:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=7K9fVA8fnBITxOEn7HyaE9CzhB49ZAxRiYx5HD9McHY=;
 b=RmkY//izegF54FzYu1u/rApVmEdvNDeh3joGb1JiAWI9IO8lr/R/63wvRYuu13/XNW
 pmzQtLesVUnb/Vf28wzUlmOvhtWEmQtn/3nJdhhKlTzdlU/yL77B9whRva669G1OUXcZ
 nM0Zode9onRj/4pFJde6oFf67DNbqu14cGcrW12xuVD0kImKF1s33EMZOZQCbMsrXQ10
 wb8NQHiGeR3amTRbsK1iCK2gKtGhAtfMsaNdtBMRan7NeezmV9JuBcSnCupfURCFrJaf
 WPsO6oVelONM1mssYlXvPO4b+LvhzafM+ohSL0O7Xu3S7AajcsbeZozry/Z5D9OBnNhe
 xQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=7K9fVA8fnBITxOEn7HyaE9CzhB49ZAxRiYx5HD9McHY=;
 b=lc41+F+yn6MxjMGOnctEU4RFEl4qmaCbYQQDOJKjxc8WSh64Qs0BWw42X0O4aZXhy0
 gEkpFy5IBuslS8zcdjxZFGrSNRANSkfSK8urThCsvrWaN5hisuVL+Jwg5ugkSLv6Vb0w
 AAaq6QV8t0LXL2Ws8m81g+XUYmkWQtwc9tpId8WpsPfuCEFM56xEUwdf4fxEo/vYxVnt
 oEu1Fk7c9XjjeVNFITI5Qy4CRNWmTMhwMDRF/Cim8jjlm4AbObpOzvcW3IEJYnGz+i/K
 RhxMnIB0kQBnPlnTgCd+sL91SKoARULY263HyCx4G7Sr7X6Ahk7+ONDsI12bplwUrOjC
 c5mg==
X-Gm-Message-State: AOAM532EZEefRVOVXD0yuUqXn/HdQQ2fgakiL7wyxmGySfPfawNjgesi
 zYtKtYrxGFQoSeyM2CX/Uvw=
X-Google-Smtp-Source: ABdhPJxtQA7+v4NGtIDpi6p+3NRJ9oJydGUDfXD3OPH4BSekI6f5bTK6a4mc1BOfVer6wxdwzyyD1g==
X-Received: by 2002:a05:6402:1d29:: with SMTP id
 dh9mr20534849edb.269.1591599426452; 
 Sun, 07 Jun 2020 23:57:06 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id g61sm11601934ede.96.2020.06.07.23.57.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Jun 2020 23:57:05 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200607155154.15928-1-julien@xen.org>
In-Reply-To: <20200607155154.15928-1-julien@xen.org>
Subject: RE: [PATCH for-4.14] xen/arm: mm: Access a PT entry before the table
 is unmapped
Date: Mon, 8 Jun 2020 07:57:04 +0100
Message-ID: <001801d63d62$053ecf20$0fbc6d60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHJdNA9DFLPMohWTRTVE9LH4GQ7qKjn2eig
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Julien Grall' <jgrall@amazon.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 07 June 2020 16:52
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Julien Grall <jgrall@amazon.com>; Stefano Stabellini <sstabellini@kernel.org>;
> Julien Grall <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Subject: [PATCH for-4.14] xen/arm: mm: Access a PT entry before the table is unmapped
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> xen_pt_next_level() will retrieve the MFN from the entry right after the
> page-table has been unmapped.
> 
> After calling xen_unmap_table(), there is no guarantee the mapping will
> still be valid. Depending on the implementation, this may result to a
> data abort in Xen.
> 
> Re-order the code to retrieve the MFN before the table is unmapped.
> 
> Fixes: 53abb9a1dcd9 ("xen/arm: mm: Rework Xen page-tables walk during update")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
> 
> I spotted this issue while reworking how page-tables are mapped on Arm64
> during early boot. However the problem should be already there on Arm32.
> 
> I am actually quite amazed we haven't seen any crash on Arm32 because
> there is no direct map. So the mapping will not exist after calling
> xen_unmap_table().
> 
> I suspect this works because unmap_domain_page() doesn't flush the
> TLBs. So the TLB still likely have the entry cached (joy!).
> 
> This patch is a candidate for Xen 4.14 and should also be backported.
> ---
>  xen/arch/arm/mm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 1b14f4934570..9e2ff7c8005d 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1036,6 +1036,7 @@ static int xen_pt_next_level(bool read_only, unsigned int level,
>  {
>      lpae_t *entry;
>      int ret;
> +    mfn_t mfn;
> 
>      entry = *table + offset;
> 
> @@ -1053,8 +1054,10 @@ static int xen_pt_next_level(bool read_only, unsigned int level,
>      if ( lpae_is_mapping(*entry, level) )
>          return XEN_TABLE_SUPER_PAGE;
> 
> +    mfn = lpae_get_mfn(*entry);
> +
>      xen_unmap_table(*table);
> -    *table = xen_map_table(lpae_get_mfn(*entry));
> +    *table = xen_map_table(mfn);
> 
>      return XEN_TABLE_NORMAL_PAGE;
>  }
> --
> 2.17.1



