Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CDCA74C95
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 15:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930881.1333425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyAgK-0000qb-Oz; Fri, 28 Mar 2025 14:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930881.1333425; Fri, 28 Mar 2025 14:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyAgK-0000p9-MF; Fri, 28 Mar 2025 14:27:36 +0000
Received: by outflank-mailman (input) for mailman id 930881;
 Fri, 28 Mar 2025 14:27:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfnS=WP=bounce.vates.tech=bounce-md_30504962.67e6b1d0.v1-d902b0c4cf5844078eb87f06799a5d42@srs-se1.protection.inumbo.net>)
 id 1tyAgJ-0000p3-Pb
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 14:27:35 +0000
Received: from mail187-9.suw11.mandrillapp.com
 (mail187-9.suw11.mandrillapp.com [198.2.187.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c73b7d8e-0be0-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 15:27:29 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-9.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4ZPNCN3H7kzK5vrTt
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 14:27:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d902b0c4cf5844078eb87f06799a5d42; Fri, 28 Mar 2025 14:27:28 +0000
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
X-Inumbo-ID: c73b7d8e-0be0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743172048; x=1743442048;
	bh=nwKb9IL2p+QEqONSzJBVRNty/v7J3My/fqCel/dHTM4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YVzg3v6zp7AYvT771WJt+E6pTp4SPT5CjFPhzLZ0IyaqZbMr43ZaVHiD1WfMdbUT9
	 H2mf12Yaxkp7lexZV5Dqpa93zZNo1QtU0Z8k6ZAxBMuOeWwsfOo5q7plV16yHdwIkA
	 P2Z08n9vHcicqzV+hVicA5tr9xhnJI276OC56dyZNknGQrycttJBw5BDOQLAIkVmPd
	 OSi+lZy2x4du5X7jQOGPvlCcnA4YSAAdjWeM1Ry2VbSTMLp6if0HBgFAyCVWCt0IBh
	 f/NFy5LzdSMw6F5R+CJyJz3X9mQ/IGklDbKElPMNQXEmTwCGcaAYC/G5o5LNffuhR8
	 1clHP1VUJkBCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743172048; x=1743432548; i=anthony.perard@vates.tech;
	bh=nwKb9IL2p+QEqONSzJBVRNty/v7J3My/fqCel/dHTM4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0CePi4eSfnmuuHxW8EivavSVXmuAFSSSmR0ndBAZwjNMy+G88kNnsmysvp5/v3GXo
	 X96LllQje+M3FX4EoiKPRehdXIRgdCTQE2SDN50lxysdnC+q/UdR6HP4ik9iDEpoPV
	 As1TM1B0Iy5j+mvbLYgUl38/g6aAWoJ3hYqHGdQ0mmyvpX81cK06dFkvvp73puc4d1
	 m5Pdn6dcPLaLfAeq1prWb4YqzC7pTLkK+Kp2GhWlUsC8VADAhusu5oxWWh+1agamf6
	 uzUolSpSzre8bzbvZ8Cdz9BVH8+g7XhqbxfcP0n4t+YyY8orhVSYa5zXebvYLxfzLO
	 AjMtuaW25EsfQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=203/3]=20xen:=20debug:=20gcov:=20add=20condition=20coverage=20support?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743172046805
To: "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <Z-axzjh97dz021-T@l14>
References: <20250328121902.2134020-1-volodymyr_babchuk@epam.com> <20250328121902.2134020-4-volodymyr_babchuk@epam.com>
In-Reply-To: <20250328121902.2134020-4-volodymyr_babchuk@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d902b0c4cf5844078eb87f06799a5d42?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250328:md
Date: Fri, 28 Mar 2025 14:27:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 28, 2025 at 12:19:18PM +0000, Volodymyr Babchuk wrote:
> Condition coverage, also known as MC/DC (modified condition/decision
> coverage) is a coverage metric that tracks separate outcomes in
> boolean expressions.
> 
> This patch adds CONFIG_CONDITION_COVERAGE option to enable MC/DC for
> GCC. Clang is not supported right now.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> Changes in v2:
>  - Move gcc version check from .c file to Rules.mk (I can't find
>    an easy way to check GCC version at Kconfig level)

It's very easy to do so, our Kconfig already look for GCC's version ;-)
The result isn't used yet in Kconfig, but it is in some C files and
Makefile.

You can simply do:
    depends on GCC_VERSION > 140000
(instead of checking for CC_IS_CLANG, because GCC_VERSION would be 0
when clang is used)

But, do you really need to check for gcc's version? Is
-fcondition-coverage mean something different in previous version?
Cann't you actually just check if a feature is present in the CC been
used? It is rare to check for a particular version of a compiler and
instead check if it knows about a flags.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

