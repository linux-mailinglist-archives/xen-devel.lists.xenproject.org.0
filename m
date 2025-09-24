Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D89B993DD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 11:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129218.1469265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1M8Y-0003F3-Td; Wed, 24 Sep 2025 09:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129218.1469265; Wed, 24 Sep 2025 09:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1M8Y-0003Cb-Qy; Wed, 24 Sep 2025 09:50:10 +0000
Received: by outflank-mailman (input) for mailman id 1129218;
 Wed, 24 Sep 2025 09:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yijw=4D=bounce.vates.tech=bounce-md_30504962.68d3becc.v1-a95f437e87e14ac58dcb47320785c0ef@srs-se1.protection.inumbo.net>)
 id 1v1M8W-0003CV-Fs
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 09:50:08 +0000
Received: from mail180-36.suw31.mandrillapp.com
 (mail180-36.suw31.mandrillapp.com [198.2.180.36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d90a2ae9-992b-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 11:50:06 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-36.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cWsXD3jnmzlfqVk
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 09:50:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a95f437e87e14ac58dcb47320785c0ef; Wed, 24 Sep 2025 09:50:04 +0000
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
X-Inumbo-ID: d90a2ae9-992b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1758707404; x=1758977404;
	bh=+T+rqHkFzieoA2dv9XOW5DVES6ipn2iPK5DazaGcEFg=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uxbXQCDJ1eVRAQLUZ0X+1d/9V8R5mDdGbP71ofZsf47qbBNXrF0EQPfWiARq6cm4T
	 noF/L/JTlxzyX7qO9SfsE9xSTENRfasUOutS3EWCmoDmbQy3xvemwctVbeKPhy++un
	 PskfunL1gsiBhvvHwZImn5cvwfWlgDLzKerNaTARgshKMsYtBoHpX6AZYEoG4XItYm
	 uVxjsUxxolOoTH9aBCQxN4cgg+yQgLWVbCi9v0rhli4HoyiVtUhhbnlHUJwyvxVQuy
	 gSL6fJG81hoDIoJm+cxs81Fo8wqFsRlSo/vpnhsv3XH23LeOj+GLc6+8pAc7E3ISjt
	 pmy8c3nr62Jig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1758707404; x=1758967904; i=yann.sionneau@vates.tech;
	bh=+T+rqHkFzieoA2dv9XOW5DVES6ipn2iPK5DazaGcEFg=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MOIsg1WLeWnxxpEC3iyWQJ4HPtxfF9WabwSooGok5gyOp2HxH0XPaDliBhxouar4T
	 xPLV9tCYsMRzrd/9YeZy72QmiJmFGtFo21FtV76wcnfKnvbXS7BZ80/PEwATVZkGnF
	 1HZSx1OXVf62flcoTTjmzcHLUNy8m/KmzYz2fesCRz/8t/YUgJoyAeB35cXzv3Z5aN
	 02uQoM6L2ztAbyFCHd0ixTDctMDChn2lr0lk1g2MEYnfm7XB0uhZbMQL+JWqjLMAVr
	 P66DrvtVsswO2WBLBVNxG4SCJyhOFxV/7QbO6Oi51opE50ft6QvHdMyfsuLgvNA1m7
	 wBAvsvZO9g/Pg==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=208/8]=20arm/pci:=20enable=20vpci=20for=20hwdom=20when=20pci-scan=20is=20enabled?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1758707403897
Message-Id: <1a591f0d-78cc-439a-b5d9-42f63fb3bd79@vates.tech>
To: xen-devel@lists.xenproject.org
References: <cover.1758618839.git.mykyta_poturai@epam.com> <2ac11726b5a236b022da5c51235e9a4efd92087f.1758618839.git.mykyta_poturai@epam.com>
In-Reply-To: <2ac11726b5a236b022da5c51235e9a4efd92087f.1758618839.git.mykyta_poturai@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a95f437e87e14ac58dcb47320785c0ef?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250924:md
Date: Wed, 24 Sep 2025 09:50:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 9/24/25 10:01, Mykyta Poturai wrote:
> With pci-scan implemented it is now possible to use vpci for hardware
> domains. Update has_vpci to reflrect this change.

Small typo in commit message "reflect".

> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/include/asm/domain.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index af3e168374..dbe3347cea 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -305,8 +305,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>   
>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>   
> -/* vPCI is not available on Arm */
> -#define has_vpci(d)    ({ (void)(d); false; })
> +#define has_vpci(d)    (is_hardware_domain(d) && hwdom_uses_vpci())
>   
>   struct arch_vcpu_io {
>       struct instr_details dabt_instr; /* when the instruction is decoded */


-- 


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



