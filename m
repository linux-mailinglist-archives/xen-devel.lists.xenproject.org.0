Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6F0A72E47
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 11:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928984.1331623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txkwU-0005L7-Bz; Thu, 27 Mar 2025 10:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928984.1331623; Thu, 27 Mar 2025 10:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txkwU-0005JR-9R; Thu, 27 Mar 2025 10:58:34 +0000
Received: by outflank-mailman (input) for mailman id 928984;
 Thu, 27 Mar 2025 10:58:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAZE=WO=bounce.vates.tech=bounce-md_30504962.67e52f52.v1-52635a0dd82245e7b6b928a6286be143@srs-se1.protection.inumbo.net>)
 id 1txkwT-0005JL-Eh
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 10:58:33 +0000
Received: from mail132-31.atl131.mandrillapp.com
 (mail132-31.atl131.mandrillapp.com [198.2.132.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69327ca3-0afa-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 11:58:27 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-31.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZNgcf3BS9z9K7mVK
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 10:58:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 52635a0dd82245e7b6b928a6286be143; Thu, 27 Mar 2025 10:58:26 +0000
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
X-Inumbo-ID: 69327ca3-0afa-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743073106; x=1743343106;
	bh=3gQDj1sCyJJAp3xr2euRSpfyou6KSLvk5zRRTiv3Tb0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cn4tW4eXpvGL7QXEm0HneavTu6bHvcDZPUxL3RSvthg6LjY/dzyQ9TzSSjRBSW/Jk
	 FKssdijCE6o9ZqEABQ8xxO/p5yYjWyH52Y5CP5PnnMV7xPG3DaQmu2cihYVVIy/Yz3
	 sLgopchHsdZP/JlG/acJRW8G1OQRgoJYLVJqQTOkSTK28in9CaUdd96W3eQv6Ib89t
	 YoLokX6I0TPbwuSROsbRsSJjjrX9rHUvNrepU17CtOdwiYzIIJFHTsKnTdnfqoHK0k
	 dcZDHd+BjA52NZrL81yfaA7be0TRLX7fQpTauxZ9kLXtnM8vuJG8O8lEM8iIYXyLkp
	 0aUNnTukfhtmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743073106; x=1743333606; i=anthony.perard@vates.tech;
	bh=3gQDj1sCyJJAp3xr2euRSpfyou6KSLvk5zRRTiv3Tb0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sgPbFcv7Wj0f+iC2ZRSy6c2IK0iR1a6u2chDBXEx8UxqRzzDsTGCA60RCA5TmtIHf
	 dSGvgQ7V/Bnzwx5df7dDz67010+454Oh/o/JVYh384FjRchnvnQG6XUCiIzcz+2cyQ
	 LnMoeI4WuKjiNWp5oxV9g3Yt82GOt2q2hli2d1pVwffoMcyqoP63rxqYQL3nPc+oEh
	 XS5tTmZGGd68PQa/i8wINLifAMGlzay5KQzHB5dtuD6fcDxOFL9OOdVWtAS0KE1A7z
	 rjHoDUYJejbp4/uQUp6S+P4XWjQgq5bgQ338qYi05rnoF39Oi5lKos9niXgKXsSGWt
	 ZA0nRfgHPaPxA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH]=20automation:=20Avoid=20changing=20source=20files=20for=20randconfig=20tests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743073105572
To: "Stefano Stabellini" <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, "Doug Goldstein" <cardoe@cardoe.com>
Message-Id: <Z-UvUUwUToTr5OgD@l14>
References: <20250326142754.5441-1-anthony.perard@vates.tech> <alpine.DEB.2.22.394.2503261910100.563920@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2503261910100.563920@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.52635a0dd82245e7b6b928a6286be143?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250327:md
Date: Thu, 27 Mar 2025 10:58:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Mar 26, 2025 at 07:10:52PM -0700, Stefano Stabellini wrote:
> On Wed, 26 Mar 2025, Anthony PERARD wrote:
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index 522efe774e..8a3b8fb6b2 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -12,12 +12,12 @@ $cc --version
> >  # random config or default config
> >  if [[ "${RANDCONFIG}" == "y" ]]; then
> >  
> > -    # Append job-specific fixed configuration
> > -    if [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]]; then
> > -        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.config
> > -    fi
> > +    cp -f xen/tools/kconfig/allrandom.config xen/allrandom.config.tmp
> 
> Wouldn't it be better to use mktemp?
> 
> local tmpconfig=$(mktemp)

I though of it and I wasn't sure if we could use it in the CI, but it's
already been used so that's an option. (Actually, there's only a single
use by ./check-endbr.sh, ./configure does use it as well but to create
temporary directory within the build tree.)

But, to avoid overflowing /tmp with loads of leftover temporary files,
we need to clean it, with:

    trap "rm $tmpconfig" EXIT

The advantage of using an in-tree files with a predefined name is that
it isn't going to create more than one file, no matter how many time you
run ./build. The '*.tmp' files are already ignored by our .gitignore. I
could rename it to with a "." to hide it a bit more.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

