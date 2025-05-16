Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2BAAB9C45
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 14:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987070.1372532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuIb-0005C4-OA; Fri, 16 May 2025 12:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987070.1372532; Fri, 16 May 2025 12:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuIb-00059p-LK; Fri, 16 May 2025 12:36:25 +0000
Received: by outflank-mailman (input) for mailman id 987070;
 Fri, 16 May 2025 12:36:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sGU9=YA=bounce.vates.tech=bounce-md_30504962.68273144.v1-77e1a3f21d024d78aeac06f20608c89b@srs-se1.protection.inumbo.net>)
 id 1uFuIa-00059j-DO
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 12:36:24 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f4a174a-3252-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 14:36:22 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzRQX4g2fzMQxfTF
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 12:36:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 77e1a3f21d024d78aeac06f20608c89b; Fri, 16 May 2025 12:36:20 +0000
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
X-Inumbo-ID: 5f4a174a-3252-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747398980; x=1747668980;
	bh=kkmPraR7ltUZhtF3rGsI2qjde3oV9KdOXdjtmRkLjkM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Adko5i2HL7TP/6rchYROO+Nz+S443nmL3I3BRoTeO5GhHgmp5LGzanDavqfttlveb
	 U6U+w/U5UmmenM1bVDuEzYkFJiieYFE9gdUvSMSIBHU+/QTmJqeTSKd1X3fxlRo4F2
	 TNCOWRrup9D9YKxnBwDY+RZec94+evNtcnK+jGfQbqVcMo/OvaGrlFtqe5tSx+u9r0
	 HU+TyxuU025mHTfdxatga/WQS+ZS6f5zm5Oei8xzH/qSVqa6v2HtkzQ1+JWEc5T+Ro
	 J/hKDF8D73iFT3ZoUEyuPHEl/ybRUYFW9YEXF6PH1/XELaL189yeMThl/ySqygbpkC
	 R2r0uNcQM4WeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747398980; x=1747659480; i=teddy.astie@vates.tech;
	bh=kkmPraR7ltUZhtF3rGsI2qjde3oV9KdOXdjtmRkLjkM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ogmoQrjd+/8A6VRmfej22xjL63wRcF5rMYS4nYSJOtJFJAeGfEZwwVE4Kt8ju5qJz
	 keYE2ErpvpQzJdSFfOWoS2X5bKZhEmlq3HliAfXtl2/D7Ete14Xv1jsdlJisl54pg3
	 0OtRTGxWrtl9ZNgiju0B70+bw+faLYiHBxcCMqZ/pdTKazydYcL7vHLvx/tWUqWFfF
	 UIXrCraSJEz2vy6x0CQK6BewBTcemG5oA8alhxXHPKglR+frJdcFCtQw3qseb918/d
	 fhTGDOdIZabZKKchRuXc5wwi08vPxOjzZXe2023uQyT6P9H+KjYsREysydg/M1kmBF
	 jbxZJnOMhiZKA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=2000/16]=20Confidential=20computing=20and=20AMD=20SEV=20support?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747398978777
Message-Id: <9fa006e3-f47a-42a2-afa9-a10c1aa07172@vates.tech>
To: "=?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Tim Deegan" <tim@xen.org>, "Christian Lindig" <christian.lindig@citrix.com>, "David Scott" <dave@recoil.org>
References: <cover.1747312394.git.teddy.astie@vates.tech> <7dc4c08e-b80c-4ee9-a5d7-716ba3a9cfc0@suse.com>
In-Reply-To: <7dc4c08e-b80c-4ee9-a5d7-716ba3a9cfc0@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.77e1a3f21d024d78aeac06f20608c89b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 12:36:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 16/05/2025 =C3=A0 12:54, J=C3=BCrgen Gro=C3=9F a =C3=A9crit=C2=A0:
> On 16.05.25 11:31, Teddy Astie wrote:
>>
>> In order to create a confidential computing domain, the process is 
>> follow :
>> =C2=A0 - create a HVM/PVH domain with XEN_DOMCTL_CDF_coco
>> =C2=A0 - populate initial memory as usual
>> =C2=A0 - apply coco_prepare_initial_mem on all initial pages
>> =C2=A0=C2=A0=C2=A0 (under SEV, this will encrypt memory)
>>
>> Under xl, it is exposed through the `coco` parameter ("coco =3D 1").
> 
> Wouldn't it make sense to allow specifying the kind of domain
> (SEV, SEV-ES, SEV-SNP, TDX) like KVM does?
> 

Yes, I was thinking of exposing it through in a optional arch-specific 
parameter for specifying some SEV-specific parameters (enable SNP, ...).

And by default rely on what the platform provides with a "best default" 
configuration.
(AFAICT it's not possible to have both SEV (AMD-specific) and TDX 
(Intel-specific), or at least not yet)

> It might not be needed right now, but in future this could be needed
> (e.g. when allowing migration between hosts with different SEV
> features).
> 
> I don't think this is important during RFC phase, but the final
> configuration and hypervisor interfaces of this series should allow
> that.
> 
> 
> Juergen

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



