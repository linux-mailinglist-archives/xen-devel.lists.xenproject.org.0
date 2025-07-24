Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664CDB109F9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 14:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055885.1424181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueuuY-0002gD-Bh; Thu, 24 Jul 2025 12:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055885.1424181; Thu, 24 Jul 2025 12:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueuuY-0002eM-9B; Thu, 24 Jul 2025 12:18:58 +0000
Received: by outflank-mailman (input) for mailman id 1055885;
 Thu, 24 Jul 2025 12:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iOsz=2F=bounce.vates.tech=bounce-md_30504962.688224ac.v1-d04c2b9036a9448588552b598fd2f390@srs-se1.protection.inumbo.net>)
 id 1ueuuW-0002eG-KG
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 12:18:56 +0000
Received: from mail13.wdc04.mandrillapp.com (mail13.wdc04.mandrillapp.com
 [205.201.139.13]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d30c6c9-6888-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 14:18:54 +0200 (CEST)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail13.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4bnqmY0NktzNCd94F
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 12:18:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d04c2b9036a9448588552b598fd2f390; Thu, 24 Jul 2025 12:18:52 +0000
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
X-Inumbo-ID: 5d30c6c9-6888-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753359533; x=1753629533;
	bh=usDHntagUlobHTYEY7MQcQ986/vdU7P+1y45yGsUh68=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PjixFDDhJODr8UhfP66IO6xLRmSusuS5NNno8jCjAguTvZqgpXL80yfIQtSXM3AAC
	 Po9mU6MQku0aWtyE7G4HW+17IVGGp8QLRd+X6sjP+j0WtzLNol2gujHKgQIabuHJTJ
	 J12poD7UkxMUgovkL0NJ/1a43jqC4chBwE7lPInu/ElxYsNDPulxOmFPq/MwjXNnpF
	 ZTANEr458IyUFYr/hOVZH3XJO69iXxDsgZ4+B33TdteRx4R+G3KaiaIpiwQIql687A
	 QtwpLbt/gOx4lrZSPJAdILFT9+IaBpW8WR90H9Li6y4/VLWlgTfdKh0Q4vQF+Ycw3J
	 kcEUxU5D01KaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753359533; x=1753620033; i=anthony.perard@vates.tech;
	bh=usDHntagUlobHTYEY7MQcQ986/vdU7P+1y45yGsUh68=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SMLCNjDlGfV7u7ORhXSwcJbdQy9XEkDELtCjt97JKo9TcGev0ddG23xeWIwW5vZPq
	 0XN4yNWgtEeXYi50PnYyGos0oNCFKxtnC+VOI+O0lAB4BEkGqP7PkjTXXoGHv5225U
	 21iFLVxmTBUMrfQYGHLV1tKFfZMboiOJwMcKG8IyKVptEfdwNPvhMg5Q3GF3MP9olB
	 55/OAkNSjEVuI255hzOLLKFZccVOEOj3Yoiport/Z53yQ2dbQS+D/PvHUUZRLxuYSf
	 B5+LEkBL3NDtjJxUDrdvZBv/yJi0oLkdkIRN8I1ItzuPYK1nNX2j4gHfjUVSMKFxtc
	 qPExNBsxz7yZw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/x86:=20fix=20xen.efi=20boot=20crash=20from=20some=20bootloaders?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753359531244
To: "Yann Sionneau" <yann.sionneau@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <aIIkqp-0Impxf8oV@l14>
References: <20250723135620.1327914-1-yann.sionneau@vates.tech>
In-Reply-To: <20250723135620.1327914-1-yann.sionneau@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d04c2b9036a9448588552b598fd2f390?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250724:md
Date: Thu, 24 Jul 2025 12:18:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Jul 23, 2025 at 01:56:33PM +0000, Yann Sionneau wrote:
> diff --git a/xen/Makefile b/xen/Makefile
> index 8fc4e042ff..7dc9cd7e05 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -299,10 +299,13 @@ export XEN_HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xe
>  # ===========================================================================
>  # Rules shared between *config targets and build targets
>  
> -PHONY += tools_fixdep
> +PHONY += tools_fixdep tools_keeprelocs
>  tools_fixdep:
>  	$(Q)$(MAKE) $(build)=tools tools/fixdep
>  
> +tools_keeprelocs:
> +	$(Q)$(MAKE) $(build)=tools tools/keeprelocs

You don't need this new rule, and nothing calls it. `tools_fixdep` is
special as it is used by the build system and very early one.

There's the command `$(Q)$(MAKE) $(build)=tools` which will build
this new binary for you, it is the first call in the rule `$(TARGET)`.
So beside editing xen/tools/Makefile, there's nothing else to do to have
a build of this new binary.

> diff --git a/xen/tools/Makefile b/xen/tools/Makefile
> index a5078b7cb8..4fd917b398 100644
> --- a/xen/tools/Makefile
> +++ b/xen/tools/Makefile
> @@ -1,2 +1,5 @@
>  hostprogs-always-y += symbols
>  hostprogs-always-y += fixdep
> +hostprogs-always-$(XEN_BUILD_PE) += keeprelocs
> +# next line is to allow including include/efi/pe.h
> +HOSTCFLAGS_keeprelocs.o := -I ../include

`../include` doesn't exist, and `..` might not exist or might be outside
the build directory.

In the directory "xen/" (and the subdirectories) all the commands are
executed from "xen/". Also, "xen/" directory can be built out-of-tree.
In both case, `..` isn't the directory you are looking for.

You can try out-of-tree build with:
    make -C xen O=path/to/build-tree
Or:
    cd path/to/build-tree; make -f path/to/xen.git/xen/Makefile

Anyway, for the build to work, you want:

    HOSTCFLAGS_keeprelocs.o := -I $(srctree)/include

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



