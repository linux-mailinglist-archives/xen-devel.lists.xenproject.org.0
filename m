Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C20A7E54E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 17:56:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940504.1340266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1opc-0007pT-BB; Mon, 07 Apr 2025 15:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940504.1340266; Mon, 07 Apr 2025 15:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1opc-0007mL-8R; Mon, 07 Apr 2025 15:56:16 +0000
Received: by outflank-mailman (input) for mailman id 940504;
 Mon, 07 Apr 2025 15:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mo/T=WZ=bounce.vates.tech=bounce-md_30504962.67f3f59c.v1-fd9f5402892347e080e8a59181d55167@srs-se1.protection.inumbo.net>)
 id 1u1opb-0007QG-Nk
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 15:56:15 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4b034cc-13c8-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 17:56:13 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZWYj83xkQz705bBT
 for <xen-devel@lists.xenproject.org>; Mon,  7 Apr 2025 15:56:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fd9f5402892347e080e8a59181d55167; Mon, 07 Apr 2025 15:56:12 +0000
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
X-Inumbo-ID: d4b034cc-13c8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744041372; x=1744311372;
	bh=AqHO8CubgcMI4+lkckINiadf7K6tDz1pcGskRQXLth0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OBaWRAk8ChiTtnvR1PelUWdIhu5JpTv+XOQSp6BRiYZ7hRD3kBub00xaGFmaBzxMy
	 cWn0TXw2xiq1P1RBRTA+OPr4QREqqeYhq+5D/hH2alCLBSa4NbXW6LQA2T7eKlGm7x
	 QvrTdmfChzWqwEiWcbnT9Gl/8TBIehf6+JaExDgp39BWyT03jYpqof4lX/k9RFicXp
	 3btxtL5uQBDjtVgQMYc8jSeQCUuDxeXDZPz+yYZ4lGYM1+E/DBK4J1FlYXR9ZePSLX
	 WLvNY4+0+WemmkzzH8xnOi7hhq2idY2sI+VuaD35BepK7ByGpOqS1cJj605tmpLLn4
	 /QYV8JiWeZ2fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744041372; x=1744301872; i=anthony.perard@vates.tech;
	bh=AqHO8CubgcMI4+lkckINiadf7K6tDz1pcGskRQXLth0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rxCmeFEFwlA6UzcRyTsCOuruRNRRv157hIftuH3cP85D6AK1qF0PcvBH6l5uxutEd
	 FdXh5P3nKgokm212aVl+QZEVeeYK2l4h30+g3Q7JB49MZV4h+cZsiOUZ5dopmdXR6i
	 oFaz4E8JxHrsukYNfl6ooH+iZC3k7sEjQ+tcQ5JT8wB2fDkiqskkuZwf3ZG8unbkuE
	 Hk9F6XbdYBY/hyKgi/VQj+Zrts9J0EXuFp9IpPhDxIhARwip7Gbiqqy3eRPcjGekzU
	 erG0/ypuLW0qTo4o6TqbdUEP2MXF9kH1aqdFtKPBsimXLiVNziGG58bZwp0IrCkLsb
	 rnVzdOAzcngLQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v9=201/3]=20docs:=20update=20xenstore=20migration=20stream=20definition?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744041371245
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <Z_P1muoVrI8bveEz@l14>
References: <20250314121835.1879-1-jgross@suse.com> <20250314121835.1879-2-jgross@suse.com> <85aa1047-b045-4004-9306-b40e8c5fa6d9@suse.com> <fcfe6ea3-6951-4892-accb-13dac0268068@suse.com>
In-Reply-To: <fcfe6ea3-6951-4892-accb-13dac0268068@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fd9f5402892347e080e8a59181d55167?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250407:md
Date: Mon, 07 Apr 2025 15:56:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Apr 03, 2025 at 01:45:32PM +0200, Juergen Gross wrote:
> On 25.03.25 10:17, Juergen Gross wrote:
> > On 14.03.25 13:18, Juergen Gross wrote:
> > > In order to close a race window for Xenstore live update when using
> > > the new unique_id of domains, the migration stream needs to contain
> > > this unique_id for each domain known by Xenstore.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > This patch is still missing an Ack.
> 
> PING?

Julien's concern looked to be addressed. And the patch looks fine to me,
so:

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



