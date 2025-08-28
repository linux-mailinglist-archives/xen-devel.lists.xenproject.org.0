Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1DB39C20
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098539.1452564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbJH-00050G-4R; Thu, 28 Aug 2025 12:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098539.1452564; Thu, 28 Aug 2025 12:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbJH-0004xj-1Q; Thu, 28 Aug 2025 12:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1098539;
 Thu, 28 Aug 2025 12:00:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SuvV=3I=bounce.vates.tech=bounce-md_30504962.68b044f1.v1-df3a85872148444bb6c948ffe100776a@srs-se1.protection.inumbo.net>)
 id 1urbJE-0004wm-Rc
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:00:52 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3edcf64-8406-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 14:00:51 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4cCKjY2wcDzBsV4FP
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 12:00:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 df3a85872148444bb6c948ffe100776a; Thu, 28 Aug 2025 12:00:49 +0000
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
X-Inumbo-ID: a3edcf64-8406-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756382449; x=1756652449;
	bh=6pPB/ZeNPl1z+pjHy/cFU8hENtGb2xGrwEILtNQ4pDY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RsJQxCnKrYOJcWpHoTZgNA9csEdowu7d7ZQlD/1YeYO1Udy0AiDd4X86PHTh9O3c2
	 15iczAVs6seRPgsX630AKHW43zpEGiOwpLyof7HzAyWatbNhB+FkHzcqtkoJPtvSBx
	 5OwtuLHwSSPTWBUcmsleU1ThQfrxkBMgcGt8sx+DJqQY0ANR4+q+zUzgzFLca255Xs
	 Piuq8eE1UegupM4f52zeYe3gPGUYc7c2N+xmyTjalFcyyzcXPjit8KN/7QK6jBAziw
	 +qGT8fqNiApRijVkylrdtuaqT2wwyu5YCVfc2UOukuFULV05ykDcf7JtNPt53G7Jn0
	 tkNMLragAq+xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756382449; x=1756642949; i=teddy.astie@vates.tech;
	bh=6pPB/ZeNPl1z+pjHy/cFU8hENtGb2xGrwEILtNQ4pDY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yOwlcl7Sd9xMNWlwGjXJ79pIsAvCEOv+rDrSEhRsR/US+YQMKfYLStj76TWaAumVG
	 YlbcZowNsBD9zBen7Bw6TAKW/n4oHc5k3uV2XkG2wtcPnOqbbGnZMrqg05GT9oPALX
	 3l4UwIpRAZU1o3TZylwlGNVpvVpj2nRMdIrFVlWSW5EItNqHP/lmFsyLlstzOwwQhB
	 AU84+zNAKbnypGvtdPLCYOAMXFLBHso+68D1kixljv0z7Yd9SPxyRyLhZKk5D6qA8c
	 eD6Tn5YZQsqAW1CAufLew5ezz9ar+ab/3EY3zP7vC4MbqX964yNEhNpTlYvRlZF70l
	 fwTsDj2aLIR7w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20hvmloader:=20Update=20to=20SMBIOS=202.6?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756382448088
Message-Id: <6e90b1af-57d6-4c3c-8e23-078309bef63c@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech> <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com> <74665857-3f0b-43e6-b31f-d498d9e7fdc3@vates.tech> <8e126855-ed0b-4046-a018-8fca6d20db49@citrix.com>
In-Reply-To: <8e126855-ed0b-4046-a018-8fca6d20db49@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.df3a85872148444bb6c948ffe100776a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250828:md
Date: Thu, 28 Aug 2025 12:00:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 28/08/2025 =C3=A0 12:24, Andrew Cooper a =C3=A9crit=C2=A0:
> I'd be tempted to be rather more explicit.
> 
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index 82b9c05a76b7..f1592dc059e2 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -973,6 +973,13 @@ typedef struct dom0_vga_console_info {
>  =C2=A0#define xen_vga_console_info dom0_vga_console_info
>  =C2=A0#define xen_vga_console_info_t dom0_vga_console_info_t
>   
> +/*
> + * The domain handle is chosen by the toolstack, and intended to hold a =
UUID
> + * conforming to RFC 9562 (i.e. big endian).
> + *
> + * Certain cases (e.g. SMBios) transform it to a Microsoft GUID (little
> + * endian) for presentation to the guest.
> + */
>  =C2=A0typedef uint8_t xen_domain_handle_t[16];
>   
>  =C2=A0__DEFINE_XEN_GUEST_HANDLE(uint8,=C2=A0 uint8_t);

I'm ok with it, although it sounds a bit like this UUID could be a 
little endian GUID in some cases.


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



