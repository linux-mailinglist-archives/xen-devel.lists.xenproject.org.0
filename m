Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB23ACC898F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 16:53:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188895.1509912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVtq0-0001jE-Kc; Wed, 17 Dec 2025 15:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188895.1509912; Wed, 17 Dec 2025 15:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVtq0-0001hC-Hf; Wed, 17 Dec 2025 15:53:16 +0000
Received: by outflank-mailman (input) for mailman id 1188895;
 Wed, 17 Dec 2025 15:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tELU=6X=bounce.vates.tech=bounce-md_30504962.6942d1e7.v1-99a52fcc01f648c7b119ad0d794d5bed@srs-se1.protection.inumbo.net>)
 id 1vVtpz-0001h6-Cy
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 15:53:15 +0000
Received: from mail186-20.suw21.mandrillapp.com
 (mail186-20.suw21.mandrillapp.com [198.2.186.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e2c5eff-db60-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 16:53:13 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-20.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4dWdcS0DyLzFCWmvh
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 15:53:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 99a52fcc01f648c7b119ad0d794d5bed; Wed, 17 Dec 2025 15:53:11 +0000
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
X-Inumbo-ID: 7e2c5eff-db60-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765986792; x=1766256792;
	bh=6RDxNa/bxEp+ttbWuXALs6hqj1w9id+IWGqp/NgQemQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=C76IhOJA+BbGrHO14dKqIHyV4vzreTDqb8N4ODuaHG+PH3fy99VC+lKQ/BmMoERpq
	 c6+PKPtySfqYvlkxbn2+eL8UxvfeVTOdGWAOIwM12oZ81FCj1MKrmz4jxuYHIaFycz
	 pz+juaEYNtMw+SGH4iyvLuTYfWI1ITXyEPYECcZ+T512GwN3+EZYpb/g8LQ8+SC+gB
	 w3kQnQDxq/jhfzq+tJog8ruwk+Sf/lLukjRgwxq8xFlG9Aj/s/+0HZgIwXaCaWKmUz
	 xLMgmzyNp2WbssSi58ZChklcG6JtUn/gzvgZX1r8b81HFFDqMtxLoOXFJsUa/C5WW1
	 OF3Qu6JCAsj2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765986792; x=1766247292; i=anthony.perard@vates.tech;
	bh=6RDxNa/bxEp+ttbWuXALs6hqj1w9id+IWGqp/NgQemQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xVbJe8jGHmH/ITFFlrENlDshb7HL0jF003Ccpv50PXU1zW1oYbVR9tl63Hik64jay
	 hqirTvnjVZK4cW6IiZg8qs6FqyBMvb47frmS60MIgAFKxoeN3HulkHNGg6HbnUPUOp
	 tfmt3CnNhP4N55OEOYTPCznUrXxhhRdEoZyt0V1lyY7+dBmAf5apGOrKrQ7vLf6Ngl
	 ES/OHyHbTyBt6XTFpfbTsir+ELTyiatjcYlQTsYlBCT20oiSt3KzV15JwjXVYYVApW
	 umYkvDGUVPn1dyg3JnzgWNlCKB0pfaQu1BtxzfHz0ZbWP7UIa/jIltpVq27rOV8wxc
	 bQJP089ulPfGw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RESEND=20PATCH=20v2=201/3]=20xen:=20Define=20xen=5Fdomain=5Fhandle=5Ft=20encoding=20and=20formatting?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765986790604
To: "Teddy Astie" <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <aULR5vTz1DEHxu8X@l14>
References: <cover.1756460430.git.teddy.astie@vates.tech> <a12f705dae18ae2b87c9e21027d14c4e60bff146.1756460430.git.teddy.astie@vates.tech>
In-Reply-To: <a12f705dae18ae2b87c9e21027d14c4e60bff146.1756460430.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.99a52fcc01f648c7b119ad0d794d5bed?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251217:md
Date: Wed, 17 Dec 2025 15:53:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Aug 29, 2025 at 09:58:15AM +0000, Teddy Astie wrote:
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index 82b9c05a76..a219ef870f 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -973,6 +973,13 @@ typedef struct dom0_vga_console_info {
>  #define xen_vga_console_info dom0_vga_console_info
>  #define xen_vga_console_info_t dom0_vga_console_info_t
>  
> +/*
> + * The domain handle is chosen by the toolstack, and intended to hold a UUID
> + * conforming to RFC 9562 (i.e. big endian).
> + *
> + * Certain cases (e.g. SMBios) transform it to a Microsoft GUID (little
> + * endian) for presentation to the guest.
> + */

So, there's already a definition about this, but it's a comment on
XENVER_guest_handle (in public/version.h):

> /* arg == xen_domain_handle_t.
>  *
>  * The toolstack fills it out for guest consumption. It is intended to hold
>  * the UUID of the guest.
>  */

We can add that the binary format is most significant byte or network
byte order, but that's already the format stated in RFC 4122 and its
successor RFC 9562.

Also, I don't think it is useful here to point out how that handle/UUID
might be used/transformed by guest.

>  typedef uint8_t xen_domain_handle_t[16];

Cheers,

-- 

--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



