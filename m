Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B534A7A45A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 15:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936834.1337982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Ky4-00057V-I6; Thu, 03 Apr 2025 13:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936834.1337982; Thu, 03 Apr 2025 13:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Ky4-00055P-FA; Thu, 03 Apr 2025 13:50:52 +0000
Received: by outflank-mailman (input) for mailman id 936834;
 Thu, 03 Apr 2025 13:50:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=veT/=WV=bounce.vates.tech=bounce-md_30504962.67ee922c.v1-f726adaef1844703bcd15d87ca759d97@srs-se1.protection.inumbo.net>)
 id 1u0Ky2-00050L-Up
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 13:50:51 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f57a323-1092-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 15:50:38 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZT3644XCWzS62QKQ
 for <xen-devel@lists.xenproject.org>; Thu,  3 Apr 2025 13:50:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f726adaef1844703bcd15d87ca759d97; Thu, 03 Apr 2025 13:50:36 +0000
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
X-Inumbo-ID: 9f57a323-1092-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743688236; x=1743958236;
	bh=v8m0m53wPhMYCjDNngI1b33QpaUIzevS7ajRoSVZcEg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tlccBWJpBnvFY3UiqC6Cou8EUwh1it7HFb3en8xQYFgXuEktjXHXTxRfszmQw0mZp
	 ri8hZBULwy6+1+hgFnUoHgtOXjtl3H0VmHiMVemh014kNPpk/j+GZr2aJABcIB3f8T
	 RqQiiIu9A58O6PPhjydNk7AgolDDSNulHy8XV7ICZKsD3MkDUletmNCPwYy3BBm5/n
	 u5Pp2i8GVIDD5CIUdd/PDoo4H+WCeQGNqpKfPefcv2E87il0J9aHOCvgjbg/GNIEBo
	 k/cPL2+wSRbo8K4DAgQDClYNuvXLy41bNSf9Sw6f9Mg+oyeyR7537MuFDAivj2uy9O
	 oevmA28D11FZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743688236; x=1743948736; i=anthony.perard@vates.tech;
	bh=v8m0m53wPhMYCjDNngI1b33QpaUIzevS7ajRoSVZcEg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qLR2RWZGseN23SRUWwKrdM7wWV1ue9WfFwFnQgjv3lHyE8au/j/Y7ULCjA0b+YpgP
	 LGxHWlDDyQlkOcuAvhhMQCx5RXdlkIMD76ielgp9Pj30QNahTw+AOyV3IFIoERTLaA
	 T0/eRe5sczw03yAe/3PYiOakcOpd9vUeQqPl2fPOH+uw5X0P3DwEwkOV7/4pwswpFi
	 G26LQ01ka6CN+2F28X08soBOpih7mCqKrZgkTdI6QDE2GK6HbBsnAN7DhudMkLy99f
	 BIUpwYV5xTzcGxbP7Shkko6IYuRLbwQ2MD7vKIDNlC3Jj4WQS6PoD0KF9pJTFM+t8s
	 wucJZX1Bnd10A==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20automation:=20Add=20Arm64=20MPU=20build=20job?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743688235027
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Orzel, Michal" <michal.orzel@amd.com>, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Luca Fancellu" <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <Z-6SKIEk3wjheg1j@l14>
References: <20250403081916.6834-1-michal.orzel@amd.com> <20ac780b-f5ac-4531-997e-362d72adddd2@suse.com> <2a8ab261-480f-4bfe-b2b7-7fdff4516078@amd.com> <a67d260e-fe1a-44bb-8b49-fa0509716da2@suse.com> <44500161-1346-4c9e-bcb3-a4301c197913@amd.com> <235cb577-b28f-49ab-b0a3-94ab35572d83@suse.com> <65d12272-0ceb-4570-bade-5a0901264e16@amd.com> <921c6250-9485-4d66-a568-15045ecc17bb@suse.com>
In-Reply-To: <921c6250-9485-4d66-a568-15045ecc17bb@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f726adaef1844703bcd15d87ca759d97?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250403:md
Date: Thu, 03 Apr 2025 13:50:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Apr 03, 2025 at 12:00:39PM +0200, Jan Beulich wrote:
> On 03.04.2025 11:35, Orzel, Michal wrote:
> > A different question (also to other people who knows this stuff).
> > MPU requires to specify Xen start address using CONFIG_XEN_START_ADDRESS that is
> > set to invalid default value to catch user attention. Provided that randconfig
> > can select UNSUPPORTED and MPU, we should somehow set CONFIG_XEN_START_ADDRESS
> > to e.g. 0 to be able to build successfully. Is this where we need to add
> > EXTRA_FIXED_RANDCONFIG to existing arm64 and arm32 randconfig jobs?
> 
> In principle some override like this will be needed, I think, yet that undermines
> the randomness of the build. From what I can tell the sole constraint on
> XEN_START_ADDRESS is that it needs to be page aligned (for whatever reason; I
> didn't think there was the concept of "pages" without an MMU [1]). Arbitrary
> values satisfying this constraint ought to be selectable by random configurations.
> Which would then - hopefully - also trigger the case where XEN_START_ADDRESS is
> e.g. so large that Xen can't fit in the remaining address space anymore. Plus
> perhaps any other constraints presently not enforced.
> 
> How to deal with all of this, i.e. how to leave as much flexibility as possible
> to randconfig, I simply don't know. Extending the Cc list in the hope for someone
> to provide some insight.

It doesn't looks like kconfig have support for randomizing hex values.
So you'll have to provide a value for XEN_START_ADDRESS that actually
respect the contrain written in prose, since the default doesn't.

Ah, the prompt of that config value is way to long and contain
explanation that ought to be in the help message instead. So I guess the
default value is the choose default value option, so probably fine for
randconfig.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

