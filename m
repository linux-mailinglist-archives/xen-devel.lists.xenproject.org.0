Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E1A904A9E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 07:06:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738609.1145743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHGBq-0002Ic-O0; Wed, 12 Jun 2024 05:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738609.1145743; Wed, 12 Jun 2024 05:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHGBq-0002Gd-IK; Wed, 12 Jun 2024 05:06:30 +0000
Received: by outflank-mailman (input) for mailman id 738609;
 Tue, 11 Jun 2024 15:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gKT=NN=bounce.vates.tech=bounce-md_30504962.66687428.v1-e812e3cb5a86419e990fcbce5cbc4876@srs-se1.protection.inumbo.net>)
 id 1sH3tM-0001Zg-2k
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:58:36 +0000
Received: from mail180-20.suw31.mandrillapp.com
 (mail180-20.suw31.mandrillapp.com [198.2.180.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 744f2ff4-280b-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 17:58:34 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-20.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4VzCyJ3tgpzFCWbSW
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 15:58:32 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e812e3cb5a86419e990fcbce5cbc4876; Tue, 11 Jun 2024 15:58:32 +0000
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
X-Inumbo-ID: 744f2ff4-280b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718121512; x=1718382012;
	bh=qBnJRR2GLdLoxmMsT2I+0SYigL3MpNvaVIQF5Xvqsx8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=inFLXmjUr+A4mLmjAo41HPAuw/gMxiJK2QU7ng9WBOvqWV718V9MZN1LWdrky9TgQ
	 tvQoCCMeYfrqW56860L0pKSIIVFFaD22HRkgt07MRpoeAbnLT+k2+O0/GIz3vvwt/M
	 MBEUOsYClgHiB0wbry7xaxhQL/BTwM4dqh47KJIR3eK4K3Mgbf+7CJ3JvdVLBgafpV
	 1p2AYPVOcBbZH3Q2a985EYoItpDnVPMBI175/cgldCkgxIdd8gYahcJH/+VRY4LktX
	 XPJSOxnIRdJen0wGoPQrjl3LZTI1I/KMhRQG6ptCqKohE5JJvzWLNwX6ELDYBwM4wq
	 UowVawaTNPuww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718121512; x=1718382012; i=anthony.perard@vates.tech;
	bh=qBnJRR2GLdLoxmMsT2I+0SYigL3MpNvaVIQF5Xvqsx8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gCtUEc4ans5+W9FORQ8cvdI4/fRKucB1NCMakkFbQ+4EejywKIiai1uDyEdhv1fPp
	 ujA49C8AQ4HxAuCXSaf16lvgduyFjc4QMZLiTket1uDty2z28sBF19gATSNYvp5xDP
	 iFQx/b+ouHoIdwPGIbaW9aa+aLezx4ojt0pBe2/e+c9I3KlRP2Sw+CrofZQT6e5Ar6
	 SAtSXtA6h3NUdXPLD5LLRkecTJoLm9FQRQWx5KuUz30FSHgtzR/OOlRpDeqyfhCTMi
	 4AFbYV19/sL1OuYrNTdpKeMeeaCML94Y+la8NImhuN+6geVbbdNIFgoiWnqoaznuvk
	 94hri9KUyFjXA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19=3F=20v6=203/9]=20xen:=20Refactor=20altp2m=20options=20into=20a=20structured=20format?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718121511518
To: =?utf-8?Q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>
Message-Id: <ZmhxFFnanyUzI4RY@l14>
References: <cover.1718038855.git.w1benny@gmail.com> <dcf08c40e37072e18e5e878df8778ce459897bdc.1718038855.git.w1benny@gmail.com>
In-Reply-To: <dcf08c40e37072e18e5e878df8778ce459897bdc.1718038855.git.w1benny@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e812e3cb5a86419e990fcbce5cbc4876?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240611:md
Date: Tue, 11 Jun 2024 15:58:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 05:10:41PM +0000, Petr Bene=C5=A1 wrote:
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
> 
> Encapsulate the altp2m options within a struct. This change is preparator=
y
> and sets the groundwork for introducing additional parameter in subsequen=
t
> commit.
> 
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> Acked-by: Julien Grall <jgrall@amazon.com> # arm
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
> ---
>  tools/libs/light/libxl_create.c     | 6 +++---

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


