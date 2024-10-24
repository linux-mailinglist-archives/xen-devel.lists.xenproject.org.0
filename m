Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A729AE431
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 13:52:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825181.1239389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3wN8-0000sF-Th; Thu, 24 Oct 2024 11:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825181.1239389; Thu, 24 Oct 2024 11:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3wN8-0000ql-Qt; Thu, 24 Oct 2024 11:51:22 +0000
Received: by outflank-mailman (input) for mailman id 825181;
 Thu, 24 Oct 2024 11:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aCB4=RU=bounce.vates.tech=bounce-md_30504962.671a34b5.v1-c128b213f31e4ca293d34ba5c95fea13@srs-se1.protection.inumbo.net>)
 id 1t3wN7-0000qf-77
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 11:51:21 +0000
Received: from mail145-12.atl61.mandrillapp.com
 (mail145-12.atl61.mandrillapp.com [198.2.145.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4780bc80-91fe-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 13:51:18 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-12.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4XZ44j205fz5QkVf4
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 11:51:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c128b213f31e4ca293d34ba5c95fea13; Thu, 24 Oct 2024 11:51:17 +0000
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
X-Inumbo-ID: 4780bc80-91fe-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1729770677; x=1730031177;
	bh=z9qElPwe4uoWv7PM3kvrnkibV09fOfsmAffGehTewU0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RyQVMCOuwJsQqYPWv0lFD6oRd7bjoLYdYs9waagSnjad9p16eK1bENGZWowX4GxBj
	 pNZSIlalBwHRg/4uIzcRp+UUS73ILz+Y6gobq4B9li4mofmUripXMCjcYTOAQWYlPO
	 sVBjPBI0j5bxI41m0jfxJo1TAmA1x2bdC3IsHolh77WBxqRnbDBr6HYTMEyVMSb4D9
	 pV3dzOqESLWKAWXFVWxJwqok+9Moq9mt2kdYvCKhtHriv+/8A+VnkxUmeuRj61AV2v
	 ++TJSacKB2tWQzfzsKohUyw5CcYwIlzAYUue5XP+evzaeX2y2LiicgTaFAV8Di/r12
	 BXNewcu47LubQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1729770677; x=1730031177; i=anthony.perard@vates.tech;
	bh=z9qElPwe4uoWv7PM3kvrnkibV09fOfsmAffGehTewU0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hzQYIfuwOU9WFH7EFAPUZy2oJR5ey2OEM99+xcGJ4l561+VXkZIk3AKDQDFWXkQOo
	 ilkdLMYdCfDAY1aAW2gDmwG9pkdvKC4g0WO0S9WbpgJSfltgskAzpY67BiUfeJLHWh
	 CvosF8rEwuBayCMKKA+DeKs+NXYu2NAvg3m/G7l1KkB19YlfKua6LBFu6E/k52Det6
	 h5jvPp1c6OWqBdk5xjqiF0QHMx7HGEXQBDEg28lVeeYyMbCKSNggPWH/Tq8NnSXLfQ
	 JFeFkFcGv0WRQZ12LPD0Tc3RxxkGrVWQutF5K1mXkUhT1pJ7ESb6nmbcM9PkS6dwSL
	 WcPfm6QQXgyTA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v1=204/6]=20CI:=20Refresh=20the=20Debian=2012=20arm32=20cross=20compile=20container?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1729770675886
To: "Javi Merino" <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <Zxo0s72TBQtuWTXS@l14>
References: <cover.1729760501.git.javi.merino@cloud.com> <762312efd58aa1b41cfcb5439f2fd35580b8bba6.1729760501.git.javi.merino@cloud.com>
In-Reply-To: <762312efd58aa1b41cfcb5439f2fd35580b8bba6.1729760501.git.javi.merino@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c128b213f31e4ca293d34ba5c95fea13?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241024:md
Date: Thu, 24 Oct 2024 11:51:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Oct 24, 2024 at 11:04:19AM +0100, Javi Merino wrote:
> diff --git a/automation/build/debian/12-arm64v8-arm32-gcc.dockerfile b/automation/build/debian/12-arm64v8-arm32-gcc.dockerfile
> new file mode 100644
> index 000000000000..bdc935706bfa
> --- /dev/null
> +++ b/automation/build/debian/12-arm64v8-arm32-gcc.dockerfile
> @@ -0,0 +1,28 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/arm64/v8 debian:bookworm
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"

Recent update of other dockerfile was repeating the "LABEL" intruction
for each label, maybe we should continue to do that (which avoid the
backslash at the end of lines).

> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV CROSS_COMPILE /usr/bin/arm-linux-gnueabihf-

While the syntax "ENV VAR value" is supported, it's been discouraged by
docker's doc (https://docs.docker.com/reference/dockerfile/#env). Also,
here we have two ENV instructions with two different syntax, could you
use the = for declaring CROSS_COMPILE as well?

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

