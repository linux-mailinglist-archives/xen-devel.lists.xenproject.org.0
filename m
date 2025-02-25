Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E93A439CD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 10:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895561.1304215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmrOd-0007wO-4f; Tue, 25 Feb 2025 09:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895561.1304215; Tue, 25 Feb 2025 09:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmrOd-0007uz-1T; Tue, 25 Feb 2025 09:38:35 +0000
Received: by outflank-mailman (input) for mailman id 895561;
 Tue, 25 Feb 2025 09:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g3GQ=VQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tmrOb-0007uj-9k
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 09:38:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45f38910-f35c-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 10:38:31 +0100 (CET)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id B7B974EEF411;
 Tue, 25 Feb 2025 10:38:27 +0100 (CET)
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
X-Inumbo-ID: 45f38910-f35c-11ef-9897-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1740476310;
	b=MNX72nMYJB/a5qrg1bVbMg5VMsBtT6fxpdPbZpnHHGFWuROz1euWwpct2GnkMSIG2/An
	 cB8bIIdJ5dq/zElfYIcO6Oii3s8+Cnzi+TfxqtNz2GUsjTgpGZBImuLDljp8SMSk8rYIl
	 lJXBzXOKQu3WeleZ9ojoYxuYSHzqGviN8OoWrIuGTO53HMRBjMGLzgKzC9JQEG7Rj6zuo
	 fJlTh4Iw9aBX2ZenXe0rD2rRr4Sxmccyl6AIYkOlnNOV1dyLHyZR6gQ0VNl3UsNPPErBP
	 fbwtJg6znABdKD+GpdhUINWJWnJ1oQALv2UthvVej1W9VmMYrePrWMUavoRZkofjoy3OA
	 BGvBLLRbSx9eacXadAvSjtGpg9/Rail/K7FAcujzidQHTTjuAIU7HlYSh6fTvyhxqQlsL
	 Mca5pQf5DJDgbghccwrgt/Ar9V0nQmUzwMw+bQ2X2mCmwfGhH5SvFmD8E9Nn5UqsOBFIS
	 btID6r+aiP9yVCuP4bJA8Yg++hDB9UIky07eSZ+gXKMc0bkhefRLqb9hXBulV5UK2KsxQ
	 zLhGXRMEzyn1ldvvH27jj22vC0cXaqtBh2qMyV0IctBV+295/RVldUcZ7zb9fsEkpnKdu
	 /MqPc9JEnSvEy79xKFl/jnw4g48mNz6wU+Fuad797Key2MzUVszxzQr6isGk4+0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1740476310;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bwv9Igh6IvS9dUNv3HzJ4ZsEjRvIrHRzib38A3vVekQ=;
	b=h+lgWp0noSUisid1GS0+5HICJgVTf7/5CQpc6rWsXuQ0suMD/27BtzZJC4jQZGJGEz1C
	 pbz+6yv7g5eVWGQCzuQzf9OGtdwn8EsVgtGBk8Y1P6We7PwuPds9aWbcwBG6MQD+Ilt+b
	 Gf7lqA96p/tvuuNP+m9PSQFddMZigyJ8keSNswh+/DGkuqgqKdG9+3LgsiQiHrNAAYrXU
	 47oBeRm2Xtuc8OqFsDBmqvMNjArc7sRHZ7HsOMksKWw5H5/DEbEMvwV+WRWdahieYhhk6
	 g8pqgPUv/2qN7dKB+wEUCLEHe+sVAggwm5fVUSLkPUwQM95u8rFXT7mS6ZgS2nBIaD7l8
	 1OSZ8w9V6cuRtEsOJvOTnZSPabK+T720FmcRFpG3nk8wn6hLDUplajUiIZgU6OmxxCx8G
	 tjOzOGKGusCWd4efcgQzeEUw3TTrFdTiahGQA20ZF9RJnEcSR8aNoF3KG3ozGi+uWa2wZ
	 hYclH/MCOraoqjbKg5ey7wAqutgaD8dqfTN2GLrwn7mbotx7B9D3x4GQ/4Nft91sKE8YJ
	 V2LUJxuuCatoEqbJhI2W2G3dRuIiIwl8kmG9HCZKv9mGPdOnSLFtRV+ifsMlFsOSneeRV
	 66EyIGnOr/nqMx51Ufu5TyVW04Fpzfc7oaJf+UDRy4yMq/Ws1g43wsLfgHMKaZw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1740476310; bh=t7X8K24QXcdj9EsDwdvs0RTvfghSqpanDFxuKMyk+aw=;
	h=From:To:Cc:Subject:Date:From;
	b=PK0byJjsTq1ELC5iVdCrZt1UavhEgJ7M9P1+jgp7Ng3LYi8xCrFsGckZhiwOqT01i
	 9Xie1fyll3hjGqZt13jzi9ZBDELB9kN34bGs7pTBzOD1zUGVzjK+rXJQZXqQJizrV/
	 Ps0tBUzH3LvOnKDbAzXhfRXUXlBrtqLqOwCmgs/KZDN/Fgvu4VnZfHuc/cRwzSOPK8
	 4shtwTUjhpiHhzWRXSsEMKEDQeXRDMRWwl4J4oqak22EQ5VYgy/f22FYTn1XTMUTEi
	 n4wSviJOAH6dFYv57IC/F3mCYU8x/L1mXI6olowL2tsKcR9Q4TgVprXnb5m5467Iju
	 zioqTrCtMKCUQ==
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
Subject: [XEN PATCH v2 0/3] Move Xen ECLAIR configuration to analyze.yaml
Date: Tue, 25 Feb 2025 10:38:21 +0100
Message-ID: <cover.1740476096.git.nicola.vetrini@bugseng.com>
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

---

Changes in v2:
- changed subject prefix and parameter name of patch 2

Nicola Vetrini (3):
  xen/arm: platform: address violation of MISRA C Rule 7.2
  xen/rt: address violation of MISRA C Rule 8.2
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


