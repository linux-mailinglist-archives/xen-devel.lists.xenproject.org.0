Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6394A91F8E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957854.1350873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QC9-0004GG-Ni; Thu, 17 Apr 2025 14:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957854.1350873; Thu, 17 Apr 2025 14:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QC9-0004Eo-L5; Thu, 17 Apr 2025 14:26:25 +0000
Received: by outflank-mailman (input) for mailman id 957854;
 Thu, 17 Apr 2025 14:26:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqnP=XD=bounce.vates.tech=bounce-md_30504962.68010f8d.v1-f18ffbfdef4e4b06b33ded64d58ff0a9@srs-se1.protection.inumbo.net>)
 id 1u5QC8-0004Ee-BL
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:26:24 +0000
Received: from mail128-130.atl41.mandrillapp.com
 (mail128-130.atl41.mandrillapp.com [198.2.128.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efbbae96-1b97-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 16:26:23 +0200 (CEST)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-130.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZdgDs5FG9zS62GZb
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 14:26:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f18ffbfdef4e4b06b33ded64d58ff0a9; Thu, 17 Apr 2025 14:26:21 +0000
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
X-Inumbo-ID: efbbae96-1b97-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744899981; x=1745169981;
	bh=hzMZw+Kzy+rG82e2GAFteX2P3tXO/5Tc4kWbnxQkics=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=goD6oocia8xhMcuHu8GCAQBfuO2igy7MWRqtd/eNlkVlBOffnIxR6A7Ywhhw//I9Z
	 o2swF2BaAji80r+u6zZ9o+kSHgTopq4Nd4w2dMJDnpYfIAWbhdNhAxHyzdN01LJjX5
	 S7BpSztjlJYo6uHqb1XPnMfY+54WMBIqUJOFTpa6rGOzdDbCNQez+DeBXbG8jpeTDT
	 n/9dXBJrBjC4moC8d8UGRVZKC9NoBf5yPApCNaud+LFH7NEEgGmgr4Roeqn7ksGX9J
	 zXPTOHFXOFWBy27H51Ik398Qs1ncg6OcAQuo0L096SWLwh0tZmKilPNVm/g6bV7AEa
	 0asW6Xk+OX6ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744899981; x=1745160481; i=teddy.astie@vates.tech;
	bh=hzMZw+Kzy+rG82e2GAFteX2P3tXO/5Tc4kWbnxQkics=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RnoNQMNMHyhV+DgDlxqK4tteHEdQJKEuwHVQD6BS1TK5cVJ3S5LtUqzfDLUgylkyA
	 uze4dga/mg3E7CO/1T85vhJBG706PiwLHbDTVHUN+rZIrkpUscv7hbPPYU2roApbTb
	 uVL94NCBFE469DJkSTeOsu0VwNk2+SP+O+GmQccTG++9yvPReU19/9pGhurk7KLoAJ
	 4BmLpaJgeILFXC158WMJQQlFdwEX4AhvVK8hL8ZMVca2Xe4Gqg1E8qFoAZOFaQRste
	 QYjwnU2FUfsumHoU/7AmR4BFhcUpa1FL+Nf9EgSq9xD2KDtTpj8tGGot+YtyhH7/Yh
	 tl3zVNQXH2K6g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20vmx:=20Don't=20open-code=20vmresume/vmlaunch=20instructions?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744899980758
Message-Id: <84950ea3-c57f-4d65-b86b-2046f376900e@vates.tech>
To: xen-devel@lists.xenproject.org, security@xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <2d9480b75c80d49952812769f283a220c1753571.1744899753.git.teddy.astie@vates.tech>
In-Reply-To: <2d9480b75c80d49952812769f283a220c1753571.1744899753.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f18ffbfdef4e4b06b33ded64d58ff0a9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250417:md
Date: Thu, 17 Apr 2025 14:26:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 17/04/2025 =C3=A0 16:24, Teddy Astie a =C3=A9crit=C2=A0:
> binutils 2.25 has support for assembling vmresume/vmlaunch
> instructions, so we don't need to open-code the byte sequences
> for these opcodes anymore.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>   xen/arch/x86/hvm/vmx/entry.S | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
> index 6aaeb28a5b..2bfee715b3 100644
> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -21,9 +21,6 @@
>   #include <asm/asm_defns.h>
>   #include <asm/page.h>
>   
> -#define VMRESUME     .byte 0x0f,0x01,0xc3
> -#define VMLAUNCH     .byte 0x0f,0x01,0xc2
> -
>   FUNC(vmx_asm_vmexit_handler)
>           SAVE_ALL
>   
> @@ -166,11 +163,11 @@ UNLIKELY_END(realmode)
>           jns  .Lvmx_launch
>   
>   /*.Lvmx_resume:*/
> -        VMRESUME
> +        vmresume
>           jmp  .Lvmx_vmentry_fail
>   
>   .Lvmx_launch:
> -        VMLAUNCH
> +        vmlaunch
>   
>   .Lvmx_vmentry_fail:
>           sti

Not a security issue, I sent by mistake to the wrong mailing list.


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



