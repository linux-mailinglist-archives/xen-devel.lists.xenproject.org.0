Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE735A36712
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 21:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889050.1298282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj2ZO-00080r-Fw; Fri, 14 Feb 2025 20:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889050.1298282; Fri, 14 Feb 2025 20:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj2ZO-0007z4-Cw; Fri, 14 Feb 2025 20:45:54 +0000
Received: by outflank-mailman (input) for mailman id 889050;
 Fri, 14 Feb 2025 20:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKzd=VF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tj2ZN-0007yt-2J
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 20:45:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad461fb3-eb14-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 21:45:51 +0100 (CET)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 106D24EF4284;
 Fri, 14 Feb 2025 21:45:47 +0100 (CET)
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
X-Inumbo-ID: ad461fb3-eb14-11ef-9aa4-95dc52dad729
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1739565950;
	b=jrhIFdTrb8OROdkUljbC4mzZB+p1dIIAdVyWeuGEpUKrqWafmCPKXdYEpOpijM+jXsOC
	 I8M8pWgasQxJCmUUwOXO2no+32H93Q7Mnets6LxvHXqbYduPtJIk4t5eZp3/6ol4KD1mL
	 KsY+ATD+w0HtTHO2m9uA8SGAyigIeox+T1Au3vOu6XdHPd9TTcikR6vV45iuBn+0a1Pbz
	 imlCcizuywefi5EMYR04IbzZ+dEKxNYjrDxsxcplOVVh2Y7pOKP8alnKLKtIDWO+BR8iz
	 XxcWrLwc14dF7gcwZgO5NuImiIzjifFMinJx4836fLROyoHx15M5Te5PgfALdxTPWjnJg
	 M7mKFaGD7pIARsBo2nSbA63PVbzu/UZdK7tF3s378RG2kt6/lf/CvcWQClU0sd199hjZv
	 7ejheaTyJwGGE8lZEmZlloru6YpBbV0cjzED6lpYzC1aUlYh+dM91ZpGZ/u5VWqRJVeur
	 +50tQ5QRY2BzaNshQWbqIRr8SP5FTuiZMU4rlIwgINx0bJChJLF75IkONQkWvhk/PyVjw
	 1kUyQwU7vikrePtLSvUi6cKwdzNP1rFq01hhuy/BLOgNtLYzCQRYyD38xP1SKG115I3Jg
	 /AuxrrrJvHB5elB3MPoS/8hJqGae+cWeEBoesQpK59m7e/x9UjYI13KYTI+yRIM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1739565950;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RR2ur59qAi4rrTK+20OpifWfCNW21Lzzq5CgcEMEQVU=;
	b=mGzi+E2Y4ZK0OdAAJjXWS5Deusj5XSPlcn2GreuE5der/eI8v9x+Gf9cs6eJ0rACc4dQ
	 9M0OyCelPaqsxe9R11feCyxuoUYuS7yF+Ih9BApp9q3GFk4tw/c9O0LEb5Ki3lNTfVzDe
	 i1rCdbBciHg/EyO7qlp/NqHj5e/5tnXF/0MQ6IorfplVlIuW9o1YyhQiezuWDHyI6rDiy
	 LPeZ9Kt7Ju7t1BorA/8wHCtQg3QbmoQZJNVTyq1NKoYV94FvNSy4kvsk+bR/T6ppEN0Ln
	 xzhy26aUw4UjabSm7g1rBG6xipwFYkd7mNqntKAzm5PnALQNc/0XxZJmLr8QcIg220FQL
	 83LeOjmWmSNVOIeWoP6L+LcfLNm8Wk8l+oTfhfkJdwECxvuf62WCmi6g3LQAgcTtJrrj6
	 he+IzoAbkJEltqu5O60tG59QvfhFvxNEfoWr4rmY/rR90LDB0GGkWUxiUVsiEMntAVdvB
	 ToG/hSvX8ONi/fqN6MOswDeiwjxPwh7R1bar1OoQUDhgbS6305kUE9MniTe+XdO+JEfys
	 mniuUpEwheUV4xILNqXsYLoqDllRL0z9PCEq4hQZ6NWHRXFODn+7A3NvypxJoLdUb2ic7
	 A51RCuwcNr8sugY1ZyJ5/pKiCA7XbNsHatHiKd2X59v/wlB44O65pgOvh/UFfpc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739565950; bh=VtBYcC5fyxC48ghHqAq3CayDS0tUHRDrB24jrOUym5c=;
	h=From:To:Cc:Subject:Date:From;
	b=VpqVLfiX3AAS2bjdlaHJndVUoMoV1eGu4J7MRQv37q60/kn1EGoOP+oexG8vMeBKb
	 rhF4hoYS1TlneOFZUf/G5oaeiv//KTvf/lHtW3ORXYqFtwqbijHz+N3sV8S0fso6R/
	 i7p+czp9rMxQ20bRKVLnTu37V3L5gRBXg8LCkLGXlACf9QwhWMdkQIG5pnf3a+fKSm
	 Jyk917OnJqdVlEuMahyy0POR7IgXLB0g70xsJjv9BgchuPM8tv/nJv1mWSvSX8MoPj
	 gj928K4cnSbHdzcBAKDdJf0KZFZkyla6rWm40k2XlY0+Qoc7/sUBv3ZhF5RvmhtQAP
	 NAzNNYE0qcprw==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Meng Xu <mengxu@cis.upenn.edu>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 0/3] Move Xen ECLAIR configuration to analyze.yaml
Date: Fri, 14 Feb 2025 21:45:20 +0100
Message-ID: <cover.1739564781.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial configuration for the ECLAIR MISRA C analysis integration into Xen
consisted of two fixed configuration files (one for arm64 and one for x86_64).
This approach shows its downsides as configuration options may change over time.

To address this issues, the configuration can be derived from the architecture's
defconfig and overridden in analyze.yaml via EXTRA_XEN_CONFIG. While doing this,
some inconsistencies that were overlooked in the hand-crafted configuration
files have been resolved following the advice of Stefano Stabellini and
Michal Orzel.

A few regressions on clean guidelines result from such configuration changes,
therefore both patches are prerequisite to the last one to keep avoid pipeline
failures.

Nicola Vetrini (3):
  xen/arm: platform: address violation of MISRA C Rule 7.2
  xen/sched: address violation of MISRA C Rule 8.2
  automation: Update ECLAIR analysis configuration

 automation/eclair_analysis/prepare.sh      |   8 +-
 automation/eclair_analysis/xen_arm_config  | 141 --------------------
 automation/eclair_analysis/xen_x86_config  | 143 ---------------------
 automation/gitlab-ci/analyze.yaml          |  68 ++++++++++
 xen/arch/arm/platforms/brcm-raspberry-pi.c |   6 +-
 xen/common/sched/rt.c                      |   2 +-
 6 files changed, 77 insertions(+), 291 deletions(-)
 delete mode 100644 automation/eclair_analysis/xen_arm_config
 delete mode 100644 automation/eclair_analysis/xen_x86_config

-- 
2.43.0


