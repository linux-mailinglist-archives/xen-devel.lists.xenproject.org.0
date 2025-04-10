Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C5A84010
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 12:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945187.1343435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ooz-0006Ku-Kf; Thu, 10 Apr 2025 10:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945187.1343435; Thu, 10 Apr 2025 10:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ooz-0006IB-Gr; Thu, 10 Apr 2025 10:07:45 +0000
Received: by outflank-mailman (input) for mailman id 945187;
 Thu, 10 Apr 2025 10:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7Nm=W4=bounce.vates.tech=bounce-md_30504962.67f7986c.v1-8db22e515d8b48898e28ae5f29a04cca@srs-se1.protection.inumbo.net>)
 id 1u2oox-0006I5-OG
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 10:07:43 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3690bfd-15f3-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 12:07:42 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZYFqc3c9jz706Llj
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 10:07:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8db22e515d8b48898e28ae5f29a04cca; Thu, 10 Apr 2025 10:07:40 +0000
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
X-Inumbo-ID: a3690bfd-15f3-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744279660; x=1744549660;
	bh=oxhuwaPVjRCoJyQJsC6VWvI5yZFQhXSzzOFspvE/BZ4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AbavUKpUdFI3b89Pe2TAF8L/A8P6sV9v/+AcPT/kTS0uBIvy9Z8H9jmjWDVadnxjT
	 H8/yVREWEQohscAA1Y07rNnbU9WS2axL40gyGsyaEL79djTOwK17qs/WibdelZFyO8
	 ERzhOyl3bITH41ldvGdBT07eyn5fhNzYgFFMd6KexsXl0UImcVTOMtCw+tx+OlIB2f
	 h4axYbnXLhbl3IdPapeyxfVa5J+Yquyri/TefKvb+3GLvtXJ+pbBt78mKS211DOk8S
	 BGlM9hbz73sBCxak0ItINF6/tsmo+U7UmrlXDO4HG8mHNu5CJJW2fIg/LaCcCDdnWs
	 CoCi2nIEC6KSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744279660; x=1744540160; i=anthony.perard@vates.tech;
	bh=oxhuwaPVjRCoJyQJsC6VWvI5yZFQhXSzzOFspvE/BZ4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ss4JEkkaL/G3DheTOcKv3VpeQL4kxPWqeyWG1GjHlRciSZ8EpY9uIBF4t3SKMFBKK
	 NlaBEsRzVySLdIwyu2rR2vZNoGG0X+q8ZL1ob6kMv5fxdhHn0NO6dUFj8NTSR97Z4Q
	 8EAPLTVx4u2xQLWGfTu2IpvXd0XE+W15LpiQdxQ8Q2jjXycp6aq60XJvtRZa8T7t6p
	 XqcYJq3q8WJuMjnMV6oRHBeP5LZKfLlfvFEPy6c+NBeprUpAGYb7S12kglsNh+BUQt
	 2rIy+mHPUd+2ftQGvYrwxGoYh7ohJxb7Oym4yErnKA09ackmGax/C0ogWZGjPMjJ7B
	 pfG9vktdtmNmA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=204/8]=20Clean=20up=20Gitlab=20yaml?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744279659146
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <Z_eYagfQ8vlMYenK@l14>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com> <20250409163702.2037301-5-andrew.cooper3@citrix.com>
In-Reply-To: <20250409163702.2037301-5-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8db22e515d8b48898e28ae5f29a04cca?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250410:md
Date: Thu, 10 Apr 2025 10:07:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Apr 09, 2025 at 05:36:58PM +0100, Andrew Cooper wrote:
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 36ec6a7e1ee5..5a0a853e551d 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,12 +1,19 @@
> +variables:
> +  REGISTRY: registry.gitlab.com/xen-project/hardware/test-artifacts

Did you consider naming that variable XEN_REGISTRY like in the xen.git
repo? REGISTRY is a fine name too.

> +
>  workflow:
> -  name: "xen test artifacts"
> +  name: "Xen test artifacts"

Isn't this a very useless workflow:name? Can I suggest to remove it
instead? I mean, currently, all pipeline appear to do the same thing:

    https://gitlab.com/xen-project/hardware/test-artifacts/-/pipelines

Without "workflow:name" set, the default name will be the subject of the
top commit.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



