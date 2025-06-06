Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5DCAD0355
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 15:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008580.1387852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNXGh-0005Tw-MI; Fri, 06 Jun 2025 13:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008580.1387852; Fri, 06 Jun 2025 13:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNXGh-0005Rt-Iz; Fri, 06 Jun 2025 13:37:59 +0000
Received: by outflank-mailman (input) for mailman id 1008580;
 Fri, 06 Jun 2025 13:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fdJq=YV=bounce.vates.tech=bounce-md_30504962.6842ef32.v1-4168c5e9f2574c5d8e300645e2c4cfbb@srs-se1.protection.inumbo.net>)
 id 1uNXGf-0005Rn-AC
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 13:37:57 +0000
Received: from mail36.us4.mandrillapp.com (mail36.us4.mandrillapp.com
 [205.201.136.36]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 736fb3ea-42db-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 15:37:55 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail36.us4.mandrillapp.com (Mailchimp) with ESMTP id 4bDMnt3fJzzS62JQf
 for <xen-devel@lists.xenproject.org>; Fri,  6 Jun 2025 13:37:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4168c5e9f2574c5d8e300645e2c4cfbb; Fri, 06 Jun 2025 13:37:54 +0000
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
X-Inumbo-ID: 736fb3ea-42db-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749217074; x=1749487074;
	bh=FVH3r1YoO0xTmK+f/mZlpEPpzXh0CkRhWDBPMn7fC+k=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ylC+Q38s9Q8Gc3eNpa4h1koVjN1c/rBgBewd2EJxKZm8ghKasGXzJynJZywb+BlUt
	 cNyT0ar8c3iExxtBPJNecUFfto90IiWOKD+y1BL9h6GC//yzdmSRmbFNnWezeQIK4v
	 YDn+7IJtlJB9zs27aSe6xt1HtkZt05N685YlRT1NC217e1cnIhVlBZKnzWQszMIkMf
	 nnsvIlBX2bLZZxVZ52dqM7qdBokCedMn08yhUIBDBvD1tiEosik9GzskZWXkcUaQlH
	 DgT7q41MKy+do5VRcSHilvTDj/hEarIKox4O9pWhsPvMqC2eb05cx0YVjrqz/nftzk
	 muHJLF1pnupfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749217074; x=1749477574; i=ngoc-tu.dinh@vates.tech;
	bh=FVH3r1YoO0xTmK+f/mZlpEPpzXh0CkRhWDBPMn7fC+k=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gP+EmS43DaKryPOr69N23kYl14w6P91D6PeidIrFcPFTFaJMliXOcCXhEFSMhVKBn
	 cxod87EhaQVN3kEfe/x0LNv038tXfPP2EJrTF/oBRQytja+Ne71J2GLwKdUnE3MCPD
	 NYaCRYT2cpMNdXjslx/pxleET5mYbxuSeFO7SQIxK7M0DdCQeGjO/3RGJz5r/CH6wM
	 vNpmi9W3FUpdp+BXw057G3drjRTj6XteB8Fl+Hv2Fg/iALlLSEN2EBzV//uOlXafTF
	 PrkX1u/hBiuIZOkiUvgkowdkJ7Gnou3ZkyTQswgC1VZs27FYMIcQWzh2iMuSm0Od8P
	 S2PVP/wBtRRGg==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20x86/hvmloader:=20select=20xenpci=20MMIO=20BAR=20UC=20or=20WB=20MTRR=20cache=20attribute?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749217073208
Message-Id: <5e6b51ba-1550-4896-bbc9-eb5076ce057c@vates.tech>
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
References: <20250605161659.18201-1-roger.pau@citrix.com> <1b290503-078e-491a-8552-b884df7ac747@vates.tech> <aELru4IZmqHilNiN@macbook.local>
In-Reply-To: <aELru4IZmqHilNiN@macbook.local>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4168c5e9f2574c5d8e300645e2c4cfbb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250606:md
Date: Fri, 06 Jun 2025 13:37:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/06/2025 15:23, Roger Pau Monn=C3=A9 wrote:
[...]
>>
>> Since this is meant to be a workaround, I wonder if it makes more sense
>> to flip the setting (`xenpci_bar_wb`) and make it 0 by default?
> 
> I originally didn't want to go that route, because while it's true
> that the default MTRR type is set to WB, and so any memory not covered
> by a MTRR range will default to that memory type I got the impression
> this was inferring too much.
> 
> Overall my intention would be for inverting the default long term, and
> libxl setting build_info->u.hvm.xenpci_bar_uc =3D false by default,
> which then makes all the naming nicer IMO.
> 
>> It also
>> simplifies the logic for both hvmloader and the consumer (no need for
>> double negatives).
> 
> I don't think there are double negatives?  That would happen if the
> variable was named xenpci_bar_no_uc or similar?

It's because from the flag consumer's viewpoint, I saw the flag 
`xenpci_bar_uc` as rather "xenpci_bar_dont_apply_wb_workaround`. But if 
the intention is to eventually make it default then the naming is OK for me=
.

> 
> Thanks, Roger.




Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



